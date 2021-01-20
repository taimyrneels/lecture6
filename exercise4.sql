-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: exercise4
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Appointment`
--

DROP TABLE IF EXISTS `Appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Appointment` (
  `idAppointment` int(11) NOT NULL,
  `DATE` date DEFAULT NULL,
  `TIME` varchar(45) DEFAULT NULL,
  `Patient_idPatient` int(11) NOT NULL,
  `Doctor_idDoctor` int(11) NOT NULL,
  PRIMARY KEY (`idAppointment`),
  UNIQUE KEY `idAppointment_UNIQUE` (`idAppointment`),
  KEY `fk_Appointment_Patient1_idx` (`Patient_idPatient`),
  KEY `fk_Appointment_Doctor1_idx` (`Doctor_idDoctor`),
  CONSTRAINT `fk_Appointment_Doctor1` FOREIGN KEY (`Doctor_idDoctor`) REFERENCES `Doctor` (`idDoctor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Appointment_Patient1` FOREIGN KEY (`Patient_idPatient`) REFERENCES `Patient` (`idPatient`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Appointment`
--

LOCK TABLES `Appointment` WRITE;
/*!40000 ALTER TABLE `Appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bill`
--

DROP TABLE IF EXISTS `Bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bill` (
  `idBill` int(11) NOT NULL,
  `Total` int(11) DEFAULT NULL,
  PRIMARY KEY (`idBill`),
  UNIQUE KEY `idBill_UNIQUE` (`idBill`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bill`
--

LOCK TABLES `Bill` WRITE;
/*!40000 ALTER TABLE `Bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bill_has_Payment`
--

DROP TABLE IF EXISTS `Bill_has_Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bill_has_Payment` (
  `Bill_idBill` int(11) NOT NULL,
  `Payment_idPayment` int(11) NOT NULL,
  PRIMARY KEY (`Bill_idBill`,`Payment_idPayment`),
  KEY `fk_Bill_has_Payment_Payment1_idx` (`Payment_idPayment`),
  KEY `fk_Bill_has_Payment_Bill1_idx` (`Bill_idBill`),
  CONSTRAINT `fk_Bill_has_Payment_Bill1` FOREIGN KEY (`Bill_idBill`) REFERENCES `Bill` (`idBill`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bill_has_Payment_Payment1` FOREIGN KEY (`Payment_idPayment`) REFERENCES `Payment` (`idPayment`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bill_has_Payment`
--

LOCK TABLES `Bill_has_Payment` WRITE;
/*!40000 ALTER TABLE `Bill_has_Payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bill_has_Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doctor` (
  `idDoctor` int(11) NOT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  `BIRTH` datetime DEFAULT NULL,
  `ADDRESS` varchar(45) DEFAULT NULL,
  `PHONENUMBER` int(11) DEFAULT NULL,
  `SALARY` int(11) DEFAULT NULL,
  `Medical_idMedical` int(11) NOT NULL,
  `Specialist_idSpecialist` int(11) NOT NULL,
  PRIMARY KEY (`idDoctor`),
  UNIQUE KEY `idDoctor_UNIQUE` (`idDoctor`),
  UNIQUE KEY `NAME_UNIQUE` (`NAME`),
  UNIQUE KEY `ADDRESS_UNIQUE` (`ADDRESS`),
  UNIQUE KEY `Doctorcol_UNIQUE` (`SALARY`),
  UNIQUE KEY `PHONENUMBER_UNIQUE` (`PHONENUMBER`),
  KEY `fk_Doctor_Medical_idx` (`Medical_idMedical`),
  KEY `fk_Doctor_Specialist1_idx` (`Specialist_idSpecialist`),
  CONSTRAINT `fk_Doctor_Medical` FOREIGN KEY (`Medical_idMedical`) REFERENCES `Medical` (`idMedical`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doctor_Specialist1` FOREIGN KEY (`Specialist_idSpecialist`) REFERENCES `Specialist` (`idSpecialist`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor`
--

LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medical`
--

DROP TABLE IF EXISTS `Medical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Medical` (
  `idMedical` int(11) NOT NULL,
  `Overtime_rate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMedical`),
  UNIQUE KEY `idMedical_UNIQUE` (`idMedical`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medical`
--

LOCK TABLES `Medical` WRITE;
/*!40000 ALTER TABLE `Medical` DISABLE KEYS */;
/*!40000 ALTER TABLE `Medical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patient` (
  `idPatient` int(11) NOT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  `ADDRESS` varchar(45) DEFAULT NULL,
  `PHONENUMBER` int(11) DEFAULT NULL,
  `BIRTH` datetime DEFAULT NULL,
  PRIMARY KEY (`idPatient`),
  UNIQUE KEY `idPatient_UNIQUE` (`idPatient`),
  UNIQUE KEY `PHONENUMBER_UNIQUE` (`PHONENUMBER`),
  UNIQUE KEY `BIRTH_UNIQUE` (`BIRTH`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payment` (
  `idPayment` int(11) NOT NULL,
  `Details` varchar(45) DEFAULT NULL,
  `Method` varchar(45) DEFAULT NULL,
  `Patient_idPatient` int(11) NOT NULL,
  PRIMARY KEY (`idPayment`),
  UNIQUE KEY `idPayment_UNIQUE` (`idPayment`),
  KEY `fk_Payment_Patient1_idx` (`Patient_idPatient`),
  CONSTRAINT `fk_Payment_Patient1` FOREIGN KEY (`Patient_idPatient`) REFERENCES `Patient` (`idPatient`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Specialist`
--

DROP TABLE IF EXISTS `Specialist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Specialist` (
  `idSpecialist` int(11) NOT NULL,
  `SpecialisatieField` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSpecialist`),
  UNIQUE KEY `idSpecialist_UNIQUE` (`idSpecialist`),
  UNIQUE KEY `SpecialisatieField_UNIQUE` (`SpecialisatieField`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Specialist`
--

LOCK TABLES `Specialist` WRITE;
/*!40000 ALTER TABLE `Specialist` DISABLE KEYS */;
/*!40000 ALTER TABLE `Specialist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-20 14:30:24
