import os
import requests
from dotenv import load_dotenv
import json
import webbrowser
from urllib.parse import urlparse, parse_qs
import time
import requests_oauthlib
from requests_oauthlib import OAuth2Session
from oauthlib.oauth2 import TokenExpiredError

# Load environment variables
load_dotenv()

SELLERLEGEND_BASE_URL = "https://app.sellerlegend.com"
CLIENT_ID = os.getenv("SELLERLEGEND_CLIENT_ID")
CLIENT_SECRET = os.getenv("SELLERLEGEND_CLIENT_SECRET")
REDIRECT_URI = os.getenv("SELLERLEGEND_REDIRECT_URI")
TOKEN_FILE = os.path.join(os.path.dirname(__file__), 'sellerlegend_tokens.json')

# Add these print statements
print(f"CLIENT_ID: {CLIENT_ID}")
print(f"REDIRECT_URI: {REDIRECT_URI}")

# Add these constants
TOKEN_URL = f"{SELLERLEGEND_BASE_URL}/oauth/token"
AUTHORIZATION_BASE_URL = f"{SELLERLEGEND_BASE_URL}/oauth/authorize"

def load_tokens():
    if os.path.exists(TOKEN_FILE):
        with open(TOKEN_FILE, 'r') as f:
            return json.load(f)
    return None

def save_tokens(token):
    with open(TOKEN_FILE, 'w') as f:
        json.dump(token, f)

def get_oauth_session():
    token = load_tokens()
    
    def token_updater(token):
        save_tokens(token)

    extra = {
        'client_id': CLIENT_ID,
        'client_secret': CLIENT_SECRET,
    }

    return OAuth2Session(
        CLIENT_ID,
        token=token,
        auto_refresh_kwargs=extra,
        auto_refresh_url=TOKEN_URL,
        token_updater=token_updater
    )

def get_authorization_url():
    oauth = OAuth2Session(CLIENT_ID, redirect_uri=REDIRECT_URI, scope=["*"])
    authorization_url, _ = oauth.authorization_url(AUTHORIZATION_BASE_URL)
    return authorization_url

def fetch_token(code):
    oauth = OAuth2Session(CLIENT_ID, redirect_uri=REDIRECT_URI)
    token = oauth.fetch_token(
        TOKEN_URL,
        code=code,
        client_secret=CLIENT_SECRET
    )
    save_tokens(token)
    return token

def get_accounts_list():
    oauth = get_oauth_session()
    try:
        response = oauth.get(f"{SELLERLEGEND_BASE_URL}/api/user/accounts")
        print(f"Accounts list response status code: {response.status_code}")
        
        # Extract JSON from the response content
        json_start = response.text.find('{')
        json_end = response.text.rfind('}') + 1
        if json_start != -1 and json_end != -1:
            json_str = response.text[json_start:json_end]
            return json.loads(json_str)
        else:
            print("No valid JSON found in the response.")
            return None
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        return None

def save_accounts_data(accounts_data):
    file_path = os.path.join(os.path.dirname(__file__), 'sellerlegend_accounts.json')
    with open(file_path, 'w') as f:
        json.dump(accounts_data, f, indent=2)
    print(f"SellerLegend accounts data saved to '{file_path}'")

def get_sales_statistics(seller_id, marketplace_id, start_date, end_date):
    oauth = get_oauth_session()
    url = f"{SELLERLEGEND_BASE_URL}/api/sales/statistics-dashboard"
    params = {
        "seller_id": seller_id,
        "marketplace_id": marketplace_id,
        "view_by": "product",
        "group_by": "Product",
        "start_date": start_date,
        "end_date": end_date,
        "per_page": 500
    }
    
    try:
        response = oauth.get(url, params=params)
        print(f"Sales Statistics response status code: {response.status_code}")
        print(f"Request URL: {response.url}")
        
        # Extract JSON from the response content
        json_start = response.text.find('{')
        json_end = response.text.rfind('}') + 1
        if json_start != -1 and json_end != -1:
            json_str = response.text[json_start:json_end]
            return json.loads(json_str)
        else:
            print("No valid JSON found in the response.")
            return None
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        return None

def test_sales_statistics():
    # Load the accounts data
    accounts_file = os.path.join(os.path.dirname(__file__), 'sellerlegend_accounts.json')
    if not os.path.exists(accounts_file):
        print("Accounts data not found. Please run the main function first to fetch accounts.")
        return

    with open(accounts_file, 'r') as f:
        accounts_data = json.load(f)

    # Find the Kreativ Farms account
    kreativ_farms = next((account for account in accounts_data['accounts'] if account['account_title'] == 'Kreativ Farms'), None)

    if not kreativ_farms:
        print("Kreativ Farms account not found in the saved accounts data.")
        return

    seller_id = kreativ_farms['seller_id']
    marketplace_id = kreativ_farms['marketplace']

    start_date = "2024-09-01"
    end_date = "2024-09-30"

    print(f"\nFetching Sales Statistics for Kreativ Farms ({seller_id})...")
    stats = get_sales_statistics(seller_id, marketplace_id, start_date, end_date)

    if stats and 'data' in stats:
        print(f"\nSales Statistics Summary:")
        print(f"Total results: {len(stats['data'])}")
        print(f"Page {stats['current_page']} of {stats['last_page']}")
        print(f"\nFirst 10 results of Sales Statistics:")
        for item in stats['data'][:10]:
            print(f"SKU: {item['SKU']}")
            print(f"ASIN: {item['ASIN']}")
            print(f"Orders: {item['Orders']}")
            print(f"Units: {item['Units']}")
            print(f"Revenue: ${item['Revenue']}")
            print(f"Net Profit: ${item['Net Profit']}")
            print(f"Net Margin: {item['Net Margin']}%")
            print("---")
    else:
        print("Failed to fetch Sales Statistics or no data available.")
        if stats:
            print("Response content:")
            print(json.dumps(stats, indent=2))

def main():
    print("SellerLegend API Test")
    print("====================")

    token = load_tokens()
    if not token:
        # We need to go through the authorization process
        auth_url = get_authorization_url()
        print(f"1. Please visit this URL to authorize the application: {auth_url}")
        redirect_url = input("\nEnter the full redirect URL: ")
        
        parsed_url = urlparse(redirect_url)
        query_params = parse_qs(parsed_url.query)
        auth_code = query_params.get('code', [None])[0]

        if not auth_code:
            print("Error: Could not extract authorization code.")
            return

        print("\n2. Exchanging code for access token...")
        token = fetch_token(auth_code)
        print("Access token obtained and saved successfully.")

    # Use the access token to fetch accounts list
    print("\n3. Fetching accounts list...")
    accounts_data = get_accounts_list()
    
    if accounts_data:
        save_accounts_data(accounts_data)

        if isinstance(accounts_data, dict) and "accounts" in accounts_data:
            print("\nAccounts list:")
            for account in accounts_data["accounts"]:
                print(json.dumps(account, indent=2))
        else:
            print("Unexpected response format. Check the 'sellerlegend_accounts.json' file for details.")
    else:
        print("Failed to fetch accounts data. Please check the console output for more details.")

    test_sales_statistics()

if __name__ == "__main__":
    main()
