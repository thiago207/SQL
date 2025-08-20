--joins com group by


select top(10)* from FactSales

select top(10) * from DimDate


select	
	CalendarYear as 'Ano',
	sum(SalesQuantity) as 'Total vendido'
from 
	FactSales
left join DimDate