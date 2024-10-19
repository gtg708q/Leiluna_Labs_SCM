import os
import sys
import json
from dotenv import load_dotenv
from sqlalchemy.orm import sessionmaker
from sqlalchemy import and_, Integer, Float, Boolean, Date
import time
from datetime import datetime, timedelta
import requests
from requests.exceptions import ReadTimeout, ConnectionError
import logging

# Add the parent directory to sys.path
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from app.database import engine, get_db
from app.models.sales_per_day_per_product import SalesPerDayPerProduct
from app.get_sales_per_day_headers import get_oauth_session

# Load environment variables
load_dotenv()

SELLERLEGEND_BASE_URL = "https://app.sellerlegend.com"

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

# Disable debug logging for requests_oauthlib
logging.getLogger('requests_oauthlib').setLevel(logging.WARNING)
logging.getLogger('urllib3').setLevel(logging.WARNING)

def get_all_accounts():
    with open(os.path.join(os.path.dirname(__file__), 'sellerlegend_accounts.json'), 'r') as f:
        accounts_data = json.load(f)
    return accounts_data['accounts']

def get_sales_per_day_data(oauth, account, start_date, end_date, page=1, max_retries=3, retry_delay=5):
    url = f"{SELLERLEGEND_BASE_URL}/api/sales/per-day-per-product"
    params = {
        "seller_id": account['seller_id'],
        "marketplace_id": account['marketplace'],
        "start_date": start_date.strftime('%Y-%m-%d'),
        "end_date": end_date.strftime('%Y-%m-%d'),
        "per_page": 1000,
        "page": page
    }

    for attempt in range(max_retries):
        try:
            logger.info(f"Requesting data from SellerLegend API (attempt {attempt + 1})")
            response = oauth.get(url, params=params, timeout=30)
            logger.info(f"API response status code: {response.status_code}")
            
            if response.status_code == 200:
                try:
                    json_content = response.text[response.text.find('{'):]
                    return json.loads(json_content)
                except json.JSONDecodeError:
                    logger.error("Failed to decode JSON response")
                    return None
            else:
                logger.error(f"Error: {response.status_code}")
                return None
        except (ReadTimeout, ConnectionError) as e:
            logger.warning(f"Attempt {attempt + 1} failed: {str(e)}")
            if attempt < max_retries - 1:
                logger.info(f"Retrying in {retry_delay} seconds...")
                time.sleep(retry_delay)
            else:
                logger.error("Max retries reached. Giving up.")
                return None

def safe_convert(value, convert_func):
    if value in ['', 'null', None]:
        return None
    if isinstance(value, (int, float)):
        return convert_func(value)
    try:
        if convert_func == bool:
            return value.lower() in ('true', '1', 'yes')
        return convert_func(value.replace(',', '').replace('%', ''))
    except (ValueError, AttributeError):
        logger.warning(f"Could not convert value '{value}' to {convert_func.__name__}")
        return None

def import_data(session, data):
    new_records = 0
    updated_records = 0

    for item in data['data']:
        try:
            existing_row = session.query(SalesPerDayPerProduct).filter(
                and_(
                    SalesPerDayPerProduct.date == datetime.strptime(item['Date'], '%Y-%m-%d').date(),
                    SalesPerDayPerProduct.account_title == item['Account Title'],
                    SalesPerDayPerProduct.sku == item['SKU'],
                    SalesPerDayPerProduct.asin == item['ASIN']
                )
            ).first()

            processed_item = {}

            for key, value in item.items():
                field_name = key.lower().replace(' ', '_').replace('%', 'percentage').replace('/', '_')
                if field_name == 'date':
                    processed_item[field_name] = datetime.strptime(value, '%Y-%m-%d').date()
                elif field_name in SalesPerDayPerProduct.__table__.columns:
                    column_type = SalesPerDayPerProduct.__table__.columns[field_name].type
                    if isinstance(column_type, Integer):
                        processed_item[field_name] = safe_convert(value, int)
                    elif isinstance(column_type, Float):
                        processed_item[field_name] = safe_convert(value, float)
                    elif isinstance(column_type, Boolean):
                        processed_item[field_name] = safe_convert(value, bool)
                    elif isinstance(column_type, Date):
                        processed_item[field_name] = datetime.strptime(value, '%Y-%m-%d').date()
                    else:
                        processed_item[field_name] = value

            if existing_row:
                for key, value in processed_item.items():
                    setattr(existing_row, key, value)
                updated_records += 1
            else:
                new_row = SalesPerDayPerProduct(**processed_item)
                session.add(new_row)
                new_records += 1

        except Exception as e:
            logger.error(f"Error processing item: {item.get('SKU', 'Unknown SKU')}")
            logger.error(f"Error details: {str(e)}")

    try:
        session.commit()
    except Exception as e:
        logger.error(f"Error committing to database: {str(e)}")
        session.rollback()

    return new_records, updated_records

def main():
    start_time = time.time()
    logger.info("Starting Sales Per Day Per Product import")
    
    Session = sessionmaker(bind=engine)
    session = Session()

    oauth = get_oauth_session()
    accounts = get_all_accounts()

    if not accounts:
        logger.error("No accounts found.")
        return {"error": "No accounts found."}

    end_date = datetime.now().date()
    start_date = end_date - timedelta(days=30)

    logger.info(f"Today's date: {end_date}")
    logger.info(f"Importing data for the last 30 days: {start_date} to {end_date}")

    total_new_records = 0
    total_updated_records = 0
    account_results = []

    for account in accounts:
        logger.info(f"Processing account: {account['account_title']}")
        
        account_new_records = 0
        account_updated_records = 0
        page = 1
        while True:
            logger.info(f"Fetching page {page}")
            data = get_sales_per_day_data(oauth, account, start_date, end_date, page)

            if data and isinstance(data, dict) and 'data' in data and isinstance(data['data'], list):
                if len(data['data']) == 0:
                    logger.info("No more data to fetch for this account.")
                    break

                new_records, updated_records = import_data(session, data)
                account_new_records += new_records
                account_updated_records += updated_records

                logger.info(f"Page {page} import completed. New records: {new_records}, Updated records: {updated_records}")

                if data.get('current_page') == data.get('last_page'):
                    logger.info("Reached the last page for this account.")
                    break

                page += 1
            else:
                logger.error("Unexpected data structure or no data received.")
                break

        total_new_records += account_new_records
        total_updated_records += account_updated_records
        account_results.append({
            "account": account['account_title'],
            "new_records": account_new_records,
            "updated_records": account_updated_records
        })

    end_time = time.time()
    duration = end_time - start_time

    logger.info("Data import completed successfully.")
    logger.info(f"Total new records: {total_new_records}")
    logger.info(f"Total updated records: {total_updated_records}")
    logger.info(f"Total time taken: {duration:.2f} seconds")

    session.close()

    return {
        "total_new_records": total_new_records,
        "total_updated_records": total_updated_records,
        "duration": f"{duration:.2f} seconds",
        "account_results": account_results
    }

if __name__ == "__main__":
    main()
