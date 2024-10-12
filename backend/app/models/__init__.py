from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

from .sales import SalesData
# Import other models here
