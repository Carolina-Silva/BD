--76. Criar uma função 

-- –      f_DiaSemanaExtenso (@dia int) RETURN varchar(20)

-- –      A função deve receber um valor inteiro (@dia)

-- –      E deve retornar o dia correspondente por extenso

-- •       Exemplo

-- §  1 = Dom

-- §  2 = Seg

-- §  3 = Ter

-- –      Se @dia < 1 ou > 7

-- •       Retornar “Dia Inválido!”

CREATE FUNCTION f_diaSemanaExt(@dia int)
    returns varchar(20)
AS
BEGIN
    DECLARE @diaExt varchar(20)
    IF(@dia < 1 or @dia > 7)
    return 'Dia Inválido!'

    IF @dia = 1
    set @diaExt = 'Domingo'
    IF @dia = 2
    set @diaExt = 'Segunda'
    IF @dia = 3
    set @diaExt = 'Terça'
    IF @dia = 4
    set @diaExt = 'Quarta'
    IF @dia = 5
    set @diaExt = 'Quinta'
    IF @dia = 6
    set @diaExt = 'Sexta'
    IF @dia = 7
    set @diaExt = 'Sabado'
    
    return @diaExt
END

DECLARE @dia int
set @dia = 1

SELECT dbo.f_diaSemanaExt(@dia)




-- ------------------------------------------------------------
-- 75. Criar uma função 

-- –      f_MesExtenso (@mes int) RETURN varchar(20)

-- –      A função deve receber um valor inteiro (@mes)

-- –      E deve retornar o mês correspondente por extenso

-- •       Exemplo

-- §  1 = Jan

-- §  2 = Fev

-- §  3 = Mar

-- –      Se @mes < 1 ou > 12

-- •       Retornar “Mês Inválido!”

CREATE  FUNCTION f_MesExtenso(@mes int)
    returns varchar(20)
AS
BEGIN
    DECLARE @mesExt varchar(20)
    IF(@mes < 1 or @mes > 12)
    return 'Mês Inválido!'

    IF @mes = 1
    set @mesExt = 'Janeiro'
    IF @mes = 2
    set @mesExt = 'Fevereiro'
    IF @mes = 3
    set @mesExt = 'Março'
    IF @mes = 4
    set @mesExt = 'Abril'
    IF @mes = 5
    set @mesExt = 'Maio'
    IF @mes = 6
    set @mesExt = 'Junho'
    IF @mes = 7
    set @mesExt = 'Julho'
    IF @mes = 8
    set @mesExt = 'Agosto'
    IF @mes = 9
    set @mesExt = 'Setembro'
    IF @mes = 10
    set @mesExt = 'Outubro'
    IF @mes = 11
    set @mesExt = 'Novembro'
    IF @mes = 12
    set @mesExt = 'Dezembro'
    
    
    return @mesExt
END

DECLARE @mes int
set @mes = 1

SELECT dbo.f_MesExtenso(@mes)

-- -----------------------------------------------------------
-- 77. Criar uma função 

-- –      f_ParImpar (@numero int) RETURN varchar(10)

-- –      A função deve receber um valor inteiro (@numero)

-- –      E deve retornar se o numero é “Par” ou “Ímpar”

CREATE Function f_parImpar(@numero int)
    returns varchar(10)
AS
BEGIN
    IF(@numero % 2 = 0)
        RETURN 'Par'
    RETURN 'Ímpar'
END

DECLARE @numero int
set @numero = 3

SELECT dbo.f_ParImpar(@numero);

----------------------------------------------------------------
-- 78. Criar uma função 

-- –      f_Percentual (@valor decimal(10,2), @perc decimal(5,2)) 

-- RETURN decimal(10,2)

-- – Receber dois parâmetros, sendo um valor e um percentual, 

-- calcular o valor percentual relativo ao valor informado e 

-- retornar esse valor

CREATE FUNCTION f_percentual(@valor decimal(10,2), @perc decimal(5,2))
    returns decimal(10,2)
AS
BEGIN
    DECLARE @result decimal(10,2)    
    RETURN (@valor * @perc) / 100
END

DECLARE @valor decimal(10,2)
set @valor = 200
DECLARE @perc decimal(5,2)
set @perc = 100
SELECT dbo.f_percentual(@valor, @perc)


-- --------------------------------------------------------------------
-- 79. Criar uma função 

-- –      f_UltimoNome (@nome varchar(200) ) RETURN decimal(200)

-- –      Receber um nome e retornar apenas o último nome

-- –       Exemplo:

-- •       João da Silva  retornar o último nome Silva

-- •       Maria Joaquina Santos    retornar o último nome Santos

CREATE FUNCTION f_UltimoNome(@nome varchar(200))
    returns varchar(100)
AS
BEGIN
    return REVERSE(SUBSTRING(REVERSE(@nome), 0, CHARINDEX(' ', REVERSE(@nome))))
END

DECLARE @nome varchar(200)
set @nome = 'João da Silva'

SELECT dbo.f_UltimoNome(@nome);



