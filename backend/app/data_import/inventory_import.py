from backend.app.database import SessionLocal, create_tables
from backend.app.models.inventory import (
    TampaBOMInventory, FinishedGoods, FinishedGoodsInventory,
    TampaBOMInventoryChangeLog, FinishedGoodsChangeLog, FinishedGoodsInventoryChangeLog,
    TampaBOMInventoryHistory, FinishedGoodsHistory, FinishedGoodsInventoryHistory
)
from backend.app.models.bom import BOM, BOMChangeLog, BOMHistory
from backend.app.utils.google_sheets import (
    get_tampa_bom_inventory_data, get_finished_goods_data, get_finished_goods_inventory_data
)
from backend.app.utils.logger import inventory_logger, clear_log
from sqlalchemy.orm import Session
from sqlalchemy.exc import SQLAlchemyError, IntegrityError
from sqlalchemy import text, func
from datetime import datetime, date
import argparse
from typing import Any
import logging
import sys
from google.cloud import storage

# Add these helper functions after the imports and before the main functions

def clean_float(value):
    if isinstance(value, str):
        # Remove percentage sign and convert to float
        value = value.replace('%', '').strip()
        return float(value.replace(',', '').strip() or 0) / 100 if '%' in value else float(value.replace(',', '').strip() or 0)
    return float(value or 0)

def clean_int(value):
    if isinstance(value, str):
        return int(value.replace(',', '').strip() or 0)
    return int(value or 0)

def log_inventory_change(db: Session, model, item_id: int, field: str, old_value: Any, new_value: Any):
    change_log_model = {
        TampaBOMInventory: TampaBOMInventoryChangeLog,
        FinishedGoods: FinishedGoodsChangeLog,
        FinishedGoodsInventory: FinishedGoodsInventoryChangeLog
    }.get(model)
    
    if change_log_model:
        id_field = 'inventory_id' if model in [TampaBOMInventory, FinishedGoodsInventory] else 'finished_goods_id'
        change_log = change_log_model(
            **{id_field: item_id},
            field_name=field,
            old_value=str(old_value),
            new_value=str(new_value),
            changed_by="system"
        )
        db.add(change_log)

def create_inventory_history(db: Session, model, item):
    history_model = {
        TampaBOMInventory: TampaBOMInventoryHistory,
        FinishedGoods: FinishedGoodsHistory,
        FinishedGoodsInventory: FinishedGoodsInventoryHistory
    }.get(model)
    
    if history_model:
        valid_fields = [c.name for c in history_model.__table__.columns if c.name != 'id']
        history_entry = history_model(
            **{field: getattr(item, field) for field in valid_fields if hasattr(item, field)}
        )
        db.add(history_entry)

def initial_setup(db: Session, model):
    try:
        table_name = model.__tablename__
        history_table = f"{table_name}_history"
        change_log_table = f"{table_name}_change_log"
        
        count = db.query(func.count(model.id)).scalar()
        if count == 0:
            db.execute(text(f"TRUNCATE TABLE {table_name}, {history_table}, {change_log_table} RESTART IDENTITY CASCADE;"))
            db.execute(text(f"SELECT setval(pg_get_serial_sequence('{table_name}', 'id'), 1, false);"))
            db.execute(text(f"SELECT setval(pg_get_serial_sequence('{history_table}', 'id'), 1, false);"))
            db.execute(text(f"SELECT setval(pg_get_serial_sequence('{change_log_table}', 'id'), 1, false);"))
            db.commit()
            inventory_logger.info(f"Tables reset for initial {table_name} import.")
        else:
            inventory_logger.info(f"{table_name} table already contains data. Skipping reset.")
    except Exception as e:
        db.rollback()
        inventory_logger.error(f"Error during initial setup for {model.__tablename__}: {e}")
        raise

