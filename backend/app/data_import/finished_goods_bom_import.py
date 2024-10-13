import sys
import os
import csv
import logging
from sqlalchemy.orm import Session
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.schema import CreateTable

# Add the project root directory to the Python path
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', '..'))
sys.path.insert(0, project_root)

from backend.app.models.finished_goods_bom_component import FinishedGoodsBOMComponent
from backend.app.models.inventory import FinishedGoods
from backend.app.models.bom import BOM
from backend.app.database import SessionLocal, engine, Base

# Ensure log directory exists
log_dir = os.path.join(project_root, 'logs')
os.makedirs(log_dir, exist_ok=True)

# Set up logging
logging.basicConfig(filename=os.path.join(log_dir, 'finished_goods_bom_import.log'), 
                    level=logging.INFO,
                    format='%(asctime)s - %(levelname)s - %(message)s')

def create_tables():
    # Create all tables that don't exist yet
    Base.metadata.create_all(engine)
    
    # If you want to see the SQL for creating the FinishedGoodsBOMComponent table:
    # print(CreateTable(FinishedGoodsBOMComponent.__table__).compile(engine))

def import_finished_goods_bom_components(db: Session, csv_file_path: str):
    logging.info(f"Starting import from {csv_file_path}")
    
    skipped_rows = 0
    imported_rows = 0
    
    with open(csv_file_path, 'r') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            try:
                finished_good = db.query(FinishedGoods).filter(FinishedGoods.isku == row['iSKU']).first()
                bom = db.query(BOM).filter(BOM.bom_id == row['BOM ID']).first()
                
                if not finished_good:
                    logging.warning(f"Skipping row: iSKU {row['iSKU']} not found in finished_goods table")
                    skipped_rows += 1
                    continue
                
                if not bom:
                    logging.warning(f"Skipping row: BOM ID {row['BOM ID']} not found in boms table")
                    skipped_rows += 1
                    continue
                
                quantity = float(row['Quantity (unit/kg/Liter)']) if row['Quantity (unit/kg/Liter)'] != '#N/A' else None
                material_unit_price = float(row['Material Unit Price']) if row['Material Unit Price'] and row['Material Unit Price'] != '#N/A' else None
                per_fg_price = float(row['Per FG price'].replace(',', '')) if row['Per FG price'] and row['Per FG price'] != '#N/A' else None
                
                component = FinishedGoodsBOMComponent(
                    isku=finished_good.isku,
                    bom_id=bom.bom_id,
                    quantity=quantity,
                    component_type=row['Component Type'],
                    material_unit_price=material_unit_price,
                    per_fg_price=per_fg_price,
                    bom_class=row['BOM Class'],
                    status=row['Status'] if row['Status'] else None
                )
                db.add(component)
                imported_rows += 1
                
            except Exception as e:
                logging.error(f"Error processing row {row}: {str(e)}")
                skipped_rows += 1
        
        try:
            db.commit()
            logging.info(f"Import completed. Imported rows: {imported_rows}, Skipped rows: {skipped_rows}")
        except SQLAlchemyError as e:
            db.rollback()
            logging.error(f"Error committing changes to database: {str(e)}")

    logging.info("Import process finished")

if __name__ == "__main__":
    csv_file_path = "/Users/derrekwiedeman/Leiluna_Labs_SCM/mapping.csv"
    
    try:
        # Create tables
        create_tables()
        logging.info("Tables created successfully")
        
        # Perform import
        db = SessionLocal()
        import_finished_goods_bom_components(db, csv_file_path)
        print("Import process completed. Check the log file for details.")
    except Exception as e:
        logging.error(f"An error occurred: {str(e)}")
        print(f"An error occurred. Check the log file for details.")
    finally:
        if 'db' in locals():
            db.close()
