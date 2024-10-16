import requests
import json
from datetime import datetime, timedelta
import os

# API configuration
API_BASE_URL = "https://us-central1-power-my-analytics.cloudfunctions.net"
ORG_ACCESS_TOKEN = "870c0392-1dc7-46d6-a7ec-31ae8288ee03"
ORGANIZATION_ID = "uEUhu171yumQIlPdAwEk"
ACCOUNT_ID = "amazonmws-A387O5GH8GCHW"

headers = {
    "Authorization": f"Bearer {ORG_ACCESS_TOKEN}"
}

def get_amazon_report(start_date, end_date, table, fields, config):
    url = f"{API_BASE_URL}/connectors-amazonmws-report"
    params = {
        "organizationId": ORGANIZATION_ID,
        "accountId": ACCOUNT_ID,
        "start": start_date,
        "end": end_date,
        "table": table,
        "fields": fields,
        "aggregate": "",
        "config": json.dumps(config)
    }
    
    print(f"Getting Amazon report. Requesting URL: {url}")
    print(f"Params: {params}")
    try:
        response = requests.get(url, headers=headers, params=params)
        print(f"Response status code: {response.status_code}")
        print(f"Response headers: {response.headers}")
        
        response_json = response.json()
        with open('amazon_report_response.json', 'w') as f:
            json.dump(response_json, f, indent=2)
        print(f"Response content saved to 'amazon_report_response.json'")
        
        if response.status_code != 200:
            print(f"Error response: {response_json}")
        
        return response_json
    except requests.RequestException as e:
        print(f"Request failed: {e}")
        return None

def test_date_ranges():
    table = "orders"
    fields = "date,amazon_order_id,asin,sku,product_name,quantity,item_price,item_tax,shipping_price,shipping_tax"
    config = {
        "status": ["Shipped", "Cancelled", "Complete", "On Trial", "Pending", "Shipping"],
        "currency": ""
    }

    # Test cases
    test_cases = [
        ("Past month", (datetime.now() - timedelta(days=30)).strftime("%Y-%m-%d"), datetime.now().strftime("%Y-%m-%d")),
        ("Past week", (datetime.now() - timedelta(days=7)).strftime("%Y-%m-%d"), datetime.now().strftime("%Y-%m-%d")),
        ("Yesterday", (datetime.now() - timedelta(days=1)).strftime("%Y-%m-%d"), datetime.now().strftime("%Y-%m-%d")),
        ("Single status - Shipped", (datetime.now() - timedelta(days=30)).strftime("%Y-%m-%d"), datetime.now().strftime("%Y-%m-%d"), {"status": ["Shipped"], "currency": ""}),
    ]

    for case in test_cases:
        print(f"\nTesting: {case[0]}")
        start_date, end_date = case[1], case[2]
        case_config = case[3] if len(case) > 3 else config
        report = get_amazon_report(start_date, end_date, table, fields, case_config)

        if report and 'data' in report:
            print(f"Data rows found: {len(report['data'])}")
            if report['data']:
                print("First row:")
                print(json.dumps(report['data'][0], indent=2))
        else:
            print("No data found for this case.")

def main():
    test_date_ranges()

if __name__ == "__main__":
    main()
