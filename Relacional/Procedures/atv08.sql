--EXEMPLOS 
--Procedure - Exemplo--------------------------------------------------------------
-- CREATEPROCEDURE p_RetornaTodosFuncionarios
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
-- CREATEPROCEDURE p_RetornaTotaisFuncionarios
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
-- CREATEPROCEDURE p_RetornaFuncionarios
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
-- CreateProcedure DepartamentoInsert
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
-- CREATEProcedure DepartamentoAumentoSalario
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
-- CREATEProcedure DepartamentoAumentoSalario_v2
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



