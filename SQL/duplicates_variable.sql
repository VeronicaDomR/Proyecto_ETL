-- Repeticiones por category
SELECT 
  category, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  category
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por city
SELECT 
  city, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  city
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por country
SELECT 
  country, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  country
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por customer_ID y customer_name
SELECT 
  customer_ID, customer_name, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  customer_ID, customer_name
ORDER BY 
  num_repeticiones DESC;


-- Repeticiones por discount
SELECT 
  discount, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  discount
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por market
SELECT 
  market, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  market
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por unknown
SELECT 
  unknown, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  unknown
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por order_date
SELECT 
  order_date, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  order_date
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por order_id
SELECT 
  order_id, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  order_id
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por order_priority
SELECT 
  order_priority, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  order_priority
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por product_id y -product_name

SELECT 
  product_id, product_name, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  product_id, product_name
ORDER BY 
  num_repeticiones DESC;


-- Repeticiones por profit
SELECT 
  profit, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  profit
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por quantity
SELECT 
  quantity, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  quantity
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por region
SELECT 
  region, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  region
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por row_id
SELECT 
  row_id, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  row_id
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por sales
SELECT 
  sales, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  sales
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por segment
SELECT 
  segment, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  segment
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por ship_date
SELECT 
  ship_date, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  ship_date
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por ship_mode
SELECT 
  ship_mode, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  ship_mode
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por shipping_cost
SELECT 
  shipping_cost, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  shipping_cost
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por state
SELECT 
  state, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  state
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por sub_category
SELECT 
  sub_category, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  sub_category
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por year
SELECT 
  year, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  year
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por market2
SELECT 
  market2, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  market2
ORDER BY 
  num_repeticiones DESC;

-- Repeticiones por weeknum
SELECT 
  weeknum, COUNT(*) AS num_repeticiones
FROM 
  `proyecto5-etl.superstore.superstore`
GROUP BY 
  weeknum
ORDER BY 
  num_repeticiones DESC;
