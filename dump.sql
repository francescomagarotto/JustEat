CREATE DATABASE IF NOT EXISTS just_eat;
USE just_eat;
CREATE TABLE IF NOT EXISTS citta (
	nome varchar(20) primary key,
    nazione varchar(20) not null
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
    data_di_attivazione TIMESTAMP
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
	CF varchar(20) PRIMARY KEY,
	telefono int(20) NOT NULL,
	cognome varchar(20) NOT NULL,
	nome varchar(20) NOT NULL,
	data_di_nascita date NOT NULL,
	stipendio_ora NUMERIC(4,2) NOT NULL,
    ore_lavorate int(10) not null,
    check(ore_lavorate >= 0)
);

CREATE TABLE IF NOT EXISTS ordine (
	codice int(11) PRIMARY KEY AUTO_INCREMENT,
    cliente varchar(50) NOT NULL, 
	orario_ordine timestamp NOT NULL DEFAULT NOW(),
	orario_consegna timestamp,
	fattorino VARCHAR(20),
	FOREIGN KEY (fattorino)	REFERENCES fattorino(CF)
		ON UPDATE CASCADE
		ON DELETE SET NULL,
    check(orario_consegna > orario_ordine),
    FOREIGN KEY (cliente) REFERENCES cliente(email)
    	ON UPDATE CASCADE
    	ON DELETE CASCADE,
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
	ON UPDATE CASCADE
	ON DELETE CASCADE,
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
	data_feedback date not null default NOW(),
    commento varchar(300) NOT NULL,
    cliente varchar(20) NOT NULL,
    ristorante varchar(30) NOT NULL,
    FOREIGN KEY (cliente) REFERENCES cliente(email) 
    	ON DELETE SET NULL
    	ON UPDATE CASCADE,
    FOREIGN KEY (ristorante) REFERENCES ristorante(piva)
    	ON DELETE CASCADE
    	ON UPDATE CASCADE
);  
