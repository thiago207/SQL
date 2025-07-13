create table contas(
	id int,
	nome varchar(100),
	saldo decimal
);

select * from contas;

insert into contas(id, nome, saldo)
values(1,'Thiago', 20000);



begin transaction;
insert into contas(id, nome, saldo)
values(2,'jorge', 3500)

commit;