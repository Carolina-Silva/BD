
CREATE DATABASE PONTO;


use Ponto;
CREATE TABLE Area (
cd_Area    int not null,
nm_Area    Varchar(30) not null,
abr_Area   char(5)     not null,
CONSTRAINT pk_Area PRIMARY KEY (cd_Area) 
);


INSERT INTO AREA (cd_Area, nm_Area, abr_Area)
          VALUES ( 100, 'Engenganharia Eletronica', 'EELE');
INSERT INTO AREA (cd_Area, nm_Area, abr_Area)
          VALUES ( 101, 'Engenharia Computação', 'ECOMP');
INSERT INTO AREA (cd_Area, nm_Area, abr_Area)
          VALUES ( 102, 'Engenharia Materiais', 'EMAT');
INSERT INTO AREA (cd_Area, nm_Area, abr_Area)
          VALUES ( 103, 'Engenharia Cívil', 'ECIV');
INSERT INTO AREA (cd_Area, nm_Area, abr_Area)
          VALUES ( 104, 'Engenharia Produção', 'EPROD');
INSERT INTO AREA (cd_Area, nm_Area, abr_Area)
          VALUES ( 105, 'Engenharia Mecânica', 'EMECA');
INSERT INTO AREA (cd_Area, nm_Area, abr_Area)
          VALUES ( 106, 'Engenharia Química', 'QUI');
INSERT INTO AREA (cd_Area, nm_Area, abr_Area)
          VALUES ( 107, 'Engenharia Ambiental', 'EAMB');

SELECT * FROM AREA;


use ponto;
CREATE TABLE LocalEstag ( 
cd_LocalEstag int not null,
ds_LocalEstag VARCHAR(30)  not null,
CONSTRAINT pk_LocalEstag PRIMARY KEY (cd_LocalEstag)
);

INSERT INTO LocalEstag (cd_LocalEstag, ds_LocalEstag) VALUES (99, 'Laboratório Quimica1');
INSERT INTO LocalEstag (cd_LocalEstag, ds_LocalEstag) VALUES (98, 'Laboratório Quimica2');
INSERT INTO LocalEstag (cd_LocalEstag, ds_LocalEstag) VALUES (97, 'Laboratório Mecatronica');
INSERT INTO LocalEstag (cd_LocalEstag, ds_LocalEstag) VALUES (96, 'Laboratório Física');
INSERT INTO LocalEstag (cd_LocalEstag, ds_LocalEstag) VALUES (95, 'Espaço Maker');
INSERT INTO LocalEstag (cd_LocalEstag, ds_LocalEstag) VALUES (94, 'Laboratório Robótica');
INSERT INTO LocalEstag (cd_LocalEstag, ds_LocalEstag) VALUES (93, 'Laboratório Informática 1');
INSERT INTO LocalEstag (cd_LocalEstag, ds_LocalEstag) VALUES (92, 'Laboratório Informática 2');
INSERT INTO LocalEstag  (cd_LocalEstag, ds_LocalEstag) VALUES (91, 'Laboratório Informática 3');
INSERT INTO LocalEstag  (cd_LocalEstag, ds_LocalEstag) VALUES (90, 'Laboratório Eng Produção');
INSERT INTO LocalEstag  (cd_LocalEstag, ds_LocalEstag) VALUES (89, 'Biotério');
INSERT INTO LocalEstag  (cd_LocalEstag, ds_LocalEstag) VALUES (88, 'Laboratório Mecânica 1');
INSERT INTO LocalEstag  (cd_LocalEstag, ds_LocalEstag) VALUES (87, 'Laboratório Mecânica 2');
INSERT INTO LocalEstag  (cd_LocalEstag, ds_LocalEstag) VALUES (86, 'Laboratório Informática 4');
INSERT INTO LocalEstag  (cd_LocalEstag, ds_LocalEstag) VALUES (85, 'Laboratório Edificações');

SELECT * FROM LocalEstag ;

use ponto;
CREATE TABLE Supervisor (
cd_Supervisor int not null,
nm_Supervisor varchar(30) not null,
CONSTRAINT pk_Supervisor PRIMARY KEY (cd_Supervisor)
);

INSERT INTO Supervisor (cd_Supervisor, nm_Supervisor)
               VALUES  (201, 'Profa Rosangela');
INSERT INTO Supervisor (cd_Supervisor, nm_Supervisor)
               VALUES  (202, 'Profa Jediane');
