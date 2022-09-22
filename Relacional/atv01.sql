create table departamento (
 idDepto integer not null primary key ,
 nomeDepto varchar(15) not null,
 gerente integer not null,
 divisao varchar(10) not null,
 local varchar(15) not null)

insert departamento (iddepto, nomedepto, gerente, 
divisao, local) 
 values(1,'RH', 1, 'Adm', 'Diadema') 
 insert departamento (iddepto, nomedepto, gerente, 
divisao, local) 
 values(2,'C.Rec.', 3, 'Adm', 'Diadema') 
 insert departamento (iddepto, nomedepto, gerente, 
divisao, local) 
 values(3,'CP', 2, 'Adm', 'Diadema') 

create table Empregado(
 IdEmpregado integer NOT NULL,
 NomeEmpregado varchar(20) NOT NULL,
 IdDepto integer NOT NULL,
 Cargo varchar(6) NOT NULL,
 Tempo_Emp integer NULL,
 Salario decimal(10,2) NULL,
 Comissao decimal(10,2) NULL
 PRIMARY KEY (IdEmpregado)
)

insert into empregado (idempregado, nomeempregado, 
iddepto, cargo, tempo_emp, salario, comissao)
values (1, 'Marcos', 1, 'Prof', 10, 1800.00, 10)
insert into empregado (idempregado, nomeempregado, 
iddepto, cargo, tempo_emp, salario, comissao)
values (2, 'Maria', 1, 'Aux.', 1, 1500.00, 10)
insert into empregado (idempregado, nomeempregado, 
iddepto, cargo, tempo_emp, salario, comissao)
values (3, 'Juliana', 2, 'Aux.', 1, 1500.00, 10)


--Lista Nome e salário de todos os Empregados.
SELECT NomeEmpregado,Salario FROM Empregado;

--. Lista Nome e Local de todos os Departamentos
SELECT nomeDepto, Local FROM Departamentos;

--. Lista Nome, salário e comissão dos Empregados com salario maior que 1.800.
SELECT NomeEmpregado,Salario, Comissao FROM Empregado 
WHERE Salario > 1800;

--lista Nome, divisão e Local dos Departamentos da divisão SUL.
SELECT nomeDepto, divisao,Local FROM Departamentos
WHERE divisao = 'sul';

-- Lista Nome, departamento, salario e cargo dos Empregados  com cargo GER e salário menor que 2.000.
SELECT NomeEmpregado, IdDepto, Salario,Cargo FROM Empregado
WHERE Cargo ='GER' and Salario < 2000;

--. Lista todos os dados dos Empregados com cargo ATEND ou salário entre 1.800 e 2.000.----------------------------------------------
SELECT * FROM Empregado 
WHERE Cargo ='ATEND' OR Salario BETWEEN 1800 AND 2000;

--lista Nome, Salário, comissão e remuneração total (Salário + Comissão) de todos os empregados.------------------------------------------------
SELECT NomeEmpregado, Salario, Comissao, Salario +Isnull(Comissao, 0) AS 'REMUNERAÇÃO TOTAL' FROM Empregado;

--. Lista Nome, Salário, comissão e remuneração  total (Salário + Comissão) de todos os empregados com salário maior que 2.000 ou comissão maior que 700.
SELECT NomeEmpregado, Salario, Comissao, Salario + ISNULL(Comissao, 0) AS 'remuneração total' FROM Empregado 
WHERE Salario > 2000 OR Comissao > 700;

-- Lista Nome, Salário, comissão e remuneração total de todos os empregados com remuneração total menor que 1.800.----------------------------------------------
SELECT NomeEmpregado, Salario, Comissao, Salario + ISNULL(Comissao, 0) AS 'REMUNERAÇÃO TOTAL' 
FROM Empregado
WHERE Salario + ISNULL(Comissao, 0) < 1800;

