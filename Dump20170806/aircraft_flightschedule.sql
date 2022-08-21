-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: aircraft
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `flightschedule`
--

DROP TABLE IF EXISTS `flightschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flightschedule` (
  `flightsdleid` int(11) NOT NULL AUTO_INCREMENT,
  `Aircraft_ID` int(11) DEFAULT NULL,
  `OriginAirport` varchar(45) DEFAULT NULL,
  `DestAirport` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `EconomyCost` int(11) DEFAULT NULL,
  `BusinessCost` int(11) DEFAULT NULL,
  `FirstCost` int(11) DEFAULT NULL,
  `DepartDate` date DEFAULT NULL,
  `DepartTime` varchar(45) DEFAULT NULL,
  `ArrivalDate` date DEFAULT NULL,
  `ArrivalTime` varchar(45) DEFAULT NULL,
  `FlightTime` varchar(45) DEFAULT NULL,
  `ecoBooked` int(11) DEFAULT NULL,
  `busBooked` int(11) DEFAULT NULL,
  `firstBooked` int(11) DEFAULT NULL,
  PRIMARY KEY (`flightsdleid`),
  KEY `aircraftid_idx` (`Aircraft_ID`),
  CONSTRAINT `Aircraft_ID` FOREIGN KEY (`Aircraft_ID`) REFERENCES `aircraft` (`Aircraft_ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightschedule`
--

LOCK TABLES `flightschedule` WRITE;
/*!40000 ALTER TABLE `flightschedule` DISABLE KEYS */;
INSERT INTO `flightschedule` VALUES (1,1,'Manchester','Incheon','Korea',472,585,730,'2017-08-18','1111','2017-08-19','2111','10 Hours',50,50,50),(2,2,'Incheon','Changi','Singapore',234,353,456,'2017-08-19','2330','2017-08-20','0530','6 Hours',50,50,50),(3,5,'Manchester','Changi','Singapore',534,655,789,'2017-08-18','1030','2017-08-19','0130','15 Hours',50,50,59),(4,3,'Changi','Heathrow','England',567,897,1239,'2017-08-20','1930','2017-08-21','0830','13 Hours',50,50,50),(5,4,'Changi','Munich','Germany',786,980,1534,'2017-08-21','1500','2017-08-22','0400','13 Hours',50,50,50),(6,5,'Munich','Changi','Singapore',534,703,1342,'2017-08-24','1200','2017-08-25','0100','13 Hours',50,50,50),(7,6,'Moscow','Beijing','China',341,451,561,'2017-08-26','0930','2017-08-26','1330','4 Hours',50,50,50),(8,6,'Beijing','Changi','Singapore',354,452,523,'2017-08-26','1530','2017-08-26','2130','6 Hours',50,50,50);
/*!40000 ALTER TABLE `flightschedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-06 23:33:19
