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



