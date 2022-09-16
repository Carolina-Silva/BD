-- Testado em SQL server (Microsoft)----------------------------------------------

CREATE TABLE departamento(
    idDepto			integer 			not null 	PRIMARY KEY,
    NomeDept 		varchar(15) 		not null,
    Gerente 		integer 			not null,
    Divisao 		varchar(10) 		not null,
    local 			varchar(19) 		not null
);

insert into departamento ( idDepto,  NomeDept,  Gerente,  Divisao, local )
				VALUES (100, 'vendas', 10, 'sul', 'diadema') ;
                
CREATE VIEW vwDepGerente as 
SELECT nomedept, gerente FROM departamento;

SELECT * from departamento;

SELECT * from vwDepGerente;