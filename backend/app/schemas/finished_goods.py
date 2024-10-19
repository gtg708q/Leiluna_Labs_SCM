from pydantic import BaseModel
from typing import Optional

class FinishedGoodsOut(BaseModel):
    id: int
    isku: str
    asin: Optional[str]
    common_name: Optional[str]
    phoenix_class: Optional[str]
    brand: Optional[str]
    size: Optional[str]
    material_cost: Optional[float]
    labor_cost: Optional[float]
    total_unit_cost: Optional[float]
    replenishment_type: Optional[str]
    manufacturing_class: Optional[str]
    lead_time: Optional[int]
    amz_safety_days: Optional[int]
    wh_safety_days: Optional[int]
    reorder_qty_days: Optional[int]
    status: Optional[str]

    class Config:
        orm_mode = True
