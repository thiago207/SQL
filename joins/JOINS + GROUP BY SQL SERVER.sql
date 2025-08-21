--joins com group by


select	
	d.CalendarYear as 'Ano',
	sum(SalesQuantity) as 'Total vendido'
from 
	FactSales as f
left join DimDate as d
on f.DateKey = d.DateKey
group by d.CalendarYear


select	
	d.CalendarYear as 'Ano',
	sum(SalesQuantity) as 'Total vendido'
from 
	FactSales as f
left join DimDate as d
on f.DateKey = d.DateKey
where d.CalendarMonthLabel = 'January'
group by d.CalendarYear
order by sum(SalesQuantity) DESC

select	
	d.CalendarYear as 'Ano',
	sum(SalesQuantity) as 'Total vendido'
from 
	FactSales as f
left join DimDate as d
on f.DateKey = d.DateKey
where d.CalendarMonthLabel = 'January'
group by d.CalendarYear
HAVING sum(SalesQuantity) >= 1200000


--Os exercícios abaixo estão divididos de acordo com uma determinada tabela do Banco de Dados. Você pode utilizar o INNER JOIN para resolver todas as questões.

--FACT SALES
--1. a) Faça um resumo da quantidade vendida (Sales Quantity) de acordo com o nome do canal
--de vendas (ChannelName). Você deve ordenar a tabela final de acordo com SalesQuantity,
--em ordem decrescente.

SELECT 
	c.ChannelName,
	sum(SalesQuantity)
from
	FactSales as f
inner join DimChannel as c
on f.channelKey = c.ChannelKey
group by c.ChannelName
order by sum(SalesQuantity) DESC

--b) Faça um agrupamento mostrando a quantidade total vendida (Sales Quantity) e
--quantidade total devolvida (Return Quantity) de acordo com o nome das lojas
--(StoreName).

SELECT 
	s.StoreName,
	sum(SalesQuantity), 
	sum(ReturnQuantity)
from
	FactSales as f
inner join DimStore as s
on s.StoreKey = f.StoreKey
group by s.StoreName




--c) Faça um resumo do valor total vendido (Sales Amount) para cada mês
--(CalendarMonthLabel) e ano (CalendarYear)

SELECT 
	d.CalendarMonthLabel,
	d.CalendarYear,
	sum(SalesAmount) 
from
	FactSales as f
inner join DimDate as d
on f.DateKey = d.DateKey
group by d.CalendarMonthLabel, d.CalendarYear, d.CalendarMonth
order by d.CalendarMonth ASC



--2. Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor
--total vendido (SalesQuantity) por produto.

--a) Descubra qual é a cor de produto que mais é vendida (de acordo com SalesQuantity).

select  
	p.ColorName,
	SUM(SalesQuantity) as 'Total Vendido Por Cor'
from 
	FactSales as f
inner join DimProduct as p
on p.ProductKey = f.ProductKey
group by p.ColorName


--b) Quantas cores tiveram uma quantidade vendida acima de 3.000.000.

select  
	p.ColorName,
	SUM(SalesQuantity) as 'Total Vendido Por Cor'
from 
	FactSales as f
inner join DimProduct as p
on p.ProductKey = f.ProductKey
group by p.ColorName
having SUM(SalesQuantity) >= 3000000



--3. Crie um agrupamento de quantidade vendida (SalesQuantity) por categoria do produto
--(ProductCategoryName). Obs: Você precisará fazer mais de 1 INNER JOIN, dado que a relação
--entre FactSales e DimProductCategory não é direta.

select  
	c.ProductCategoryName,
	SUM(SalesQuantity) as 'Total Vendido'
from 
	FactSales as f

inner join DimProduct as p
	on p.ProductKey = f.ProductKey

inner join DimProductSubcategory as sb
	on p.ProductSubcategoryKey = sb.ProductSubcategoryKey 

inner join DimProductCategory as c
	on c.ProductCategoryKey = sb.ProductCategoryKey

group by c.ProductCategoryName 


--FACTONLINESALES
--4. 

--a) Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o nome completo
--do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).

select top(10) * from FactOnlineSales

select 
top(1)
	c.FirstName,
	c.LastName,
	sum(SalesQuantity)
from 
	 FactOnlineSales as fs
inner join DimCustomer as c
on fs.CustomerKey = c.CustomerKey
where c.CustomerType = 'Person'
group by c.FirstName, c.LastName, c.CustomerKey
order by sum(SalesQuantity) DESC

--b) Feito isso, faça um agrupamento de produtos e descubra quais foram os top 10 produtos mais
--comprados pelo cliente da letra a, considerando o nome do produto.


select 
top(10)
	p.ProductName,
	sum(SalesQuantity)
from 
	 FactOnlineSales as fs
inner join DimProduct as p
on fs.ProductKey = p.ProductKey
where CustomerKey = 7665
group by p.ProductName
order by sum(SalesQuantity) DESC


--5.Faça um resumo mostrando o total de produtos comprados (Sales Quantity) de acordo com o
--sexo dos clientes.


select 
	c.Gender,
	sum(SalesQuantity)
from 
	 FactOnlineSales as fs
inner join DimCustomer as c
on fs.CustomerKey = c.CustomerKey
where c.Gender is not null
group by c.Gender
order by sum(SalesQuantity) DESC


--FACTEXCHANGERATE
--6. Faça uma tabela resumo mostrando a taxa de câmbio média de acordo com cada
--CurrencyDescription. A tabela final deve conter apenas taxas entre 10 e 100.

select top(10) * from FactExchangeRate
select top(10) * from DimCurrency

select 
	c.CurrencyDescription,
	AVG(AverageRate)
from FactExchangeRate as f
inner join DimCurrency as c
on c.CurrencyKey = f.CurrencyKey
group by c.CurrencyDescription
having AVG(AverageRate) between 10 and 100

--FACTSTRATEGYPLAN
--7. Calcule a SOMA TOTAL de AMOUNT referente à tabela FactStrategyPlan destinado aos
--cenários: Actual e Budget.
--Dica: A tabela DimScenario será importante para esse exercício.

select
	s.ScenarioName,
	sum(Amount)
from FactStrategyPlan as p
inner join DimScenario as s
on s.ScenarioKey = p.ScenarioKey
where s.ScenarioName IN ('Actual' , 'Budget')
group by s.ScenarioName

--8. Faça uma tabela resumo mostrando o resultado do planejamento estratégico por ano.

select
	d.CalendarYear,
	sum(Amount)
from FactStrategyPlan as p
inner join DimDate as d
on d.Datekey = p.Datekey
group by d.CalendarYear



--DIMPRODUCT/DIMPRODUCTSUBCATEGORY



--9. Faça um agrupamento de quantidade de produtos por ProductSubcategoryName. Leve em
--consideração em sua análise apenas a marca Contoso e a cor Silver.

select 
	s.ProductSubcategoryName,
	count(*) as 'Quantidade de produto'
from
	DimProduct as p
inner join DimProductSubcategory as s
on s.ProductCategoryKey = p.ProductSubcategoryKey
group by s.ProductSubcategoryName


--10. Faça um agrupamento duplo de quantidade de produtos por BrandName e
--ProductSubcategoryName. A tabela final deverá ser ordenada de acordo com a coluna
--BrandName


select 
	s.ProductSubcategoryName,
	p.BrandName,
	count(*) as 'Quantidade de produto'
from
	DimProduct as p
inner join DimProductSubcategory as s
on s.ProductCategoryKey = p.ProductSubcategoryKey
group by s.ProductSubcategoryName, p.BrandName
order by p.BrandName DESC