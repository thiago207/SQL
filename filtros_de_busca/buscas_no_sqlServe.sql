-- CONSULTAS SIMPLES NO SQL SERVER


select * from DimCustomer


select FirstName, EmailAddress from DimEmployee 


--TOP: selecina N linhas TOP(N), tipo o head do pandas.

select top(10) * from DimEmployee

select top(100) FirstName, EmailAddress from DimEmployee

--TOP PERCENT: retorna N% porcento das linhas, exemplo:

select top(10) percent FirstName, EmailAddress from DimEmployee  

-- Comando SELECT DISTINCT: Retorna os valores distintos de 1 ou mais colunas de uma tabela

SELECT distinct ColorName FROM DimProduct  -- Retorne os valores distintos da coluna ColorName da tabela DimProduct

select distinct DepartmentName from DimEmployee -- Retorne os valores distintos da coluna DepartmentName da tabela DimEmployee

-- Comando AS: Renomeando colunas (aliasing)

select 
	ProductName as produto, 
	BrandName as marca, 
	ColorName as cor
from 
	DimProduct

-- EXERCICIOS: 

/*1. Você é responsável por controlar os dados de clientes e de produtos da sua empresa.
O que você precisará fazer é confirmar se:*/

--. Existem 2.517 produtos cadastrados na base e, se não tiver, você deverá reportar ao seu gestor para saber se existe alguma defasagem no controle dos produtos.

select 
	count(distinct ProductName) as contagem_de_produtos_cadrastrados 
from 
	DimProduct

--b. Até o mês passado, a empresa tinha um total de 19.500 clientes na base de controle. Verifique se esse número aumentou ou reduziu.


select 
	count(distinct CustomerKey) as contagem_de_clientes_cadrastrados
from 
	DimCustomer

/*Você trabalha no setor de marketing da empresa Contoso e acaba de ter uma ideia de oferecer
descontos especiais para os clientes no dia de seus aniversários. Para isso, você vai precisar
listar todos os clientes e as suas respectivas datas de nascimento, além de um contato.*/

--a) Selecione as colunas: CustomerKey, FirstName, EmailAddress, BirthDate da tabela dimCustomer.
--b) Renomeie as colunas dessa tabela usando o alias (comando AS).
select
	 CustomerKey as id, 
	 FirstName as primeiro_nome, 
	 EmailAddress as email, 
	 BirthDate	as data_de_aniversario
from
	DimCustomer


/*3. 
A Contoso está comemorando aniversário de inauguração de 10 anos e pretende fazer uma
ação de premiação para os clientes. A empresa quer presentear os primeiros clientes desde
a inauguração.

Você foi alocado para levar adiante essa ação. Para isso, você terá que fazer o seguinte:

a) A Contoso decidiu presentear os primeiros 100 clientes da história com um vale compras
de R$ 10.000. Utilize um comando em SQL para retornar uma tabela com os primeiros
100 primeiros clientes da tabela dimCustomer (selecione todas as colunas).

b) A Contoso decidiu presentear os primeiros 20% de clientes da história com um vale
compras de R$ 2.000. Utilize um comando em SQL para retornar 10% das linhas da sua
tabela dimCustomer (selecione todas as colunas).

c) Adapte o código do item a) para retornar apenas as 100 primeiras linhas, mas apenas as
colunas FirstName, EmailAddress, BirthDate.

d) Renomeie as colunas anteriores para nomes em português.*/

select top(100) * from dimCustomer

select top(20) percent * from dimCustomer

select top(100) FirstName as primeiro_nome, EmailAddress as email, BirthDate as data_aniversario from dimCustomer

/*4. 
A empresa Contoso precisa fazer contato com os fornecedores de produtos para repor o
estoque. Você é da área de compras e precisa descobrir quem são esses fornecedores.
Utilize um comando em SQL para retornar apenas os nomes dos fornecedores na tabela
dimProduct e renomeie essa nova coluna da tabela.*/

select distinct Manufacturer as produtor from DimProduct

/*5.
Você precisa descobrir se existe algum produto
registrado na base de produtos que ainda não tenha sido vendido. Tente chegar nessa
informação.
Obs: caso tenha algum produto que ainda não tenha sido vendido, você não precisa descobrir
qual é, é suficiente saber se teve ou não algum produto que ainda não foi vendido.*/

select count(distinct ProductKey) from factSales