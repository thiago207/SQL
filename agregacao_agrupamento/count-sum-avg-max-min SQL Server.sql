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