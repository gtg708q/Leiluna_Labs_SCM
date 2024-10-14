from sqlalchemy import Column, Integer, String, Float, DateTime, ForeignKey, Boolean
from sqlalchemy.orm import relationship
from app.database import Base
from sqlalchemy.sql import func
from .bom import BOM 

class TampaBOMInventory(Base):
    __tablename__ = "tampa_bom_inventory"

    id = Column(Integer, primary_key=True, index=True)
    bom_id = Column(String, ForeignKey("boms.bom_id"), index=True)
    type = Column(String)
    phx_class = Column(String)
    theoretical_qty = Column(Float)
    location = Column(String)
    cycle_count = Column(Float)
    date_counted = Column(DateTime)
    uom = Column(String)
    theo_x_actual_variance = Column(Float)
    past_30_mo = Column(Float)
    past_30_fo = Column(Float)
    manufactured_fulfilled = Column(Float)
    used_for_mfg_after_actual = Column(Float)
    conversion = Column(Float)
    received_qty_after_actual_count = Column(Float)
    ranking = Column(Integer)
    current_internal_lot_number = Column(String)
    used_in_ihf_shipstation_after_count = Column(Float)
    theo_count_static = Column(Float)
    actual_count = Column(Float)
    wh_remarks = Column(String)
    variance = Column(Float)
    random_count = Column(Float)
    subtype = Column(String)
    is_deleted = Column(Boolean, default=False)

    bom = relationship("BOM", back_populates="tampa_inventory")

class FinishedGoods(Base):
    __tablename__ = "finished_goods"

    id = Column(Integer, primary_key=True, index=True)
    isku = Column(String, unique=True, index=True)
    asin = Column(String)
    common_name = Column(String)
    phoenix_class = Column(String)
    brand = Column(String)
    size = Column(String)
    material_cost = Column(Float)
    labor_cost = Column(Float)
    total_unit_cost = Column(Float)
    replenishment_type = Column(String)
    manufacturing_class = Column(String)
    lead_time = Column(Integer)
    amz_safety_days = Column(Integer)
    wh_safety_days = Column(Integer)
    reorder_qty_days = Column(Integer)
    similar = Column(Integer, nullable=True)
    in_bom_mapping = Column(Boolean)
    duplicate_asin = Column(Boolean)
    count_tkfg = Column(Integer)
    status = Column(String)
    batch_run = Column(String)
    is_deleted = Column(Boolean, default=False)

    inventory = relationship("FinishedGoodsInventory", back_populates="finished_good")
    bom_components = relationship("FinishedGoodsBOMComponent", back_populates="finished_good")

class FinishedGoodsInventory(Base):
    __tablename__ = "finished_goods_inventory"

    id = Column(Integer, primary_key=True, index=True)
    isku = Column(String, ForeignKey("finished_goods.isku"), index=True)
    brand = Column(String)
    phx_class = Column(String)
    theoretical_qty = Column(Float)
    location = Column(String)
    actual_count = Column(Float)
    date_counted = Column(DateTime)
    uom = Column(String)
    mfg_after_date_counted = Column(Float)
    received_qty_after_actual_count = Column(Float)
    fo_after_date_counted = Column(Float)
    fo_after_date_counted_from_bundles = Column(Float)
    ihf_after_date_counted = Column(Float)
    duplicate = Column(Boolean)
    asin = Column(String)
    fba_veloz_ranking = Column(Integer)
    past_30_mo = Column(Float)
    past_30_fo = Column(Float)
    manufactured_fulfilled = Column(Float)
    theo_count_static = Column(Float)
    actual_count_2 = Column(Float)
    date_counted_2 = Column(DateTime)
    warehouse_remarks = Column(String)
    variance = Column(Float)
    not_in_wir_fg = Column(String)
    category = Column(String)
    is_deleted = Column(Boolean, default=False)

    finished_good = relationship("FinishedGoods", back_populates="inventory")

class TampaBOMInventoryChangeLog(Base):
    __tablename__ = "tampa_bom_inventory_change_log"

    id = Column(Integer, primary_key=True, index=True)
    inventory_id = Column(Integer, ForeignKey("tampa_bom_inventory.id"))
    field_name = Column(String)
    old_value = Column(String)
    new_value = Column(String)
    changed_at = Column(DateTime(timezone=True), server_default=func.now())
    changed_by = Column(String)
    is_deleted = Column(Boolean, default=False)

class TampaBOMInventoryHistory(Base):
    __tablename__ = "tampa_bom_inventory_history"

    id = Column(Integer, primary_key=True, index=True)
    inventory_id = Column(Integer, ForeignKey("tampa_bom_inventory.id"))
    bom_id = Column(String)
    type = Column(String)
    theoretical_qty = Column(Float)
    actual_count = Column(Float)
    date_counted = Column(DateTime)
    recorded_at = Column(DateTime(timezone=True), server_default=func.now())
    is_deleted = Column(Boolean, default=False)

class FinishedGoodsChangeLog(Base):
    __tablename__ = "finished_goods_change_log"

    id = Column(Integer, primary_key=True, index=True)
    finished_goods_id = Column(Integer, ForeignKey("finished_goods.id"))
    field_name = Column(String)
    old_value = Column(String)
    new_value = Column(String)
    changed_at = Column(DateTime(timezone=True), server_default=func.now())
    changed_by = Column(String)
    is_deleted = Column(Boolean, default=False)

class FinishedGoodsHistory(Base):
    __tablename__ = "finished_goods_history"

    id = Column(Integer, primary_key=True, index=True)
    finished_goods_id = Column(Integer, ForeignKey("finished_goods.id"))
    isku = Column(String)
    common_name = Column(String)
    total_unit_cost = Column(Float)
    status = Column(String)
    recorded_at = Column(DateTime(timezone=True), server_default=func.now())
    is_deleted = Column(Boolean, default=False)

class FinishedGoodsInventoryChangeLog(Base):
    __tablename__ = "finished_goods_inventory_change_log"

    id = Column(Integer, primary_key=True, index=True)
    inventory_id = Column(Integer, ForeignKey("finished_goods_inventory.id"))
    field_name = Column(String)
    old_value = Column(String)
    new_value = Column(String)
    changed_at = Column(DateTime(timezone=True), server_default=func.now())
    changed_by = Column(String)
    is_deleted = Column(Boolean, default=False)

class FinishedGoodsInventoryHistory(Base):
    __tablename__ = "finished_goods_inventory_history"

    id = Column(Integer, primary_key=True, index=True)
    inventory_id = Column(Integer, ForeignKey("finished_goods_inventory.id"))
    isku = Column(String)
    theoretical_qty = Column(Float)
    actual_count = Column(Float)
    date_counted = Column(DateTime)
    recorded_at = Column(DateTime(timezone=True), server_default=func.now())
    is_deleted = Column(Boolean, default=False)
