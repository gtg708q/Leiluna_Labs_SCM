from pydantic import BaseModel, Field
from datetime import datetime
from typing import Optional, List

class PurchaseOrderBase(BaseModel):
    date_issued: Optional[datetime] = None
    reference: Optional[str] = None
    po_number: Optional[str] = None
    asin: Optional[str] = None
    bom_id: Optional[str] = None
    description: Optional[str] = None
    item_status_notes: Optional[str] = None
    category: Optional[str] = None
    product: Optional[str] = None
    qty: Optional[float] = None
    uom: Optional[str] = None
    supplier: Optional[str] = None
    status: Optional[str] = None
    estimated_mfg_completion_date: Optional[datetime] = None
    estimated_mfg_lead_time_days: Optional[int] = None
    estimated_shipping_lead_time_days: Optional[int] = None
    estimated_arrival_date: Optional[datetime] = None
    current_expected_arrival_date: Optional[datetime] = None
    actual_mfg_completion_date: Optional[datetime] = None
    actual_mfg_lead_time_days: Optional[int] = None
    actual_shipping_lead_time_days: Optional[int] = None
    actual_arrival_date: Optional[datetime] = None
    mfg_lead_time_variance: Optional[int] = None
    shipping_lead_time_variance: Optional[int] = None
    ship_to: Optional[str] = None
    confidential_for_novaeo_only: Optional[str] = None
    coa_for_customers: Optional[str] = None
    mfg_date: Optional[datetime] = None
    expiry_date: Optional[datetime] = None
    unit_price: Optional[float] = None
    amount: Optional[float] = None
    freight: Optional[float] = None
    duty_taxes: Optional[float] = None
    other_charges: Optional[float] = None
    total_amount: Optional[float] = None
    landed_cost_per_unit: Optional[float] = None
    payment_term: Optional[str] = None
    freight_term: Optional[str] = None
    invoice_no: Optional[str] = None
    down_payment: Optional[float] = None
    dp_due_date: Optional[datetime] = None
    dp_date_paid: Optional[datetime] = None
    balance_amount: Optional[float] = None
    balance_due_date: Optional[datetime] = None
    balance_paid_date: Optional[datetime] = None
    within_mfg_sla: Optional[bool] = None
    within_shipping_sla: Optional[bool] = None
    agreed_sla: Optional[int] = None
    delivery_tl: Optional[int] = None
    within_xsla: Optional[int] = None
    year: Optional[int] = None
    month: Optional[str] = None
    week: Optional[int] = None
    findings: Optional[str] = None
    type: Optional[str] = None
    isku_bom: Optional[str] = None
    status_2: Optional[str] = None
    created_at: Optional[datetime] = None
    updated_at: Optional[datetime] = None
    is_deleted: Optional[bool] = None

class PurchaseOrderCreate(PurchaseOrderBase):
    pass

class PurchaseOrder(PurchaseOrderBase):
    id: int

    class Config:
        from_attributes = True

class PurchaseOrderResponse(PurchaseOrder):
    pass

class PaginatedPurchaseOrderResponse(BaseModel):
    items: List[PurchaseOrderResponse]
    total: int
    page: int
    items_per_page: int
