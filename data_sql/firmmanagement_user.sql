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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Updated Name','testuser','scrypt:32768:8:1$cLIP36Hpopfpg3vn$5d16bde95a89378c88c000e1d8c52bb6d4ca1f2fd41c4ed5c54299b8686a74eb5adc980ee4b43b3bad7546be015d7559f327988e2b9f2a291a16bc9b7c082c29','0987654321','updated@example.com','user',1),(4,'huypro37','user','scrypt:32768:8:1$ajZjnyx8nKGQDCKb$689e566c7a10afdaaaa28bd758035bcced0031dcfd53fe5a376fee10f06b0032227e09063adcfea25ac2cb19172fd78b8cc366dc1e2ee6c5509ea385059c14ae','ghmk@gmail.com','0258963147','user',0),(5,'Updated Name','user123','scrypt:32768:8:1$svOjY34Kkrd1ZjLn$8b9a8e180102f92f76da2e3699b04bdc486e86333d5a87f22e5fc26b62ede431a8defef52816b363624e1f530f8e06375b0973c51fe41c77df3aa926e2ec214f','098765654321','updatedd@axaaample.com','user',0),(7,'yasua oh','admin','scrypt:32768:8:1$VzsWb2ZHgM8LsX3l$3d01785db320580b6d50c666bb65a520f0d7dba860c3d8612864fa2c50915c10e0fc5f65b3497e5613b8a7e078cc8463816e5cdb2e388d20d386c445e9113943','huypro@gmail.com','0357864786','admin',0),(8,'Cao Thanh Huy','usa','scrypt:32768:8:1$QY86BffCGh0F0eP0$a333e987345d5d34368ee6aca29a5760dbe888a22c833e777d649aae6f8ba0c58b7677d6bd02097b30bbbbdf490f1c2d53ee9885ba4a0ef57dc8277d9d77563c','0123456789','testus2dfser@fexample.com','user',0),(9,'yasua oh','yasua','scrypt:32768:8:1$fEGZguNtDPVt8KYo$a34121a2b1905edc647afc169d3dc0668d8d23ff6ca2cc99e9722a1a585134ae9336b8f3496b3e794865485b5657315e10746a760b1685d4f2fa6b53b37422ae','hello@gmail.com','0123456987','user',1),(10,'togia','togia123','scrypt:32768:8:1$MgVSqiIt6UdtG88N$8574329b88db5bfed6f134322fcc9e4d6bc14db971cf439e099403c96a89626ee442c3420cc2dc9297307219c09e16c85c7db2a3c95a7f1f9055d875667e30ea','0147896325','test@emple.com','user',1),(11,'panda','panda','scrypt:32768:8:1$RIkAFGyc6dXDdCsM$e433b4cda7d85b1f27a88352d05f6e480d4655bb6f98b1d1ebdb3bb0d9f2d35383061384d25c6ecd7529f31696af51ee72fe4ccbb8d5417c96e4c95967158c9a','panda@gmail.com','0147852369','user',0);
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

-- Dump completed on 2025-06-27 11:14:44
