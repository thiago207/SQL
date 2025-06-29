SELECT 
     p.product_id,
	 p.product_name, 
	 p.category_id,
	 p.unit_price,
	 c.category_name
FROM
	products AS p
INNER JOIN categories AS c
ON c.category_id = p.category_id;

