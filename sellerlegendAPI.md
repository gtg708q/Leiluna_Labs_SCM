#get authorization code
curl --location 'https://app.sellerlegend.com/oauth/authorize?response_type=code&client_id=YOUR_SL_CLIENT_ID&redirect_uri=YOUR_REDIRECT_PATH&state=ABC&scope=*' \
--data ''

#POST Get Access Token
curl --location 'https://app.sellerlegend.com/oauth/token' \
--header 'Content-Type: application/x-www-form-urlencoded;charset=UTF-8' \
--form 'grant_type="authorization_code"' \
--form 'client_id="SL_CLIENT_ID"' \
--form 'client_secret="SL_CLIENT_SECRET"' \
--form 'redirect_uri="SL_REDIRECT"' \
--form 'code="AUTH_CODE"'

#example response:
{
  "token_type": "Bearer",
  "expires_in": 1296000,
  "access_token": "SL_ACCESS_TOKEN",
  "refresh_token": "SL_REFRESH_TOKEN"
}

#POST Refresh Access Token
curl --location 'https://app.sellerlegend.com/oauth/token' \
--header 'Content-Type: application/x-www-form-urlencoded;charset=UTF-8' \
--form 'grant_type="refresh_token"' \
--form 'client_id="SL_CLIENT_ID"' \
--form 'client_secret="SL_CLIENT_SECRET"' \
--form 'refresh_token="SL_REFRESH_TOKEN"'

#example response:
{
  "token_type": "Bearer",
  "expires_in": 1296000,
  "access_token": "SL_ACCESS_TOKEN",
  "refresh_token": "SL_REFRESH_TOKEN"
}

#GET Service Status
curl --location 'https://app.sellerlegend.com/api/service-status' \
--header 'Accept: application/json'

#Example Response:
{
  "status": "Success",
  "code": 200,
  "message": "Active",
  "path": "api/service-status"
}

#GET Accounts List
curl --location 'https://app.sellerlegend.com/api/user/accounts' \
--header 'Accept: application/json'

#Example Response:
{
  "status": "Success",
  "code": 200,
  "message": "Accounts List",
  "path": "api/user/accounts",
  "accounts": [
    {
      "id": 100000,
      "account_title": "MyAccountTitle (US)",
      "country_code": "US",
      "currency_code": "USD",
      "timezone": "America/Los_Angeles",
      "marketplace": "ATVPDKIKX0DER",
      "seller_id": "<SELLER-ID>"
    },
    {
      "id": 100001,
      "account_title": "MyAccountTitle (UK)",
      "country_code": "UK",
      "currency_code": "GBP",
      "timezone": "Europe/Paris",
      "marketplace": "A1F83G8C2ARO7P",
      "seller_id": "<SELLER-ID>"
    },
    {
      "id": 100002,
      "account_title": "MyAccountTitle (DE)",
      "country_code": "DE",
      "currency_code": "EUR",
      "timezone": "Europe/Paris",
      "marketplace": "A1PA6795UKMFR9",
      "seller_id": "<SELLER-ID>"
    },
    {
      "id": 100003,
      "account_title": "MyAccountTitle (ES)",
      "country_code": "ES",
      "currency_code": "EUR",
      "timezone": "Europe/Paris",
      "marketplace": "A1RKKUPIHCS9HS",
      "seller_id": "<SELLER-ID>"
    },
    {
      "id": 100004,
      "account_title": "MyAccountTitle (FR)",
      "country_code": "FR",
      "currency_code": "EUR",
      "timezone": "Europe/Paris",
      "marketplace": "A13V1IB3VIYZZH",
      "seller_id": "<SELLER-ID>"
    }
  ]
}


#GET Sales Statistics
curl --location 'https://app.sellerlegend.com/api/sales/statistics-dashboard?seller_id=A2xxxxxxxxxxxx&marketplace_id=ATVPDKIKX0DER&view_by=product&group_by=Product&start_date=2021-07-01&end_date=2021-07-31&per_page=500' \
--header 'Accept: application/json' \
--data ''

