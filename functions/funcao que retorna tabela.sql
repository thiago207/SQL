select * from customers;
create or replace function busca_clientes(title varchar)
returns table(
		id_cliente customers.customer_id%type, 
		nome customers.contact_name%type, 
		telefone customers.phone%type, 
		cargo customers.contact_title%type
		)
language plpgsql
as
$$
begin
	return query
		select 
			customer_id,
			contact_name,
			phone,
			contact_title
		from customers
		where contact_title = title;
end $$;

select * from  busca_clientes(title := 'Owner');