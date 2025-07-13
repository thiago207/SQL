--Controle entre duas contas 

select * from contas;


create or replace procedure transferencia(remetente int, destinatario int, valor decimal)
language plpgsql
as $$
begin 
	update contas
	set saldo = saldo + valor
	where contas.id = destinatario;

	update contas
	set saldo = saldo - valor
	where contas.id = remetente;

	commit;
end $$;	

call transferencia(1, 3, 3000);
