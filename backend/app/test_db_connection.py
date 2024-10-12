from sqlalchemy import create_engine

SQLALCHEMY_DATABASE_URL = "postgresql://derrek:derrek@localhost/first_database"

engine = create_engine(SQLALCHEMY_DATABASE_URL)

try:
    with engine.connect() as connection:
        print("Connected to the database successfully.")
except Exception as e:
    print(f"Failed to connect to the database: {e}")
