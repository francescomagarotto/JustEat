CREATE DATABASE  IF NOT EXISTS `just_eat` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `just_eat`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: just_eat
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.29-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `a1`
--

DROP TABLE IF EXISTS `a1`;
/*!50001 DROP VIEW IF EXISTS `a1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `a1` AS SELECT 
 1 AS `allergie`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `allergia`
--

DROP TABLE IF EXISTS `allergia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allergia` (
  `codice` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  PRIMARY KEY (`codice`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergia`
--

LOCK TABLES `allergia` WRITE;
/*!40000 ALTER TABLE `allergia` DISABLE KEYS */;
INSERT INTO `allergia` VALUES (3,'Antiossidanti'),(8,'Arachide'),(10,'Celiachia'),(1,'Coloranti'),(4,'Esaltatori del sapor'),(11,'glucosio'),(7,'Latte'),(5,'Molluschi'),(2,'Preservanti'),(9,'Soia'),(6,'Uova');
/*!40000 ALTER TABLE `allergia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `c12`
--

DROP TABLE IF EXISTS `c12`;
/*!50001 DROP VIEW IF EXISTS `c12`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `c12` AS SELECT 
 1 AS `occorrenze`,
 1 AS `cliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `citta`
--

DROP TABLE IF EXISTS `citta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citta` (
  `cap` char(5) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `nazione` varchar(20) NOT NULL,
  PRIMARY KEY (`cap`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citta`
--

LOCK TABLES `citta` WRITE;
/*!40000 ALTER TABLE `citta` DISABLE KEYS */;
INSERT INTO `citta` VALUES ('01112','Torino','Italia'),('12223','Palermo','Italia'),('12345','Roma','Italia'),('13141','Padova','Italia'),('18192','Vicenza','Italia'),('36061','Bassano del Grappa','Italia'),('51617','Genova','Italia'),('67891','Milano','Italia'),('80121','Napoli','Italia');
/*!40000 ALTER TABLE `citta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `email` varchar(50) NOT NULL,
  `nome` varchar(25) NOT NULL,
  `cognome` varchar(25) NOT NULL,
  `indirizzo` varchar(40) NOT NULL,
  `citta` char(5) NOT NULL,
  `data_di_nascita` date NOT NULL,
  `data_di_attivazione` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`),
  KEY `citta` (`citta`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`citta`) REFERENCES `citta` (`cap`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('alexasattin@virgilio.it','Alexa','Sattin','Via Ugo Bassi 14','13141','1996-05-13','2015-07-14 13:46:21'),('caty65@icloud.com','Caty','Rowling','Via Re D\'Italia 43','51617','1965-01-02','2018-01-02 12:42:03'),('catybassotto@libero.com','Caty','Bassotto','Via Belzoni 23','12223','1985-01-02','2016-02-29 23:00:00'),('ezio12@gmail.com','Ezio','Auditore','Via Maseralino 12','12345','1969-05-23','0000-00-00 00:00:00'),('gianna@icloud.com','Gianna','Nannini','Via Cantautorato 13','80121','1959-06-18','2016-10-11 15:14:12'),('marcocostantino@libero.it','Marco','Costantino','Via Baggio 146','36061','1997-09-26','2018-01-20 20:57:50'),('rosannacall@gmail.com','Rosanna','Callegaro','Via Rinaldo 1','51617','1965-01-10',NULL),('sharona_123@gmail.com','Sharona','Jet','Via Ohibò 12','13141','1965-01-02','2015-12-11 23:00:00'),('timoty96@yahoo.com','Timoty','Genialetti','Via Pippo Baudo 69','18192','1965-01-02',NULL),('vascorossi@yahoo.com','Vasco','Rossi','Via Dell\'industria 5','18192','1958-04-07','2017-04-12 06:47:41');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dettagli_ordine`
--

DROP TABLE IF EXISTS `dettagli_ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dettagli_ordine` (
  `quantita` smallint(6) NOT NULL,
  `ordine` int(11) NOT NULL,
  `pietanza` int(11) NOT NULL,
  PRIMARY KEY (`ordine`,`pietanza`),
  KEY `pietanza` (`pietanza`),
  CONSTRAINT `dettagli_ordine_ibfk_1` FOREIGN KEY (`ordine`) REFERENCES `ordine` (`codice`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dettagli_ordine_ibfk_2` FOREIGN KEY (`pietanza`) REFERENCES `pietanza` (`codice`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dettagli_ordine`
--

LOCK TABLES `dettagli_ordine` WRITE;
/*!40000 ALTER TABLE `dettagli_ordine` DISABLE KEYS */;
INSERT INTO `dettagli_ordine` VALUES (1,1,7),(1,2,4),(1,3,8),(1,4,5),(2,5,2),(1,6,3),(2,7,4),(1,8,5);
/*!40000 ALTER TABLE `dettagli_ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fattorino`
--

DROP TABLE IF EXISTS `fattorino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fattorino` (
  `CF` char(20) NOT NULL,
  `telefono` int(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `data_di_nascita` date NOT NULL,
  `stipendio_ora` decimal(4,2) NOT NULL,
  `ore_lavoro` int(10) NOT NULL,
  `punteggio` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CF`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fattorino`
--

LOCK TABLES `fattorino` WRITE;
/*!40000 ALTER TABLE `fattorino` DISABLE KEYS */;
INSERT INTO `fattorino` VALUES ('MDNCRA00A41Z226A',2147483647,'Magia','Maria','1900-01-01',4.20,40,3),('MGRFNC97T15G224H',2147483647,'Magarotto','Francesco','1997-12-15',6.20,40,0),('ZKYDEV87A45T560I',2147483647,'Rossi','Mario','1987-04-15',4.00,22,11),('ZLIDVD97R24A703I',2147483647,'Zilio','Davide','1997-10-24',6.20,40,20);
/*!40000 ALTER TABLE `fattorino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `codice_feedback` int(11) NOT NULL AUTO_INCREMENT,
  `data_feedback` date NOT NULL,
  `commento` varchar(300) NOT NULL,
  `cliente` varchar(50) DEFAULT NULL,
  `ristorante` char(11) NOT NULL,
  PRIMARY KEY (`codice_feedback`),
  KEY `cliente` (`cliente`),
  KEY `ristorante` (`ristorante`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`email`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`ristorante`) REFERENCES `ristorante` (`piva`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'2017-12-28','Ottimo ristorante, ottimo cibo e veloci nella consegna. Veramente valido.','ezio12@gmail.com','98712456123'),(2,'2017-12-27','Ottimo cibo. Unica pecca la consegna.','catybassotto@libero.com','33343536762'),(3,'2018-01-12','Buonissimo','sharona_123@gmail.com','62728293031');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `o1`
--

DROP TABLE IF EXISTS `o1`;
/*!50001 DROP VIEW IF EXISTS `o1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `o1` AS SELECT 
 1 AS `ordini`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `occ`
--

DROP TABLE IF EXISTS `occ`;
/*!50001 DROP VIEW IF EXISTS `occ`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `occ` AS SELECT 
 1 AS `occorrenze`,
 1 AS `cliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ordine`
--

DROP TABLE IF EXISTS `ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordine` (
  `codice` int(11) NOT NULL AUTO_INCREMENT,
  `cliente` varchar(50) NOT NULL,
  `orario_ordine` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `orario_consegna` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `metodo_pagamento` varchar(20) NOT NULL DEFAULT 'Paypal',
  `fattorino` char(20) DEFAULT NULL,
  PRIMARY KEY (`codice`),
  KEY `fattorino` (`fattorino`),
  KEY `cliente` (`cliente`),
  CONSTRAINT `ordine_ibfk_1` FOREIGN KEY (`fattorino`) REFERENCES `fattorino` (`CF`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ordine_ibfk_2` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
INSERT INTO `ordine` VALUES (1,'ezio12@gmail.com','2017-12-28 10:02:35','2017-12-28 10:02:35','Paypal','MDNCRA00A41Z226A'),(2,'timoty96@yahoo.com','2014-09-18 16:50:09','2014-09-11 18:00:47','Paypal','ZLIDVD97R24A703I'),(3,'caty65@icloud.com','2013-10-11 16:48:28','2013-10-11 18:10:00','contanti','ZLIDVD97R24A703I'),(4,'sharona_123@gmail.com','2013-11-11 18:56:51','2013-11-11 20:30:00','Mastercard','MGRFNC97T15G224H'),(5,'marcocostantino@libero.it','2015-12-11 17:40:00','2015-12-11 18:30:00','Paypal','MGRFNC97T15G224H'),(6,'timoty96@yahoo.com','2018-01-08 12:06:55','2018-01-08 12:06:55','Paypal','MDNCRA00A41Z226A'),(7,'timoty96@yahoo.com','2018-01-09 08:52:23','2018-01-09 08:52:23','contanti','ZLIDVD97R24A703I'),(8,'ezio12@gmail.com','2018-01-21 11:53:04','2018-01-21 11:53:04','contanti','MDNCRA00A41Z226A');
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patologia`
--

DROP TABLE IF EXISTS `patologia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patologia` (
  `cliente` varchar(50) NOT NULL,
  `allergia` int(11) NOT NULL,
  PRIMARY KEY (`cliente`,`allergia`),
  KEY `allergia` (`allergia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patologia`
--

LOCK TABLES `patologia` WRITE;
/*!40000 ALTER TABLE `patologia` DISABLE KEYS */;
INSERT INTO `patologia` VALUES ('caty65@icloud.com',10),('ezio12@gmail.com',6);
/*!40000 ALTER TABLE `patologia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pietanza`
--

DROP TABLE IF EXISTS `pietanza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pietanza` (
  `codice` int(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `ristorante` varchar(11) NOT NULL,
  `costo` decimal(4,2) NOT NULL,
  `descrizione` text,
  `tipologia` varchar(20) NOT NULL DEFAULT 'ALTRO',
  `cottura` varchar(10) DEFAULT NULL,
  `disponibilita` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`codice`,`ristorante`),
  KEY `ristorante` (`ristorante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pietanza`
--

LOCK TABLES `pietanza` WRITE;
/*!40000 ALTER TABLE `pietanza` DISABLE KEYS */;
INSERT INTO `pietanza` VALUES (0,'Ravioli di carne','21222324252',4.50,'Raviolo di carne cinese (10gr)','ALTRO','VAPORE',10),(1,'Riso al curry','62728293031',10.40,'Riso al curry per due persone:\r\n - Riso basmati 250gr\r\n - Pollo al curry 250gr\r\n','ALTRO',NULL,3),(2,'Risotto ai funghi porcini','98712456123',18.99,'Porzione da 120gr di risotto ai funghi porcini per una persona.\r\nI funghi sono freschi.','ALTRO',NULL,2),(3,'Pasta al forno calabrese','98712456123',13.00,'Classica ricetta calabrese: pasta, mozzarella, salamino piccante, polpettine.','ALTRO','FORNO',1),(4,'Risotto ai frutti di mare','62728293031',27.40,'Porzione da 120gr di risotto ai frutti di mare.\r\n - Si utilizza pesce fresco\r\n - Il riso utilizzato è il basmati.','ALTRO',NULL,5),(5,'Pesce fritto misto','10111234685',27.30,'Porzione di pesce fritto misto con polenta per due persone (250gr) ','ALTRO','FRITTA',3),(6,'Ravioli di carne','21222324252',4.50,'Raviolo di carne cinese (10gr)','ALTRO','VAPORE',10),(7,'Goulash con patate','17247391301',16.00,'Porzione di goulash leggermente piccante con un contorno di patate al forno (100gr)','ALTRO',NULL,2),(8,'Mix di contorni','01234567891',10.00,'Mix di contorni vari (insalata, carote, piselli, fagioli, pomodori freschi)','VEGETARIANA',NULL,5);
/*!40000 ALTER TABLE `pietanza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pmax`
--

DROP TABLE IF EXISTS `pmax`;
/*!50001 DROP VIEW IF EXISTS `pmax`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `pmax` AS SELECT 
 1 AS `nome`,
 1 AS `maxP`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `q1`
--

DROP TABLE IF EXISTS `q1`;
/*!50001 DROP VIEW IF EXISTS `q1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `q1` AS SELECT 
 1 AS `codice`,
 1 AS `cliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `q2`
--

DROP TABLE IF EXISTS `q2`;
/*!50001 DROP VIEW IF EXISTS `q2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `q2` AS SELECT 
 1 AS `CF`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `q3`
--

DROP TABLE IF EXISTS `q3`;
/*!50001 DROP VIEW IF EXISTS `q3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `q3` AS SELECT 
 1 AS `cognome`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `q4`
--

DROP TABLE IF EXISTS `q4`;
/*!50001 DROP VIEW IF EXISTS `q4`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `q4` AS SELECT 
 1 AS `cliente`,
 1 AS `numero_pietanza`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `q5`
--

DROP TABLE IF EXISTS `q5`;
/*!50001 DROP VIEW IF EXISTS `q5`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `q5` AS SELECT 
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `q6`
--

DROP TABLE IF EXISTS `q6`;
/*!50001 DROP VIEW IF EXISTS `q6`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `q6` AS SELECT 
 1 AS `nome`,
 1 AS `occorrenze`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `q7`
--

DROP TABLE IF EXISTS `q7`;
/*!50001 DROP VIEW IF EXISTS `q7`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `q7` AS SELECT 
 1 AS `nome`,
 1 AS `numero_ordini`,
 1 AS `AVG(p.costo)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ristorante`
--

DROP TABLE IF EXISTS `ristorante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ristorante` (
  `piva` char(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `titolare` varchar(50) NOT NULL,
  `web` varchar(150) DEFAULT NULL,
  `indirizzo` varchar(75) NOT NULL,
  `genere` varchar(30) NOT NULL,
  `citta` char(5) NOT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`piva`),
  UNIQUE KEY `indirizzo` (`indirizzo`),
  KEY `citta` (`citta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ristorante`
--

LOCK TABLES `ristorante` WRITE;
/*!40000 ALTER TABLE `ristorante` DISABLE KEYS */;
INSERT INTO `ristorante` VALUES ('01234567891','Da Gino','Gino Strada','www.dagino.italia.it','Via Vo\' dei Puffi 12','Italiana','67891','34812829873'),('10111234685','El Gaucio','Rodrigo Suarez','www.elgaucio.rome.it','Via Unita\' d\'Italia','Spagnola','12345','34812829873'),('17247391301','El Pito','Giuseppe Rovetti','www.elpito.it','Via Gustavo Modena 19','Italiana','13141','34812829873'),('21222324252','Ristorante 88','Shen Chang','www.ristorante88.it','Via Uruguay 23','Cinese','67891','3296785671'),('33343536762','Da Never','Marco Silvestrin','www.danever.it','Via Maseralino 3A','Italiana','67891','33812365401'),('62728293031','Marok','Abdul Joyrien','www.marok.com/it','Via Vittorio Emanuele II 14','Marocchina','67891','34812829873'),('98712456123','Il Ripetente','Marco Rosin','www.ripetente.rosinmarco.com/it','Via Belzoni 21','Italiana','13141','34812829873');
/*!40000 ALTER TABLE `ristorante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `cliente` varchar(50) NOT NULL,
  `commento` text NOT NULL,
  `ordine` int(11) NOT NULL,
  PRIMARY KEY (`cliente`,`ordine`),
  KEY `ordine` (`ordine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES ('caty65@icloud.com','Verdura non fresca.',3),('ezio12@gmail.com','Cibo freddo e non cotto a dovere.',1),('marcocostantitno@libero.it','Risotto mai arrivato.',5);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `a1`
--

/*!50001 DROP VIEW IF EXISTS `a1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `a1` AS select `c`.`cognome` AS `allergie` from ((`cliente` `c` join `patologia` `p` on((`c`.`email` = `p`.`cliente`))) join `allergia` `a` on((`p`.`allergia` = `a`.`codice`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `c12`
--

/*!50001 DROP VIEW IF EXISTS `c12`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `c12` AS select count(`o1`.`cliente`) AS `occorrenze`,`o1`.`cliente` AS `cliente` from (`ordine` `o1` join `ordine` `o2` on((`o1`.`cliente` = `o2`.`cliente`))) where (`o1`.`codice` <> `o2`.`codice`) group by `o1`.`cliente` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `o1`
--

/*!50001 DROP VIEW IF EXISTS `o1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `o1` AS select `c`.`cognome` AS `ordini` from ((`cliente` `c` join `ordine` `o` on((`c`.`email` = `o`.`cliente`))) join `dettagli_ordine` `do` on((`o`.`codice` = `do`.`ordine`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `occ`
--

/*!50001 DROP VIEW IF EXISTS `occ`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `occ` AS select count(`o`.`cliente`) AS `occorrenze`,`o`.`cliente` AS `cliente` from (((`dettagli_ordine` `d_o` join `dettagli_ordine` `d_or` on(((`d_o`.`ordine` <> `d_or`.`ordine`) and (`d_o`.`pietanza` = `d_or`.`pietanza`)))) join `ordine` `o` on((`d_o`.`ordine` = `o`.`codice`))) join `ordine` `o2` on(((`o`.`codice` <> `o2`.`codice`) and (`o`.`cliente` = `o2`.`cliente`)))) where (`d_o`.`quantita` >= 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pmax`
--

/*!50001 DROP VIEW IF EXISTS `pmax`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pmax` AS select `p`.`nome` AS `nome`,count(`d_o`.`pietanza`) AS `maxP` from (`dettagli_ordine` `d_o` join `pietanza` `p` on((`d_o`.`pietanza` = `p`.`codice`))) group by `p`.`nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `q1`
--

/*!50001 DROP VIEW IF EXISTS `q1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `q1` AS select `o`.`codice` AS `codice`,`o`.`cliente` AS `cliente` from (`ordine` `o` join `cliente` `c` on((`o`.`cliente` = `c`.`email`))) where (not(exists(select 1 from ((`ordine` `o` join `dettagli_ordine` `d_o` on((`o`.`codice` = `d_o`.`ordine`))) join `pietanza` `p` on((`d_o`.`pietanza` = `p`.`codice`))) where ((`p`.`cottura` <> 'VAPORE') and (`p`.`tipologia` <> 'VEGETARIANA'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `q2`
--

/*!50001 DROP VIEW IF EXISTS `q2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `q2` AS select `f`.`CF` AS `CF` from (`fattorino` `f` left join `ordine` `o` on((`f`.`CF` = `o`.`codice`))) where ((`f`.`punteggio` > 10) and (not(`f`.`CF` in (select `o`.`fattorino` from (`ordine` `o` join `ticket` `t` on((`o`.`codice` = `t`.`ordine`))))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `q3`
--

/*!50001 DROP VIEW IF EXISTS `q3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `q3` AS select `c`.`cognome` AS `cognome` from ((`cliente` `c` join `o1`) join `a1`) where ((`c`.`cognome` = `o1`.`ordini`) and (`c`.`cognome` = `a1`.`allergie`) and (`o1`.`ordini` = `a1`.`allergie`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `q4`
--

/*!50001 DROP VIEW IF EXISTS `q4`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `q4` AS select `occ`.`cliente` AS `cliente`,`occ`.`occorrenze` AS `numero_pietanza` from `occ` where (`occ`.`occorrenze` = (select max(`occ`.`occorrenze`) from `occ`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `q5`
--

/*!50001 DROP VIEW IF EXISTS `q5`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `q5` AS select `cliente`.`email` AS `email` from `cliente` where (not(`cliente`.`email` in (select `c`.`email` from ((`cliente` `c` join `ordine` `o` on((`c`.`email` = `o`.`cliente`))) join `dettagli_ordine` `d_o` on((`o`.`codice` = `d_o`.`ordine`))) where (`c`.`data_di_attivazione` is not null)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `q6`
--

/*!50001 DROP VIEW IF EXISTS `q6`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `q6` AS select `pmax`.`nome` AS `nome`,`pmax`.`maxP` AS `occorrenze` from `pmax` where (`pmax`.`maxP` = (select max(`pmax`.`maxP`) from `pmax`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `q7`
--

/*!50001 DROP VIEW IF EXISTS `q7`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `q7` AS select `c`.`nome` AS `nome`,count(`o`.`cliente`) AS `numero_ordini`,avg(`p`.`costo`) AS `AVG(p.costo)` from (((`cliente` `c` join `ordine` `o` on((`c`.`email` = `o`.`cliente`))) join `dettagli_ordine` `d_o` on((`o`.`codice` = `d_o`.`ordine`))) join `pietanza` `p` on((`p`.`codice` = `d_o`.`pietanza`))) group by `c`.`nome` having (count(`o`.`cliente`) >= 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-21 12:55:14