def import_tampa_bom_inventory(db: Session, is_initial_import: bool):
    try:
        if is_initial_import:
            initial_setup(db, TampaBOMInventory)
        
        clear_log(inventory_logger)
        inventory_logger.info("Starting Tampa BOM Inventory import")
        data = get_tampa_bom_inventory_data()
        if not data:
            inventory_logger.error("No data retrieved for Tampa BOM Inventory")
            return

        current_bom_ids = set()
        for sheet_data in data:
            headers = sheet_data[0]
            for row in sheet_data[1:]:
                row_dict = dict(zip(headers, row))
                if not row_dict.get('TYPE', '').strip() and not row_dict.get('PHX Class', '').strip():
                    inventory_logger.info(f"Skipping subheader row: {row_dict}")
                else:
                    bom_id = row_dict.get('BOM ID')
                    existing_inventory = db.query(TampaBOMInventory).filter_by(bom_id=bom_id).first()
                    if existing_inventory:
                        update_tampa_bom_inventory(db, existing_inventory, row_dict)
                    else:
                        create_tampa_bom_inventory(db, row_dict)
                    current_bom_ids.add(bom_id)

        # Check for deletions
        existing_bom_ids = set(item.bom_id for item in db.query(TampaBOMInventory.bom_id).all())
        bom_ids_to_delete = existing_bom_ids - current_bom_ids

        for bom_id in bom_ids_to_delete:
            db.query(TampaBOMInventory).filter_by(bom_id=bom_id).delete()
            inventory_logger.info(f"Deleted TampaBOMInventory item: {bom_id}")

        db.commit()
        inventory_logger.info("Tampa BOM Inventory import completed successfully")
    except Exception as e:
        db.rollback()
        inventory_logger.error(f"Error during Tampa BOM Inventory import: {e}", exc_info=True)

def import_finished_goods(db: Session, is_initial_import: bool):
    try:
        clear_log(inventory_logger)
        inventory_logger.info("Starting Finished Goods import")
        data = get_finished_goods_data()
        if not data or len(data) < 2:
            inventory_logger.error("No data retrieved for Finished Goods")
            return

        headers = data[0]
        current_iskus = set()
        for row in data[1:]:
            row_dict = dict(zip(headers, row))
            isku = row_dict.get('iSKU', '').strip()
            if not isku:
                inventory_logger.warning(f"Skipping row with empty iSKU: {row_dict}")
                continue

            existing_fg = db.query(FinishedGoods).filter_by(isku=isku).first()
            if existing_fg:
                update_finished_good(db, existing_fg, row_dict)
            else:
                create_finished_good(db, row_dict)
            current_iskus.add(isku)

        # Mark FinishedGoods as deleted if they're not in the current import
        db.query(FinishedGoods).filter(FinishedGoods.isku.notin_(current_iskus), FinishedGoods.isku != '').update({FinishedGoods.is_deleted: True}, synchronize_session=False)

        db.commit()
        inventory_logger.info("Finished Goods import completed successfully")
    except Exception as e:
        db.rollback()
        inventory_logger.error(f"Error during Finished Goods import: {e}", exc_info=True)

def import_finished_goods_inventory(db: Session, is_initial_import: bool):
    try:
        clear_log(inventory_logger)
        inventory_logger.info("Starting Finished Goods Inventory import")
        data = get_finished_goods_inventory_data()
        if not data or len(data) < 2:
            inventory_logger.error("No data retrieved for Finished Goods Inventory")
            return

        headers = data[0]
        current_items = set()
        for row in data[1:]:
            try:
                row_dict = dict(zip(headers, row))
                isku = row_dict.get('iSKU', '').strip()
                if not isku:
                    inventory_logger.warning(f"Skipping row with empty iSKU: {row_dict}")
                    continue

                existing_inventory = db.query(FinishedGoodsInventory).filter_by(isku=isku).first()
                if existing_inventory:
                    if update_finished_goods_inventory(db, existing_inventory, row_dict):
                        db.commit()  # Commit only if changes were made
                else:
                    # Check if the FinishedGoods exists before creating inventory
                    existing_finished_good = db.query(FinishedGoods).filter_by(isku=isku).first()
                    if existing_finished_good:
                        create_finished_goods_inventory(db, row_dict)
                        db.commit()  # Commit after creating new inventory
                    else:
                        inventory_logger.warning(f"Skipping inventory for non-existent FinishedGoods: {isku}")
                current_items.add(isku)
            except Exception as e:
                db.rollback()
                inventory_logger.error(f"Error processing row {row}: {str(e)}")

        # Remove FinishedGoodsInventory items that are not in the current import
        db.query(FinishedGoodsInventory).filter(FinishedGoodsInventory.isku.notin_(current_items), FinishedGoodsInventory.isku != '').delete(synchronize_session=False)

        db.commit()
        inventory_logger.info("Finished Goods Inventory import completed successfully")
    except Exception as e:
        db.rollback()
        inventory_logger.error(f"Error during Finished Goods Inventory import: {e}", exc_info=True)

