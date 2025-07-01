CREATE TABLE cursos(
	ID_Curso INT ,
	Nome_Curso VARCHAR(100) NOT NULL ,
	Preco_Curso NUMERIC(10, 2) NOT NULL,
	PRIMARY KEY(ID_Curso)
	
);

CREATE TABLE alunos(
	ID_Aluno INT,
	Nome_Aluno VARCHAR(100) NOT NULL ,
	Email VARCHAR(100) NOT NULL,
	PRIMARY KEY(ID_Aluno)
);
CREATE TABLE matriculas(
	ID_Matricula INT,
	ID_Aluno INT NOT NULL,
	ID_Curso INT NOT NULL,
	Data_Cadastro DATE NOT NULL,
	PRIMARY KEY(ID_Matricula),
	FOREIGN KEY(ID_Aluno) REFERENCES alunos(ID_Aluno),
	FOREIGN KEY(ID_Curso) REFERENCES cursos(ID_Curso)
);