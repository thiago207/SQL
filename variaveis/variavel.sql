do $$ 
declare
	nome varchar(100);
	salario decimal;
	data_contratacao date;
begin
	nome := 'Thiago';
	salario := 15000;
	data_contratacao := '21-03-2030';
	raise notice 'O funcionario % foi contratado dia %', nome, data_contratacao;
end $$;