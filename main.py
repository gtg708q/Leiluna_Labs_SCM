import functions_framework
from backend.app.data_import.bom_import import import_boms
from backend.app.data_import.inventory_import import main as import_inventory

@functions_framework.http
def run_imports(request):
    # Run BOM import
    import_boms()
    print("BOM import completed")

    # Run inventory import
    import_inventory(initial=False, create_tables=False)
    print("Inventory import completed")

    return "Imports completed successfully"
