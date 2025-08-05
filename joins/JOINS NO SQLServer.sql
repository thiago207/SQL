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



