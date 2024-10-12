from fastapi import APIRouter, Depends, Query, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy import func, desc, asc
from ..database import get_db
from ..models.sales import SalesData as SalesDataModel
from ..schemas.sales import SalesResponse, SalesSummary, SalesData
from datetime import date

router = APIRouter()

@router.get("/sales", response_model=SalesResponse)
def get_sales(
    start_date: date = Query(...),
    end_date: date = Query(...),
    page: int = Query(1, ge=1),
    items_per_page: int = Query(50, ge=1, le=100),
    sort_by: str = Query("net_profit", regex="^(asin|title|units|revenue|net_profit)$"),
    sort_order: str = Query("desc", regex="^(asc|desc)$"),
    db: Session = Depends(get_db)
):
    # Calculate summary
    summary_query = db.query(
        func.sum(SalesDataModel.revenue).label("sales"),
        func.sum(SalesDataModel.units).label("sales_volumes"),
        (func.sum(SalesDataModel.revenue) - func.sum(SalesDataModel.fba_fees) - func.sum(SalesDataModel.commissions) - func.sum(SalesDataModel.promo_amount)).label("net_before_cogs"),
        func.sum(SalesDataModel.net_profit).label("net_profit")
    ).filter(SalesDataModel.date.between(start_date, end_date)).first()

    summary = SalesSummary(
        sales=summary_query.sales or 0,
        sales_volumes=summary_query.sales_volumes or 0,
        net_before_cogs=summary_query.net_before_cogs or 0,
        net_profit=summary_query.net_profit or 0
    )

    # Get detailed data
    query = db.query(
        SalesDataModel.asin,
        func.max(SalesDataModel.title).label('title'),
        func.sum(SalesDataModel.units).label('units'),
        func.sum(SalesDataModel.revenue).label('revenue'),
        func.sum(SalesDataModel.net_profit).label('net_profit')
    ).filter(SalesDataModel.date.between(start_date, end_date)).group_by(SalesDataModel.asin)
    
    # Apply sorting
    if sort_by == 'title':
        # For title, we sort by the max title since it's a string
        query = query.order_by(desc(func.max(SalesDataModel.title)) if sort_order == 'desc' else asc(func.max(SalesDataModel.title)))
    elif sort_by in ['units', 'revenue', 'net_profit']:
        # For numeric columns, we can use sum
        query = query.order_by(desc(func.sum(getattr(SalesDataModel, sort_by))) if sort_order == 'desc' else asc(func.sum(getattr(SalesDataModel, sort_by))))
    else:  # asin
        query = query.order_by(desc(SalesDataModel.asin) if sort_order == 'desc' else asc(SalesDataModel.asin))
    
    # Apply pagination
    total_items = query.count()
    total_pages = (total_items + items_per_page - 1) // items_per_page
    query = query.offset((page - 1) * items_per_page).limit(items_per_page)

    details = [SalesData(
        asin=item.asin,
        title=item.title,
        units=item.units,
        revenue=item.revenue,
        net_profit=item.net_profit
    ) for item in query.all()]

    return SalesResponse(summary=summary, details=details)