from sqlalchemy.orm import Session
from app.database import SessionLocal
from app.models.purchase_order_log import PurchaseOrderLog
from datetime import datetime, timedelta

def add_test_purchase_orders():
    db = SessionLocal()
    try:
        for i in range(1, 11):  # Add 10 test purchase orders
            po = PurchaseOrderLog(
                date_issued=datetime.now() - timedelta(days=i),
                reference=f"REF-{i}",
                po_number=f"PO-{i:04d}",
                asin=f"ASIN{i}",
                bom_id=f"BOM-{i}",
                description=f"Test Purchase Order {i}",
                category="Test Category",
                product=f"Product {i}",
                qty=i * 10,
                uom="pcs",
                supplier=f"Supplier {i}",
                status="Pending",
                estimated_arrival_date=datetime.now() + timedelta(days=30),
                unit_price=100.0,
                landed_cost_per_unit=110.0
            )
            db.add(po)
        db.commit()
        print("Test purchase orders added successfully.")
    finally:
        db.close()

if __name__ == "__main__":
    add_test_purchase_orders()
