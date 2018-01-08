-- phpMyAdmin SQL Dump
-- version 4.7.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Gen 08, 2018 alle 12:57
-- Versione del server: 10.1.29-MariaDB
-- Versione PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `just_eat`
--

DELIMITER $$
--
-- Funzioni
--
CREATE DEFINER=`root`@`localhost` FUNCTION `costoTotale` (`tot` DECIMAL(4,2) UNSIGNED ZEROFILL, `email` VARCHAR(30)) RETURNS DECIMAL(4,2) BEGIN
SELECT SUM(p.costo) INTO tot
FROM ordine o JOIN dettagli_ordine do on o.codice = do.ordine JOIN pietanza p on do.pietanza = p.codice
WHERE o.cliente = email;
RETURN tot;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `prezzoMinMax` (`cos` DECIMAL(4,2) UNSIGNED ZEROFILL, `MinMax` ENUM('min','max')) RETURNS DECIMAL(4,2) IF(MinMax = 'min') THEN
SELECT MIN(p.costo) into cos
FROM dettagli_ordine dor JOIN pietanza p on dor.pietanza=p.codice; RETURN cos;
ELSE
SELECT MAX(p.costo) into cos
FROM dettagli_ordine dor JOIN pietanza p on dor.pietanza=p.codice; RETURN cos;
END IF$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `a1`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `a1` (
`allergie` varchar(25)
);

-- --------------------------------------------------------

--
-- Struttura della tabella `allergia`
--

