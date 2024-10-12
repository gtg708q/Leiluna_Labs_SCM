from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

SQLALCHEMY_DATABASE_URL = "postgresql://derrek:derrek@localhost/first_database"

engine = create_engine(SQLALCHEMY_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Import all models here
from .models.amazon_seller_central import SalesAndTraffic, InventoryFba
from .models.bom import BOM
from .models.inventory import (
    TampaBOMInventory, FinishedGoods, FinishedGoodsInventory,
    TampaBOMInventoryChangeLog, FinishedGoodsChangeLog, FinishedGoodsInventoryChangeLog,
    TampaBOMInventoryHistory, FinishedGoodsHistory, FinishedGoodsInventoryHistory
)

def create_tables():
    Base.metadata.create_all(bind=engine)

# Create the tables
create_tables()


