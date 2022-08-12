/*-------------------------
CREATE DATABASE Aula17;
DROP DATABASE Aula17;   
 -------------------------*/
 
 USE Aula17;
 
 CREATE TABLE Moeda(
  cd_Moeda   int         not null,
  ds_Moeda   varchar(30) not null,
  abr_Moeda  char(5)     not null,
  CONSTRAINT pk_Moeda PRIMARY KEY(cd_Moeda)
 );
 
INSERT INTO Moeda (cd_Moeda,ds_Moeda, abr_Moeda) VALUES (10,'Dolar Americano', 'U$');
INSERT INTO Moeda (cd_Moeda,ds_Moeda, abr_Moeda) VALUES (20,'Real', 'R$');
INSERT INTO Moeda (cd_Moeda,ds_Moeda, abr_Moeda) VALUES (30,'Peso Chileno', '$');
INSERT INTO Moeda (cd_Moeda,ds_Moeda, abr_Moeda) VALUES (40,'Peso Colombiano', '$');
INSERT INTO Moeda (cd_Moeda,ds_Moeda, abr_Moeda) VALUES (50,'Libra', 'L$');
INSERT INTO Moeda (cd_Moeda,ds_Moeda, abr_Moeda) VALUES (60,'Libra', 'L$');

SELECT * FROM Moeda;

DELETE FROM Moeda WHERE cd_Moeda = 60;

UPDATE Moeda
SET ds_Moeda = 'Peso Mexicano', abr_Moeda = 'P$'
WHERE cd_Moeda = 60;
 
 /*DROP TABLE CotacaoMoeda;*/
 
 CREATE TABLE CotacaoMoeda (
  cd_Cotacao      int           not null auto_increment,
  dt_Cotacao      datetime      not null,
  vlr_Cotacao     decimal(10,2) not null,
  cd_MoedaOrigem  int           not null,
  cd_MoedaDestino int           not null,
 CONSTRAINT pk_CotacaoMoeda          PRIMARY KEY (cd_Cotacao),
 CONSTRAINT fk_CotacaoMoeda_MoedaO   FOREIGN KEY (cd_MoedaOrigem)  REFERENCES Moeda (cd_Moeda),
 CONSTRAINT fk_CotacaoMoeda_MoedaD   FOREIGN KEY (cd_MoedaDestino) REFERENCES Moeda (cd_Moeda)
 );
 
INSERT INTO CotacaoMoeda(dt_Cotacao, vlr_Cotacao,cd_MoedaOrigem, cd_moedaDestino ) 
				  VALUES('2022-05-01', 4.95, 10, 20); 
INSERT INTO CotacaoMoeda(dt_Cotacao, vlr_Cotacao,cd_MoedaOrigem, cd_moedaDestino ) 
				  VALUES('2022-05-02', 4.80, 10, 20); 
INSERT INTO CotacaoMoeda(dt_Cotacao, vlr_Cotacao,cd_MoedaOrigem, cd_moedaDestino ) 
				  VALUES('2022-05-03', 4.85, 10, 20); 
INSERT INTO CotacaoMoeda ( dt_Cotacao, vlr_Cotacao,cd_MoedaOrigem,cd_MoedaDestino)
                  VALUES ('2022-05-04', 4.00, 10, 20);                 
INSERT INTO CotacaoMoeda ( dt_Cotacao, vlr_Cotacao,cd_MoedaOrigem,cd_MoedaDestino)
                  VALUES ('2022-05-05', 4.80, 10, 20);
INSERT INTO CotacaoMoeda ( dt_Cotacao, vlr_Cotacao,cd_MoedaOrigem,cd_MoedaDestino)
                  VALUES ('2022-05-06', 4.00, 10, 20);

 
SELECT * FROM CotacaoMoeda;
 
DELETE FROM CotacaoMoeda WHERE cd_Cotacao = 5;