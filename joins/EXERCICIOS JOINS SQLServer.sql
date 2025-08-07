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
