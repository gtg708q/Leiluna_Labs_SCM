from ..database import Base

# Import all models here
from .bom import BOM, BOMChangeLog, BOMHistory
from .inventory import (
    TampaBOMInventory, FinishedGoods, FinishedGoodsInventory,
    TampaBOMInventoryChangeLog, FinishedGoodsChangeLog, FinishedGoodsInventoryChangeLog,
    TampaBOMInventoryHistory, FinishedGoodsHistory, FinishedGoodsInventoryHistory
)
from .purchase_order_log import PurchaseOrderLog
from .finished_goods_bom_component import FinishedGoodsBOMComponent
from .sales_per_day_per_product import SalesPerDayPerProduct
from .sales_statistics import SalesStatistics
from .inventory_dashboard import InventoryDashboard
from .inventory import FinishedGoods
from .inventory import FinishedGoodsInventory
from .inventory import TampaBOMInventory

# Ensure all models are imported here
__all__ = [
    'Base',
    'BOM', 'BOMChangeLog', 'BOMHistory',
    'TampaBOMInventory', 'FinishedGoods', 'FinishedGoodsInventory',
    'TampaBOMInventoryChangeLog', 'FinishedGoodsChangeLog', 'FinishedGoodsInventoryChangeLog',
    'TampaBOMInventoryHistory', 'FinishedGoodsHistory', 'FinishedGoodsInventoryHistory',
    'PurchaseOrderLog',
    'FinishedGoodsBOMComponent',
    'SalesPerDayPerProduct',
    'SalesStatistics'
]
