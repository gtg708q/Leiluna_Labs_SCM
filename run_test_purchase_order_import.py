import sys
import os
import argparse

# Add the project root directory to the Python path
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from backend.app.data_import.test_purchase_order_log_import import test_import_purchase_order_log
from backend.app.database import SessionLocal

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Run test purchase order log data import (first 5 rows)")
    parser.add_argument("--initial", action="store_true", help="Perform initial import (creates tables and resets data)")
    
    args = parser.parse_args()
    
    db = SessionLocal()
    try:
        # Pass the is_initial_import flag to the import function
        test_import_purchase_order_log(db, is_initial_import=args.initial)
    finally:
        db.close()

    if args.initial:
        print("Initial test import of purchase order log (first 5 rows) completed.")
    else:
        print("Update test import of purchase order log (first 5 rows) completed.")