SUBHEADERS_TO_SKIP = [
    "Natrisweet Powders",
    "Natrisweet Liquid Sweeteners",
    "Stevia/Monk Fruit Liquid Bundles",
    "Purisure Powders",
    "Misc Purisure FG",
    "Teakihut Powders",
    "WHYz FG",
    "Tejonova",
    "TreeActiv Acne Spot Treatments",
    "TreeActiv Skincare Sprays",
    "TreeActiv Skincare Cleansers",
    "TreeActiv Skincare Creams/Lotions",
    "TreeActiv Skincare Scrubs",
    "TreeActiv Aromatherapy Sprays",
    "TreeActiv Hair/Skin Supplements",
    "TreeActiv Misc Skincare FG",
    "TreeActiv Bundles and Kits",
    "Ayadara Acne Spot Treatments",
    "Ayadara Skincare Creams/Lotions",
    "Ayadara Skincare Sprays",
    "Ayadara Skincare Cleansers",
    "Ayadara Skincare Scrubs",
    "Ayadara Aromatherapy Sprays",
    "Ayadara Misc FG",
    "OPTML",
    "StandMore Desk",
    "Samples/B2B",
    "Promo Samples"
]

def is_subheader(isku: str) -> bool:
    return isku.strip() in SUBHEADERS_TO_SKIP

def parse_date(date_string):
    if not date_string or date_string.strip() == '':
        return None
    try:
        # Try parsing with year as %y first, then %Y if that fails
        try:
            return datetime.strptime(date_string, '%m/%d/%y').date()
        except ValueError:
            return datetime.strptime(date_string, '%m/%d/%Y').date()
    except ValueError:
        inventory_logger.warning(f"Invalid date format: {date_string}")
        return None

def create_or_get_bom(db: Session, bom_id: str):
    existing_bom = db.query(BOM).filter_by(bom_id=bom_id).first()
    if not existing_bom:
        new_bom = BOM(
            bom_id=bom_id,
            # Remove the 'name' field if it's not in your BOM model
            component_type='',
            phx_class='',
            supplier_manufacturer='',
            # Add other fields with default values
        )
        db.add(new_bom)
        db.flush()
        inventory_logger.info(f"Created new BOM entry for BOM ID: {bom_id}")
        return new_bom
    return existing_bom

