import sys
import os

# Add the directory containing 'backend' to the Python path
sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))

from backend.app.database import SessionLocal, create_tables
from backend.app.data_import.bom_import import import_boms
from backend.app.data_import.inventory_import import import_tampa_bom_inventory, import_finished_goods, import_finished_goods_inventory

def run_imports(is_initial_import=False):
    db = SessionLocal()
    try:
        print("Starting import processes...")
        
        # Create tables if they don't exist
        create_tables()
        
        print("Running BOM import...")
        import_boms(db, is_initial_import)
        print("BOM import completed.")

        print("Running inventory import...")
        import_tampa_bom_inventory(db, is_initial_import)
        import_finished_goods(db, is_initial_import)
        import_finished_goods_inventory(db, is_initial_import)
        print("Inventory import completed.")

        print("All import processes completed.")
    finally:
        db.close()

def run_finished_goods_import():
    db = SessionLocal()
    try:
        print("Starting Finished Goods import...")
        result = import_finished_goods(db, is_initial_import=False)
        print("Finished Goods import completed.")
        return result
    finally:
        db.close()

def run_bom_inventory_import():
    db = SessionLocal()
    try:
        print("Starting BOM Inventory import...")
        result = import_tampa_bom_inventory(db, is_initial_import=False)
        print("BOM Inventory import completed.")
        return result
    finally:
        db.close()

def run_finished_goods_inventory_import():
    db = SessionLocal()
    try:
        print("Starting Finished Goods Inventory import...")
        result = import_finished_goods_inventory(db, is_initial_import=False)
        print("Finished Goods Inventory import completed.")
        return result
    finally:
        db.close()

if __name__ == "__main__":
    run_imports()
