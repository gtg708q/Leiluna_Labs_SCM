from fastapi import APIRouter, Depends, Query, HTTPException
from sqlalchemy.orm import Session
from typing import List, Optional
from ..database import get_db
from ..models.inventory_dashboard import InventoryDashboard
from ..schemas.inventory_dashboard import InventoryDashboardSchema, InventoryDashboardResponse
from sqlalchemy import desc, asc
import logging
import traceback

logger = logging.getLogger(__name__)

router = APIRouter()

@router.get("/inventory-dashboard", response_model=InventoryDashboardResponse)
def get_inventory_dashboard(
    db: Session = Depends(get_db),
    search: Optional[str] = None,
    status: Optional[str] = Query(None, description="Filter by status"),
    page: int = Query(1, ge=1),
    items_per_page: int = Query(20, ge=1, le=100),
    columns: Optional[List[str]] = Query(None),
    sort_by: Optional[str] = Query(None, description="Sorting criteria")
):
    try:
        logger.info(f"Received request with params: search={search}, status={status}, page={page}, items_per_page={items_per_page}, columns={columns}, sort_by={sort_by}")
        
        query = db.query(InventoryDashboard)
        logger.info(f"Initial query created")

        if search:
            query = query.filter(
                (InventoryDashboard.asin.ilike(f"%{search}%")) |
                (InventoryDashboard.isku.ilike(f"%{search}%")) |
                (InventoryDashboard.brand.ilike(f"%{search}%"))
            )
            logger.info(f"Applied search filter: {search}")

        if status:
            query = query.filter(InventoryDashboard.status == status)
            logger.info(f"Applied status filter: {status}")

        total = query.count()
        logger.info(f"Total items before pagination: {total}")
        
        # Handle sorting
        if sort_by:
            sort_criteria = []
            for sort in sort_by.split(';'):
                column, order = sort.split(',')
                if hasattr(InventoryDashboard, column):
                    sort_criteria.append(desc(getattr(InventoryDashboard, column)) if order == 'desc' else asc(getattr(InventoryDashboard, column)))
            if sort_criteria:
                query = query.order_by(*sort_criteria)
        else:
            query = query.order_by(desc(InventoryDashboard.final_velocity))

        logger.info("Applied sorting")

        items = query.offset((page - 1) * items_per_page).limit(items_per_page).all()
        logger.info(f"Retrieved {len(items)} items after pagination")

        if columns:
            columns = columns[0].split(',')  # Split the comma-separated string into a list
            serialized_items = [{col: getattr(item, col) for col in columns if hasattr(item, col)} for item in items]
            logger.info(f"Serialized items with specified columns: {columns}")
        else:
            serialized_items = [item.__dict__ for item in items]
            for item in serialized_items:
                item.pop('_sa_instance_state', None)
            logger.info("Serialized all item attributes")

        logger.info(f"Returning {len(serialized_items)} items")
        if serialized_items:
            logger.info(f"Sample item: {serialized_items[0]}")
        else:
            logger.info("No items to return")

        return {
            "items": serialized_items,
            "total": total,
            "page": page,
            "items_per_page": items_per_page
        }
    except Exception as e:
        logger.error(f"Error in get_inventory_dashboard: {str(e)}")
        logger.error(traceback.format_exc())
        raise HTTPException(status_code=500, detail=f"An error occurred: {str(e)}")

@router.get("/inventory-dashboard/columns")
def get_inventory_dashboard_columns():
    try:
        columns = [column.key for column in InventoryDashboard.__table__.columns]
        logger.info(f"Retrieved columns: {columns}")
        return columns
    except Exception as e:
        logger.error(f"Error in get_inventory_dashboard_columns: {str(e)}")
        logger.error(traceback.format_exc())
        raise HTTPException(status_code=500, detail=f"An error occurred: {str(e)}")

@router.get("/inventory-dashboard/statuses")
def get_inventory_dashboard_statuses(db: Session = Depends(get_db)):
    try:
        statuses = db.query(InventoryDashboard.status).distinct().filter(InventoryDashboard.status != None).all()
        status_list = [status[0] for status in statuses]
        logger.info(f"Retrieved statuses: {status_list}")
        return status_list
    except Exception as e:
        logger.error(f"Error in get_inventory_dashboard_statuses: {str(e)}")
        logger.error(traceback.format_exc())
        raise HTTPException(status_code=500, detail=f"An error occurred: {str(e)}")
