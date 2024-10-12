import requests
import json
from datetime import datetime, timedelta
import os

# API configuration
API_BASE_URL = "https://us-central1-power-my-analytics.cloudfunctions.net"
ORG_ACCESS_TOKEN = "870c0392-1dc7-46d6-a7ec-31ae8288ee03"
ORGANIZATION_ID = "uEUhu171yumQIlPdAwEk"

headers = {
    "Authorization": f"Bearer {ORG_ACCESS_TOKEN}"
}

def get_amazon_seller_central_accounts():
    url = f"{API_BASE_URL}/http-organizations/{ORGANIZATION_ID}/accounts/amazonmws"
    print(f"Getting Amazon Seller Central accounts. Requesting URL: {url}")
    response = requests.get(url, headers=headers)
    print(f"Response status code: {response.status_code}")
    print(f"Response content: {response.text}")
    return response.json() if response.status_code == 200 else None

def get_amazon_report(account_id, start_date, end_date, table, fields):
    url = f"{API_BASE_URL}/connectors-amazonmws-report"
    params = {
        "organizationId": ORGANIZATION_ID,
        "accountId": account_id,
        "config": json.dumps({"status": ["Shipped"], "currency": "USD"}),
        "start": start_date,
        "end": end_date,
        "table": table,
        "fields": fields,
        "aggregate": ""
    }
    print(f"Getting Amazon report. Requesting URL: {url}")
    print(f"Params: {params}")
    response = requests.get(url, headers=headers, params=params)
    print(f"Response status code: {response.status_code}")
    
    with open('amazon_report_response.json', 'w') as f:
        json.dump(response.json(), f, indent=2)
    print(f"Response content saved to 'amazon_report_response.json'")
    
    return response.json() if response.status_code == 200 else None

def get_amazon_report_minimal(account_id, start_date, end_date):
    url = f"{API_BASE_URL}/connectors-amazonmws-report"
    params = {
        "organizationId": ORGANIZATION_ID,
        "accountId": account_id,
        "start": start_date,
        "end": end_date,
        "config": json.dumps({"status": ["Shipped"], "currency": "USD"}),
        "fields": "date",
        "aggregate": ""
    }
    print(f"Getting Amazon report (minimal). Requesting URL: {url}")
    print(f"Params: {params}")
    response = requests.get(url, headers=headers, params=params)
    print(f"Response status code: {response.status_code}")
    print(f"Response content: {response.text[:200]}...")  # Print first 200 characters
    return response.json() if response.status_code == 200 else None

def main():
    start_date = "2024-09-01"
    end_date = "2024-09-30"
    
    # Get Amazon Seller Central accounts
    accounts = get_amazon_seller_central_accounts()
    if not accounts:
        print("Failed to retrieve Amazon Seller Central accounts.")
        return

    print("\nAvailable Amazon Seller Central accounts:")
    for account in accounts:
        print(f"- {account['displayName']} (ID: {account['id']}, Token Valid: {account['isTokenValid']})")

    # Select the first valid account
    valid_account = next((account for account in accounts if account['isTokenValid']), None)
    if not valid_account:
        print("No valid Amazon Seller Central accounts found.")
        return

    print(f"\nProcessing account: {valid_account['displayName']} (ID: {valid_account['id']})")
    
    print("\nAttempting to retrieve report for orders table with date field only")
    report = get_amazon_report(valid_account['id'], start_date, end_date, "orders", "date")
    
    if isinstance(report, dict):
        if 'rows' in report:
            print("Successfully retrieved Amazon report:")
            print(json.dumps(report, indent=2))
        elif 'schema' in report:
            print("Successfully retrieved schema information:")
            available_fields = [field['name'] for field in report['schema']]
            print("Available fields:", ", ".join(available_fields))
        else:
            print("Unexpected response format:")
            print(json.dumps(report, indent=2))
    else:
        print("Failed to retrieve Amazon report.")
        print("Unexpected response format")

    if os.path.exists('amazon_report_response.json'):
        print("\nFull response saved to 'amazon_report_response.json'. Please check this file for complete data.")

    # Try with sales_and_traffic table
    print("\nAttempting to retrieve report for sales_and_traffic table with date field only")
    report = get_amazon_report(valid_account['id'], start_date, end_date, "sales_and_traffic", "date")
    
    if isinstance(report, dict):
        if 'rows' in report:
            print("Successfully retrieved Amazon report:")
            print(json.dumps(report, indent=2))
        elif 'schema' in report:
            print("Successfully retrieved schema information:")
            available_fields = [field['name'] for field in report['schema']]
            print("Available fields:", ", ".join(available_fields))
        else:
            print("Unexpected response format:")
            print(json.dumps(report, indent=2))
    else:
        print("Failed to retrieve Amazon report.")
        print("Unexpected response format")

    # Try with inventory table
    print("\nAttempting to retrieve report for inventory table with date field only")
    report = get_amazon_report(valid_account['id'], start_date, end_date, "inventory", "date")
    
    if isinstance(report, dict):
        if 'rows' in report:
            print("Successfully retrieved Amazon report:")
            print(json.dumps(report, indent=2))
        elif 'schema' in report:
            print("Successfully retrieved schema information:")
            available_fields = [field['name'] for field in report['schema']]
            print("Available fields:", ", ".join(available_fields))
        else:
            print("Unexpected response format:")
            print(json.dumps(report, indent=2))
    else:
        print("Failed to retrieve Amazon report.")
        print("Unexpected response format")

    print("\nAttempting to retrieve report with minimal fields")
    minimal_report = get_amazon_report_minimal(valid_account['id'], start_date, end_date)
    
    if isinstance(minimal_report, dict):
        if 'rows' in minimal_report:
            print("Successfully retrieved Amazon report:")
            print(json.dumps(minimal_report, indent=2))
        elif 'schema' in minimal_report:
            print("Successfully retrieved schema information:")
            available_fields = [field['name'] for field in minimal_report['schema']]
            print("Available fields:", ", ".join(available_fields))
        else:
            print("Unexpected response format:")
            print(json.dumps(minimal_report, indent=2))
    else:
        print("Failed to retrieve Amazon report.")
        print("Unexpected response format")

if __name__ == "__main__":
    main()