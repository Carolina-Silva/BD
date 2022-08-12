CREATE DATABASE Spotify;
use Spotify;

CREATE TABLE TipoConta(
	cd_TipoConta   	int 			not 	null,
	nm_TipoConta   	varchar(20) 	not 	null,
    ds_TipoConta  	varchar(30) 	not 	null,
    CONSTRAINT pk_TipoConta PRIMARY KEY (cd_TipoConta)
);
INSERT INTO TipoConta (cd_TipoConta, nm_TipoConta, ds_TipoConta )
VALUES (10,'comum','conta free sem pular');

CREATE TABLE Usuario(
	cd_Usuario   		int 			not 	null,
	nm_Usuario    		varchar(20) 	not 	null,
    email_Usuario 		varchar(50) 	not 	null,
    senha_Usuario       varchar(40)		not 	null,
    img_Usuario	 		mediumblob					,
    cd_TipoConta		int 			not 	null,
    CONSTRAINT pk_Usuario   PRIMARY KEY (cd_Usuario),
    CONSTRAINT fk_TipoConta FOREIGN KEY (cd_TipoConta)
            REFERENCES TipoConta(cd_TipoConta)
);
INSERT INTO Usuario (cd_Usuario,nm_Usuario,email_Usuario,senha_Usuario,img_Usuario,cd_TipoConta)
VALUES (200,'user123','user@gmail.com','batatinha123',LOAD_FILE('img.png'),10);


CREATE TABLE Genero(
	cd_Genero   	int 		not 	null,
    ds_Genero   	varchar(60) not 	null,
    CONSTRAINT pk_Genero PRIMARY KEY (cd_Genero)
);
INSERT INTO Genero (cd_Genero, ds_Genero)
VALUES (1,'R&B');

CREATE TABLE Artista(
	cd_Artista   	int 			not 	null,
	nm_Artista    	varchar(20) 	not 	null,
    ds_Artista   	varchar(30) 	not 	null,
    img_Artista 	mediumblob					,
    CONSTRAINT pk_Artista PRIMARY KEY (cd_Artista)
);
INSERT INTO Artista (cd_Artista , nm_Artista, ds_Artista, img_Artista)
VALUES (100,'the weeknd','cantor canadense',LOAD_FILE('img.png'));


CREATE TABLE Album(
	cd_Album   			int 			not 	null,
	nm_Album    		varchar(20) 	not 	null,
    dt_LancamentoAlbum 	date 			not 	null,
    img_Album	 		mediumblob					,
    cd_Artista			int 			not 	null,
    CONSTRAINT pk_Album   PRIMARY KEY (cd_Album),
    CONSTRAINT fk_Artista FOREIGN KEY (cd_Artista)
            REFERENCES Artista(cd_Artista)
);
INSERT INTO Album (cd_Album,nm_Album, dt_LancamentoAlbum, img_Album,cd_Artista)
VALUES (101,'After hours','2020-03-20',LOAD_FILE('img.png'),100);

CREATE TABLE Musica(
	cd_Musica   		int 			not 	null,
	nm_Musica    		varchar(20) 	not 	null,
    arq_Musica			longblob					,
    cd_Genero           int 			not 	null,
    cd_Album	   		int 			not 	null,
    CONSTRAINT pk_Musica   PRIMARY KEY (cd_Musica),
    CONSTRAINT fk_Genero FOREIGN KEY (cd_Genero)
            REFERENCES Genero (cd_Genero),
	CONSTRAINT fk_Album FOREIGN KEY (cd_Album)
            REFERENCES Album (cd_Album)
);
INSERT INTO Musica (cd_Musica ,nm_Musica ,arq_Musica,cd_Genero ,cd_Album)
VALUES (1000,'Blinding ligths', LOAD_FILE('b.mp3'),1,101);


CREATE TABLE PlayList(
	cd_PlayList   		int 			not 	null,
	nm_PlayList    		varchar(20) 	not 	null,
    dt_PlayList 		date 			not 	null,
	cd_Usuario			int 			not 	null,
    CONSTRAINT pk_PlayList   PRIMARY KEY (cd_PlayList),
    CONSTRAINT fk_Usuario FOREIGN KEY (cd_Usuario)
            REFERENCES Usuario(cd_Usuario)
);
INSERT INTO PlayList (cd_PlayList,nm_PlayList,dt_PlayList,cd_Usuario)
VALUES (10000,'só as melhores','2022-06-01',200);


CREATE TABLE MusicaPlayList(
	cd_Musica   			int 	not 	null,
    cd_PlayList   			int 	not 	null,
	qt_MusicaPlayList       int		not		null,
    CONSTRAINT pk_MusicaPlayList   PRIMARY KEY (cd_Musica,cd_PlayList),
    CONSTRAINT fk_Musica FOREIGN KEY (cd_Musica)
            REFERENCES Musica (cd_Musica),
	CONSTRAINT fk_PlayList FOREIGN KEY (cd_PlayList)
            REFERENCES PlayList (cd_PlayList)
);
SELECT * from Usuario;