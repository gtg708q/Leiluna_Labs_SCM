import sys
import os

# Add the project root directory to the Python path
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from backend.app.database import SessionLocal
from backend.app.data_import.bom_import import import_boms
from backend.app.data_import.inventory_import import import_tampa_bom_inventory, import_finished_goods, import_finished_goods_inventory

def run_imports(is_initial_import=False):
    db = SessionLocal()
    try:
        print("Starting import processes...")
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

if __name__ == "__main__":
    run_imports()
