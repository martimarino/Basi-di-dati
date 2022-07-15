CREATE DATABASE  IF NOT EXISTS `progetto` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `progetto`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: progetto
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `sintomo`
--

DROP TABLE IF EXISTS `sintomo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sintomo` (
  `Patologia` char(50) NOT NULL,
  `Sintomo` char(50) NOT NULL,
  `Probabilità` char(50) NOT NULL,
  PRIMARY KEY (`Patologia`,`Sintomo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sintomo`
--

LOCK TABLES `sintomo` WRITE;
/*!40000 ALTER TABLE `sintomo` DISABLE KEYS */;
INSERT INTO `sintomo` VALUES ('Acari','Arricciamento delle foglie','50%'),('Acari','Caduta delle foglie','50%'),('Antracnosi','Crescita stentata','40%'),('Antracnosi','Marciume','60%'),('Batteriosi','Cambio di colore','80%'),('Batteriosi','Foglie bucherellate','20%'),('Cancro batterico','Crescita stentata','75%'),('Cancro batterico','Rigonfiamento delle foglie','25%'),('Cocciniglia','Interruzione della fioritura','35%'),('Cocciniglia','Presenza di insetti','65%'),('Fitoftora','Cambiamento di turgidita','10%'),('Fitoftora','Interruzione della fioritura','90%'),('Fumaggine','Foglie bucherellate','30%'),('Fumaggine','Rigonfiamento delle foglie','70%'),('Maculatura bruna','Cambio di colore','15%'),('Maculatura bruna','Interruzione della fioritura','85%'),('Mosaico','Arricciamento delle foglie','95%'),('Mosaico','Marciume','5%'),('Muffa grigia','Foglie bucherellate','55%'),('Muffa grigia','Presenza di insetti','45%');
/*!40000 ALTER TABLE `sintomo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'progetto'
--

--
-- Dumping routines for database 'progetto'
--
/*!50003 DROP PROCEDURE IF EXISTS `Errore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Errore`()
BEGIN
	declare exit handler for sqlexception
		begin
			rollback;
            select 'Si è verificato un errore!';
            end;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IndiceManutenzione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IndiceManutenzione`(in IndParteAerea double, in IndParteRadicale double, in pianta char(50), out result int)
BEGIN
	declare quante_patologie int default 0;
    
	SELECT 
    COUNT(*)
INTO quante_patologie FROM
    affezione A
WHERE
    A.NomePianta = pianta;
    
    set result = (IndParteAerea + IndParteRadicale + quante_patologie)/3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-01 21:20:48