CREATE TABLE `allergia` (
  `codice` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `allergia`
--

INSERT INTO `allergia` (`codice`, `nome`) VALUES
(3, 'Antiossidanti'),
(8, 'Arachide'),
(10, 'Celiachia'),
(1, 'Coloranti'),
(4, 'Esaltatori del sapor'),
(7, 'Latte'),
(5, 'Molluschi'),
(2, 'Preservanti'),
(9, 'Soia'),
(6, 'Uova');

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `c12`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `c12` (
`occorrenze` bigint(21)
,`cliente` varchar(50)
);

-- --------------------------------------------------------

--
-- Struttura della tabella `citta`
--

CREATE TABLE `citta` (
  `cap` char(5) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `nazione` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `citta`
--

INSERT INTO `citta` (`cap`, `nome`, `nazione`) VALUES
('01112', 'Torino', 'Italia'),
('12223', 'Palermo', 'Italia'),
('12345', 'Roma', 'Italia'),
('13141', 'Padova', 'Italia'),
('18192', 'Vicenza', 'Italia'),
('36061', 'Bassano del Grappa', 'Italia'),
('51617', 'Genova', 'Italia'),
('67891', 'Milano', 'Italia'),
('80121', 'Napoli', 'Italia');

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE `cliente` (
  `email` varchar(50) NOT NULL,
  `nome` varchar(25) NOT NULL,
  `cognome` varchar(25) NOT NULL,
  `indirizzo` varchar(20) NOT NULL,
  `citta` char(5) NOT NULL,
  `data_di_nascita` date NOT NULL,
  `data_di_attivazione` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `cliente`
--

INSERT INTO `cliente` (`email`, `nome`, `cognome`, `indirizzo`, `citta`, `data_di_nascita`, `data_di_attivazione`) VALUES
('caty65@icloud.com', 'Caty', 'Rowling', 'Via Re D\'Italia 43', '51617', '1965-01-02', '2018-01-02 12:42:03'),
('caty65@libero.com', 'Caty', 'Rowling', 'Via Belzoni 23', '12223', '1965-01-02', '2016-02-29 23:00:00'),
('ezio12@gmail.com', 'Ezio', 'Auditore', 'Via Maseralino 12', '12345', '1969-05-23', '0000-00-00 00:00:00'),
('marcocostantitno@libero.it', 'Marco', 'Costantino', 'Via Baggio 146', '36061', '1997-09-26', '2016-08-11 15:46:58'),
('sharona_123@gmail.com', 'Sharona', 'Jet', 'Via Ohibò 12', '13141', '1965-01-02', '2015-12-11 23:00:00'),
('timoty96@yahoo.com', 'Timoty', 'Genialetti', 'Via Pippo Baudo 69', '18192', '1965-01-02', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `dettagli_ordine`
--

CREATE TABLE `dettagli_ordine` (
  `quantita` smallint(6) NOT NULL,
  `ordine` int(11) NOT NULL,
  `pietanza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `dettagli_ordine`
--

INSERT INTO `dettagli_ordine` (`quantita`, `ordine`, `pietanza`) VALUES
(1, 1, 7),
(1, 2, 4),
(1, 3, 8),
(1, 4, 5),
(2, 5, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `fattorino`
--

CREATE TABLE `fattorino` (
  `CF` char(20) NOT NULL,
  `telefono` int(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `data_di_nascita` date NOT NULL,
  `stipendio_ora` decimal(4,2) NOT NULL,
  `ore_lavoro` int(10) NOT NULL,
  `punteggio` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `fattorino`
--

INSERT INTO `fattorino` (`CF`, `telefono`, `cognome`, `nome`, `data_di_nascita`, `stipendio_ora`, `ore_lavoro`, `punteggio`) VALUES
('MDNCRA00A41Z226A', 2147483647, 'Magia', 'Maria', '1900-01-01', '4.20', 40, 3),
('MGRFNC97T15G224H', 2147483647, 'Magarotto', 'Francesco', '1997-12-15', '6.20', 40, 0),
('ZKYDEV87A45T560I', 2147483647, 'Rossi', 'Mario', '1987-04-15', '4.00', 22, 11),
('ZLIDVD97R24A703I', 2147483647, 'Zilio', 'Davide', '1997-10-24', '6.20', 40, 20);

-- --------------------------------------------------------

--
-- Struttura della tabella `feedback`
--

CREATE TABLE `feedback` (
  `codice_feedback` int(11) NOT NULL,
  `data_feedback` date NOT NULL,
  `commento` varchar(300) NOT NULL,
  `cliente` varchar(50) DEFAULT NULL,
  `ristorante` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `feedback`
--

INSERT INTO `feedback` (`codice_feedback`, `data_feedback`, `commento`, `cliente`, `ristorante`) VALUES
(1, '2017-12-28', 'Ottimo ristorante, ottimo cibo e veloci nella consegna. Veramente valido.', 'ezio12@gmail.com', '98712456123'),
(2, '2017-12-27', 'Ottimo cibo. Unica pecca la consegna.', 'caty65@libero.com', '33343536762');

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `o1`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `o1` (
`ordini` varchar(25)
);

-- --------------------------------------------------------

--
-- Struttura della tabella `ordine`
--

CREATE TABLE `ordine` (
  `codice` int(11) NOT NULL,
  `cliente` varchar(50) NOT NULL,
  `orario_ordine` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `orario_consegna` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fattorino` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `ordine`
--

INSERT INTO `ordine` (`codice`, `cliente`, `orario_ordine`, `orario_consegna`, `fattorino`) VALUES
(1, 'ezio12@gmail.com', '2017-12-28 10:02:35', '2017-12-28 10:02:35', 'MDNCRA00A41Z226A'),
(2, 'timoty96@yahoo.com', '2014-09-18 16:50:09', '2014-09-11 18:00:47', 'ZLIDVD97R24A703I'),
(3, 'caty65@icloud.com', '2013-10-11 16:48:28', '2013-10-11 18:10:00', 'ZLIDVD97R24A703I'),
(4, 'sharona_123@gmail.com', '2013-11-11 18:56:51', '2013-11-11 20:30:00', 'MGRFNC97T15G224H'),
(5, 'marcocostantitno@libero.it', '2015-12-11 17:40:00', '2015-12-11 18:30:00', 'MGRFNC97T15G224H');

-- --------------------------------------------------------

--
-- Struttura della tabella `patologia`
--

CREATE TABLE `patologia` (
  `cliente` varchar(50) NOT NULL,
  `allergia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `patologia`
--

INSERT INTO `patologia` (`cliente`, `allergia`) VALUES
('caty65@icloud.com', 10),
('ezio12@gmail.com', 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `pietanza`
--

CREATE TABLE `pietanza` (
  `codice` int(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `ristorante` varchar(11) NOT NULL,
  `costo` decimal(4,2) NOT NULL,
  `descrizione` text,
  `tipologia` varchar(20) NOT NULL DEFAULT 'ALTRO',
  `cottura` varchar(10) DEFAULT NULL,
  `disponibilita` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `pietanza`
--

INSERT INTO `pietanza` (`codice`, `nome`, `ristorante`, `costo`, `descrizione`, `tipologia`, `cottura`, `disponibilita`) VALUES
(0, 'Ravioli di carne', '21222324252', '4.50', 'Raviolo di carne cinese (10gr)', 'ALTRO', 'VAPORE', 10),
(1, 'Riso al curry', '62728293031', '10.40', 'Riso al curry per due persone:\r\n - Riso basmati 250gr\r\n - Pollo al curry 250gr\r\n', 'ALTRO', NULL, 3),
(2, 'Risotto ai funghi porcini', '98712456123', '18.99', 'Porzione da 120gr di risotto ai funghi porcini per una persona.\r\nI funghi sono freschi.', 'ALTRO', NULL, 2),
(3, 'Pasta al forno calabrese', '98712456123', '13.00', 'Classica ricetta calabrese: pasta, mozzarella, salamino piccante, polpettine.', 'ALTRO', 'FORNO', 1),
(4, 'Risotto ai frutti di mare', '62728293031', '27.40', 'Porzione da 120gr di risotto ai frutti di mare.\r\n - Si utilizza pesce fresco\r\n - Il riso utilizzato è il basmati.', 'ALTRO', NULL, 5),
(5, 'Pesce fritto misto', '10111234685', '27.30', 'Porzione di pesce fritto misto con polenta per due persone (250gr) ', 'ALTRO', 'FRITTA', 3),
(6, 'Ravioli di carne', '21222324252', '4.50', 'Raviolo di carne cinese (10gr)', 'ALTRO', 'VAPORE', 10),
(7, 'Goulash con patate', '17247391301', '16.00', 'Porzione di goulash leggermente piccante con un contorno di patate al forno (100gr)', 'ALTRO', NULL, 2),
(8, 'Mix di contorni', '01234567891', '10.00', 'Mix di contorni vari (insalata, carote, piselli, fagioli, pomodori freschi)', 'VEGETARIANA', NULL, 5);

--
-- Trigger `pietanza`
--
DELIMITER $$
CREATE TRIGGER `MANUAL_AUTOINCREMENT` BEFORE INSERT ON `pietanza` FOR EACH ROW SET NEW.codice = (
SELECT MAX(codice)+1 
FROM pietanza WHERE ristorante = NEW.ristorante)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `ristorante`
--

CREATE TABLE `ristorante` (
  `piva` char(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `titolare` varchar(50) NOT NULL,
  `web` varchar(150) DEFAULT NULL,
  `indirizzo` varchar(75) NOT NULL,
  `genere` varchar(30) NOT NULL,
  `citta` char(5) NOT NULL,
  `telefono` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `ristorante`
--

INSERT INTO `ristorante` (`piva`, `nome`, `titolare`, `web`, `indirizzo`, `genere`, `citta`, `telefono`) VALUES
('01234567891', 'Da Gino', 'Gino Strada', 'www.dagino.italia.it', 'Via Vo\' dei Puffi 12', 'Italiana', '67891', '34812829873'),
('10111234685', 'El Gaucio', 'Rodrigo Suarez', 'www.elgaucio.rome.it', 'Via Unita\' d\'Italia', 'Spagnola', '12345', '34812829873'),
('17247391301', 'El Pito', 'Giuseppe Rovetti', 'www.elpito.it', 'Via Gustavo Modena 19', 'Italiana', '13141', '34812829873'),
('21222324252', 'Ristorante 88', 'Shen Chang', 'www.ristorante88.it', 'Via Uruguay 23', 'Cinese', '67891', '3296785671'),
('33343536762', 'Da Never', 'Marco Silvestrin', 'www.danever.it', 'Via Maseralino 3A', 'Italiana', '67891', '33812365401'),
('62728293031', 'Marok', 'Abdul Joyrien', 'www.marok.com/it', 'Via Vittorio Emanuele II 14', 'Marocchina', '67891', '34812829873'),
('98712456123', 'Il Ripetente', 'Marco Rosin', 'www.ripetente.rosinmarco.com/it', 'Via Belzoni 21', 'Italiana', '13141', '34812829873');

-- --------------------------------------------------------

--
-- Struttura della tabella `ticket`
--

CREATE TABLE `ticket` (
  `cliente` varchar(50) NOT NULL,
  `commento` text NOT NULL,
  `ordine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `ticket`
--

INSERT INTO `ticket` (`cliente`, `commento`, `ordine`) VALUES
('caty65@icloud.com', 'Verdura non fresca.', 3),
('ezio12@gmail.com', 'Cibo freddo e non cotto a dovere.', 1),
('marcocostantitno@libero.it', 'Risotto mai arrivato.', 5);

-- --------------------------------------------------------

--
-- Struttura per vista `a1`
--
DROP TABLE IF EXISTS `a1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `a1`  AS  select `c`.`cognome` AS `allergie` from ((`cliente` `c` join `patologia` `p` on((`c`.`email` = `p`.`cliente`))) join `allergia` `a` on((`p`.`allergia` = `a`.`codice`))) ;

-- --------------------------------------------------------

--
-- Struttura per vista `c12`
--
DROP TABLE IF EXISTS `c12`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `c12`  AS  select count(`o1`.`cliente`) AS `occorrenze`,`o1`.`cliente` AS `cliente` from (`ordine` `o1` join `ordine` `o2` on((`o1`.`cliente` = `o2`.`cliente`))) where (`o1`.`codice` <> `o2`.`codice`) group by `o1`.`cliente` ;

-- --------------------------------------------------------

--
-- Struttura per vista `o1`
--
DROP TABLE IF EXISTS `o1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `o1`  AS  select `c`.`cognome` AS `ordini` from ((`cliente` `c` join `ordine` `o` on((`c`.`email` = `o`.`cliente`))) join `dettagli_ordine` `do` on((`o`.`codice` = `do`.`ordine`))) ;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `allergia`
--
ALTER TABLE `allergia`
  ADD PRIMARY KEY (`codice`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Indici per le tabelle `citta`
--
ALTER TABLE `citta`
  ADD PRIMARY KEY (`cap`);

--
-- Indici per le tabelle `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`email`),
  ADD KEY `citta` (`citta`);

--
-- Indici per le tabelle `dettagli_ordine`
--
ALTER TABLE `dettagli_ordine`
  ADD PRIMARY KEY (`ordine`,`pietanza`),
  ADD KEY `pietanza` (`pietanza`);

--
-- Indici per le tabelle `fattorino`
--
ALTER TABLE `fattorino`
  ADD PRIMARY KEY (`CF`);

--
-- Indici per le tabelle `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`codice_feedback`),
  ADD KEY `cliente` (`cliente`),
  ADD KEY `ristorante` (`ristorante`);

--
-- Indici per le tabelle `ordine`
--
ALTER TABLE `ordine`
  ADD PRIMARY KEY (`codice`),
  ADD KEY `fattorino` (`fattorino`),
  ADD KEY `cliente` (`cliente`);

--
-- Indici per le tabelle `patologia`
--
ALTER TABLE `patologia`
  ADD PRIMARY KEY (`cliente`,`allergia`),
  ADD KEY `allergia` (`allergia`);

--
-- Indici per le tabelle `pietanza`
--
ALTER TABLE `pietanza`
  ADD PRIMARY KEY (`codice`,`ristorante`),
  ADD KEY `ristorante` (`ristorante`);

--
-- Indici per le tabelle `ristorante`
--
ALTER TABLE `ristorante`
  ADD PRIMARY KEY (`piva`),
  ADD UNIQUE KEY `indirizzo` (`indirizzo`),
  ADD KEY `citta` (`citta`);

--
-- Indici per le tabelle `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`cliente`,`ordine`),
  ADD KEY `ordine` (`ordine`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `allergia`
--
ALTER TABLE `allergia`
  MODIFY `codice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `feedback`
--
ALTER TABLE `feedback`
  MODIFY `codice_feedback` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `ordine`
--
ALTER TABLE `ordine`
  MODIFY `codice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`citta`) REFERENCES `citta` (`cap`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limiti per la tabella `dettagli_ordine`
--
ALTER TABLE `dettagli_ordine`
  ADD CONSTRAINT `dettagli_ordine_ibfk_1` FOREIGN KEY (`ordine`) REFERENCES `ordine` (`codice`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dettagli_ordine_ibfk_2` FOREIGN KEY (`pietanza`) REFERENCES `pietanza` (`codice`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limiti per la tabella `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`email`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`ristorante`) REFERENCES `ristorante` (`piva`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `ordine`
--
ALTER TABLE `ordine`
  ADD CONSTRAINT `ordine_ibfk_1` FOREIGN KEY (`fattorino`) REFERENCES `fattorino` (`CF`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ordine_ibfk_2` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
