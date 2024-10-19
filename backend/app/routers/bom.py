from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from ..database import get_db
from ..models.bom import BOM
from ..schemas.bom import BOMSchema
from ..data_import.bom_import import import_boms
from ..utils.logger import bom_logger

router = APIRouter()

@router.post("/import")
def import_bom_data(db: Session = Depends(get_db)):
    try:
        import_boms()
        return {"message": "BOM data imported successfully"}
    except Exception as e:
        bom_logger.error(f"Error during BOM import API call: {e}")
        raise HTTPException(status_code=500, detail="Internal server error during BOM import")

@router.get("/boms", response_model=list[BOMSchema])
def get_boms(db: Session = Depends(get_db)):
    try:
        boms = db.query(BOM).all()  # Fetch all BOMs without limit
        return boms
    except Exception as e:
        bom_logger.error(f"Error fetching BOMs: {e}")
        raise HTTPException(status_code=500, detail="Internal server error fetching BOMs")
