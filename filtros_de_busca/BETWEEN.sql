SELECT * FROM products
WHERE unit_price >= 50 AND unit_price <= 100;

SELECT * FROM products
WHERE unit_price BETWEEN 50 AND 100
ORDER BY unit_price ASC;


SELECT * FROM orders
WHERE order_date >= '1997-01-01' AND order_date <= '1997-12-31';

SELECT * FROM orders
WHERE order_date BETWEEN '1997-01-01' AND '1997-12-31';
