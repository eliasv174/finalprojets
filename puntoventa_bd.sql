CREATE DATABASE  IF NOT EXISTS `puntoventa_bd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `puntoventa_bd`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: puntoventa_bd
-- ------------------------------------------------------
-- Server version	8.0.37

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
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `nit` varchar(12) DEFAULT NULL,
  `genero` int DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `correo_electronico` varchar(45) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'jose','Mejia','656565226',2,'5666565','josef@gmail.com','2000-01-01'),(2,'Marlon','Lopez','7878869',2,'44466592','marlon@gmail.com','1995-10-10'),(3,'Kateryn','Perez','65656523',1,'65656539','katy@gmail.com','1999-10-23'),(4,'Pedro','Renta ','1236547',2,'65987469','pedroren@gmail.com','2010-12-06'),(5,'Julieta ','Ponce ','13664693',1,'15639827','julieta@gmail.com','2006-11-14'),(6,'Martin','Rios','12365893',2,'56987133','martin21@gmal.com','2008-06-02'),(7,'Efrain','Casas','3698521',2,'78965234','efrain12@gmail.com','1996-10-05'),(8,'Valentina','Laverde','963285173',1,'26002503','valentina56@gmail.com','2011-05-20'),(11,'SUCELY','LOPEZ','3333',2,'33333','1333','0444-04-01');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `no_orden_compra` int DEFAULT NULL,
  `id_proveeder` int DEFAULT NULL,
  `fecha_orden` date DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `idCompras_idx` (`id_proveeder`),
  CONSTRAINT `idCompras` FOREIGN KEY (`id_proveeder`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,10001,NULL,'2024-10-12','2024-10-15 14:30:00'),(2,10002,NULL,'2024-10-13','2024-10-16 09:45:00'),(3,10003,NULL,'2024-10-14','2024-10-17 17:11:00'),(4,10004,NULL,'2024-10-15','2024-10-18 18:16:00'),(5,10005,NULL,'2024-10-16','2024-10-19 10:15:00'),(6,10006,NULL,'2024-10-16','2024-10-20 04:30:00'),(7,10007,NULL,'2024-10-17','2024-10-21 11:00:00'),(8,10008,NULL,'2024-10-18','2024-10-22 01:45:00'),(9,10009,NULL,'2024-10-18','2024-10-23 12:00:00');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_detalle`
--