def create_tampa_bom_inventory(db: Session, row_dict):
    bom_id = row_dict.get('BOM ID', '').strip()
    if not bom_id:
        inventory_logger.warning(f"Skipping row with empty BOM ID: {row_dict}")
        return

    # Check if the BOM exists in the boms table
    existing_bom = db.query(BOM).filter_by(bom_id=bom_id).first()
    if not existing_bom:
        inventory_logger.warning(f"Skipping inventory for non-existent BOM: {bom_id}")
        return

    if is_subheader(bom_id):
        inventory_logger.info(f"Skipping subheader row: {bom_id}")
        return

    # Create or get the BOM
    bom = create_or_get_bom(db, bom_id)

    date_counted = None
    if row_dict.get('Date Counted'):
        date_counted = parse_date(row_dict['Date Counted'])
        if date_counted is None:
            inventory_logger.warning(f"Invalid date format for 'Date Counted': {row_dict['Date Counted']}")

    tampa_bom_inventory = TampaBOMInventory(
        bom_id=row_dict.get('BOM ID', ''),
        type=row_dict.get('TYPE', ''),
        phx_class=row_dict.get('PHX Class', ''),
        theoretical_qty=clean_float(row_dict.get('Theoretical QTY', 0)),
        location=row_dict.get('Location', ''),
        cycle_count=clean_float(row_dict.get('Cycle Count', 0)),
        date_counted=date_counted,
        uom=row_dict.get('UOM', ''),
        theo_x_actual_variance=clean_float(row_dict.get('Theo\' x Actual Variance', '0').strip('%')),
        past_30_mo=clean_float(row_dict.get('Past 30 MO (metric unit)', 0)),
        past_30_fo=clean_float(row_dict.get('Past 30 FO (metric unit)', 0)),
        manufactured_fulfilled=clean_float(row_dict.get('Manufactured-Fulfilled', 0)),
        used_for_mfg_after_actual=clean_float(row_dict.get('Used for MFG After Actual (-)', 0)),
        conversion=clean_float(row_dict.get('Conversion', 0)),
        received_qty_after_actual_count=clean_float(row_dict.get('Received QTY After Actual Count (From Receiving Logs Only) (+)', 0)),
        ranking=clean_int(row_dict.get('Ranking', 0)),
        current_internal_lot_number=row_dict.get('Current Internal lot number', ''),
        used_in_ihf_shipstation_after_count=clean_float(row_dict.get('Used in IHF/ Shipstation After Count', 0)),
        theo_count_static=clean_float(row_dict.get('Theo Count Static', 0)),
        actual_count=clean_float(row_dict.get('Actual Count', 0)),
        wh_remarks=row_dict.get('WH Remarks', ''),
        variance=clean_float(row_dict.get('Variance', 0)),
        random_count=clean_float(row_dict.get('Random Count', 0)),
        subtype=row_dict.get('Subtype', '')
    )
    db.add(tampa_bom_inventory)
    db.flush()
    log_inventory_change(db, TampaBOMInventory, tampa_bom_inventory.id, 'created', '', 'new entry')
    create_inventory_history(db, TampaBOMInventory, tampa_bom_inventory)

def update_tampa_bom_inventory(db: Session, existing_inventory: TampaBOMInventory, row_dict):
    fields = [
        'bom_id', 'type', 'phx_class', 'theoretical_qty', 'date_counted',
        'uom', 'ranking', 'used_in_ihf_shipstation_after_count', 'subtype'
    ]
    changes = []
    for field in fields:
        old_value = getattr(existing_inventory, field)
        new_value = row_dict.get(field.replace('_', ' ').title(), '')
        
        if field == 'bom_id' and not new_value:
            continue  # Skip empty BOM ID updates
        
        if field in ['theoretical_qty', 'cycle_count', 'theo_x_actual_variance', 'past_30_mo', 'past_30_fo',
                     'manufactured_fulfilled', 'used_for_mfg_after_actual', 'conversion',
                     'received_qty_after_actual_count', 'theo_count_static', 'actual_count', 'variance', 'random_count']:
            new_value = clean_float(new_value)
        elif field == 'ranking':
            new_value = clean_int(new_value)
        elif field == 'date_counted':
            new_value = parse_date(new_value)
        elif field == 'used_in_ihf_shipstation_after_count':
            new_value = clean_float(new_value)
        
        if old_value != new_value:
            setattr(existing_inventory, field, new_value)
            log_inventory_change(db, TampaBOMInventory, existing_inventory.id, field, old_value, new_value)
            changes.append(field)
    
    if changes:
        create_inventory_history(db, TampaBOMInventory, existing_inventory)

