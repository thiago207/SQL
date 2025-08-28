-- [SQL Server] Variaveis



/* 
Tipos de dados

O tipo de dado � a maneira como o SQL consegue diferenciar cada valor dentro de um banco de dados.

a) Inteiro 
Exemplos:
1, 100, 569

Como o SQL entende um numero inteiro: INT


b) Decimal
Exemplos:
10.33, 90.91, 410.787

Como o SQL entende um numero decimal: FLOAT
Como o SQL entende um numero decimal: DECIMAL(N, M)		

N � a quantidade de d�gitos que o n�meto pode ter, incluindo casas decimais
M � o n�mero m�ximo de casas decimais


c) Texto/String
Exemplos:
'Carla', 'Motorola', 'Pastel', '44'

Como o SQL entende um texto: VARCHAR(N)

N � o n�mero de caracteres que o texto pode ter


d) Data
Exemplos:
'01/01/2021', '23/03/2021'

Como o SQL entende uma data/hora: DATETIME
Como o SQL entende uma data: DATE

*/

--Operacoes basicas:

Select 10 as 'Numero:'
select 'Thiago' as 'nome'
select '20/07/2007' as 'data'


--Operacoes com numeros

select 10+20 as 'soma'
select 20-10 as 'subtracao'
select 10 * 10 'mutiplicacao'
select 181.0/5 as 'divisao'  --(.0) INTEIRO

-- ROUND

SELECT ROUND(18.739130, 2) -- 18.74000

-- ROUND (Truncar)

SELECT ROUND(18.739130, 2, 1) -- 18.7300

-- FLOOR

SELECT FLOOR(18.739130) -- 18

-- CEILING

SELECT CEILING(18.739130) --19

--Operacao texto

select 'Thiago' + ' ' + 'Felipe'

--Operacoes com data


-- SQL_VARIANT_PROPERTY - Identificando o tipo de um dado

SELECT 10 AS 'N�mero'
SELECT 49.50 AS 'Decimal'
SELECT 'Marcus' AS 'Nome'
SELECT '20/06/2021' AS 'Data'

SELECT SQL_VARIANT_PROPERTY(10, 'BaseType')
SELECT SQL_VARIANT_PROPERTY(49.50, 'BaseType')
SELECT SQL_VARIANT_PROPERTY('Marcus', 'BaseType')
SELECT SQL_VARIANT_PROPERTY('20/06/2021', 'BaseType')


-- 1) CAST: Funcao para especificar o tipo dos valores.
-- int: inteiro, float: decimal, varchar: string/texto, datetime: data e hora

SELECT CAST(21.45 AS int)

SELECT CAST(21.45 AS float)

SELECT CAST(18.7 AS varchar)

SELECT CAST('15.6' AS float)

SELECT CAST('31/05/2014' AS datetime)

SELECT SQL_VARIANT_PROPERTY(CAST('20/06/2021' as datetime) , 'BaseType')

-- Exemplo 1: Crie uma consulta juntando o texto 'O preço do produto é: ' com o valor 30.99

SELECT 'O preço do produto é: ' + CAST(30.99 AS VARCHAR(30))

-- Exemplo 2: Adicione 1 dia a data '20/06/2021'

SELECT CAST('20/06/2021' AS DATETIME) + 1





--FORMAT: Função para formatação de valores no SQL

-- a) Numericos:
SELECT FORMAT(1000, 'N')
SELECT FORMAT(1000, 'G')

-- b) Personalizados:
SELECT FORMAT(123456789, '###-##-####')

-- c) Data:
SELECT FORMAT(CAST('21/03/2021' AS DATETIME), 'dd/MM/yyyy')  --'MMM' MES / 'dddd' DIA DA SEMANA

--EXERCICIO:
select	'A data de validade é: ' + format(cast('17/04/2022' as datetime), 'dd/MMM/yyyy' )



/* 
Declarando Vari�veis 

1) O que é uma vari�vel?
Uma variavel e um objeto que armazena o valor de um dado.

2. Estrutura

DECLARE @var tipo
SET @var = valor


DECLARE @var1 INT, @var2 INT,
	 @texto VARCHAR(MAX),
	 @data DATETIME
	
SET @var1 = 10
SET @var1 = 45
SET @texto = 'Um texto qualquer'
SET @data = '18/02/2021'

*/	


SELECT 100 * 8.99 AS 'faturamento'

DECLARE @quantidade AS int, @preco AS float
SET @quantidade = 100
SET @preco = 8.99

SELECT @quantidade * @preco AS 'faturamento'

declare @idade as int
set @idade = 30
select @idade as 'idade'

-- Exemplo 3: Declare uma vari�vel chamada 'nome' e armazene o valor 'Mateus'

declare @nome as varchar(30)
set @nome = 'matheus'
select @nome as 'nome'

-- Exemplo 4: Declare uma vari�vel chamada 'data' e armazene a data de hoje.

declare @data as datetime
set @data = '28/08/2025'


select @data as 'data de hoje'

select day(@data) 




-- declarando mais de uma variavel

declare @int int = 10,
	@varchar varchar(10) = 'texto',
	@data datetime = '20/07/2007'

select @int, @varchar, @data


declare @quantidade int = 100,
	@preco float = 89.99
	
select @quantidade * @preco
