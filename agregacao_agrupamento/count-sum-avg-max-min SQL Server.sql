--FUNCOES DE AGREGACAO SQL SERVER

--COUNT
--COUNT + DISTINCT
--SUM
--AVG
--MIN E MAX  

--SUM:

select sum(SalesQuantity) as 'total vendido' from FactSales
select 
	sum(SalesQuantity) as 'total vendido',
	sum(ReturnQuantity) as 'Total devolvido'
from 
	FactSales

-- COUNT: 

select count(*) from DimProduct

select count(ProductName) from DimProduct

--COUNT + DISTINCT:
select count(distinct ColorName) from DimProduct

-- MIN/MAX

select max(UnitPrice) from DimProduct
select min(UnitPrice) from DimProduct

select 
	max(UnitCost) as 'Custo Maximo',
	min(UnitCost) as 'Custo Minimo'
from
	DimProduct


--AVG:
select avg(YearlyIncome) as 'medida anual de salario' from DimCustomer

--EXERCICIOS:

/*1. O gerente comercial pediu a voc� uma an�lise da Quantidade Vendida e Quantidade
Devolvida para o canal de venda mais importante da empresa: Store.
Utilize uma fun��o SQL para fazer essas consultas no seu banco de dados. Obs: Fa�a essa
an�lise considerando a tabela FactSales.*/

select 
	sum(SalesQuantity) as 'Qtd. Vendida',
	sum(ReturnQuantity) as 'Qtd. Devolvida'
from 
	FactSales

/*2. Uma nova a��o no setor de Marketing precisar� avaliar a m�dia salarial de todos os clientes
da empresa, mas apenas de ocupa��o Professional. Utilize um comando SQL para atingir esse
resultado.*/

select avg(YearlyIncome) from DimCustomer
where Occupation = 'Professional'

/*3. Voc� precisar� fazer uma an�lise da quantidade de funcion�rios das lojas registradas na
empresa. O seu gerente te pediu os seguintes n�meros e informa��es:


a) Quantos funcion�rios tem a loja com mais funcion�rios?

b) Qual � o nome dessa loja?

c) Quantos funcion�rios tem a loja com menos funcion�rios?

d) Qual � o nome dessa loja?*/


--A + B)
select top(1)EmployeeCount, StoreName from DimStore
order by EmployeeCount desc

--C + D)
select top(1)EmployeeCount, StoreName from DimStore
where EmployeeCount is not null
order by EmployeeCount asc


/*4. A �rea de RH est� com uma nova a��o para a empresa, e para isso precisa saber a quantidade
total de funcion�rios do sexo Masculino e do sexo Feminino.

a) Descubra essas duas informa��es utilizando o SQL.

b) O funcion�rio e a funcion�ria mais antigos receber�o uma homenagem. Descubra as
seguintes informa��es de cada um deles: Nome, E-mail, Data de Contrata��o.*/
select * from DimEmployee


select count(MaritalStatus) as 'Quantidade de Homem' from DimEmployee
where Gender = 'M'

select count(MaritalStatus) as 'Quantidade de Homem' from DimEmployee
where Gender = 'F'

select top(1)FirstName, EmailAddress, HireDate from DimEmployee
where Gender = 'F'
order by HireDate asc

select top(1)FirstName, EmailAddress, HireDate from DimEmployee
where Gender = 'M'
order by HireDate asc

/*5. Agora voc� precisa fazer uma an�lise dos produtos. Ser� necess�rio descobrir as seguintes
informa��es:

a) Quantidade distinta de cores de produtos.

b) Quantidade distinta de marcas

c) Quantidade distinta de classes de produto

Para simplificar, voc� pode fazer isso em uma mesma consulta.*/

select 
	count(distinct ColorName) as 'Qtd. distinta de cores de produtos',
	count(BrandName) as 'Qtd. distinta de marcas',
	count(ClassName)  as 'Qtd. distinta de classes de produtos'
from 
	DimProduct
