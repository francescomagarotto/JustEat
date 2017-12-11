CREATE DATABASE JustEast;

CREATE TABLE Città (
	Nome varchar(30),
	Nazione varchar(30) NOT NULL,
	PRIMARY KEY(Nome)
);

CREATE TABLE Ristorante (
	Partita IVA varchar(30),
	Nome varchar(20) NOT NULL,
	Titolare varchar(20) NOT NULL,
	Telefono int NOT NULL,
	Indirizzo varchar(50) NOT NULL,
	Genere culinario varchar(20),
	Sito web varchar(20),
	PRIMARY KEY(Partita IVA)
);

CREATE TABLE Pietanza (
	Codice int,
	Costo smallint NOT NULL,
	Descrizione varchar(50),
	Disponibilità bool,
	PRIMARY KEY(Codice)
);

CREATE TABLE Ordine (
	Codice int(10),
	Orario consegna time,
	Orario ordine time,
	PRIMARY KEY(Codice)
);


CREATE TABLE Fattorino (
	CF int,
	Nome varchar(20),
	Cognome varchar(20),
	Numero di telefono int,
	Stipendio int,
	PRIMARY KEY(CF)
);

CREATE TABLE Cliente(
	CF int,
	Nome varchar(20),
	Cognome varchar(20),
	Indirizzo varchar(30),
	PRIMARY KEY(CF) 
);

CREATE TABLE Cliente registrato(
	Allergia varchar(20),
	Email varchar(30),
	PRIMARY KEY(Email)
);

CREATE TABLE Ticket(
	Codice int,
	Commento varchar(100),
	PRIMARY KEY(Codice)
);
