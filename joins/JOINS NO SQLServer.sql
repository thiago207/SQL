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
LEFT ANTI JOIN subcategoria as s
ON p.id_subcategoria = s.id_subcategoria



--RIGHT ANTI JOIN



--FULL ANTI JOIN