#Example Response:
{
  "current_page": 1,
  "data": [
    {
      "Account Title": "MyAccountTitle",
      "Market Place": "US",
      "ASIN": "Bxxxxxxxxx",
      "Is Parent": 0,
      "Internal Name": "some text here",
      "Product Group": "some text here",
      "Tags": "some text here",
      "Orders": "3",
      "Units": "3",
      "Velocity": "0.10",
      "Buybox Price": "32.95",
      "Refunded": "0",
      "Refund %": "0.00",
      "Promo Units": "0",
      "Organic Units": "3",
      "Local Inventory": "0",
      "In Stock": "0",
      "Per Unit Revenue": "37.53",
      "Revenue": "112.60",
      "COGS": "-27.21",
      "FBA Fees": "-46.50",
      "Promo Amount": "-13.75",
      "Sessions": 230,
      "Page Views": 284,
      "Impressions": "85",
      "Clicks": "1",
      "PPC Orders": "0",
      "PPC Sales": "0.00",
      "PPC Cost": "-0.03",
      "PPC Conv": "0.00",
      "OOE": "0.00",
      "Net Profit": "25.11",
      "Net Margin": "22.30",
      "Net ROI": "34.07",
      "Sales Rank": "{\"sports\":{\"path\":[{\"name\":\"sports\",\"category_id\":\"sports\"}],\"sales_rank\":\"2xxx9\"},\"1x3xxx21\":{\"path\":[{\"name\":\"some text here\",\"category_id\":33xxx01},{\"name\":\"soem text here\",\"category_id\":70xxx0x1},{\"name\":\"some text here\",\"category_id\":34xxx71},{\"name\":\"some text here\",\"category_id\":34xxx11},{\"name\":\"some text here\",\"category_id\":1xxx29x1}],\"sales_rank\":\"xx\"}}",
      "Inbound": "0",
      "Reserved": "0",
      "In Transit": "0",
      "In Warehouse": "0",
      "Currency": "USD"
    },
    {
      "Account Title": "MyAccountTitle",
      "Market Place": "US",
      "ASIN": "Bxxxxxxxxx",
      "Is Parent": 0,
      "Internal Name": "some text here",
      "Product Group": "some text here",
      "Tags": "some text here",
      "Orders": "0",
      "Units": "0",
      "Velocity": "0.00",
      "Buybox Price": "23.95",
      "Refunded": "0",
      "Refund %": "0.00",
      "Promo Units": "0",
      "Organic Units": "0",
      "Local Inventory": "0",
      "In Stock": "0",
      "Per Unit Revenue": "0.00",
      "Revenue": "0.00",
      "COGS": "0.00",
      "FBA Fees": "0.00",
      "Promo Amount": "0.00",
      "Sessions": 0,
      "Page Views": 0,
      "Impressions": "0",
      "Clicks": "0",
      "PPC Orders": "0",
      "PPC Sales": "0.00",
      "PPC Cost": "0.00",
      "PPC Conv": "0.00",
      "OOE": "0.00",
      "Net Profit": "0.00",
      "Net Margin": "0.00",
      "Net ROI": "0.00",
      "Sales Rank": "{\"sports\":{\"path\":[{\"name\":\"sports\",\"category_id\":\"sports\"}],\"sales_rank\":\"1xx9\"},\"14332921\":{\"path\":[{\"name\":\"some text\",\"category_id\":33xxx00},{\"name\":\"some text here\",\"category_id\":70xxx000},{\"name\":\"some text here\",\"category_id\":3400371},{\"name\":\"some text here\",\"category_id\":34xxx11},{\"name\":\"some text here\",\"category_id\":14xxx000}],\"sales_rank\":\"xx\"}}",
      "Inbound": "0",
      "Reserved": "2",
      "In Transit": "0",
      "In Warehouse": "0",
      "Currency": "USD"
    }
  ],
  "first_page_url": "https://app.sellerlegend.com/api/sales/statistics-dashboard?seller_id=A2xxxxxxxxxxxx&marketplace_id=ATVPDKIKX0DER&view_by=product&group_by=Product&start_date=2021-07-01&end_date=2021-07-31&per_page=500&page=1",
  "from": 1,
  "last_page": 1,
  "last_page_url": "https://app.sellerlegend.com/api/sales/statistics-dashboard?seller_id=A2xxxxxxxxxxxx&marketplace_id=ATVPDKIKX0DER&view_by=product&group_by=Product&start_date=2021-07-01&end_date=2021-07-31&per_page=500&page=1",
  "next_page_url": null,
  "path": "https://app.sellerlegend.com/api/sales/statistics-dashboard",
  "per_page": "500",
  "prev_page_url": null,
  "to": 74,
  "total": 74
}

