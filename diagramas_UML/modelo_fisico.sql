-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: db_solartech
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `codCliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(100) NOT NULL,
  PRIMARY KEY (`codCliente`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `cpf_2` (`cpf`),
  UNIQUE KEY `cpf_3` (`cpf`),
  UNIQUE KEY `cpf_4` (`cpf`),
  UNIQUE KEY `cpf_5` (`cpf`),
  UNIQUE KEY `cpf_6` (`cpf`),
  UNIQUE KEY `cpf_7` (`cpf`),
  UNIQUE KEY `cpf_8` (`cpf`),
  UNIQUE KEY `cpf_9` (`cpf`),
  UNIQUE KEY `cpf_10` (`cpf`),
  UNIQUE KEY `cpf_11` (`cpf`),
  UNIQUE KEY `cpf_12` (`cpf`),
  UNIQUE KEY `cpf_13` (`cpf`),
  UNIQUE KEY `cpf_14` (`cpf`),
  UNIQUE KEY `cpf_15` (`cpf`),
  UNIQUE KEY `cpf_16` (`cpf`),
  UNIQUE KEY `cpf_17` (`cpf`),
  UNIQUE KEY `cpf_18` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipamentos`
--

DROP TABLE IF EXISTS `equipamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipamentos` (
  `codEquipamento` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(100) NOT NULL,
  `fabricante` varchar(100) NOT NULL,
  `numeroSerie` varchar(100) NOT NULL,
  `idCliente` int NOT NULL,
  `idVistoria` int DEFAULT NULL,
  PRIMARY KEY (`codEquipamento`),
  UNIQUE KEY `fabricante` (`fabricante`),
  UNIQUE KEY `fabricante_2` (`fabricante`),
  UNIQUE KEY `fabricante_3` (`fabricante`),
  UNIQUE KEY `fabricante_4` (`fabricante`),
  UNIQUE KEY `fabricante_5` (`fabricante`),
  UNIQUE KEY `fabricante_6` (`fabricante`),
  UNIQUE KEY `fabricante_7` (`fabricante`),
  UNIQUE KEY `fabricante_8` (`fabricante`),
  UNIQUE KEY `fabricante_9` (`fabricante`),
  UNIQUE KEY `fabricante_10` (`fabricante`),
  UNIQUE KEY `fabricante_11` (`fabricante`),
  UNIQUE KEY `fabricante_12` (`fabricante`),
  UNIQUE KEY `fabricante_13` (`fabricante`),
  UNIQUE KEY `fabricante_14` (`fabricante`),
  UNIQUE KEY `fabricante_15` (`fabricante`),
  UNIQUE KEY `fabricante_16` (`fabricante`),
  UNIQUE KEY `fabricante_17` (`fabricante`),
  UNIQUE KEY `fabricante_18` (`fabricante`),
  KEY `idCliente` (`idCliente`),
  KEY `idVistoria` (`idVistoria`),
  CONSTRAINT `equipamentos_ibfk_33` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`codCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `equipamentos_ibfk_34` FOREIGN KEY (`idVistoria`) REFERENCES `vistorias` (`codVistoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipamentos`
--

LOCK TABLES `equipamentos` WRITE;
/*!40000 ALTER TABLE `equipamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `codFuncionario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  PRIMARY KEY (`codFuncionario`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `email_2` (`email`),
  UNIQUE KEY `email_3` (`email`),
  UNIQUE KEY `email_4` (`email`),
  UNIQUE KEY `email_5` (`email`),
  UNIQUE KEY `email_6` (`email`),
  UNIQUE KEY `email_7` (`email`),
  UNIQUE KEY `email_8` (`email`),
  UNIQUE KEY `email_9` (`email`),
  UNIQUE KEY `email_10` (`email`),
  UNIQUE KEY `email_11` (`email`),
  UNIQUE KEY `email_12` (`email`),
  UNIQUE KEY `email_13` (`email`),
  UNIQUE KEY `email_14` (`email`),
  UNIQUE KEY `email_15` (`email`),
  UNIQUE KEY `email_16` (`email`),
  UNIQUE KEY `email_17` (`email`),
  UNIQUE KEY `email_18` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Oliver','oliver@gmail.com','U2FsdGVkX18PBw6sPlS+ZJqztw4hrx0davyb1pIcst0='),(5,'Ana','ana@gmail.com','U2FsdGVkX1+bOWedKKDyJEI8xL0M4d2k0oN7xz1ZRVg=');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vistorias`
--

DROP TABLE IF EXISTS `vistorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vistorias` (
  `codVistoria` int NOT NULL AUTO_INCREMENT,
  `status` enum('PENDENTE','REALIZADA') NOT NULL,
  `data` datetime NOT NULL,
  `idEquipamento` int NOT NULL,
  PRIMARY KEY (`codVistoria`),
  UNIQUE KEY `data` (`data`),
  UNIQUE KEY `data_2` (`data`),
  UNIQUE KEY `data_3` (`data`),
  UNIQUE KEY `data_4` (`data`),
  UNIQUE KEY `data_5` (`data`),
  UNIQUE KEY `data_6` (`data`),
  UNIQUE KEY `data_7` (`data`),
  UNIQUE KEY `data_8` (`data`),
  UNIQUE KEY `data_9` (`data`),
  UNIQUE KEY `data_10` (`data`),
  UNIQUE KEY `data_11` (`data`),
  UNIQUE KEY `data_12` (`data`),
  UNIQUE KEY `data_13` (`data`),
  UNIQUE KEY `data_14` (`data`),
  UNIQUE KEY `data_15` (`data`),
  UNIQUE KEY `data_16` (`data`),
  UNIQUE KEY `data_17` (`data`),
  UNIQUE KEY `data_18` (`data`),
  KEY `idEquipamento` (`idEquipamento`),
  CONSTRAINT `vistorias_ibfk_1` FOREIGN KEY (`idEquipamento`) REFERENCES `equipamentos` (`codEquipamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vistorias`
--

LOCK TABLES `vistorias` WRITE;
/*!40000 ALTER TABLE `vistorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `vistorias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-12  9:58:45
