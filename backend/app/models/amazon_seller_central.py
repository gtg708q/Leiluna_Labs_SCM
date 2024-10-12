from sqlalchemy import Column, Integer, String, Date, Float
from ..database import Base

class SalesAndTraffic(Base):
    __tablename__ = "sales_and_traffic"

    id = Column(Integer, primary_key=True, index=True)
    date = Column(Date, index=True)
    total_order_items = Column(Integer)
    ordered_product_sales = Column(Float)
    units_ordered = Column(Integer)

class InventoryFba(Base):
    __tablename__ = "inventory_fba"

    id = Column(Integer, primary_key=True, index=True)
    date = Column(Date, index=True)
    fnsku = Column(String, index=True)
    asin = Column(String, index=True)
    product_name = Column(String)
    total_supply_quantity = Column(Integer)
