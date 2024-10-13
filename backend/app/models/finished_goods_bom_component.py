from sqlalchemy import Column, Integer, String, Float, ForeignKey
from sqlalchemy.orm import relationship
from backend.app.database import Base

class FinishedGoodsBOMComponent(Base):
    __tablename__ = "finished_goods_bom_components"

    id = Column(Integer, primary_key=True, index=True)
    isku = Column(String, ForeignKey("finished_goods.isku"), index=True)
    bom_id = Column(String, ForeignKey("boms.bom_id"), index=True)
    quantity = Column(Float)
    component_type = Column(String)
    material_unit_price = Column(Float)
    per_fg_price = Column(Float)
    bom_class = Column(String)
    status = Column(String)

    finished_good = relationship("FinishedGoods", back_populates="bom_components")
    bom = relationship("BOM", back_populates="finished_goods_components")
