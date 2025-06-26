SELECT SUM(units_in_stock) AS TotalEstoque FROM products;

SELECT * FROM order_details;

SELECT 
	SUM(quantity) 
FROM 
	order_details;