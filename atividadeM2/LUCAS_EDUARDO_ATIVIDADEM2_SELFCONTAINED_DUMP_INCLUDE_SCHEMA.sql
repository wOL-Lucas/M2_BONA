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
-- Table structure for table `alugueis`
--

DROP TABLE IF EXISTS `alugueis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alugueis` (
  `AluguelID` int NOT NULL AUTO_INCREMENT,
  `ClienteID` int DEFAULT NULL,
  `FilmeID` int DEFAULT NULL,
  `DataAluguel` date DEFAULT NULL,
  `DataDevolucao` date DEFAULT NULL,
  PRIMARY KEY (`AluguelID`) USING BTREE,
  KEY `ClienteID` (`ClienteID`),
  KEY `FilmeID` (`FilmeID`),
  CONSTRAINT `alugueis_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `clientes` (`ClienteID`),
  CONSTRAINT `alugueis_ibfk_2` FOREIGN KEY (`FilmeID`) REFERENCES `filmes` (`FilmeiD`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alugueis`
--

LOCK TABLES `alugueis` WRITE;
/*!40000 ALTER TABLE `alugueis` DISABLE KEYS */;
INSERT INTO `alugueis` VALUES (1,1,1,'2023-10-01','2023-10-10'),(2,2,3,'2023-10-02','2023-10-09'),(3,3,2,'2023-10-03','2023-10-12');
/*!40000 ALTER TABLE `alugueis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `ClienteID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ClienteID`) USING BTREE,
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Maria Silva','maria@example.com','(123) 456-7890'),(2,'João Santos','joao@example.com','(456) 789-0123'),(3,'Ana Pereira','ana@example.com','(789) 012-3456');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filmes`
--

DROP TABLE IF EXISTS `filmes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filmes` (
  `FilmeiD` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AnoLancamento` int DEFAULT NULL,
  `Diretor` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GeneroID` int NOT NULL,
  PRIMARY KEY (`FilmeiD`) USING BTREE,
  KEY `fk_GeneroID` (`GeneroID`),
  CONSTRAINT `fk_GeneroID` FOREIGN KEY (`GeneroID`) REFERENCES `generos` (`GeneroID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filmes`
--

LOCK TABLES `filmes` WRITE;
/*!40000 ALTER TABLE `filmes` DISABLE KEYS */;
INSERT INTO `filmes` VALUES (1,'O Poderoso Chefão',1972,'Francis Ford Coppola',1),(2,'Star Wars: Uma Nova Esperança',1977,'George Lucas',2),(3,'Maximum Overdrive',1985,'Stephen King',3);
/*!40000 ALTER TABLE `filmes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `FuncionarioID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Cargo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataContratacao` date DEFAULT NULL,
  `Salario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`FuncionarioID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Ana Silva','Atendente','2022-03-15',2500.00),(2,'Carlos Santos','Gerente','2020-05-20',4000.00);
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generos`
--

DROP TABLE IF EXISTS `generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos` (
  `GeneroID` int NOT NULL AUTO_INCREMENT,
  `NomeGenero` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`GeneroID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` VALUES (1,'Crime'),(2,'Ficção Científica'),(3,'Terror');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `midia`
--

DROP TABLE IF EXISTS `midia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `midia` (
  `MidiaID` int NOT NULL AUTO_INCREMENT,
  `FilmeID` int DEFAULT NULL,
  `TipoMidia` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MidiaID`) USING BTREE,
  KEY `FilmeID` (`FilmeID`),
  CONSTRAINT `midia_ibfk_1` FOREIGN KEY (`FilmeID`) REFERENCES `filmes` (`FilmeiD`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `midia`
--

LOCK TABLES `midia` WRITE;
/*!40000 ALTER TABLE `midia` DISABLE KEYS */;
INSERT INTO `midia` VALUES (1,1,'DVD','Disponível'),(2,2,'Blu-ray','Disponível'),(3,3,'DVD','Alugado');
/*!40000 ALTER TABLE `midia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multas`
--

DROP TABLE IF EXISTS `multas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multas` (
  `id_multa` int NOT NULL AUTO_INCREMENT,
  `valor_multa` decimal(5,2) NOT NULL,
  `pagamento_multa` date NOT NULL,
  `emprestimo` int NOT NULL,
  PRIMARY KEY (`id_multa`) USING BTREE,
  KEY `fk_multas_alugueis` (`emprestimo`),
  CONSTRAINT `fk_multas_alugueis` FOREIGN KEY (`emprestimo`) REFERENCES `alugueis` (`AluguelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multas`
--

LOCK TABLES `multas` WRITE;
/*!40000 ALTER TABLE `multas` DISABLE KEYS */;
/*!40000 ALTER TABLE `multas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `ProdutoID` int NOT NULL AUTO_INCREMENT,
  `NomeProduto` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Categoria` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Preco` decimal(10,2) NOT NULL,
  `Estoque` int NOT NULL,
  `Descricao` text COLLATE utf8mb4_unicode_ci,
  `DataCadastro` date DEFAULT NULL,
  `Fornecedor` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ProdutoID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Chocolate Ao Leite','Chocolates',3.50,200,'Delicioso chocolate ao leite.',NULL,NULL),(2,'Batata Frita','Salgados',2.00,150,'Batatas fritas crocantes.',NULL,NULL),(3,'Refrigerante Coca-Cola','Bebidas',2.50,100,'Refrigerante de cola gelado.',NULL,NULL);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2023-10-31 17:17:15
