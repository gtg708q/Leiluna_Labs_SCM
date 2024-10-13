from sqlalchemy import create_engine
from backend.app.database import Base, engine
from backend.app.models.inventory import (
    TampaBOMInventory, FinishedGoods, FinishedGoodsInventory,
    TampaBOMInventoryChangeLog, FinishedGoodsChangeLog, FinishedGoodsInventoryChangeLog,
    TampaBOMInventoryHistory, FinishedGoodsHistory, FinishedGoodsInventoryHistory
)
from backend.app.models.bom import BOM, BOMChangeLog, BOMHistory
from backend.app.models.purchase_order_log import PurchaseOrderLog
from backend.app.models.finished_goods_bom_component import FinishedGoodsBOMComponent

def init_db():
    Base.metadata.create_all(bind=engine)
    print("Database schema created successfully.")

if __name__ == "__main__":
    init_db()
