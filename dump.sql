CREATE DATABASE  IF NOT EXISTS `tiendaambienteproyectowebb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `tiendaambienteproyectowebb`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tiendaambienteproyectowebb
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `articuloID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `precio` decimal(18,3) NOT NULL,
  `categoriaID` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `estadoID` int(11) NOT NULL,
  PRIMARY KEY (`articuloID`),
  KEY `categoriaID` (`categoriaID`),
  KEY `estadoID` (`estadoID`),
  CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`categoriaID`) REFERENCES `categorias` (`categoriaID`),
  CONSTRAINT `articulos_ibfk_2` FOREIGN KEY (`estadoID`) REFERENCES `estados` (`estadoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cantones`
--

DROP TABLE IF EXISTS `cantones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cantones` (
  `cantonID` int(11) NOT NULL AUTO_INCREMENT,
  `canton` varchar(50) NOT NULL,
  `provinciaID` int(11) NOT NULL,
  PRIMARY KEY (`cantonID`),
  KEY `provinciaID` (`provinciaID`),
  CONSTRAINT `cantones_ibfk_1` FOREIGN KEY (`provinciaID`) REFERENCES `provincias` (`provinciaID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cantones`
--

LOCK TABLES `cantones` WRITE;
/*!40000 ALTER TABLE `cantones` DISABLE KEYS */;
INSERT INTO `cantones` VALUES (1,'San José',1),(2,'Escazú',1),(3,'Desamparados',1),(4,'La Unión',1),(5,'Curridabat',1),(6,'Pérez Zeledón',1),(7,'Turrubares',1),(8,'Mora',1),(9,'Dota',1),(10,'Tibás',1),(11,'Montes de Oca',1),(12,'Alajuelita',1),(13,'Vázquez de Coronado',1),(14,'San Ramón',1),(15,'Alajuela',2),(16,'San Carlos',2),(17,'Grecia',2),(18,'Atenas',2),(19,'Naranjo',2),(20,'Palmares',2),(21,'Orotina',2),(22,'Poás',2),(23,'Zarcero',2),(24,'Los Chiles',2),(25,'Upala',2),(26,'La Fortuna',2),(27,'San Mateo',2),(28,'Sarchí',2),(29,'Cartago',3),(30,'Paraíso',3),(31,'La Unión',3),(32,'Jiménez',3),(33,'Turrialba',3),(34,'Alvarado',3),(35,'Oreamuno',3),(36,'El Guarco',3),(37,'Heredia',4),(38,'Barva',4),(39,'Santo Domingo',4),(40,'San Rafael',4),(41,'San Isidro',4),(42,'Santa Bárbara',4),(43,'San Pablo',4),(44,'San Juan',4),(45,'Liberia',5),(46,'Nicoya',5),(47,'Santa Cruz',5),(48,'Carrillo',5),(49,'Cañas',5),(50,'Abangares',5),(51,'Bagaces',5),(52,'Tilarán',5),(53,'La Cruz',5),(54,'Hojancha',5),(55,'Puntarenas',6),(56,'Esparza',6),(57,'El Guarco',6),(58,'Buenos Aires',6),(59,'Osa',6),(60,'Quepos',6),(61,'Coto Brus',6),(62,'Golfito',6),(63,'Pérez Zeledón',6),(64,'Corredores',6),(65,'Garabito',6),(66,'Limón',7),(67,'Guácimo',7),(68,'Siquirres',7),(69,'Talamanca',7),(70,'Matina',7),(71,'Pococí',7),(72,'Batán',7);
/*!40000 ALTER TABLE `cantones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `categoriaID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`categoriaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `clienteID` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(9) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) NOT NULL,
  `contrasena` varchar(20) NOT NULL,
  `estadoID` int(11) NOT NULL,
  `rolID` int(11) NOT NULL,
  `fechaRegistro` datetime NOT NULL,
  `provinciaID` int(11) NOT NULL,
  `cantonID` int(11) DEFAULT NULL,
  `distritoID` int(11) DEFAULT NULL,
  `otrasSenas` varchar(200) NOT NULL,
  `codigoPostal` varchar(10) DEFAULT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`clienteID`),
  UNIQUE KEY `cedula` (`cedula`),
  UNIQUE KEY `correo` (`correo`),
  UNIQUE KEY `telefono` (`telefono`),
  KEY `estadoID` (`estadoID`),
  KEY `rolID` (`rolID`),
  KEY `provinciaID` (`provinciaID`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`estadoID`) REFERENCES `estados` (`estadoID`) ON DELETE CASCADE,
  CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`rolID`) REFERENCES `roles` (`rolID`) ON DELETE CASCADE,
  CONSTRAINT `clientes_ibfk_5` FOREIGN KEY (`provinciaID`) REFERENCES `provincias` (`provinciaID`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'11111111','Gian','Vasquez','Carrillo','1234',1,1,'2024-12-06 20:02:07',4,15,70,'XXX','20110','gmarcovc@gmail.com','84168055'),(2,'123456789','Perez','1234','22222','1234',1,2,'2024-12-06 20:39:19',1,1,2,'XXX','2','fac@email.com','22220202'),(3,'4532635','uidshfuisf','xhhjfnjh','cjhjhjgj','1234',1,2,'2024-12-07 13:41:18',1,1,1,'SGFfzdg','1111','zzz@email.com','498390'),(5,'1234','Prueba','Prueba','Prueba','1234',1,2,'2024-12-09 16:12:48',2,NULL,NULL,'Alajuela, Carrizal, XXX','2000','prueba@mail.com','000000');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallespedido`
--

DROP TABLE IF EXISTS `detallespedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallespedido` (
  `detallePedidoID` int(11) NOT NULL AUTO_INCREMENT,
  `pedidoID` int(11) NOT NULL,
  `productoID` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioUnitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`detallePedidoID`),
  KEY `pedidoID` (`pedidoID`),
  KEY `productoID` (`productoID`),
  CONSTRAINT `detallespedido_ibfk_1` FOREIGN KEY (`pedidoID`) REFERENCES `pedidos` (`pedidoID`),
  CONSTRAINT `detallespedido_ibfk_2` FOREIGN KEY (`productoID`) REFERENCES `articulos` (`articuloID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallespedido`
--

LOCK TABLES `detallespedido` WRITE;
/*!40000 ALTER TABLE `detallespedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallespedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distritos`
--

DROP TABLE IF EXISTS `distritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distritos` (
  `distritoID` int(11) NOT NULL AUTO_INCREMENT,
  `distrito` varchar(50) NOT NULL,
  `cantonID` int(11) NOT NULL,
  `provinciaID` int(11) NOT NULL,
  PRIMARY KEY (`distritoID`),
  KEY `cantonID` (`cantonID`),
  KEY `provinciaID` (`provinciaID`),
  CONSTRAINT `distritos_ibfk_1` FOREIGN KEY (`cantonID`) REFERENCES `cantones` (`cantonID`) ON DELETE NO ACTION,
  CONSTRAINT `distritos_ibfk_2` FOREIGN KEY (`provinciaID`) REFERENCES `provincias` (`provinciaID`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distritos`
--

LOCK TABLES `distritos` WRITE;
/*!40000 ALTER TABLE `distritos` DISABLE KEYS */;
INSERT INTO `distritos` VALUES (1,'Catedral',1,1),(2,'El Carmen',1,1),(3,'Hospital',1,1),(4,'La Soledad',1,1),(5,'San Francisco de Dos Ríos',1,1),(6,'San Sebastián',1,1),(7,'San Pedro',1,1),(8,'La Uruca',1,1),(9,'Mata Redonda',1,1),(10,'Pavas',1,1),(11,'Uruca',1,1),(12,'Escazú',2,1),(13,'San Antonio',2,1),(14,'San Miguel',2,1),(15,'Desamparados',3,1),(16,'San Miguel',3,1),(17,'San Juan de Dios',3,1),(18,'San Rafael Arriba',3,1),(19,'San Rafael Abajo',3,1),(20,'San Cristóbal',3,1),(21,'Patarrá',3,1),(22,'Tres Ríos',4,1),(23,'San Diego',4,1),(24,'San Juan',4,1),(25,'Santiago',4,1),(26,'San Vicente',4,1),(27,'Curridabat',5,1),(28,'Granadilla',5,1),(29,'Sánchez',5,1),(30,'Los Jardines',5,1),(31,'San Isidro de El General',6,1),(32,'San Pedro',6,1),(33,'Daniel Flores',6,1),(34,'Platanares',6,1),(35,'Rio Nuevo',6,1),(36,'Rivas',6,1),(37,'San Gerardo de Rivas',6,1),(38,'El General',6,1),(39,'Quebradas',6,1),(40,'Turrubares',7,1),(41,'San Pablo',7,1),(42,'San Pedro',7,1),(43,'Ciudad Colón',8,1),(44,'Guachipelín',8,1),(45,'Tabarcia',8,1),(46,'Piedras Negras',8,1),(47,'San Isidro de El General',9,1),(48,'Santa María',9,1),(49,'Tibás',10,1),(50,'San Juan',10,1),(51,'San Pedro',11,1),(52,'San José',11,1),(53,'Sabanilla',11,1),(54,'La Trinidad',11,1),(55,'Alajuelita',12,1),(56,'San José',12,1),(57,'San Isidro',13,1),(58,'San Rafael',13,1),(59,'San Jerónimo',13,1),(60,'Dulce Nombre',13,1),(61,'San Ramón',14,1),(62,'Alajuela',1,2),(63,'San José',1,2),(64,'Desamparados',1,2),(65,'San Antonio',1,2),(66,'La Garita',1,2),(67,'El Coyol',1,2),(68,'San Isidro',1,2),(69,'San Rafael',1,2),(70,'San Mateo',1,2),(71,'San Francisco',1,2),(72,'Ciudad Quesada',2,2),(73,'La Fortuna',2,2),(74,'Aguas Zarcas',2,2),(75,'Florencia',2,2),(76,'Cutris',2,2),(77,'Pital',2,2),(78,'Venecia',2,2),(79,'Grecia',3,2),(80,'San Isidro',3,2),(81,'San Juan',3,2),(82,'San Roque',3,2),(83,'Tacares',3,2),(84,'Atenas',4,2),(85,'Jesús',4,2),(86,'San José',4,2),(87,'Escobal',4,2),(88,'Concepción',4,2),(89,'San Isidro',4,2),(90,'Naranjo',5,2),(91,'San Juan',5,2),(92,'San Rafael',5,2),(93,'El Rosario',5,2),(94,'La Unión',5,2),(95,'Palmares',6,2),(96,'Santiago',6,2),(97,'Esquipulas',6,2),(98,'Zaragoza',6,2),(99,'La Granja',6,2),(100,'Orotina',7,2),(101,'Coyolar',7,2),(102,'La Ceiba',7,2),(103,'Poás',8,2),(104,'San Pedro',8,2),(105,'San Juan',8,2),(106,'San Rafael',8,2),(107,'Zarcero',9,2),(108,'San Carlos',9,2),(109,'Lagunillas',9,2),(110,'El Jardín',9,2),(111,'Los Chiles',10,2),(112,'San Jorge',10,2),(113,'El Amparo',10,2),(114,'Upala',11,2),(115,'Aguas Claras',11,2),(116,'Bijagua',11,2),(117,'Cote',11,2),(118,'La Fortuna',12,2),(119,'San Mateo',13,2),(120,'La Lucha',13,2),(121,'Sarchí Norte',14,2),(122,'Sarchí Sur',14,2),(123,'Heredia',1,3),(124,'San Francisco',1,3),(125,'Ulloa',1,3),(126,'Mercedes',1,3),(127,'San Isidro',1,3),(128,'Santo Domingo',1,3),(129,'Barva',2,3),(130,'San Pedro',2,3),(131,'San Pablo',2,3),(132,'Santa Lucia',2,3),(133,'Santo Domingo',3,3),(134,'San Vicente',3,3),(135,'San Miguel',3,3),(136,'San Juan',3,3),(137,'San Rafael',3,3),(138,'Santa Bárbara',4,3),(139,'San José',4,3),(140,'Santo Domingo',4,3),(141,'San Rafael',5,3),(142,'San José',5,3),(143,'San Pedro',5,3),(144,'San Vicente',5,3),(145,'San Isidro',6,3),(146,'San Juan',6,3),(147,'Belén',7,3),(148,'San Antonio',7,3),(149,'La Asunción',7,3),(150,'San Joaquín',8,3),(151,'San Francisco',8,3),(152,'Santa Rosa',8,3),(153,'Puerto Viejo',9,3),(154,'La Virgen',9,3),(155,'La Palma',9,3),(156,'El Roble',9,3),(157,'Cartago',1,4),(158,'San Nicolás',1,4),(159,'San Rafael',1,4),(160,'Guadalupe',1,4),(161,'Corralillo',1,4),(162,'Paraíso',2,4),(163,'Santiago',2,4),(164,'Tierra Blanca',2,4),(165,'Orosi',2,4),(166,'Llanos de Santa Lucía',2,4),(167,'Tres Ríos',3,4),(168,'San Diego',3,4),(169,'San Juan',3,4),(170,'San Ramón',3,4),(171,'Juan Viñas',4,4),(172,'La Suiza',4,4),(173,'Jiménez',4,4),(174,'Turrialba',5,4),(175,'La Pastora',5,4),(176,'Santa Teresita',5,4),(177,'Peralta',5,4),(178,'Pacayas',6,4),(179,'Cervantes',6,4),(180,'San Antonio',6,4),(181,'San Isidro',6,4),(182,'San Rafael',7,4),(183,'San Antonio',7,4),(184,'San Pedro',7,4),(185,'El Tejar',8,4),(186,'San Isidro',8,4),(187,'Liberia',1,5),(188,'Cañas Dulces',1,5),(189,'La Anexión',1,5),(190,'Nacascolo',1,5),(191,'Nicoya',2,5),(192,'San Antonio',2,5),(193,'Santa Cruz',2,5),(194,'Nosara',2,5),(195,'Santa Cruz',3,5),(196,'Tempate',3,5),(197,'San Vicente',3,5),(198,'Huacas',3,5),(199,'Veintisiete de Abril',3,5),(200,'Tilarán',4,5),(201,'Tronadora',4,5),(202,'Santa Rosa',4,5),(203,'Bagaces',5,5),(204,'La Fortuna',5,5),(205,'Cañas',5,5),(206,'Carrillo',6,5),(207,'Sardinal',6,5),(208,'Coco',6,5),(209,'Guanacaste',7,5),(210,'Playa del Coco',7,5),(211,'La Cruz',8,5),(212,'Santa Rosa',8,5),(213,'Puntarenas',1,6),(214,'El Roble',1,6),(215,'La Paz',1,6),(216,'Chacarita',1,6),(217,'Esparza',2,6),(218,'San Juan Grande',2,6),(219,'San Rafael',2,6),(220,'San Francisco',2,6),(221,'Buenos Aires',3,6),(222,'Volcán',3,6),(223,'Potrero Grande',3,6),(224,'La Unión',3,6),(225,'Miramar',4,6),(226,'El Jardín',4,6),(227,'San Isidro',4,6),(228,'Ciudad Cortés',5,6),(229,'Palmar',5,6),(230,'Sierpe',5,6),(231,'Drake',5,6),(232,'Quepos',6,6),(233,'Manuel Antonio',6,6),(234,'Naranjito',6,6),(235,'Golfito',7,6),(236,'Ciudad Neily',7,6),(237,'Coto Brus',7,6),(238,'San Vito',8,6),(239,'Las Lomas',8,6),(240,'El Brujo',8,6),(241,'Corredor',9,6),(242,'La Cuesta',9,6),(243,'San Isidro de El General',10,6),(244,'El General',10,6),(245,'Daniel Flores',10,6),(246,'San Pedro',10,6),(247,'Limón',1,7),(248,'Valle La Estrella',1,7),(249,'Raquel',1,7),(250,'Matina',1,7),(251,'Guácimo',2,7),(252,'San Pedro',2,7),(253,'Palo Alto',2,7),(254,'Mercedes',2,7),(255,'Pococí',3,7),(256,'Guapiles',3,7),(257,'Jiménez',3,7),(258,'La Rita',3,7),(259,'Siquirres',4,7),(260,'Pacuarito',4,7),(261,'La Unión',4,7),(262,'El Cairo',4,7),(263,'Bribri',5,7),(264,'Cahuita',5,7),(265,'Talamanca',5,7),(266,'Sixaola',5,7);
/*!40000 ALTER TABLE `distritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `estadoID` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEstado` varchar(25) NOT NULL,
  PRIMARY KEY (`estadoID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Activo'),(2,'Inactivo'),(3,'En proceso'),(4,'Enviado'),(5,'Cancelado'),(6,'Activo'),(7,'Inactivo'),(8,'En proceso'),(9,'Enviado'),(10,'Cancelado');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodospago`
--

DROP TABLE IF EXISTS `metodospago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodospago` (
  `metodoPagoID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`metodoPagoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodospago`
--

LOCK TABLES `metodospago` WRITE;
/*!40000 ALTER TABLE `metodospago` DISABLE KEYS */;
/*!40000 ALTER TABLE `metodospago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `pedidoID` int(11) NOT NULL AUTO_INCREMENT,
  `clienteID` int(11) NOT NULL,
  `fechaPedido` datetime NOT NULL,
  `metodoPagoID` int(11) NOT NULL,
  `estadoID` int(11) NOT NULL,
  PRIMARY KEY (`pedidoID`),
  KEY `clienteID` (`clienteID`),
  KEY `estadoID` (`estadoID`),
  KEY `metodoPagoID` (`metodoPagoID`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`clienteID`) REFERENCES `clientes` (`clienteID`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`estadoID`) REFERENCES `estados` (`estadoID`),
  CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`metodoPagoID`) REFERENCES `metodospago` (`metodoPagoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias` (
  `provinciaID` int(11) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(50) NOT NULL,
  PRIMARY KEY (`provinciaID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'San José'),(2,'Alajuela'),(3,'Cartago'),(4,'Heredia'),(5,'Guanacaste'),(6,'Puntarenas'),(7,'Limón');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `rolID` int(11) NOT NULL AUTO_INCREMENT,
  `nombreRol` varchar(25) NOT NULL,
  PRIMARY KEY (`rolID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin'),(2,'Cliente');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tiendaambienteproyectowebb'
--
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarContrasena` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarContrasena`(pClienteID VARCHAR(9),
																	pCodigo varchar(10))
BEGIN

	UPDATE 	tiendaambienteproyectowebb.clientes
    SET 	Contrasena = pCodigo
    WHERE	clienteID = pClienteID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarPerfil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPerfil`(
    pClienteID INT(11),
    pCedula VARCHAR(9),
    pNombre VARCHAR(50),
    pApellido1 VARCHAR(50),
    pApellido2 VARCHAR(50),
    pRolID INT(11),
    pProvinciaID INT(11),
    pOtrasSenas VARCHAR(200),
    pCodigoPostal VARCHAR(10),
    pCorreo VARCHAR(50),
    pTelefono VARCHAR(15)
)
BEGIN
    UPDATE tiendaambienteproyectowebb.Clientes
    SET 
        Cedula = pCedula,
        Nombre = pNombre,
        Apellido1 = pApellido1,
        Apellido2 = pApellido2,
        RolID = CASE WHEN pRolID != 0 THEN pRolID ELSE RolID END,
        ProvinciaID = pProvinciaID,
        OtrasSenas = pOtrasSenas,
        CodigoPostal = pCodigoPostal,
        Correo = pCorreo,
        Telefono = pTelefono
    WHERE ClienteID = pClienteID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CambiarEstadoCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CambiarEstadoCliente`(pClienteID INT)
BEGIN
    UPDATE tiendaambienteproyectowebb.clientes
    SET estadoID = CASE 
                       WHEN estadoID = 1 THEN 2  
                       ELSE 1                   
                   END
    WHERE clienteID = pClienteID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarCliente`(pClienteID int(11))
BEGIN

	SELECT	C.clienteID,
			cedula,
			nombre,
            apellido1,
            apellido2,
            contrasena,
            C.estadoID,
            E.nombreEstado,
            C.rolID,
            R.nombreRol,
            fechaRegistro,
            C.provinciaID as provinciaID,
            P.provincia AS nombreProvincia,
            C.cantonID as cantonID,
            otrasSenas,
            codigoPostal,
            correo,
            telefono
	FROM 	tiendaambienteproyectowebb.Clientes C
	INNER JOIN tiendaambienteproyectowebb.Provincias P ON C.provinciaID = P.provinciaID
    INNER JOIN tiendaambienteproyectowebb.Roles R ON C.rolID = R.rolID
    INNER JOIN tiendaambienteproyectowebb.Estados E ON C.estadoID = E.estadoID
	WHERE 	C.ClienteID = pClienteID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarClientes`(pClienteID int)
BEGIN

	SELECT	C.ClienteID AS clienteID,
			cedula,
			nombre,
            apellido1,
            apellido2,
            E.estadoID as estadoID,
			CASE WHEN E.estadoID = 1 THEN 'Activo' WHEN E.estadoID = 2 THEN 'Inactivo' END AS 'DescripcionActivo',
			C.rolID as rolID,
            R.nombreRol AS nombreRol,
            fechaRegistro,
            C.provinciaID as provinciaID,
            P.provincia AS nombreProvincia,
            otrasSenas,
            codigoPostal,
            correo,
            telefono
	FROM 	tiendaambienteproyectowebb.Clientes C
    INNER JOIN tiendaambienteproyectowebb.Provincias P ON C.provinciaID = P.provinciaID
    INNER JOIN tiendaambienteproyectowebb.Roles R ON C.rolID = R.rolID
    INNER JOIN tiendaambienteproyectowebb.Estados E ON C.estadoID = E.estadoID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarProvincias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarProvincias`()
BEGIN
    SELECT provinciaID, provincia
    FROM provincias
    ORDER BY provinciaID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarRoles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarRoles`()
BEGIN

	SELECT	rolID, nombreRol
	FROM 	roles;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IniciarSesion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IniciarSesion`(pCorreo varchar(50),
															pContrasena varchar(20))
BEGIN

	SELECT	
			clienteID as ClienteID, #Habia un problema donde cliente ID aparecia en el valor donde tenia que estar cedula, esto lo soluciono
            cedula as Cedula,
			Nombre,
            apellido1,
            apellido2,
            contrasena,
            estadoID,
			rolID,
            fechaRegistro,
            provinciaID,
            cantonID,
            distritoID,
            otrasSenas,
            codigoPostal,
            correo,
            telefono
	FROM 	tiendaambienteproyectowebb.clientes
	WHERE 	Correo = pCorreo
		AND Contrasena = pContrasena
        AND estadoID = 1;
        END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RecuperarAcceso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RecuperarAcceso`(pCorreo varchar(50))
BEGIN

	SELECT	clienteID,
			cedula,
			Nombre,
            apellido1,
            apellido2,
            contrasena,
            estadoID,
            rolID,
            fechaRegistro,
            provinciaID,
            cantonID,
            distritoID,
            otrasSenas,
            codigoPostal,
            correo,
            telefono
	FROM 	tiendaambienteproyectowebb.clientes
	WHERE 	Correo = pCorreo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarCliente`(
    pCedula VARCHAR(9),
    pNombre VARCHAR(50),
    pApellido1 VARCHAR(50),
    pApellido2 VARCHAR(50),
    pContrasena VARCHAR(20),
    pProvinciaID INT,
    pOtrasSenas VARCHAR(200),
    pCodigoPostal VARCHAR(10),
    pCorreo VARCHAR(50),
    pTelefono VARCHAR(15)
)
BEGIN
    INSERT INTO `tiendaambienteproyectowebb`.`clientes`(`cedula`, `nombre`, `apellido1`, `apellido2`, `contrasena`, `estadoID`, `rolID`, 
                           `fechaRegistro`, `provinciaID`, `otrasSenas`, `codigoPostal`, 
                           `correo`, `telefono`)
    VALUES (pCedula, pNombre, pApellido1, pApellido2, pContrasena, 1, 2, NOW(), 
            pProvinciaID, pOtrasSenas, pCodigoPostal, pCorreo, pTelefono);
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

-- Dump completed on 2024-12-09 20:01:52
