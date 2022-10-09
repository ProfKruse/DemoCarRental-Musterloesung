CREATE DATABASE  IF NOT EXISTS `autovermietung` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `autovermietung`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: autovermietung
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `extras`
--

DROP TABLE IF EXISTS `extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras` (
  `ausstattungID` int NOT NULL,
  `ausstattungBez` varchar(45) NOT NULL,
  PRIMARY KEY (`ausstattungID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras`
--

LOCK TABLES `extras` WRITE;
/*!40000 ALTER TABLE `extras` DISABLE KEYS */;
/*!40000 ALTER TABLE `extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geschaeftskunden`
--

DROP TABLE IF EXISTS `geschaeftskunden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geschaeftskunden` (
  `nutzerID` int NOT NULL,
  `firma` varchar(45) NOT NULL,
  `kontaktName` varchar(45) NOT NULL,
  `kontaktVorname` varchar(45) NOT NULL,
  PRIMARY KEY (`nutzerID`),
  CONSTRAINT `geschaeftskundenNutzerID` FOREIGN KEY (`nutzerID`) REFERENCES `kunden` (`nutzerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geschaeftskunden`
--

LOCK TABLES `geschaeftskunden` WRITE;
/*!40000 ALTER TABLE `geschaeftskunden` DISABLE KEYS */;
/*!40000 ALTER TABLE `geschaeftskunden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kfzextras`
--

DROP TABLE IF EXISTS `kfzextras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kfzextras` (
  `kfzID` int NOT NULL,
  `ausstattungID` int NOT NULL,
  PRIMARY KEY (`kfzID`,`ausstattungID`),
  KEY `kfzExtrasAusstattungID_idx` (`ausstattungID`),
  CONSTRAINT `kfzExtrasAusstattungID` FOREIGN KEY (`ausstattungID`) REFERENCES `extras` (`ausstattungID`),
  CONSTRAINT `kfzExtrasKfzID` FOREIGN KEY (`kfzID`) REFERENCES `kfzs` (`kfzID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kfzextras`
--

LOCK TABLES `kfzextras` WRITE;
/*!40000 ALTER TABLE `kfzextras` DISABLE KEYS */;
/*!40000 ALTER TABLE `kfzextras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kfzmodelle`
--

DROP TABLE IF EXISTS `kfzmodelle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kfzmodelle` (
  `kfzModellID` int NOT NULL,
  `marke` varchar(45) NOT NULL,
  `modell` varchar(45) NOT NULL,
  PRIMARY KEY (`kfzModellID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kfzmodelle`
--

LOCK TABLES `kfzmodelle` WRITE;
/*!40000 ALTER TABLE `kfzmodelle` DISABLE KEYS */;
/*!40000 ALTER TABLE `kfzmodelle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kfzs`
--

DROP TABLE IF EXISTS `kfzs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kfzs` (
  `kfzID` int NOT NULL,
  `kfzModellID` int NOT NULL,
  `standardrate` double NOT NULL,
  `kfzTypID` int NOT NULL,
  `zustand` varchar(45) NOT NULL,
  `kilometerstand` int NOT NULL,
  `kennzeichen` varchar(45) NOT NULL,
  `kraftstoff` varchar(45) NOT NULL,
  `baujahr` int NOT NULL,
  `sitzplaetze` int NOT NULL,
  `anzahlTueren` int NOT NULL,
  `farbe` varchar(45) NOT NULL,
  `psLeistung` int NOT NULL,
  `tankgroesse` varchar(45) NOT NULL,
  `akkuleistung` varchar(45) NOT NULL,
  `getriebe` varchar(45) NOT NULL,
  `erstzulassung` date NOT NULL,
  `hubraumGroesse` double NOT NULL,
  PRIMARY KEY (`kfzID`),
  UNIQUE KEY `kennzeichen_UNIQUE` (`kennzeichen`),
  KEY `kfzsModellID_idx` (`kfzModellID`),
  KEY `kfzsTypID_idx` (`kfzTypID`),
  CONSTRAINT `kfzsModellID` FOREIGN KEY (`kfzModellID`) REFERENCES `kfzmodelle` (`kfzModellID`),
  CONSTRAINT `kfzsTypID` FOREIGN KEY (`kfzTypID`) REFERENCES `kfztypen` (`kfzTypID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kfzs`
--

LOCK TABLES `kfzs` WRITE;
/*!40000 ALTER TABLE `kfzs` DISABLE KEYS */;
/*!40000 ALTER TABLE `kfzs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kfztypen`
--

DROP TABLE IF EXISTS `kfztypen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kfztypen` (
  `kfzTypID` int NOT NULL,
  `typBezeichnung` varchar(45) NOT NULL,
  PRIMARY KEY (`kfzTypID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kfztypen`
--

LOCK TABLES `kfztypen` WRITE;
/*!40000 ALTER TABLE `kfztypen` DISABLE KEYS */;
/*!40000 ALTER TABLE `kfztypen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kunden`
--

DROP TABLE IF EXISTS `kunden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kunden` (
  `nutzerID` int NOT NULL,
  `kundeID` int NOT NULL,
  `strasse` varchar(45) NOT NULL,
  `hausNr` int NOT NULL,
  `plz` int NOT NULL,
  `land` varchar(45) NOT NULL,
  `iban` varchar(45) NOT NULL,
  `bic` varchar(45) NOT NULL,
  `telefonNr` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `kontostand` double NOT NULL,
  `geburtsort` varchar(45) NOT NULL,
  `fuehrerscheinklasse` varchar(45) NOT NULL,
  PRIMARY KEY (`nutzerID`),
  UNIQUE KEY `kundeID_UNIQUE` (`kundeID`),
  CONSTRAINT `kundenNutzerID` FOREIGN KEY (`nutzerID`) REFERENCES `nutzer` (`nutzerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kunden`
--

LOCK TABLES `kunden` WRITE;
/*!40000 ALTER TABLE `kunden` DISABLE KEYS */;
/*!40000 ALTER TABLE `kunden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mietstationen`
--

DROP TABLE IF EXISTS `mietstationen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mietstationen` (
  `mietstationID` int NOT NULL,
  `strasse` varchar(45) NOT NULL,
  `plz` int NOT NULL,
  `telefondurchwahl` varchar(45) NOT NULL,
  `mietstationTyp` varchar(45) NOT NULL,
  `stellplaetze` int NOT NULL,
  `lage` varchar(45) NOT NULL,
  `groesse` int NOT NULL,
  `oeffnungszeit` time NOT NULL,
  `schließzeit` time NOT NULL,
  PRIMARY KEY (`mietstationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mietstationen`
--

LOCK TABLES `mietstationen` WRITE;
/*!40000 ALTER TABLE `mietstationen` DISABLE KEYS */;
/*!40000 ALTER TABLE `mietstationen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mietstationenkfzs`
--

DROP TABLE IF EXISTS `mietstationenkfzs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mietstationenkfzs` (
  `mietstationID` int NOT NULL,
  `kfzID` int NOT NULL,
  PRIMARY KEY (`mietstationID`,`kfzID`),
  KEY `mietstationenkfzsKfzID_idx` (`kfzID`),
  CONSTRAINT `mietstationenkfzsKfzID` FOREIGN KEY (`kfzID`) REFERENCES `kfzs` (`kfzID`),
  CONSTRAINT `mietstationenkfzsMietstationID` FOREIGN KEY (`mietstationID`) REFERENCES `mietstationen` (`mietstationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mietstationenkfzs`
--

LOCK TABLES `mietstationenkfzs` WRITE;
/*!40000 ALTER TABLE `mietstationenkfzs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mietstationenkfzs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mietvertraege`
--

DROP TABLE IF EXISTS `mietvertraege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mietvertraege` (
  `mietvertragID` int NOT NULL,
  `datum` date NOT NULL,
  `kundeID` int NOT NULL,
  `kfzID` int NOT NULL,
  `mietdauerTage` int NOT NULL,
  `mietgebuehr` double NOT NULL,
  `zahlart` varchar(45) NOT NULL,
  `tarif` int NOT NULL,
  `abholstation` int NOT NULL,
  `rueckgabestation` int NOT NULL,
  `versicherungspaket` varchar(45) NOT NULL,
  `prioritaetsservice` tinyint NOT NULL,
  PRIMARY KEY (`mietvertragID`),
  KEY `mietvertraegeKfzID_idx` (`kfzID`),
  KEY `mietvertraegeTarifID_idx` (`tarif`),
  KEY `mietvertraegeAbholstationID_idx` (`abholstation`),
  KEY `mietvertraegeRueckgabestationID_idx` (`rueckgabestation`),
  KEY `mietvertraegeKundeID_idx` (`kundeID`),
  CONSTRAINT `mietvertraegeAbholstationID` FOREIGN KEY (`abholstation`) REFERENCES `mietstationen` (`mietstationID`),
  CONSTRAINT `mietvertraegeKfzID` FOREIGN KEY (`kfzID`) REFERENCES `kfzs` (`kfzID`),
  CONSTRAINT `mietvertraegeKundeID` FOREIGN KEY (`kundeID`) REFERENCES `kunden` (`kundeID`),
  CONSTRAINT `mietvertraegeRueckgabestationID` FOREIGN KEY (`rueckgabestation`) REFERENCES `mietstationen` (`mietstationID`),
  CONSTRAINT `mietvertraegeTarifID` FOREIGN KEY (`tarif`) REFERENCES `tarife` (`tarifID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mietvertraege`
--

LOCK TABLES `mietvertraege` WRITE;
/*!40000 ALTER TABLE `mietvertraege` DISABLE KEYS */;
/*!40000 ALTER TABLE `mietvertraege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mitarbeiter`
--

DROP TABLE IF EXISTS `mitarbeiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mitarbeiter` (
  `nutzerID` int NOT NULL,
  `mitarbeiterID` int NOT NULL,
  `vorname` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `geburtsdatum` date NOT NULL,
  `position` varchar(45) NOT NULL,
  `abteilung` varchar(45) NOT NULL,
  `rolleID` int NOT NULL,
  PRIMARY KEY (`nutzerID`),
  UNIQUE KEY `mitarbeiterID_UNIQUE` (`mitarbeiterID`),
  KEY `rolleID_idx` (`rolleID`),
  CONSTRAINT `mitarbeiterNutzerID` FOREIGN KEY (`nutzerID`) REFERENCES `nutzer` (`nutzerID`),
  CONSTRAINT `mitarbeiterRolleID` FOREIGN KEY (`rolleID`) REFERENCES `rollen` (`rolleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mitarbeiter`
--

LOCK TABLES `mitarbeiter` WRITE;
/*!40000 ALTER TABLE `mitarbeiter` DISABLE KEYS */;
/*!40000 ALTER TABLE `mitarbeiter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutzer`
--

DROP TABLE IF EXISTS `nutzer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutzer` (
  `nutzerID` int NOT NULL,
  `loginname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `passwort` varchar(45) NOT NULL,
  `berechnungsID` int NOT NULL,
  `2FaktorMethode` varchar(45) NOT NULL,
  `letzteAktivitaet` date NOT NULL,
  `fehlerZaehler` int NOT NULL,
  PRIMARY KEY (`nutzerID`),
  UNIQUE KEY `loginname_UNIQUE` (`loginname`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutzer`
--

LOCK TABLES `nutzer` WRITE;
/*!40000 ALTER TABLE `nutzer` DISABLE KEYS */;
/*!40000 ALTER TABLE `nutzer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privatkunden`
--

DROP TABLE IF EXISTS `privatkunden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privatkunden` (
  `nutzerID` int NOT NULL,
  `personalAusweis` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `vorname` varchar(45) NOT NULL,
  `geburtsdatum` date NOT NULL,
  `fuehrerscheinNr` varchar(45) NOT NULL,
  PRIMARY KEY (`nutzerID`),
  UNIQUE KEY `personalAusweis_UNIQUE` (`personalAusweis`),
  UNIQUE KEY `fuehrerscheinNr_UNIQUE` (`fuehrerscheinNr`),
  CONSTRAINT `privatkundenNutzerID` FOREIGN KEY (`nutzerID`) REFERENCES `kunden` (`nutzerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privatkunden`
--

LOCK TABLES `privatkunden` WRITE;
/*!40000 ALTER TABLE `privatkunden` DISABLE KEYS */;
/*!40000 ALTER TABLE `privatkunden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rechnungen`
--

DROP TABLE IF EXISTS `rechnungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rechnungen` (
  `rechnungNr` int NOT NULL,
  `mietvertragID` int NOT NULL,
  `kundeID` int NOT NULL,
  `datum` date NOT NULL,
  `betrag` double NOT NULL,
  PRIMARY KEY (`rechnungNr`),
  UNIQUE KEY `mietvertragID_UNIQUE` (`mietvertragID`),
  KEY `rechnungenMietvertragID_idx` (`mietvertragID`),
  KEY `rechnungenKundeID_idx` (`kundeID`),
  CONSTRAINT `rechnungenKundeID` FOREIGN KEY (`kundeID`) REFERENCES `kunden` (`kundeID`),
  CONSTRAINT `rechnungenMietvertragID` FOREIGN KEY (`mietvertragID`) REFERENCES `mietvertraege` (`mietvertragID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rechnungen`
--

LOCK TABLES `rechnungen` WRITE;
/*!40000 ALTER TABLE `rechnungen` DISABLE KEYS */;
/*!40000 ALTER TABLE `rechnungen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservierungen`
--

DROP TABLE IF EXISTS `reservierungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservierungen` (
  `reservierungID` int NOT NULL,
  `kundeID` int NOT NULL,
  `kfzTypID` int NOT NULL,
  `mietstationID` int NOT NULL,
  `datum` date NOT NULL,
  PRIMARY KEY (`reservierungID`),
  KEY `reservierungenKfzTypID_idx` (`kfzTypID`),
  KEY `reservierungenMietstationID_idx` (`mietstationID`),
  KEY `reservierungenKundeID_idx` (`kundeID`),
  CONSTRAINT `reservierungenKfzTypID` FOREIGN KEY (`kfzTypID`) REFERENCES `kfztypen` (`kfzTypID`),
  CONSTRAINT `reservierungenKundeID` FOREIGN KEY (`kundeID`) REFERENCES `kunden` (`kundeID`),
  CONSTRAINT `reservierungenMietstationID` FOREIGN KEY (`mietstationID`) REFERENCES `mietstationen` (`mietstationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservierungen`
--

LOCK TABLES `reservierungen` WRITE;
/*!40000 ALTER TABLE `reservierungen` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservierungen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rollen`
--

DROP TABLE IF EXISTS `rollen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rollen` (
  `rolleID` int NOT NULL,
  `rolleBez` varchar(45) NOT NULL,
  PRIMARY KEY (`rolleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rollen`
--

LOCK TABLES `rollen` WRITE;
/*!40000 ALTER TABLE `rollen` DISABLE KEYS */;
/*!40000 ALTER TABLE `rollen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruecknahmeprotokolle`
--

DROP TABLE IF EXISTS `ruecknahmeprotokolle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ruecknahmeprotokolle` (
  `ruecknahmeProtNr` int NOT NULL,
  `mietvertragID` int NOT NULL,
  `datum` date NOT NULL,
  `ersteller` int NOT NULL,
  PRIMARY KEY (`ruecknahmeProtNr`),
  UNIQUE KEY `mietvertragID_UNIQUE` (`mietvertragID`),
  KEY `ruecknahmeprotokolleMietvertragID_idx` (`mietvertragID`),
  KEY `ruecknahmeprotokolleErstellerID_idx` (`ersteller`),
  CONSTRAINT `ruecknahmeprotokolleErstellerID` FOREIGN KEY (`ersteller`) REFERENCES `mitarbeiter` (`mitarbeiterID`),
  CONSTRAINT `ruecknahmeprotokolleMietvertragID` FOREIGN KEY (`mietvertragID`) REFERENCES `mietvertraege` (`mietvertragID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruecknahmeprotokolle`
--

LOCK TABLES `ruecknahmeprotokolle` WRITE;
/*!40000 ALTER TABLE `ruecknahmeprotokolle` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruecknahmeprotokolle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarife`
--

DROP TABLE IF EXISTS `tarife`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarife` (
  `tarifID` int NOT NULL,
  `tarifBez` varchar(45) NOT NULL,
  `tarifPreis` double NOT NULL,
  PRIMARY KEY (`tarifID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarife`
--

LOCK TABLES `tarife` WRITE;
/*!40000 ALTER TABLE `tarife` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarife` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verkaufsstandorte`
--

DROP TABLE IF EXISTS `verkaufsstandorte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verkaufsstandorte` (
  `standortID` int NOT NULL,
  `strasse` varchar(45) NOT NULL,
  `plz` int NOT NULL,
  `telefondurchwahl` varchar(45) NOT NULL,
  `lage` varchar(45) NOT NULL,
  `probefahrten` tinyint NOT NULL,
  `oeffnungszeit` time NOT NULL,
  `schließzeit` time NOT NULL,
  PRIMARY KEY (`standortID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verkaufsstandorte`
--

LOCK TABLES `verkaufsstandorte` WRITE;
/*!40000 ALTER TABLE `verkaufsstandorte` DISABLE KEYS */;
/*!40000 ALTER TABLE `verkaufsstandorte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verkaufsstandortkfzs`
--

DROP TABLE IF EXISTS `verkaufsstandortkfzs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verkaufsstandortkfzs` (
  `standortID` int NOT NULL,
  `kfzID` int NOT NULL,
  PRIMARY KEY (`standortID`,`kfzID`),
  KEY `verkaufsstandortKfzsKfzID_idx` (`kfzID`),
  CONSTRAINT `verkaufsstandortKfzsKfzID` FOREIGN KEY (`kfzID`) REFERENCES `kfzs` (`kfzID`),
  CONSTRAINT `verkaufsstandortKfzsStandortID` FOREIGN KEY (`standortID`) REFERENCES `verkaufsstandorte` (`standortID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verkaufsstandortkfzs`
--

LOCK TABLES `verkaufsstandortkfzs` WRITE;
/*!40000 ALTER TABLE `verkaufsstandortkfzs` DISABLE KEYS */;
/*!40000 ALTER TABLE `verkaufsstandortkfzs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-09 14:22:14
