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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firm`
--

LOCK TABLES `firm` WRITE;
/*!40000 ALTER TABLE `firm` DISABLE KEYS */;
INSERT INTO `firm` VALUES (1,'Updated Firm','This is an updated firm.','2023-01-01',NULL,'http://example.com/thumbnail.jpg',150,4.8,1,60),(2,'New second Firm','This is a new firm.','2023-01-01','2023-12-31','http://example.com/thumbnail.jpg',100,4.5,1,60),(3,'Game of Thrones','Nine noble families fight for control of the mythical land of Westeros. Political and sexual intrigue is pervasive. Robert Baratheon, King of Westeros, asks his old friend Eddard, Lord Stark, to serve as Hand of the King, or highest official. Secretly warned that the previous Hand was assassinated, Eddard accepts in order to investigate further. Meanwhile the Queen\'s family, the Lannisters, may be hatching a plot to take power. Across the sea, the last members of the previous and deposed ruling family, the Targaryens, are also scheming to regain the throne. The friction between the houses Stark, Lannister, Baratheon and Targaryen and with the remaining great houses Greyjoy, Tully, Arryn,Tyrell and Martell leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war and political confusion, a neglected military order of misfits, the Night\'s Watch, is all that stands between the realms of men and icy horrors beyond.','2011-04-17',NULL,'https://static.episodate.com/images/tv-show/thumbnail/23455.jpg',774,9.3992,0,60),(4,'Arrow','Arrow is an American television series developed by writer/producers Greg Berlanti, Marc Guggenheim, and Andrew Kreisberg. It is based on the DC Comics character Green Arrow, a costumed crime-fighter created by Mort Weisinger and George Papp. It premiered in North America on The CW on October 10, 2012, with international broadcasting taking place in late 2012. Primarily filmed in Vancouver, British Columbia, Canada, the series follows billionaire playboy Oliver Queen, portrayed by Stephen Amell, who, five years after being stranded on a hostile island, returns home to fight crime and corruption as a secret vigilante whose weapon of choice is a bow and arrow. Unlike in the comic books, Queen does not go by the alias \"Green Arrow\". The series takes a realistic look at the Green Arrow character, as well as other characters from the DC Comics universe. Although Oliver Queen/Green Arrow had been featured in the television series Smallville from 2006 to 2011, the producers decided to start clean and find a new actor (Amell) to portray the character. Arrow focuses on the humanity of Oliver Queen, and how he was changed by time spent shipwrecked on an island. Most episodes have flashback scenes to the five years in which Oliver was missing.','2012-10-10',NULL,'https://static.episodate.com/images/tv-show/thumbnail/29560.jpg',653,9.1057,0,60),(5,'The Flash','Barry Allen is a Central City police forensic scientist with a reasonably happy life, despite the childhood trauma of a mysterious red and yellow being killing his mother and framing his father. All that changes when a massive particle accelerator accident leads to Barry being struck by lightning in his lab. Coming out of coma nine months later, Barry and his new friends at STAR labs find that he now has the ability to move at superhuman speed. <br>Furthermore, Barry learns that he is but one of many affected by that event, most of whom are using their powers for evil. Determined to make a difference, Barry dedicates his life to fighting such threats, as The Flash. While he gains allies he never expected, there are also secret forces determined to aid and manipulate him for their own agenda.','2014-10-07',NULL,'https://static.episodate.com/images/tv-show/thumbnail/35624.jpg',663,9.35,0,60),(6,'New Firm1','This is a new firm.','2023-01-01','2023-12-31','http://example.com/thumbnail.jpg',100,4.5,1,60),(7,'New Firm2','This is a new firm.','2023-01-01','2023-12-31','http://example.com/thumbnail.jpg',100,4.5,1,60),(8,'New Firm3','This is a new firm.','2023-01-01','2023-12-31','http://example.com/thumbnail.jpg',100,4.5,1,60),(9,'c','c','2010-10-31','2030-10-30','http://res.cloudinary.com/dfu6ly3og/image/upload/v1750867887/ioarubvgwqfogo9y9cgw.jpg',3,3,1,3),(10,'DC\'s Legends of Tomorrow','When heroes alone are not enough... the world needs legends. Having seen the future, one he will desperately try to prevent from happening, time-traveling rogue Rip Hunter is tasked with assembling a disparate group of both heroes and villains to confront an unstoppable threat - one in which not only is the planet at stake, but all of time itself. Can this ragtag team defeat an immortal threat unlike anything they have ever known?','2016-01-21',NULL,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750830067/snodcrbtdjg7hhyotekh.jpg',347,8.9798,0,60),(11,'a','a','2025-06-10',NULL,'https://res.cloudinary.com/dfu6ly3og/image/upload/v1750855972/gdve9h3aotqqt88wletm.jpg',1,1,0,2),(12,'aaa','sdsa','2025-06-19','2025-10-08','https://res.cloudinary.com/dfu6ly3og/image/upload/v1750864139/n7rj5dfvvhe4dpo4ntya.jpg',12,2,1,60),(13,'phim yasua','Hi am yasua','2025-06-17','2025-08-22','https://res.cloudinary.com/dfu6ly3og/image/upload/v1750962600/mmyh0rjtaqv22z4gytxk.jpg',80,8.5,0,60);
/*!40000 ALTER TABLE `firm` ENABLE KEYS */;
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
