from pydantic import BaseModel
from datetime import date
from typing import Optional

class SalesSummary(BaseModel):
    sales: float
    sales_volumes: int
    net_before_cogs: float
    net_profit: float
class SalesDataBase(BaseModel):
    date: date
    title: str
    account_title: str
    marketplace: str
    sku: str
    fnsku: Optional[str]
    asin: str
    parent_asin: Optional[str]
    is_parent: bool
    internal_name: Optional[str]
    brand: Optional[str]
    product_group: Optional[str]
    tags: Optional[str]
    active: bool
    orders: int
    canceled_orders: int
    units: int
    shipped: int
    refunded: int
    refund_percent: float
    promo_units: int
    non_promo_units: int
    promo_revenue: float
    non_promo_revenue: float
    ordered_product_sales: float
    customer_pays: float
    revenue: float
    per_unit_revenue: float
    fba_fees: float
    commissions: float
    promo_amount: float
    cogs: float
    shipping_cost: float
    miscellaneous_cost: float
    ooe: float
    reported_tax_vat: float
    internal_tax_vat: float
    withheld_tax: float
    remitting_tax: float
    net_profit: float
    net_margin: float
    net_roi: float
    ppc_orders: int
    ppc_impressions: int
    ppc_clicks: int
    ppc_sales: float
    ppc_cost: float
    tacos: float
    ppc_conv: float
    page_views: int
    sessions: int
    unit_session_percent: float
    ppc_product_sales: float
    ppc_product_cost: float
    ppc_product_clicks: int
    ppc_product_impressions: int
    ppc_video_sales: float
    ppc_video_cost: float
    ppc_video_clicks: int
    ppc_video_impressions: int

class SalesDataCreate(SalesDataBase):
    pass

class SalesData(BaseModel):
    asin: str
    title: str
    units: int
    revenue: float
    net_profit: float

    class Config:
        from_attributes = True

class SalesResponse(BaseModel):
    summary: SalesSummary
    details: list[SalesData]