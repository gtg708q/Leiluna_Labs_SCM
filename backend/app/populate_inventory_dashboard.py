import sys
import os
from datetime import datetime, timedelta
from sqlalchemy import func, case, literal, create_engine, and_
from sqlalchemy.orm import aliased, sessionmaker
from sqlalchemy.exc import ProgrammingError

# Add the parent directory of 'app' to sys.path
current_dir = os.path.dirname(os.path.abspath(__file__))
parent_dir = os.path.dirname(current_dir)
sys.path.append(parent_dir)

from app.database import engine, get_db
from app.models.inventory_dashboard import InventoryDashboard
from app.models.inventory import FinishedGoods
from app.models.sales_per_day_per_product import SalesPerDayPerProduct
from app.models.sales_statistics import SalesStatistics
from app.models.inventory import FinishedGoodsInventory
from app.database import Base

def create_inventory_dashboard_table():
    Base.metadata.create_all(engine, tables=[InventoryDashboard.__table__])

def safe_divide(a, b):
    if a is None or b is None or b == 0:
        return None
    return a / b

def populate_inventory_dashboard():
    create_inventory_dashboard_table()
    db = next(get_db())
    try:
        # Get the current date
        current_date = datetime.now().date()

        print("Creating velocity subquery...")
        velocity_subquery = db.query(
            SalesPerDayPerProduct.asin,
            (func.sum(case(
                (and_(SalesPerDayPerProduct.date > current_date - timedelta(days=8),
                      SalesPerDayPerProduct.date <= current_date - timedelta(days=1)),
                 SalesPerDayPerProduct.units),
                else_=0
            )) / 7.0).label('velocity_7d'),
            (func.sum(case(
                (and_(SalesPerDayPerProduct.date > current_date - timedelta(days=15),
                      SalesPerDayPerProduct.date <= current_date - timedelta(days=1)),
                 SalesPerDayPerProduct.units),
                else_=0
            )) / 14.0).label('velocity_14d'),
            (func.sum(case(
                (and_(SalesPerDayPerProduct.date > current_date - timedelta(days=31),
                      SalesPerDayPerProduct.date <= current_date - timedelta(days=1)),
                 SalesPerDayPerProduct.units),
                else_=0
            )) / 30.0).label('velocity_30d'),
            (func.sum(case(
                (and_(SalesPerDayPerProduct.date > current_date - timedelta(days=61),
                      SalesPerDayPerProduct.date <= current_date - timedelta(days=1)),
                 SalesPerDayPerProduct.units),
                else_=0
            )) / 60.0).label('velocity_60d'),
            (func.sum(case(
                (and_(SalesPerDayPerProduct.date > current_date - timedelta(days=91),
                      SalesPerDayPerProduct.date <= current_date - timedelta(days=1)),
                 SalesPerDayPerProduct.units),
                else_=0
            )) / 90.0).label('velocity_90d'),
            (func.sum(case(
                (and_(SalesPerDayPerProduct.date > current_date - timedelta(days=181),
                      SalesPerDayPerProduct.date <= current_date - timedelta(days=1)),
                 SalesPerDayPerProduct.units),
                else_=0
            )) / 180.0).label('velocity_180d')
        ).group_by(SalesPerDayPerProduct.asin)

        print("Velocity subquery created. Printing first few results:")
        velocity_results = velocity_subquery.limit(5).all()
        for result in velocity_results:
            print(result)

        velocity_subquery = velocity_subquery.subquery()

        print("Creating latest sales stats subquery...")
        latest_sales_stats = db.query(
            SalesStatistics.asin,
            func.max(SalesStatistics.date).label('max_date')
        ).group_by(SalesStatistics.asin).subquery()

        print("Creating sales stats subquery...")
        sales_stats_subquery = db.query(
            SalesStatistics.asin,
            SalesStatistics.in_stock.label('fba_in_stock_qty'),
            SalesStatistics.inbound.label('inbound_qty'),
            SalesStatistics.reserved.label('reserved_qty')
        ).join(
            latest_sales_stats,
            (SalesStatistics.asin == latest_sales_stats.c.asin) &
            (SalesStatistics.date == latest_sales_stats.c.max_date)
        ).subquery()

        # Create subquery for 30-day net profit
        print("Creating 30-day net profit subquery...")
        net_profit_subquery = db.query(
            SalesPerDayPerProduct.asin,
            func.sum(SalesPerDayPerProduct.net_profit).label('thirty_day_net_profit')
        ).filter(
            SalesPerDayPerProduct.date > current_date - timedelta(days=31),
            SalesPerDayPerProduct.date <= current_date - timedelta(days=1)
        ).group_by(SalesPerDayPerProduct.asin).subquery()

        print("Executing main inventory data query...")
        inventory_data = db.query(
            FinishedGoods.asin,
            FinishedGoods.isku,
            FinishedGoods.brand,
            FinishedGoods.phoenix_class,
            FinishedGoods.status,
            FinishedGoods.lead_time,
            FinishedGoods.amz_safety_days,
            FinishedGoods.reorder_qty_days,
            FinishedGoods.replenishment_type,
            velocity_subquery.c.velocity_7d,
            velocity_subquery.c.velocity_14d,
            velocity_subquery.c.velocity_30d,
            velocity_subquery.c.velocity_60d,
            velocity_subquery.c.velocity_90d,
            velocity_subquery.c.velocity_180d,
            sales_stats_subquery.c.fba_in_stock_qty,
            sales_stats_subquery.c.inbound_qty,
            sales_stats_subquery.c.reserved_qty,
            FinishedGoodsInventory.theoretical_qty.label('wh_qty'),
            net_profit_subquery.c.thirty_day_net_profit
        ).outerjoin(velocity_subquery, FinishedGoods.asin == velocity_subquery.c.asin
        ).outerjoin(sales_stats_subquery, FinishedGoods.asin == sales_stats_subquery.c.asin
        ).outerjoin(FinishedGoodsInventory, FinishedGoods.isku == FinishedGoodsInventory.isku
        ).outerjoin(net_profit_subquery, FinishedGoods.asin == net_profit_subquery.c.asin
        ).all()

        print(f"Processing {len(inventory_data)} items...")
        for index, item in enumerate(inventory_data):
            try:
                print(f"Processing item {index + 1}: ASIN {item.asin}")
                # Check if the ASIN already exists in the inventory_dashboard
                existing_item = db.query(InventoryDashboard).filter(InventoryDashboard.asin == item.asin).first()

                # Calculate all the values
                variance_7_14 = calculate_variance(item.velocity_7d, item.velocity_14d)
                variance_7_30 = calculate_variance(item.velocity_7d, item.velocity_30d)
                variance_7_60 = calculate_variance(item.velocity_7d, item.velocity_60d)
                variance_15_30 = calculate_variance(item.velocity_14d, item.velocity_30d)
                variance_15_60 = calculate_variance(item.velocity_14d, item.velocity_60d)
                variance_30_60 = calculate_variance(item.velocity_30d, item.velocity_60d)

                avg_7_30_60 = safe_divide((item.velocity_7d or 0) + (item.velocity_30d or 0) + (item.velocity_60d or 0), 3)
                max_7_30_60 = max(item.velocity_7d or 0, item.velocity_30d or 0, item.velocity_60d or 0)
                final_velocity = max_7_30_60

                fba_in_stock_days = safe_divide(item.fba_in_stock_qty, final_velocity)
                inbound_days = safe_divide(item.inbound_qty, final_velocity)
                reserved_days = safe_divide(item.reserved_qty, final_velocity)
                total_fba_qty = (item.fba_in_stock_qty or 0) + (item.inbound_qty or 0) + (item.reserved_qty or 0)
                total_fba_days = safe_divide(total_fba_qty, final_velocity)

                reorder_point_days = (item.amz_safety_days or 0) + (item.lead_time or 0)
                reorder_point_qty = safe_divide(reorder_point_days * final_velocity, 1)

                inventory_health = determine_inventory_health(final_velocity, item.fba_in_stock_qty, fba_in_stock_days, total_fba_days, reorder_point_days)

                fo_qty = calculate_fo_qty(total_fba_days, reorder_point_days, item.reorder_qty_days, final_velocity)
                fo_date = calculate_fo_date(total_fba_days, reorder_point_days, current_date)

                # Prepare data dictionary
                data = {
                    'isku': item.isku,
                    'brand': item.brand,
                    'phoenix_class': item.phoenix_class,
                    'status': item.status,
                    'velocity_7d': item.velocity_7d,
                    'velocity_14d': item.velocity_14d,
                    'velocity_30d': item.velocity_30d,
                    'velocity_60d': item.velocity_60d,
                    'velocity_90d': item.velocity_90d,
                    'velocity_180d': item.velocity_180d,
                    'variance_7_14': variance_7_14,
                    'variance_7_30': variance_7_30,
                    'variance_7_60': variance_7_60,
                    'variance_15_30': variance_15_30,
                    'variance_15_60': variance_15_60,
                    'variance_30_60': variance_30_60,
                    'avg_7_30_60': avg_7_30_60,
                    'max_7_30_60': max_7_30_60,
                    'final_velocity': final_velocity,
                    'fba_in_stock_qty': item.fba_in_stock_qty,
                    'fba_in_stock_days': fba_in_stock_days,
                    'inbound_qty': item.inbound_qty,
                    'reserved_qty': item.reserved_qty,
                    'inbound_days': inbound_days,
                    'reserved_days': reserved_days,
                    'total_fba_qty': total_fba_qty,
                    'total_fba_days': total_fba_days,
                    'lead_time': item.lead_time,
                    'amz_safety_days': item.amz_safety_days,
                    'reorder_qty_days': item.reorder_qty_days,
                    'reorder_point_days': reorder_point_days,
                    'reorder_point_qty': reorder_point_qty,
                    'inventory_health': inventory_health,
                    'fo_qty': fo_qty,
                    'wh_qty': item.wh_qty,
                    'replenishment_type': item.replenishment_type,
                    'fo_date': fo_date,
                    'thirty_day_net_profit': item.thirty_day_net_profit,
                }

                if existing_item:
                    # Update existing row
                    for key, value in data.items():
                        setattr(existing_item, key, value)
                else:
                    # Create new row
                    new_item = InventoryDashboard(asin=item.asin, **data)
                    db.add(new_item)

            except Exception as e:
                print(f"Error processing item {index + 1}: {str(e)}")
                print(f"Item data: {item}")
                raise

        db.commit()
        print("Inventory dashboard populated successfully.")
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        import traceback
        traceback.print_exc()
        db.rollback()
    finally:
        db.close()

