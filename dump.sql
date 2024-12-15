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
  `articuloID` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `imagen` varchar(1000) DEFAULT NULL,
  `categoriaID` int(11) NOT NULL,
  PRIMARY KEY (`articuloID`),
  KEY `categoriaID` (`categoriaID`),
  CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`categoriaID`) REFERENCES `categorias` (`categoriaID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (23,'PruebaActualizadaAhoraSi',2.00,1,'/ProyectoAmbienteWeb/View/images/articulos/banner-01.jpg',2);
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Zapatos'),(2,'Relojes');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'11111111','Gian','Vasquez','Carrillo','1234',1,1,'2024-12-06 20:02:07',4,'XXX','20110','gmarcovc@gmail.com','84168055'),(2,'123456789','Perez','1234','22222','1234',1,2,'2024-12-06 20:39:19',1,'XXX','2','fac@email.com','22220202'),(3,'4532635','uidshfuisf','xhhjfnjh','cjhjhjgj','1234',1,2,'2024-12-07 13:41:18',1,'SGFfzdg','1111','zzz@email.com','498390'),(5,'1234','Prueba','Prueba','Prueba','1234',1,2,'2024-12-09 16:12:48',2,'Alajuela, Carrizal, XXX','2000','prueba@mail.com','000000'),(6,'118850897','Amber','Bustos','Araya','1234',1,1,'2024-12-09 20:35:12',1,'Ciudad Colón, Mora, del mas por menos 600 mts sur','40104','ambernatasha2209@gmail.com','25891818');
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
  CONSTRAINT `detallespedido_ibfk_1` FOREIGN KEY (`pedidoID`) REFERENCES `pedidos` (`pedidoID`)
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
INSERT INTO `estados` VALUES (1,'Activo'),(2,'Inactivo'),(3,'En proceso'),(4,'Enviado'),(5,'Cancelado');
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
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarArticulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarArticulo`(
    pArticuloID bigint,
    pNombre varchar(100),
    pPrecio decimal(10,2),
    pCantidad int,
    pImagen varchar(1000),
    pCategoriaID int)
BEGIN
    UPDATE `articulos`
    SET nombre = pNombre,
        precio = pPrecio,
        cantidad = pCantidad,
        imagen = CASE WHEN pImagen = '' THEN imagen ELSE pImagen END,
        categoriaID = pCategoriaID
    WHERE articuloID = pArticuloID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarArticulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarArticulo`(pArticuloID bigint)
BEGIN
    SELECT articuloID, nombre, precio, cantidad, imagen, categoriaID
    FROM `articulos`
    WHERE articuloID = pArticuloID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarArticulos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarArticulos`()
BEGIN
    SELECT 
    A.articuloID, 
    A.nombre, 
    precio, 
    cantidad, 
    imagen, 
    A.categoriaID as categoriaID,
	C.nombre AS nombreCategoria
    FROM tiendaambienteproyectowebb.articulos A
    INNER JOIN tiendaambienteproyectowebb.categorias C ON A.categoriaID = C.categoriaID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarCategorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarCategorias`()
BEGIN
    SELECT categoriaID, nombre 
    FROM categorias;
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
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarEstados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarEstados`()
BEGIN
    SELECT estadoID, nombreEstado 
    FROM estados;
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
/*!50003 DROP PROCEDURE IF EXISTS `EliminarArticulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarArticulo`(pArticuloID bigint)
BEGIN
    DELETE FROM `articulos`
    WHERE articuloID = pArticuloID;
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
			clienteID as ClienteID,
            cedula as Cedula,
			Nombre,
            apellido1,
            apellido2,
            contrasena,
            estadoID,
			rolID,
            fechaRegistro,
            provinciaID,
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
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarArticulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarArticulo`(
    pNombre varchar(100),
    pPrecio decimal(10,2),
    pCantidad int,
    pImagen varchar(1000),
    pCategoriaID int
)
BEGIN
    INSERT INTO `articulos` (nombre, precio, cantidad, imagen, categoriaID)
    VALUES (pNombre, pPrecio, pCantidad, pImagen, pCategoriaID);
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

-- Dump completed on 2024-12-15 15:49:35
