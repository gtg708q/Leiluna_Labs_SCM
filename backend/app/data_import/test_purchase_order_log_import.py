from ..database import SessionLocal, engine, DATABASE_URL
from ..models.purchase_order_log import PurchaseOrderLog
from ..models.bom import BOM
from ..utils.google_sheets import get_purchase_order_log_data
from ..utils.logger import po_logger, clear_log
from sqlalchemy.orm import Session
from sqlalchemy import text
import datetime
from typing import List, Dict, Any
from sqlalchemy.exc import IntegrityError
from backend.app.db_init import init_db
import os
import re

# ... (keep all the helper functions like clean_float, clean_int, parse_date, map_po_data, create_or_update_bom)

def clean_float(value):
    po_logger.info(f"clean_float input: {value}, type: {type(value)}")
    if value is None:
        return None
    if isinstance(value, (int, float)):
        return float(value)
    if isinstance(value, str):
        # Remove currency symbols, commas, and whitespace
        cleaned_value = re.sub(r'[^\d.-]', '', value.strip())
        po_logger.info(f"clean_float cleaned value: {cleaned_value}")
        if cleaned_value == '' or cleaned_value == '#REF!':
            return None
        try:
            return float(cleaned_value)
        except ValueError:
            po_logger.warning(f"Invalid float value: {value}")
            return None
    po_logger.warning(f"Unhandled value type in clean_float: {type(value)}")
    return None

def clean_int(value):
    if isinstance(value, str):
        value = value.replace(',', '').strip()
        if value == '' or value == '#REF!':
            return None
        try:
            return int(value)
        except ValueError:
            po_logger.warning(f"Invalid integer value: {value}")
            return None
    return int(value) if value is not None else None

def parse_date(date_string):
    if not date_string or date_string == '#REF!':
        return None
    try:
        return datetime.datetime.strptime(date_string, '%m/%d/%y').date()
    except ValueError:
        try:
            return datetime.datetime.strptime(date_string, '%m/%d/%Y').date()
        except ValueError:
            po_logger.warning(f"Invalid date format: {date_string}")
            return None

def initial_setup(db: Session):
    try:
        # Check if the purchase_order_log table is empty
        po_count = db.query(PurchaseOrderLog).count()
        if po_count == 0:
            db.execute(text("TRUNCATE TABLE purchase_order_log RESTART IDENTITY CASCADE;"))
            db.execute(text("SELECT setval(pg_get_serial_sequence('purchase_order_log', 'id'), 1, false);"))
            db.commit()
            po_logger.info("purchase_order_log table reset for initial import.")
        else:
            po_logger.info("purchase_order_log table already contains data. Skipping reset.")
    except Exception as e:
        db.rollback()
        po_logger.error(f"Error during initial setup: {e}")
        raise

def test_import_purchase_order_log(db: Session, is_initial_import: bool = False):
    try:
        po_logger.info(f"Current working directory: {os.getcwd()}")
        po_logger.info(f"Attempting to connect to database: {DATABASE_URL}")
        po_logger.info(f"Engine URL: {engine.url}")
        
        if is_initial_import:
            po_logger.info("Performing initial setup...")
            init_db()
            initial_setup(db)

        po_logger.info("Starting Test Purchase Order Log import (first 5 rows)")
        data = get_purchase_order_log_data()
        
        if not data or len(data) < 4:  # Ensure we have data and headers
            po_logger.error("No data retrieved for Purchase Order Log")
            return

        headers = data[0]  # Headers are in the first row of the retrieved data
        po_logger.info(f"Headers: {headers}")

        # Log a sample row
        po_logger.info(f"Sample row data: {data[1]}")

        # Find the index of the 'PO #' column
        po_number_index = next((i for i, h in enumerate(headers) if 'PO #' in h), None)
        if po_number_index is None:
            po_logger.error("'PO #' column not found in the headers")
            return

        current_po_numbers = set()

        processed_rows = 0
        for row in data[1:6]:  # Process only the first 5 rows after the header
            if len(row) <= po_number_index:
                po_logger.warning(f"Skipping row with insufficient columns: {row}")
                continue

            po_number = row[po_number_index]
            
            if not po_number:
                po_logger.warning(f"Skipping row without PO number: {row}")
                continue  # Skip rows without PO number

            row_dict = dict(zip(headers, row))
            po_data = map_po_data(row_dict)
            
            existing_po = db.query(PurchaseOrderLog).filter_by(po_number=po_number).first()
            
            if existing_po:
                for key, value in po_data.items():
                    setattr(existing_po, key, value)
                po_logger.info(f"Updated Purchase Order: {po_number}")
            else:
                new_po = PurchaseOrderLog(**po_data)
                db.add(new_po)
                po_logger.info(f"Created new Purchase Order: {po_number}")

            current_po_numbers.add(po_number)

            # Create or update BOM if necessary
            bom_id = po_data.get('bom_id')
            if bom_id:
                create_or_update_bom(db, bom_id)

            processed_rows += 1

        po_logger.info(f"Processed {processed_rows} rows from Purchase Order Log")

        db.commit()
        po_logger.info("Test Purchase Order Log import completed successfully")
    except Exception as e:
        db.rollback()
        po_logger.error(f"Error during Test Purchase Order Log import: {e}", exc_info=True)

