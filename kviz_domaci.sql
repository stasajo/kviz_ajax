CREATE DATABASE  IF NOT EXISTS `kviz_domaci` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `kviz_domaci`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: kviz_domaci
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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `answer_text` text NOT NULL,
  `correct` tinyint(1) NOT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,1,'Asynchronous JavaScript and XML',1),(2,1,'Advanced Java and XHTML',0),(3,1,'Automatic JSON and XML',0),(4,1,'Asynchronous JQuery and XHTML',0),(5,2,'Učitavanje stranice bez osvežavanja',1),(6,2,'Bolje formatiranje teksta',0),(7,2,'Automatsko logovanje',0),(8,2,'Generisanje HTML koda',0),(9,3,'HttpClient',0),(10,3,'AJAXEngine',0),(11,3,'FetchData',0),(12,3,'XMLHttpRequest',1),(13,4,'load() i execute()',0),(14,4,'open() i send()',1),(15,4,'get() i post()',0),(16,4,'start() i submit()',0),(17,5,'Bootstrap',0),(18,5,'CSS',0),(19,5,'PHP',1),(20,5,'Photoshop',0),(21,6,'Pokreće se callback funkcija i podaci se obrađuju',1),(22,6,'Stranica se osvežava',0),(23,6,'Korisnik mora da klikne dugme',0),(24,6,'Podaci se brišu iz baze',0),(25,7,'500',0),(26,7,'404',0),(27,7,'200',1),(28,7,'301',0),(29,8,'ready()',0),(30,8,'onajaxresponse',0),(31,8,'ondataready',0),(32,8,'onreadystatechange',1),(33,9,'Kreiranje animacija',0),(34,9,'Slanje i primanje podataka bez osvežavanja stranice',1),(35,9,'Prikaz slika u galeriji',0),(36,9,'Pretraga lokalnih fajlova',0),(37,10,'AsyncXML',0),(38,10,'AjaxToolKit',0),(39,10,'Fetch API',1),(40,10,'JQueryPromise',0);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_question` text NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'Šta znači skraćenica AJAX?'),(2,'Koji je osnovni cilj korišćenja AJAX-a u web aplikacijama?'),(3,'Koji objekat u JavaScript-u se koristi za AJAX pozive?'),(4,'Koja metoda se koristi za slanje podataka putem AJAX-a?'),(5,'Koja tehnologija je najčešće korišćena na serverskoj strani u AJAX aplikacijama?'),(6,'Šta se dešava kada se AJAX poziv izvrši uspešno?'),(7,'Koji je status HTTP odgovora koji označava uspešan AJAX poziv?'),(8,'Koja funkcija u JavaScript-u se koristi da se registruje funkcija koja će se pozvati kada se AJAX odgovor vrati?'),(9,'Šta omogućava XMLHttpRequest objekat?'),(10,'Koja alternativa XMLHttpRequest objektu se koristi u modernom JavaScript-u za AJAX pozive?');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `result_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `score` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`result_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,'stasa',1,'2025-06-22 21:29:45'),(2,'stasa',1,'2025-06-22 21:29:51'),(3,'stasa',1,'2025-06-22 21:39:29'),(4,'stale',0,'2025-06-22 21:44:50'),(6,'masajo',2,'2025-06-23 15:07:19'),(8,'darko',3,'2025-06-23 15:09:02'),(9,'staska',3,'2025-06-23 15:22:48'),(10,'proba',4,'2025-06-23 15:26:51'),(11,'proba2',2,'2025-06-23 15:27:49'),(12,'stale2',1,'2025-06-23 15:29:10'),(17,'stale',2,'2025-06-24 10:22:30'),(18,'darkojo',2,'2025-06-24 10:25:34');
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-25 13:22:47
