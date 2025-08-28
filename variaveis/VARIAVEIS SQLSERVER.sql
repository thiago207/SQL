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


-- Exemplo 1: Crie uma consulta juntando o texto 'O pre�o do produto �: ' com o valor 30.99

SELECT 'O pre�o do produto �: ' + CAST(30.99 AS VARCHAR(30))

-- Exemplo 2: Adicione 1 dia � data '20/06/2021'

SELECT CAST('20/06/2021' AS DATETIME) + 1
