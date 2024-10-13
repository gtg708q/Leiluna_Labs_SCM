from ..database import SessionLocal
from ..models.bom import BOM, BOMChangeLog, BOMHistory
from ..utils.google_sheets import get_bom_data as fetch_bom_data
from ..utils.logger import bom_logger, clear_log
from ..utils.change_tracking import log_bom_change, create_bom_history
from sqlalchemy.orm import Session
from sqlalchemy import text, func
import datetime
from google.cloud import storage
from sqlalchemy.exc import IntegrityError

def clean_float(value):
    if isinstance(value, str):
        value = value.strip().rstrip('%').replace(',', '')
        return float(value) if value and value != '#N/A' else 0
    return float(value) if value is not None else 0

def clean_int(value):
    if isinstance(value, str):
        return int(value.replace(',', '').strip() or 0)
    return int(value or 0)

def update_bom(db: Session, existing_bom: BOM, bom_data: dict):
    try:
        changes = []
        for key, value in bom_data.items():
            if key != 'bom_id' and getattr(existing_bom, key) != value:
                setattr(existing_bom, key, value)
                changes.append(key)
        
        if changes:
            existing_bom.version += 1
            existing_bom.updated_at = datetime.datetime.utcnow()
            db.add(BOMChangeLog(bom_id=existing_bom.id, change_type='update', changed_fields=', '.join(changes)))
            create_bom_history(db, existing_bom)
        return bool(changes)
    except Exception as e:
        bom_logger.error(f"Error updating BOM: {e}")
        raise

def create_new_bom(db: Session, bom_data: dict):
    try:
        new_bom = BOM(**bom_data)
        db.add(new_bom)
        db.flush()  # This will assign an id to the new BOM
        
        # Create initial BOM change log
        db.add(BOMChangeLog(bom_id=new_bom.id, change_type='create'))
        
        # Create initial BOM history
        create_bom_history(db, new_bom)
        
        return new_bom
    except Exception as e:
        bom_logger.error(f"Error creating new BOM: {e}")
        raise

def map_bom_data(row_data):
    bom_data = {
        'bom_id': str(row_data.get('NEW BOM ID', '')).strip(),
        'component_type': str(row_data.get('Component Type', '')).strip(),
        'phx_class': str(row_data.get('PHX Class', '')).strip(),
        'supplier_manufacturer': str(row_data.get('Supplier/Manufacturer', '')).strip(),
        'address': str(row_data.get('Address', '')).strip(),
        'email': str(row_data.get('Email', '')).strip(),
        'contact_number': str(row_data.get('Contact Number', '')).strip(),
        'supplier_mfg_lt': clean_int(row_data.get('Supplier/Mfg LT')),
        'transit_lt': clean_int(row_data.get('Transit LT')),
        'amz_safety_days': clean_int(row_data.get('AMZ Safety Days')),
        'wh_safety_days': clean_int(row_data.get('WH Safety Days')),
        'po_issue_days': clean_int(row_data.get('PO Issue Days')),
        'master_pack': clean_int(row_data.get('Master Pack')),
        'moq': clean_int(row_data.get('MOQ')),
        'ordering_uom': str(row_data.get('Ordering UOM', '')).strip(),
        'unit_price': clean_float(row_data.get('Unit Price')),
        'shipping_cost': clean_float(row_data.get('Shipping Cost')),
        'landed_cost': clean_float(row_data.get('Landed Cost')),
        'conversion': clean_float(row_data.get('Conversion')),
        'converted_unit_price': clean_float(row_data.get('Converted Unit Price')),
        'ims_unit': str(row_data.get('IMS Unit', '')).strip(),
        'supplier_payment_terms': str(row_data.get('Supplier Payment Terms', '')).strip(),
        'product_link': str(row_data.get('Product Link', '')).strip(),
        'supplier_product_id': str(row_data.get('Supplier Product ID', '')).strip(),
        'description': str(row_data.get('Description', '')).strip(),
        'remarks': str(row_data.get('Remarks', '')).strip(),
        'alternative_supplier_1': str(row_data.get('Alternative Supplier 1', '')).strip(),
        'alternative_supplier_2': str(row_data.get('Alternative Supplier 2', '')).strip(),
        'monthly_usage': clean_float(row_data.get('Monthly Usage')),
        'monthly_spend': clean_float(row_data.get('Monthly Spend')),
        'total_lt_bom_master': clean_int(row_data.get('Total LT BOM Master')),
        'comments': str(row_data.get('Comments', '')).strip(),
    }
    return {k: v for k, v in bom_data.items() if v}  # Remove empty values

