CREATE TABLE ALUNO(
	ra 			varchar(10),
  	nome 	 varchar(60)
);

Select * from aluno;

INSERT into aluno(ra, nome)
VALUES('1','joao');

INSERT into aluno(ra, nome)
VALUES('2','maria');

INSERT into aluno(ra, nome)
VALUES('3','nicoly');

INSERT into aluno(ra, nome)
VALUES('4','carol');

INSERT into aluno(ra, nome)
VALUES('5','jose');

SELECT nome from ALUNO
WHERE ra = 2;

declare @ra varchar(10) --para declarar variavel e usar @ra pode ter valor atualizado em um unico local
set @ra = 6;
SELECT COUNT(*) as 'total where ra = 2' from ALUNO
WHERE ra = @ra;

DECLARE @nome varchar(60)
Set @nome = 'maria';
SELECT ra, nome FROM ALUNO
WHERE nome = @nome;

SELECT nome, len(nome) FROM aluno ; --usam funções do sql

SELECT ascii('a');

SELECT char(97);

SELECT charindex('couves', 'jose das couves');

SELECT left('jose das couves', 4);


--CRIANDO NOSSAS PROPRIAS FUNCOES

create function dbo.fatorial (@numero int) --função que calcula o fatorial
returns INT 
	AS
BEGIN 
	if(@numero <= 1)
		return 1
	return @numero *dbo.fatorial(@numero - 1)
end

SELECT dbo.fatorial(0);

create function dbo.fibonati (@numero int) --função que calcula sequencia de fibonat
returns INT 
	AS
BEGIN 
	if(@numero <2)
		return @numero
	return dbo.fibonati(@numero - 1) + dbo.fibonati (@numero -2);
end

drop function dbo.fibonati;

SELECT dbo.fibonati(1);
SELECT dbo.fibonati(2);
SELECT dbo.fibonati(3);
SELECT dbo.fibonati(4);
SELECT dbo.fibonati(5);