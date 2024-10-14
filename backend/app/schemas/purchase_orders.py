from pydantic import BaseModel, Field
from datetime import datetime
from typing import Optional

class PurchaseOrderBase(BaseModel):
    date_issued: Optional[datetime] = None
    reference: Optional[str] = None
    po_number: Optional[str] = None
    asin: Optional[str] = None
    bom_id: Optional[str] = None
    description: Optional[str] = None
    category: Optional[str] = None
    product: Optional[str] = None
    qty: Optional[float] = None
    uom: Optional[str] = None
    supplier: Optional[str] = None
    status: Optional[str] = None
    estimated_arrival_date: Optional[datetime] = None
    unit_price: Optional[float] = None
    landed_cost_per_unit: Optional[float] = None

class PurchaseOrderCreate(PurchaseOrderBase):
    pass

class PurchaseOrder(PurchaseOrderBase):
    id: int

    class Config:
        from_attributes = True

class PurchaseOrderResponse(BaseModel):
    id: int
    date_issued: Optional[datetime] = None
    reference: Optional[str] = None
    po_number: Optional[str] = None
    asin: Optional[str] = None
    bom_id: Optional[str] = None
    description: Optional[str] = None
    category: Optional[str] = None
    product: Optional[str] = None
    qty: Optional[float] = None
    uom: Optional[str] = None
    supplier: Optional[str] = None
    status: Optional[str] = None
    estimated_arrival_date: Optional[datetime] = None
    unit_price: Optional[float] = None
    landed_cost_per_unit: Optional[float] = None
    total_amount: Optional[float] = None
    # Add any other fields that are in your PurchaseOrderLog model

    class Config:
        from_attributes = True
        orm_mode = True  # This is for backwards compatibility with older versions of Pydantic