INSERT INTO Supervisor (cd_Supervisor, nm_Supervisor)
               VALUES  (203, 'Profa Samaris');
INSERT INTO Supervisor (cd_Supervisor, nm_Supervisor)
               VALUES  (204, 'Prof Sarapika');
INSERT INTO Supervisor (cd_Supervisor, nm_Supervisor)
               VALUES  (205, 'Profa Jacy');
INSERT INTO Supervisor (cd_Supervisor, nm_Supervisor)
               VALUES  (206, 'Profa Ana');
INSERT INTO Supervisor (cd_Supervisor, nm_Supervisor)
               VALUES  (207, 'Prof Douglas');
INSERT INTO Supervisor (cd_Supervisor, nm_Supervisor)
               VALUES  (208, 'Prof Nilson');
INSERT INTO Supervisor (cd_Supervisor, nm_Supervisor)
               VALUES  (209, 'Prof Erasmo');
INSERT INTO Supervisor (cd_Supervisor, nm_Supervisor)
               VALUES  (210, 'Prof Claudio');

SELECT * FROM Supervisor;

use ponto;
CREATE TABLE DiaSemana (
cd_DiaSemana int not null, 
ds_DiaSemana Varchar(20) not null,
abr_DiaSemana Char(3)    not null,
CONSTRAINT pk_DiaSemana PRIMARY KEY  (cd_DiaSemana) 
);

INSERT INTO DiaSemana (cd_DiaSemana, ds_DiaSemana, abr_DiaSemana)
            VALUES (1, 'Domingo', 'Dom');
INSERT INTO DiaSemana (cd_DiaSemana, ds_DiaSemana, abr_DiaSemana)
            VALUES (2, 'Segunda-Feira', '2a');
INSERT INTO DiaSemana (cd_DiaSemana, ds_DiaSemana, abr_DiaSemana)
            VALUES (3, 'Terça-Feira', '3a');
INSERT INTO DiaSemana (cd_DiaSemana, ds_DiaSemana, abr_DiaSemana)
            VALUES (4, 'Quarta-Feira', '4a');
INSERT INTO DiaSemana (cd_DiaSemana, ds_DiaSemana, abr_DiaSemana)
            VALUES (5, 'Quinta-Feira', '5a');
INSERT INTO DiaSemana (cd_DiaSemana, ds_DiaSemana, abr_DiaSemana)
            VALUES (6, 'Sexta-Feira', '6a');
INSERT INTO DiaSemana (cd_DiaSemana, ds_DiaSemana, abr_DiaSemana)
            VALUES (7, 'Sábado', 'Sáb');

SELECT * FROM DiaSemana;


CREATE TABLE Estudante (
cd_Estudante      int not null,
nm_Estudante      Varchar(40) not null,
nr_Matricula      int         not null,
cd_LocalEstag     int         not null,
cd_Area           int         not null,
cd_SupervisorAcad int         not null,
cd_SupervisorCamp int         not null,
CONSTRAINT pk_Estudante PRIMARY KEY (cd_Estudante),
CONSTRAINT fk_Estudante_Local	FOREIGn KEY  (cd_LocalEstag )
      REFERENCES LocalEstag  (cd_LocalEstag ),
CONSTRAINT fk_Estudante_Area    FOREIGn KEY  (cd_Area )
      REFERENCES Area  (cd_Area ),
CONSTRAINT fk_Estudante_SupervisorAcad  FOREIGn KEY  (cd_SupervisorAcad )
      REFERENCES Supervisor  (cd_Supervisor),
CONSTRAINT fk_Estudante_SupervisorCamp  FOREIGn KEY  (cd_SupervisorCamp )
      REFERENCES Supervisor  (cd_Supervisor)

);

use Ponto;
CREATE TABLE EstudantePonto (
cd_PontoEstudante     int not null,
cd_Estudante          int not null,
dt_Ponto              datetime not null,
hr_Inicio             char(5)       not null,
hr_Fim                char(5)       not null,
cd_diaSemana          int           not null,
CONSTRAINT pk_EstudantePonto  PRIMARY KEY (cd_PontoEstudante),
CONSTRAINT fk_EstudantePonto_diaSemane FOREIGN KEY (cd_diaSemana)
       REFERENCES DiaSemana (cd_DiaSemana),
CONSTRAINT fk_EstudantePonto_Estudante FOREIGN KEY (cd_Estudante)
       REFERENCES Estudante (cd_Estudante)
	   );