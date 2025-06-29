
SELECT 
	product_name,
	SUM(quantity) AS quantidade_total
FROM
	ORDER_DETAILS AS o
LEFT JOIN PRODUCTS AS p
ON p.PRODUCT_ID = o.PRODUCT_ID
WHERE p.unit_price >= 80	
GROUP BY product_name
ORDER BY quantidade_total DESC;



SELECT 
	product_name,
	SUM(quantity) AS quantidade_total
FROM
	ORDER_DETAILS AS o
LEFT JOIN PRODUCTS AS p
ON p.PRODUCT_ID = o.PRODUCT_ID
GROUP BY product_name
HAVING SUM(quantity) >= 1000
ORDER BY quantidade_total DESC;