DROP TABLE IF EXISTS `compras_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras_detalle` (
  `id_compra_detalle` bigint NOT NULL AUTO_INCREMENT,
  `id_compra` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio_costo_unitario` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_compra_detalle`),
  KEY `idCompra_idx` (`id_compra`),
  KEY `idProducto_idx` (`id_producto`),
  CONSTRAINT `idCompra` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`),
  CONSTRAINT `idProducto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_detalle`
--

LOCK TABLES `compras_detalle` WRITE;
/*!40000 ALTER TABLE `compras_detalle` DISABLE KEYS */;
INSERT INTO `compras_detalle` VALUES (1,NULL,NULL,20,550.00),(2,NULL,NULL,30,60.00),(3,NULL,NULL,60,400.00),(4,NULL,NULL,25,95.00),(5,NULL,NULL,10,150.00),(6,NULL,NULL,80,325.00),(7,NULL,NULL,60,500.00),(8,NULL,NULL,25,430.00),(9,NULL,NULL,30,250.00);
/*!40000 ALTER TABLE `compras_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `dpi` varchar(15) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `id_puesto` smallint DEFAULT NULL,
  `fecha_inicio_labores` date DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `genero` int DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `fk_Empleados_Puestos1_idx` (`id_puesto`),
  KEY `gg_idx` (`genero`),
  CONSTRAINT `Genero` FOREIGN KEY (`genero`) REFERENCES `genero` (`id_genero`),
  CONSTRAINT `idPuesto` FOREIGN KEY (`id_puesto`) REFERENCES `puestos` (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Daniel','Hernández','Guatemala','12345678','123456789369','0980-01-01',1,'2023-01-01','2023-01-01',2),(2,'Sofía','Gómez','Mexico','87654321','8765432103562','1990-05-15',2,'2022-05-15','2022-05-15',1),(3,'Luis','Alvarado','Pamana','54321678','5432167893653','1975-11-20',3,'2021-11-20','2021-11-20',2),(4,'Pedro','	Rodríguez','Brasil','98765432	','9876543211244','1995-08-05',4,'2023-08-05','2023-08-05',2),(5,'Laura','López','Avenida Secundaria','12345678','1234567895785','1985-03-10',5,'2020-03-10','2020-03-10',1),(6,'Orlando','	Sánchez','Colonia Residencial','87654321','8765432104826','2000-12-25',6,'2022-12-25','2022-12-25',2),(7,'Jose','Pérez','Barrio Popular','54321678','5432167890127','1970-07-04',7,'2021-07-04','2021-07-04',2),(8,'Isaias','García','Conjunto Habitacional','98765432','987654321028','1992-02-18',8,'2023-02-18','2023-02-18',2),(9,'Marcos','	Martínez','Condominio Residencial','12345678','1234567898819','1988-09-23',9,'2020-09-23','2020-09-23',2),(23,'carlos','carlos','11111','11111','11111','0111-01-01',8,'0111-01-01','1111-01-01',2);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id_genero` int NOT NULL AUTO_INCREMENT,
  `genero` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'FEMENINO'),(2,'MASCULINO');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `id_marca` smallint NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Hp / hewlett-packard'),(2,'Xaomi'),(3,'Dell'),(4,'Lenovo'),(5,'Asus'),(6,'Samsung'),(7,'Predator'),(8,'Apple'),(9,'oppo'),(10,'Infinity');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `producto` varchar(50) DEFAULT NULL,
  `id_marca` smallint DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `imagen` varchar(30) DEFAULT NULL,
  `precio_costo` decimal(8,2) DEFAULT NULL,
  `precio_venta` decimal(8,2) DEFAULT NULL,
  `existencia` int DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `idMarca_idx` (`producto`),
  KEY `idMarca_idx1` (`id_marca`),
  CONSTRAINT `idMarca` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Webcam Logitech',NULL,'Full Hd','logitech_c920.jpg',650.00,700.00,25,'2024-10-12 09:00:00'),(2,'Teclado mecánico Logitech ',NULL,'Inalambrico','logitech_g915.jpg',350.00,500.00,20,'2024-10-13 00:00:00'),(3,'Smartphone Samsung Galaxy ',NULL,'5G camara tripe','laptop_hp.jpg',5000.00,7000.00,100,'2024-10-14 00:00:00'),(4,'Ratón Razer DeathAdder ',NULL,'Dpi ergonomico','razer_deathadder.jpg',150.00,300.00,300,'2024-10-15 00:00:00'),(5,'Monitor Dell UltraSharp',NULL,'4k hdr','dell_ultrasharp.jpg',1500.00,1800.00,50,'2024-10-16 00:00:00'),(6,'Laptop HP Pavilion',NULL,'Portatil','laptop_hp.jpg',6000.00,9000.00,60,'2024-10-17 00:00:00'),(7,'Impresora Epson EcoTank',NULL,'Multifuncional ','epson_ecotank.jpg',2000.00,4500.00,80,'2024-10-18 00:00:00'),(8,'Disco duro externo WD Elements',NULL,'2TB','wd_elements.jpg',500.00,750.00,50,'2024-10-19 00:00:00'),(9,'Auriculares ',NULL,'Bluetooth ','sony_wh1000xm4',400.00,500.00,60,'2024-10-20 00:00:00');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `proveedor` varchar(60) DEFAULT NULL,
  `nit` varchar(12) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (101,'Acme','123456','Guatemala ','98765432'),(102,'Beta Suples','87654321-0','Mexico','87654321'),(103,'Gamma Industries','54321678-9','Pamana','54321678'),(104,'Eta Electronics','111222333-4','Ciudad de la Electrónica','11122233'),(105,'Theta Solutions','444555666-7','Edificio Corporativo','44455566'),(106,'Zeta Components','98765432-1','Parque Industrial','98765432'),(107,'Iota Services','777888999-0','Torre Empresarial, Zona VIP','77788899'),(108,'Lambda Materials','222111000-2','Zona de Materiales','22211100'),(111,'SOCIEDAD ANONIMA','AAA','3333','33333');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puestos` (
  `id_puesto` smallint NOT NULL AUTO_INCREMENT,
  `puesto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` VALUES (1,'GERENTE GENERAL'),(2,'CONTADOR'),(3,'VENDEDOR'),(4,'BODEGUERO'),(5,'IT SUPPORT'),(6,'INGENIERO'),(7,'REPARTIDOR'),(8,'SUPERVISOR'),(9,'ASISTENTE CONTABLE'),(32,'MOTORISTA');
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `id_empleado` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `idEmpleado_idx` (`id_empleado`),
  CONSTRAINT `idEmpleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','admin',1),(3,'user1','user1',3),(20,'user1','userl',2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `no_factura` int DEFAULT NULL,
  `serie` char(1) DEFAULT NULL,
  `fecha_factura` date DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_empleado` int DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `idCliente_idx` (`id_cliente`),
  KEY `empleado_idx` (`id_empleado`),
  CONSTRAINT `cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1001,'A','2024-11-15',NULL,NULL,NULL),(2,1002,'A','2024-11-16',NULL,NULL,NULL),(3,1003,'A','2024-11-17',NULL,NULL,NULL),(4,1004,'A','2024-11-18',NULL,NULL,NULL),(5,1005,'A','2024-11-19',NULL,NULL,NULL),(6,1006,'A','2024-11-20',NULL,NULL,NULL),(7,1007,'A','2024-11-21',NULL,NULL,NULL),(8,1008,'A','2024-11-22',NULL,NULL,NULL),(9,1009,'A','2024-11-23',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_detalle`
--

DROP TABLE IF EXISTS `ventas_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_detalle` (
  `id_venta_detalle` bigint NOT NULL,
  `id_venta` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio_unitario` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_venta_detalle`),
  KEY `idventa_idx` (`id_venta`),
  KEY `idproducto_idx` (`id_producto`),
  CONSTRAINT `producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `venta` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_detalle`
--

LOCK TABLES `ventas_detalle` WRITE;
/*!40000 ALTER TABLE `ventas_detalle` DISABLE KEYS */;
INSERT INTO `ventas_detalle` VALUES (1,NULL,NULL,2,600.00),(2,NULL,NULL,1,800.00),(3,NULL,NULL,3,250.00),(4,NULL,NULL,1,785.00),(5,NULL,NULL,2,299.99),(6,NULL,NULL,4,79.99),(7,NULL,NULL,1,379.99),(8,NULL,NULL,2,70.00),(9,NULL,NULL,3,99.99);
/*!40000 ALTER TABLE `ventas_detalle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-08 17:15:44
