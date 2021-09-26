-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: 192.168.10.10    Database: ijdb_sample
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.20.04.1

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `permissions` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Kevin Yank','thatguy@kevinyank.com','',255),(2,'Tom Butler','tom@r.je','',255),(5,'Mike','Mike@gmail.com','Mike',0),(6,'amadeus','amadeus@gmail.com','amadeus',0),(7,'hrht','kmtk@nhh.net','tjtj',0),(8,'ddd','fff@hyj.com','ddd',0),(9,'bcrypt','brcypt@gmail.com','$2y$10$tb.ZoKJKMeFSv4f5wU5dkeNcBYNY3k7gOM/aMf82jAKmWJEyLwVWC',0),(10,'study','study@gmail.com','$2y$10$kpxU1MiPR1xdGMfsaOhMhe6uviC/5645YTsTgVSGudNPGgxFHQ5Fq',255),(11,'pass','pass@gmail.com','$2y$10$e2YWmVuqCkglR44vMRkyDOmu9b5YmBwTNlc54isBXhdtxxzHo3xFC',0);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Programming Jokes'),(2,'One Liners');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joke`
--

DROP TABLE IF EXISTS `joke`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `joke` (
  `id` int NOT NULL AUTO_INCREMENT,
  `joketext` text,
  `jokedate` date NOT NULL,
  `authorId` int DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `authorId` (`authorId`),
  CONSTRAINT `fk_joke_author` FOREIGN KEY (`authorId`) REFERENCES `author` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joke`
--

LOCK TABLES `joke` WRITE;
/*!40000 ALTER TABLE `joke` DISABLE KEYS */;
INSERT INTO `joke` VALUES (1,'How many programmers does it take to screw in a lightbulb? None, it\'s a hardware problem.wrefwf111','2021-08-15',10,1),(2,'Why did the programmer quit his job? He didn\'t get arrays!))):)','2021-09-10',10,1),(3,'Why was the empty array stuck outside? It didn\'t have any keys','2017-04-01',2,1),(4,'How do functions break up? They stop calling each other','2017-08-09',2,1),(5,'How do you tell HTML from HTML5? Try it out in Internet Explorer. Did it work? No? It\'s HTML5!','2017-08-09',1,1),(30,'An SQL query goes into a bar, walks up to\r\ntwo tables and asks \"Can I join you?\" Please ))))','2021-08-02',1,1),(45,'gggggg','2021-09-07',10,1),(46,'del','2021-09-09',10,1),(47,'__ама__\r\n[gooogle](https://www.google.com)\r\n\r\nfdvdfv\r\n\r\nfbvsfv','2021-09-19',10,1),(48,'joke one','2021-09-21',10,1),(49,'joke two111','2021-09-24',10,1),(50,'joke three','2021-09-21',10,1),(51,'joke four','2021-09-21',10,1),(52,'joke five','2021-09-21',10,1),(53,'joke six','2021-09-21',10,1),(54,'joke seven','2021-09-21',10,1),(55,'joke eight','2021-09-21',10,1),(56,'joke nine','2021-09-21',10,1),(57,'joke ten','2021-09-21',10,1),(58,'joke eleven','2021-09-21',10,1),(59,'joke twelve','2021-09-24',10,1),(63,'ppppp2','2021-09-24',10,1),(65,'nnn2','2021-09-26',10,0),(66,'ppppppp3','2021-09-26',11,1);
/*!40000 ALTER TABLE `joke` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joke_category`
--

DROP TABLE IF EXISTS `joke_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `joke_category` (
  `jokeId` int NOT NULL,
  `categoryId` int NOT NULL,
  KEY `composite` (`jokeId`,`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joke_category`
--

LOCK TABLES `joke_category` WRITE;
/*!40000 ALTER TABLE `joke_category` DISABLE KEYS */;
INSERT INTO `joke_category` VALUES (1,1),(1,2),(3,1),(4,2),(5,1),(6,2),(46,1),(46,2),(47,1),(47,2),(48,1),(48,2),(50,2),(60,1),(60,2);
/*!40000 ALTER TABLE `joke_category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-26 13:52:10
