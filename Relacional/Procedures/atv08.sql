-- Porque usar? -> corta processos, roda mais rápido 
--(um 'programa' dentro do BD)
--Procedure != View (view só aceita select, só para consulta)



--EXEMPLOS 
--Procedure - Exemplo--------------------------------------------------------------
-- CREATE PROCEDURE p_RetornaTodosFuncionarios
-- AS 
--     Select  
--     e.NomeEmpregado,  
--     e.Salario,  
--     IsNULL(e.Comissao,0)as Comissao,  
--     d.NomeDepto 
-- From  
--     Empregado e  
--     InnerJoin Departamento d On (d.IdDepto = e.IdDepto)
-- go

-- execute p_RetornaTodosFuncionarios


-- Procedure – Agrupando Dados--------------------------------------------------------------
-- CREATE PROCEDURE p_RetornaTotaisFuncionarios
-- AS 
--     Select  
--     d.NomeDepto,  
--     SUM(e.Salario)as'Total Salário',  
--     AVG(e.Salario)as'Média Salário',  
--     MAX(e.Salario)as'Maior Salário',  
--     MIN(e.Salario)as'Menor Salário',  
--     SUM(IsNULL(e.Comissao,0))as Comissao,  
--     AVG(IsNULL(e.Comissao,0))As'Média Comissão',  
--     MAX(IsNULL(e.Comissao,0))As'Maior Comissão',  
--     MIN(IsNULL(e.Comissao,0))As'Menor Comissão',  
--     SUM(e.Salario +IsNULL(e.Comissao,0))as 'Remuneração Total', 
--     AVG(e.Salario +IsNULL(e.Comissao,0))as 'Remuneração Total Média', 
--     Count(*)As'Total Funcionários'
--     From
--       Empregado eInnerJoin Departamento d On (d.IdDepto = e.IdDepto)
--       Group by d.NomeDepto
--       Order by d.NomeDeptogo

-- execute p_RetornaTotaisFuncionarios

-- Procedure – Passando paramêtro-------------------------------------------------------------
-- CREATE PROCEDURE p_RetornaFuncionarios
-- (@NomeDepto nVarchar(30))
-- AS 
--     Selecte.NomeEmpregado,
--     e.Salario,
--     IsNULL(e.Comissao,0)as Comissao,
--     d.NomeDepto
-- From
--     Empregado e
--     InnerJoin Departamento d On (d.IdDepto = e.IdDepto)
-- Where
--     (d.NomeDepto=@NomeDepto)
-- go
    
-- execute p_RetornaFuncionarios'TI'


-- Procedure – Passando vários paramêtros-----------------------------------------------------
-- Create Procedure DepartamentoInsert
-- ( @IdDepto int,
-- @NomeDepto varchar(15),
-- @Gerente int,
-- @Divisao varchar(10),
-- @Local varchar(15))
-- As
-- INSERT INTO Departamento(
--                     IdDepto,
--                     NomeDepto,
--                     Gerente,
--                     Divisao,
--                     Local)
--         VALUES(
--             @IdDepto,
--             @NomeDepto,
--             @Gerente,
--             @Divisao,
--             @Local)
-- GO
            
-- EXECUTE DepartamentoInsert2000,'Marketing',10,'NORDESTE','BAHIA'


-- Procedure – Passando vários paramêtros-----------------------------------------------------
-- CREATE Procedure DepartamentoAumentoSalario
-- ( @IdDepto int,
-- @PercentualAumento decimal(5,2))
-- As 
-- Set @PercentualAumento =(1+(@PercentualAumento/100))
-- UPDATE 
--     Empregado
-- SET Salario = Salario * @PercentualAumento , Comissao = Comissao * @PercentualAumento
-- Where IdDepto = @IdDepto
-- go
-- Execute DepartamentoAumentoSalario 50, 3


-- Procedure – Passando e recebendo vários paramêtros-----------------------------------------
-- CREATE Procedure DepartamentoAumentoSalario_v2
-- ( @IdDepto int,
-- @PercentualAumento decimal(5,2),
-- @TotalAntesAumento decimal(10,2)OUTPUT,
-- @TotalDepoisAumento decimal(10,2)OUTPUT)
-- As
-- Select @TotalAntesAumento=SUM(Salario)From Empregado Where IdDepto = @IdDepto
-- Set @PercentualAumento =(1+(@PercentualAumento/100))
-- UPDATE 
--     Empregado
-- SET Salario = Salario * @PercentualAumento , 
--     Comissao = Comissao * @PercentualAumento
-- Where IdDepto = @IdDepto
-- Select @TotalDepoisAumento=SUM(Salario) From Empregado Where IdDepto = @IdDepto
-- go

