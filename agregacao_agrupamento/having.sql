select * from  customers;

SELECT
	 country,
	 COUNT(*)
FROM customers
WHERE contact_title = 'Owner'
GROUP BY country;


SELECT
	country,
	COUNT(*)
FROM customers
GROUP BY country
HAVING COUNT(*) >= 10; 