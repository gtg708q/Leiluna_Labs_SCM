from backend.app.data_import.bom_import import import_boms
from backend.app.database import SessionLocal
from backend.app.models.bom import BOM

if __name__ == "__main__":
    import_boms()
    print("BOM import completed")
    
    # Check if data was actually imported
    db = SessionLocal()
    count = db.query(BOM).count()
    print(f"Number of BOMs in database: {count}")
    
    # Print first few BOMs
    boms = db.query(BOM).limit(5).all()
    for bom in boms:
        print(f"BOM: {bom.bom_id}")
    
    db.close()
