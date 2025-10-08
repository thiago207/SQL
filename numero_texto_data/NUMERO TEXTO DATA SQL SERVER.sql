--NUMERO TEXTO E DATA NO SQL SERVER


--LEN e DATALENGTH
-- Exemplo: Descubra a quantidade de caracteres da palavra 'SQL Hashtag'

SELECT
	LEN('SQL Hashtag') AS 'Len',
	DATALENGTH('SQL Hashtag') AS 'Datalength'



-- CONCAT ---> Permite juntar mais de um texto em uma �nica palavra
-- Exemplo: Fa�a uma consulta � tabela DimCustomer onde seja poss�vel visualizar o nome completo de cada cliente.

SELECT
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	EmailAddress AS 'E-mail',
	CONCAT(FirstName, ' ', LastName) AS 'Nome Completo'
FROM
	DimCustomer



-- LEFT ---> Extrai uma determinada quantidade de caracteres de um texto, da esquerda para a direita
-- RIGHT ---> Extrai uma determinada quantidade de caracteres de um texto, da direita para a esquerda
-- Exemplo: Fa�a uma consulta � tabela DimProduct e divida a coluna de StyleName em 2 partes

SELECT * FROM DimProduct
SELECT
	ProductName AS 'Produto',
	UnitPrice AS 'Pre�o',
	LEFT(StyleName, 7) AS 'Cod 1',
	RIGHT(StyleName, 7) AS 'Cod 2'
FROM
	DimProduct

