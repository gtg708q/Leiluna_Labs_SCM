from fastapi import APIRouter, Depends, HTTPException, Body
from sqlalchemy.orm import Session
from backend.app.database import get_db
from backend.app.import_sales_data import main as import_sales_data
from backend.app.import_sales_statistics import main as import_sales_statistics
from backend.app.data_import.bom_import import import_boms
from backend.app.run_purchase_order_import import run_purchase_order_import
from backend.app.run_imports import run_finished_goods_import, run_bom_inventory_import, run_finished_goods_inventory_import
from backend.app.models.import_log import ImportLog
import asyncio
from datetime import datetime
import logging
from pydantic import BaseModel

logger = logging.getLogger(__name__)

router = APIRouter()

class ImportRequest(BaseModel):
    import_name: str

@router.post("/run")
async def run_import(request: ImportRequest, db: Session = Depends(get_db)):
    logger.info(f"Received import request for: {request.import_name}")
    try:
        if request.import_name == "Sales Data":
            result = await asyncio.to_thread(import_sales_data)
        elif request.import_name == "Sales Statistics":
            result = await asyncio.to_thread(import_sales_statistics)
        elif request.import_name == "BOMs":
            result = await asyncio.to_thread(import_boms, db, is_initial_import=False)
        elif request.import_name == "Finished Goods":
            result = await asyncio.to_thread(run_finished_goods_import)
        elif request.import_name == "BOM Inventory":
            result = await asyncio.to_thread(run_bom_inventory_import)
        elif request.import_name == "Finished Goods Inventory":
            result = await asyncio.to_thread(run_finished_goods_inventory_import)
        elif request.import_name == "Purchase Orders":
            result = await asyncio.to_thread(run_purchase_order_import, is_initial_import=False)
        else:
            raise HTTPException(status_code=400, detail="Invalid import name")
        
        # Check if result contains an error
        if isinstance(result, dict) and "error" in result:
            raise HTTPException(status_code=500, detail=result["error"])
        
        # Update the last import date in the database
        import_log = db.query(ImportLog).filter(ImportLog.import_name == request.import_name).first()
        if import_log:
            import_log.last_import_date = datetime.now()
        else:
            import_log = ImportLog(import_name=request.import_name, last_import_date=datetime.now())
            db.add(import_log)
        db.commit()
        
        logger.info(f"Import completed successfully for: {request.import_name}")
        return {"message": f"Import {request.import_name} completed successfully", "details": result}
    except Exception as e:
        logger.error(f"Error during import of {request.import_name}: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/last-date/{import_name}")
async def get_last_import_date(import_name: str, db: Session = Depends(get_db)):
    logger.info(f"Received request for last import date of: {import_name}")
    import_log = db.query(ImportLog).filter(ImportLog.import_name == import_name).first()
    if import_log:
        return {"lastImportDate": import_log.last_import_date.isoformat()}
    return {"lastImportDate": None}
