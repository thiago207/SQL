-- JOINS


--LEFT JOIN
select * from produtos
select * from subcategoria

select 
	p.id_produto, p.nome_produto, p.id_subcategoria,
	s.nome_subcategoria
from 
	produtos as p
LEFT JOIN subcategoria as s
ON p.id_subcategoria = s.id_subcategoria
W
--RIGHT JOIN

select 
	p.id_produto, p.nome_produto, p.id_subcategoria,
	s.nome_subcategoria
from 
	produtos as p
RIGHT JOIN subcategoria as s
ON p.id_subcategoria = s.id_subcategoria




--INNER JOIN


select 
	p.id_produto, p.nome_produto, p.id_subcategoria,
	s.nome_subcategoria
from 
	produtos as p
INNER JOIN subcategoria as s
ON p.id_subcategoria = s.id_subcategoria



--FULL JOIN

select 
	p.id_produto, p.nome_produto, p.id_subcategoria,
	s.nome_subcategoria
from 
	produtos as p
FULL JOIN subcategoria as s
ON p.id_subcategoria = s.id_subcategoria




--LEFT ANTI JOIN

select 
	p.id_produto, p.nome_produto, p.id_subcategoria,
	s.nome_subcategoria
from 
	produtos as p
LEFT JOIN subcategoria as s
ON p.id_subcategoria = s.id_subcategoria
where nome_subcategoria is null


--RIGHT ANTI JOIN

select 
	p.id_produto, p.nome_produto, p.id_subcategoria,
	s.nome_subcategoria
from 
	produtos as p
right JOIN subcategoria as s
ON p.id_subcategoria = s.id_subcategoria
where id_produto is null


--FULL ANTI JOIN

select	
	p.id_produto, p.nome_produto, p.id_subcategoria,
	s.nome_subcategoria
from 
	produtos as p
full JOIN subcategoria as s
ON p.id_subcategoria = s.id_subcategoria
where id_produto  is  null or s.id_subcategoria is null


--EXEMPLOS:

select ProductKey, ProductName, ProductSubcategoryKey from DimProduct
select ProductSubcategoryKey, ProductSubcategoryName from DimProductSubcategory

select 
	p.ProductKey, p.ProductName, p.ProductSubcategoryKey,
	s.ProductSubcategoryName

from DimProduct as p
right join DimProductSubcategory  as s
on p.ProductSubcategoryKey = s.ProductSubcategoryKey

--COMO ESCOLHER ENTRE RIGHT OU LEFT JOIN?

--1. A LEFT é para complementar informacao da tabelas do produtos (LEFT) de acordo com a tabela de categoria (RIGHT)
select 
	p.id_produto, p.nome_produto, p.id_subcategoria,
	s.nome_subcategoria
from 
	produtos as p
FULL JOIN subcategoria as s
ON p.id_subcategoria = s.id_subcategoria



--CROSSJOIN:
select * from marcas
select * from subcategoria


SELECT 
	marca, nome_subcategoria
from 
	marcas CROSS JOIN subcategoria




--MUTIPLOS JOINS:

select ProductKey, ProductName, ProductSubcategoryKey from DimProduct
select ProductSubcategoryKey, ProductSubcategoryName, ProductCategoryKey from DimProductSubcategory
SELECT ProductCategoryKey, ProductCategoryName from DimProductCategory


select  p.ProductKey, p.ProductName, p.ProductSubcategoryKey,
		s.ProductSubcategoryName,
		c. ProductCategoryName
from
	DimProduct as p
left join DimProductSubcategory as s
on p.ProductSubcategoryKey = s.ProductSubcategoryKey
inner join  DimProductCategory as c
on s.ProductCategoryKey = c.ProductCategoryKey