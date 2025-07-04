select * from customers;

--Qual a media de clientes de acordo com o cargo?

select
	AVG(total_de_clientes_por_cargo)
from
	(select 
		contact_title as cargo,
		count(*) as total_de_clientes_por_cargo
	from  customers
	group by contact_title
	) 
	;