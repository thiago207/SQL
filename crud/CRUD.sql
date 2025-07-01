--CREATE DATABASE teste;
--DROP DATABASE teste;
--CREATE TABLE tabela(coluna1 TIPO1, coluna2 TIPO2);


CREATE DATABASE hashtag;

CREATE TABLE cursos(
	ID_Curso INT,
	Nome_Curso VARCHAR(100),
	Preco_Curso NUMERIC(10, 2)
	
);

CREATE TABLE alunos(
	ID_Aluno INT,
	Nome_Aluno VARCHAR(100),
	Email VARCHAR(100)
	
);
CREATE TABLE matriculas(
	ID_Matricula INT,
	ID_Aluno INT,
	ID_Curso INT,
	Data_Cadastro DATE
	
);





