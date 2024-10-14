from sqlalchemy import Column, Integer, String, Float, DateTime, ForeignKey, Boolean
from sqlalchemy.orm import relationship
from app.database import Base  # Change this line
from sqlalchemy.sql import func

class PurchaseOrderLog(Base):
    __tablename__ = "purchase_order_log"

    id = Column(Integer, primary_key=True, index=True)
    date_issued = Column(DateTime)
    reference = Column(String)
    po_number = Column(String, index=True)  # Changed to String to handle all PO number formats
    asin = Column(String)
    bom_id = Column(String, ForeignKey("boms.bom_id"), index=True)
    description = Column(String)
    item_status_notes = Column(String)
    category = Column(String)
    product = Column(String)
    qty = Column(Float)
    uom = Column(String)
    supplier = Column(String)  # Ensure this field is defined
    status = Column(String)
    estimated_mfg_completion_date = Column(DateTime)
    estimated_mfg_lead_time_days = Column(Integer)
    estimated_shipping_lead_time_days = Column(Integer)
    estimated_arrival_date = Column(DateTime)
    current_expected_arrival_date = Column(DateTime)
    actual_mfg_completion_date = Column(DateTime)
    actual_mfg_lead_time_days = Column(Integer)
    actual_shipping_lead_time_days = Column(Integer)
    actual_arrival_date = Column(DateTime)
    mfg_lead_time_variance = Column(Integer)
    shipping_lead_time_variance = Column(Integer)
    ship_to = Column(String)
    confidential_for_novaeo_only = Column(String)
    coa_for_customers = Column(String)
    mfg_date = Column(DateTime)
    expiry_date = Column(DateTime)
    unit_price = Column(Float)
    amount = Column(Float)
    freight = Column(Float)
    duty_taxes = Column(Float)
    other_charges = Column(Float)
    total_amount = Column(Float)
    landed_cost_per_unit = Column(Float)
    payment_term = Column(String)
    freight_term = Column(String)
    invoice_no = Column(String)
    down_payment = Column(Float)
    dp_due_date = Column(DateTime)
    dp_date_paid = Column(DateTime)
    balance_amount = Column(Float)
    balance_due_date = Column(DateTime)
    balance_paid_date = Column(DateTime)
    within_mfg_sla = Column(Boolean)
    within_shipping_sla = Column(Boolean)
    agreed_sla = Column(Integer)
    delivery_tl = Column(Integer)
    within_xsla = Column(Integer)
    year = Column(Integer)
    month = Column(String)
    week = Column(Integer)
    findings = Column(String)
    type = Column(String)
    isku_bom = Column(String)
    status_2 = Column(String)
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())
    is_deleted = Column(Boolean, default=False)

    bom = relationship("BOM", back_populates="purchase_orders")