def create_finished_good(db: Session, row_dict):
    isku = row_dict.get('iSKU', '').strip()
    if not isku:
        inventory_logger.warning(f"Skipping creation of FinishedGood with empty iSKU: {row_dict}")
        return None

    try:
        finished_good = FinishedGoods(
            isku=isku,
            asin=row_dict.get('ASIN', ''),
            common_name=row_dict.get('Common Name', ''),
            phoenix_class=row_dict.get('Phoenix Class', ''),
            brand=row_dict.get('Brand', ''),
            size=row_dict.get('Size', ''),
            material_cost=clean_float(row_dict.get('Material Cost', 0)),
            labor_cost=clean_float(row_dict.get('Labor Cost', 0)),
            total_unit_cost=clean_float(row_dict.get('Total Unit Cost', 0)),
            replenishment_type=row_dict.get('Replenishment Type', ''),
            manufacturing_class=row_dict.get('Manufacturing Class', ''),
            lead_time=clean_int(row_dict.get('Lead Time', 0)),
            amz_safety_days=clean_int(row_dict.get('AMZ Safety Days', 0)),
            wh_safety_days=clean_int(row_dict.get('WH Safety Days', 0)),
            reorder_qty_days=clean_int(row_dict.get('Reorder QTY Days', 0)),
            similar=clean_int(row_dict.get('Similar', None)),
            in_bom_mapping=row_dict.get('In BOM Mapping', '').lower() == 'true',
            duplicate_asin=row_dict.get('Duplicate ASIN', '').lower() == 'true',
            count_tkfg=clean_int(row_dict.get('Count TKFG', 0)),
            status=row_dict.get('Status', ''),
            batch_run=row_dict.get('Batch Run', '')
        )
        db.add(finished_good)
        db.flush()
        inventory_logger.info(f"Created FinishedGoods entry for iSKU: {isku}")
        return finished_good
    except IntegrityError as e:
        db.rollback()
        inventory_logger.error(f"Error creating FinishedGoods entry for iSKU {isku}: {str(e)}")
        return None

def update_finished_good(db: Session, existing_finished_good: FinishedGoods, row_dict):
    isku = row_dict.get('iSKU', '').strip()
    if not isku:
        inventory_logger.warning(f"Skipping update of FinishedGood with empty iSKU: {row_dict}")
        return

    fields = [
        'asin', 'common_name', 'phoenix_class', 'brand', 'size',
        'material_cost', 'labor_cost', 'total_unit_cost', 'replenishment_type',
        'manufacturing_class', 'lead_time', 'amz_safety_days', 'wh_safety_days',
        'reorder_qty_days', 'similar', 'in_bom_mapping', 'duplicate_asin',
        'count_tkfg', 'status', 'batch_run'
    ]
    changes = []
    for field in fields:
        old_value = getattr(existing_finished_good, field)
        new_value = row_dict.get(field.replace('_', ' ').title(), '')
        if field in ['material_cost', 'labor_cost', 'total_unit_cost']:
            new_value = clean_float(new_value)
        elif field in ['lead_time', 'amz_safety_days', 'wh_safety_days', 'reorder_qty_days', 'count_tkfg']:
            new_value = clean_int(new_value)
        elif field == 'similar':
            new_value = clean_int(new_value) if new_value else None
        elif field in ['in_bom_mapping', 'duplicate_asin']:
            new_value = new_value.lower() == 'true'
        
        if old_value != new_value:
            setattr(existing_finished_good, field, new_value)
            log_inventory_change(db, FinishedGoods, existing_finished_good.id, field, old_value, new_value)
            changes.append(field)
    
    if changes:
        create_inventory_history(db, FinishedGoods, existing_finished_good)
        inventory_logger.info(f"Updated FinishedGoods entry for iSKU: {isku}")

