--AGRUPAMENTO
--GROUP BY

SELECT * from DimProduct
select * from DimStore

--GROUP BY
SELECT BrandName, count(*) as 'qtd total' from DimProduct
group by BrandName


--GROUP BY COM AVG, SUM, MAX/MIN:
select 
	StoreType,
	sum(EmployeeCount)  as 'total de funcionarios por loja'
from 
	DimStore
group by StoreType



select 
	BrandName ,
	avg(UnitCost) as 'media de custo por loja' 
from 
	DimProduct
group by BrandName




select 
	ClassName ,
	max(UnitPrice) as 'preco maximo', 
	min(UnitPrice) as 'preco minimo' 
from 
	DimProduct
group by ClassName

--GROUP BY COM ORDER BY:

select * from DimStore


select 
	StoreType as 'tipo de loja',
	sum(EmployeeCount)  as 'total de funcionarios por loja'
from 
	DimStore
group by StoreType
order by [total de funcionarios por loja] desc

--GROUP BY COM WHERE:

SELECT * FROM DimProduct

SELECT 
	ColorName as 'COR PRODUTO', 
	count(*) AS 'TOTAL DE PRODUTO( LOJA CONTOSO )'
FROM 
	DimProduct
where BrandName = 'Contoso'
group by ColorName


--GROUP BY COM HAVING:

SELECT 
	BrandName,
	count(*) as 'total por marca'
FROM 
	DimProduct
group by BrandName
HAVING count(*) >= 200


SELECT
	BrandName AS 'Marca',
	COUNT(BrandName) AS 'Total Marca'
FROM
	DimProduct
WHERE ClassName = 'Economy'     -- Filtra a tabela original, antes do agrupamento
GROUP BY BrandName
HAVING COUNT(BrandName) >= 200  -- Filtra a tabela depois de agrupada



--EXERCICIOS:
/*Os exerc�cios abaixo est�o divididos de acordo com uma determinada tabela do Banco de Dados.*/


--FACTSALES

SELECT * FROM FactSales

/*1. a) Fa�a um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas
(channelkey).*/
select 
	channelKey, 
	sum(SalesQuantity) 
from 
	FactSales
group by channelKey

/*b) Fa�a um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade
total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).*/

select 
	StoreKey, 
	sum(SalesQuantity) 'total vendido',
	sum(ReturnQuantity) as 'total devolvido'
from 
	FactSales
group by StoreKey
order by StoreKey asc

/*c) Fa�a um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas
para o ano de 2007.*/

select 
	channelKey, 
	sum(SalesAmount) 'faturamento total'
from 
	FactSales
where datekey between '20070101' and '20071231'
group by channelKey


/*2. Voc� precisa fazer uma an�lise de vendas por produtos. O objetivo final � descobrir o valor
total vendido (SalesAmount) por produto (ProductKey).*/


SELECT ProductKey, sum(SalesAmount) FROM FactSales
group by ProductKey

/*a) A tabela final dever� estar ordenada de acordo com a quantidade vendida e, al�m disso,
mostrar apenas os produtos que tiveram um resultado final de vendas maior do que
$5.000.000.*/

SELECT ProductKey, sum(SalesAmount) FROM FactSales
group by ProductKey
having sum(SalesAmount) >= 5000000
order by sum(SalesAmount) asc

/*b) Fa�a uma adapta��o no exerc�cio anterior e mostre os Top 10 produtos com mais vendas.
Desconsidere o filtro de $5.000.000 aplicado.*/

SELECT top(10)
	ProductKey, sum(SalesAmount) 
FROM 
	FactSales
group by ProductKey
having sum(SalesAmount) >= 5000000
order by sum(SalesAmount) desc

/*FACTONLINESALES

3. 
a) Voc� deve fazer uma consulta � tabela FactOnlineSales e descobrir qual � o ID
(CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna
SalesQuantity).*/


select top(10) * from FactOnlineSales

