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
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `imagen` varchar(1000) NOT NULL,
  `categoriaID` int(11) NOT NULL,
  PRIMARY KEY (`articuloID`),
  KEY `categoriaID` (`categoriaID`),
  CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`categoriaID`) REFERENCES `categorias` (`categoriaID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (9,'Blusa Adidas',10000.00,20,'/ProyectoAmbienteWeb/View/images/articulos/15b561a0245113d197eb465cb28df223.jpg',1),(10,'Blusa de manga larga a rayas',5000.00,10,'/ProyectoAmbienteWeb/View/images/articulos/1a03dbb488e0f8432f7f2dee10a904a4.jpg',1),(11,'Camisa Racing',8000.00,10,'/ProyectoAmbienteWeb/View/images/articulos/1ae3384084422f24e2c97b6ac1512a32.jpg',2),(12,'Shorts Adidas Deportivos',6000.00,10,'/ProyectoAmbienteWeb/View/images/articulos/3d69e408fabe231592568201a7835501.jpg',5),(13,'Pack 5 Camisas Colores Variados',20000.00,5,'/ProyectoAmbienteWeb/View/images/articulos/4c321bab5ce780c4682bb75f3bfe63ff.jpg',2),(14,'Camisa Conejo',3000.00,40,'/ProyectoAmbienteWeb/View/images/articulos/5b2eface9e160ed354eb559d14ef6291.jpg',2),(15,'Pantalón Deportivo Adidas',10000.00,10,'/ProyectoAmbienteWeb/View/images/articulos/5dcdcddce30cff6c89fc13a1f9ea80a4.jpg',5),(16,'Blusa manga larga blanco perla',10000.00,10,'/ProyectoAmbienteWeb/View/images/articulos/7ce3a66aba8ac53a89a78a9a4789de97.jpg',1),(17,'Reloj de hombre Plata/Negro',15000.00,10,'/ProyectoAmbienteWeb/View/images/articulos/7fc27e8035671baa453f74494ff8270d.jpg',9),(18,'Pantalón Ancho Negro',15000.00,10,'/ProyectoAmbienteWeb/View/images/articulos/9d4d46104f0707468972e759f1aeff23.jpg',4),(19,'Juego con Reloj Dorado',15000.00,5,'/ProyectoAmbienteWeb/View/images/articulos/17d7938d2cb08ae6edbb1652096d0532.jpg',9),(20,'Camisa Polo Navy ',10000.00,10,'/ProyectoAmbienteWeb/View/images/articulos/30f83b85ce6ce02a5b397c590796a154.jpg',2),(21,'Camisola Playera',5000.00,15,'/ProyectoAmbienteWeb/View/images/articulos/37f7e571012fd716e52a8d5cea8a3bbb.jpg',2),(22,'Pantalón Ancho Mezclilla',5000.00,5,'/ProyectoAmbienteWeb/View/images/articulos/44c277fe5a27683232a110327b2a37c0.jpg',5),(23,'Camisa de Gato',5000.00,5,'/ProyectoAmbienteWeb/View/images/articulos/75bc5263dbca3d996e8d8127f46258b5.jpg',1),(24,'Tennis Nike Blancas',45000.00,20,'/ProyectoAmbienteWeb/View/images/articulos/92c6ece26b10b49ad5439318dc0da64b.jpg',7),(25,'Pantalón Ancho Beige',10000.00,15,'/ProyectoAmbienteWeb/View/images/articulos/96d84ac9e653a8b7587b7fb7deb268ff.jpg',4),(26,'Camisa manga larga azul marino',10000.00,50,'/ProyectoAmbienteWeb/View/images/articulos/224da763284424eff24e429e8e6d42fc.jpg',2),(27,'Camisa de Botones negra',15000.00,5,'/ProyectoAmbienteWeb/View/images/articulos/3663a648d685fac7f6e839485270e264.jpg',2),(28,'Blusa manga larga celeste',7500.00,10,'/ProyectoAmbienteWeb/View/images/articulos/4558f4221e7d45789eabba479751b078.jpg',1),(29,'Blusa Mariposa Gris',5000.00,20,'/ProyectoAmbienteWeb/View/images/articulos/5492d5fa4e0d61a7a75ab232ed804d2f.jpg',1),(30,'Pantalón Ancho Mezclilla Clara',10000.00,20,'/ProyectoAmbienteWeb/View/images/articulos/8921e851e1f7e1954aefd7880d873627.jpg',4),(31,'Tennis Puma Negras',39000.00,10,'/ProyectoAmbienteWeb/View/images/articulos/9163d153b20eccbbbd1918516f7954c4.jpg',7),(32,'Camisa de compresión Negra ',10000.00,10,'/ProyectoAmbienteWeb/View/images/articulos/34013d92c406c19dbd677c7b2dae79e0.jpg',2),(33,'Air Force Nike Destellos Dorados',50000.00,10,'/ProyectoAmbienteWeb/View/images/articulos/94425ec79166e460814b59b23fb865a0.jpg',7),(34,'Tennis Runner Nike',60000.00,10,'/ProyectoAmbienteWeb/View/images/articulos/703604b718fc73e98b12989190fc4ea2.jpg',7),(35,'Tennis Nike Dunk Low Matices Grises',60000.00,10,'/ProyectoAmbienteWeb/View/images/articulos/5154456ae8f4e1b3e452b471840f56ce.jpg',6),(36,'New Balance Runner Virales ',70000.00,10,'/ProyectoAmbienteWeb/View/images/articulos/a4c6080e4b9f6f14806cc3f5c4552005.jpg',7),(37,'Adidas Campus ',30000.00,10,'/ProyectoAmbienteWeb/View/images/articulos/a78eba5caf5ac5b4c1a5613db11a4341.jpg',7),(38,'Tennis Puma Grises',30000.00,10,'/ProyectoAmbienteWeb/View/images/articulos/abd5b0d7fa05f0ee1a691b7a5fdfcce9.jpg',6),(39,'Pantalón Skinny Mezclilla ',10000.00,10,'/ProyectoAmbienteWeb/View/images/articulos/b580853e6a176b4f79b0d1a9201b43e1.jpg',5),(40,'Conjunto Gorra y Camisa',15000.00,2,'/ProyectoAmbienteWeb/View/images/articulos/banner-01.jpg',3),(41,'Camisa Azul ',15000.00,2,'/ProyectoAmbienteWeb/View/images/articulos/banner-02.jpg',2),(42,'Camisa Botones y Cuadros',10000.00,10,'/ProyectoAmbienteWeb/View/images/articulos/banner-03.jpg',2),(43,'Pantalón Ancho Mezclilla Clara',15000.00,5,'/ProyectoAmbienteWeb/View/images/articulos/dfc9c5b8e67a305e788ac62f65262c02.jpg',5),(44,'Pantalón Ancho Negro Fem',15000.00,5,'/ProyectoAmbienteWeb/View/images/articulos/e19d9f04155d87d6d676e9b07791cab7.jpg',5),(45,'Camisa Choize ',15000.00,5,'/ProyectoAmbienteWeb/View/images/articulos/ee2152054963790ad0615ba82ff61898.jpg',2),(46,'Reloj Femenino Dorado',15000.00,5,'/ProyectoAmbienteWeb/View/images/articulos/fb6e85045556eb24bc7f5d6fcb79a951.jpg',9),(47,'Jogger Adidas Masc',15000.00,5,'/ProyectoAmbienteWeb/View/images/articulos/ff8fecef2bc46e82372ad604eea2a77d (1).jpg',4),(48,'Pijama azul',4000.00,10,'/ProyectoAmbienteWeb/View/images/articulos/product-02.jpg',8),(49,'Pijama Rosado',4500.00,10,'/ProyectoAmbienteWeb/View/images/articulos/product-03.jpg',8),(50,'Jacket Dorada',15000.00,3,'/ProyectoAmbienteWeb/View/images/articulos/product-05.jpg',2),(51,'Clarks Cruz',15000.00,15,'/ProyectoAmbienteWeb/View/images/articulos/product-09.jpg',6),(52,'Botas Gucci',15000.00,15,'/ProyectoAmbienteWeb/View/images/articulos/product-10.jpg',6),(53,'Tennis',15000.00,15,'/ProyectoAmbienteWeb/View/images/articulos/product-12.jpg',6),(54,'Reloj Cuarzo',15000.00,15,'/ProyectoAmbienteWeb/View/images/articulos/product-14.jpg',9);
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `carritoID` int(11) NOT NULL AUTO_INCREMENT,
  `articuloID` int(11) DEFAULT NULL,
  `clienteID` int(11) DEFAULT NULL,
  `cantidadDeseada` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`carritoID`),
  KEY `FK_clientes` (`clienteID`),
  KEY `FK_articulo` (`articuloID`),
  CONSTRAINT `FK_articulo` FOREIGN KEY (`articuloID`) REFERENCES `articulos` (`articuloID`),
  CONSTRAINT `FK_clientes` FOREIGN KEY (`clienteID`) REFERENCES `clientes` (`clienteID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (7,9,1,2,'2024-12-18 15:10:40');
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Blusas'),(2,'Camisas'),(3,'Conjuntos completos'),(4,'Pantalón Masculino'),(5,'Pantalón Femenino'),(6,'Tennis de hombre'),(7,'Tennis de mujer'),(8,'Pijamas'),(9,'Accesorios');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `clienteID` int(11) NOT NULL,
  `cedula` varchar(9) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) NOT NULL,
  `contrasena` varchar(20) NOT NULL,
  `estadoID` int(11) NOT NULL,
  `rolID` int(11) NOT NULL,
  `fechaRegistro` datetime NOT NULL,
  `provinciaID` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'11111111','Gian','Vasquez','Carrillo','12345',1,1,'2024-12-06 20:02:07',4,'XXX','20110','gmarcovc@gmail.com','84168055'),(2,'123456789','Perez','1234','22222','1234',1,2,'2024-12-06 20:39:19',1,'XXX','2','fac@email.com','22220202'),(3,'4532635','uidshfuisf','xhhjfnjh','cjhjhjgj','1234',1,2,'2024-12-07 13:41:18',1,'SGFfzdg','1111','zzz@email.com','498390'),(5,'1234','Prueba','Prueba','Prueba','1234',1,2,'2024-12-09 16:12:48',2,'Alajuela, Carrizal, XXX','2000','prueba@mail.com','000000'),(6,'118850897','Amber','Bustos','Araya','1234',1,1,'2024-12-09 20:35:12',1,'Ciudad Colón, Mora, del mas por menos 600 mts sur','40104','ambernatasha2209@gmail.com','25891818'),(7,'208730895','Joshua','Rodriguez','Perez','1234',1,2,'2024-12-11 10:05:12',2,'XXX','10110','jrodriguezperez602@gmail.com','84660438');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultas`
--

DROP TABLE IF EXISTS `consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultas` (
  `consultaID` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) NOT NULL,
  `clienteID` int(11) DEFAULT NULL,
  `nombreCliente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`consultaID`),
  KEY `fk_clienteID` (`clienteID`),
  CONSTRAINT `fk_clienteID` FOREIGN KEY (`clienteID`) REFERENCES `clientes` (`clienteID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas`
--

LOCK TABLES `consultas` WRITE;
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
INSERT INTO `consultas` VALUES (9,'jjefijif222',NULL,'Amber'),(15,'giaan ',NULL,'Gian'),(16,'me encantaa!',NULL,'Joshua');
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle`
--

DROP TABLE IF EXISTS `detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle` (
  `detalleID` int(11) NOT NULL AUTO_INCREMENT,
  `maestroID` int(11) DEFAULT NULL,
  `articuloID` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(18,2) DEFAULT NULL,
  `total` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`detalleID`),
  KEY `FK_DetalleMaestro` (`maestroID`),
  KEY `FK_DetalleArticulo` (`articuloID`),
  CONSTRAINT `FK_DetalleArticulo` FOREIGN KEY (`articuloID`) REFERENCES `articulos` (`articuloID`),
  CONSTRAINT `FK_DetalleMaestro` FOREIGN KEY (`maestroID`) REFERENCES `maestro` (`MaestroID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle`
--

LOCK TABLES `detalle` WRITE;
/*!40000 ALTER TABLE `detalle` DISABLE KEYS */;
INSERT INTO `detalle` VALUES (1,1,1,1,1.00,1.00),(2,1,3,1,1.00,1.00),(3,1,6,3,3.00,9.00),(4,1,7,2,1.00,2.00),(8,2,8,2,34.00,68.00);
/*!40000 ALTER TABLE `detalle` ENABLE KEYS */;
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
-- Table structure for table `maestro`
--

DROP TABLE IF EXISTS `maestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maestro` (
  `maestroID` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `clienteID` int(11) DEFAULT NULL,
  `total` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`maestroID`),
  KEY `FK_maestroUsuario` (`clienteID`),
  CONSTRAINT `FK_maestroUsuario` FOREIGN KEY (`clienteID`) REFERENCES `clientes` (`clienteID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maestro`
--

LOCK TABLES `maestro` WRITE;
/*!40000 ALTER TABLE `maestro` DISABLE KEYS */;
INSERT INTO `maestro` VALUES (1,'2024-12-17 23:41:26',1,13.00),(2,'2024-12-18 00:39:52',1,68.00);
/*!40000 ALTER TABLE `maestro` ENABLE KEYS */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-18 16:19:30
