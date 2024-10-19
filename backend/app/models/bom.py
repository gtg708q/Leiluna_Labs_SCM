from sqlalchemy import Column, Integer, String, Float, DateTime, ForeignKey, Boolean
from sqlalchemy.sql import func
from sqlalchemy.orm import relationship
from ..database import Base  # Changed this line
import datetime

# Import FinishedGoodsBOMComponent
from .finished_goods_bom_component import FinishedGoodsBOMComponent

class BOM(Base):
    __tablename__ = "boms"

    id = Column(Integer, primary_key=True, index=True)
    bom_id = Column(String, unique=True, index=True)
    component_type = Column(String)
    phx_class = Column(String)
    supplier_manufacturer = Column(String)
    address = Column(String)
    email = Column(String)
    contact_number = Column(String)
    supplier_mfg_lt = Column(Integer)
    transit_lt = Column(Integer)
    amz_safety_days = Column(Integer)
    wh_safety_days = Column(Integer)
    po_issue_days = Column(Integer)
    master_pack = Column(Integer)
    moq = Column(Integer)
    ordering_uom = Column(String)
    unit_price = Column(Float)
    shipping_cost = Column(Float)
    landed_cost = Column(Float)
    conversion = Column(Float)
    converted_unit_price = Column(Float)
    ims_unit = Column(String)
    supplier_payment_terms = Column(String)
    product_link = Column(String)
    supplier_product_id = Column(String)
    description = Column(String)
    remarks = Column(String)
    alternative_supplier_1 = Column(String)
    alternative_supplier_2 = Column(String)
    monthly_usage = Column(Float)
    monthly_spend = Column(Float)
    total_lt_bom_master = Column(Integer)
    comments = Column(String)
    version = Column(Integer, default=1)
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())
    is_deleted = Column(Boolean, default=False)
    
    changes = relationship("BOMChangeLog", back_populates="bom")
    history = relationship("BOMHistory", back_populates="bom")
    tampa_inventory = relationship("TampaBOMInventory", back_populates="bom")
    finished_goods_components = relationship("FinishedGoodsBOMComponent", back_populates="bom")
    purchase_orders = relationship("PurchaseOrderLog", back_populates="bom")

class BOMChangeLog(Base):
    __tablename__ = 'bom_change_log'

    id = Column(Integer, primary_key=True, index=True)
    bom_id = Column(Integer, ForeignKey('boms.id'))
    field_name = Column(String)
    old_value = Column(String)
    new_value = Column(String)
    change_type = Column(String)  # 'update', 'create', or 'delete'
    timestamp = Column(DateTime, default=datetime.datetime.utcnow)
    is_deleted = Column(Boolean, default=False)

    bom = relationship("BOM", back_populates="changes")

class BOMHistory(Base):
    __tablename__ = 'bom_history'

    id = Column(Integer, primary_key=True, index=True)
    bom_id = Column(Integer, ForeignKey('boms.id'))
    component_type = Column(String)
    phx_class = Column(String)
    supplier_manufacturer = Column(String)
    address = Column(String)
    email = Column(String)
    contact_number = Column(String)
    supplier_mfg_lt = Column(Integer)
    transit_lt = Column(Integer)
    amz_safety_days = Column(Integer)
    wh_safety_days = Column(Integer)
    po_issue_days = Column(Integer)
    master_pack = Column(Integer)
    moq = Column(Integer)
    ordering_uom = Column(String)
    unit_price = Column(Float)
    shipping_cost = Column(Float)
    landed_cost = Column(Float)
    conversion = Column(Float)
    converted_unit_price = Column(Float)
    ims_unit = Column(String)
    supplier_payment_terms = Column(String)
    product_link = Column(String)
    supplier_product_id = Column(String)
    description = Column(String)
    remarks = Column(String)
    alternative_supplier_1 = Column(String)
    alternative_supplier_2 = Column(String)
    monthly_usage = Column(Float)
    monthly_spend = Column(Float)
    total_lt_bom_master = Column(Integer)
    comments = Column(String)
    version = Column(Integer)
    timestamp = Column(DateTime, default=datetime.datetime.utcnow)
    is_deleted = Column(Boolean, default=False)

    bom = relationship("BOM", back_populates="history")
