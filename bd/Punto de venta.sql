CREATE DATABASE  IF NOT EXISTS `proyecto2_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `proyecto2_db`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto2_db
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `clientes` (
  `idClientes` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `nit` varchar(12) DEFAULT NULL,
  `genero` bit(1) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `correo_electronico` varchar(45) DEFAULT NULL,
  `fechaIngreso` datetime DEFAULT NULL,
  PRIMARY KEY (`idClientes`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Maria Jose','Castillo Ruiz','12345678',_binary '\0','78391548','majo12@gmail.com','2021-11-13 22:26:23'),(2,'Jose Luis','Perez Barrios','32165498',_binary '','78391548','joseLuis23@gmail.com','2021-11-13 22:26:23');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `compras` (
  `idcompras` int(11) NOT NULL AUTO_INCREMENT,
  `no_orden_compra` int(11) DEFAULT NULL,
  `idProveedor` int(11) DEFAULT NULL,
  `fecha_orden` date DEFAULT NULL,
  `fechaIngreso` datetime DEFAULT NULL,
  PRIMARY KEY (`idcompras`),
  KEY `idproveedor_proveedores_compras_idx` (`idProveedor`),
  CONSTRAINT `idproveedor_proveedores_compras` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idproveedores`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,1,3,'2021-06-07','2021-06-07 13:17:41'),(2,2,3,'2021-06-07','2021-06-07 18:21:15'),(3,3,3,'2021-06-07','2021-06-07 18:30:42'),(4,4,3,'2021-06-07','2021-06-07 18:33:34'),(6,6,3,'2021-06-07','2021-06-07 20:37:13'),(7,8,3,'2021-06-07','2021-06-07 20:39:32'),(8,9,4,'2021-06-08','2021-06-08 21:23:19'),(9,10,4,'2021-06-08','2021-06-08 21:28:26');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_detalle`
--

DROP TABLE IF EXISTS `compras_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `compras_detalle` (
  `idcompras_detalle` bigint(20) NOT NULL AUTO_INCREMENT,
  `idcompra` int(11) DEFAULT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_costo_unitario` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`idcompras_detalle`),
  KEY `idcompra_compras_comprasDetalle_idx` (`idcompra`),
  KEY `idproducto_productos_comprasDetalle_idx` (`idproducto`),
  CONSTRAINT `idcompra_compras_comprasDetalle` FOREIGN KEY (`idcompra`) REFERENCES `compras` (`idcompras`) ON UPDATE CASCADE,
  CONSTRAINT `idproducto_productos_comprasDetalle` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_detalle`
--

LOCK TABLES `compras_detalle` WRITE;
/*!40000 ALTER TABLE `compras_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `departamento` (
  `id_departamento` smallint(6) NOT NULL AUTO_INCREMENT,
  `departamento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Ventas'),(2,'Tecnologia'),(3,'Compras'),(4,'Talento Humano');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `empleados` (
  `idempleados` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `DPI` varchar(15) DEFAULT NULL,
  `genero` bit(1) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `idPuesto` smallint(6) DEFAULT NULL,
  `fecha_inicio_labores` date DEFAULT NULL,
  `fechaIngreso` datetime DEFAULT NULL,
  PRIMARY KEY (`idempleados`),
  KEY `idPuesto_puestos_empleados_idx` (`idPuesto`),
  CONSTRAINT `idPuesto_puestos_empleados` FOREIGN KEY (`idPuesto`) REFERENCES `puestos` (`idpuesto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (11,'Juan Manuel','Sanchez Juarez','ciudad','111','222',_binary '','1995-05-05',5,'2021-05-17','2021-05-17 22:47:40'),(12,'Juan Jose','Perez Sanchez','ciudad','123','321',_binary '','1995-05-05',4,'2021-05-17','2021-10-23 22:14:03'),(13,'Pedro Juan','zamora gonsalez','ciudad','25896321','7896',_binary '','1995-05-20',4,'2021-05-20','2021-05-20 15:44:51'),(16,'Manfred','Sirin','Chimaltenango','35224357','3118887040412',_binary '','2000-01-14',4,'1990-01-01','2021-10-03 17:58:26'),(17,'Keynes','Sirin','Chimaltenango','35224357','3118887040412',_binary '','2000-01-14',4,'1990-01-01','2021-10-03 17:59:01'),(18,'Manfred Keynes Saul','Ajtun','3ra. Avenida 6-43 Zona 2 Chimaltenango','35224357','3118887040411',_binary '','2021-10-20',4,'2021-10-16','2021-10-03 18:35:17'),(19,'Gerson','Ajtun','Chimaltenango','30160569','3118887040412',_binary '','2000-01-14',4,'1990-01-01','2021-10-03 18:37:56'),(21,'Jose Pablo','quezada','Antigua Guatemla','55555','0000652656',_binary '','1996-01-31',5,'2020-12-24','2021-10-03 19:20:20'),(23,'Saul','Gutierrez Hernandez','5ta. Avenida 6-43 Zona 11 Guatemala','55669988','9999999999999',_binary '','2021-10-20',5,'2021-10-14','2021-10-04 21:40:18'),(24,'Saul','Gutierrez Hernandez','5ta. Avenida 6-43 Zona 11 Guatemala','55669988','9999999999999',_binary '','2021-10-20',5,'2021-10-14','2021-10-04 21:43:11'),(25,'Manfred Keynes Saul','Ajtun','3ra. Avenida 6-43 Zona 2 Chimaltenango','35224357','3118887040412',_binary '\0','2021-10-07',4,'2021-10-01','2021-10-27 12:14:09'),(34,'Sebastian','Alvarez Castillo','3ra. Avenida 6-43 Zona 2 Chimaltenango','35224357','3118887040411',_binary '','2000-03-07',4,'2021-02-25','2022-03-25 21:45:28');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `marcas` (
  `idMarca` smallint(6) NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (2,'Dell'),(5,'Samsung'),(6,'HP');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menu` (
  `idmenu` int(11) NOT NULL AUTO_INCREMENT,
  `dir` varchar(45) DEFAULT NULL,
  `menu_nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'welcome.jsp','Home'),(2,'Empleados.jsp','Empleados'),(3,'Clientes.jsp','Clientes'),(4,'Proveedores.jsp','Proveedores'),(5,'Puestos.jsp','Puestos'),(6,'Marcas.jsp','Marcas'),(7,'Productos.jsp','Productos'),(8,'RegistrarVenta.jsp','Ventas'),(9,'Reportes.jsp','Reportes');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `producto` varchar(50) DEFAULT NULL,
  `idMarca` smallint(6) DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Imagen` varchar(150) DEFAULT NULL,
  `precio_costo` decimal(8,2) DEFAULT NULL,
  `precio_venta` decimal(8,2) DEFAULT NULL,
  `existencia` int(11) DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `idMarca_marcas_productos_idx` (`idMarca`),
  CONSTRAINT `idMarca_marcas_productos` FOREIGN KEY (`idMarca`) REFERENCES `marcas` (`idmarca`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Dell Latitude',2,'5570','http://localhost:8081/Ventas/img/1.png',3000.00,4000.00,98,'2021-11-13 22:25:53'),(2,'Televisor Android',5,'Full HD 4k','http://localhost:8081/Ventas/img/3.png',1000.00,2000.00,50,'2021-11-13 22:50:22'),(3,'Telefono A30s',5,'A30S','http://localhost:8081/Ventas/img/SAMSUNG-Galaxy-A30s-3_preview_rev_1.png',5000.00,6000.00,90,'2021-11-13 22:51:06'),(4,'Play 5',6,'Play 5','http://localhost:8081/Ventas/img/ps5_preview_rev_1.png',1000.00,2000.00,99,'2021-11-13 22:51:57'),(5,'Adiofonos Inalambricos',2,'Inalambricos','http://localhost:8081/Ventas/img/audifonos-bluetooth.png',500.00,800.00,94,'2021-11-13 22:52:30'),(6,'Monitor Dell P2719h',2,'Monitor Dell','http://localhost:8081/Ventas/img/Dell__monitor.png',1800.00,2000.00,100,'2022-03-25 16:07:57');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proveedores` (
  `idproveedores` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor` varchar(60) DEFAULT NULL,
  `nit` varchar(12) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idproveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (3,'pro2','888','antigua','999'),(4,'proveedor 3','555','Ciudad','444');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `puestos` (
  `idPuesto` smallint(6) NOT NULL AUTO_INCREMENT,
  `puesto` varchar(50) DEFAULT NULL,
  `id_departamento` smallint(6) DEFAULT NULL,
  `fechaIngreso` date DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPuesto`),
  KEY `id_departamento_puestos_idx` (`id_departamento`),
  CONSTRAINT `id_departamento_puestos` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` VALUES (4,'Gerente',1,'2021-05-17','Inactivo'),(5,'Jefe',4,'2021-05-17','Activo'),(6,'Asistente',3,'2021-05-17','Inactivo');
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuarios` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(20) NOT NULL,
  `pass` varchar(32) NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3'),(2,'manfred','202cb962ac59075b964b07152d234b70'),(3,'mfer119416','827ccb0eea8a706c4c34a16891f84e7b'),(4,'administrador','25d55ad283aa400af464c76d713c07ad');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ventas` (
  `idVentas` int(11) NOT NULL AUTO_INCREMENT,
  `noFactura` int(11) DEFAULT NULL,
  `serie` char(1) DEFAULT NULL,
  `fechaFactura` date DEFAULT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `idempleado` int(11) DEFAULT NULL,
  `fechaIngreso` datetime DEFAULT NULL,
  PRIMARY KEY (`idVentas`),
  KEY `idcliente_clientes_ventas_idx` (`idcliente`),
  KEY `idempleados_clientes_ventas_idx` (`idempleado`),
  CONSTRAINT `idcliente_clientes_ventas` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idclientes`) ON UPDATE CASCADE,
  CONSTRAINT `idempleados_clientes_ventas` FOREIGN KEY (`idempleado`) REFERENCES `empleados` (`idempleados`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,'A','2021-10-13',1,11,'2021-11-13 22:56:09'),(2,2,'A','2021-10-13',1,11,'2021-11-13 22:58:28'),(3,3,'A','2022-02-23',1,11,'2022-03-23 21:54:03'),(4,4,'A','2022-02-24',1,11,'2022-03-24 13:12:59'),(5,5,'A','2022-02-24',1,11,'2022-03-24 13:50:11'),(6,6,'A','2022-02-24',1,11,'2022-03-24 14:02:31'),(7,7,'A','2022-02-24',1,11,'2022-03-24 14:02:35'),(8,8,'A','2022-02-24',1,11,'2022-03-24 14:02:42'),(9,9,'A','2022-02-24',1,11,'2022-03-24 14:02:45'),(10,10,'A','2022-02-24',1,11,'2022-03-24 14:03:49'),(11,11,'A','2022-02-24',1,11,'2022-03-24 14:03:54'),(12,12,'A','2022-02-24',1,11,'2022-03-24 14:04:02'),(13,13,'A','2022-02-24',1,11,'2022-03-24 14:05:58'),(14,14,'A','2022-02-24',1,11,'2022-03-24 22:09:04');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_detalle`
--

DROP TABLE IF EXISTS `ventas_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ventas_detalle` (
  `idventa_detalle` bigint(20) NOT NULL AUTO_INCREMENT,
  `idVenta` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `precio_unitario` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`idventa_detalle`),
  KEY `idVenta_ventas_ventasDetalle_idx` (`idVenta`),
  KEY `idProducto_producto_ventasDetalle_idx` (`idProducto`),
  CONSTRAINT `idProducto_producto_ventasDetalle` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idproducto`) ON UPDATE CASCADE,
  CONSTRAINT `idVenta_ventas_ventasDetalle` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`idventas`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_detalle`
--

LOCK TABLES `ventas_detalle` WRITE;
/*!40000 ALTER TABLE `ventas_detalle` DISABLE KEYS */;
INSERT INTO `ventas_detalle` VALUES (1,1,3,'2',6000.00),(2,1,5,'3',800.00),(3,1,1,'1',4000.00),(4,2,3,'10',6000.00),(5,2,2,'50',2000.00),(6,3,5,'2',800.00),(7,4,5,'1',800.00),(8,4,5,'1',800.00),(9,4,4,'1',2000.00),(10,4,1,'2',4000.00),(11,5,5,'1',800.00),(12,14,5,'1',800.00);
/*!40000 ALTER TABLE `ventas_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'proyecto2_db'
--

--
-- Dumping routines for database 'proyecto2_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-28 23:42:28
