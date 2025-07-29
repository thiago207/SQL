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



