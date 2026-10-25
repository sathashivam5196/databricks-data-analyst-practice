SELECT
  o.order_id,
  o.total_amount,
  o.customer_id,
  o.product_id,
  o.order_at,
  p.category,
  c.country_code
FROM workspace.sales_data.orders AS o
LEFT JOIN workspace.sales_data.products AS p
  ON o.product_id = p.product_id
LEFT JOIN workspace.sales_data.customers AS c
  ON o.customer_id = c.customer_id;