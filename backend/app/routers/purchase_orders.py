from fastapi import APIRouter, Depends, Query, HTTPException
from sqlalchemy.orm import Session
from ..database import get_db
from ..models.purchase_order_log import PurchaseOrderLog
from ..schemas.purchase_orders import PurchaseOrderResponse, PaginatedPurchaseOrderResponse
from typing import List, Optional
from datetime import date

router = APIRouter()

@router.get("/purchase-orders", response_model=PaginatedPurchaseOrderResponse)
def get_purchase_orders(
    page: int = Query(1, ge=1),
    items_per_page: int = Query(20, ge=1, le=100),
    start_date: date = Query(None),
    end_date: date = Query(None),
    status: Optional[str] = Query(None),
    db: Session = Depends(get_db)
):
    try:
        query = db.query(PurchaseOrderLog)

        if start_date and end_date:
            query = query.filter(PurchaseOrderLog.date_issued.between(start_date, end_date))
        elif start_date:
            query = query.filter(PurchaseOrderLog.date_issued >= start_date)
        elif end_date:
            query = query.filter(PurchaseOrderLog.date_issued <= end_date)

        if status:
            query = query.filter(PurchaseOrderLog.status == status)

        total_count = query.count()
        skip = (page - 1) * items_per_page
        purchase_orders = query.order_by(PurchaseOrderLog.date_issued.desc()).offset(skip).limit(items_per_page).all()

        return {
            "items": [PurchaseOrderResponse.from_orm(po) for po in purchase_orders],
            "total": total_count,
            "page": page,
            "items_per_page": items_per_page
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"An error occurred: {str(e)}")

@router.get("/purchase-orders/columns")
def get_purchase_order_columns():
    return [column.key for column in PurchaseOrderLog.__table__.columns]

@router.get("/purchase-orders/{po_id}", response_model=PurchaseOrderResponse)
def get_purchase_order(po_id: int, db: Session = Depends(get_db)):
    try:
        purchase_order = db.query(PurchaseOrderLog).filter(PurchaseOrderLog.id == po_id).first()
        if purchase_order is None:
            raise HTTPException(status_code=404, detail="Purchase order not found")
        return PurchaseOrderResponse.from_orm(purchase_order)
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"An error occurred: {str(e)}")
