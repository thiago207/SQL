SELECT * FROM products;
SELECT * FROM order_details; 

SELECT
	*
FROM
	order_details
LEFT JOIN products
ON  order_details.product_id = products.product_id;


