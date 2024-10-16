
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

# Add the parent directory to sys.path
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from app.database import engine, get_db
from app.models.sales_statistics import SalesStatistics
from app.get_sales_statistics_headers import get_oauth_session
import logging

# Load environment variables
load_dotenv()

SELLERLEGEND_BASE_URL = "https://app.sellerlegend.com"

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

def get_all_accounts():
    with open(os.path.join(os.path.dirname(__file__), 'sellerlegend_accounts.json'), 'r') as f:
        accounts_data = json.load(f)
    return accounts_data['accounts']

def get_sales_statistics_data(oauth, account, date, page=1, max_retries=3, retry_delay=5):
    url = f"{SELLERLEGEND_BASE_URL}/api/sales/statistics-dashboard"
    params = {
        "seller_id": account['seller_id'],
        "marketplace_id": account['marketplace'],
        "view_by": "product",
        "group_by": "Product",
        "start_date": date.strftime('%Y-%m-%d'),
        "end_date": date.strftime('%Y-%m-%d'),
        "per_page": 1000,  # Changed from 500 to 1000
        "page": page
    }

    for attempt in range(max_retries):
        try:
            response = oauth.get(url, params=params, timeout=30)  # Set a 30-second timeout
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

def import_data(session, data, date, account):
    new_records = 0
    updated_records = 0

    for item in data['data']:
        try:
            existing_row = session.query(SalesStatistics).filter(
                and_(
                    SalesStatistics.date == date,
                    SalesStatistics.account_title == account['account_title'],
                    SalesStatistics.sku == item['SKU'],
                    SalesStatistics.asin == item['ASIN']
                )
            ).first()

            processed_item = {
                'date': date,
                'account_title': account['account_title'],
                'sku': item['SKU'],
                'asin': item['ASIN'],
                'orders': safe_convert(item['Orders'], int),
                'units': safe_convert(item['Units'], int),
                'velocity': safe_convert(item['Velocity'], float),
                'buybox_price': safe_convert(item['Buybox Price'], float),
                'local_inventory': safe_convert(item['Local Inventory'], int),
                'in_stock': safe_convert(item['In Stock'], int),
                'ordered_product_sales': safe_convert(item['Ordered Product Sales'], float),
                'revenue': safe_convert(item['Revenue'], float),
                'shipping_cost': safe_convert(item['Shipping Cost'], float),
                'commissions': safe_convert(item['Commissions'], float),
                'miscellaneous_cost': safe_convert(item['Miscellaneous Cost'], float),
                'cogs': safe_convert(item['COGS'], float),
                'fba_fees': safe_convert(item['FBA Fees'], float),
                'promo_amount': safe_convert(item['Promo Amount'], float),
                'ppc_sales': safe_convert(item['PPC Sales'], float),
                'ppc_cost': safe_convert(item['PPC Cost'], float),
                'tacos': safe_convert(item['TACOS'], float),
                'net_profit': safe_convert(item['Net Profit'], float),
                'net_margin': safe_convert(item['Net Margin'], float),
                'net_roi': safe_convert(item['Net ROI'], float),
                'sales_rank': json.dumps(item['Sales Rank']),
                'inbound': safe_convert(item['Inbound'], int),
                'reserved': safe_convert(item['Reserved'], int),
                'in_transit': safe_convert(item['In Transit'], int),
                'in_warehouse': safe_convert(item['In Warehouse'], int),
                'taxes': safe_convert(item['Taxes'], float),
                'condition': item['Condition'],
                'currency': item['Currency']
            }

            if existing_row:
                for key, value in processed_item.items():
                    setattr(existing_row, key, value)
                updated_records += 1
            else:
                new_row = SalesStatistics(**processed_item)
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
    logger.info("Starting Sales Statistics import")
    
    Session = sessionmaker(bind=engine)
    session = Session()

    oauth = get_oauth_session()
    accounts = get_all_accounts()

    yesterday = datetime.now().date() - timedelta(days=1)
    
    total_new_records = 0
    total_updated_records = 0

    for account in accounts:
        logger.info(f"Fetching data for account: {account['account_title']}")
        
        page = 1
        while True:
            logger.info(f"Fetching page {page}")
            data = get_sales_statistics_data(oauth, account, yesterday, page)

            if data and isinstance(data, dict) and 'data' in data and isinstance(data['data'], list):
                if len(data['data']) == 0:
                    logger.info("No more data to fetch for this account.")
                    break

                new_records, updated_records = import_data(session, data, yesterday, account)
                total_new_records += new_records
                total_updated_records += updated_records

                logger.info(f"Page {page} import completed. New records: {new_records}, Updated records: {updated_records}")

                if data.get('current_page') == data.get('last_page'):
                    logger.info("Reached the last page for this account.")
                    break

                page += 1
            else:
                logger.error("Unexpected data structure or no data received.")
                break

    end_time = time.time()
    duration = end_time - start_time

    logger.info("Data import completed successfully.")
    logger.info(f"Total new records: {total_new_records}")
    logger.info(f"Total updated records: {total_updated_records}")
    logger.info(f"Total time taken: {duration:.2f} seconds")

    session.close()

if __name__ == "__main__":
    main()
