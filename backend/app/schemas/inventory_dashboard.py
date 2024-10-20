from pydantic import BaseModel, Field
from typing import Optional, List
from datetime import date

class InventoryDashboardSchema(BaseModel):
    id: Optional[int] = None
    asin: Optional[str] = None
    isku: Optional[str] = None
    brand: Optional[str] = None
    phoenix_class: Optional[str] = None
    status: Optional[str] = None
    velocity_7d: Optional[float] = None
    velocity_14d: Optional[float] = None
    velocity_30d: Optional[float] = None
    velocity_60d: Optional[float] = None
    velocity_90d: Optional[float] = None
    velocity_180d: Optional[float] = None
    variance_7_14: Optional[float] = None
    variance_7_30: Optional[float] = None
    variance_7_60: Optional[float] = None
    variance_15_30: Optional[float] = None
    variance_15_60: Optional[float] = None
    variance_30_60: Optional[float] = None
    avg_7_30_60: Optional[float] = None
    max_7_30_60: Optional[float] = None
    reference_period: Optional[str] = None
    final_velocity: Optional[float] = None
    comments: Optional[str] = None
    fba_in_stock_qty: Optional[int] = None
    fba_in_stock_days: Optional[float] = None
    inbound_qty: Optional[int] = None
    reserved_qty: Optional[int] = None
    inbound_days: Optional[float] = None
    reserved_days: Optional[float] = None
    total_fba_qty: Optional[int] = None
    total_fba_days: Optional[float] = None
    lead_time: Optional[int] = None
    amz_safety_days: Optional[int] = None
    reorder_qty_days: Optional[int] = None
    reorder_point_days: Optional[int] = None
    reorder_point_qty: Optional[float] = None
    inventory_health: Optional[str] = None
    fo_qty: Optional[float] = None
    wh_qty: Optional[float] = None
    replenishment_type: Optional[str] = None
    fo_date: Optional[date] = None
    thirty_day_net_profit: Optional[float] = None

    class Config:
        from_attributes = True
        populate_by_name = True

class InventoryDashboardResponse(BaseModel):
    items: List[InventoryDashboardSchema]
    total: int
    page: int
    items_per_page: int
