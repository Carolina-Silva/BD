-- 90. Criar uma trigger de “Insert” para a tabela------------------------------------------------------------------
-- "Movimentacao" chamada “tr_AtualizaEstoque_I”
-- ● Quando for incluida uma nova linha na tabela
-- “Movimentacao”
-- • Se Movimentacao.Tipo ='E'(entrada)
-- Então
-- Somar a Movimentacao.QtdeMov em Produto.QtdeProduto
-- Senão
-- Se Movimentacao.Tipo ='S' (saída)
-- Subtrair a Movimentacao.QtdeMov em
-- Produto.QtdeProduto-

CREATE TRIGGER tr_AtualizaEstoque_I
ON Movimentacao
After Insert 
AS
IF(Movimentacao.TipoMov = 'E')
    UPDATE Movimentacao SET Produto.QtdeProduto = Produto.QtdeProduto + Movimentacao.QtdeMov
IF(Movimentacao.TipoMov = 'S')
    UPDATE Movimentacao SET Produto.QtdeProduto = Produto.QtdeProduto - Movimentacao.QtdeMov
------------------------------------------------


-- 91. Alterar a trigger (“tr_AtualizaEstoque_I”) criada no--------------------------------------------------------------
-- exercício anterior. Acrescentar a seguinte regra:
-- Se ( Produto.PrecoUnitMinProduto >
-- Movimentacao.PrecoUnitMov )
-- Então
-- Produto.PrecoUnitMinProduto =
-- Movimentacao.PrecoUnitMov
-- Se ( Produto.PrecoUnitMaxProduto <
-- Movimentacao.PrecoUnitMov )
-- Então
-- Produto.PrecoUnitMaxProduto =
-- Movimentacao.PrecoUnitMov
-- Calcular
-- Produto.PrecoUnitMedProduto =
-- (Produto.PrecoUnitMinProduto +
-- Produto.PrecoUnitMaxProduto)/2
CREATE TRIGGER tr_AtualizaEstoque_I
ON Movimentacao
After Insert 
AS
IF(Movimentacao.TipoMov = 'E')
    UPDATE Movimentacao SET Produto.QtdeProduto = Produto.QtdeProduto + Movimentacao.QtdeMov
IF(Movimentacao.TipoMov = 'S')
    UPDATE Movimentacao SET Produto.QtdeProduto = Produto.QtdeProduto - Movimentacao.QtdeMov

IF( Produto.PrecoUnitMinProduto > Movimentacao.PrecoUnitMov)
    UPDATE Movimentacao SET Produto.PrecoUnitMinProduto = Movimentacao.PrecoUnitMov
IF(Produto.PrecoUnitMaxProduto < Movimentacao.PrecoUnitMov)
    UPDATE Movimentacao SET Produto.PrecoUnitMaxProduto = Movimentacao.PrecoUnitMov

    Produto.PrecoUnitMedProduto = (Produto.PrecoUnitMinProduto + Produto.PrecoUnitMaxProduto)/2
------------------------------------------------------------------------------------------------------------


-- 92. Criar uma trigger de “Delete” para a tabela------------------------------------------------------------------
-- "Movimentacao" chamada “tr_AtualizaEstoque_D”
-- – Quando for excluida uma linha na tabela
-- “Movimentacao”
-- • Se Movimentacao.Tipo ='E'(entrada)
-- Então
-- Subtrair a Movimentacao.QtdeMov em
-- Produto.QtdeProduto
-- Senão
-- Se Movimentacao.Tipo ='S' (saída)
-- Somar a Movimentacao.QtdeMov em
-- Produto.QtdeProduto
CREATE TRIGGER tr_AtualizaEstoque_D 
ON Movimentacao
After Delete 
AS
IF(Movimentacao.TipoMov = 'E')
    Produto.QtdeProduto -= Movimentacao.QtdeMov
IF(Movimentacao.TipoMov = 'S')
    Produto.QtdeProduto += Movimentacao.QtdeMov





-- 93. Criar uma trigger de “Update” para a tabela------------------------------------------------------------------
-- "Movimentacao" chamada “tr_AtualizaEstoque_U”
-- – Quando for excluida uma linha na tabela
-- “Movimentacao”
-- • Se Movimentacao.Tipo ='E'(entrada)
-- Então
-- Subtrair a antiga Movimentacao.QtdeMov em
-- Produto.QtdeProduto
-- Somar a nova Movimentacao.QtdeMov em
-- Produto.QtdeProduto
-- Senão
-- Se Movimentacao.Tipo ='S' (saída)
-- Somar a antiga Movimentacao.QtdeMov antiga em
-- Produto.QtdeProduto
-- Subtrair a nova Movimentacao.QtdeMov em
-- Produto.QtdeProduto

CREATE TRIGGER tr_AtualizaEstoque_U 
ON Movimentacao
After Update 
AS
IF(Movimentacao.TipoMov = 'E')
    Produto.QtdeProduto -= Movimentacao.QtdeMov
IF(Movimentacao.TipoMov = 'S')
    Produto.QtdeProduto += Movimentacao.QtdeMov

