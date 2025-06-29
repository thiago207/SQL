SELECT 
	o.order_id,
	o.customer_id,
	o.order_date,
	c.contact_name
FROM orders AS o
RIGHT JOIN customers AS c
ON o.customer_id = c.customer_id