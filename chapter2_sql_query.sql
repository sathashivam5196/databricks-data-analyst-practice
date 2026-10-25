CREATE OR REPLACE VIEW `workspace`.`sales_data`.`customers_analysis_mview` AS

SELECT
  c.customer_id,
  c.country_code,
  COUNT(o.order_id) AS total_orders,
  ROUND(SUM(o.total_amount)) AS total_spent,
  CASE
    WHEN ROUND(SUM(o.total_amount)) > 1000 THEN 'VIP'
    ELSE 'Regular'
  END AS customer_segment
FROM
  workspace.sales_data.customers AS c
    LEFT JOIN workspace.sales_data.orders AS o
      ON c.customer_id = o.customer_id
GROUP BY
  c.customer_id,
  c.country_code