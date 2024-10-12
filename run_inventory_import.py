import sys
import os
import argparse

# Add the project root directory to the Python path
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from backend.app.data_import.inventory_import import main

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Run inventory data import")
    parser.add_argument("--initial", action="store_true", help="Perform initial import (clears existing data)")
    parser.add_argument("--create-tables", action="store_true", help="Create tables before import")
    
    args = parser.parse_args()
    
    # Pass the command-line arguments to the main function
    main(args.initial, args.create_tables)
