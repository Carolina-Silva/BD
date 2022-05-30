CREATE DATABASE Spotify;
use Spotify;

CREATE TABLE Genero(
	cd_Genero   	int 		not 	null,
    ds_Genero   	varchar(60) not 	null,
    abr_Genero 		varchar(5) 	not 	null,
    CONSTRAINT pk_Genero PRIMARY KEY (cd_Genero)
);

CREATE TABLE TipoConta(
	cd_TipoConta   	int 			not 	null,
	nm_TipoConta   	varchar(20) 	not 	null,
    ds_TipoConta  	varchar(30) 	not 	null,
    CONSTRAINT pk_TipoConta PRIMARY KEY (cd_TipoConta)
);

CREATE TABLE Artista(
	cd_Artista   	int 			not 	null,
	nm_Artista    	varchar(20) 	not 	null,
    ds_Artista   	varchar(30) 	not 	null,
    img_Artista 	mediumblob		not		null,
    CONSTRAINT pk_Artista PRIMARY KEY (cd_Artista)
);

CREATE TABLE Album(
	cd_Album   			int 			not 	null,
	nm_Album    		varchar(20) 	not 	null,
    dt_LancamentoAlbum 	date 			not 	null,
    img_Album	 		mediumblob		not		null,
    CONSTRAINT pk_Album   PRIMARY KEY (cd_Album),
    CONSTRAINT fk_Artista FOREIGN KEY (cd_Artista)
            REFERENCES Artista(cd_Artista)
);

CREATE TABLE Usuario(
	cd_Usuario   		int 			not 	null,
	nm_Usuario    		varchar(20) 	not 	null,
    email_Usuario 		varchar(50) 	not 	null,
    senha_Usuario       varchar(40)		not 	null,
    img_Usuario	 		mediumblob		not		null,
    CONSTRAINT pk_Usuario   PRIMARY KEY (cd_Usuario),
    CONSTRAINT fk_TipoConta FOREIGN KEY (cd_TipoConta)
            REFERENCES TipoConta(cd_TipoConta)
);

CREATE TABLE PlayList(
	cd_PlayList   		int 			not 	null,
	nm_PlayList    		varchar(20) 	not 	null,
    dt_PlayList 		date 			not 	null,
    CONSTRAINT pk_PlayList   PRIMARY KEY (cd_PlayList),
    CONSTRAINT fk_Usuario FOREIGN KEY (cd_Usuario)
            REFERENCES Usuario(cd_Usuario)
);

CREATE TABLE Musica(
	cd_Musica   		int 			not 	null,
	nm_Musica    		varchar(20) 	not 	null,
    CONSTRAINT pk_PlayList   PRIMARY KEY (cd_PlayList),
    CONSTRAINT fk_Genero FOREIGN KEY (cd_Genero)
            REFERENCES Genero (cd_Genero),
	CONSTRAINT fk_Album FOREIGN KEY (cd_Album)
            REFERENCES Album (cd_Album)
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









