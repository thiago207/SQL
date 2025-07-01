INSERT INTO alunos(ID_Aluno, Nome_Aluno, Email)
VALUES
	(1, 'Thiago', 'abc123@gmail.com'),
	(2, 'Bruno', 'bruno_@outlook.com'),
	(3, 'Juliana', 'julianasf4@hotmail.com'),
	(4, 'Ana', 'anachaves3@gmail.com');

SELECT * FROM alunos;

INSERT INTO cursos(ID_Curso, Nome_Curso, Preco_Curso)
VALUES
	(1, 'Excel', 100),
	(2, 'Python', 129),
	(3, 'SQL', 150);

	
SELECT * FROM cursos;

INSERT INTO matriculas(ID_Matricula, ID_Aluno, ID_Curso, Data_Cadastro)
VALUES
	(1, 3, 3, '2025/06/23'),
	(2, 4, 3, '2022/03/26'),
	(3, 3, 2, '2021/05/03'),
	(4, 4, 2, '2020/10/02'),
	(5, 2, 1, '2019/09/21'),
	(6, 1, 1, '2025/03/04');

SELECT * FROM matriculas;

UPDATE cursos
SET Preco_Curso = 350
WHERE ID_Curso = 1;

DELETE FROM matriculas
WHERE ID_Matricula = 6;


--TRUNCATE TABLE MATRICULAS

