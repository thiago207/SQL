SELECT * FROM customers;

SELECT DISTINCT country FROM customers;

SELECT
	country,
	COUNT(*)
	
FROM 
	customers
GROUP BY 
	country
ORDER BY COUNT(*);



SELECT
	contact_title,
	COUNT(*)
	
FROM customers
GROUP BY contact_title
ORDER BY COUNT(*) DESC;

--SOMA TOTAL DE ESTOQUE POR suppleir_id
SELECT * FROM  products;
SELECT
	
	supplier_id,
	SUM(units_in_stock)
FROM products
GROUP BY supplier_id;


-- MEDIA DE unit_price por suppleir_id

SELECT
	supplier_id,
	AVG(unit_price)
FROM products
GROUP BY supplier_id;


	
	