def initial_setup(db):
    try:
        # Check if the boms table is empty
        bom_count = db.query(func.count(BOM.id)).scalar()
        if bom_count == 0:
            db.execute(text("TRUNCATE TABLE boms, bom_history, bom_change_log RESTART IDENTITY CASCADE;"))
            db.execute(text("SELECT setval(pg_get_serial_sequence('boms', 'id'), 1, false);"))
            db.execute(text("SELECT setval(pg_get_serial_sequence('bom_history', 'id'), 1, false);"))
            db.execute(text("SELECT setval(pg_get_serial_sequence('bom_change_log', 'id'), 1, false);"))
            db.commit()
            bom_logger.info("Tables reset for initial import.")
        else:
            bom_logger.info("Tables already contain data. Skipping reset.")
    except Exception as e:
        db.rollback()
        bom_logger.error(f"Error during initial setup: {e}")
        raise

def get_last_update_time():
    storage_client = storage.Client()
    bucket = storage_client.bucket('your-bucket-name')
    blob = bucket.blob('last_bom_update.txt')
    
    if blob.exists():
        return datetime.fromisoformat(blob.download_as_text())
    return datetime.min

def set_last_update_time(time):
    storage_client = storage.Client()
    bucket = storage_client.bucket('your-bucket-name')
    blob = bucket.blob('last_bom_update.txt')
    blob.upload_from_string(time.isoformat())

def import_boms(db: Session, is_initial_import: bool):
    try:
        if is_initial_import:
            initial_setup(db)
        
        clear_log(bom_logger)
        bom_logger.info("Starting BOM import")
        data = get_bom_data()
        if not data or len(data) < 2:
            bom_logger.error("No data retrieved for BOMs")
            return

        headers = data[0]
        current_bom_ids = set()
        for row in data[1:]:
            row_dict = dict(zip(headers, row))
            bom_data = map_bom_data(row_dict)
            bom_id = bom_data.get('bom_id')
            if not bom_id:
                bom_logger.warning(f"Skipping row with empty BOM ID: {row_dict}")
                continue

            existing_bom = db.query(BOM).filter_by(bom_id=bom_id).first()
            if existing_bom:
                if update_bom(db, existing_bom, bom_data):
                    bom_logger.info(f"Updated BOM: {bom_id}")
            else:
                new_bom = create_new_bom(db, bom_data)
                bom_logger.info(f"Created new BOM: {bom_id}")
            current_bom_ids.add(bom_id)

        # Mark BOMs as deleted if they're not in the current import
        db.query(BOM).filter(BOM.bom_id.notin_(current_bom_ids)).update({BOM.is_deleted: True}, synchronize_session=False)

        db.commit()
        bom_logger.info("BOM import completed successfully")
    except Exception as e:
        db.rollback()
        bom_logger.error(f"Error during BOM import: {e}", exc_info=True)

def get_bom_data():
    data = fetch_bom_data()
    if not data:
        bom_logger.error("No data retrieved from BOM sheet")
        return None
    return data

def update_bom(db: Session, existing_bom: BOM, row_dict: dict):
    changes = []
    for field, value in row_dict.items():
        if hasattr(existing_bom, field) and getattr(existing_bom, field) != value:
            old_value = getattr(existing_bom, field)
            setattr(existing_bom, field, value)
            changes.append(f"{field}: {old_value} -> {value}")
            db.add(BOMChangeLog(bom_id=existing_bom.id, change_type='update', field_name=field, old_value=str(old_value), new_value=str(value)))
    
    if changes:
        bom_logger.info(f"Updated BOM {existing_bom.bom_id}: {', '.join(changes)}")
        return True
    return False

def create_bom(db: Session, row_dict: dict):
    new_bom = BOM(**row_dict)
    db.add(new_bom)
    db.flush()  # This will assign an ID to the new BOM
    db.add(BOMChangeLog(bom_id=new_bom.id, change_type='create', field_name='all', old_value='', new_value='new entry'))
    return new_bom

if __name__ == "__main__":
    import_boms()  # For regular updates
    # import_boms(is_initial_import=True)  # Uncomment this line for the initial import
