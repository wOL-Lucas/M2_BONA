CREATE DATABASE  IF NOT EXISTS `Lucas_Eduardo_atividadeM2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Lucas_Eduardo_atividadeM2`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: Lucas_Eduardo_atividadeM2
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `transacoes`
--

DROP TABLE IF EXISTS `transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacoes` (
  `TransacaoID` int NOT NULL AUTO_INCREMENT,
  `TipoTransacao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ClienteID` int DEFAULT NULL,
  `ProdutoID` int DEFAULT NULL,
  `AluguelID` int DEFAULT NULL,
  `Valor` decimal(10,2) NOT NULL,
  `DataTransacao` date DEFAULT NULL,
  `FuncionarioID` int NOT NULL,
  `MultaID` int DEFAULT NULL,
  PRIMARY KEY (`TransacaoID`) USING BTREE,
  KEY `ClienteID` (`ClienteID`),
  KEY `ProdutoID` (`ProdutoID`),
  KEY `AluguelID` (`AluguelID`),
  KEY `fk_transacoes_funcionarios` (`FuncionarioID`),
  KEY `fk_transacoes_multas` (`MultaID`),
  CONSTRAINT `fk_transacoes_funcionarios` FOREIGN KEY (`FuncionarioID`) REFERENCES `funcionarios` (`FuncionarioID`),
  CONSTRAINT `fk_transacoes_multas` FOREIGN KEY (`MultaID`) REFERENCES `multas` (`id_multa`),
  CONSTRAINT `transacoes_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `clientes` (`ClienteID`),
  CONSTRAINT `transacoes_ibfk_2` FOREIGN KEY (`ProdutoID`) REFERENCES `produtos` (`ProdutoID`),
  CONSTRAINT `transacoes_ibfk_3` FOREIGN KEY (`AluguelID`) REFERENCES `alugueis` (`AluguelID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacoes`
--

LOCK TABLES `transacoes` WRITE;
/*!40000 ALTER TABLE `transacoes` DISABLE KEYS */;
INSERT INTO `transacoes` VALUES (7,'Venda',1,2,NULL,50.00,'2022-01-01',1,NULL),(8,'Aluguel',2,1,1,10.00,'2022-01-02',2,NULL),(9,'Devolução',3,3,2,0.00,'2022-01-03',1,NULL);
/*!40000 ALTER TABLE `transacoes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-31 17:24:46
