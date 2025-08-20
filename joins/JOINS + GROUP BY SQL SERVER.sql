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


--b) Fa�a um agrupamento mostrando a quantidade total vendida (Sales Quantity) e
--quantidade total devolvida (Return Quantity) de acordo com o nome das lojas
--(StoreName).




--c) Fa�a um resumo do valor total vendido (Sales Amount) para cada m�s
--(CalendarMonthLabel) e ano (CalendarYear)



