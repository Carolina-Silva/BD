CREATE DATABASE Recibo;

use Recibo;

CREATE TABLE Cidade (
cd_Cidade   int not null,
nm_Cidade   varchar(30) not null,
CONSTRAINT pk_Cidade  PRIMARY KEY (cd_Cidade)
);

INSERT INTO Cidade  (cd_Cidade, nm_Cidade ) VALUES (10,'Santo André');
INSERT INTO Cidade  (cd_Cidade, nm_Cidade ) VALUES (11,'São Bernardo do Campo');
INSERT INTO Cidade  (cd_Cidade, nm_Cidade ) VALUES (13,'São Caetano');
INSERT INTO Cidade  (cd_Cidade, nm_Cidade ) VALUES (14,'Diadema');
INSERT INTO Cidade  (cd_Cidade, nm_Cidade ) VALUES (15,'Mauá');
INSERT INTO Cidade  (cd_Cidade, nm_Cidade ) VALUES (16,'Suzano');
INSERT INTO Cidade  (cd_Cidade, nm_Cidade ) VALUES (17,'São Paulo');

use Recibo;
CREATE TABLE PessoaFisica (
cd_PessoaFisica  int         not null,
nm_PessoaFisica  Varchar(40) not null,
nr_CPF           bigint      not null,
CONSTRAINT pk_PessoaFisica  PRIMARY KEY (cd_PessoaFisica)
);

INSERT INTO PessoaFisica (cd_PessoaFisica, nm_PessoaFisica, nr_CPF)
         VALUES (101, 'Joana da Silva',11122233310);
INSERT INTO PessoaFisica (cd_PessoaFisica, nm_PessoaFisica, nr_CPF)
         VALUES (102, 'Paulo Souza',22233344455);
INSERT INTO PessoaFisica (cd_PessoaFisica, nm_PessoaFisica, nr_CPF)
         VALUES (103, 'Lucio Fibra',55566699954);
INSERT INTO PessoaFisica (cd_PessoaFisica, nm_PessoaFisica, nr_CPF)
         VALUES (104, 'Calos Santos',99966644410);
INSERT INTO PessoaFisica (cd_PessoaFisica, nm_PessoaFisica, nr_CPF)
         VALUES (105, 'Eliana Paiva',33366655571);
INSERT INTO PessoaFisica (cd_PessoaFisica, nm_PessoaFisica, nr_CPF)
         VALUES (106, 'Caio da Silva',22299977710);
SELECT * FROM PessoaFisica;

use Recibo;
CREATE TABLE Recibo (
cd_Recibo                    int not null,
dt_EmissaoRecibo             datetime  not null,
dt_EmissaoServico            datetime  not null,
Nr_Recibo                    int            not null,
vlr_Recibo                   decimal(10,2)  not null,
ds_Servico                   Varchar(100)   not null,
cd_CidadeEmissao             int            not null,
cd_pessoaFisicaContratada    int            not null,
cd_pessoaFisicaContratante   int            not null,
CONSTRAINT pk_Recibo  PRIMARY KEY (cd_Recibo),
CONSTRAINT fk_Recibo_Cidade FOREIGN KEY (cd_CidadeEmissao)
            REFERENCES Cidade(cd_Cidade),
CONSTRAINT fk_Recibo_PFisicaContratada FOREIGN KEY (cd_pessoaFisicaContratada)
            REFERENCES PessoaFisica (cd_pessoaFisica),
CONSTRAINT fk_Recibo_PFisicaContratante FOREIGN KEY (cd_pessoaFisicaContratante)
            REFERENCES PessoaFisica (cd_pessoaFisica)
); 

-- CONTRATA 101  CONTRATADO 106 CIDADE 10
INSERT INTO Recibo (cd_Recibo,        dt_EmissaoRecibo, 
					dt_EmissaoServico,ds_Servico, 
					vlr_Recibo,       Nr_Recibo, cd_CidadeEmissao,
					cd_pessoaFisicaContratada, cd_pessoaFisicaContratante)
VALUES ( 1001, '2020-05-01', '2022-05-28', 'Formatação NoteBook',
         150, 15, 10, 106, 101);


INSERT INTO Recibo (cd_Recibo,        dt_EmissaoRecibo, 
					dt_EmissaoServico,ds_Servico, 
					vlr_Recibo,       Nr_Recibo, cd_CidadeEmissao,
					cd_pessoaFisicaContratada, cd_pessoaFisicaContratante)
VALUES ( 1002, '2020-05-01', '2022-04-27', 'Instalação de Rede domestica',
         250, 15, 10, 106, 103);

INSERT INTO Recibo (cd_Recibo,        dt_EmissaoRecibo, 
					dt_EmissaoServico,ds_Servico, 
					vlr_Recibo,       Nr_Recibo, cd_CidadeEmissao,
					cd_pessoaFisicaContratada, cd_pessoaFisicaContratante)
VALUES ( 1003, '2020-05-02', '2022-04-22', 'Instalação de Rede domestica',
         250, 15, 10, 106, 105);

INSERT INTO Recibo (cd_Recibo,        dt_EmissaoRecibo, 
					dt_EmissaoServico,ds_Servico, 
					vlr_Recibo,       Nr_Recibo, cd_CidadeEmissao,
					cd_pessoaFisicaContratada, cd_pessoaFisicaContratante)
VALUES ( 1004, '2020-05-10', '2022-05-05', 'Manutenção Lava-Seca',
         500, 18, 10, 105, 104);

INSERT INTO Recibo (cd_Recibo,        dt_EmissaoRecibo, 
					dt_EmissaoServico,ds_Servico, 
					vlr_Recibo,       Nr_Recibo, cd_CidadeEmissao,
					cd_pessoaFisicaContratada, cd_pessoaFisicaContratante)
VALUES ( 1005, '2020-05-12', '2022-02-10', 'Manutenção Refrigerador',
         500, 19, 10, 105, 101);

select * from recibo;