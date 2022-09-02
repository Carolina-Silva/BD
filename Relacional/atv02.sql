create table Departamento(
     IdDepto int 										NOT NULL,
     NomeDepto 			varchar(15)	NOT NULL,
     Gerente int         							NOT NULL,
     Divisao varchar(10) NOT NULL,
     Local varchar(15) NOT NULL,
     PRIMARY KEY (IdDepto)
);
create table Empregado(
    IdEmpregado int NOT NULL,
    NomeEmpregado varchar(20) NOT NULL,
    IdDepto int NOT NULL,
    Cargo varchar(6) NOT NULL,
    Tempo_Emp     int   NULL,
    Salario decimal (10,2) NULL,
    Comissao decimal(10,2) NULL,
    PRIMARY KEY (IdEmpregado)
);

INSERT into Empregado( IdEmpregado,  NomeEmpregado, IdDepto, Cargo,  Tempo_Emp,  Salario,  Comissao)
values(100, "joao", 01, "gerente", 2, 1000, 300);

INSERT into Empregado( IdEmpregado,  NomeEmpregado, IdDepto, Cargo,  Tempo_Emp,  Salario,  Comissao)
values(103, "dani", 02, "e", 8, null , 100);

INSERT into Departamento( IdDepto,  NomeDepto, Gerente,  Divisao, Local )
values(01, "vendas", 100 , "div1", "sul");

INSERT into Departamento( IdDepto,  NomeDepto, Gerente,  Divisao, Local )
values(03, "rh", 200 , "div1", "sul");

INSERT into Departamento( IdDepto,  NomeDepto, Gerente,  Divisao, Local )
values(02, "compras", 101 , "div2", "norte");



SELECT * from Departamento;

SELECT  divisao from Departamento ;

SELECT DISTINCT divisao from Departamento ;

SELECT divisao || ' - ' || local as 'Divisão + Local' FROM Departamento;

SELECT nomeempregado, salario, 1.1*salario as 'Salário Mais 10%', 
1.2*salario as 'Salário Mais 20%', 
 0.9*salario as 'Salário Menos 10%', 
 0.8*salario as 'Salário Menos 20%'
from Empregado;

SELECT nomeempregado, salario, salario + comissao as 'Salário Total', 
(salario+ comissao)*12 as 'Salário Total Anual',
(salario+ comissao)*0.05 as 'Valor Desconto Imposto de Renda', 
(salario+ comissao)*0.02 as 'Valor Desconto Plano de Saúde',
(salario+ comissao)*0.015 as 'Valor Desconto Alimentação',
(salario + comissao) - ((salario+comissao) * (0.5 + 0.02 + 0.15)) as 'Salário Liquido',
salario/30 as 'Salário Diário',
salario/30/8 as 'Salário por hora',
salario/30/8/60 as 'Salário por minuto', 
salario/30/8/60/60 as 'Salário por segundo'
isnull (salario, 0) as 'Salário'
from Empregado;