--lista Nome e cargo dos Empregados que o nome comece com a letra D.------------------------------------------------------------------------
SELECT NomeEmpregado, Cargo
FROM Empregado
WHERE NomeEmpregado LIKE 'D%';

--Lista Nome e cargo dos Empregados que o nome tenha N como terceira letra.
SELECT NomeEmpregado, Cargo
FROM Empregado
WHERE NomeEmpregado LIKE '___N%';

--. Lista Nome e cargo dos Empregados que o nome tenha N (maiúscula ou minúscula) como terceira letra
SELECT NomeEmpregado, Cargo 
FROM Empregado
WHERE NomeEmpregado LIKE '___N%';


--.Lista Nome, Salário, comissão e remuneração total (Salário + Comissão) de todos os empregados com salário maior que 2.000 ou comissão maior que 800. Apresenta o resultado classificado em ordem alfabética de nome
SELECT NomeEmpregado, Salario, Comissao, Salario + ISNUL(Comissao, 0) AS 'remuneração total' 
FROM Empregado
WHERE Salario> 2000 OR Comissao > 800
ORDER BY NomeEmpregado;

--Lista Nome, Salário, comissão e remuneração total (Salário + Comissão) de todos os empregados com salário maior que 2.000 ou comissão maior que 800. Apresenta o resultado classificado em ordem crescente de salario.
SELECT NomeEmpregado, Salario,Comissao, Salario + ISNUL(Comissao,0) AS 'REMUNERAÇÃO TOTAL' 
FROM Empregado
WHERE Salario > 2000 OR Comissao > 800
ORDER BY Salario;

--.Lista Nome, Salário, comissão e remuneração total (Salário + Comissão) de todos os empregados com salário maior que 2.000 ou comissão maior que 800. Apresenta o resultado classificado em ordem decrescente de salario. ------------------------------------------------------
SELECT NomeEmpregado, Salario, Comissao, Salario + ISNUL(Comissao,0) AS 'REMUNERAÇÃO TOTAL' 
FROM Empregado 
WHERE Salario > 2000 OR Comissao > 800
ORDER BY Salario DESC;

--.Lista Nome, Salário, comissão e remuneração total (Salário + Comissão) de todos os empregados com salário maior que 2.000 ou comissão maior que 800. Apresenta o resultado classificado em ordem crescente de remuneração total-------------------------------------------------------------------------------------------
SELECT NomeEmpregado, Salario, Comissao, Salario + ISNUL(Comissao,0) AS 'REMUNERAÇÃO TOTAL' 
FROM Empregado
WHERE Salario > 2000 OR Comissao > 800
ORDER BY 3;

--.Lista Nome, Salário, comissão e remuneração total de todos os empregados com salário maior que 2.000 ou comissão maior que 800. Apresenta o resultado classificado em ordem crescente de departamento e em cada departamento, em ordem decrescente de salario.---------------------------------------------------------------------------------------------------------
SELECT NomeEmpregado, Salario, Comissao, Salario+ ISNUL(Comissao,0) AS 'REMUNERAÇÃO TOTAL'
FROM Empregado
WHERE Salario > 2000 OR Comissao > 800
ORDER BY IdDepto, Salario DESC;

--Lista o maior salário, o menor salário e a média dos salários de todos os Empregados. -----------------------------------------------------------------------------------------
SELECT MAX(Salario) AS 'MAIOR SALARIO', 
MIN(Salario) AS 'MENOR SALARIO', 
AVG(Salario) AS 'MEDIA DE SALARIO'
FROM Empregado;

--Lista o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados com cargo GER ou VENDAS --------------------------------------------------------------------------------
SELECT MAX(SALARIO) AS 'MAOIR SAL', 
MIN(Salario) AS 'MENOR SALARIO', 
AVG(Salario) AS 'MEDIA DE SAL', 
COUNT(*) AS 'TOTAL EMPREGADOS'
FROM Empregado
WHERE Cargo IN ('GER','VENDAS');

