import sys
import os

# Add the parent directory to sys.path
sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))

from sqlalchemy import Column, Integer, String, Float, Date
from app.database import Base

class SalesStatistics(Base):
    __tablename__ = 'sales_statistics'

    id = Column(Integer, primary_key=True)
    date = Column(Date)
    account_title = Column(String)
    sku = Column(String)
    asin = Column(String)
    orders = Column(Integer)
    units = Column(Integer)
    velocity = Column(Float)
    buybox_price = Column(Float)
    local_inventory = Column(Integer)
    in_stock = Column(Integer)
    ordered_product_sales = Column(Float)
    revenue = Column(Float)
    shipping_cost = Column(Float)
    commissions = Column(Float)
    miscellaneous_cost = Column(Float)
    cogs = Column(Float)
    fba_fees = Column(Float)
    promo_amount = Column(Float)
    ppc_sales = Column(Float)
    ppc_cost = Column(Float)
    tacos = Column(Float)
    net_profit = Column(Float)
    net_margin = Column(Float)
    net_roi = Column(Float)
    sales_rank = Column(String)
    inbound = Column(Integer)
    reserved = Column(Integer)
    in_transit = Column(Integer)
    in_warehouse = Column(Integer)
    taxes = Column(Float)
    condition = Column(String)
    currency = Column(String)

    def __repr__(self):
        return f"<SalesStatistics(id={self.id}, date='{self.date}', sku='{self.sku}')>"
