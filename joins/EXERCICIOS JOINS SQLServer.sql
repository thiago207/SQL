--EXERCICIOS JOINS:

--1)

--Utilize o INNER JOIN para trazer os nomes das subcategorias dos produtos, da tabela
--DimProductSubcategory para a tabela DimProduct.

select * from DimProduct
select * from DimProductSubcategory


select p.*,
	   s.ProductSubcategoryName
from DimProduct as p
inner join DimProductSubcategory as s
on p.ProductSubcategoryKey = s.ProductSubcategoryKey


--2)
--Identifique uma coluna em comum entre as tabelas DimProductSubcategory e
--DimProductCategory. Utilize essa coluna para complementar informa��es na tabela
--DimProductSubcategory a partir da DimProductCategory. Utilize o LEFT JOIN.
select * from DimProductSubcategory
select * from DimProductSubcategory


