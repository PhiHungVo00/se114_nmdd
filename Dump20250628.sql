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
-- Table structure for table `broadcast`
--

DROP TABLE IF EXISTS `broadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `broadcast` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RoomID` int DEFAULT NULL,
  `FirmID` int DEFAULT NULL,
  `timeBroadcast` time DEFAULT NULL,
  `dateBroadcast` date DEFAULT NULL,
  `price` float DEFAULT NULL,
  `seats` int DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `RoomID` (`RoomID`),
  KEY `FirmID` (`FirmID`),
  CONSTRAINT `broadcast_ibfk_1` FOREIGN KEY (`RoomID`) REFERENCES `room` (`ID`),
  CONSTRAINT `broadcast_ibfk_2` FOREIGN KEY (`FirmID`) REFERENCES `firm` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broadcast`
--

LOCK TABLES `broadcast` WRITE;
/*!40000 ALTER TABLE `broadcast` DISABLE KEYS */;
INSERT INTO `broadcast` VALUES (1,1,1,'11:00:00','2025-10-11',120000,20,1),(2,1,1,'10:00:00','2025-10-11',100000,15,0),(3,1,1,'10:00:00','2025-10-12',100000,15,0),(4,1,1,'10:00:00','2025-10-13',100000,15,0),(5,2,1,'10:00:00','2025-10-10',100000,15,0),(6,2,4,'06:00:00','2025-10-10',100000,20,0),(7,2,4,'00:00:00','2025-10-10',100000,20,0),(8,2,4,'23:15:00','2025-10-10',100000,20,0),(9,3,4,'10:00:00','2025-10-10',100000,15,0),(10,3,4,'10:00:00','2025-10-11',100000,15,0),(11,3,4,'10:00:00','2025-10-12',100000,15,0),(12,3,4,'10:00:00','2025-10-13',100000,15,0),(13,3,4,'10:00:00','2025-10-14',100000,15,0),(14,3,4,'10:00:00','2025-10-15',100000,15,0),(15,3,3,'10:00:00','2025-09-10',100000,15,0),(16,3,3,'10:00:00','2025-09-11',100000,20,0),(17,3,3,'13:00:00','2025-09-11',100000,20,0),(18,3,3,'15:30:00','2025-09-11',100000,20,1),(19,2,5,'11:40:00','2025-07-08',80000,23,1),(20,2,4,'12:06:00','2025-07-11',70000,26,0),(21,2,5,'00:22:00','2025-07-12',80000,24,1),(22,2,5,'15:30:00','2025-07-04',80000,26,0),(23,7,9,'23:50:00','2025-07-10',80000,31,1),(24,2,10,'21:38:00','2025-06-26',80000,34,0),(25,7,12,'18:39:00','2025-07-04',80000,33,1),(26,2,11,'00:18:00','2025-07-11',90000,35,0),(27,2,3,'20:15:00','2025-06-28',80000,26,0);
/*!40000 ALTER TABLE `broadcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firm`
--

DROP TABLE IF EXISTS `firm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `firm` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `thumbnail_path` varchar(255) DEFAULT NULL,
  `rating_count` int DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `runtime` int DEFAULT '60',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firm`
--

LOCK TABLES `firm` WRITE;
/*!40000 ALTER TABLE `firm` DISABLE KEYS */;
INSERT INTO `firm` VALUES (1,'Updated Firm','This is an updated firm.','2023-01-01',NULL,'http://example.com/thumbnail.jpg',150,4.8,1,60),(2,'New second Firm','This is a new firm.','2023-01-01','2023-12-31','http://example.com/thumbnail.jpg',100,4.5,1,60),(3,'Game of Thrones','Nine noble families fight for control of the mythical land of Westeros. Political and sexual intrigue is pervasive. Robert Baratheon, King of Westeros, asks his old friend Eddard, Lord Stark, to serve as Hand of the King, or highest official. Secretly warned that the previous Hand was assassinated, Eddard accepts in order to investigate further. Meanwhile the Queen\'s family, the Lannisters, may be hatching a plot to take power. Across the sea, the last members of the previous and deposed ruling family, the Targaryens, are also scheming to regain the throne. The friction between the houses Stark, Lannister, Baratheon and Targaryen and with the remaining great houses Greyjoy, Tully, Arryn,Tyrell and Martell leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war and political confusion, a neglected military order of misfits, the Night\'s Watch, is all that stands between the realms of men and icy horrors beyond.','2011-04-17',NULL,'https://static.episodate.com/images/tv-show/thumbnail/23455.jpg',774,9.3992,0,60),(4,'Arrow','Arrow is an American television series developed by writer/producers Greg Berlanti, Marc Guggenheim, and Andrew Kreisberg. It is based on the DC Comics character Green Arrow, a costumed crime-fighter created by Mort Weisinger and George Papp. It premiered in North America on The CW on October 10, 2012, with international broadcasting taking place in late 2012. Primarily filmed in Vancouver, British Columbia, Canada, the series follows billionaire playboy Oliver Queen, portrayed by Stephen Amell, who, five years after being stranded on a hostile island, returns home to fight crime and corruption as a secret vigilante whose weapon of choice is a bow and arrow. Unlike in the comic books, Queen does not go by the alias \"Green Arrow\". The series takes a realistic look at the Green Arrow character, as well as other characters from the DC Comics universe. Although Oliver Queen/Green Arrow had been featured in the television series Smallville from 2006 to 2011, the producers decided to start clean and find a new actor (Amell) to portray the character. Arrow focuses on the humanity of Oliver Queen, and how he was changed by time spent shipwrecked on an island. Most episodes have flashback scenes to the five years in which Oliver was missing.','2012-10-10',NULL,'https://static.episodate.com/images/tv-show/thumbnail/29560.jpg',653,9.1057,0,60),(5,'The Flash','Barry Allen is a Central City police forensic scientist with a reasonably happy life, despite the childhood trauma of a mysterious red and yellow being killing his mother and framing his father. All that changes when a massive particle accelerator accident leads to Barry being struck by lightning in his lab. Coming out of coma nine months later, Barry and his new friends at STAR labs find that he now has the ability to move at superhuman speed. <br>Furthermore, Barry learns that he is but one of many affected by that event, most of whom are using their powers for evil. Determined to make a difference, Barry dedicates his life to fighting such threats, as The Flash. While he gains allies he never expected, there are also secret forces determined to aid and manipulate him for their own agenda.','2014-10-07',NULL,'https://static.episodate.com/images/tv-show/thumbnail/35624.jpg',663,9.35,0,60),(6,'New Firm1','This is a new firm.','2023-01-01','2023-12-31','http://example.com/thumbnail.jpg',100,4.5,1,60),(7,'New Firm2','This is a new firm.','2023-01-01','2023-12-31','http://example.com/thumbnail.jpg',100,4.5,1,60),(8,'New Firm3','This is a new firm.','2023-01-01','2023-12-31','http://example.com/thumbnail.jpg',100,4.5,1,60),(9,'c','c','2010-10-31','2030-10-30','http://res.cloudinary.com/dfu6ly3og/image/upload/v1750867887/ioarubvgwqfogo9y9cgw.jpg',3,3,1,3),(10,'DC\'s Legends of Tomorrow','When heroes alone are not enough... the world needs legends. Having seen the future, one he will desperately try to prevent from happening, time-traveling rogue Rip Hunter is tasked with assembling a disparate group of both heroes and villains to confront an unstoppable threat - one in which not only is the planet at stake, but all of time itself. Can this ragtag team defeat an immortal threat unlike anything they have ever known?','2016-01-21',NULL,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750830067/snodcrbtdjg7hhyotekh.jpg',347,8.9798,0,60),(11,'a','a','2025-06-10',NULL,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750855972/gdve9h3aotqqt88wletm.jpg',1,1,0,2),(12,'aaa','sdsa','2025-06-19','2025-10-08','https://res.cloudinary.com/dfu6ly3og/image/upload/v1750864139/n7rj5dfvvhe4dpo4ntya.jpg',12,2,1,60),(13,'phim yasua','Hi am yasua','2025-06-17','2025-08-22','http://res.cloudinary.com/dfu6ly3og/image/upload/v1751102374/y2sgulkqytndlzeaemyz.webp',80,8.5,1,60),(14,'starwar','aaa','2025-06-10',NULL,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1751102460/k3oeukundwa24cwxygrv.jpg',850,8.5,0,60);
/*!40000 ALTER TABLE `firm` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_firm`
--

