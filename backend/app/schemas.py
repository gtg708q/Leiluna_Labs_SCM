from pydantic import BaseModel
from datetime import date
from typing import Optional

class SalesDataSchema(BaseModel):
    id: int
    date: date
    title: Optional[str]
    account_title: Optional[str]
    marketplace: Optional[str]
    sku: Optional[str]
    fnsku: Optional[str]
    asin: Optional[str]
    parent_asin: Optional[str]
    is_parent: Optional[bool]
    internal_name: Optional[str]
    brand: Optional[str]
    product_group: Optional[str]
    tags: Optional[str]
    active: Optional[bool]
    orders: Optional[int]
    canceled_orders: Optional[int]
    units: Optional[int]
    shipped: Optional[int]
    refunded: Optional[int]
    refund_percent: Optional[float]
    promo_units: Optional[int]
    non_promo_units: Optional[int]
    promo_revenue: Optional[float]
    non_promo_revenue: Optional[float]
    ordered_product_sales: Optional[float]
    customer_pays: Optional[float]
    revenue: Optional[float]
    per_unit_revenue: Optional[float]
    fba_fees: Optional[float]
    commissions: Optional[float]
    promo_amount: Optional[float]
    cogs: Optional[float]
    shipping_cost: Optional[float]
    miscellaneous_cost: Optional[float]
    ooe: Optional[float]
    reported_tax_vat: Optional[float]
    internal_tax_vat: Optional[float]
    withheld_tax: Optional[float]
    remitting_tax: Optional[float]
    net_profit: Optional[float]
    net_margin: Optional[float]
    net_roi: Optional[float]
    ppc_orders: Optional[int]
    ppc_impressions: Optional[int]
    ppc_clicks: Optional[int]
    ppc_sales: Optional[float]
    ppc_cost: Optional[float]
    tacos: Optional[float]
    ppc_conv: Optional[float]
    page_views: Optional[int]
    sessions: Optional[int]
    unit_session_percent: Optional[float]
    ppc_product_sales: Optional[float]
    ppc_product_cost: Optional[float]
    ppc_product_clicks: Optional[int]
    ppc_product_impressions: Optional[int]
    ppc_video_sales: Optional[float]
    ppc_video_cost: Optional[float]
    ppc_video_clicks: Optional[int]
    ppc_video_impressions: Optional[int]

    class Config:
        orm_mode = True

class SaleBase(BaseModel):
    date: date
    title: str
    account_title: str
    marketplace: str
    sku: str
    asin: str
    units: int
    revenue: float
    net_profit: float

class Sale(SaleBase):
    id: int

    class Config:
        from_attributes = True  # This replaces orm_mode=True in Pydantic v2
