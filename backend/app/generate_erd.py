from eralchemy2 import render_er
from sqlalchemy import MetaData, Table, Column, Integer, String, Float, DateTime, ForeignKey, Boolean

metadata = MetaData()

# BOM Table
BOM = Table('BOM', metadata,
    Column('id', Integer, primary_key=True),
    Column('bom_id', String, unique=True),
    Column('component_type', String),
    Column('phx_class', String),
    Column('supplier_manufacturer', String),
    Column('address', String),
    Column('email', String),
    Column('contact_number', String),
    Column('supplier_mfg_lt', Integer),
    Column('transit_lt', Integer),
    Column('amz_safety_days', Integer),
    Column('wh_safety_days', Integer),
    Column('po_issue_days', Integer),
    Column('master_pack', Integer),
    Column('moq', Integer),
    Column('ordering_uom', String),
    Column('unit_price', Float),
    Column('shipping_cost', Float),
    Column('landed_cost', Float),
    Column('conversion', Float),
    Column('converted_unit_price', Float),
    Column('ims_unit', String),
    Column('supplier_payment_terms', String),
    Column('product_link', String),
    Column('supplier_product_id', String),
    Column('description', String),
    Column('remarks', String),
    Column('alternative_supplier_1', String),
    Column('alternative_supplier_2', String),
    Column('monthly_usage', Float),
    Column('monthly_spend', Float),
    Column('total_lt_bom_master', Integer),
    Column('comments', String),
    Column('version', Integer),
    Column('created_at', DateTime),
    Column('updated_at', DateTime),
    Column('is_deleted', Boolean)
)

BOMChangeLog = Table('BOMChangeLog', metadata,
    Column('id', Integer, primary_key=True),
    Column('bom_id', Integer, ForeignKey('BOM.id')),
    Column('field_name', String),
    Column('old_value', String),
    Column('new_value', String),
    Column('change_type', String),
    Column('timestamp', DateTime),
    Column('is_deleted', Boolean)
)

BOMHistory = Table('BOMHistory', metadata,
    Column('id', Integer, primary_key=True),
    Column('bom_id', Integer, ForeignKey('BOM.id')),
    Column('component_type', String),
    Column('phx_class', String),
    Column('supplier_manufacturer', String),
    Column('address', String),
    Column('email', String),
    Column('contact_number', String),
    Column('supplier_mfg_lt', Integer),
    Column('transit_lt', Integer),
    Column('amz_safety_days', Integer),
    Column('wh_safety_days', Integer),
    Column('po_issue_days', Integer),
    Column('master_pack', Integer),
    Column('moq', Integer),
    Column('ordering_uom', String),
    Column('unit_price', Float),
    Column('shipping_cost', Float),
    Column('landed_cost', Float),
    Column('conversion', Float),
    Column('converted_unit_price', Float),
    Column('ims_unit', String),
    Column('supplier_payment_terms', String),
    Column('product_link', String),
    Column('supplier_product_id', String),
    Column('description', String),
    Column('remarks', String),
    Column('alternative_supplier_1', String),
    Column('alternative_supplier_2', String),
    Column('monthly_usage', Float),
    Column('monthly_spend', Float),
    Column('total_lt_bom_master', Integer),
    Column('comments', String),
    Column('version', Integer),
    Column('timestamp', DateTime),
    Column('is_deleted', Boolean)
)

FinishedGoodsBOMComponent = Table('FinishedGoodsBOMComponent', metadata,
    Column('id', Integer, primary_key=True),
    Column('finished_good_id', Integer, ForeignKey('FinishedGoods.id')),
    Column('bom_id', Integer, ForeignKey('BOM.id')),
    Column('quantity', Float)
)

FinishedGoods = Table('FinishedGoods', metadata,
    Column('id', Integer, primary_key=True),
    Column('isku', String, unique=True),
    Column('asin', String),
    Column('common_name', String),
    Column('phoenix_class', String),
    Column('brand', String),
    Column('size', String),
    Column('material_cost', Float),
    Column('labor_cost', Float),
    Column('total_unit_cost', Float),
    Column('replenishment_type', String),
    Column('manufacturing_class', String),
    Column('lead_time', Integer),
    Column('amz_safety_days', Integer),
    Column('wh_safety_days', Integer),
    Column('reorder_qty_days', Integer),
    Column('similar', Integer),
    Column('in_bom_mapping', Boolean),
    Column('duplicate_asin', Boolean),
    Column('count_tkfg', Integer),
    Column('status', String),
    Column('batch_run', String),
    Column('is_deleted', Boolean)
)

