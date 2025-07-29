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
/*Os exerc�cios abaixo est�o divididos de acordo com uma determinada tabela do Banco de Dados.
FACTSALES*/
/*1. a) Fa�a um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas
(channelkey).*/

/*b) Fa�a um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade
total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).*/

/*c) Fa�a um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas
para o ano de 2007.*/

/*2. Voc� precisa fazer uma an�lise de vendas por produtos. O objetivo final � descobrir o valor
total vendido (SalesAmount) por produto (ProductKey).*/

/*a) A tabela final dever� estar ordenada de acordo com a quantidade vendida e, al�m disso,
mostrar apenas os produtos que tiveram um resultado final de vendas maior do que
$5.000.000.*/

/*b) Fa�a uma adapta��o no exerc�cio anterior e mostre os Top 10 produtos com mais vendas.
Desconsidere o filtro de $5.000.000 aplicado.*/

/*FACTONLINESALES
3. 
a) Voc� deve fazer uma consulta � tabela FactOnlineSales e descobrir qual � o ID
(CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna
SalesQuantity).*/
/*

b) Feito isso, fa�a um agrupamento de total vendido (SalesQuantity) por ID do produto
e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a).*/


/*
DIMPRODUCT
4. a) Fa�a um agrupamento e descubra a quantidade total de produtos por marca.*/

/*
b) Determine a m�dia do pre�o unit�rio (UnitPrice) para cada ClassName.*/

/*
c) Fa�a um agrupamento de cores e descubra o peso total que cada cor de produto possui.*/

/*
5. Voc� dever� descobrir o peso total para cada tipo de produto (StockTypeName).
A tabela final deve considerar apenas a marca �Contoso� e ter os seus valores classificados em
ordem decrescente.*/

/*
6. Voc� seria capaz de confirmar se todas as marcas dos produtos possuem � disposi��o todas as
16 op��es de cores?*/


--	DIMCUSTOMER

/*
7. Fa�a um agrupamento para saber o total de clientes de acordo com o Sexo e tamb�m a m�dia
salarial de acordo com o Sexo. Corrija qualquer resultado �inesperado� com os seus
conhecimentos em SQL.*/

/*
8. Fa�a um agrupamento para descobrir a quantidade total de clientes e a m�dia salarial de
acordo com o seu n�vel escolar. Utilize a coluna Education da tabela DimCustomer para fazer
esse agrupamento.*/

/*
DIMEMPLOYEE
9. Fa�a uma tabela resumo mostrando a quantidade total de funcion�rios de acordo com o
Departamento (DepartmentName). Importante: Voc� dever� considerar apenas os
funcion�rios ativos.*/

/*
10. Fa�a uma tabela resumo mostrando o total de VacationHours para cada cargo (Title). Voc�
deve considerar apenas as mulheres, dos departamentos de Production, Marketing,
Engineering e Finance, para os funcion�rios contratados entre os anos de 1999 e 2000.*/