LOCK TABLES `image_firm` WRITE;
/*!40000 ALTER TABLE `image_firm` DISABLE KEYS */;
INSERT INTO `image_firm` VALUES (1,1,'http://example.com/image1.jpg'),(2,1,'http://example.com/image2.jpg'),(3,2,'http://example.com/image1.jpg'),(4,2,'http://example.com/image2.jpg'),(7,3,'https://static.episodate.com/images/episode/23455-225.png'),(8,3,'https://static.episodate.com/images/episode/23455-861.png'),(9,3,'https://static.episodate.com/images/episode/23455-218.png'),(10,3,'https://static.episodate.com/images/episode/23455-432.png'),(11,3,'https://static.episodate.com/images/episode/23455-577.png'),(12,3,'https://static.episodate.com/images/episode/23455-491.png'),(13,3,'https://static.episodate.com/images/episode/23455-167.png'),(14,4,'https://static.episodate.com/images/episode/29560-242.jpg'),(15,4,'https://static.episodate.com/images/episode/29560-804.jpg'),(16,4,'https://static.episodate.com/images/episode/29560-664.jpg'),(17,4,'https://static.episodate.com/images/episode/29560-120.jpg'),(18,4,'https://static.episodate.com/images/episode/29560-764.jpg'),(19,4,'https://static.episodate.com/images/episode/29560-792.jpg'),(20,4,'https://static.episodate.com/images/episode/29560-159.jpg'),(21,5,'https://static.episodate.com/images/episode/35624-559.jpg'),(22,5,'https://static.episodate.com/images/episode/35624-973.jpg'),(23,5,'https://static.episodate.com/images/episode/35624-201.jpg'),(24,5,'https://static.episodate.com/images/episode/35624-783.jpg'),(25,5,'https://static.episodate.com/images/episode/35624-130.jpg'),(26,5,'https://static.episodate.com/images/episode/35624-551.jpg'),(27,5,'https://static.episodate.com/images/episode/35624-620.jpg'),(28,6,'http://example.com/image1.jpg'),(29,6,'http://example.com/image2.jpg'),(30,7,'http://example.com/image1.jpg'),(31,7,'http://example.com/image2.jpg'),(32,8,'http://example.com/image1.jpg'),(33,8,'http://example.com/image2.jpg'),(34,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828159/lqtunb5czsejbverv8n8.jpg'),(35,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828159/feh206rs7mgpzcivw2pt.jpg'),(36,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828159/farprr1d8cyi7gk8gwrg.jpg'),(37,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828159/dhlwdhn2tjudsrdxv2ks.jpg'),(38,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828159/psdlsdrqnj2kvw3clhhm.jpg'),(39,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828159/iennobxbwb7bbxxrjvkc.jpg'),(40,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828159/zpwhiuhriprzdh4r0wee.jpg'),(41,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828164/okf3rld4nzuqs9rvc9ew.jpg'),(42,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828164/kzqq86ww9ic9gmpre179.jpg'),(43,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828164/hlavc5jttg6fff7yidhb.jpg'),(44,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828164/jnbhfycqgx3sqmwi4ash.jpg'),(45,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828164/t236bprdnz4g6jpytelz.jpg'),(46,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828164/b5vz7nvb91wrvijerdr3.jpg'),(47,9,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750828165/b4oezmzf3qjgpjgjqiuk.jpg'),(48,10,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750830066/eyce3hm0cswfzlcwlgsn.jpg'),(49,10,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750830066/kgb8ivnnktepsqsxyy7j.jpg'),(50,10,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750830066/grxmkqojvguj9qeknwr0.jpg'),(51,10,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750830066/a94aphrjg7jbhzpfpcii.jpg'),(52,10,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750830066/lyy2x3cgi37xtuadhbxg.jpg'),(53,10,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750830066/x2l4aeskxxk145en4wmd.jpg'),(54,10,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750830066/hes1lpicunvxjdnnh17a.jpg'),(55,11,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750855971/gqulhbry3vyenjaytijy.jpg'),(56,11,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750855971/uzr2u7tbsawg7oxfyvgq.jpg'),(57,11,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750855971/h2bdharj6xfvibhrilwp.jpg'),(58,11,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750855971/qmsxelh6esnqcownn1bp.jpg'),(59,11,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750855971/qs2y42npzy8z4wizqanv.jpg'),(60,11,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750855972/tccqk5elpjghionslkx3.jpg'),(61,12,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750864139/z3vpb1l6bbtmeoezgrvr.jpg'),(62,12,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750864139/p96mvnnfymibnv0joqie.jpg'),(63,13,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750962600/tgca4fgeihheoy8yniv2.jpg'),(64,13,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750962600/vpqypeiry93mkss6hwhh.jpg'),(65,13,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750962600/bkvgt4nksnomhssvhx9s.webp'),(66,14,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1751102459/ix8vhzilaont9vg0javr.jpg'),(67,14,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1751102459/ezemrziuprtdm0y05qvm.jpg'),(68,14,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1751102459/lf8ixljiujalq1snxkdu.jpg'),(69,14,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1751102459/lesbrlomrtj6thsmz6tm.jpg'),(70,14,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1751102459/jetxxuei9xoe6vxb920c.jpg');
/*!40000 ALTER TABLE `image_firm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `seats` int DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'Room 55',25,1),(2,'Room 8',35,0),(3,'Room 1',26,0),(4,'Room 22',30,1),(5,'yasua',40,1),(6,'leesin',25,1),(7,'huypro',36,0),(8,'room 12',45,0);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `BroadcastID` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `roomID` int DEFAULT NULL,
  `is_bought` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `BroadcastID` (`BroadcastID`),
  KEY `roomID` (`roomID`),
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`BroadcastID`) REFERENCES `broadcast` (`ID`),
  CONSTRAINT `seat_ibfk_2` FOREIGN KEY (`roomID`) REFERENCES `room` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=514 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,4,'seat_1',0,1,1),(2,4,'seat_2',0,1,1),(3,4,'seat_3',0,1,0),(4,4,'seat_4',0,1,0),(5,4,'seat_5',0,1,1),(6,4,'seat_6',0,1,0),(7,4,'seat_7',0,1,0),(8,4,'seat_8',0,1,0),(9,4,'seat_9',0,1,0),(10,4,'seat_10',0,1,0),(11,4,'seat_11',0,1,0),(12,4,'seat_12',0,1,0),(13,4,'seat_13',0,1,0),(14,4,'seat_14',0,1,0),(15,4,'seat_15',0,1,0),(16,5,'seat_1',0,2,0),(17,5,'seat_2',0,2,0),(18,5,'seat_3',0,2,0),(19,5,'seat_4',0,2,0),(20,5,'seat_5',0,2,1),(21,5,'seat_6',0,2,0),(22,5,'seat_7',0,2,0),(23,5,'seat_8',0,2,0),(24,5,'seat_9',0,2,0),(25,5,'seat_10',0,2,0),(26,5,'seat_11',0,2,0),(27,5,'seat_12',0,2,0),(28,5,'seat_13',0,2,0),(29,5,'seat_14',0,2,0),(30,5,'seat_15',0,2,0),(31,6,'seat_1',0,2,0),(32,6,'seat_2',0,2,0),(33,6,'seat_3',0,2,0),(34,6,'seat_4',0,2,0),(35,6,'seat_5',0,2,1),(36,6,'seat_6',0,2,1),(37,6,'seat_7',0,2,0),(38,6,'seat_8',0,2,1),(39,6,'seat_9',0,2,0),(40,6,'seat_10',0,2,0),(41,6,'seat_11',0,2,1),(42,6,'seat_12',0,2,1),(43,6,'seat_13',0,2,1),(44,6,'seat_14',0,2,1),(45,6,'seat_15',0,2,1),(46,6,'seat_16',0,2,0),(47,6,'seat_17',0,2,0),(48,6,'seat_18',0,2,0),(49,6,'seat_19',0,2,0),(50,6,'seat_20',0,2,1),(51,7,'seat_1',0,2,1),(52,7,'seat_2',0,2,1),(53,7,'seat_3',0,2,0),(54,7,'seat_4',0,2,0),(55,7,'seat_5',0,2,0),(56,7,'seat_6',0,2,0),(57,7,'seat_7',0,2,0),(58,7,'seat_8',0,2,0),(59,7,'seat_9',0,2,1),(60,7,'seat_10',0,2,0),(61,7,'seat_11',0,2,0),(62,7,'seat_12',0,2,0),(63,7,'seat_13',0,2,1),(64,7,'seat_14',0,2,0),(65,7,'seat_15',0,2,0),(66,7,'seat_16',0,2,0),(67,7,'seat_17',0,2,0),(68,7,'seat_18',0,2,0),(69,7,'seat_19',0,2,0),(70,7,'seat_20',0,2,0),(71,8,'seat_1',0,2,1),(72,8,'seat_2',0,2,1),(73,8,'seat_3',0,2,1),(74,8,'seat_4',0,2,0),(75,8,'seat_5',0,2,1),(76,8,'seat_6',0,2,1),(77,8,'seat_7',0,2,0),(78,8,'seat_8',0,2,1),(79,8,'seat_9',0,2,1),(80,8,'seat_10',0,2,0),(81,8,'seat_11',0,2,0),(82,8,'seat_12',0,2,0),(83,8,'seat_13',0,2,1),(84,8,'seat_14',0,2,1),(85,8,'seat_15',0,2,1),(86,8,'seat_16',0,2,0),(87,8,'seat_17',0,2,0),(88,8,'seat_18',0,2,0),(89,8,'seat_19',0,2,0),(90,8,'seat_20',0,2,1),(91,9,'seat_1',0,3,0),(92,9,'seat_2',0,3,0),(93,9,'seat_3',0,3,0),(94,9,'seat_4',0,3,0),(95,9,'seat_5',0,3,0),(96,9,'seat_6',0,3,0),(97,9,'seat_7',0,3,0),(98,9,'seat_8',0,3,0),(99,9,'seat_9',0,3,0),(100,9,'seat_10',0,3,0),(101,9,'seat_11',0,3,0),(102,9,'seat_12',0,3,0),(103,9,'seat_13',0,3,0),(104,9,'seat_14',0,3,0),(105,9,'seat_15',0,3,0),(106,10,'seat_1',0,3,0),(107,10,'seat_2',0,3,0),(108,10,'seat_3',0,3,0),(109,10,'seat_4',0,3,0),(110,10,'seat_5',0,3,0),(111,10,'seat_6',0,3,0),(112,10,'seat_7',0,3,0),(113,10,'seat_8',0,3,0),(114,10,'seat_9',0,3,0),(115,10,'seat_10',0,3,0),(116,10,'seat_11',0,3,0),(117,10,'seat_12',0,3,0),(118,10,'seat_13',0,3,0),(119,10,'seat_14',0,3,0),(120,10,'seat_15',0,3,0),(121,11,'seat_1',0,3,0),(122,11,'seat_2',0,3,1),(123,11,'seat_3',0,3,1),(124,11,'seat_4',0,3,0),(125,11,'seat_5',0,3,1),(126,11,'seat_6',0,3,1),(127,11,'seat_7',0,3,1),(128,11,'seat_8',0,3,0),(129,11,'seat_9',0,3,0),(130,11,'seat_10',0,3,0),(131,11,'seat_11',0,3,0),(132,11,'seat_12',0,3,0),(133,11,'seat_13',0,3,0),(134,11,'seat_14',0,3,0),(135,11,'seat_15',0,3,0),(136,12,'seat_1',0,3,0),(137,12,'seat_2',0,3,0),(138,12,'seat_3',0,3,0),(139,12,'seat_4',0,3,0),(140,12,'seat_5',0,3,0),(141,12,'seat_6',0,3,0),(142,12,'seat_7',0,3,0),(143,12,'seat_8',0,3,0),(144,12,'seat_9',0,3,0),(145,12,'seat_10',0,3,0),(146,12,'seat_11',0,3,0),(147,12,'seat_12',0,3,0),(148,12,'seat_13',0,3,0),(149,12,'seat_14',0,3,0),(150,12,'seat_15',0,3,0),(151,13,'seat_1',0,3,0),(152,13,'seat_2',0,3,0),(153,13,'seat_3',0,3,0),(154,13,'seat_4',0,3,0),(155,13,'seat_5',0,3,0),(156,13,'seat_6',0,3,0),(157,13,'seat_7',0,3,0),(158,13,'seat_8',0,3,0),(159,13,'seat_9',0,3,0),(160,13,'seat_10',0,3,0),(161,13,'seat_11',0,3,0),(162,13,'seat_12',0,3,0),(163,13,'seat_13',0,3,0),(164,13,'seat_14',0,3,0),(165,13,'seat_15',0,3,0),(166,14,'seat_1',0,3,0),(167,14,'seat_2',0,3,0),(168,14,'seat_3',0,3,0),(169,14,'seat_4',0,3,0),(170,14,'seat_5',0,3,0),(171,14,'seat_6',0,3,0),(172,14,'seat_7',0,3,0),(173,14,'seat_8',0,3,0),(174,14,'seat_9',0,3,0),(175,14,'seat_10',0,3,0),(176,14,'seat_11',0,3,0),(177,14,'seat_12',0,3,0),(178,14,'seat_13',0,3,0),(179,14,'seat_14',0,3,0),(180,14,'seat_15',0,3,0),(181,15,'seat_1',0,3,0),(182,15,'seat_2',0,3,1),(183,15,'seat_3',0,3,1),(184,15,'seat_4',0,3,0),(185,15,'seat_5',0,3,0),(186,15,'seat_6',0,3,1),(187,15,'seat_7',0,3,0),(188,15,'seat_8',0,3,0),(189,15,'seat_9',0,3,0),(190,15,'seat_10',0,3,0),(191,15,'seat_11',0,3,0),(192,15,'seat_12',0,3,1),(193,15,'seat_13',0,3,0),(194,15,'seat_14',0,3,0),(195,15,'seat_15',0,3,0),(196,16,'seat_1',0,3,1),(197,16,'seat_2',0,3,1),(198,16,'seat_3',0,3,1),(199,16,'seat_4',0,3,1),(200,16,'seat_5',0,3,1),(201,16,'seat_6',0,3,0),(202,16,'seat_7',0,3,0),(203,16,'seat_8',0,3,1),(204,16,'seat_9',0,3,1),(205,16,'seat_10',0,3,0),(206,16,'seat_11',0,3,0),(207,16,'seat_12',0,3,0),(208,16,'seat_13',0,3,1),(209,16,'seat_14',0,3,0),(210,16,'seat_15',0,3,0),(211,16,'seat_16',0,3,1),(212,16,'seat_17',0,3,0),(213,16,'seat_18',0,3,0),(214,16,'seat_19',0,3,0),(215,16,'seat_20',0,3,0),(216,17,'seat_1',0,3,1),(217,17,'seat_2',0,3,0),(218,17,'seat_3',0,3,1),(219,17,'seat_4',0,3,0),(220,17,'seat_5',0,3,0),(221,17,'seat_6',0,3,0),(222,17,'seat_7',0,3,0),(223,17,'seat_8',0,3,0),(224,17,'seat_9',0,3,0),(225,17,'seat_10',0,3,0),(226,17,'seat_11',0,3,0),(227,17,'seat_12',0,3,0),(228,17,'seat_13',0,3,0),(229,17,'seat_14',0,3,0),(230,17,'seat_15',0,3,0),(231,17,'seat_16',0,3,0),(232,17,'seat_17',0,3,0),(233,17,'seat_18',0,3,0),(234,17,'seat_19',0,3,0),(235,17,'seat_20',0,3,0),(236,18,'seat_1',0,3,0),(237,18,'seat_2',0,3,0),(238,18,'seat_3',0,3,0),(239,18,'seat_4',0,3,0),(240,18,'seat_5',0,3,0),(241,18,'seat_6',0,3,0),(242,18,'seat_7',0,3,0),(243,18,'seat_8',0,3,0),(244,18,'seat_9',0,3,0),(245,18,'seat_10',0,3,0),(246,18,'seat_11',0,3,0),(247,18,'seat_12',0,3,0),(248,18,'seat_13',0,3,0),(249,18,'seat_14',0,3,0),(250,18,'seat_15',0,3,0),(251,18,'seat_16',0,3,0),(252,18,'seat_17',0,3,0),(253,18,'seat_18',0,3,0),(254,18,'seat_19',0,3,0),(255,18,'seat_20',0,3,0),(256,19,'seat_1',0,2,0),(257,19,'seat_2',0,2,0),(258,19,'seat_3',0,2,0),(259,19,'seat_4',0,2,0),(260,19,'seat_5',0,2,0),(261,19,'seat_6',0,2,0),(262,19,'seat_7',0,2,0),(263,19,'seat_8',0,2,0),(264,19,'seat_9',0,2,0),(265,19,'seat_10',0,2,0),(266,19,'seat_11',0,2,0),(267,19,'seat_12',0,2,0),(268,19,'seat_13',0,2,0),(269,19,'seat_14',0,2,0),(270,19,'seat_15',0,2,0),(271,19,'seat_16',0,2,0),(272,19,'seat_17',0,2,0),(273,19,'seat_18',0,2,0),(274,19,'seat_19',0,2,0),(275,19,'seat_20',0,2,0),(276,19,'seat_21',0,2,0),(277,19,'seat_22',0,2,0),(278,19,'seat_23',0,2,0),(279,20,'seat_1',0,2,1),(280,20,'seat_2',0,2,1),(281,20,'seat_3',0,2,1),(282,20,'seat_4',0,2,0),(283,20,'seat_5',0,2,0),(284,20,'seat_6',0,2,0),(285,20,'seat_7',0,2,1),(286,20,'seat_8',0,2,0),(287,20,'seat_9',0,2,0),(288,20,'seat_10',0,2,0),(289,20,'seat_11',0,2,0),(290,20,'seat_12',0,2,0),(291,20,'seat_13',0,2,0),(292,20,'seat_14',0,2,0),(293,20,'seat_15',0,2,0),(294,20,'seat_16',0,2,0),(295,20,'seat_17',0,2,0),(296,20,'seat_18',0,2,0),(297,20,'seat_19',0,2,0),(298,20,'seat_20',0,2,0),(299,20,'seat_21',0,2,0),(300,20,'seat_22',0,2,0),(301,20,'seat_23',0,2,0),(302,20,'seat_24',0,2,0),(303,20,'seat_25',0,2,0),(304,20,'seat_26',0,2,0),(305,21,'seat_1',0,2,0),(306,21,'seat_2',0,2,0),(307,21,'seat_3',0,2,0),(308,21,'seat_4',0,2,0),(309,21,'seat_5',0,2,0),(310,21,'seat_6',0,2,0),(311,21,'seat_7',0,2,0),(312,21,'seat_8',0,2,0),(313,21,'seat_9',0,2,0),(314,21,'seat_10',0,2,0),(315,21,'seat_11',0,2,0),(316,21,'seat_12',0,2,0),(317,21,'seat_13',0,2,0),(318,21,'seat_14',0,2,0),(319,21,'seat_15',0,2,0),(320,21,'seat_16',0,2,0),(321,21,'seat_17',0,2,0),(322,21,'seat_18',0,2,0),(323,21,'seat_19',0,2,0),(324,21,'seat_20',0,2,0),(325,21,'seat_21',0,2,0),(326,21,'seat_22',0,2,0),(327,21,'seat_23',0,2,0),(328,21,'seat_24',0,2,0),(329,22,'seat_1',0,2,0),(330,22,'seat_2',0,2,0),(331,22,'seat_3',0,2,1),(332,22,'seat_4',0,2,0),(333,22,'seat_5',0,2,0),(334,22,'seat_6',0,2,0),(335,22,'seat_7',0,2,0),(336,22,'seat_8',0,2,0),(337,22,'seat_9',0,2,0),(338,22,'seat_10',0,2,0),(339,22,'seat_11',0,2,0),(340,22,'seat_12',0,2,0),(341,22,'seat_13',0,2,0),(342,22,'seat_14',0,2,0),(343,22,'seat_15',0,2,0),(344,22,'seat_16',0,2,0),(345,22,'seat_17',0,2,0),(346,22,'seat_18',0,2,0),(347,22,'seat_19',0,2,0),(348,22,'seat_20',0,2,0),(349,22,'seat_21',0,2,0),(350,22,'seat_22',0,2,0),(351,22,'seat_23',0,2,0),(352,22,'seat_24',0,2,0),(353,22,'seat_25',0,2,0),(354,22,'seat_26',0,2,0),(355,23,'seat_1',0,7,0),(356,23,'seat_2',0,7,0),(357,23,'seat_3',0,7,0),(358,23,'seat_4',0,7,0),(359,23,'seat_5',0,7,0),(360,23,'seat_6',0,7,0),(361,23,'seat_7',0,7,0),(362,23,'seat_8',0,7,0),(363,23,'seat_9',0,7,0),(364,23,'seat_10',0,7,0),(365,23,'seat_11',0,7,0),(366,23,'seat_12',0,7,0),(367,23,'seat_13',0,7,0),(368,23,'seat_14',0,7,0),(369,23,'seat_15',0,7,0),(370,23,'seat_16',0,7,0),(371,23,'seat_17',0,7,0),(372,23,'seat_18',0,7,0),(373,23,'seat_19',0,7,0),(374,23,'seat_20',0,7,0),(375,23,'seat_21',0,7,0),(376,23,'seat_22',0,7,0),(377,23,'seat_23',0,7,0),(378,23,'seat_24',0,7,0),(379,23,'seat_25',0,7,0),(380,23,'seat_26',0,7,0),(381,23,'seat_27',0,7,0),(382,23,'seat_28',0,7,0),(383,23,'seat_29',0,7,0),(384,23,'seat_30',0,7,0),(385,23,'seat_31',0,7,0),(386,24,'seat_1',0,2,0),(387,24,'seat_2',0,2,0),(388,24,'seat_3',0,2,0),(389,24,'seat_4',0,2,0),(390,24,'seat_5',0,2,0),(391,24,'seat_6',0,2,0),(392,24,'seat_7',0,2,0),(393,24,'seat_8',0,2,0),(394,24,'seat_9',0,2,0),(395,24,'seat_10',0,2,0),(396,24,'seat_11',0,2,0),(397,24,'seat_12',0,2,0),(398,24,'seat_13',0,2,0),(399,24,'seat_14',0,2,0),(400,24,'seat_15',0,2,0),(401,24,'seat_16',0,2,0),(402,24,'seat_17',0,2,0),(403,24,'seat_18',0,2,0),(404,24,'seat_19',0,2,0),(405,24,'seat_20',0,2,0),(406,24,'seat_21',0,2,0),(407,24,'seat_22',0,2,0),(408,24,'seat_23',0,2,0),(409,24,'seat_24',0,2,0),(410,24,'seat_25',0,2,0),(411,24,'seat_26',0,2,0),(412,24,'seat_27',0,2,0),(413,24,'seat_28',0,2,0),(414,24,'seat_29',0,2,0),(415,24,'seat_30',0,2,0),(416,24,'seat_31',0,2,0),(417,24,'seat_32',0,2,0),(418,24,'seat_33',0,2,0),(419,24,'seat_34',0,2,0),(420,25,'seat_1',0,7,0),(421,25,'seat_2',0,7,0),(422,25,'seat_3',0,7,0),(423,25,'seat_4',0,7,0),(424,25,'seat_5',0,7,0),(425,25,'seat_6',0,7,0),(426,25,'seat_7',0,7,0),(427,25,'seat_8',0,7,0),(428,25,'seat_9',0,7,0),(429,25,'seat_10',0,7,0),(430,25,'seat_11',0,7,0),(431,25,'seat_12',0,7,0),(432,25,'seat_13',0,7,0),(433,25,'seat_14',0,7,0),(434,25,'seat_15',0,7,0),(435,25,'seat_16',0,7,0),(436,25,'seat_17',0,7,0),(437,25,'seat_18',0,7,0),(438,25,'seat_19',0,7,0),(439,25,'seat_20',0,7,0),(440,25,'seat_21',0,7,0),(441,25,'seat_22',0,7,0),(442,25,'seat_23',0,7,0),(443,25,'seat_24',0,7,0),(444,25,'seat_25',0,7,0),(445,25,'seat_26',0,7,0),(446,25,'seat_27',0,7,0),(447,25,'seat_28',0,7,0),(448,25,'seat_29',0,7,0),(449,25,'seat_30',0,7,0),(450,25,'seat_31',0,7,0),(451,25,'seat_32',0,7,0),(452,25,'seat_33',0,7,0),(453,26,'seat_1',0,2,0),(454,26,'seat_2',0,2,0),(455,26,'seat_3',0,2,0),(456,26,'seat_4',0,2,0),(457,26,'seat_5',0,2,0),(458,26,'seat_6',0,2,0),(459,26,'seat_7',0,2,0),(460,26,'seat_8',0,2,0),(461,26,'seat_9',0,2,0),(462,26,'seat_10',0,2,0),(463,26,'seat_11',0,2,0),(464,26,'seat_12',0,2,0),(465,26,'seat_13',0,2,0),(466,26,'seat_14',0,2,0),(467,26,'seat_15',0,2,0),(468,26,'seat_16',0,2,0),(469,26,'seat_17',0,2,0),(470,26,'seat_18',0,2,0),(471,26,'seat_19',0,2,0),(472,26,'seat_20',0,2,0),(473,26,'seat_21',0,2,0),(474,26,'seat_22',0,2,0),(475,26,'seat_23',0,2,0),(476,26,'seat_24',0,2,0),(477,26,'seat_25',0,2,0),(478,26,'seat_26',0,2,0),(479,26,'seat_27',0,2,0),(480,26,'seat_28',0,2,0),(481,26,'seat_29',0,2,0),(482,26,'seat_30',0,2,0),(483,26,'seat_31',0,2,0),(484,26,'seat_32',0,2,0),(485,26,'seat_33',0,2,0),(486,26,'seat_34',0,2,0),(487,26,'seat_35',0,2,0),(488,27,'seat_1',0,2,0),(489,27,'seat_2',0,2,0),(490,27,'seat_3',0,2,0),(491,27,'seat_4',0,2,0),(492,27,'seat_5',0,2,0),(493,27,'seat_6',0,2,0),(494,27,'seat_7',0,2,0),(495,27,'seat_8',0,2,0),(496,27,'seat_9',0,2,0),(497,27,'seat_10',0,2,0),(498,27,'seat_11',0,2,0),(499,27,'seat_12',0,2,0),(500,27,'seat_13',0,2,0),(501,27,'seat_14',0,2,0),(502,27,'seat_15',0,2,0),(503,27,'seat_16',0,2,0),(504,27,'seat_17',0,2,0),(505,27,'seat_18',0,2,0),(506,27,'seat_19',0,2,0),(507,27,'seat_20',0,2,0),(508,27,'seat_21',0,2,0),(509,27,'seat_22',0,2,0),(510,27,'seat_23',0,2,0),(511,27,'seat_24',0,2,0),(512,27,'seat_25',0,2,0),(513,27,'seat_26',0,2,0);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `BroadcastID` int DEFAULT NULL,
  `SeatID` int DEFAULT NULL,
  `dateOrder` date DEFAULT NULL,
  `userID` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `timeOrder` time DEFAULT '00:00:00',
  PRIMARY KEY (`ID`),
  KEY `BroadcastID` (`BroadcastID`),
  KEY `userID` (`userID`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`BroadcastID`) REFERENCES `broadcast` (`ID`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,2,1,'2025-06-14',5,100000,0,'00:00:00'),(2,2,1,'2025-06-14',5,100000,0,'00:00:00'),(3,2,1,'2025-06-14',5,100000,0,'00:00:00'),(4,2,2,'2025-06-14',5,100000,0,'00:00:00'),(5,2,5,'2025-06-14',5,100000,0,'00:00:00'),(6,6,43,'2025-06-16',5,100000,0,'00:00:00'),(7,6,44,'2025-06-16',5,100000,0,'00:00:00'),(8,6,20,'2025-06-16',5,100000,0,'00:00:00'),(9,6,35,'2025-06-16',5,100000,0,'00:00:00'),(10,11,123,'2025-06-16',5,100000,0,'00:00:00'),(11,6,34,'2025-06-16',4,100000,1,'00:00:00'),(12,6,50,'2025-06-16',4,100000,0,'00:00:00'),(13,7,58,'2025-06-16',4,100000,1,'00:00:00'),(14,11,122,'2025-06-16',5,100000,0,'00:00:00'),(15,8,78,'2025-06-17',5,100000,0,'00:00:00'),(16,7,59,'2025-06-17',5,100000,0,'00:00:00'),(17,7,63,'2025-06-17',4,100000,0,'00:00:00'),(18,8,84,'2025-06-17',5,100000,0,'00:00:00'),(19,8,85,'2025-06-17',4,100000,0,'00:00:00'),(20,8,83,'2025-06-17',5,100000,0,'00:00:00'),(21,8,79,'2025-06-17',5,100000,0,'00:00:00'),(22,6,38,'2025-06-17',4,100000,0,'00:00:00'),(23,15,183,'2025-06-17',5,100000,0,'00:00:00'),(24,15,184,'2025-06-17',4,100000,1,'00:00:00'),(25,15,182,'2025-06-17',4,100000,0,'00:00:00'),(26,17,223,'2025-06-17',4,100000,1,'18:38:04'),(27,16,200,'2025-06-17',4,100000,1,'19:54:37'),(28,7,51,'2025-06-17',4,100000,1,'19:56:21'),(29,8,75,'2025-06-18',5,100000,1,'12:30:21'),(30,8,71,'2025-06-18',4,100000,1,'15:28:26'),(31,8,73,'2025-06-18',4,100000,1,'15:28:31'),(32,8,72,'2025-06-18',4,100000,1,'15:28:34'),(33,15,185,'2025-06-20',4,100000,1,'01:50:44'),(34,15,192,'2025-06-20',4,100000,0,'01:50:57'),(35,15,186,'2025-06-20',4,100000,0,'01:51:00'),(36,16,208,'2025-06-20',4,100000,0,'01:51:07'),(37,16,196,'2025-06-20',4,100000,0,'01:51:11'),(38,16,197,'2025-06-20',4,100000,0,'01:51:14'),(39,16,198,'2025-06-20',4,100000,0,'01:51:17'),(40,16,211,'2025-06-20',4,100000,0,'01:51:20'),(41,16,203,'2025-06-20',4,100000,0,'10:57:25'),(42,16,199,'2025-06-20',4,100000,0,'10:58:20'),(43,16,200,'2025-06-20',4,100000,0,'11:04:08'),(44,16,204,'2025-06-20',4,100000,0,'11:04:53'),(45,11,133,'2025-06-20',4,100000,1,'11:15:20'),(46,11,126,'2025-06-20',4,100000,0,'11:15:23'),(47,11,125,'2025-06-20',4,100000,0,'11:15:47'),(48,11,129,'2025-06-20',4,100000,1,'11:15:52'),(49,11,127,'2025-06-20',4,100000,0,'11:15:55'),(50,15,181,'2025-06-21',4,100000,1,'16:49:50'),(51,17,228,'2025-06-21',4,100000,1,'16:58:52'),(52,8,89,'2025-06-22',4,100000,1,'00:05:32'),(53,16,205,'2025-06-22',4,100000,1,'01:11:14'),(54,15,181,'2025-06-22',4,100000,1,'01:11:28'),(55,9,97,'2025-06-22',4,100000,1,'15:22:31'),(56,17,222,'2025-06-22',4,100000,1,'15:28:37'),(57,6,31,'2025-06-22',4,100000,1,'16:34:12'),(58,17,216,'2025-06-22',4,100000,0,'16:39:34'),(59,17,218,'2025-06-22',4,100000,0,'16:39:37'),(60,17,228,'2025-06-22',4,100000,1,'16:39:40'),(61,8,71,'2025-06-23',4,100000,0,'00:06:37'),(62,8,76,'2025-06-23',4,100000,0,'00:06:42'),(63,8,75,'2025-06-23',4,100000,0,'00:06:45'),(64,6,42,'2025-06-24',4,100000,0,'01:29:19'),(65,22,331,'2025-06-25',4,80000,1,'00:16:25'),(66,6,45,'2025-06-25',4,100000,0,'23:57:11'),(67,6,36,'2025-06-25',4,100000,0,'23:57:14'),(68,6,41,'2025-06-25',4,100000,0,'23:57:17'),(69,20,279,'2025-06-26',4,70000,0,'10:40:19'),(70,7,51,'2025-06-27',4,100000,1,'01:00:35'),(71,7,52,'2025-06-27',4,100000,1,'01:00:39'),(72,20,280,'2025-06-27',4,70000,0,'16:36:32'),(73,20,281,'2025-06-27',4,70000,0,'16:36:36'),(74,8,90,'2025-06-27',4,100000,0,'16:36:58'),(75,8,88,'2025-06-27',4,100000,1,'16:37:01'),(76,8,87,'2025-06-27',4,100000,1,'16:37:04'),(77,20,285,'2025-06-27',4,70000,1,'21:45:55'),(78,22,331,'2025-06-27',4,80000,1,'21:46:56'),(79,15,181,'2025-06-28',4,100000,1,'16:13:51'),(80,22,329,'2025-06-28',4,80000,1,'16:15:18');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `totalday`
--

DROP TABLE IF EXISTS `totalday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `totalday` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `totalMoney` float DEFAULT NULL,
  `date` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `totalTickets` int DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `totalday`
--

LOCK TABLES `totalday` WRITE;
/*!40000 ALTER TABLE `totalday` DISABLE KEYS */;
INSERT INTO `totalday` VALUES (2,500000,14,6,2025,0),(3,700000,16,6,2025,0),(4,1000000,17,6,2025,0),(5,0,18,6,2025,0),(6,0,10,6,2025,0),(7,0,11,6,2025,0),(8,0,12,6,2025,0),(9,0,13,6,2025,0),(10,0,15,6,2025,0),(11,1400000,20,6,2025,0),(12,0,19,6,2025,0),(13,0,21,6,2025,0),(14,200000,22,6,2025,0),(15,300000,23,6,2025,0),(16,100000,24,6,2025,0),(17,300000,25,6,2025,3),(18,70000,26,6,2025,1),(111,240000,27,6,2025,3),(112,0,28,6,2025,0);
/*!40000 ALTER TABLE `totalday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `totalmonth`
--

DROP TABLE IF EXISTS `totalmonth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `totalmonth` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `totalMoney` float DEFAULT NULL,
  `month` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `totalmonth`
--

LOCK TABLES `totalmonth` WRITE;
/*!40000 ALTER TABLE `totalmonth` DISABLE KEYS */;
/*!40000 ALTER TABLE `totalmonth` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `user` VALUES (1,'Updated Name','testuser','scrypt:32768:8:1$cLIP36Hpopfpg3vn$5d16bde95a89378c88c000e1d8c52bb6d4ca1f2fd41c4ed5c54299b8686a74eb5adc980ee4b43b3bad7546be015d7559f327988e2b9f2a291a16bc9b7c082c29','0987654321','updated@example.com','user',1),(4,'hello','user','scrypt:32768:8:1$ajZjnyx8nKGQDCKb$689e566c7a10afdaaaa28bd758035bcced0031dcfd53fe5a376fee10f06b0032227e09063adcfea25ac2cb19172fd78b8cc366dc1e2ee6c5509ea385059c14ae','0326754129','hello@gmai.com','user',0),(5,'Updated Name','user123','scrypt:32768:8:1$svOjY34Kkrd1ZjLn$8b9a8e180102f92f76da2e3699b04bdc486e86333d5a87f22e5fc26b62ede431a8defef52816b363624e1f530f8e06375b0973c51fe41c77df3aa926e2ec214f','098765654321','updatedd@axaaample.com','user',0),(7,'yasua oh','admin','scrypt:32768:8:1$VzsWb2ZHgM8LsX3l$3d01785db320580b6d50c666bb65a520f0d7dba860c3d8612864fa2c50915c10e0fc5f65b3497e5613b8a7e078cc8463816e5cdb2e388d20d386c445e9113943','huypro@gmail.com','0357864786','admin',0),(8,'Cao Thanh Huy','usa','scrypt:32768:8:1$QY86BffCGh0F0eP0$a333e987345d5d34368ee6aca29a5760dbe888a22c833e777d649aae6f8ba0c58b7677d6bd02097b30bbbbdf490f1c2d53ee9885ba4a0ef57dc8277d9d77563c','0123456789','testus2dfser@fexample.com','user',0),(9,'yasua oh','yasua','scrypt:32768:8:1$fEGZguNtDPVt8KYo$a34121a2b1905edc647afc169d3dc0668d8d23ff6ca2cc99e9722a1a585134ae9336b8f3496b3e794865485b5657315e10746a760b1685d4f2fa6b53b37422ae','hello@gmail.com','0123456987','user',1),(10,'togia','togia123','scrypt:32768:8:1$MgVSqiIt6UdtG88N$8574329b88db5bfed6f134322fcc9e4d6bc14db971cf439e099403c96a89626ee442c3420cc2dc9297307219c09e16c85c7db2a3c95a7f1f9055d875667e30ea','0147896325','test@emple.com','user',1),(11,'panda','panda','scrypt:32768:8:1$RIkAFGyc6dXDdCsM$e433b4cda7d85b1f27a88352d05f6e480d4655bb6f98b1d1ebdb3bb0d9f2d35383061384d25c6ecd7529f31696af51ee72fe4ccbb8d5417c96e4c95967158c9a','0147896325','panda@gmail.com','user',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'firmmanagement'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-28 17:11:02
