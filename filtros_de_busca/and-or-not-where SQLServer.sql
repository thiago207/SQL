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