FinishedGoodsInventory = Table('FinishedGoodsInventory', metadata,
    Column('id', Integer, primary_key=True),
    Column('isku', String, ForeignKey('FinishedGoods.isku')),
    Column('brand', String),
    Column('phx_class', String),
    Column('theoretical_qty', Float),
    Column('location', String),
    Column('actual_count', Float),
    Column('date_counted', DateTime),
    Column('uom', String),
    Column('mfg_after_date_counted', Float),
    Column('received_qty_after_actual_count', Float),
    Column('fo_after_date_counted', Float),
    Column('fo_after_date_counted_from_bundles', Float),
    Column('ihf_after_date_counted', Float),
    Column('duplicate', Boolean),
    Column('asin', String),
    Column('fba_veloz_ranking', Integer),
    Column('past_30_mo', Float),
    Column('past_30_fo', Float),
    Column('manufactured_fulfilled', Float),
    Column('theo_count_static', Float),
    Column('actual_count_2', Float),
    Column('date_counted_2', DateTime),
    Column('warehouse_remarks', String),
    Column('variance', Float),
    Column('not_in_wir_fg', String),
    Column('category', String),
    Column('is_deleted', Boolean)
)

TampaBOMInventory = Table('TampaBOMInventory', metadata,
    Column('id', Integer, primary_key=True),
    Column('bom_id', String, ForeignKey('BOM.bom_id')),
    Column('type', String),
    Column('phx_class', String),
    Column('theoretical_qty', Float),
    Column('location', String),
    Column('cycle_count', Float),
    Column('date_counted', DateTime),
    Column('uom', String),
    Column('theo_x_actual_variance', Float),
    Column('past_30_mo', Float),
    Column('past_30_fo', Float),
    Column('manufactured_fulfilled', Float),
    Column('used_for_mfg_after_actual', Float),
    Column('conversion', Float),
    Column('received_qty_after_actual_count', Float),
    Column('ranking', Integer),
    Column('current_internal_lot_number', String),
    Column('used_in_ihf_shipstation_after_count', Float),
    Column('theo_count_static', Float),
    Column('actual_count', Float),
    Column('wh_remarks', String),
    Column('variance', Float),
    Column('random_count', Float),
    Column('subtype', String),
    Column('is_deleted', Boolean)
)

PurchaseOrderLog = Table('PurchaseOrderLog', metadata,
    Column('id', Integer, primary_key=True),
    Column('date_issued', DateTime),
    Column('reference', String),
    Column('po_number', String),
    Column('asin', String),
    Column('bom_id', String, ForeignKey('BOM.bom_id')),
    Column('description', String),
    Column('item_status_notes', String),
    Column('category', String),
    Column('product', String),
    Column('qty', Float),
    Column('uom', String),
    Column('supplier', String),
    Column('status', String),
    Column('estimated_mfg_completion_date', DateTime),
    Column('estimated_mfg_lead_time_days', Integer),
    Column('estimated_shipping_lead_time_days', Integer),
    Column('estimated_arrival_date', DateTime),
    Column('current_expected_arrival_date', DateTime),
    Column('actual_mfg_completion_date', DateTime),
    Column('actual_mfg_lead_time_days', Integer),
    Column('actual_shipping_lead_time_days', Integer),
    Column('actual_arrival_date', DateTime),
    Column('mfg_lead_time_variance', Integer),
    Column('shipping_lead_time_variance', Integer),
    Column('ship_to', String),
    Column('confidential_for_novaeo_only', String),
    Column('coa_for_customers', String),
    Column('mfg_date', DateTime),
    Column('expiry_date', DateTime),
    Column('unit_price', Float),
    Column('amount', Float),
    Column('freight', Float),
    Column('duty_taxes', Float),
    Column('other_charges', Float),
    Column('total_amount', Float),
    Column('landed_cost_per_unit', Float),
    Column('payment_term', String),
    Column('freight_term', String),
    Column('invoice_no', String),
    Column('down_payment', Float),
    Column('dp_due_date', DateTime),
    Column('dp_date_paid', DateTime),
    Column('balance_amount', Float),
    Column('balance_due_date', DateTime),
    Column('balance_paid_date', DateTime),
    Column('within_mfg_sla', Boolean),
    Column('within_shipping_sla', Boolean),
    Column('agreed_sla', Integer),
    Column('delivery_tl', Integer),
    Column('within_xsla', Integer),
    Column('year', Integer),
    Column('month', String),
    Column('week', Integer),
    Column('findings', String),
    Column('type', String),
    Column('isku_bom', String),
    Column('status_2', String),
    Column('created_at', DateTime),
    Column('updated_at', DateTime),
    Column('is_deleted', Boolean)
)