def create_finished_goods_inventory(db: Session, row_dict):
    isku = row_dict.get('iSKU', '').strip()
    
    if not isku:
        inventory_logger.warning(f"Skipping row with empty iSKU: {row_dict}")
        return

    existing_fg = db.query(FinishedGoods).filter_by(isku=isku).first()
    if not existing_fg:
        inventory_logger.warning(f"Skipping inventory for non-existent FinishedGoods: {isku}")
        return

    date_counted = parse_date(row_dict.get('Date Counted', ''))
    if date_counted is None:
        inventory_logger.warning(f"Invalid date format for 'Date Counted': {row_dict.get('Date Counted')}")

    finished_goods_inventory = FinishedGoodsInventory(
        isku=isku,
        brand=row_dict.get('Brand', ''),
        phx_class=row_dict.get('PHX Class', ''),
        theoretical_qty=clean_float(row_dict.get('Theoretical QTY', 0)),
        location=row_dict.get('Location', ''),
        actual_count=clean_float(row_dict.get('Actual Count', 0)),
        date_counted=date_counted,
        uom=row_dict.get('UOM', ''),
        mfg_after_date_counted=clean_float(row_dict.get('Mfg After Date Counted (+)', 0)),
        received_qty_after_actual_count=clean_float(row_dict.get('Received QTY After Actual Count (From Receiving Logs Only) (+)', 0)),
        fo_after_date_counted=clean_float(row_dict.get('FO After Date Counted (-)', 0)),
        fo_after_date_counted_from_bundles=clean_float(row_dict.get('FO After Date Counted (-) (FROM BUNDLES)', 0)),
        ihf_after_date_counted=clean_float(row_dict.get('IHF After Date Counted (-)', 0)),
        duplicate=row_dict.get('Duplicate', '').lower() == 'true',
        asin=row_dict.get('ASIN', ''),
        fba_veloz_ranking=clean_int(row_dict.get('FBA VELOZ RANKING', 0)),
        past_30_mo=clean_float(row_dict.get('Past 30 MO', 0)),
        past_30_fo=clean_float(row_dict.get('Past 30 FO', 0)),
        manufactured_fulfilled=clean_float(row_dict.get('Manufactured-Fulfilled', 0)),
        theo_count_static=clean_float(row_dict.get('Theo Count Static', 0)),
        actual_count_2=clean_float(row_dict.get('Actual Count', 0)),
        date_counted_2=date_counted,  # Use the same parsed date for both fields
        warehouse_remarks=row_dict.get('Warehouse Remarks', ''),
        variance=clean_float(row_dict.get('Variance', 0)),
        not_in_wir_fg=row_dict.get('NOT IN WIR-FG', ''),
        category=row_dict.get('Category', '')
    )
    db.add(finished_goods_inventory)
    db.flush()
    log_inventory_change(db, FinishedGoodsInventory, finished_goods_inventory.id, 'created', '', 'new entry')
    create_inventory_history(db, FinishedGoodsInventory, finished_goods_inventory)
    return finished_goods_inventory

