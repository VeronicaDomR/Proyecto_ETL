-- Crear tabla de hechos
CREATE TABLE `proyecto5-etl.superstore.f_hechos` AS
SELECT 
    ds.order_id,
    ds.customer_ID AS customer_id,
    ds.product_id,
    ds.location_id,
    ds.region,
    ds.market,
    ds.order_date,
    ds.ship_date,
    ds.ship_mode,
    ds.order_priority,
    ds.profit,
    ds.quantity,
    ds.sales,
    ds.discount,
    ds.shipping_cost,
    sl.company_id
FROM `proyecto5-etl.superstore.dataset_superstore` AS ds
JOIN `proyecto5-etl.superstore.superstore_supermarket_link` AS sl
ON ds.order_id = sl.order_id;
