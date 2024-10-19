from pydantic import BaseModel
from typing import Optional
from datetime import datetime

class BOMSchema(BaseModel):
    id: int
    bom_id: str
    component_type: Optional[str]
    phx_class: Optional[str]
    supplier_manufacturer: Optional[str]
    address: Optional[str]
    email: Optional[str]
    contact_number: Optional[str]
    supplier_mfg_lt: Optional[int]
    transit_lt: Optional[int]
    amz_safety_days: Optional[int]
    wh_safety_days: Optional[int]
    po_issue_days: Optional[int]
    master_pack: Optional[int]
    moq: Optional[int]
    ordering_uom: Optional[str]
    unit_price: Optional[float]
    shipping_cost: Optional[float]
    landed_cost: Optional[float]
    conversion: Optional[float]
    converted_unit_price: Optional[float]
    ims_unit: Optional[str]
    supplier_payment_terms: Optional[str]
    product_link: Optional[str]
    supplier_product_id: Optional[str]
    description: Optional[str]
    remarks: Optional[str]
    alternative_supplier_1: Optional[str]
    alternative_supplier_2: Optional[str]
    monthly_usage: Optional[float]
    monthly_spend: Optional[float]
    total_lt_bom_master: Optional[int]
    comments: Optional[str]
    version: int
    created_at: datetime
    updated_at: Optional[datetime]
    is_deleted: bool

    class Config:
        orm_mode = True
