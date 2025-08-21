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


--Os exerc�cios abaixo est�o divididos de acordo com uma determinada tabela do Banco de Dados. Voc� pode utilizar o INNER JOIN para resolver todas as quest�es.

--FACT SALES
--1. a) Fa�a um resumo da quantidade vendida (Sales Quantity) de acordo com o nome do canal
--de vendas (ChannelName). Voc� deve ordenar a tabela final de acordo com SalesQuantity,
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

--b) Fa�a um agrupamento mostrando a quantidade total vendida (Sales Quantity) e
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




--c) Fa�a um resumo do valor total vendido (Sales Amount) para cada m�s
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



--2. Voc� precisa fazer uma an�lise de vendas por produtos. O objetivo final � descobrir o valor
--total vendido (SalesQuantity) por produto.

--a) Descubra qual � a cor de produto que mais � vendida (de acordo com SalesQuantity).

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
--(ProductCategoryName). Obs: Voc� precisar� fazer mais de 1 INNER JOIN, dado que a rela��o
--entre FactSales e DimProductCategory n�o � direta.

