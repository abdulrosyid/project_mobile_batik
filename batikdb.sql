CREATE DATABASE  IF NOT EXISTS `batik` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `batik`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: batik
-- ------------------------------------------------------
-- Server version	5.6.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `method_payment`
--

DROP TABLE IF EXISTS `method_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `method_payment` (
  `method_paypk` int(15) NOT NULL AUTO_INCREMENT,
  `method_paydesc` varchar(45) NOT NULL,
  `create_user` int(15) NOT NULL,
  `create_date` date NOT NULL,
  `change_user` int(15) DEFAULT NULL,
  `change_date` date DEFAULT NULL,
  PRIMARY KEY (`method_paypk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `method_payment`
--

LOCK TABLES `method_payment` WRITE;
/*!40000 ALTER TABLE `method_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `method_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `order_detailpk` int(15) NOT NULL AUTO_INCREMENT,
  `orderfk` int(15) NOT NULL,
  `produkfk` int(15) NOT NULL,
  `qty` int(25) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `isdelete` int(1) NOT NULL COMMENT '0 = delete, 1 = Add',
  PRIMARY KEY (`order_detailpk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_header`
--

DROP TABLE IF EXISTS `order_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_header` (
  `orderpk` int(15) NOT NULL AUTO_INCREMENT,
  `qty_total` int(25) NOT NULL,
  `total_payment` decimal(10,0) NOT NULL,
  `method_payfk` int(15) NOT NULL,
  `userfk` int(15) NOT NULL,
  `statusfk` int(15) NOT NULL,
  `create_date` date NOT NULL,
  PRIMARY KEY (`orderpk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_header`
--

LOCK TABLES `order_header` WRITE;
/*!40000 ALTER TABLE `order_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_status` (
  `statuspk` int(15) NOT NULL AUTO_INCREMENT,
  `status_desc` varchar(45) NOT NULL,
  `create_user` int(15) NOT NULL,
  `create_date` date NOT NULL,
  `change_user` int(15) DEFAULT NULL,
  `change_date` date DEFAULT NULL,
  PRIMARY KEY (`statuspk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produk`
--

DROP TABLE IF EXISTS `produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produk` (
  `produkpk` int(15) NOT NULL AUTO_INCREMENT,
  `code` varchar(25) NOT NULL,
  `produk_desc` varchar(45) NOT NULL,
  `qty_ready_to_sale` int(15) NOT NULL DEFAULT '0',
  `qty_transit` int(15) NOT NULL DEFAULT '0',
  `qty` int(15) NOT NULL DEFAULT '0',
  `price_modal` decimal(10,0) NOT NULL DEFAULT '0',
  `price_sale` decimal(10,0) NOT NULL DEFAULT '0',
  `kategorifk` int(15) NOT NULL,
  `kategorisubfk` int(15) NOT NULL,
  `create_user` int(15) NOT NULL,
  `create_date` date NOT NULL,
  `change_user` int(15) DEFAULT NULL,
  `change_date` date DEFAULT NULL,
  PRIMARY KEY (`produkpk`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produk`
--

LOCK TABLES `produk` WRITE;
/*!40000 ALTER TABLE `produk` DISABLE KEYS */;
/*!40000 ALTER TABLE `produk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produk_kategori`
--

DROP TABLE IF EXISTS `produk_kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produk_kategori` (
  `kategoripk` int(15) NOT NULL AUTO_INCREMENT,
  `code` varchar(15) NOT NULL,
  `kategori_desc` varchar(45) NOT NULL,
  `create_user` int(15) NOT NULL,
  `create_date` date NOT NULL,
  `change_user` int(15) DEFAULT NULL,
  `change_date` date DEFAULT NULL,
  PRIMARY KEY (`kategoripk`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produk_kategori`
--

LOCK TABLES `produk_kategori` WRITE;
/*!40000 ALTER TABLE `produk_kategori` DISABLE KEYS */;
/*!40000 ALTER TABLE `produk_kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produk_kategorisub`
--

DROP TABLE IF EXISTS `produk_kategorisub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produk_kategorisub` (
  `kategorisubpk` int(11) NOT NULL AUTO_INCREMENT,
  `kategorifk` varchar(15) NOT NULL,
  `code` varchar(15) NOT NULL,
  `kategorisub_desc` varchar(45) NOT NULL,
  `create_user` int(15) NOT NULL,
  `create_date` date NOT NULL,
  `change_user` int(15) DEFAULT NULL,
  `change_date` date DEFAULT NULL,
  PRIMARY KEY (`kategorisubpk`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produk_kategorisub`
--

LOCK TABLES `produk_kategorisub` WRITE;
/*!40000 ALTER TABLE `produk_kategorisub` DISABLE KEYS */;
/*!40000 ALTER TABLE `produk_kategorisub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userpk` int(15) NOT NULL,
  `user_code` varchar(15) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `create_user` varchar(15) NOT NULL COMMENT 'user yang membuat user baru',
  `isactive` int(1) NOT NULL DEFAULT '0' COMMENT '0 = Non Active, 1 = Active, 2 = Block',
  `create_date` date NOT NULL,
  `change_user` varchar(15) DEFAULT NULL COMMENT 'Tanggal Perubahan ato edit user',
  `change_date` date DEFAULT NULL,
  PRIMARY KEY (`userpk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-29 15:52:57
