import sys
import os
import argparse
from datetime import datetime

# Add the directory containing 'backend' to the Python path
sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))

from backend.app.data_import.purchase_order_log_import import import_purchase_order_log
from backend.app.database import SessionLocal

def run_purchase_order_import(is_initial_import=False):
    db = SessionLocal()
    try:
        print("Starting purchase order log import process...")
        start_time = datetime.now()
        result = import_purchase_order_log(db, is_initial_import=is_initial_import)
        end_time = datetime.now()
        duration = (end_time - start_time).total_seconds()
        print("Purchase order log import completed.")
        
        # Ensure result is a dictionary with the required keys
        if not isinstance(result, dict):
            result = {}
        
        return {
            "new_records": result.get("new_records", 0),
            "updated_records": result.get("updated_records", 0),
            "duration": f"{duration:.2f} seconds"
        }
    except Exception as e:
        print(f"Error during purchase order import: {str(e)}")
        return {
            "error": str(e),
            "new_records": 0,
            "updated_records": 0,
            "duration": "N/A"
        }
    finally:
        db.close()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Run purchase order log data import")
    parser.add_argument("--initial", action="store_true", help="Perform initial import (creates tables and resets data)")
    
    args = parser.parse_args()
    
    result = run_purchase_order_import(is_initial_import=args.initial)

    if args.initial:
        print("Initial import of purchase order log completed.")
    else:
        print("Update import of purchase order log completed.")
    
    print(f"New records: {result['new_records']}")
    print(f"Updated records: {result['updated_records']}")
    print(f"Duration: {result['duration']}")
