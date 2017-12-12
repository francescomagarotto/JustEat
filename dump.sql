CREATE DATABASE IF NOT EXISTS just_eat;
USE just_eat;
CREATE TABLE IF NOT EXISTS citta (
	nome varchar(20) primary key,
    nazione varchar(20) not null,
    unique(nome, nazione)
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
    data_di_nascita DATE NOT NULL,
    data_di_attivazione TIMESTAMP NOT NULL DEFAULT NOW()
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
	piva VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    titolare VARCHAR(50) NOT NULL,
    web VARCHAR(150) DEFAULT NULL,
    indirizzo VARCHAR(75) NOT NULL UNIQUE,
    genere VARCHAR(30) NOT NULL,
    citta VARCHAR(20) DEFAULT NULL REFERENCES citta(nome)
		ON UPDATE CASCADE
        ON DELETE SET NULL,
	telefono varchar(25)
);

CREATE TABLE IF NOT EXISTS pietanza (
	codice INT(11) NOT NULL,
    ristorante varchar(11) NOT NULL REFERENCES ristorante(piva)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    PRIMARY KEY(codice, ristorante),
    costo FLOAT(4, 2) NOT NULL,
    descrizione VARCHAR(300),
    tipologia varchar(20) not null default 'ALTRO',
    alta_digeribilita BOOL not null default false  
    
);

CREATE TABLE IF NOT EXISTS fattorino (
	CF varchar(20),
	telefono int(20) NOT NULL,
	cognome varchar(20) NOT NULL,
	nome varchar(20) NOT NULL,
	data_di_nascita date NOT NULL,
	stipendio FLOAT(4,2) NOT NULL,
	PRIMARY KEY(CF)
);

CREATE TABLE IF NOT EXISTS ordine (
	codice int(11),
	orario_ordine timestamp NOT NULL DEFAULT,
	orario_consegna timestamp NOT NULL,
	PRIMARY KEY(codice)
);

CREATE TABLE IF NOT EXISTS ticket (
	commento varchar(300) NOT NULL,
	codice int(11) REFERENCES ordine(codice)
	ON UPDATE CASCADE
	ON DELETE SET NULL,
	PRIMARY KEY(codice) 
);

