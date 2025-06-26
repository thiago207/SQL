SELECT * FROM customers
WHERE country = 'Mexico'OR country = 'UK' OR country = 'Canada';

SELECT * FROM customers
WHERE country IN ('Mexico', 'UK', 'Canada');