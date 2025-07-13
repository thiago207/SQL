--Exemplo: Crie uma Procedure que cadrasta um novo cliente na tabela contas

create or replace procedure cadastra_cliente(novo_id int, novo_cliente varchar(100), novo_saldo decimal)
language plpgsql
as $$
begin
	insert into contas(id, nome, saldo)
	values(novo_id, novo_cliente, novo_saldo);
	
	commit;
	
	
end $$;


call cadastra_cliente(3, 'juju', 3000);

select * from contas;

--drop procedure cadastra_clientes;