def map_po_data(row: Dict[str, Any]) -> Dict[str, Any]:
    mapped_data = {
        'po_number': str(row.get('PO #', '')),
        'date_issued': parse_date(row.get('DATE ISSUED')),
        'reference': row.get('REFERENCE'),
        'asin': row.get('ASIN'),
        'bom_id': row.get('BOM ID'),
        'description': row.get('DESCRIPTION'),
        'item_status_notes': row.get('ITEM STATUS/NOTES'),
        'category': row.get('CATEGORY'),
        'product': row.get('PRODUCT'),
        'qty': clean_float(row.get('QTY')),
        'uom': row.get('UOM'),
        'supplier': row.get('SUPPIER'),  # Keep the misspelling as it is in the sheet
        'status': row.get('STATUS'),
        'estimated_mfg_completion_date': parse_date(row.get('ESTIMATED MFG COMPLETION DATE')),
        'estimated_mfg_lead_time_days': clean_int(row.get('ESTIMATED MFG LEAD TIME (DAYS)')),
        'estimated_shipping_lead_time_days': clean_int(row.get('ESTIMATED SHIPPING LEAD TIME (DAYS)')),
        'estimated_arrival_date': parse_date(row.get('ESTIMATED ARRIVAL DATE')),
        'current_expected_arrival_date': parse_date(row.get('CURRENT EXPECTED ARRIVAL DATE')),
        'actual_mfg_completion_date': parse_date(row.get('ACTUAL MFG COMPLETION DATE')),
        'actual_mfg_lead_time_days': clean_int(row.get('ACTUAL MFG LEAD TIME (DAYS)')),
        'actual_shipping_lead_time_days': clean_int(row.get('ACTUAL SHIPPING LEAD TIME (DAYS)')),
        'actual_arrival_date': parse_date(row.get('ACTUAL ARRIVAL DATE')),
        'mfg_lead_time_variance': clean_int(row.get('MFG LEAD TIME VARIANCE')),
        'shipping_lead_time_variance': clean_int(row.get('SHIPPING LEAD TIME VARIANCE')),
        'ship_to': row.get('SHIP TO'),
        'confidential_for_novaeo_only': row.get('CONFIDENTIAL FOR NOVAEO ONLY'),
        'coa_for_customers': row.get('COA FOR CUSTOMERS'),
        'mfg_date': parse_date(row.get('MFG DATE')),
        'expiry_date': parse_date(row.get('EXPIRY DATE')),
        'unit_price': clean_float(row.get(' UNIT PRICE ')),
        'amount': clean_float(row.get(' AMOUNT ')),
        'freight': clean_float(row.get(' FREIGHT ')),
        'duty_taxes': clean_float(row.get('DUTY/TAXES')),
        'other_charges': clean_float(row.get(' OTHER CHARGES ')),
        'total_amount': clean_float(row.get(' TOTAL AMOUNT ')),
        'landed_cost_per_unit': clean_float(row.get('Landed Cost/unit')),
        'payment_term': row.get('PAYMENT TERM'),
        'freight_term': row.get('FREIGHT TERM'),
        'invoice_no': row.get('INVOICE NO.'),
        'down_payment': clean_float(row.get(' DOWN PAYMENT ')),
        'dp_due_date': parse_date(row.get('DP DUE DATE')),
        'dp_date_paid': parse_date(row.get('DP DATE PAID')),
        'balance_amount': clean_float(row.get(' BALANCE AMOUNT ')),
        'balance_due_date': parse_date(row.get('BALANCE DUE DATE')),
        'balance_paid_date': parse_date(row.get('BALANCE PAID DATE')),
        'within_mfg_sla': row.get('Withn MFG SLA') == 'Yes',
        'within_shipping_sla': row.get('Within Shipping SLA') == 'Yes',
        'agreed_sla': clean_int(row.get('Agreed SLA')),
        'delivery_tl': clean_int(row.get('Delivery TL')),
        'within_xsla': clean_int(row.get('Within XSLA')),
        'year': clean_int(row.get('Year')),
        'month': row.get('Month'),
        'week': clean_int(row.get('Week')),
        'findings': row.get('FINDINGS'),
    }
    po_logger.info(f"Mapped PO data: {mapped_data}")
    return {k: v for k, v in mapped_data.items() if v is not None}

def create_or_update_bom(db: Session, bom_id: str):
    bom = db.query(BOM).filter(BOM.bom_id == bom_id).first()
    if not bom:
        bom = BOM(
            bom_id=bom_id,
            created_at=datetime.datetime.utcnow()
        )
        db.add(bom)
        db.flush()
        po_logger.info(f"Created new BOM entry for BOM ID: {bom_id}")
    return bom

if __name__ == "__main__":
    db = SessionLocal()
    try:
        # Set this to True for the initial import, False for subsequent imports
        is_initial_import = True  # Change this to False after the initial import
        test_import_purchase_order_log(db, is_initial_import)
    finally:
        db.close()
