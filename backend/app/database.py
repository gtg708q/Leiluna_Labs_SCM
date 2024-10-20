import os
from dotenv import load_dotenv
import logging
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base
from sqlalchemy.sql import text
import psycopg2
from sqlalchemy.engine.url import URL
import time

# Load environment variables
load_dotenv()

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

# Use environment variables for sensitive information
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_NAME = os.getenv("DB_NAME")
DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")

print(f"DB_USER: {DB_USER}")
print(f"DB_PASSWORD: {'*' * len(DB_PASSWORD) if DB_PASSWORD else 'Not set'}")
print(f"DB_NAME: {DB_NAME}")
print(f"DB_HOST: {DB_HOST}")
print(f"DB_PORT: {DB_PORT}")

# Construct the database URL
DATABASE_URL = URL.create(
    drivername="postgresql",
    username=DB_USER,
    password=DB_PASSWORD,
    host=DB_HOST,
    port=DB_PORT,
    database=DB_NAME
)

print(f"DATABASE_URL: {DATABASE_URL}")  # This will print the URL without the password

engine = create_engine(DATABASE_URL, connect_args={"connect_timeout": 5})
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

def create_tables():
    # Import all models here to avoid circular imports
    from backend.app.models import (
        BOM, TampaBOMInventory, FinishedGoods, 
        FinishedGoodsInventory, TampaBOMInventoryChangeLog, FinishedGoodsChangeLog, 
        FinishedGoodsInventoryChangeLog, TampaBOMInventoryHistory, FinishedGoodsHistory, 
        FinishedGoodsInventoryHistory, PurchaseOrderLog, SalesPerDayPerProduct, SalesStatistics
    )

    Base.metadata.create_all(bind=engine)

def test_db_connection():
    try:
        # Try to connect using psycopg2 directly
        conn = psycopg2.connect(
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD,
            host=DB_HOST,
            port=DB_PORT,
            connect_timeout=5
        )
        print("Successfully connected to the database using psycopg2!")
        conn.close()

        # Now try with SQLAlchemy
        print("Attempting SQLAlchemy connection...")
        start_time = time.time()
        db = SessionLocal()
        result = db.execute(text("SELECT 1")).scalar()
        end_time = time.time()
        if result == 1:
            print(f"Successfully connected to the database using SQLAlchemy! (Time taken: {end_time - start_time:.2f} seconds)")
        else:
            print("Connected to the database using SQLAlchemy, but received unexpected result.")
        db.close()
    except psycopg2.Error as e:
        print(f"Error connecting with psycopg2: {e}")
    except Exception as e:
        print(f"Error connecting to the database: {e}")
        logger.exception("Detailed error information:")

if __name__ == "__main__":
    test_db_connection()