#GET Sales Per Day Per Product
curl --location 'https://app.sellerlegend.com/api/sales/per-day-per-product?seller_id=A2xxxxxxxxxxxx&marketplace_id=A1F83G8C2ARO7P&start_date=2021-07-01&end_date=2021-07-30&per_page=500'

#Example Response:
{
  "current_page": 1,
  "data": [
    {
      "Date": "2021-10-01",
      "Title": "some text here some text here some text here",
      "Account Title": "MyAccountTitle",
      "Market Place": "UK",
      "SKU": "PxxxxxxxxB",
      "FNSKU": "X00xxxxxx9",
      "ASIN": "B00xxxxxxA",
      "Parent ASIN": "B0xxxxxxxx",
      "Is Parent": 0,
      "Internal Name": "some text here",
      "Brand": "some text here",
      "Product Group": "some text here",
      "Tags": "some text here",
      "Orders": "6",
      "Units": "6",
      "Refunded": "0",
      "Refund %": "0.00",
      "Unit Session %": "18.75",
      "Promo Units": "0",
      "Organic Units": "6",
      "Per Unit Revenue": "9.97",
      "Revenue": "59.82",
      "COGS": "-20.31",
      "FBA Fees": "-20.59",
      "Promo Amount": "-1.75",
      "Sessions": "32",
      "Page Views": "38",
      "Impressions": "85",
      "Clicks": "1",
      "PPC Orders": "0",
      "PPC Sales": "0.00",
      "PPC Cost": "-0.37",
      "PPC Conv": "0.00",
      "OOE": "0.00",
      "Net Profit": "16.79",
      "Net Margin": "28.06",
      "Net ROI": "41.04",
      "PPC Product Sales": 0,
      "PPC Product Cost": -0.37360032,
      "PPC Product Clicks": "1",
      "PPC Product Impressions": "85",
      "PPC Video Sales": "0.00",
      "PPC Video Cost": "0.00",
      "PPC Video Clicks": "0",
      "PPC Video Impressions": "0",
      "Currency": "EUR"
    },
    {
      "Date": "2021-10-02",
      "Title": "some text here some text here some text here",
      "Account Title": "MyAccountTitle",
      "Market Place": "UK",
      "SKU": "PxxxxxxxxB",
      "FNSKU": "X000xxxxxx",
      "ASIN": "B0xxxxxxxx",
      "Parent ASIN": "B0vvvvvvvv",
      "Is Parent": 0,
      "Internal Name": "some text here",
      "Brand": "some text here",
      "Product Group": "some text here",
      "Tags": "some text here",
      "Orders": "5",
      "Units": "5",
      "Refunded": "1",
      "Refund %": "20.00",
      "Unit Session %": "26.32",
      "Promo Units": "0",
      "Organic Units": "5",
      "Per Unit Revenue": "9.68",
      "Revenue": "38.71",
      "COGS": "-13.54",
      "FBA Fees": "-15.74",
      "Promo Amount": "0.00",
      "Sessions": "19",
      "Page Views": "21",
      "Impressions": "73",
      "Clicks": "0",
      "PPC Orders": "0",
      "PPC Sales": "0.00",
      "PPC Cost": "0.00",
      "PPC Conv": "0.00",
      "OOE": "0.00",
      "Net Profit": "9.43",
      "Net Margin": "24.37",
      "Net ROI": "32.22",
      "PPC Product Sales": 0,
      "PPC Product Cost": 0,
      "PPC Product Clicks": "0",
      "PPC Product Impressions": "73",
      "PPC Video Sales": "0.00",
      "PPC Video Cost": "0.00",
      "PPC Video Clicks": "0",
      "PPC Video Impressions": "0",
      "Currency": "EUR"
    }
  ],
  "first_page_url": "https://app.sellerlegend.com/api/sales/per-day-per-product?seller_id=A2xxxxxxxxxxxx&marketplace_id=A1F83G8C2ARO7P&start_date=2021-10-01&end_date=2021-10-15&per_page=500&page=1",
  "from": 1,
  "last_page": 1,
  "last_page_url": "https://app.sellerlegend.com/api/sales/per-day-per-product?seller_id=A2xxxxxxxxxxxx&marketplace_id=A1F83G8C2ARO7P&start_date=2021-10-01&end_date=2021-10-15&per_page=500&page=1",
  "next_page_url": null,
  "path": "https://app.sellerlegend.com/api/sales/per-day-per-product",
  "per_page": "500",
  "prev_page_url": null,
  "to": 383,
  "total": 383
}

