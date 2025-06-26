SELECT * FROM products;

SELECT 
	MIN(unit_price) AS VALOR_MAXIMO, 
 	MAX(unit_price)AS VALOR_MINIMO,
	AVG(unit_price) AS MEDIA_VALORES
FROM products;