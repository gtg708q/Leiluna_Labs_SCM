from fastapi import APIRouter, Depends, Query, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy import func, desc, asc, distinct, case
from typing import List
from ..database import get_db
from ..models.sales_per_day_per_product import SalesPerDayPerProduct
from ..schemas.sales import SalesResponse, SalesSummary, SalesData
from datetime import datetime, date
import traceback
import logging

logger = logging.getLogger(__name__)

router = APIRouter()

def format_currency(value):
    if value < 0:
        return f"-${abs(int(value)):,}"
    return f"${int(value):,}"

@router.get("/sales-per-day-per-product", response_model=SalesResponse)
def get_sales(
    start_date: str = Query(..., description="Start date in MM/DD/YY format"),
    end_date: str = Query(..., description="End date in MM/DD/YY format"),
    page: int = Query(1, ge=1),
    items_per_page: int = Query(100, ge=1, le=100),
    sort_by: str = Query("net_profit", regex="^(asin|title|units|revenue|net_profit)$"),
    sort_order: str = Query("desc", regex="^(asc|desc)$"),
    account_titles: List[str] = Query(None),
    search: str = Query(None),
    group_by: str = Query("asin", regex="^(asin|sku)$"),
    db: Session = Depends(get_db)
):
    try:
        logger.info(f"Received request with params: {locals()}")
        
        # Parse dates
        start_date = datetime.strptime(start_date, "%m/%d/%y").date()
        end_date = datetime.strptime(end_date, "%m/%d/%y").date()

        # Base query
        base_query = db.query(SalesPerDayPerProduct).filter(
            SalesPerDayPerProduct.date.between(start_date, end_date)
        )

        if account_titles and 'all' not in account_titles:
            base_query = base_query.filter(SalesPerDayPerProduct.account_title.in_(account_titles))
        if search:
            base_query = base_query.filter(SalesPerDayPerProduct.title.ilike(f"%{search}%"))

        # Calculate summary
        summary_query = base_query.with_entities(
            func.sum(SalesPerDayPerProduct.ordered_product_sales).label("gross_sales"),
            func.sum(SalesPerDayPerProduct.revenue).label("revenue"),
            func.sum(SalesPerDayPerProduct.orders).label("orders"),
            func.sum(SalesPerDayPerProduct.units).label("units"),
            func.sum(SalesPerDayPerProduct.refunded).label("refunds"),
            func.sum(SalesPerDayPerProduct.cogs).label("cogs"),
            func.sum(SalesPerDayPerProduct.ppc_cost).label("ppc_cost"),
            func.sum(SalesPerDayPerProduct.net_profit).label("net_profit"),
            (func.sum(SalesPerDayPerProduct.revenue) - func.sum(SalesPerDayPerProduct.fba_fees) - func.sum(SalesPerDayPerProduct.commissions) - func.sum(SalesPerDayPerProduct.promo_amount)).label("net_before_cogs"),
        )
        
        summary_result = summary_query.first()
        logger.info(f"Summary result: {summary_result}")

        summary = SalesSummary(
            gross_sales=summary_result.gross_sales or 0,
            revenue=summary_result.revenue or 0,
            orders=summary_result.orders or 0,
            units=summary_result.units or 0,
            refunds=summary_result.refunds or 0,
            cogs=summary_result.cogs or 0,
            ppc_cost=summary_result.ppc_cost or 0,
            net_profit=summary_result.net_profit or 0,
            net_before_cogs=summary_result.net_before_cogs or 0
        )

        # Calculate the number of days in the date range
        days_in_range = (end_date - start_date).days + 1

        # Group and aggregate data
        group_column = getattr(SalesPerDayPerProduct, group_by)
        query = base_query.group_by(group_column).with_entities(
            group_column.label('id'),
            func.array_agg(distinct(SalesPerDayPerProduct.account_title)).label('accounts'),
            func.array_agg(distinct(SalesPerDayPerProduct.sku)).label('sku'),
            func.array_agg(distinct(SalesPerDayPerProduct.fnsku)).label('fnsku'),
            func.array_agg(distinct(SalesPerDayPerProduct.brand)).label('brand'),
            func.sum(SalesPerDayPerProduct.orders).label('orders'),
            func.sum(SalesPerDayPerProduct.units).label('units'),
            func.sum(SalesPerDayPerProduct.canceled_orders).label('canceled_orders'),
            func.sum(SalesPerDayPerProduct.shipped).label('shipped'),
            func.sum(SalesPerDayPerProduct.refunded).label('refunded'),
            func.sum(SalesPerDayPerProduct.promo_units).label('promo_units'),
            func.sum(SalesPerDayPerProduct.non_promo_units).label('non_promo_units'),
            func.sum(SalesPerDayPerProduct.non_promo_revenue).label('non_promo_revenue'),
            func.sum(SalesPerDayPerProduct.ordered_product_sales).label('sales'),
            func.sum(SalesPerDayPerProduct.fba_fees).label('fba_commissions'),
            func.sum(SalesPerDayPerProduct.commissions).label('commissions'),
            func.sum(SalesPerDayPerProduct.cogs).label('cogs'),
            func.sum(SalesPerDayPerProduct.net_profit).label('net_profit'),
            func.sum(SalesPerDayPerProduct.ppc_orders).label('ppc_orders'),
            func.sum(SalesPerDayPerProduct.ppc_impressions).label('ppc_impressions'),
            func.sum(SalesPerDayPerProduct.ppc_clicks).label('ppc_clicks'),
            func.sum(SalesPerDayPerProduct.ppc_sales).label('ppc_sales'),
            func.sum(SalesPerDayPerProduct.ppc_cost).label('ppc_cost'),
            case(
                (func.sum(SalesPerDayPerProduct.ordered_product_sales) == 0, 0),
                else_=func.sum(SalesPerDayPerProduct.ppc_cost) / func.sum(SalesPerDayPerProduct.ordered_product_sales)
            ).label('tacos'),
            func.sum(SalesPerDayPerProduct.ppc_conv).label('ppc_conversions'),
            func.sum(SalesPerDayPerProduct.page_views).label('page_views'),
            func.sum(SalesPerDayPerProduct.sessions).label('sessions'),
            case(
                (func.sum(SalesPerDayPerProduct.page_views) == 0, 0),
                else_=func.sum(SalesPerDayPerProduct.ordered_product_sales) / func.sum(SalesPerDayPerProduct.page_views)
            ).label('unit_session_percentage'),
            func.sum(SalesPerDayPerProduct.ppc_product_sales).label('ppc_product_sales'),
            func.sum(SalesPerDayPerProduct.ppc_product_cost).label('ppc_product_cost'),
            func.sum(SalesPerDayPerProduct.ppc_product_clicks).label('ppc_product_clicks'),
            func.sum(SalesPerDayPerProduct.ppc_product_impressions).label('ppc_product_impressions'),
            func.sum(SalesPerDayPerProduct.ppc_video_sales).label('ppc_video_sales'),
            func.sum(SalesPerDayPerProduct.ppc_video_cost).label('ppc_video_cost'),
            func.sum(SalesPerDayPerProduct.ppc_video_clicks).label('ppc_video_clicks'),
            func.sum(SalesPerDayPerProduct.ppc_video_impressions).label('ppc_video_impressions'),
            func.sum(SalesPerDayPerProduct.revenue).label('revenue'),
            (func.sum(SalesPerDayPerProduct.units) / days_in_range).label('velocity'),
        )

        # Apply sorting
        if sort_by == group_by:
            sort_column = group_column
        else:
            sort_column = func.sum(getattr(SalesPerDayPerProduct, sort_by))
        query = query.order_by(desc(sort_column) if sort_order == 'desc' else asc(sort_column))

        # Get total count for pagination
        total_items = query.count()
        total_pages = (total_items + items_per_page - 1) // items_per_page

        # Apply pagination
        query = query.offset((page - 1) * items_per_page).limit(items_per_page)

        logger.info(f"Final query: {query}")
        results = query.all()
        logger.info(f"Number of results: {len(results)}")

        details = []
        for item in results:
            sales_data = SalesData(
                id=str(item.id),
                accounts=[a for a in item.accounts if a is not None],
                sku=[s for s in item.sku if s is not None],
                fnsku=[f for f in item.fnsku if f is not None],
                brand=[b for b in item.brand if b is not None],
                orders=item.orders or 0,
                units=item.units or 0,
                canceled_orders=item.canceled_orders or 0,
                shipped=item.shipped or 0,
                refunded=item.refunded or 0,
                promo_units=item.promo_units or 0,
                non_promo_units=item.non_promo_units or 0,
                non_promo_revenue=item.non_promo_revenue or 0,
                sales=item.sales or 0,
                fba_commissions=item.fba_commissions or 0,
                commissions=item.commissions or 0,
                cogs=item.cogs or 0,
                net_profit=item.net_profit or 0,
                ppc_orders=item.ppc_orders or 0,
                ppc_impressions=item.ppc_impressions or 0,
                ppc_clicks=item.ppc_clicks or 0,
                ppc_sales=item.ppc_sales or 0,
                ppc_cost=item.ppc_cost or 0,
                tacos=item.tacos or 0,
                ppc_conversions=item.ppc_conversions or 0,
                page_views=item.page_views or 0,
                sessions=item.sessions or 0,
                unit_session_percentage=item.unit_session_percentage or 0,
                ppc_product_sales=item.ppc_product_sales or 0,
                ppc_product_cost=item.ppc_product_cost or 0,
                ppc_product_clicks=item.ppc_product_clicks or 0,
                ppc_product_impressions=item.ppc_product_impressions or 0,
                ppc_video_sales=item.ppc_video_sales or 0,
                ppc_video_cost=item.ppc_video_cost or 0,
                ppc_video_clicks=item.ppc_video_clicks or 0,
                ppc_video_impressions=item.ppc_video_impressions or 0,
                revenue=item.revenue or 0,
                velocity=item.velocity or 0,
            )
            details.append(sales_data)

        logger.info(f"Number of details: {len(details)}")
        logger.info(f"First detail item: {details[0] if details else 'No details'}")

        response = SalesResponse(summary=summary, details=details, total_pages=total_pages, current_page=page)
        return response
    except Exception as e:
        logger.error(f"Unexpected error: {str(e)}")
        logger.error(traceback.format_exc())
        raise HTTPException(status_code=500, detail=f"An unexpected error occurred: {str(e)}")

@router.get("/sales-columns")
def get_sales_columns():
    return [column.name for column in SalesPerDayPerProduct.__table__.columns]

@router.get("/account-titles")
def get_account_titles(db: Session = Depends(get_db)):
    try:
        account_titles = db.query(distinct(SalesPerDayPerProduct.account_title)).all()
        return [title[0] for title in account_titles]
    except Exception as e:
        logger.error(f"Error fetching account titles: {str(e)}")
        raise HTTPException(status_code=500, detail=f"An error occurred while fetching account titles: {str(e)}")
