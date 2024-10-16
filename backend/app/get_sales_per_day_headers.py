import os
import json
from dotenv import load_dotenv
from requests_oauthlib import OAuth2Session
from oauthlib.oauth2 import TokenExpiredError

# Load environment variables
load_dotenv()

SELLERLEGEND_BASE_URL = "https://app.sellerlegend.com"
CLIENT_ID = os.getenv("SELLERLEGEND_CLIENT_ID")
CLIENT_SECRET = os.getenv("SELLERLEGEND_CLIENT_SECRET")
TOKEN_FILE = os.path.join(os.path.dirname(__file__), 'sellerlegend_tokens.json')

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
        auto_refresh_url=f"{SELLERLEGEND_BASE_URL}/oauth/token",
        token_updater=token_updater
    )

def get_us_account():
    with open(os.path.join(os.path.dirname(__file__), 'sellerlegend_accounts.json'), 'r') as f:
        accounts_data = json.load(f)
    
    us_accounts = [account for account in accounts_data['accounts'] if account['country_code'] == 'US']
    if not us_accounts:
        print("No US accounts found.")
        return None
    
    # If there are multiple US accounts, you might want to choose one or ask the user
    # For now, we'll just return the first US account
    return us_accounts[0]

def get_sales_per_day_headers():
    oauth = get_oauth_session()
    us_account = get_us_account()

    if not us_account:
        print("No US account found.")
        return None

    url = f"{SELLERLEGEND_BASE_URL}/api/sales/per-day-per-product"
    params = {
        "seller_id": us_account['seller_id'],
        "marketplace_id": us_account['marketplace'],
        "start_date": "2024-09-01",
        "end_date": "2024-09-30",
        "per_page": 500
    }

    try:
        response = oauth.get(url, params=params)
        print(f"Sales Per Day Per Product response status code: {response.status_code}")

        if response.status_code == 200:
            # Find the start of the JSON content
            json_start = response.text.find('{')
            if json_start != -1:
                json_content = response.text[json_start:]
                data = json.loads(json_content)
                if 'data' in data and len(data['data']) > 0:
                    headers = list(data['data'][0].keys())
                    return headers
                else:
                    print("No data found in the response.")
                    return None
            else:
                print("No JSON content found in the response.")
                print(f"Response content: {response.text[:500]}...")  # Print first 500 characters
                return None
        else:
            print(f"Error: {response.status_code}")
            print(response.text)
            return None

    except json.JSONDecodeError as e:
        print(f"Error decoding JSON: {e}")
        print(f"Response content: {response.text[:500]}...")  # Print first 500 characters
        return None
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        return None

if __name__ == "__main__":
    headers = get_sales_per_day_headers()
    if headers:
        print("\nColumn headers for Sales Per Day Per Product report:")
        for header in headers:
            print(f"- {header}")
    else:
        print("Failed to retrieve headers.")
