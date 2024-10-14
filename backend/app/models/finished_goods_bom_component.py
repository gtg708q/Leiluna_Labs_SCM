from sqlalchemy import Column, Integer, String, Float, ForeignKey
from sqlalchemy.orm import relationship
from app.database import Base  # Change this line

class FinishedGoodsBOMComponent(Base):
    __tablename__ = "finished_goods_bom_components"

    id = Column(Integer, primary_key=True, index=True)
    finished_good_id = Column(Integer, ForeignKey("finished_goods.id"))
    bom_id = Column(Integer, ForeignKey("boms.id"))
    quantity = Column(Float)

    finished_good = relationship("FinishedGoods", back_populates="bom_components")
    bom = relationship("BOM", back_populates="finished_goods_components")
