CREATE DATABASE IF NOT EXISTS just_eat;

USE just_eat;

CREATE TABLE IF NOT EXISTS citta (
	cap int(5) primary key,
	nome varchar(20) not null,
    nazione varchar(20) not nullz
);

CREATE TABLE IF NOT EXISTS allergia (
	codice INT(11) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS cliente (
	email VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(25) NOT NULL, 
    cognome VARCHAR(25) NOT NULL,
    indirizzo VARCHAR(20) NOT NULL,
    citta int(5) NOT NULL,
    data_di_nascita DATE NOT NULL,
    data_di_attivazione TIMESTAMP,
    FOREIGN KEY (citta) REFERENCES citta(cap) 
    	ON DELETE NO ACTION
    	ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS patologia (
	 cliente varchar(50) NOT NULL,
    allergia int(11) NOT NULL,
    PRIMARY KEY(cliente, allergia),
    FOREIGN KEY (cliente) REFERENCES cliente(email)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	FOREIGN KEY (allergia) REFERENCES allergia(codice)
		ON UPDATE CASCADE
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS ristorante (
   piva CHAR(11) PRIMARY KEY,
   nome VARCHAR(50) NOT NULL,
   titolare VARCHAR(50) NOT NULL,
   web VARCHAR(150) DEFAULT NULL,
   indirizzo VARCHAR(75) NOT NULL UNIQUE,
   genere VARCHAR(30) NOT NULL,
   citta VARCHAR(20) DEFAULT NULL,
	telefono varchar(25) DEFAULT NULL,
	FOREIGN KEY (citta) REFERENCES citta(nome)
		ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS pietanza (
	codice INT(11) NOT NULL,
    ristorante varchar(11) NOT NULL,
    PRIMARY KEY(codice, ristorante),
    costo NUMERIC(4, 2) NOT NULL,
    descrizione TEXT,
    tipologia varchar(20) not null default 'ALTRO',
    cottura varchar(10) default null,
    disponibilita bool default true not null,
    FOREIGN KEY (ristorante) REFERENCES ristorante(piva)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS fattorino (
	CF char(20) PRIMARY KEY,
	telefono int(20) NOT NULL,
	cognome varchar(20) NOT NULL,
	nome varchar(20) NOT NULL,
	data_di_nascita date NOT NULL,
	stipendio_ora NUMERIC(4,2) NOT NULL,
    ore_lavoro int(10) not null,
    punteggio int(10) not null default 0,
    check(ore_lavoro >= 0)
);

CREATE TABLE IF NOT EXISTS ordine (
	codice int(11) PRIMARY KEY AUTO_INCREMENT,
    cliente varchar(50) NOT NULL, 
	orario_ordine timestamp NOT NULL DEFAULT NOW(),
	orario_consegna timestamp DEFAULT NOW(),
	fattorino CHAR(20),
	FOREIGN KEY (fattorino)	REFERENCES fattorino(CF)
		ON UPDATE CASCADE
		ON DELETE SET NULL,
    check(orario_consegna > orario_ordine),
    FOREIGN KEY (cliente) REFERENCES cliente(email)
    	ON UPDATE CASCADE
    	ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS dettagli_ordine (
    quantita smallint NOT NULL,
    check(quantita > 0),
    ordine int(11) NOT NULL, 
    pietanza int(11) NOT NULL,
    PRIMARY KEY(ordine, pietanza),
    FOREIGN KEY (ordine) REFERENCES ordine(codice)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (pietanza) REFERENCES pietanza(codice)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS ticket (
	cliente varchar(50) not null,
	commento text NOT NULL,
	ordine int(11) NOT NULL,
   PRIMARY KEY(cliente, ordine),
   FOREIGN KEY (cliente) REFERENCES cliente(email)
    	ON UPDATE CASCADE
    	ON DELETE CASCADE,
   FOREIGN KEY (ordine) REFERENCES ordine(codice)
    	ON DELETE NO ACTION
    	ON UPDATE NO ACTION
    );

CREATE TABLE IF NOT EXISTS feedback (
	codice_feedback int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	data_feedback date not null,
    commento varchar(300) NOT NULL,
    cliente varchar(50),
    ristorante CHAR(11) NOT NULL,
    FOREIGN KEY (cliente) REFERENCES cliente(email) 
    	ON DELETE SET NULL
    	ON UPDATE CASCADE,
    FOREIGN KEY (ristorante) REFERENCES ristorante(piva)
    	ON DELETE CASCADE
    	ON UPDATE CASCADE
);  

INSERT INTO allergia(nome) VALUES ('Coloranti');
INSERT INTO allergia(nome) VALUES ('Preservanti');
INSERT INTO allergia(nome) VALUES ('Antiossidanti');
INSERT INTO allergia(nome) VALUES ('Esaltatori del sapore');
INSERT INTO allergia(nome) VALUES ('Molluschi');
INSERT INTO allergia(nome) VALUES ('Uovo');
INSERT INTO allergia(nome) VALUES ('Latte');
INSERT INTO allergia(nome) VALUES ('Arachide');
INSERT INTO allergia(nome) VALUES ('Soia');

INSERT INTO citta(nome, nazione) VALUES ('Roma','Italia');
INSERT INTO citta(nome, nazione) VALUES ('Milano','Italia');
INSERT INTO citta(nome, nazione) VALUES ('Torino','Italia');
INSERT INTO citta(nome, nazione) VALUES ('Padova','Italia');
INSERT INTO citta(nome, nazione) VALUES ('Genova','Italia');
INSERT INTO citta(nome, nazione) VALUES ('Vicenza','Italia');
INSERT INTO citta(nome, nazione) VALUES ('Palermo','Italia');

INSERT INTO utente(email, nome, cognome, indirizzo, data_di_nascita, data_di_attivazione)
VALUES ('ezio12@gmail.com', 'Ezio', 'Auditore', 'Via Maseralino 12, Codevigo', )