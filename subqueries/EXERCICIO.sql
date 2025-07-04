-- QUAIS PEDIDOS TEM UMA QUANTIDADE VENDIDA ACIMA DA QUANTIDADE MEDIA
select 
	order_id,
	sum(quantity)
from order_details
group by order_id
having sum(quantity) >= 
	(select 
		avg(total_vendido)
	from (
		select
			order_id,
			sum(quantity) as total_vendido
		from order_details
		group by order_id
		)
		);


