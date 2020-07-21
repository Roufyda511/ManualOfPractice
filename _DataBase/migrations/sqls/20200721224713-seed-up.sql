/* Replace with your SQL commands */

/* Replace with your SQL commands */
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: MOP

-- ------------------------------------------------------
-- Server version	5.7.30-log

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
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(45) NOT NULL,
  KEY `username_FK_idx` (`username`),
  CONSTRAINT `username_FK` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `supporter` int(11) NOT NULL,
  `speaker` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `image` blob,
  `path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_supporter_id_idx` (`supporter`),
  KEY `FK_speaker_id_idx` (`speaker`),
  CONSTRAINT `FK_speaker_id` FOREIGN KEY (`speaker`) REFERENCES `speaker` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_supporter_id` FOREIGN KEY (`supporter`) REFERENCES `supporter` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'test','test course',1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profession`
--

DROP TABLE IF EXISTS `profession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profession` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profession`
--

LOCK TABLES `profession` WRITE;
/*!40000 ALTER TABLE `profession` DISABLE KEYS */;
INSERT INTO `profession` VALUES (1,'Nurse'),(2,'Pharmacist'),(3,'Physician'),(4,'Physician Assistant'),(5,'Resident'),(6,'Medical Student'),(7,'Patient');
/*!40000 ALTER TABLE `profession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speaker`
--

DROP TABLE IF EXISTS `speaker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `speaker` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `brief_summary` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speaker`
--

LOCK TABLES `speaker` WRITE;
/*!40000 ALTER TABLE `speaker` DISABLE KEYS */;
INSERT INTO `speaker` VALUES (1,'test','test');
/*!40000 ALTER TABLE `speaker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialty`
--

DROP TABLE IF EXISTS `specialty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialty` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialty`
--

LOCK TABLES `specialty` WRITE;
/*!40000 ALTER TABLE `specialty` DISABLE KEYS */;
INSERT INTO `specialty` VALUES (1,'Anesthesiology'),(2,'Cardiovascular medicine'),(3,'Critical care medicine'),(4,'Dermatology'),(5,'Emergency medicine'),(6,'Endocrinology'),(7,'Geriatric medicine'),(8,'Gastroenterology'),(9,'Haematology'),(10,'Nephrology'),(11,'Neurology'),(12,'Oncology'),(13,'Ophthalmology and Optometry'),(14,'Otorhinolaryngology'),(15,'Pastoral care'),(16,'Pulmonology'),(17,'Primary care medicine'),(18,'Pediatric medicine'),(19,'Podiatric medicine'),(20,'Psychiatry'),(21,'Orthopedics, rheumatology, and movement'),(22,'Radiology'),(23,'Reproductive medicine'),(24,'Surgery'),(25,'Urology');
/*!40000 ALTER TABLE `specialty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supporter`
--

DROP TABLE IF EXISTS `supporter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supporter` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supporter`
--

LOCK TABLES `supporter` WRITE;
/*!40000 ALTER TABLE `supporter` DISABLE KEYS */;
INSERT INTO `supporter` VALUES (1,'test');
/*!40000 ALTER TABLE `supporter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `User_Name` varchar(45) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Confirmed_Password` varchar(255) DEFAULT NULL,
  `Email` varchar(45) NOT NULL,
  `Mobile` varchar(45) DEFAULT NULL,
  `Profession_id` int(11) DEFAULT NULL,
  `Speciality_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_Name_UNIQUE` (`User_Name`),
  KEY `FK_profession_id_idx` (`Profession_id`),
  KEY `Fk_Speciality_id_idx` (`Speciality_id`),
  CONSTRAINT `FK_profession_id` FOREIGN KEY (`Profession_id`) REFERENCES `profession` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk_Speciality_id` FOREIGN KEY (`Speciality_id`) REFERENCES `specialty` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (21,'roufyda','dalal','roufyda','$2b$10$Hzo3D8IAYTVS1SNF1PdNU.G5a4HUzsW6wZtFDsJqQQ4MYp/eTBv5q','$2b$10$Hzo3D8IAYTVS1SNF1PdNU.G5a4HUzsW6wZtFDsJqQQ4MYp/eTBv5q','ENG_YASSER123@YAHOO.COM','2282356655',NULL,NULL),(22,'jjj','kkk','jk','$2b$10$Z.YeGAO/BwZkZBLptA89nux9dbRz2twg3OmYxQMtUnS40a4VNAGcm','$2b$10$Z.YeGAO/BwZkZBLptA89nux9dbRz2twg3OmYxQMtUnS40a4VNAGcm','ENG_YASSER123@YAHOO.COM','2282356655',NULL,NULL),(23,'t','y','ty','$2b$10$QZwGCy5JEcoer2qgQ6JUPOO3IEn7P5i3q1OgxCmJ4ujdkLHtthiiu','$2b$10$QZwGCy5JEcoer2qgQ6JUPOO3IEn7P5i3q1OgxCmJ4ujdkLHtthiiu','ENG_YASSER123@YAHOO.COM','2282356655',NULL,NULL),(24,'ahmed','yasser','ahmed','$2b$10$5bg2CVyAlg3m799BS7H4EOljWfmdDCyzl.9dMPnIYPAyuac3kup6a','$2b$10$5bg2CVyAlg3m799BS7H4EOljWfmdDCyzl.9dMPnIYPAyuac3kup6a','ENG_YASSER123@YAHOO.COM','2282356655',NULL,NULL),(30,'Qusay','Salama','qusay','$2b$10$ZwFMnct8NFt.BAFZReyyYejMmv8fFvhNH1h2nRoC1nX6pg6Wzam/m','$2b$10$ZwFMnct8NFt.BAFZReyyYejMmv8fFvhNH1h2nRoC1nX6pg6Wzam/m','qusay@plusone.expert','01222169689',NULL,NULL),(31,'Sally','Dalal','sally','$2b$10$F0KFvw/ohIVh9dSplGw0Zu3I52gkuuDTvXRRiv.aZiUMTDgonLwmq','$2b$10$F0KFvw/ohIVh9dSplGw0Zu3I52gkuuDTvXRRiv.aZiUMTDgonLwmq','ENG_YASSER123@YAHOO.COM','2282356655',NULL,NULL),(32,'Hadeer','Mahmoud','Hadeer','$2b$10$Uo/Pz4uXM2qCaGg3C8U1o.dmrC6ZhaFVWvEKMIl2.21YhBqB0VHLy','$2b$10$Uo/Pz4uXM2qCaGg3C8U1o.dmrC6ZhaFVWvEKMIl2.21YhBqB0VHLy','ENG_YASSER123@YAHOO.COM','2282356655',NULL,NULL),(33,'Lamar','Ahmed','Lamar','$2b$10$ni3eLv1.HSxDgeQ.U3mG/ev5xm8tRXvUzNazLi1t2GxrqVmOAPf5K','$2b$10$ni3eLv1.HSxDgeQ.U3mG/ev5xm8tRXvUzNazLi1t2GxrqVmOAPf5K','ENG_YASSER123@YAHOO.COM','2282356655',3,16);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_course`
--

DROP TABLE IF EXISTS `user_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_course` (
  `id` int(11) NOT NULL,
  `attendent_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_course_id_idx` (`course_id`),
  KEY `FK_attendent_id_idx` (`attendent_id`),
  CONSTRAINT `FK_attendent_id` FOREIGN KEY (`attendent_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_course`
--

LOCK TABLES `user_course` WRITE;
/*!40000 ALTER TABLE `user_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-20 23:10:01
