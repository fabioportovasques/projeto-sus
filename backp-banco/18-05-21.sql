-- MySQL dump 10.13  Distrib 8.0.24, for Linux (x86_64)
--
-- Host: localhost    Database: bd-sus
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `agenda_ubs`
--

DROP TABLE IF EXISTS `agenda_ubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agenda_ubs` (
  `cod_agenda` int NOT NULL AUTO_INCREMENT,
  `data_agendamento` datetime NOT NULL,
  `hora_agendamento` varchar(45) NOT NULL,
  `num_fichas` int NOT NULL,
  `status_agenda` char(1) NOT NULL,
  `especialidade_cod_especialidade` int NOT NULL,
  `ubs_cod_ubs` int NOT NULL,
  PRIMARY KEY (`cod_agenda`,`especialidade_cod_especialidade`,`ubs_cod_ubs`),
  UNIQUE KEY `num-fichas_UNIQUE` (`num_fichas`),
  KEY `fk_agenda_especialidade1_idx` (`especialidade_cod_especialidade`),
  KEY `fk_agenda_ubs1_idx` (`ubs_cod_ubs`),
  CONSTRAINT `fk_agenda_especialidade1` FOREIGN KEY (`especialidade_cod_especialidade`) REFERENCES `especialidade` (`cod_especialidade`),
  CONSTRAINT `fk_agenda_ubs1` FOREIGN KEY (`ubs_cod_ubs`) REFERENCES `ubs` (`cod_ubs`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda_ubs`
--

LOCK TABLES `agenda_ubs` WRITE;
/*!40000 ALTER TABLE `agenda_ubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda_ubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agenda_ue`
--

DROP TABLE IF EXISTS `agenda_ue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agenda_ue` (
  `cod_agenda` int NOT NULL AUTO_INCREMENT,
  `data_agendamento` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `hora_agendamento` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `num_fichas` int DEFAULT NULL,
  `status_agenda` char(2) COLLATE latin1_general_ci DEFAULT NULL,
  `unidade_executante_cod_ue` int NOT NULL,
  `unidade_executante_central_reguladora_cod_cr` int NOT NULL,
  PRIMARY KEY (`cod_agenda`,`unidade_executante_cod_ue`,`unidade_executante_central_reguladora_cod_cr`),
  KEY `fk_agenda-ue_unidade-executante1_idx` (`unidade_executante_cod_ue`,`unidade_executante_central_reguladora_cod_cr`),
  CONSTRAINT `fk_agenda-ue_unidade-executante1` FOREIGN KEY (`unidade_executante_cod_ue`, `unidade_executante_central_reguladora_cod_cr`) REFERENCES `unidade_executante` (`cod_ue`, `central_reguladora_cod_cr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda_ue`
--

LOCK TABLES `agenda_ue` WRITE;
/*!40000 ALTER TABLE `agenda_ue` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda_ue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `central_reguladora`
--

DROP TABLE IF EXISTS `central_reguladora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `central_reguladora` (
  `cod_cr` int NOT NULL AUTO_INCREMENT,
  `nome_cr` varchar(100) DEFAULT NULL,
  `rua_cr` varchar(45) DEFAULT NULL,
  `numero_rua_cr` varchar(45) DEFAULT NULL,
  `bairro_cr` varchar(45) DEFAULT NULL,
  `cidade_cr` varchar(45) DEFAULT NULL,
  `email_cr` varchar(45) DEFAULT NULL,
  `uf_cr` char(2) DEFAULT NULL,
  PRIMARY KEY (`cod_cr`),
  UNIQUE KEY `nome-ubs_UNIQUE` (`nome_cr`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `central_reguladora`
--

LOCK TABLES `central_reguladora` WRITE;
/*!40000 ALTER TABLE `central_reguladora` DISABLE KEYS */;
INSERT INTO `central_reguladora` VALUES (1,'teste','sete de setembro','795','centro','Porto Alegre','teste@gmail.com','rs');
/*!40000 ALTER TABLE `central_reguladora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidade` (
  `cod_especialidade` int NOT NULL AUTO_INCREMENT,
  `nome_especialidade` varchar(60) COLLATE latin1_german2_ci NOT NULL,
  `descricao_especialidade` varchar(100) COLLATE latin1_german2_ci DEFAULT NULL,
  PRIMARY KEY (`cod_especialidade`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidade`
--

LOCK TABLES `especialidade` WRITE;
/*!40000 ALTER TABLE `especialidade` DISABLE KEYS */;
INSERT INTO `especialidade` VALUES (1,'neurologista','especialista que trata doenças no cérebro e medula espinhal'),(2,'Anestesiologia','é a especialidade médica que estuda e proporciona ausência ou alívio da dor'),(3,'Dermatologia','trata doenças da pele');
/*!40000 ALTER TABLE `especialidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidade_compoe_medico`
--

DROP TABLE IF EXISTS `especialidade_compoe_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidade_compoe_medico` (
  `especialidade_cod_especialidade` int NOT NULL,
  `medico_cod_medico` int NOT NULL,
  PRIMARY KEY (`especialidade_cod_especialidade`,`medico_cod_medico`),
  KEY `fk_especialidade_has_medico_medico1_idx` (`medico_cod_medico`),
  KEY `fk_especialidade_has_medico_especialidade1_idx` (`especialidade_cod_especialidade`),
  CONSTRAINT `fk_especialidade_has_medico_especialidade1` FOREIGN KEY (`especialidade_cod_especialidade`) REFERENCES `especialidade` (`cod_especialidade`),
  CONSTRAINT `fk_especialidade_has_medico_medico1` FOREIGN KEY (`medico_cod_medico`) REFERENCES `medico` (`cod_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidade_compoe_medico`
--

LOCK TABLES `especialidade_compoe_medico` WRITE;
/*!40000 ALTER TABLE `especialidade_compoe_medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `especialidade_compoe_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `cod_medico` int NOT NULL AUTO_INCREMENT,
  `nome_medico` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `sobrenome_medico` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `data_nascimento_medico` datetime DEFAULT NULL,
  `cpf_medico` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  `rg_medico` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `crm_medico` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `rua_medico` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `numero_casa_medico` int DEFAULT NULL,
  `bairro_medico` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `cidade_medico` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `uf_medico` char(2) COLLATE latin1_general_ci DEFAULT NULL,
  `pais_medico` varchar(60) COLLATE latin1_general_ci DEFAULT NULL,
  `email_medico` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`cod_medico`),
  UNIQUE KEY `cpf-medico_UNIQUE` (`cpf_medico`),
  UNIQUE KEY `crm-medico_UNIQUE` (`crm_medico`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (1,'Fernando ','Vasconcellos','1987-11-17 00:00:00','5345345345345','54353453','356ylop','marechal Deodoro',323,'centro','bagé','rs','Brasil','fernandovasconcellos@gmail.com'),(2,'Ana Paula','Conceição','2002-05-02 00:00:00','4534543','53453453','545yjj','General Osório',469,'centro','Pelotas','rs','Brasil','anapaula@gmail.com');
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico_atende_ubs`
--

DROP TABLE IF EXISTS `medico_atende_ubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico_atende_ubs` (
  `medico_cod_medico` int NOT NULL,
  `ubs_cod_ubs` int NOT NULL,
  PRIMARY KEY (`medico_cod_medico`,`ubs_cod_ubs`),
  KEY `fk_medico_has_ubs_ubs1_idx` (`ubs_cod_ubs`),
  KEY `fk_medico_has_ubs_medico1_idx` (`medico_cod_medico`),
  CONSTRAINT `fk_medico_has_ubs_medico1` FOREIGN KEY (`medico_cod_medico`) REFERENCES `medico` (`cod_medico`),
  CONSTRAINT `fk_medico_has_ubs_ubs1` FOREIGN KEY (`ubs_cod_ubs`) REFERENCES `ubs` (`cod_ubs`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico_atende_ubs`
--

LOCK TABLES `medico_atende_ubs` WRITE;
/*!40000 ALTER TABLE `medico_atende_ubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `medico_atende_ubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `cod_pac` int NOT NULL AUTO_INCREMENT,
  `nome_pac` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `sobrenome_pac` varchar(60) COLLATE latin1_general_ci DEFAULT NULL,
  `data-nascimento_pac` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `cpf_pac` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `rg_pac` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `rua_pac` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `bairro_pac` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `cidade_pac` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `cep_pac` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `uf_pac` char(2) COLLATE latin1_general_ci DEFAULT NULL,
  `pais_pac` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `email_pac` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `telefone1_pac` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `telefone2_pac` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `ubs_cod_ubs` int NOT NULL,
  PRIMARY KEY (`cod_pac`,`ubs_cod_ubs`),
  UNIQUE KEY `rg-pac_UNIQUE` (`rg_pac`),
  UNIQUE KEY `cpf-pac_UNIQUE` (`cpf_pac`),
  KEY `fk_paciente_ubs1_idx` (`ubs_cod_ubs`),
  CONSTRAINT `fk_paciente_ubs1` FOREIGN KEY (`ubs_cod_ubs`) REFERENCES `ubs` (`cod_ubs`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente_encaminha_unidade_executante`
--

DROP TABLE IF EXISTS `paciente_encaminha_unidade_executante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente_encaminha_unidade_executante` (
  `paciente_cod_pac` int NOT NULL,
  `unidade_executante_cod_ue` int NOT NULL,
  `descricao_exame` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`paciente_cod_pac`,`unidade_executante_cod_ue`),
  UNIQUE KEY `descricao_exame_UNIQUE` (`descricao_exame`),
  KEY `fk_paciente_has_unidade-executante_unidade-executante1_idx` (`unidade_executante_cod_ue`),
  KEY `fk_paciente_has_unidade-executante_paciente1_idx` (`paciente_cod_pac`),
  CONSTRAINT `fk_paciente_has_unidade-executante_paciente1` FOREIGN KEY (`paciente_cod_pac`) REFERENCES `paciente` (`cod_pac`),
  CONSTRAINT `fk_paciente_has_unidade-executante_unidade-executante1` FOREIGN KEY (`unidade_executante_cod_ue`) REFERENCES `unidade_executante` (`cod_ue`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_encaminha_unidade_executante`
--

LOCK TABLES `paciente_encaminha_unidade_executante` WRITE;
/*!40000 ALTER TABLE `paciente_encaminha_unidade_executante` DISABLE KEYS */;
/*!40000 ALTER TABLE `paciente_encaminha_unidade_executante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubs`
--

DROP TABLE IF EXISTS `ubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubs` (
  `cod_ubs` int NOT NULL AUTO_INCREMENT,
  `nome_ubs` varchar(100) DEFAULT NULL,
  `rua_ubs` varchar(45) DEFAULT NULL,
  `numero_rua_ubs` varchar(45) DEFAULT NULL,
  `bairro_ubs` varchar(45) DEFAULT NULL,
  `cidade_ubs` varchar(45) DEFAULT NULL,
  `email_ubs` varchar(45) DEFAULT NULL,
  `uf_ubs` char(2) DEFAULT NULL,
  PRIMARY KEY (`cod_ubs`),
  UNIQUE KEY `nome-ubs_UNIQUE` (`nome_ubs`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubs`
--

LOCK TABLES `ubs` WRITE;
/*!40000 ALTER TABLE `ubs` DISABLE KEYS */;
INSERT INTO `ubs` VALUES (1,'centro social urbano','joaquim gasso borges','300','Pedra Branca','Bagé','socialurbano@gmail.com','rs');
/*!40000 ALTER TABLE `ubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade_executante`
--

DROP TABLE IF EXISTS `unidade_executante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidade_executante` (
  `cod_ue` int NOT NULL AUTO_INCREMENT,
  `nome_ue` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `descricao_ue` varchar(60) COLLATE latin1_general_ci DEFAULT NULL,
  `rua_ue` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `numero_rua_ue` int DEFAULT NULL,
  `bairro_ue` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `cidade_ue` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `uf_ue` char(2) COLLATE latin1_general_ci DEFAULT NULL,
  `email_ue` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `central_reguladora_cod_cr` int NOT NULL,
  PRIMARY KEY (`cod_ue`,`central_reguladora_cod_cr`),
  KEY `fk_unidade-executante_central-reguladora1_idx` (`central_reguladora_cod_cr`),
  CONSTRAINT `fk_unidade-executante_central-reguladora1` FOREIGN KEY (`central_reguladora_cod_cr`) REFERENCES `central_reguladora` (`cod_cr`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade_executante`
--

LOCK TABLES `unidade_executante` WRITE;
/*!40000 ALTER TABLE `unidade_executante` DISABLE KEYS */;
INSERT INTO `unidade_executante` VALUES (1,'posto A','Especializado em neurologia','tiradentes',455,'centro','Pelotas','rs','potoa@gmail.com',1);
/*!40000 ALTER TABLE `unidade_executante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade_executante_compoe_medico`
--

DROP TABLE IF EXISTS `unidade_executante_compoe_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidade_executante_compoe_medico` (
  `unidade_executante_cod_ue` int NOT NULL,
  `medico_cod_medico` int NOT NULL,
  PRIMARY KEY (`unidade_executante_cod_ue`,`medico_cod_medico`),
  KEY `fk_unidade_executante_has_medico_medico1_idx` (`medico_cod_medico`),
  KEY `fk_unidade_executante_has_medico_unidade_executante1_idx` (`unidade_executante_cod_ue`),
  CONSTRAINT `fk_unidade_executante_has_medico_medico1` FOREIGN KEY (`medico_cod_medico`) REFERENCES `medico` (`cod_medico`),
  CONSTRAINT `fk_unidade_executante_has_medico_unidade_executante1` FOREIGN KEY (`unidade_executante_cod_ue`) REFERENCES `unidade_executante` (`cod_ue`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade_executante_compoe_medico`
--

LOCK TABLES `unidade_executante_compoe_medico` WRITE;
/*!40000 ALTER TABLE `unidade_executante_compoe_medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidade_executante_compoe_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `nome_usuario` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `cod_user` int NOT NULL AUTO_INCREMENT,
  `senha_user` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `status_usuario` char(2) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`cod_user`),
  UNIQUE KEY `senha-user_UNIQUE` (`senha_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-18 22:17:17
