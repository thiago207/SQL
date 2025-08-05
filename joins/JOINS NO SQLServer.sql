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

--RIGHT JOIN



--INNER JOIN


--FULL JOIN



--LEFT ANTI JOIN



--RIGHT ANTI JOIN



--FULL ANTI JOIN
