-- Crear tabla de dimensión cliente
CREATE TABLE `proyecto5-etl.superstore.d_cliente` AS
SELECT 
    customer_ID AS customer_id,
    customer_name,
    city,
    state,
    country,
    region
FROM `proyecto5-etl.superstore.dataset_superstore`;

-- Crear tabla de dimensión producto
CREATE TABLE `proyecto5-etl.superstore.d_producto` AS
SELECT 
    product_id,
    product_name,
    category,
    category_code,
    sub_category
FROM `proyecto5-etl.superstore.dataset_superstore`;

-- Crear tabla de dimensión competidores
CREATE TABLE `proyecto5-etl.superstore.d_competidores` AS
SELECT 
    company_id,
    company,
    Headquarters,
    served_countries,
    number_of_locations,
    number_of_employees
FROM `proyecto5-etl.superstore.supermarket_chains`;

-- Crear tabla de dimensión ubicación
CREATE TABLE `proyecto5-etl.superstore.d_ubicacion` AS
SELECT 
    location_id,
    city,
    state,
    country,
    region,
    market
FROM `proyecto5-etl.superstore.dataset_superstore`;

-- Crear tabla de dimensión tiempo
CREATE TABLE `proyecto5-etl.superstore.d_tiempo` AS
SELECT 
    order_date,
    order_year,
    order_month,
    order_day,
    ship_date,
    ship_year,
    ship_month,
    ship_day,
    weeknum
FROM `proyecto5-etl.superstore.dataset_superstore`;

-- Crear tabla de dimensión envío
CREATE TABLE `proyecto5-etl.superstore.d_envio` AS
SELECT 
    ship_mode,
    shipping_cost
FROM `proyecto5-etl.superstore.dataset_superstore`;
