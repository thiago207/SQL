select * from products;
create or replace function analise_estoque(estoque_min int, estoque_max int)
returns int
language plpgsql
as
$$
declare
	contagem_estoque int;
	

begin
	contagem_estoque := (select count(*) from products where units_in_stock between estoque_min and estoque_max);
	return contagem_estoque;
end $$;

select analise_estoque(10,50);

select count(*) - analise_estoque(10,50) from products; 