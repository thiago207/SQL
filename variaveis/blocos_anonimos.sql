do $$
declare
	quantidade int := 50;
	preco decimal := 100;
	valor_vendido int;
	vendedor varchar(100) := 'Jorge';
begin
	valor_vendido := quantidade * preco;
	raise notice 'O vendedor % vendeu um total de %', vendedor, valor_vendido;
	
	
end $$;

do $$
declare
	media_preco decimal;
	qtd_produtos_acima_media int;

begin 
	media_preco := (select avg(unit_price) from products);
	qtd_produtos_acima_media := (select count(*) from products where unit_price > media_preco); 
	raise notice 'A media de preco foi %', media_preco;
	raise notice 'A quantidade de produtos acima da media foram %', qtd_produtos_acima_media;
end $$;