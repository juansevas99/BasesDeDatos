-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: inventario_3_1
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `atributo`
--

DROP TABLE IF EXISTS `atributo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atributo` (
  `id_atributo` int NOT NULL AUTO_INCREMENT,
  `nombre_atributo` varchar(45) NOT NULL,
  `medida_id_medida` int DEFAULT NULL,
  PRIMARY KEY (`id_atributo`),
  UNIQUE KEY `nombre_atributo` (`nombre_atributo`),
  KEY `fk_atributo_medida1_idx` (`medida_id_medida`),
  CONSTRAINT `fk_atributo_medida1` FOREIGN KEY (`medida_id_medida`) REFERENCES `medida` (`id_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atributo`
--

LOCK TABLES `atributo` WRITE;
/*!40000 ALTER TABLE `atributo` DISABLE KEYS */;
INSERT INTO `atributo` VALUES (7,'espacio RAM',1),(8,'tamaño pantalla',7),(9,'espacio dico duro',1),(10,'resolucion de camara',4),(11,'Tinta',NULL),(12,'Alcance bluetooth',6);
/*!40000 ALTER TABLE `atributo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nombre_categoria_UNIQUE` (`nombre_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (8,'Camara'),(9,'Celular'),(5,'Computador Desktop '),(1,'computador portatil'),(7,'Impresora'),(2,'mouse'),(3,'Pantalla Desktop PC'),(4,'Pantalla Plasma TV'),(6,'Teclado');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_has_atributo`
--

DROP TABLE IF EXISTS `categoria_has_atributo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_has_atributo` (
  `categoria_id_categoria` int NOT NULL,
  `atributo_id_atributo` int NOT NULL,
  PRIMARY KEY (`categoria_id_categoria`,`atributo_id_atributo`),
  KEY `fk_categoria_has_atributo_atributo1_idx` (`atributo_id_atributo`),
  KEY `fk_categoria_has_atributo_categoria1_idx` (`categoria_id_categoria`),
  CONSTRAINT `fk_categoria_has_atributo_atributo1` FOREIGN KEY (`atributo_id_atributo`) REFERENCES `atributo` (`id_atributo`),
  CONSTRAINT `fk_categoria_has_atributo_categoria1` FOREIGN KEY (`categoria_id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_has_atributo`
--

LOCK TABLES `categoria_has_atributo` WRITE;
/*!40000 ALTER TABLE `categoria_has_atributo` DISABLE KEYS */;
INSERT INTO `categoria_has_atributo` VALUES (1,7),(3,7),(5,7),(9,7),(1,8),(3,8),(5,8),(9,8),(1,9),(3,9),(5,9),(1,10),(3,10),(5,10),(8,10),(9,10),(7,11),(1,12),(2,12),(3,12),(5,12),(6,12),(9,12);
/*!40000 ALTER TABLE `categoria_has_atributo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_entradas`
--

DROP TABLE IF EXISTS `detalle_entradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_entradas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_creacion` datetime NOT NULL,
  `cantidad` int NOT NULL,
  `observaciones` varchar(250) DEFAULT NULL,
  `id_orden_compra` int NOT NULL,
  `tipos_entrada_id_tipos_entrada` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_entradas_OrdenCompra1_idx` (`id_orden_compra`),
  KEY `fk_detalle_entradas_tipos_entrada1_idx` (`tipos_entrada_id_tipos_entrada`),
  CONSTRAINT `fk_detalle_entradas_OrdenCompra1` FOREIGN KEY (`id_orden_compra`) REFERENCES `ordencompra` (`id_oden_compra`),
  CONSTRAINT `fk_detalle_entradas_tipos_entrada1` FOREIGN KEY (`tipos_entrada_id_tipos_entrada`) REFERENCES `tipos_entrada` (`id_tipos_entrada`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_entradas`
--

LOCK TABLES `detalle_entradas` WRITE;
/*!40000 ALTER TABLE `detalle_entradas` DISABLE KEYS */;
INSERT INTO `detalle_entradas` VALUES (7,'2021-10-30 00:00:00',43,'Se aprueba Orden compra, llega producto y se crea entrada',12,1),(8,'2021-11-30 00:00:00',3,'Se crea una devolucion de venta por mal calidad del producto ya que no estaba bien empacado',12,2),(9,'2021-11-30 00:00:00',1,'Se crea una devolucion de venta por mal calidad del producto ya que nocumplia conlas expectativas del cliente',12,2),(10,'2021-11-30 00:00:00',45,'Se aprueba Orden compra, llega producto y se crea entrada',13,1),(11,'2021-11-30 00:00:00',2,'Se devuelve producto por queja del cliente, no especifica',13,2),(12,'2021-11-30 00:00:00',35,'Se aprueba Orden compra, llega producto y se crea entrada',14,1),(13,'2021-12-30 00:00:00',54,'Se aprueba Orden compra, llega producto y se crea entrada',15,1),(14,'2021-12-31 00:00:00',43,'Se aprueba Orden compra, llega producto y se crea entrada',16,1),(15,'2021-12-31 00:00:00',4,'Se aprueba Orden compra, llega producto y se crea entrada',27,1),(16,'2022-01-01 00:00:00',5,'Se aprueba Orden compra, llega producto y se crea entrada',28,1),(17,'2022-01-01 00:00:00',5,'Se aprueba Orden compra, llega producto y se crea entrada',29,1),(18,'2022-01-01 00:00:00',5,'Se aprueba Orden compra, llega producto y se crea entrada',30,1),(19,'2022-01-01 00:00:00',83,'Se aprueba Orden compra, llega producto y se crea entrada',31,1),(20,'2022-02-01 00:00:00',50,'Se queja cliente, se devuelve venta',15,2),(21,'2022-01-02 00:00:00',40,'Se queja cliente, se devuelve venta',16,2);
/*!40000 ALTER TABLE `detalle_entradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `nombre_estado` varchar(45) NOT NULL,
  PRIMARY KEY (`id_estado`),
  UNIQUE KEY `nombre_estado_UNIQUE` (`nombre_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'activo'),(2,'inactivado');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_marca`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (4,'ASER'),(1,'ASUS'),(2,'CLARO'),(6,'EPSON'),(7,'HP'),(5,'LENOVO'),(3,'SAMSUNG');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medida`
--

DROP TABLE IF EXISTS `medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medida` (
  `id_medida` int NOT NULL AUTO_INCREMENT,
  `nombre_medida` varchar(20) NOT NULL,
  PRIMARY KEY (`id_medida`),
  UNIQUE KEY `nombre_medida` (`nombre_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medida`
--

LOCK TABLES `medida` WRITE;
/*!40000 ALTER TABLE `medida` DISABLE KEYS */;
INSERT INTO `medida` VALUES (5,'CM'),(1,'GB'),(3,'KG'),(2,'MB'),(6,'MT'),(7,'PG'),(4,'PIXELES');
/*!40000 ALTER TABLE `medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordencompra`
--

DROP TABLE IF EXISTS `ordencompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordencompra` (
  `id_oden_compra` int NOT NULL AUTO_INCREMENT,
  `referencia_entradas` varchar(45) NOT NULL,
  `lote_entradas` varchar(45) NOT NULL,
  `cantidad` int NOT NULL,
  `precioUnitario` decimal(10,2) NOT NULL,
  `fecha_creacion_entrada` datetime NOT NULL,
  `producto_id_producto` int NOT NULL,
  `proveedor_id_proveedor` int NOT NULL,
  PRIMARY KEY (`id_oden_compra`),
  UNIQUE KEY `referencia_entradas_UNIQUE` (`referencia_entradas`),
  UNIQUE KEY `lote_entradas_UNIQUE` (`lote_entradas`),
  KEY `fk_entradas_producto1_idx` (`producto_id_producto`),
  KEY `fk_entradas_proveedor1_idx` (`proveedor_id_proveedor`),
  CONSTRAINT `fk_entradas_producto1` FOREIGN KEY (`producto_id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `fk_entradas_proveedor1` FOREIGN KEY (`proveedor_id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordencompra`
--

LOCK TABLES `ordencompra` WRITE;
/*!40000 ALTER TABLE `ordencompra` DISABLE KEYS */;
INSERT INTO `ordencompra` VALUES (12,'3436567657_1','201235',43,1000.00,'2020-05-02 00:00:00',1,1),(13,'3436567234_2','201237',45,5220.00,'2020-12-05 00:00:00',1,2),(14,'3436786577_5','201254',35,200.00,'2020-05-03 00:00:00',6,3),(15,'5326356657_7','3425345',54,8451.00,'2020-05-04 00:00:00',6,2),(16,'4436567657_1','3464766',43,784000.00,'2020-12-06 00:00:00',6,1),(27,'315875445_4','3023566',4,400000.00,'2021-05-02 00:00:00',3,3),(28,'3436567237_2','208237',5,12250.00,'2021-12-05 00:00:00',3,1),(29,'315151814_8','81518',5,1200.00,'2021-05-03 00:00:00',4,1),(30,'3187951814_9','991212',5,96000.00,'2021-05-04 00:00:00',6,1),(31,'915515154_8','123456',83,784000.00,'2021-12-06 00:00:00',2,2);
/*!40000 ALTER TABLE `ordencompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `referencia_producto` varchar(45) NOT NULL,
  `nombre_producto` varchar(45) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `estado_id_estado` int NOT NULL,
  `categoria_id_categoria` int NOT NULL,
  `stock_producto` int NOT NULL,
  `proveedor_id_proveedor` int NOT NULL,
  `marca_id_marca` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `referencia_producto_UNIQUE` (`referencia_producto`),
  KEY `fk_producto_estado_idx` (`estado_id_estado`),
  KEY `fk_producto_categoria1_idx` (`categoria_id_categoria`),
  KEY `fk_producto_proveedor1_idx` (`proveedor_id_proveedor`),
  KEY `fk_producto_marca1_idx` (`marca_id_marca`),
  CONSTRAINT `fk_producto_categoria1` FOREIGN KEY (`categoria_id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `fk_producto_estado` FOREIGN KEY (`estado_id_estado`) REFERENCES `estado` (`id_estado`),
  CONSTRAINT `fk_producto_marca1` FOREIGN KEY (`marca_id_marca`) REFERENCES `marca` (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'649621581','Computador Lenovo Modelo I','2020-02-28 00:00:00',1,1,52,1,5),(2,'68451514','Computador Lenovo Modelo II','2020-02-29 00:00:00',1,1,5,1,5),(3,'564984515','Computador HUL','2010-02-20 00:00:00',1,1,87,2,4),(4,'98529615','Impresora multicolor','2020-11-28 00:00:00',1,7,52,3,6),(6,'941518151','Pantalla  HP SKI','2020-02-28 00:00:00',1,3,7,1,5);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `documento` varchar(14) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `documento` (`documento`),
  UNIQUE KEY `nombre_proveedor` (`nombre_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'CLARO','proveeCel@claro.com.co','9451851245','312564859'),(2,'Samsung','samsung@gmail.com','94515151','312548649'),(3,'TECH','ptech@tech.com.co','94518152',NULL),(4,'SIMS','SistemasMantenimeito@sims.com','97451846','5636789'),(5,'LINEA_1','linea@gmail.com.co','9652584532',NULL),(6,'ChallengeTEch','desafioColombia@gmail.com','987894121','3124579531');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL,
  `rol` varchar(45) NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `rol_UNIQUE` (`rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salidas`
--

DROP TABLE IF EXISTS `salidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salidas` (
  `id_salidas` int NOT NULL AUTO_INCREMENT,
  `referencia_salidas` varchar(45) NOT NULL,
  `cantidad_salidas` int NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `id_tipo_salida` int NOT NULL,
  `id_orden_compra` int NOT NULL,
  PRIMARY KEY (`id_salidas`),
  UNIQUE KEY `referencia_salidas_UNIQUE` (`referencia_salidas`),
  KEY `fk_salidas_tipo_salida1_idx` (`id_tipo_salida`),
  KEY `fk_salidas_OrdenCompra1_idx` (`id_orden_compra`),
  CONSTRAINT `fk_salidas_OrdenCompra1` FOREIGN KEY (`id_orden_compra`) REFERENCES `ordencompra` (`id_oden_compra`),
  CONSTRAINT `fk_salidas_tipo_salida1` FOREIGN KEY (`id_tipo_salida`) REFERENCES `tipo_salida` (`id_tipo_salida`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salidas`
--

LOCK TABLES `salidas` WRITE;
/*!40000 ALTER TABLE `salidas` DISABLE KEYS */;
INSERT INTO `salidas` VALUES (6,'234245345',1,'2020-12-31 00:00:00',1,12),(7,'3454645664',1,'2020-11-30 00:00:00',1,12),(8,'25346546',4,'2020-12-31 00:00:00',1,12),(9,'234567567',4,'2021-01-01 00:00:00',1,12),(10,'56789098',3,'2021-03-10 00:00:00',1,12),(11,'554541351',33,'2021-04-10 00:00:00',1,12),(12,'988156158',5,'2021-05-11 00:00:00',1,13),(13,'95254515',5,'2021-05-21 00:00:00',2,13),(16,'98581815',7,'2021-05-22 00:00:00',1,13),(17,'98265185215',2,'2021-05-22 00:00:00',1,13),(19,'92618151',13,'2021-05-22 00:00:00',3,13),(21,'282651852_7',13,'2021-05-22 00:00:00',4,13),(35,'987562665_2',35,'2020-12-31 00:00:00',1,14),(36,'95258169_4',2,'2020-11-30 00:00:00',1,15),(37,'3519613251_6',52,'2020-12-31 00:00:00',1,15),(38,'35435151_2',43,'2021-01-01 00:00:00',1,16),(39,'65135151_3',3,'2021-03-10 00:00:00',1,27),(40,'65184515_6',1,'2021-04-10 00:00:00',3,27),(41,'68431684_7',1,'2021-05-11 00:00:00',1,28),(42,'56413513_7',4,'2021-05-21 00:00:00',1,28),(43,'365153186_8',5,'2021-05-22 00:00:00',1,29),(44,'651813_5',3,'2021-05-22 00:00:00',3,30),(45,'356845154_7',10,'2021-05-22 00:00:00',2,31),(46,'6581864585_0',70,'2021-05-22 00:00:00',3,31),(47,'6581864515_0',3,'2021-05-22 00:00:00',1,31);
/*!40000 ALTER TABLE `salidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_salida`
--

DROP TABLE IF EXISTS `tipo_salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_salida` (
  `id_tipo_salida` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo_salida` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_salida`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_salida`
--

LOCK TABLES `tipo_salida` WRITE;
/*!40000 ALTER TABLE `tipo_salida` DISABLE KEYS */;
INSERT INTO `tipo_salida` VALUES (1,'Venta'),(2,'TRanslado'),(3,'Devolucion de compra'),(4,'Devolucion de almacen'),(5,'Perdido'),(6,'Dañado'),(7,'Pasado');
/*!40000 ALTER TABLE `tipo_salida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_entrada`
--

DROP TABLE IF EXISTS `tipos_entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_entrada` (
  `id_tipos_entrada` int NOT NULL,
  `nomnre_tipos_entrada` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipos_entrada`),
  UNIQUE KEY `nomnre_tipos_entrada_UNIQUE` (`nomnre_tipos_entrada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_entrada`
--

LOCK TABLES `tipos_entrada` WRITE;
/*!40000 ALTER TABLE `tipos_entrada` DISABLE KEYS */;
INSERT INTO `tipos_entrada` VALUES (3,'Devolucion almacen'),(2,'Devolucion de venta'),(1,'Orden Compra'),(4,'Orden de compra a credito');
/*!40000 ALTER TABLE `tipos_entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `usuario` varchar(10) NOT NULL,
  `correo` varchar(220) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  UNIQUE KEY `correo_UNIQUE` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'JUGA','juansevas992010@gmail.com','123456789');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_has_rol`
--

DROP TABLE IF EXISTS `usuario_has_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_has_rol` (
  `usuario_id_usuario` int NOT NULL,
  `rol_id_rol` int NOT NULL,
  PRIMARY KEY (`usuario_id_usuario`,`rol_id_rol`),
  KEY `fk_usuario_has_rol_rol1_idx` (`rol_id_rol`),
  KEY `fk_usuario_has_rol_usuario1_idx` (`usuario_id_usuario`),
  CONSTRAINT `fk_usuario_has_rol_rol1` FOREIGN KEY (`rol_id_rol`) REFERENCES `rol` (`id_rol`),
  CONSTRAINT `fk_usuario_has_rol_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_has_rol`
--

LOCK TABLES `usuario_has_rol` WRITE;
/*!40000 ALTER TABLE `usuario_has_rol` DISABLE KEYS */;
INSERT INTO `usuario_has_rol` VALUES (1,1);
/*!40000 ALTER TABLE `usuario_has_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valor`
--

DROP TABLE IF EXISTS `valor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valor` (
  `atributo_id_atributo` int NOT NULL,
  `producto_id_producto` int NOT NULL,
  `valor` varchar(45) NOT NULL,
  PRIMARY KEY (`atributo_id_atributo`,`producto_id_producto`),
  KEY `fk_atributo_has_producto_producto1_idx` (`producto_id_producto`),
  KEY `fk_atributo_has_producto_atributo1_idx` (`atributo_id_atributo`),
  CONSTRAINT `fk_atributo_has_producto_atributo1` FOREIGN KEY (`atributo_id_atributo`) REFERENCES `atributo` (`id_atributo`),
  CONSTRAINT `fk_atributo_has_producto_producto1` FOREIGN KEY (`producto_id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valor`
--

LOCK TABLES `valor` WRITE;
/*!40000 ALTER TABLE `valor` DISABLE KEYS */;
INSERT INTO `valor` VALUES (7,1,'4'),(7,6,'23'),(8,1,'30'),(8,6,'50'),(9,1,'750'),(9,6,'10'),(10,1,'600'),(10,6,'2000'),(12,1,'10'),(12,6,'10');
/*!40000 ALTER TABLE `valor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-18 15:18:47
