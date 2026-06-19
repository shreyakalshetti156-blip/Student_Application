CREATE DATABASE IF NOT EXISTS STUDENT_DB;
USE  STUDENT_DB;

-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: student_db
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `COURSE_ID` int NOT NULL AUTO_INCREMENT,
  `COURSE_NAME` varchar(45) NOT NULL,
  `category` varchar(45) NOT NULL,
  `COURSE_INFO` varchar(400) NOT NULL,
  `MONTHS` int NOT NULL,
  `FEES` double NOT NULL,
  PRIMARY KEY (`COURSE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (101,'Java Backend','Java','Core Java, JDBC, JSP, Spring Boot, REST',6,25000),(102,'Python Backend','Python','Python, Django, REST API, MySQL',5,22000),(103,'MERN Stack','Angular/React','MongoDB, Express, React, Node.js',6,48000),(104,'MEAN Stack','Angular/React','MongoDB, Express, Angular, Node.js',6,47000),(105,'DevOps','Cloud','Linux, Git, Docker, Jenkins, Kubernetes',4,50000),(106,'Data Science','Python','Python, Pandas, ML, Statistics',6,60000),(107,'AWS Cloud','Cloud','EC2, S3, IAM, RDS, CloudWatch',3,35000),(108,'Software Testing','Java','Manual Testing, Selenium, TestNG',3,30000),(109,'React Frontend','Angular/React','HTML, CSS, JavaScript, React',4,32000),(110,'Cyber Security','Cloud','Networking, Ethical Hacking, SOC Basics',5,55000),(111,'Java Full Stack','Java','Core Java, JDBC, JSP, Spring Boot, REST,HTML, CSS, JavaScript, React,MySQL',9,50000),(112,'Python Full Stack','Python','Python, Django, REST API, MySQL,HTML, CSS, JavaScript, React',8,50000);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `COURSE_ID` int NOT NULL,
  `STUDENT_ID` int NOT NULL,
  `AMOUNT` double NOT NULL,
  `TRANSACTION_ID` bigint NOT NULL,
  `METHOD` varchar(45) NOT NULL,
  `PAYMENT_DATE` datetime NOT NULL,
  `STATUS` varchar(45) DEFAULT NULL,
  `PATH` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `TRANSACTION_ID_UNIQUE` (`TRANSACTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,101,5,29500,680551581113465,'netbanking','2026-02-02 10:12:12','SUCCESS','NA'),(2,101,5,29500,405848916775393,'netbanking','2026-02-02 10:18:08','SUCCESS','NA'),(3,101,5,29500,208591929278733,'netbanking','2026-02-02 10:20:57','SUCCESS','NA'),(4,101,5,29500,881831214579359,'netbanking','2026-02-02 10:21:40','SUCCESS','NA'),(5,101,5,29500,967138094796464,'netbanking','2026-02-02 10:23:42','SUCCESS','NA'),(6,102,6,25960,159307826910385,'upi','2026-02-02 10:26:05','SUCCESS','NA'),(7,101,2,29500,831197257636907,'upi','2026-02-17 10:28:19','SUCCESS','NA'),(8,102,2,25960,59289116306986,'wallet','2026-02-17 10:33:50','SUCCESS','NA'),(9,107,8,41300,248178576029906,'upi','2026-02-23 12:08:06','SUCCESS','NA'),(10,104,8,55460,461401478148011,'netbanking','2026-02-23 12:26:49','SUCCESS','NA');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  `PHONE` bigint NOT NULL,
  `MAIL` varchar(45) NOT NULL,
  `PASSWORD` varchar(45) NOT NULL,
  `DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PHONE_UNIQUE` (`PHONE`),
  UNIQUE KEY `MAIL_UNIQUE` (`MAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Punith',7000123123,'punith@gmail.com','12345678','2026-01-24 14:00:31'),(2,'Sagar',9988776655,'sagar@gmail.com','sagar123','2026-01-24 14:06:47'),(3,'Kiran Kumar',9000800001,'kiran123@gmail.com','1234','2026-01-31 14:39:34'),(4,'Subhash',8765487654,'subhash@gmail.com','subhash123','2026-01-31 16:29:40'),(5,'Vijay',9887766551,'vijay12@gmail.com','123456','2026-02-02 08:57:48'),(6,'Pavan Prakash',9876544567,'pavanp@gmail.com','123456','2026-02-02 10:25:20'),(7,'Shreyas',9988664433,'shreyas@gmail.com','shreyas123','2026-02-17 11:43:20'),(8,'Siddu',8654567843,'siddu@gmail.com','siddu123','2026-02-23 11:08:06');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-14 10:53:53