-- Declare @TotalAntesAumento decimal(10,2), @TotalDepoisAumento decimal(10,2)

-- Execute DepartamentoAumentoSalario_V2 40, 2, @TotalAntesAumento OUTPUT, @TotalDepoisAumento OUTPUT
-- Select @TotalAntesAumento 'Total Antes Aumento', @TotalDepoisAumento 'Total DepoisAumento'


create table departamento (
        idDepto integer not null primary key ,
        nomeDepto varchar(15) not null,
        gerente integer not null,
        divisao varchar(10) not null,
        local varchar(15) not null
 )

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


--82---------------------------------------OK-----------------------------------------------
CREATE PROCEDURE DepartamentoUpdate 
(   @idDepto int, 
    @NomeDepto varchar(15),
    @Gerente int, 
    @Divisao varchar(10), 
    @Local varchar(15)
)
AS
UPDATE
    Departamento
SET
    idDepto = @idDepto,
    NomeDepto = @NomeDepto,
    Gerente = @Gerente,
    Divisao = @Divisao, 
    Local = @Local
WHERE 
    IdDepto = @idDepto


EXECUTE DepartamentoUpdate 1,'RH', 1, 'GGG', 'Diadema'

--83-----------------------------------------------OK---------------------------------------
CREATE PROCEDURE DepartamentoDelete
    (   @idDepto int,
        @TotalDepartamentos int OUTPUT
    )
AS
DELETE FROM Departamento WHERE idDepto = @idDepto 

SELECT @TotalDepartamentos = Count(*) FROM Departamento

Declare  @TotalDepartamentos int
EXECUTE DepartamentoDelete 3,  @TotalDepartamentos output
SELECT @TotalDepartamentos 'TOTAL DOS DEPTO'

--84----------------------------------------------------OK----------------------------------
CREATE PROCEDURE EmpregadoInsert
(   @IdEmpregado int, 
    @NomeEmpregado varchar(20), 
    @IdDepto int, 
    @Cargo varchar(6), 
    @Tempo_Emp int, 
    @Salario decimal(10,2), 
    @Comissao decimal(10,2),
    @TotalEmpregados INT OUTPUT
) 
AS
INSERT INTO Empregado(
                    IdEmpregado, 
                    NomeEmpregado , 
                    IdDepto, 
                    Cargo, 
                    Tempo_Emp, 
                    Salario, 
                    Comissao
)
VALUES( @IdEmpregado, 
                    @NomeEmpregado , 
                    @IdDepto, 
                    @Cargo, 
                    @Tempo_Emp, 
                    @Salario, 
                    @Comissao
)

SELECT @TotalEmpregados = Count(*) FROM Empregado


Declare @TotalEmpregados INT
EXECUTE EmpregadoInsert  4, 'joao', 2, 'vendedor', 5, 1500.68, 345.00, @TotalEmpregados OUTPUT
SELECT @TotalEmpregados 'TOTAL EMPREGADOS'


--85------------------------------OK--------------------------------------------------------
CREATE PROCEDURE EmpregadoUpdate
(   @IdEmpregado int, 
    @NomeEmpregado varchar(20), 
    @IdDepto int, 
    @Cargo varchar(6), 
    @Tempo_Emp int, 
    @Salario decimal(10,2), 
    @Comissao decimal(10,2)
)
AS
UPDATE
    Empregado
SET
    IdEmpregado = @IdEmpregado,
    NomeEmpregado = @NomeEmpregado,
    IdDepto = @IdDepto,
    Cargo = @Cargo,
    Tempo_Emp = @Tempo_Emp,
    Salario = @Salario,
    comissao = @Comissao
WHERE IdEmpregado = @IdEmpregado

EXECUTE EmpregadoUpdate 200


--86------------------------------------------OK--------------------------------------------
CREATE PROCEDURE EmpregadoDelete
    (   @IdEmpregado int, 
        @TotalEmpregados INT OUTPUT
    )
AS
DELETE FROM Empregado WHERE idempregado = @idempregado 

SELECT @TotalEmpregados = Count(*) FROM Empregado

Declare  @TotalEmpregados int
EXECUTE EmpregadoDelete 2,  @TotalEmpregados output
SELECT @TotalEmpregados 'TOTAL DOS EMPREGADOS'

--87-------------------------------------OK-------------------------------------------------
CREATE PROCEDURE EmpregadoSelect 
AS
    SELECT * FROM Empregado

EXECUTE EmpregadoSelect