select top(1)
	CustomerKey, 
	sum(SalesQuantity) 
from 
	FactOnlineSales
group by CustomerKey
order by SUM(SalesQuantity) desc

/*
b) Feito isso, fa�a um agrupamento de total vendido (SalesQuantity) por ID do produto
e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a).*/

select top(3)
	sum(SalesQuantity) as 'total comprado',
	ProductKey as 'ID Produtos mais comprados'
from 
	FactOnlineSales
where CustomerKey = 19037
group by ProductKey
order by [total comprado] desc

/*
DIMPRODUCT
4. a) Fa�a um agrupamento e descubra a quantidade total de produtos por marca.*/

select * from DimProduct

select BrandName, count(*) as 'quantidade total' from DimProduct
group by BrandName

/*
b) Determine a m�dia do pre�o unit�rio (UnitPrice) para cada ClassName.*/

select ClassName, avg(UnitPrice) as 'media preco' from DimProduct
group by ClassName
order by [media preco] desc

/*
c) Fa�a um agrupamento de cores e descubra o peso total que cada cor de produto possui.*/

select ColorName, sum(Weight) as 'peso total por cor' from DimProduct
group by ColorName
order by [peso total por cor] desc


/*
5. Voc� dever� descobrir o peso total para cada tipo de produto (StockTypeName).
A tabela final deve considerar apenas a marca �Contoso� e ter os seus valores classificados em
ordem decrescente.*/

select 
	StockTypeName, 
	sum(Weight) 
from 
	DimProduct
where BrandName = 'Contoso'
group by StockTypeName
order by sum(Weight) desc


/*
6. Voc� seria capaz de confirmar se todas as marcas dos produtos possuem � disposi��o todas as
16 op��es de cores?*/

select 
	BrandName, count(distinct ColorID) as 'qtd_cores'
from 
	DimProduct
group by BrandName
HAVING COUNT(DISTINCT ColorID) < 16

select distinct ColorName from DimProduct
where BrandName = 'Proseware'     -- saber quais sao da que menos tem 

--	DIMCUSTOMER	

/*
7. Fa�a um agrupamento para saber o total de clientes de acordo com o Sexo e tamb�m a m�dia
salarial de acordo com o Sexo. Corrija qualquer resultado �inesperado� com os seus
conhecimentos em SQL.*/

select * from DimCustomer

select Gender, count(Gender) as 'qtd. por sexo', avg(YearlyIncome)  as 'media salaria' from DimCustomer
where Gender is not null
group by Gender

/*
8. Fa�a um agrupamento para descobrir a quantidade total de clientes e a m�dia salarial de
acordo com o seu n�vel escolar. Utilize a coluna Education da tabela DimCustomer para fazer
esse agrupamento.*/

select Education ,count(*) as 'qtd total de clientes', avg(YearlyIncome) from DimCustomer
where Education is not null
group by Education


/*
DIMEMPLOYEE
9. Fa�a uma tabela resumo mostrando a quantidade total de funcion�rios de acordo com o
Departamento (DepartmentName). Importante: Voc� dever� considerar apenas os
funcion�rios ativos.*/
select * from DimEmployee

select 
	DepartmentName, count(*) as 'qtd total de funcionarios' 
from 
	DIMEMPLOYEE
where Status = 'Current'
group by DepartmentName
order by [qtd total de funcionarios] desc

/*
10. Fa�a uma tabela resumo mostrando o total de VacationHours para cada cargo (Title). Voc�
deve considerar apenas as mulheres, dos departamentos de Production, Marketing,
Engineering e Finance, para os funcion�rios contratados entre os anos de 1999 e 2000.*/

select 
	Title , 
	sum(VacationHours)  as 'Horas Totais' 
from 
	DimEmployee
where Gender = 'F' and 
	DepartmentName in ('Production', 'Marketing', 'Engineering', 'Finance') 
	and HireDate between '1999-01-01' and '2000-12-31'
group by Title
