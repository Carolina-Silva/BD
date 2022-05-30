CREATE DATABASE Spotify;
use Spotify;

CREATE TABLE Usuario(
	cd_Usuario   		int 			not 	null 	auto_increment,
	nm_Usuario    		varchar(20) 	not 	null,
    email_Usuario 		varchar(50) 	not 	null,
    senha_Usuario       varchar(40)		not 	null,
    img_Usuario	 		mediumblob		not		null,
    cd_TipoConta		int 			not 	null,
    CONSTRAINT pk_Usuario   PRIMARY KEY (cd_Usuario),
    CONSTRAINT fk_TipoConta FOREIGN KEY (cd_TipoConta)
            REFERENCES TipoConta(cd_TipoConta)
);

INSERT INTO Usuario (cd_Usuario, nm_Usuario, email_Usuario,senha_Usuario, img_Usuario)
VALUES ();

CREATE TABLE TipoConta(
	cd_TipoConta   	int 			not 	null 	auto_increment,
	nm_TipoConta   	varchar(20) 	not 	null,
    ds_TipoConta  	varchar(30) 	not 	null,
    CONSTRAINT pk_TipoConta PRIMARY KEY (cd_TipoConta)
);

CREATE TABLE PlayList(
	cd_PlayList   		int 			not 	null	auto_increment,
	nm_PlayList    		varchar(20) 	not 	null,
    dt_PlayList 		date 			not 	null,
	cd_Usuario			int 			not 	null,
    CONSTRAINT pk_PlayList   PRIMARY KEY (cd_PlayList),
    CONSTRAINT fk_Usuario FOREIGN KEY (cd_Usuario)
            REFERENCES Usuario(cd_Usuario)
);

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

CREATE TABLE Musica(
	cd_Musica   		int 			not 	null	auto_increment,
	nm_Musica    		varchar(20) 	not 	null,
    arq_Musica			longblob		not 	null,
    cd_Genero           int 			not 	null,
    cd_Album	   		int 			not 	null,
    CONSTRAINT pk_Musica   PRIMARY KEY (cd_Musica),
    CONSTRAINT fk_Genero FOREIGN KEY (cd_Genero)
            REFERENCES Genero (cd_Genero),
	CONSTRAINT fk_Album FOREIGN KEY (cd_Album)
            REFERENCES Album (cd_Album)
);

CREATE TABLE Genero(
	cd_Genero   	int 		not 	null	auto_increment,
    ds_Genero   	varchar(60) not 	null,
    abr_Genero 		varchar(5) 	not 	null,
    CONSTRAINT pk_Genero PRIMARY KEY (cd_Genero)
);

CREATE TABLE Album(
	cd_Album   			int 			not 	null	auto_increment,
	nm_Album    		varchar(20) 	not 	null,
    dt_LancamentoAlbum 	date 			not 	null,
    img_Album	 		mediumblob		not		null,
    cd_Artista			int 			not 	null,
    CONSTRAINT pk_Album   PRIMARY KEY (cd_Album),
    CONSTRAINT fk_Artista FOREIGN KEY (cd_Artista)
            REFERENCES Artista(cd_Artista)
);

CREATE TABLE Artista(
	cd_Artista   	int 			not 	null	auto_increment,
	nm_Artista    	varchar(20) 	not 	null,
    ds_Artista   	varchar(30) 	not 	null,
    img_Artista 	mediumblob		not		null,
    CONSTRAINT pk_Artista PRIMARY KEY (cd_Artista)
);