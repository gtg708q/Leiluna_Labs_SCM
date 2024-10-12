from sqlalchemy.orm import Session
from ..models.bom import BOM, BOMHistory, BOMChangeLog

def log_bom_change(db: Session, bom_id: int, field_name: str, old_value: str, new_value: str):
    change_log = BOMChangeLog(
        bom_id=bom_id,
        field_name=field_name,
        old_value=old_value,
        new_value=new_value,
        change_type='update'
    )
    db.add(change_log)

def create_bom_history(db: Session, bom: BOM):
    bom_dict = {c.name: getattr(bom, c.name) for c in bom.__table__.columns 
                if c.name not in ['id', 'bom_id', 'created_at', 'updated_at']}
    history = BOMHistory(**bom_dict, bom_id=bom.id)
    db.add(history)