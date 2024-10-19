from pydantic import BaseModel, Field
from typing import List, Optional

class SalesSummary(BaseModel):
    gross_sales: float = Field(default=0.0)
    revenue: float = Field(default=0.0)
    orders: int = Field(default=0)
    units: int = Field(default=0)
    refunds: int = Field(default=0)
    cogs: float = Field(default=0.0)
    ppc_cost: float = Field(default=0.0)
    net_profit: float = Field(default=0.0)
    net_before_cogs: float = Field(default=0.0)

class SalesData(BaseModel):
    id: str
    accounts: List[str] = Field(default_factory=list)
    sku: List[str] = Field(default_factory=list)
    fnsku: List[str] = Field(default_factory=list)
    brand: List[str] = Field(default_factory=list)
    orders: int = Field(default=0)
    units: int = Field(default=0)
    canceled_orders: int = Field(default=0)
    shipped: int = Field(default=0)
    refunded: int = Field(default=0)
    promo_units: int = Field(default=0)
    non_promo_units: int = Field(default=0)
    non_promo_revenue: float = Field(default=0.0)
    sales: float = Field(default=0.0)
    fba_commissions: float = Field(default=0.0)
    commissions: float = Field(default=0.0)
    cogs: float = Field(default=0.0)
    net_profit: float = Field(default=0.0)
    ppc_orders: int = Field(default=0)
    ppc_impressions: int = Field(default=0)
    ppc_clicks: int = Field(default=0)
    ppc_sales: float = Field(default=0.0)
    ppc_cost: float = Field(default=0.0)
    tacos: float = Field(default=0.0)
    ppc_conversions: float = Field(default=0.0)
    page_views: int = Field(default=0)
    sessions: int = Field(default=0)
    unit_session_percentage: float = Field(default=0.0)
    ppc_product_sales: float = Field(default=0.0)
    ppc_product_cost: float = Field(default=0.0)
    ppc_product_clicks: int = Field(default=0)
    ppc_product_impressions: int = Field(default=0)
    ppc_video_sales: float = Field(default=0.0)
    ppc_video_cost: float = Field(default=0.0)
    ppc_video_clicks: int = Field(default=0)
    ppc_video_impressions: int = Field(default=0)
    revenue: float = Field(default=0.0)
    velocity: float = Field(default=0.0)

    class Config:
        from_attributes = True

class SalesResponse(BaseModel):
    summary: SalesSummary
    details: List[SalesData]
    total_pages: int
    current_page: int
