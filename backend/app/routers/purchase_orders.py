from fastapi import APIRouter, Depends, Query, HTTPException
from sqlalchemy.orm import Session
from ..database import get_db
from ..models.purchase_order_log import PurchaseOrderLog
from ..schemas.purchase_orders import PurchaseOrderResponse
from typing import List

router = APIRouter()

@router.get("/purchase-orders", response_model=List[PurchaseOrderResponse])
def get_purchase_orders(
    page: int = Query(1, ge=1),
    items_per_page: int = Query(10, ge=1, le=100),
    db: Session = Depends(get_db)
):
    try:
        skip = (page - 1) * items_per_page
        purchase_orders = db.query(PurchaseOrderLog).offset(skip).limit(items_per_page).all()
        return [PurchaseOrderResponse.from_orm(po) for po in purchase_orders]
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"An error occurred: {str(e)}")

@router.get("/purchase-orders/{po_id}", response_model=PurchaseOrderResponse)
def get_purchase_order(po_id: int, db: Session = Depends(get_db)):
    try:
        purchase_order = db.query(PurchaseOrderLog).filter(PurchaseOrderLog.id == po_id).first()
        if purchase_order is None:
            raise HTTPException(status_code=404, detail="Purchase order not found")
        return PurchaseOrderResponse.from_orm(purchase_order)
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"An error occurred: {str(e)}")
