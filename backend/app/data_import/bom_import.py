from ..database import SessionLocal
from ..models.bom import BOM, BOMChangeLog, BOMHistory
from ..utils.google_sheets import get_bom_data
from ..utils.logger import bom_logger, clear_log
from ..utils.change_tracking import log_bom_change, create_bom_history
from sqlalchemy.orm import Session
from sqlalchemy import text, func
import datetime

def clean_float(value):
    if isinstance(value, str):
        return float(value.replace(',', '').strip() or 0)
    return float(value or 0)

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
            db.add(BOMChangeLog(bom_id=existing_bom.id, change_type='update', changes=', '.join(changes)))
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

def import_boms(is_initial_import=False):
    db = SessionLocal()
    try:
        if is_initial_import:
            initial_setup(db)
        
        clear_log(bom_logger)
        bom_logger.info("Starting BOM import")
        data = get_bom_data()
        if not data:
            bom_logger.error("No data retrieved from Google Sheets")
            return

        bom_logger.info(f"Retrieved {len(data)} rows from Google Sheets")
        headers = data[0]  # Assuming first row is headers
        
        current_bom_ids = set()
        for i, row in enumerate(data[1:], start=2):  # Start from 2 to account for header row
            try:
                row_data = dict(zip(headers, row))
                bom_data = map_bom_data(row_data)
                
                if not bom_data.get('bom_id'):
                    bom_logger.warning(f"Skipping row {i} due to missing BOM ID")
                    continue
                
                existing_bom = db.query(BOM).filter(BOM.bom_id == bom_data['bom_id']).first()
                
                if existing_bom:
                    # Update existing BOM
                    if update_bom(db, existing_bom, bom_data):
                        bom_logger.info(f"Updated BOM {i}: {existing_bom.bom_id}")
                    else:
                        bom_logger.info(f"No changes for BOM {i}: {existing_bom.bom_id}")
                else:
                    # Create new BOM
                    new_bom = create_new_bom(db, bom_data)
                    bom_logger.info(f"Created new BOM {i}: {new_bom.bom_id}")
                
                current_bom_ids.add(bom_data['bom_id'])
            except Exception as e:
                bom_logger.error(f"Error processing row {i}: {e}", exc_info=True)

        # Check for deleted BOMs
        existing_bom_ids = set(bom.bom_id for bom in db.query(BOM.bom_id).all())
        deleted_bom_ids = existing_bom_ids - current_bom_ids

        for deleted_bom_id in deleted_bom_ids:
            try:
                deleted_bom = db.query(BOM).filter(BOM.bom_id == deleted_bom_id).first()
                if deleted_bom:
                    # Add a 'delete' entry to BOMChangeLog
                    db.add(BOMChangeLog(bom_id=deleted_bom.id, change_type='delete'))
                    # Now delete the BOM
                    db.delete(deleted_bom)
                    bom_logger.info(f"Marked BOM for deletion: {deleted_bom_id}")
            except Exception as e:
                bom_logger.error(f"Error marking BOM {deleted_bom_id} for deletion: {e}", exc_info=True)

        db.commit()
        bom_logger.info(f"BOM import completed successfully. Processed {len(data) - 1} rows.")
    except Exception as e:
        db.rollback()
        bom_logger.error(f"Error during BOM import: {e}", exc_info=True)
    finally:
        db.close()

if __name__ == "__main__":
    import_boms()  # For regular updates
    # import_boms(is_initial_import=True)  # Uncomment this line for the initial import