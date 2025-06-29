CREATE OR REPLACE VIEW dados_produtos AS
SELECT 
	product_id,
	product_name,
	unit_price
FROM products;


ALTER VIEW dados_produtos RENAME TO wwprodutos;

-- DROP VIEW IF EXISTS wwprodutos; PARA DELETAR 