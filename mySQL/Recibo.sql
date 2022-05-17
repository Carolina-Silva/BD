/*CRIAR TABELAS DO EXECICIO DIA 26/04 RECIBO*/
CREATE DATABASE Recibo;
USE Recibo;

CREATE TABLE Cidade(
cd_Cidade 	INT             NOT NULL AUTO_INCREMENT,
nm_cidade 	VARCHAR(30)     NOT NULL,
CONSTRAINT pk_Cidade		PRIMARY KEY (cd_Cidade)
);

CREATE TABLE PessoaFisica(
cd_PessoaFisica		INT 			NOT NULL AUTO_INCREMENT,
nm_PessoaFisica		VARCHAR(40) 	NOT NULL,
nr_CPF				INT				NOT NULL,
CONSTRAINT pk_PessoaFisica          PRIMARY KEY(cd_PessoaFisica)
);

CREATE TABLE Recibo(
cd_Recibo 	INT 			NOT NULL AUTO_INCREMENT,
nr_Recibo 	INT 			NOT NULL,
vlr_Recibo 	DECIMAL(6,2) 	NOT NULL,
dt_Servico 	DATETIME 		NOT NULL,
dt_Recibo 	DATETIME		NOT NULL,
 CONSTRAINT pk_Recibo          			PRIMARY KEY (cd_Recibo),
 CONSTRAINT fk_PessoaFisicaPrestador  	FOREIGN KEY (cd_PessoaFisicaPrestador)  REFERENCES PessoaFisica (cd_PessoaFisica),
 CONSTRAINT fk_PessoaFisicaRecebe   	FOREIGN KEY (cd_PessoaFisicaRecebe) 	REFERENCES PessoaFisica (cd_PessoaFisica),
 CONSTRAINT fk_Cidade  					FOREIGN KEY (cd_Cidade ) 				REFERENCES Cidade  (cd_Cidade )
);
/*fim---------------CRIAR TABELAS DO EXECICIO DIA 26/04 RECIBO*/

/*INSERIR DADOS NAS TABELAS ------------------------------- */
INSERT INTO Cidade (nm_cidade) VALUES('Diadema');

INSERT INTO PessoaFisica (nm_PessoaFisica,nr_CPF) VALUES('Nicoly',12312312345);

INSERT INTO Recibo (nr_Recibo,vlr_Recibo,dt_Servico,dt_Recibo) VALUES(10, 100.0,'2022-05-02','2022-05-02');
/*fim---------------------------INSERIR DADOS NAS TABELAS */

