from sqlalchemy import Column, Integer, String, DateTime
from ..database import Base

class ImportLog(Base):
    __tablename__ = "import_logs"

    id = Column(Integer, primary_key=True, index=True)
    import_name = Column(String, unique=True, index=True)
    last_import_date = Column(DateTime)
