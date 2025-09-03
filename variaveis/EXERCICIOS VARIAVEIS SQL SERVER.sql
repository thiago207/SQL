--1. Declare 4 vari�veis inteiras. Atribua os seguintes valores a elas:
--valor1 = 10
--valor2 = 5
--valor3 = 34
--valor4 = 7

DECLARE 
	@valor1 float = 10,
	@valor2  float = 5,
	@valor3 float = 34,
	@valor4 float = 7


--a) Crie uma nova vari�vel para armazenar o resultado da soma entre valor1 e valor2. Chame essa vari�vel de soma.

declare 
	@soma_valor1_valor2 int = @valor1 + @valor2
print @soma_valor1_valor2

--b) Crie uma nova vari�vel para armazenar o resultado da subtra��o entre valor3 e valor 4.
--Chame essa vari�vel de subtracao.
declare 
	@sub int = @valor3 - @valor4
print @sub


--c) Crie uma nova vari�vel para armazenar o resultado da multiplica��o entre o valor 1 e o
--valor4. Chame essa vari�vel de multiplicacao.
declare 
	@mut int = @valor1 * @valor4
print @mut

--d) Crie uma nova vari�vel para armazenar o resultado da divis�o do valor3 pelo valor4. Chame
--essa vari�vel de divisao. Obs: O resultado dever� estar em decimal, e n�o em inteiro.
declare 
	@div float = @valor3 / @valor4
select round(@div, 2)



--2. Para cada declara��o das vari�veis abaixo, aten��o em rela��o ao tipo de dado que dever� ser
--especificado.


--a) Declare uma vari�vel chamada �produto� e atribua o valor de �Celular�.
declare 
	@produto varchar(30) = 'Celualar' 

--b) Declare uma vari�vel chamada �quantidade� e atribua o valor de 12.
declare 
	@quantidade int = 12
--c) Declare uma vari�vel chamada �preco� e atribua o valor 9.99.
declare 
	@preco float = 9.99
--d) Declare uma vari�vel chamada �faturamento� e atribua o resultado da multiplica��o entre
--�quantidade� e �preco�.
declare 
	@faturamento float = @preco * @quantidade
--e) Visualize o resultado dessas 4 vari�veis em uma �nica consulta, por meio do SELECT.
select 
	@produto,
	@quantidade,
	@preco,
	@faturamento



--3. Voc� � respons�vel por gerenciar um banco de dados onde s�o recebidos dados externos de usu�rios. Em resumo, esses dados s�o:

-- - Nome do usu�rio
-- - Data de nascimento
-- - Quantidade de pets que aquele usu�rio possui


--Voc� precisar� criar um c�digo em SQL capaz de juntar as informa��es fornecidas por este usu�rio. 
--Para simular estes dados, crie 3 vari�veis, chamadas: nome, data_nascimento e num_pets. Voc� dever� armazenar os valores respectivamente.
declare 
	@nome varchar(10) = 'Thiago',
	@data_nascimento datetime = '20/07/2007',
	@num_pets int = 2

select 
	'Meu nome �: ' + @nome + ' nasci em '+ FORMAT(@data_nascimento, 'dd/MM/yyyy') + ' tenho ' + cast(@num_pets as varchar) + ' pets.'
--Dica: voc� precisar� utilizar as fun��es CAST e FORMAT para chegar no resultado.


--4. Voc� acabou de ser promovido e o seu papel ser� realizar um controle de qualidade sobre as lojas da empresa.

--A primeira informa��o que � passada a voc� � que o ano de 2008 foi bem complicado para a empresa, pois foi quando duas das principais lojas fecharam. O seu primeiro desafio � descobrir
--o nome dessas lojas que fecharam no ano de 2008, para que voc� possa entender o motivo e
--mapear planos de a��o para evitar que outras lojas importantes tomem o mesmo caminho.
--O seu resultado dever� estar estruturado em uma frase, com a seguinte estrutura:

--�As lojas fechadas no ano de 2008 foram: � + nome_das_lojas

--Obs: utilize o comando PRINT (e n�o o SELECT!) para mostrar o resultado.

declare 
	@LOJAS_2008 varchar(max)
set	@LOJAS_2008 = ''

select
	@LOJAS_2008  = @LOJAS_2008 + StoreName + ', '
from 
	DimStore 
where year(LoadDate) = '2008'

print 'As lojas fechadas no ano de 2008 foram: ' + @LOJAS_2008

--5. Voc� precisa criar uma consulta para mostrar a lista de produtos da tabela DimProduct para
--uma subcategoria espec�fica: �Lamps�.

--Utilize o conceito de vari�veis para chegar neste resultado.

select * from DimProductSubcategory

select * from DimProduct



select 
	p.ProductName,
	s.ProductSubcategoryName
from 
	DimProductSubcategory as s
inner join DimProduct as p
on s.ProductSubcategoryKey = p.ProductSubcategoryKey
where s.ProductSubcategoryName = 'Lamps'
group by s.ProductSubcategoryName, p.ProductName