ImportLog = Table('ImportLog', metadata,
    Column('id', Integer, primary_key=True),
    Column('import_name', String, unique=True),
    Column('last_import_date', DateTime)
)

SalesPerDayPerProduct = Table('SalesPerDayPerProduct', metadata,
    Column('id', Integer, primary_key=True),
    Column('date', DateTime),
    Column('title', String),
    Column('account_title', String),
    Column('market_place', String),
    Column('sku', String),
    Column('fnsku', String),
    Column('asin', String),
    Column('parent_asin', String),
    Column('is_parent', Boolean),
    Column('internal_name', String),
    Column('brand', String),
    Column('product_group', String),
    Column('tags', String),
    Column('active', Boolean),
    Column('orders', Integer),
    Column('canceled_orders', Integer),
    Column('units', Integer),
    Column('shipped', Integer),
    Column('refunded', Integer),
    Column('refund_percentage', Float),
    Column('promo_units', Integer),
    Column('non_promo_units', Integer),
    Column('promo_revenue', Float),
    Column('non_promo_revenue', Float),
    Column('ordered_product_sales', Float),
    Column('customer_pays', Float),
    Column('revenue', Float),
    Column('per_unit_revenue', Float),
    Column('fba_fees', Float),
    Column('commissions', Float),
    Column('promo_amount', Float),
    Column('cogs', Float),
    Column('shipping_cost', Float),
    Column('miscellaneous_cost', Float),
    Column('ooe', Float),
    Column('reported_tax_vat', Float),
    Column('internal_tax_vat', Float),
    Column('withheld_tax', Float),
    Column('remitting_tax', Float),
    Column('net_profit', Float),
    Column('net_margin', Float),
    Column('net_roi', Float),
    Column('ppc_orders', Integer),
    Column('ppc_impressions', Integer),
    Column('ppc_clicks', Integer),
    Column('ppc_sales', Float),
    Column('ppc_cost', Float),
    Column('tacos', Float),
    Column('ppc_conv', Float),
    Column('page_views', Integer),
    Column('sessions', Integer),
    Column('unit_session_percentage', Float),
    Column('ppc_product_sales', Float),
    Column('ppc_product_cost', Float),
    Column('ppc_product_clicks', Integer),
    Column('ppc_product_impressions', Integer),
    Column('ppc_video_sales', Float),
    Column('ppc_video_cost', Float),
    Column('ppc_video_clicks', Integer),
    Column('ppc_video_impressions', Integer),
    Column('currency', String)
)

SalesStatistics = Table('SalesStatistics', metadata,
    Column('id', Integer, primary_key=True),
    Column('date', DateTime),
    Column('account_title', String),
    Column('sku', String),
    Column('asin', String),
    Column('orders', Integer),
    Column('units', Integer),
    Column('velocity', Float),
    Column('buybox_price', Float),
    Column('local_inventory', Integer),
    Column('in_stock', Integer),
    Column('ordered_product_sales', Float),
    Column('revenue', Float),
    Column('shipping_cost', Float),
    Column('commissions', Float),
    Column('miscellaneous_cost', Float),
    Column('cogs', Float),
    Column('fba_fees', Float),
    Column('promo_amount', Float),
    Column('ppc_sales', Float),
    Column('ppc_cost', Float),
    Column('tacos', Float),
    Column('net_profit', Float),
    Column('net_margin', Float),
    Column('net_roi', Float),
    Column('sales_rank', String),
    Column('inbound', Integer),
    Column('reserved', Integer),
    Column('in_transit', Integer),
    Column('in_warehouse', Integer),
    Column('taxes', Float),
    Column('condition', String),
    Column('currency', String)
)

# Render the ER Diagram
render_er(metadata, 'ERD_Diagram.png')

print("ER diagram has been generated and saved as 'ERD_Diagram.png'")
