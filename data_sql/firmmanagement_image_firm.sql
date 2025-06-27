-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: firmmanagement
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `image_firm`
--

DROP TABLE IF EXISTS `image_firm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_firm` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FirmID` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FirmID` (`FirmID`),
  CONSTRAINT `image_firm_ibfk_1` FOREIGN KEY (`FirmID`) REFERENCES `firm` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_firm`
--

LOCK TABLES `image_firm` WRITE;
/*!40000 ALTER TABLE `image_firm` DISABLE KEYS */;
INSERT INTO `image_firm` VALUES (1,1,'http://example.com/image1.jpg'),(2,1,'http://example.com/image2.jpg'),(3,2,'http://example.com/image1.jpg'),(4,2,'http://example.com/image2.jpg'),(7,3,'https://static.episodate.com/images/episode/23455-225.png'),(8,3,'https://static.episodate.com/images/episode/23455-861.png'),(9,3,'https://static.episodate.com/images/episode/23455-218.png'),(10,3,'https://static.episodate.com/images/episode/23455-432.png'),(11,3,'https://static.episodate.com/images/episode/23455-577.png'),(12,3,'https://static.episodate.com/images/episode/23455-491.png'),(13,3,'https://static.episodate.com/images/episode/23455-167.png'),(14,4,'https://static.episodate.com/images/episode/29560-242.jpg'),(15,4,'https://static.episodate.com/images/episode/29560-804.jpg'),(16,4,'https://static.episodate.com/images/episode/29560-664.jpg'),(17,4,'https://static.episodate.com/images/episode/29560-120.jpg'),(18,4,'https://static.episodate.com/images/episode/29560-764.jpg'),(19,4,'https://static.episodate.com/images/episode/29560-792.jpg'),(20,4,'https://static.episodate.com/images/episode/29560-159.jpg'),(21,5,'https://static.episodate.com/images/episode/35624-559.jpg'),(22,5,'https://static.episodate.com/images/episode/35624-973.jpg'),(23,5,'https://static.episodate.com/images/episode/35624-201.jpg'),(24,5,'https://static.episodate.com/images/episode/35624-783.jpg'),(25,5,'https://static.episodate.com/images/episode/35624-130.jpg'),(26,5,'https://static.episodate.com/images/episode/35624-551.jpg'),(27,5,'https://static.episodate.com/images/episode/35624-620.jpg'),(28,6,'http://example.com/image1.jpg'),(29,6,'http://example.com/image2.jpg'),(30,7,'http://example.com/image1.jpg'),(31,7,'http://example.com/image2.jpg'),(32,8,'http://example.com/image1.jpg'),(33,8,'http://example.com/image2.jpg'),(34,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828159/lqtunb5czsejbverv8n8.jpg'),(35,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828159/feh206rs7mgpzcivw2pt.jpg'),(36,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828159/farprr1d8cyi7gk8gwrg.jpg'),(37,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828159/dhlwdhn2tjudsrdxv2ks.jpg'),(38,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828159/psdlsdrqnj2kvw3clhhm.jpg'),(39,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828159/iennobxbwb7bbxxrjvkc.jpg'),(40,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828159/zpwhiuhriprzdh4r0wee.jpg'),(41,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828164/okf3rld4nzuqs9rvc9ew.jpg'),(42,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828164/kzqq86ww9ic9gmpre179.jpg'),(43,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828164/hlavc5jttg6fff7yidhb.jpg'),(44,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828164/jnbhfycqgx3sqmwi4ash.jpg'),(45,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828164/t236bprdnz4g6jpytelz.jpg'),(46,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828164/b5vz7nvb91wrvijerdr3.jpg'),(47,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828165/b4oezmzf3qjgpjgjqiuk.jpg'),(48,10,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750830066/eyce3hm0cswfzlcwlgsn.jpg'),(49,10,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750830066/kgb8ivnnktepsqsxyy7j.jpg'),(50,10,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750830066/grxmkqojvguj9qeknwr0.jpg'),(51,10,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750830066/a94aphrjg7jbhzpfpcii.jpg'),(52,10,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750830066/lyy2x3cgi37xtuadhbxg.jpg'),(53,10,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750830066/x2l4aeskxxk145en4wmd.jpg'),(54,10,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750830066/hes1lpicunvxjdnnh17a.jpg'),(55,11,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750855971/gqulhbry3vyenjaytijy.jpg'),(56,11,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750855971/uzr2u7tbsawg7oxfyvgq.jpg'),(57,11,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750855971/h2bdharj6xfvibhrilwp.jpg'),(58,11,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750855971/qmsxelh6esnqcownn1bp.jpg'),(59,11,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750855971/qs2y42npzy8z4wizqanv.jpg'),(60,11,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750855972/tccqk5elpjghionslkx3.jpg'),(61,12,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750864139/z3vpb1l6bbtmeoezgrvr.jpg'),(62,12,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750864139/p96mvnnfymibnv0joqie.jpg'),(63,13,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750962600/tgca4fgeihheoy8yniv2.jpg'),(64,13,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750962600/vpqypeiry93mkss6hwhh.jpg'),(65,13,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750962600/bkvgt4nksnomhssvhx9s.webp');
/*!40000 ALTER TABLE `image_firm` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-27 11:14:44