def update_finished_goods_inventory(db: Session, existing_inventory: FinishedGoodsInventory, row_dict):
    isku = row_dict.get('iSKU', '').strip()
    if not isku:
        inventory_logger.warning(f"Skipping update of FinishedGoodsInventory with empty iSKU: {row_dict}")
        return False

    fields = [
        'brand', 'phx_class', 'theoretical_qty', 'location', 'actual_count',
        'date_counted', 'uom', 'mfg_after_date_counted', 'received_qty_after_actual_count',
        'fo_after_date_counted', 'fo_after_date_counted_from_bundles', 'ihf_after_date_counted',
        'duplicate', 'asin', 'fba_veloz_ranking', 'past_30_mo', 'past_30_fo',
        'manufactured_fulfilled', 'theo_count_static', 'actual_count_2', 'date_counted_2',
        'warehouse_remarks', 'variance', 'not_in_wir_fg', 'category'
    ]
    changes = []
    for field in fields:
        old_value = getattr(existing_inventory, field)
        new_value = row_dict.get(field.replace('_', ' ').title(), '')
        if field in ['theoretical_qty', 'actual_count', 'mfg_after_date_counted',
                     'received_qty_after_actual_count', 'fo_after_date_counted',
                     'fo_after_date_counted_from_bundles', 'ihf_after_date_counted',
                     'past_30_mo', 'past_30_fo', 'manufactured_fulfilled',
                     'theo_count_static', 'variance', 'actual_count_2']:
            new_value = clean_float(new_value)
        elif field == 'fba_veloz_ranking':
            new_value = clean_int(new_value)
        elif field in ['date_counted', 'date_counted_2']:
            new_value = parse_date(new_value)
        elif field == 'duplicate':
            new_value = new_value.lower() == 'true'
        
        if old_value != new_value:
            setattr(existing_inventory, field, new_value)
            log_inventory_change(db, FinishedGoodsInventory, existing_inventory.id, field, old_value, new_value)
            changes.append(field)
    
    if changes:
        create_inventory_history(db, FinishedGoodsInventory, existing_inventory)
        inventory_logger.info(f"Updated FinishedGoodsInventory entry for iSKU: {isku}. Changed fields: {', '.join(changes)}")
        return True
    else:
        inventory_logger.info(f"No changes for FinishedGoodsInventory entry with iSKU: {isku}")
        return False

def main(is_initial_import=False, should_create_tables=False):
    if should_create_tables:
        inventory_logger.info("Creating tables...")
        create_tables()
        inventory_logger.info("Tables created successfully.")

    db = SessionLocal()
    try:
        if is_initial_import:
            inventory_logger.info("Performing initial import...")
            reset_tables(db)
        else:
            inventory_logger.info("Performing update import...")

        # Import Tampa BOM Inventory
        import_tampa_bom_inventory(db, is_initial_import)
        db.commit()

        # Import Finished Goods
        import_finished_goods(db, is_initial_import)
        db.commit()

        # Import Finished Goods Inventory
        import_finished_goods_inventory(db, is_initial_import)
        db.commit()

        inventory_logger.info("Import process completed successfully.")
    except Exception as e:
        db.rollback()
        inventory_logger.error(f"Error during import process: {str(e)}")
    finally:
        db.close()

def reset_tables(db: Session):
    inventory_logger.info("Resetting tables for initial import...")
    db.execute(text("TRUNCATE TABLE tampa_bom_inventory RESTART IDENTITY CASCADE"))
    db.execute(text("TRUNCATE TABLE finished_goods RESTART IDENTITY CASCADE"))
    db.execute(text("TRUNCATE TABLE finished_goods_inventory RESTART IDENTITY CASCADE"))
    db.commit()
    inventory_logger.info("Tables reset successfully.")

def reset_finished_goods_table(db: Session):
    try:
        db.query(FinishedGoods).delete()
        db.commit()
        inventory_logger.info("Finished Goods table reset successfully.")
    except Exception as e:
        db.rollback()
        inventory_logger.error(f"Error resetting Finished Goods table: {str(e)}")
        raise
def setup_logger():
    logger = logging.getLogger('inventory_import')
    logger.setLevel(logging.INFO)

    # File handler
    file_handler = logging.FileHandler('logs/inventory.log')
    file_handler.setLevel(logging.DEBUG)
    file_formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
    file_handler.setFormatter(file_formatter)

    # Console handler (only for ERROR and above)
    console_handler = logging.StreamHandler(sys.stdout)
    console_handler.setLevel(logging.ERROR)
    console_formatter = logging.Formatter('%(levelname)s: %(message)s')
    console_handler.setFormatter(console_formatter)

    logger.addHandler(file_handler)
    logger.addHandler(console_handler)

    return logger

inventory_logger = setup_logger()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Import inventory data")
    parser.add_argument("--initial", action="store_true", help="Perform initial import (clears existing data)")
    parser.add_argument("--create-tables", action="store_true", help="Create tables before import")
    args = parser.parse_args()

    main(args.initial, args.create_tables)