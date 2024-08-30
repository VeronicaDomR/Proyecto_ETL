-- Contar repeticiones por customer_name y country
WITH CustomerRepetitions AS (
  SELECT 
    customer_ID,
    customer_name,
    country,
    COUNT(*) AS num_repeticiones
  FROM 
    `proyecto5-etl.superstore.superstore`
  GROUP BY 
    customer_ID,
    customer_name,
    country
)

SELECT
  cr.customer_ID,
  cr.customer_name,
  cr.country,
  cr.num_repeticiones,
  s.city,
  s.category,
  s.discount,
  s.market,
  s.unknown,
  s.order_date,
  s.order_id,
  s.order_priority,
  s.product_id,
  s.product_name,
  s.profit,
  s.quantity,
  s.region,
  s.row_id,
  s.sales,
  s.segment,
  s.ship_date,
  s.ship_mode
FROM
  CustomerRepetitions cr
JOIN
  `proyecto5-etl.superstore.superstore` s
ON
  cr.customer_ID = s.customer_ID
  AND cr.customer_name = s.customer_name
  AND cr.country = s.country
ORDER BY
  cr.customer_name,
  cr.country,
  cr.num_repeticiones DESC;
