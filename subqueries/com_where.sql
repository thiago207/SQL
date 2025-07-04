SELECT * from products;
-- media = 28.833
select 
	*
from products
where unit_price >= (select avg(unit_price) from products);

-- QUAIS PEDIDOS TEM UMA QUANTIDADE VENDIDA ACIMA DA QUANTIDADE MEDIA

select * from order_details;

select avg(quantity) from order_details; --23.81299

select 
	*
from order_details
where quantity >= (select avg(quantity) from order_details)