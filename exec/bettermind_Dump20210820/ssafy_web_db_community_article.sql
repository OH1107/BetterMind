-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 13.124.26.183    Database: ssafy_web_db
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.2

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
-- Table structure for table `community_article`
--

DROP TABLE IF EXISTS `community_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_article` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` tinyblob,
  `content` longtext COLLATE utf8mb4_general_ci,
  `created_at` datetime(6) DEFAULT NULL,
  `like_count` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKi6f4niup6ab6abmqglmrpdwk5` (`user_id`),
  CONSTRAINT `FKi6f4niup6ab6abmqglmrpdwk5` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_article`
--

LOCK TABLES `community_article` WRITE;
/*!40000 ALTER TABLE `community_article` DISABLE KEYS */;
INSERT INTO `community_article` VALUES (3,_binary '¬\ν\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0μ·¨μμ§λ‘','μλ¬΄κ²λ νκ³ μΆμ§ μμμ.\nλλ μ§κΈ μ·¨μ€ μ¬λΌνμ λΉ μ§κ±ΈκΉμ?','2021-08-19 23:08:10.223000',3,'κΈ΄ μ·¨μμ μ μ  μ§μ³κ°λ λΆλ€ κ³μ κ°μ?','2021-08-19 23:08:10.223000',12),(4,_binary '¬\ν\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0μΌλ°κ³ λ―Ό','μ κ° μ£½κΈ° μ μ μ μ μΌμ΄λ κΉμ?\nμ ν¬ λλΌκ° μ μμ΄ μΌμ΄λ κΉλ΄ λλ κ³΅μ°μ£Όμλ‘ λ°λκΉλ΄ λλ €μ μ λ λͺ» μ κ² κ°μλ°... κ΄μ°?μκΉμ..?\nμ λ§ λλ¬΄ λ¬΄μμμ...','2021-08-19 23:11:19.482000',0,'μ μμ λλ¬΄ μλ―Όν΄μ.','2021-08-19 23:11:19.482000',12),(5,_binary '¬\ν\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0νμ','λ΄μΌμ μ μ νμλ€μ΄ μ΄μ¬ν μ€λΉν νλ‘μ νΈλ₯Ό μκ°νλ λ μλλΉ!\nκ³ μν λ§νΌ μ’μ κ²°κ³Όκ° μμΌλ©΄ μ’κ² μ΄μ~~\nλ€λ€ μμν΄μ£ΌμΈμ₯γγγ','2021-08-19 23:20:22.978000',3,'λ΄μΌ μμ²­ μ€μν λ μΈλ° μμν΄μ£ΌμΈμ!','2021-08-19 23:20:22.978000',2),(6,_binary '¬\ν\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0μ‘μ','μ§κΈμ μ½λ‘λλ‘ μνκ·Όλ¬΄μ€μ΄λΌ μ‘μ λ³νμ νλ€μ§μμ§λ§,\nμΆνμ μ½λ‘λκ° μ’μλλ©΄ μ‘μμ μνν΄μ§κΉλ΄ κ±±μ μλλ€.','2021-08-19 23:25:38.782000',0,'μΌκ³Ό μ‘μλ₯Ό λ³ννμλλΆ','2021-08-19 23:25:38.782000',11);
/*!40000 ALTER TABLE `community_article` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-20  7:23:44
