-- ORDER BY

select top(10) *  from DimStore
order by EmployeeCount desc    -- DESC : DECRESENTE , ASC: CRESENTE

SELECT top(10) 
	ProductName, UnitCost, Weight 
from 
	DimProduct
order by UnitCost desc, Weight desc


-- WHERE

--exemplo 1 
SELECT top(100)
	ProductName, UnitPrice
FROM 
	DimProduct
WHERE UnitPrice >= 2000
ORDER BY UnitPrice desc

--exemplo 2
select 
	*
from 
	DimProduct
where BrandName = 'Fabrikam' and ColorName = 'black'

--exemplo 3
select
	*
from
	DimCustomer
where BirthDate >= '1970-12-31'
order by BirthDate desc

-- OPERADORES LOGICOS 
-- AND = E
-- OR = OU
-- NOT = NEGACAO 

-- and:
SELECT
	* 
FROM 
	DimProduct
WHERE BrandName = 'Fabrikam' AND ColorName = 'Black'

-- OR:

SELECT
	* 
FROM 
	DimProduct
WHERE BrandName = 'Contoso' OR BrandName = 'Fabrikam'

-- NOT:
select
	*
from
	DimEmployee
where not DepartmentName = 'Marketing'

--EXERCICIOS:

select * from DimEmployee
where Gender = 'F' and DepartmentName = 'Finance'

select * from DimProduct
where UnitPrice >= 100 and BrandName = 'Contoso' and ColorName = 'Red'

select * from DimProduct
where BrandName = 'Litware' or BrandName = 'Fabrikam' OR ColorName = 'Black'

select * from DimSalesTerritory
where SalesTerritoryGroup = 'Europe' and not SalesTerritoryCountry = 'Italy'

select * from DimProduct
where BrandName = 'Fabrikam' and (ColorName = 'Black' or ColorName = 'Red')


-- IN = entre

--IN:

select * from DimProduct
where ColorName in ('Silver','Blue', 'White', 'Red', 'Black')

-- LIKE = tem isso em tal? nome_completo LIKE '%Felipe%', pega todos nomes que tem felipe em algum lugar

-- LIKE:
select * from DimProduct
where ProductName like '%MP3 Player%'

select * from DimProduct
where ProductDescription like '%Type%'  -- %''% ENTRE % pode esta em qualquer lugar do texto, ''%: apenas no final, %'': apenas no começo