def calculate_variance(value1, value2):
    if value1 is not None and value2 is not None and value2 != 0:
        return ((value1 - value2) / value2) * 100
    return None

def determine_inventory_health(final_velocity, fba_in_stock_qty, fba_in_stock_days, total_fba_days, reorder_point_days):
    if final_velocity == 0 or final_velocity is None:
        return 'No Velocity'
    elif fba_in_stock_qty == 0 or fba_in_stock_qty is None:
        return 'Red'
    elif fba_in_stock_days is None or fba_in_stock_days < 30:
        return 'Orange'
    elif total_fba_days is None or reorder_point_days is None or total_fba_days <= reorder_point_days:
        return 'Yellow'
    elif reorder_point_days < total_fba_days <= 90:
        return 'Green'
    elif 90 < total_fba_days <= 105:
        return 'Teal'
    elif total_fba_days > 105:
        return 'Blue'
    else:
        return 'Unknown'

def calculate_fo_qty(total_fba_days, reorder_point_days, reorder_qty_days, final_velocity):
    if total_fba_days is None or reorder_point_days is None or total_fba_days > reorder_point_days:
        return 0
    else:
        return (reorder_qty_days or 0) + (reorder_point_days - total_fba_days) * (final_velocity or 0)

def calculate_fo_date(total_fba_days, reorder_point_days, current_date):
    if total_fba_days is None or reorder_point_days is None or total_fba_days < reorder_point_days:
        return current_date
    else:
        return current_date + timedelta(days=int(total_fba_days - reorder_point_days))

if __name__ == "__main__":
    populate_inventory_dashboard()