--Lista o cargo, o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados para cada cargo------------------------------------------------------------------
SELECT Cargo, MAX(Salario) AS 'MAIOR SAL', MIN(Salario) AS 'MENOR SAL', AVG (Salario) AS 'MEDIA SAL', 
COUNT(*) AS 'TOTAL POR CARGO'
FROM Empregado
GROUP BY Cargo;

--Lista o departamento, o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados para cada departamento
SELECT Cargo, MAX(Salario) AS 'MAIOR SAL',
 MIN(Salario) AS 'MENOR SAL', 
 AVG (Salario) AS 'MEDIA SAL', 
COUNT(*) AS 'TOTAL POR DEPTO'
FROM Empregado
GROUP BY IdDepto;

--Lista o departamento, o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados para cada departamento, considerando somente empregados com salário maior que 1.800
SELECT IdDepto,
MAX(Salario) AS 'MAOIR SAL',
MIN(Salario) AS 'MENOR SAL',
AVG(Salario) AS 'MEDIA SALARIO',
COUNT(*) AS 'QUANT POR DEPTO'
FROM Empregado
 WHERE Salario > 1800
 GROUP BY IdDepto;


--Lista o departamento, o cargo, o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados para cada cargo dentro de cada departamento ---------------------------------------------------------------------------------------------------------
SELECT IdDepto, Cargo,
MAX(Salario) AS 'MAIOR SAL',
MIN(Salario) AS 'MENOR SALARIO',
AVG(Salario) AS 'MEDIA SAL',
COUNT(*) AS 'QUANT EMP'
FROM Empregado
GROUP BY IdDepto, Cargo;

--Lista o departamento, o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados, apresentando somente departamentos que tenham pelo menos 5 empregados. --------------------------------------------------------------------------------------------------
SELECT IdDepto,
MAX(Salario) AS 'MAOIR SAL',
MIN(Salario) AS 'MENOR SAL',
AVG(Salario) AS 'MEDIA SAL',
COUNT(*) AS 'TOTAL EMP'
FROM Empregado
GROUP BY IdDepto HAVING COUNT(*) >= 5;

--. Lista o departamento, o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados com salário maior que 1.400, apresentando somente departamentos que tenham pelo menos 3 empregados nessa condição. ------------------------------------------------------------------------------
SELECT IdDepto,
MAX(Salario) AS 'MAOIR SAL',
MIN(Salario) AS 'MENOR SAL',
AVG(Salario) AS 'MEDIA SAL',
COUNT(*) AS 'TOTAL EMP'
FROM Empregado
WHERE Salario > 1400
GROUP BY IdDepto HAVING COUNT(*) >= 3;

--Lista todos os dados dos Empregados que não tem comissão (ausência de valor)
SELECT * FROM Empregado
WHERE Comissao IS NULL;

--Lista nome e salário dos empregados com salário menor que a média dos salários ----------------------------------------------------------------------------
SELECT NomeEmpregado, Salario
FROM Empregado
WHERE Salario < (SELECT AVG(Salario) FROM Empregado);

--Lista os códigos de departamento que tenham empregados com salário maior que a média de todos os salários (sem repetir códigos de departamento)------------------------------------------------------------------------------
SELECT DISTINCT IdDepto FROM Empregado
WHERE Salario > (SELECT AVG(Salario) FROM Empregado);

--Lista nome e salário dos empregados que tenham o menor salário em seu departamento xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxXX
Select NomeEmpregado, Salario From
Empregado e Where Salario =(Select
Min(x.Salario) From Empregado x Where
x.IdDepto = e.IdDepto);
------------XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

--Lista quantos empregados em cada departamento tem salário maior que a média de todos os salários
Select IdDepto, Count(*) as TotalEmpregado 
From Empregado e Where Salario >(Select
Avg(Salario) From Empregado ) Group by
IdDepto;











