import os
from google.oauth2.credentials import Credentials
from googleapiclient.discovery import build
from google.oauth2 import service_account
from .logger import bom_logger, inventory_logger

SCOPES = ['https://www.googleapis.com/auth/spreadsheets.readonly']

# Sheet IDs
BOM_SHEET_ID = '1dp9Onj9mJ4NNtEd1E4px6nHY7RRP1TPYQHIScvCecdM'
TAMPA_INVENTORY_SHEET_ID = '1m2RvQ-l1KWe4ur3IJCum8b3uq6MwcZpdThUtDXwxvQ8'
FINISHED_GOODS_SHEET_ID = '1oW4mNov0iR8yyGq69gHGndYVRV2xbqC3N74KqC592Xc'

def get_service():
    try:
        service_account_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'config', 'service_account.json'))
        creds = service_account.Credentials.from_service_account_file(
            service_account_path, scopes=SCOPES)
        return build('sheets', 'v4', credentials=creds)
    except Exception as e:
        bom_logger.error(f"Error creating Google Sheets service: {e}")
        return None

def get_sheet_data(sheet_id, range_name):
    try:
        service = get_service()
        if not service:
            return []

        sheet = service.spreadsheets()
        result = sheet.values().get(spreadsheetId=sheet_id, range=range_name).execute()
        values = result.get('values', [])
        
        if not values:
            inventory_logger.warning(f'No data found in Google Sheet: {sheet_id}, range: {range_name}')
            return []
        
        inventory_logger.info(f"Retrieved {len(values)} rows from Google Sheet: {sheet_id}, range: {range_name}")
        return values
    except Exception as e:
        inventory_logger.error(f"Error fetching data from Google Sheets: {e}")
        return []

def get_multiple_sheet_data(sheet_id, range_names):
    try:
        service = get_service()
        if not service:
            return []

        sheet = service.spreadsheets()
        result = sheet.values().batchGet(spreadsheetId=sheet_id, ranges=range_names).execute()
        value_ranges = result.get('valueRanges', [])
        
        if not value_ranges:
            inventory_logger.warning(f'No data found in Google Sheet: {sheet_id}, ranges: {range_names}')
            return []
        
        data = []
        for value_range in value_ranges:
            values = value_range.get('values', [])
            if not values:
                inventory_logger.warning(f'No data found in range: {value_range["range"]}')
                continue
            data.append(values)
            inventory_logger.info(f"Retrieved {len(values)} rows from Google Sheet: {sheet_id}, range: {value_range['range']}")
        
        if not data:
            inventory_logger.warning(f'No data found in any of the specified ranges: {range_names}')
        
        return data
    except Exception as e:
        inventory_logger.error(f"Error fetching multiple sheet data from Google Sheets: {e}")
        return []

# Specific functions for each data import

def get_bom_data():
    """
    Retrieves BOM data.
    Expected structure: [BOM ID, Component Type, PHX Class, ...]
    """
    RANGE_NAME = 'BOM Master!A:AE'  # Adjust this range as needed
    data = get_sheet_data(BOM_SHEET_ID, RANGE_NAME)
    if data:
        bom_logger.info(f"Retrieved {len(data)} rows from BOM Master sheet")
    else:
        bom_logger.warning("No data retrieved from BOM Master sheet")
    return data

def get_tampa_bom_inventory_data():
    """
    Retrieves Tampa BOM Inventory data from two tabs.
    Expected structure for each tab: [BOM ID, Type, PHX Class, ...]
    """
    RANGE_NAMES = ['RawInventory!A:AC', 'PackagingBOMs!A:AB']
    return get_multiple_sheet_data(TAMPA_INVENTORY_SHEET_ID, RANGE_NAMES)

def get_finished_goods_data():
    """
    Retrieves Finished Goods data.
    Expected structure: [ASIN, iSKU, Common Name, Phoenix Class, ...]
    """
    RANGE_NAME = 'Master List & Unit Cost!A:U'  # Adjust this range to include all necessary columns
    data = get_sheet_data(FINISHED_GOODS_SHEET_ID, RANGE_NAME)
    if data:
        inventory_logger.info(f"Retrieved {len(data)} rows from Finished Goods sheet")
    else:
        inventory_logger.warning("No data retrieved from Finished Goods sheet")
    return data

def get_finished_goods_inventory_data():
    """
    Retrieves Finished Goods Inventory data.
    Expected structure: [iSKU, Brand, PHX Class, Theoretical Qty, ...]
    """
    RANGE_NAME = 'FG!A:AD'  # Adjust this range to include all necessary columns
    data = get_sheet_data(TAMPA_INVENTORY_SHEET_ID, RANGE_NAME)
    if data:
        inventory_logger.info(f"Retrieved {len(data)} rows from Finished Goods Inventory sheet")
    else:
        inventory_logger.warning("No data retrieved from Finished Goods Inventory sheet")
    return data
