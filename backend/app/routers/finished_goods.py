from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List
from app.database import get_db
from app.models.inventory import FinishedGoods
from app.schemas.finished_goods import FinishedGoodsOut

router = APIRouter()

@router.get("/api/v1/finished-goods", response_model=List[FinishedGoodsOut])
def get_finished_goods(db: Session = Depends(get_db)):
    return db.query(FinishedGoods).filter(FinishedGoods.is_deleted == False).all()
