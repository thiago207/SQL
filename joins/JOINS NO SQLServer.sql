-- JOINS


select * from DimChannel
select top(100) * from FactSales

select top(100) 
	c.ChannelDescription, 
	avg(f.UnitCost) 
from 
	DimChannel as c
LEFT JOIN FactSales as f
ON c.ChannelKey = f.channelKey
group by c.ChannelDescription 


--LEFT JOIN



--RIGHT JOIN



--INNER JOIN


--FULL JOIN



--LEFT ANTI JOIN



--RIGHT ANTI JOIN



--FULL ANTI JOIN
