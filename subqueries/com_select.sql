-- FAÇA UMA CONSULTA A TABELA DE PRODUTOS E ADICIONE UMA COLUNA QUE TENHA A MEDIA GERAL DOS PRECOS DOS PRODUTOS
select * from products;

select 
	avg(unit_price)
from products;

SELECT 
	(select 
		ROUND(CAST(AVG(unit_price) AS numeric), 2)
	from products) as media_preco_produto,
	*
	
from products;


--outro exemplo
select
	product_name,
	avg(unit_price) as media_preco_por_produto,
	(select 
		ROUND(CAST(AVG(unit_price) AS numeric), 2)
	from products) as media_GERAL
from products
group by product_name;