-- SELECT COM AS PARA MUDAR NOME DAS COLUNAS DE DETERMINADA TABELA

SELECT 
	p.product_id AS ID_Produto,
	p.product_name AS Nome_Produto,
	p.unit_price AS Preco_Por_Unidade
FROM 
	products AS p;
