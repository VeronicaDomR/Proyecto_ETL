-- Crear tabla de unión usando la columna countries_headquarters
CREATE TABLE `proyecto5-etl.superstore.superstore_supermarket_link` AS
SELECT
    ds.order_id,
    ds.country AS order_country,
    sc.company_id
FROM `proyecto5-etl.superstore.dataset_superstore` AS ds
JOIN `proyecto5-etl.superstore.supermarket_chains` AS sc
ON ds.country = sc.countries_headquarters;
