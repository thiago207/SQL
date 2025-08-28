--Variaveis 
-- [SQL Server] Vari�veis
-- Aula 2 de 23: Tipos de Dados

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

select 20/07/2007 + 1

