--EXERCICIOS JOINS:

--1)

--Utilize o INNER JOIN para trazer os nomes das subcategorias dos produtos, da tabela
--DimProductSubcategory para a tabela DimProduct.

select * from DimProduct
select * from DimProductSubcategory


select p.ProductName, p.ProductKey,
	   s.ProductSubcategoryName
from DimProduct as p
inner join DimProductSubcategory as s
on p.ProductSubcategoryKey = s.ProductSubcategoryKey


--2)
--Identifique uma coluna em comum entre as tabelas DimProductSubcategory e
--DimProductCategory. Utilize essa coluna para complementar informações na tabela
--DimProductSubcategory a partir da DimProductCategory. Utilize o LEFT JOIN.
select * from DimProductCategory
select * from DimProductSubcategory

select s.ProductSubcategoryName, s.ProductSubcategoryKey, s.ProductSubcategoryDescription,
	   c.ProductCategoryName
FROM DimProductSubcategory as s
left join DimProductCategory as c
on s.ProductCategoryKey = c.ProductCategoryKey
	


--3)
--Para cada loja da tabela DimStore, descubra qual o Continente e o Nome do País associados
--(de acordo com DimGeography). Seu SELECT final deve conter apenas as seguintes colunas:
--StoreKey, StoreName, EmployeeCount, ContinentName e RegionCountryName. Utilize o LEFT
--JOIN neste exercício.

select * from DimStore
select * from DimGeography

select s.StoreKey, s.StoreName, s.EmployeeCount, 
	   G.ContinentName, G.RegionCountryName
from DimStore as s
LEFT join DimGeography as g
on s.GeographyKey = g.GeographyKey


--4)
--Complementa a tabela DimProduct com a informação de ProductCategoryDescription. Utilize
--o LEFT JOIN e retorne em seu SELECT apenas as 5 colunas que considerar mais relevantes.


select * from DimProduct
select * from DimProductCategory


select p.ProductName, p.ProductKey,
	   c.ProductCategoryName, c.ProductCategoryDescription
from DimProduct as p
left join DimProductSubcategory as s
on p.ProductSubcategoryKey = s.ProductSubcategoryKey
left join DimProductCategory as c
on s.ProductCategoryKey = c.ProductCategoryKey


--5)

--A tabela FactStrategyPlan resume o planejamento estratégico da empresa. Cada linha
--representa um montante destinado a uma determinada AccountKey.

--a) Faça um SELECT das 100 primeiras linhas de FactStrategyPlan para reconhecer a tabela.
select top(100) * from FactStrategyPlan
select top(100) * from DimAccount
--b) Faça um INNER JOIN para criar uma tabela contendo 
--o AccountName para cada AccountKey da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas:

/*• StrategyPlanKey
• DateKey
• AccountName
• Amount*/ 

select top (100) s.StrategyPlanKey,
	s.DateKey,
	s.Amount,
	a.AccountName
from FactStrategyPlan as s
inner join DimAccount as a
on s.AccountKey = a.AccountKey

--6)
--Vamos continuar analisando a tabela FactStrategyPlan. Além da coluna AccountKey que
--identifica o tipo de conta, há também uma outra coluna chamada ScenarioKey. Essa coluna
--possui a numeração que identifica o tipo de cenário: Real, Orçado e Previsão.
--Faça um INNER JOIN para criar uma tabela contendo o ScenarioName para cada ScenarioKey
--da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas:

/* StrategyPlanKey
 DateKey
 ScenarioName
 Amount*/
select top(100) * from FactStrategyPlan
select top(100) * from DimScenario


select top (100) p.StrategyPlanKey,
	p.DateKey,
	p.Amount,
	s.ScenarioName
from FactStrategyPlan as p
inner join DimScenario as s
on p.ScenarioKey = s.ScenarioKey 


--7)
--Algumas subcategorias não possuem nenhum exemplar de produto. Identifique que
--subcategorias são essas


select * from DimProduct
select * from DimProductSubcategory

select --p.ProductName, p.ProductKey,
	   s.ProductSubcategoryName
from DimProduct as p
right join DimProductSubcategory as s
on p.ProductSubcategoryKey = s.ProductSubcategoryKey
where p.ProductKey is null


--8)
--A tabela abaixo mostra a combinação entre Marca e Canal de Venda, para as marcas Contoso,
--Fabrikam e Litware. Crie um código SQL para chegar no mesmo resultado.
select 
	   distinct BrandName,
	   ChannelName
from
	DimProduct CROSS JOIN DimChannel
where BrandName in ('Fabrikam', 'Litware', 'Contoso')


--9)
/*Neste exercício, você deverá relacionar as tabelas FactOnlineSales com DimPromotion.
Identifique a coluna que as duas tabelas têm em comum e utilize-a para criar esse
relacionamento.

Retorne uma tabela contendo as seguintes colunas:
• OnlineSalesKey
• DateKey
• PromotionName
• SalesAmount

A sua consulta deve considerar apenas as linhas de vendas referentes a produtos com
desconto (PromotionName <> ‘No Discount’). Além disso, você deverá ordenar essa tabela de
acordo com a coluna DateKey, em ordem crescente.*/

select top(100) * from DimPromotion
select top(100) * from FactOnlineSales

select o.OnlineSalesKey,
	o.DateKey,
	p.PromotionName,
	o.SalesAmount
from FactOnlineSales as o
inner join DimPromotion as p
on o.PromotionKey = p.PromotionName
where p.PromotionName <> 'No Discount'
order by o.DateKey asc


--10)
--A tabela abaixo é resultado de um Join entre a tabela FactSales e as tabelas: DimChannel,
--DimStore e DimProduct.
--Recrie esta consulta e classifique em ordem decrescente de acordo com SalesAmount.

select top(10) * from FactSales 
select top(10) * from DimChannel
select top(10) * from DimProduct
select top(10) * from DimStore

select sales.SalesKey,
	   cha.ChannelName,
	   store.StoreName,
	   ProductName,
	   sales.SalesAmount
from FactSales as sales
inner join DimChannel as cha
on sales.channelKey = cha.ChannelKey
inner join DimStore as store
on sales.StoreKey = store.StoreKey
inner join DimProduct as p
on sales.ProductKey = p.ProductKey