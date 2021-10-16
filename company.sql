-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: company
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `affiliates`
--

DROP TABLE IF EXISTS `affiliates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliates` (
  `id` int unsigned NOT NULL COMMENT 'Идентификатор строки',
  `name_affiliate` varchar(100) NOT NULL COMMENT 'Название филиала',
  `city` varchar(100) NOT NULL COMMENT 'Город филиала',
  `country` varchar(100) NOT NULL COMMENT 'Страна филиала',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата изменения строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_affiliate` (`name_affiliate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица филиалов компании';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliates`
--

LOCK TABLES `affiliates` WRITE;
/*!40000 ALTER TABLE `affiliates` DISABLE KEYS */;
INSERT INTO `affiliates` VALUES (1,'My Arena','Moscow','Russia','2021-10-15 20:14:10','2021-10-15 20:14:10'),(2,'Palau Blaugrana','Barcelona','Spain','2021-10-15 20:14:10','2021-10-15 20:14:10'),(3,'San Siro','Milan','Italy','2021-10-15 20:14:10','2021-10-15 20:14:10');
/*!40000 ALTER TABLE `affiliates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int unsigned NOT NULL COMMENT 'Идентификатор строки',
  `name_department` varchar(100) NOT NULL COMMENT 'Название отдела',
  `affiliate_id` int unsigned NOT NULL COMMENT 'Ссылка на филиал',
  `responsibility` varchar(200) NOT NULL COMMENT 'Обязанности отдела',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата изменения строки',
  PRIMARY KEY (`id`),
  KEY `affiliate_id` (`affiliate_id`),
  CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`affiliate_id`) REFERENCES `affiliates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица отделов компании';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Director',1,'Управление','2021-10-15 22:11:29','2021-10-15 22:11:29'),(2,'Business',1,'Поиск и привлечение новых бизнес-партнеров','2021-10-15 22:11:29','2021-10-15 22:11:29'),(3,'Operations',1,'Работа с клиентами','2021-10-15 22:11:29','2021-10-15 22:11:29'),(4,'Managers',1,'Работа с бизнес-партнерами','2021-10-15 22:11:29','2021-10-15 22:11:29'),(5,'Analytics',1,'Аналитика данных и процессов','2021-10-15 22:11:29','2021-10-15 22:11:29'),(6,'Director',2,'Управление','2021-10-15 22:11:29','2021-10-15 22:11:29'),(7,'Business',2,'Поиск и привлечение новых бизнес-партнеров','2021-10-15 22:11:29','2021-10-15 22:11:29'),(8,'Operations',2,'Работа с клиентами','2021-10-15 22:11:29','2021-10-15 22:11:29'),(9,'Managers',2,'Работа с бизнес-партнерами','2021-10-15 22:11:29','2021-10-15 22:11:29'),(10,'Analytics',2,'Аналитика данных и процессов','2021-10-15 22:11:29','2021-10-15 22:11:29'),(11,'Director',3,'Управление','2021-10-15 22:11:29','2021-10-15 22:11:29'),(12,'Business',3,'Поиск и привлечение новых бизнес-партнеров','2021-10-15 22:11:29','2021-10-15 22:11:29'),(13,'Operations',3,'Работа с клиентами','2021-10-15 22:11:29','2021-10-15 22:11:29'),(14,'Managers',3,'Работа с бизнес-партнерами','2021-10-15 22:11:29','2021-10-15 22:11:29'),(15,'Analytics',3,'Аналитика данных и процессов','2021-10-15 22:11:29','2021-10-15 22:11:29');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments_employees`
--

DROP TABLE IF EXISTS `departments_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments_employees` (
  `department_id` int unsigned NOT NULL COMMENT 'ссылка на отдел',
  `employee_id` int unsigned NOT NULL COMMENT 'ссылка на сотрудника',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`department_id`,`employee_id`) COMMENT 'составной первичный ключ',
  KEY `departments_employees_employee_id` (`employee_id`),
  CONSTRAINT `departments_employees_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `departments_employees_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Сообщество по отделам, связь между сотрудниками и отделами';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments_employees`
--

LOCK TABLES `departments_employees` WRITE;
/*!40000 ALTER TABLE `departments_employees` DISABLE KEYS */;
INSERT INTO `departments_employees` VALUES (1,1,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(2,2,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(2,16,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(2,17,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(3,3,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(3,22,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(3,23,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(3,24,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(4,4,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(4,30,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(4,31,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(5,5,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(5,36,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(5,37,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(6,6,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(7,7,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(7,18,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(7,19,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(8,8,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(8,25,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(8,26,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(8,27,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(9,9,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(9,32,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(9,33,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(10,10,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(10,38,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(10,39,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(11,11,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(12,12,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(12,20,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(12,21,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(13,13,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(13,28,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(13,29,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(14,14,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(14,34,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(14,35,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(14,42,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(15,15,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(15,40,'2021-10-16 13:36:34','2021-10-16 13:36:34'),(15,41,'2021-10-16 13:36:34','2021-10-16 13:36:34');
/*!40000 ALTER TABLE `departments_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `first_name` varchar(100) NOT NULL COMMENT 'Имя сотрудника',
  `last_name` varchar(100) NOT NULL COMMENT 'Фамилия сотрудника',
  `birthday` date NOT NULL COMMENT 'Дата рождения',
  `gender` enum('M','F') NOT NULL COMMENT 'Пол',
  `email` varchar(100) NOT NULL COMMENT 'Email пользователя',
  `affiliate` int unsigned NOT NULL COMMENT 'Филиал сотрудника',
  `department` int unsigned NOT NULL COMMENT 'Отдел сотрудника',
  `post` int unsigned NOT NULL COMMENT 'Должность сотрудника',
  `phone` varchar(12) NOT NULL COMMENT 'Мобильный телефон пользователя',
  `phone_work` int unsigned NOT NULL COMMENT 'Рабочий телефон пользователя',
  `status_in_company` enum('Active','Dismissed') NOT NULL DEFAULT 'Active' COMMENT 'Статус в компании',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата изменения строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `affiliate` (`affiliate`),
  KEY `department` (`department`),
  KEY `post` (`post`),
  KEY `phone_work` (`phone_work`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`affiliate`) REFERENCES `affiliates` (`id`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`department`) REFERENCES `departments` (`id`),
  CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`post`) REFERENCES `posts` (`id`),
  CONSTRAINT `employees_ibfk_4` FOREIGN KEY (`phone_work`) REFERENCES `phones` (`id`),
  CONSTRAINT `check_home_phone` CHECK (regexp_like(`phone`,_utf8mb4'^\\+79[0-9]{9}$'))
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица сотрудников';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Tyrell','Erdman','1992-02-08','M','luisa.ruecker@example.com',1,1,1,'+79137743531',1,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(2,'Russ','Ullrich','1988-01-11','M','ppurdy@example.org',1,2,2,'+79917490331',2,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(3,'Stephan','Nikolaus','2010-05-26','M','dakota.bernier@example.com',1,2,16,'+79174221096',3,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(4,'Adriana','Douglas','2016-04-18','F','amira.littel@example.com',1,2,17,'+79118634517',4,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(5,'Dario','Hettinger','1991-08-02','M','d\'amore.halle@example.net',1,3,3,'+79070509327',5,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(6,'Virgie','Legros','1998-11-23','F','eulalia.dubuque@example.net',1,3,22,'+79996643115',6,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(7,'Ruth','Kling','1971-07-01','M','jules.prosacco@example.net',1,3,23,'+79771687630',7,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(8,'Brittany','Ruecker','2011-07-27','F','alva.abernathy@example.com',1,3,24,'+79868508836',8,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(9,'Sydni','Hudson','2000-04-28','F','rey.heller@example.net',1,4,30,'+79027481322',9,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(10,'Justyn','Blick','2021-07-27','M','rowena96@example.org',1,4,31,'+79531880130',10,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(11,'Theodora','Barrows','1990-12-20','F','abshire.helga@example.com',1,5,36,'+79576956716',11,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(12,'Andreane','Hegmann','2004-11-25','M','murphy.amiya@example.org',1,5,37,'+79289143223',12,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(13,'Levi','Frami','1997-06-03','M','golda.stehr@example.net',1,4,4,'+79714845997',13,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(14,'Jodie','Bogisich','1970-01-13','M','peffertz@example.org',1,5,5,'+79706800349',14,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(15,'Alphonso','Koss','1995-12-16','M','harber.renee@example.org',2,6,6,'+79389463785',15,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(16,'Zula','Paucek','2009-09-03','F','dee33@example.net',2,7,7,'+79826917908',16,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(17,'Aaliyah','Reichert','1990-05-09','F','lyla.fadel@example.org',2,7,19,'+79966198217',17,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(18,'Rosalinda','Torp','1998-03-06','M','marisol.koss@example.org',2,7,18,'+79350237398',18,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(19,'Aryanna','Jacobs','1972-05-27','F','oceane30@example.org',2,8,8,'+79852592366',19,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(20,'Kyra','Gorczany','2007-10-29','F','bsteuber@example.com',2,8,25,'+79212249672',20,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(21,'Zackery','Lynch','2001-08-25','M','gilda.pagac@example.org',2,8,26,'+79503471288',21,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(22,'Aiden','Corkery','1998-06-27','M','vdenesik@example.net',2,8,27,'+79880607459',22,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(23,'Juana','Lehner','2012-06-07','M','eweber@example.net',2,9,9,'+79892623464',23,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(24,'Mitchell','Hettinger','1983-07-17','F','ferry.georgianna@example.net',2,9,32,'+79821294975',24,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(25,'Leonard','Rohan','1971-03-07','F','yesenia29@example.net',2,9,33,'+79428604515',25,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(26,'Jessica','Jerde','1983-02-18','F','dicki.camylle@example.net',2,10,10,'+79679137679',26,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(27,'Cristina','Hahn','1994-06-03','F','bernie50@example.net',2,10,38,'+79109874885',27,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(28,'Christy','Rutherford','2017-11-08','F','wisoky.zella@example.com',2,10,39,'+79511961417',28,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(29,'Katharina','Stroman','1982-02-02','F','price.barrett@example.com',3,11,11,'+79230182462',29,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(30,'Amelia','Streich','2007-06-08','F','metz.andy@example.net',3,12,12,'+79615028089',30,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(31,'Branson','Schoen','2014-12-18','F','harvey.lisandro@example.net',3,12,21,'+79384593094',31,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(32,'Cecil','Mertz','2000-07-02','F','arno.bailey@example.net',3,12,20,'+79077881234',32,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(33,'Jessie','Sporer','1995-03-30','M','hans88@example.net',3,13,13,'+79235626919',33,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(34,'Raheem','Wiza','1981-04-07','F','jasmin.kulas@example.com',3,13,28,'+79944490922',34,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(35,'Stacy','Waters','1998-02-05','F','boyle.emmett@example.com',3,13,29,'+79015573889',35,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(36,'Nels','Toy','1990-06-20','M','kathryn52@example.org',3,14,14,'+79244396709',36,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(37,'Brando','West','1975-03-09','F','boehm.onie@example.org',3,14,34,'+79175261910',37,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(38,'Laurie','Parker','2018-12-25','F','isac97@example.org',3,14,35,'+79143119456',38,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(39,'Lavonne','Yundt','2016-05-01','F','kamren.kunze@example.com',3,14,42,'+79189811578',39,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(40,'Wanda','Becker','1979-10-05','F','modesta.dubuque@example.org',3,15,15,'+79519699556',40,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(41,'Freddie','Gottlieb','1987-08-15','F','wilson.douglas@example.net',3,15,41,'+79029063079',41,'Active','2021-10-16 12:00:15','2021-10-16 12:00:15'),(42,'Hertha','Walker','1977-02-27','F','aliza.dickinson@example.net',1,3,22,'+79586216756',42,'Dismissed','2021-10-16 12:00:15','2021-10-16 13:45:33');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hobbies`
--

DROP TABLE IF EXISTS `hobbies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hobbies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(100) NOT NULL COMMENT 'Название хобби',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица хобби сотрудников';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobbies`
--

LOCK TABLES `hobbies` WRITE;
/*!40000 ALTER TABLE `hobbies` DISABLE KEYS */;
INSERT INTO `hobbies` VALUES (1,'Футбол','2021-10-15 23:48:33','2021-10-15 23:48:33'),(2,'Хоккей','2021-10-15 23:48:33','2021-10-15 23:48:33'),(3,'Баскетбол','2021-10-15 23:48:33','2021-10-15 23:48:33'),(4,'Теннис','2021-10-15 23:48:33','2021-10-15 23:48:33'),(5,'Волейбол','2021-10-15 23:48:33','2021-10-15 23:48:33'),(6,'Плавание','2021-10-15 23:48:33','2021-10-15 23:48:33'),(7,'Бадминтон','2021-10-15 23:48:33','2021-10-15 23:48:33'),(8,'Лапта','2021-10-15 23:48:33','2021-10-15 23:48:33'),(9,'Шахматы','2021-10-15 23:48:33','2021-10-15 23:48:33'),(10,'Водное поло','2021-10-15 23:48:33','2021-10-15 23:48:33'),(11,'Городки','2021-10-15 23:49:33','2021-10-15 23:49:33');
/*!40000 ALTER TABLE `hobbies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hobbies_employees`
--

DROP TABLE IF EXISTS `hobbies_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hobbies_employees` (
  `hobbies_id` int unsigned NOT NULL COMMENT 'ссылка на хобби',
  `employee_id` int unsigned NOT NULL COMMENT 'ссылка на сотрудника',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`hobbies_id`,`employee_id`) COMMENT 'составной первичный ключ',
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `hobbies_employees_ibfk_1` FOREIGN KEY (`hobbies_id`) REFERENCES `hobbies` (`id`),
  CONSTRAINT `hobbies_employees_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Связь между сотрудниками и их хобби';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobbies_employees`
--

LOCK TABLES `hobbies_employees` WRITE;
/*!40000 ALTER TABLE `hobbies_employees` DISABLE KEYS */;
INSERT INTO `hobbies_employees` VALUES (1,11,'2021-10-16 14:24:25','2021-10-16 14:24:25'),(1,12,'2021-10-16 14:24:00','2021-10-16 14:24:00'),(1,29,'2021-10-16 14:23:09','2021-10-16 14:23:09'),(2,9,'2021-10-16 14:23:09','2021-10-16 14:23:09'),(2,30,'2021-10-16 14:24:00','2021-10-16 14:24:00'),(2,36,'2021-10-16 14:24:25','2021-10-16 14:24:25'),(3,24,'2021-10-16 14:24:25','2021-10-16 14:24:25'),(3,33,'2021-10-16 14:24:00','2021-10-16 14:24:00'),(3,38,'2021-10-16 14:23:09','2021-10-16 14:23:09'),(4,10,'2021-10-16 14:24:25','2021-10-16 14:24:25'),(4,33,'2021-10-16 14:24:00','2021-10-16 14:24:00'),(4,41,'2021-10-16 14:23:09','2021-10-16 14:23:09'),(5,7,'2021-10-16 14:23:30','2021-10-16 14:23:30'),(5,26,'2021-10-16 14:24:07','2021-10-16 14:24:07'),(5,35,'2021-10-16 14:24:20','2021-10-16 14:24:20'),(6,9,'2021-10-16 14:24:20','2021-10-16 14:24:20'),(6,28,'2021-10-16 14:24:07','2021-10-16 14:24:07'),(6,36,'2021-10-16 14:23:30','2021-10-16 14:23:30'),(7,21,'2021-10-16 14:24:20','2021-10-16 14:24:20'),(7,22,'2021-10-16 14:24:07','2021-10-16 14:24:07'),(7,34,'2021-10-16 14:23:30','2021-10-16 14:23:30'),(8,20,'2021-10-16 14:23:30','2021-10-16 14:23:30'),(8,26,'2021-10-16 14:24:07','2021-10-16 14:24:07'),(8,38,'2021-10-16 14:24:20','2021-10-16 14:24:20'),(9,2,'2021-10-16 14:24:20','2021-10-16 14:24:20'),(9,21,'2021-10-16 14:24:07','2021-10-16 14:24:07'),(9,38,'2021-10-16 14:23:30','2021-10-16 14:23:30'),(10,9,'2021-10-16 14:23:30','2021-10-16 14:23:30'),(10,20,'2021-10-16 14:24:20','2021-10-16 14:24:20'),(10,27,'2021-10-16 14:24:07','2021-10-16 14:24:07');
/*!40000 ALTER TABLE `hobbies_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `filename` varchar(255) NOT NULL COMMENT 'Полный путь к файлу',
  `media_type_id` int unsigned NOT NULL COMMENT 'ссылка на тип файла',
  `metadata` json NOT NULL COMMENT 'Метаданные файла',
  `employee_id` int unsigned NOT NULL COMMENT 'ссылка на пользователя',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `media_type_id` (`media_type_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Медиафайлы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'https://www.some_server.com/some_directory/567152c4a6',3,'{\"size\": 534297, \"extension\": \"png\", \"resolution\": \"213x1065\"}',8,'2021-10-16 12:23:35','2021-10-16 12:52:50'),(2,'https://www.some_server.com/some_directory/394bddb0ce,\"JPEG\"',3,'{\"size\": 537347, \"extension\": \"JPEG\", \"resolution\": \"326x619\"}',39,'2021-10-16 12:35:13','2021-10-16 12:54:56'),(3,'https://www.some_server.com/some_directory/3cd547055e,\"JPEG\"',3,'{\"size\": 929781, \"extension\": \"JPEG\", \"resolution\": \"533x479\"}',26,'2021-10-16 12:37:40','2021-10-16 12:54:56'),(4,'https://www.some_server.com/some_directory/167bf1b4d3,\"JPEG\"',3,'{\"size\": 663798, \"extension\": \"JPEG\", \"resolution\": \"1097x1094\"}',42,'2021-10-16 12:37:40','2021-10-16 12:54:56'),(5,'https://www.some_server.com/some_directory/90eae13a74,\"JPEG\"',4,'{\"size\": 647710, \"extension\": \"JPEG\", \"resolution\": \"282x1069\"}',13,'2021-10-16 12:37:58','2021-10-16 12:54:56'),(6,'https://www.some_server.com/some_directory/d16aecd7ae,\"JPEG\"',1,'{\"size\": 455097, \"extension\": \"JPEG\", \"resolution\": \"243x451\"}',14,'2021-10-16 12:37:58','2021-10-16 12:54:56'),(7,'https://www.some_server.com/some_directory/45c6cc2ce4,\"JPEG\"',2,'{\"size\": 920790, \"extension\": \"JPEG\", \"resolution\": \"963x653\"}',1,'2021-10-16 12:42:07','2021-10-16 12:54:56'),(8,'https://www.some_server.com/some_directory/239cf02202,\"JPEG\"',2,'{\"size\": 220655, \"extension\": \"JPEG\", \"resolution\": \"675x315\"}',2,'2021-10-16 12:42:07','2021-10-16 12:54:56'),(9,'https://www.some_server.com/some_directory/8633d88249,\"JPEG\"',2,'{\"size\": 100730, \"extension\": \"JPEG\", \"resolution\": \"556x1078\"}',3,'2021-10-16 12:42:07','2021-10-16 12:54:56'),(10,'https://www.some_server.com/some_directory/3768f436fb,\"JPEG\"',2,'{\"size\": 677199, \"extension\": \"JPEG\", \"resolution\": \"919x163\"}',4,'2021-10-16 12:42:07','2021-10-16 12:54:56'),(11,'https://www.some_server.com/some_directory/9ee4efcb22,\"JPEG\"',2,'{\"size\": 119917, \"extension\": \"JPEG\", \"resolution\": \"112x803\"}',5,'2021-10-16 12:43:00','2021-10-16 12:54:56'),(12,'https://www.some_server.com/some_directory/90b9f3a31d,\"JPEG\"',2,'{\"size\": 278380, \"extension\": \"JPEG\", \"resolution\": \"1059x1061\"}',6,'2021-10-16 12:43:00','2021-10-16 12:54:56'),(13,'https://www.some_server.com/some_directory/0486ae51d5,\"JPEG\"',2,'{\"size\": 770769, \"extension\": \"JPEG\", \"resolution\": \"159x1087\"}',7,'2021-10-16 12:43:00','2021-10-16 12:54:56'),(14,'https://www.some_server.com/some_directory/e27accc623,\"JPEG\"',2,'{\"size\": 825011, \"extension\": \"JPEG\", \"resolution\": \"952x887\"}',8,'2021-10-16 12:43:00','2021-10-16 12:54:56'),(15,'https://www.some_server.com/some_directory/c37b31b65c,\"JPEG\"',2,'{\"size\": 546490, \"extension\": \"JPEG\", \"resolution\": \"686x391\"}',9,'2021-10-16 12:43:28','2021-10-16 12:54:56'),(16,'https://www.some_server.com/some_directory/f4c28907c8,\"JPEG\"',2,'{\"size\": 620009, \"extension\": \"JPEG\", \"resolution\": \"103x256\"}',10,'2021-10-16 12:43:28','2021-10-16 12:54:56'),(17,'https://www.some_server.com/some_directory/1d59228e8d,\"JPEG\"',2,'{\"size\": 397447, \"extension\": \"JPEG\", \"resolution\": \"766x241\"}',11,'2021-10-16 12:43:28','2021-10-16 12:54:56'),(18,'https://www.some_server.com/some_directory/895b4e5d53,\"JPEG\"',2,'{\"size\": 103297, \"extension\": \"JPEG\", \"resolution\": \"500x793\"}',12,'2021-10-16 12:43:28','2021-10-16 12:54:56'),(19,'https://www.some_server.com/some_directory/ffd44b94e9,\"JPEG\"',2,'{\"size\": 237489, \"extension\": \"JPEG\", \"resolution\": \"497x375\"}',13,'2021-10-16 12:43:53','2021-10-16 12:54:56'),(20,'https://www.some_server.com/some_directory/06da5ed32e,\"JPEG\"',2,'{\"size\": 91491, \"extension\": \"JPEG\", \"resolution\": \"1007x361\"}',14,'2021-10-16 12:43:53','2021-10-16 12:54:56'),(21,'https://www.some_server.com/some_directory/02580d3215,\"JPEG\"',2,'{\"size\": 144827, \"extension\": \"JPEG\", \"resolution\": \"1066x498\"}',15,'2021-10-16 12:43:53','2021-10-16 12:54:56'),(22,'https://www.some_server.com/some_directory/9b8e5d74e6,\"JPEG\"',2,'{\"size\": 264794, \"extension\": \"JPEG\", \"resolution\": \"148x546\"}',16,'2021-10-16 12:43:53','2021-10-16 12:54:56'),(23,'https://www.some_server.com/some_directory/8915fb74a9,\"JPEG\"',2,'{\"size\": 93283, \"extension\": \"JPEG\", \"resolution\": \"307x857\"}',17,'2021-10-16 12:44:28','2021-10-16 12:54:56'),(24,'https://www.some_server.com/some_directory/efa5e2217a,\"JPEG\"',2,'{\"size\": 547570, \"extension\": \"JPEG\", \"resolution\": \"346x688\"}',18,'2021-10-16 12:44:28','2021-10-16 12:54:56'),(25,'https://www.some_server.com/some_directory/30f4c95f01,\"JPEG\"',2,'{\"size\": 260474, \"extension\": \"JPEG\", \"resolution\": \"786x749\"}',19,'2021-10-16 12:44:28','2021-10-16 12:54:56'),(26,'https://www.some_server.com/some_directory/812eb3111a,\"JPEG\"',2,'{\"size\": 989210, \"extension\": \"JPEG\", \"resolution\": \"484x1052\"}',20,'2021-10-16 12:44:28','2021-10-16 12:54:56'),(27,'https://www.some_server.com/some_directory/2494c5d387,\"JPEG\"',2,'{\"size\": 200604, \"extension\": \"JPEG\", \"resolution\": \"267x336\"}',21,'2021-10-16 12:45:02','2021-10-16 12:54:56'),(28,'https://www.some_server.com/some_directory/687f6d403d,\"JPEG\"',2,'{\"size\": 681119, \"extension\": \"JPEG\", \"resolution\": \"471x916\"}',22,'2021-10-16 12:45:02','2021-10-16 12:54:56'),(29,'https://www.some_server.com/some_directory/7d0dc78e95,\"JPEG\"',2,'{\"size\": 374664, \"extension\": \"JPEG\", \"resolution\": \"1079x874\"}',23,'2021-10-16 12:45:02','2021-10-16 12:54:56'),(30,'https://www.some_server.com/some_directory/f1a4a66dc0,\"JPEG\"',2,'{\"size\": 339170, \"extension\": \"JPEG\", \"resolution\": \"998x575\"}',24,'2021-10-16 12:45:02','2021-10-16 12:54:56'),(31,'https://www.some_server.com/some_directory/78169931de,\"JPEG\"',2,'{\"size\": 987394, \"extension\": \"JPEG\", \"resolution\": \"988x578\"}',25,'2021-10-16 12:47:19','2021-10-16 12:54:56'),(32,'https://www.some_server.com/some_directory/ff1c414fc2,\"JPEG\"',2,'{\"size\": 203175, \"extension\": \"JPEG\", \"resolution\": \"932x654\"}',26,'2021-10-16 12:47:19','2021-10-16 12:54:56'),(33,'https://www.some_server.com/some_directory/b082dae8b9,\"JPEG\"',2,'{\"size\": 709879, \"extension\": \"JPEG\", \"resolution\": \"825x595\"}',27,'2021-10-16 12:47:19','2021-10-16 12:54:56'),(34,'https://www.some_server.com/some_directory/6732b3ce0c,\"JPEG\"',2,'{\"size\": 31153, \"extension\": \"JPEG\", \"resolution\": \"344x229\"}',28,'2021-10-16 12:47:19','2021-10-16 12:54:56'),(35,'https://www.some_server.com/some_directory/78df3b6639,\"JPEG\"',2,'{\"size\": 185064, \"extension\": \"JPEG\", \"resolution\": \"280x448\"}',29,'2021-10-16 12:47:39','2021-10-16 12:54:56'),(36,'https://www.some_server.com/some_directory/d49c237665,\"JPEG\"',2,'{\"size\": 953488, \"extension\": \"JPEG\", \"resolution\": \"268x1080\"}',30,'2021-10-16 12:47:39','2021-10-16 12:54:56'),(37,'https://www.some_server.com/some_directory/0816df2ca1,\"JPEG\"',2,'{\"size\": 56010, \"extension\": \"JPEG\", \"resolution\": \"180x335\"}',31,'2021-10-16 12:47:39','2021-10-16 12:54:56'),(38,'https://www.some_server.com/some_directory/24d65a7b9c,\"JPEG\"',2,'{\"size\": 978845, \"extension\": \"JPEG\", \"resolution\": \"182x574\"}',32,'2021-10-16 12:47:39','2021-10-16 12:54:56'),(39,'https://www.some_server.com/some_directory/bd4b8afe96,\"JPEG\"',2,'{\"size\": 206763, \"extension\": \"JPEG\", \"resolution\": \"755x757\"}',33,'2021-10-16 12:48:04','2021-10-16 12:54:56'),(40,'https://www.some_server.com/some_directory/19cc380e5c,\"JPEG\"',2,'{\"size\": 633227, \"extension\": \"JPEG\", \"resolution\": \"302x213\"}',34,'2021-10-16 12:48:04','2021-10-16 12:54:56'),(41,'https://www.some_server.com/some_directory/48326abaf2,\"JPEG\"',2,'{\"size\": 448805, \"extension\": \"JPEG\", \"resolution\": \"471x609\"}',35,'2021-10-16 12:48:04','2021-10-16 12:54:56'),(42,'https://www.some_server.com/some_directory/6c8fac43c0,\"JPEG\"',2,'{\"size\": 648679, \"extension\": \"JPEG\", \"resolution\": \"1036x835\"}',36,'2021-10-16 12:48:04','2021-10-16 12:54:56'),(43,'https://www.some_server.com/some_directory/73ff2ac44e,\"JPEG\"',2,'{\"size\": 143423, \"extension\": \"JPEG\", \"resolution\": \"206x202\"}',37,'2021-10-16 12:51:12','2021-10-16 12:54:56'),(44,'https://www.some_server.com/some_directory/a0378f1bb9,\"JPEG\"',2,'{\"size\": 651001, \"extension\": \"JPEG\", \"resolution\": \"780x549\"}',38,'2021-10-16 12:51:12','2021-10-16 12:54:56'),(45,'https://www.some_server.com/some_directory/b0ca617d9c,\"JPEG\"',2,'{\"size\": 675955, \"extension\": \"JPEG\", \"resolution\": \"865x900\"}',39,'2021-10-16 12:51:12','2021-10-16 12:54:56'),(46,'https://www.some_server.com/some_directory/030662e8a9,\"JPEG\"',2,'{\"size\": 121495, \"extension\": \"JPEG\", \"resolution\": \"594x205\"}',40,'2021-10-16 12:51:12','2021-10-16 12:54:56'),(47,'https://www.some_server.com/some_directory/6138c2c51a,\"JPEG\"',2,'{\"size\": 920209, \"extension\": \"JPEG\", \"resolution\": \"558x630\"}',41,'2021-10-16 12:51:39','2021-10-16 12:54:56'),(48,'https://www.some_server.com/some_directory/4558a5a2a3,\"JPEG\"',2,'{\"size\": 790626, \"extension\": \"JPEG\", \"resolution\": \"224x350\"}',42,'2021-10-16 12:51:39','2021-10-16 12:54:56'),(49,'https://www.some_server.com/some_directory/2d8dac2c81,\"JPEG\"',2,'{\"size\": 647651, \"extension\": \"JPEG\", \"resolution\": \"698x149\"}',8,'2021-10-16 12:51:39','2021-10-16 12:54:56'),(50,'https://www.some_server.com/some_directory/f8498db350,\"JPEG\"',2,'{\"size\": 103334, \"extension\": \"JPEG\", \"resolution\": \"266x621\"}',15,'2021-10-16 12:51:39','2021-10-16 12:54:56'),(51,'https://www.some_server.com/some_directory/b20f40ff2d,\"JPEG\"',5,'{\"size\": 200685, \"extension\": \"JPEG\", \"resolution\": \"123x613\"}',21,'2021-10-16 12:53:23','2021-10-16 12:54:56'),(52,'https://www.some_server.com/some_directory/621bdd08ba,\"JPEG\"',2,'{\"size\": 270911, \"extension\": \"JPEG\", \"resolution\": \"797x773\"}',12,'2021-10-16 12:53:23','2021-10-16 12:54:56'),(53,'https://www.some_server.com/some_directory/1ae8a69ee3,\"JPEG\"',5,'{\"size\": 899569, \"extension\": \"JPEG\", \"resolution\": \"598x892\"}',20,'2021-10-16 12:53:24','2021-10-16 12:54:56'),(54,'https://www.some_server.com/some_directory/c8b8aa2064,\"JPEG\"',3,'{\"size\": 165648, \"extension\": \"JPEG\", \"resolution\": \"695x579\"}',26,'2021-10-16 12:53:24','2021-10-16 12:54:56'),(55,'https://www.some_server.com/some_directory/231f6c7dd1,\"JPEG\"',2,'{\"size\": 416016, \"extension\": \"JPEG\", \"resolution\": \"419x447\"}',33,'2021-10-16 12:53:25','2021-10-16 12:54:56'),(56,'https://www.some_server.com/some_directory/ee59711482,\"JPEG\"',5,'{\"size\": 280212, \"extension\": \"JPEG\", \"resolution\": \"578x650\"}',14,'2021-10-16 12:53:25','2021-10-16 12:54:56'),(57,'https://www.some_server.com/some_directory/4480dc6938,\"JPEG\"',4,'{\"size\": 948118, \"extension\": \"JPEG\", \"resolution\": \"575x632\"}',11,'2021-10-16 12:53:26','2021-10-16 12:54:56'),(58,'https://www.some_server.com/some_directory/d0caaf5499,\"JPEG\"',2,'{\"size\": 478090, \"extension\": \"JPEG\", \"resolution\": \"735x842\"}',34,'2021-10-16 12:53:26','2021-10-16 12:54:56'),(59,'https://www.some_server.com/some_directory/d36ab36b47,\"JPEG\"',4,'{\"size\": 775846, \"extension\": \"JPEG\", \"resolution\": \"1048x516\"}',10,'2021-10-16 12:53:26','2021-10-16 12:54:56'),(60,'https://www.some_server.com/some_directory/6ec65ed146,\"JPEG\"',5,'{\"size\": 985810, \"extension\": \"JPEG\", \"resolution\": \"157x429\"}',20,'2021-10-16 12:53:26','2021-10-16 12:54:56'),(61,'https://www.some_server.com/some_directory/fd74da58c9,\"JPEG\"',3,'{\"size\": 356448, \"extension\": \"JPEG\", \"resolution\": \"374x404\"}',30,'2021-10-16 12:53:27','2021-10-16 12:54:56'),(62,'https://www.some_server.com/some_directory/2d34502c57,\"JPEG\"',5,'{\"size\": 360341, \"extension\": \"JPEG\", \"resolution\": \"433x686\"}',40,'2021-10-16 12:53:27','2021-10-16 12:54:56'),(63,'https://www.some_server.com/some_directory/64e210eea8,\"JPEG\"',4,'{\"size\": 871206, \"extension\": \"JPEG\", \"resolution\": \"308x528\"}',22,'2021-10-16 12:53:28','2021-10-16 12:54:56'),(64,'https://www.some_server.com/some_directory/8f37300351,\"JPEG\"',5,'{\"size\": 981092, \"extension\": \"JPEG\", \"resolution\": \"1063x974\"}',21,'2021-10-16 12:53:28','2021-10-16 12:54:56'),(65,'https://www.some_server.com/some_directory/56214aa2dc,\"JPEG\"',3,'{\"size\": 899902, \"extension\": \"JPEG\", \"resolution\": \"260x203\"}',2,'2021-10-16 12:53:28','2021-10-16 12:54:56'),(66,'https://www.some_server.com/some_directory/716bac0e32,\"JPEG\"',2,'{\"size\": 560922, \"extension\": \"JPEG\", \"resolution\": \"205x945\"}',39,'2021-10-16 12:53:28','2021-10-16 12:54:56'),(67,'https://www.some_server.com/some_directory/0f611c525e,\"JPEG\"',2,'{\"size\": 576847, \"extension\": \"JPEG\", \"resolution\": \"1020x973\"}',26,'2021-10-16 12:53:29','2021-10-16 12:54:56'),(68,'https://www.some_server.com/some_directory/b43a7fe965,\"JPEG\"',1,'{\"size\": 759074, \"extension\": \"JPEG\", \"resolution\": \"318x913\"}',18,'2021-10-16 12:53:29','2021-10-16 12:54:56'),(69,'https://www.some_server.com/some_directory/da2471adfd,\"JPEG\"',5,'{\"size\": 562333, \"extension\": \"JPEG\", \"resolution\": \"248x154\"}',35,'2021-10-16 12:53:30','2021-10-16 12:54:56'),(70,'https://www.some_server.com/some_directory/849d850c27,\"JPEG\"',3,'{\"size\": 195898, \"extension\": \"JPEG\", \"resolution\": \"791x968\"}',12,'2021-10-16 12:53:30','2021-10-16 12:54:56'),(71,'https://www.some_server.com/some_directory/6ad5273509,\"JPEG\"',5,'{\"size\": 226504, \"extension\": \"JPEG\", \"resolution\": \"566x751\"}',37,'2021-10-16 12:53:30','2021-10-16 12:54:56'),(72,'https://www.some_server.com/some_directory/637d42a0f0,\"JPEG\"',1,'{\"size\": 581846, \"extension\": \"JPEG\", \"resolution\": \"649x102\"}',16,'2021-10-16 12:53:30','2021-10-16 12:54:56'),(73,'https://www.some_server.com/some_directory/1c0902d5d3,\"JPEG\"',5,'{\"size\": 273418, \"extension\": \"JPEG\", \"resolution\": \"654x1050\"}',4,'2021-10-16 12:53:31','2021-10-16 12:54:56'),(74,'https://www.some_server.com/some_directory/8a53c2b795,\"JPEG\"',4,'{\"size\": 942270, \"extension\": \"JPEG\", \"resolution\": \"556x555\"}',39,'2021-10-16 12:53:31','2021-10-16 12:54:56'),(75,'https://www.some_server.com/some_directory/3b27a5da77,\"JPEG\"',1,'{\"size\": 320247, \"extension\": \"JPEG\", \"resolution\": \"184x563\"}',3,'2021-10-16 12:53:31','2021-10-16 12:54:56'),(76,'https://www.some_server.com/some_directory/ddb6603f27,\"JPEG\"',3,'{\"size\": 369384, \"extension\": \"JPEG\", \"resolution\": \"663x809\"}',37,'2021-10-16 12:53:31','2021-10-16 12:54:56'),(77,'https://www.some_server.com/some_directory/abd6be7d0e,\"JPEG\"',2,'{\"size\": 650500, \"extension\": \"JPEG\", \"resolution\": \"674x1020\"}',37,'2021-10-16 12:53:32','2021-10-16 12:54:56'),(78,'https://www.some_server.com/some_directory/b71ae8cd82,\"JPEG\"',3,'{\"size\": 788490, \"extension\": \"JPEG\", \"resolution\": \"425x362\"}',15,'2021-10-16 12:53:32','2021-10-16 12:54:56'),(79,'https://www.some_server.com/some_directory/7e2f425bf0,\"JPEG\"',3,'{\"size\": 541067, \"extension\": \"JPEG\", \"resolution\": \"479x373\"}',10,'2021-10-16 12:53:33','2021-10-16 12:54:56'),(80,'https://www.some_server.com/some_directory/71de6b009d,\"JPEG\"',5,'{\"size\": 798719, \"extension\": \"JPEG\", \"resolution\": \"221x309\"}',29,'2021-10-16 12:53:33','2021-10-16 12:54:56'),(81,'https://www.some_server.com/some_directory/aa4bfe7de3,\"JPEG\"',5,'{\"size\": 232899, \"extension\": \"JPEG\", \"resolution\": \"492x362\"}',6,'2021-10-16 12:53:33','2021-10-16 12:54:56'),(82,'https://www.some_server.com/some_directory/95fc241d02,\"JPEG\"',1,'{\"size\": 705854, \"extension\": \"JPEG\", \"resolution\": \"388x424\"}',32,'2021-10-16 12:53:33','2021-10-16 12:54:56'),(83,'https://www.some_server.com/some_directory/1a89f27caa,\"JPEG\"',5,'{\"size\": 565572, \"extension\": \"JPEG\", \"resolution\": \"521x509\"}',33,'2021-10-16 12:53:34','2021-10-16 12:54:56'),(84,'https://www.some_server.com/some_directory/40e86b1f03,\"JPEG\"',1,'{\"size\": 549619, \"extension\": \"JPEG\", \"resolution\": \"464x272\"}',33,'2021-10-16 12:53:34','2021-10-16 12:54:56'),(85,'https://www.some_server.com/some_directory/60c296f8e4,\"JPEG\"',2,'{\"size\": 580532, \"extension\": \"JPEG\", \"resolution\": \"1073x226\"}',30,'2021-10-16 12:53:34','2021-10-16 12:54:56'),(86,'https://www.some_server.com/some_directory/a4c06a595c,\"JPEG\"',4,'{\"size\": 382425, \"extension\": \"JPEG\", \"resolution\": \"648x696\"}',15,'2021-10-16 12:53:34','2021-10-16 12:54:56'),(87,'https://www.some_server.com/some_directory/1634d45add,\"JPEG\"',3,'{\"size\": 656515, \"extension\": \"JPEG\", \"resolution\": \"975x508\"}',18,'2021-10-16 12:53:35','2021-10-16 12:54:56'),(88,'https://www.some_server.com/some_directory/ee3843e312,\"JPEG\"',5,'{\"size\": 452126, \"extension\": \"JPEG\", \"resolution\": \"361x1051\"}',41,'2021-10-16 12:53:35','2021-10-16 12:54:56'),(89,'https://www.some_server.com/some_directory/6b43817c53,\"JPEG\"',1,'{\"size\": 590068, \"extension\": \"JPEG\", \"resolution\": \"681x238\"}',40,'2021-10-16 12:53:35','2021-10-16 12:54:56'),(90,'https://www.some_server.com/some_directory/af9fe2ef69,\"JPEG\"',4,'{\"size\": 969726, \"extension\": \"JPEG\", \"resolution\": \"577x578\"}',41,'2021-10-16 12:53:35','2021-10-16 12:54:56'),(91,'https://www.some_server.com/some_directory/3d241d3f47,\"JPEG\"',5,'{\"size\": 721511, \"extension\": \"JPEG\", \"resolution\": \"808x478\"}',33,'2021-10-16 12:53:36','2021-10-16 12:54:56'),(92,'https://www.some_server.com/some_directory/7bc5c412c7,\"JPEG\"',1,'{\"size\": 772529, \"extension\": \"JPEG\", \"resolution\": \"450x536\"}',6,'2021-10-16 12:53:36','2021-10-16 12:54:56'),(93,'https://www.some_server.com/some_directory/25adffdfa3,\"JPEG\"',2,'{\"size\": 483663, \"extension\": \"JPEG\", \"resolution\": \"620x252\"}',9,'2021-10-16 12:53:37','2021-10-16 12:54:56'),(94,'https://www.some_server.com/some_directory/3d34ea9c63,\"JPEG\"',1,'{\"size\": 148218, \"extension\": \"JPEG\", \"resolution\": \"355x930\"}',17,'2021-10-16 12:53:37','2021-10-16 12:54:56'),(95,'https://www.some_server.com/some_directory/18cf1dcd0e,\"JPEG\"',1,'{\"size\": 997416, \"extension\": \"JPEG\", \"resolution\": \"886x1037\"}',14,'2021-10-16 12:53:37','2021-10-16 12:54:56'),(96,'https://www.some_server.com/some_directory/977b0f0a65,\"JPEG\"',2,'{\"size\": 549168, \"extension\": \"JPEG\", \"resolution\": \"201x960\"}',42,'2021-10-16 12:53:37','2021-10-16 12:54:56'),(97,'https://www.some_server.com/some_directory/974b5b7a68,\"JPEG\"',1,'{\"size\": 900979, \"extension\": \"JPEG\", \"resolution\": \"540x598\"}',8,'2021-10-16 12:53:38','2021-10-16 12:54:56'),(98,'https://www.some_server.com/some_directory/70cb6f8606,\"JPEG\"',2,'{\"size\": 263963, \"extension\": \"JPEG\", \"resolution\": \"622x919\"}',23,'2021-10-16 12:53:38','2021-10-16 12:54:56'),(99,'https://www.some_server.com/some_directory/e37fd9357d,\"JPEG\"',2,'{\"size\": 293369, \"extension\": \"JPEG\", \"resolution\": \"443x936\"}',7,'2021-10-16 12:53:38','2021-10-16 12:54:56'),(100,'https://www.some_server.com/some_directory/1dcd4bd5b9,\"JPEG\"',5,'{\"size\": 289804, \"extension\": \"JPEG\", \"resolution\": \"118x323\"}',3,'2021-10-16 12:53:38','2021-10-16 12:54:56'),(101,'https://www.some_server.com/some_directory/736e1e74ff,\"JPEG\"',1,'{\"size\": 228998, \"extension\": \"JPEG\", \"resolution\": \"147x651\"}',26,'2021-10-16 12:53:39','2021-10-16 12:54:56'),(102,'https://www.some_server.com/some_directory/11f131d4bd,\"JPEG\"',2,'{\"size\": 948523, \"extension\": \"JPEG\", \"resolution\": \"123x374\"}',13,'2021-10-16 12:53:39','2021-10-16 12:54:56'),(103,'https://www.some_server.com/some_directory/44389ff0cd,\"JPEG\"',3,'{\"size\": 382789, \"extension\": \"JPEG\", \"resolution\": \"566x285\"}',23,'2021-10-16 12:53:39','2021-10-16 12:54:56'),(104,'https://www.some_server.com/some_directory/f967340068,\"JPEG\"',4,'{\"size\": 701101, \"extension\": \"JPEG\", \"resolution\": \"255x773\"}',38,'2021-10-16 12:53:39','2021-10-16 12:54:56'),(105,'https://www.some_server.com/some_directory/37aab010ba,\"JPEG\"',4,'{\"size\": 133718, \"extension\": \"JPEG\", \"resolution\": \"617x285\"}',16,'2021-10-16 12:53:40','2021-10-16 12:54:56'),(106,'https://www.some_server.com/some_directory/c5b60723b5,\"JPEG\"',3,'{\"size\": 466200, \"extension\": \"JPEG\", \"resolution\": \"969x1050\"}',7,'2021-10-16 12:53:40','2021-10-16 12:54:56'),(107,'https://www.some_server.com/some_directory/d8361d4f71,\"JPEG\"',5,'{\"size\": 20945, \"extension\": \"JPEG\", \"resolution\": \"421x644\"}',32,'2021-10-16 12:53:41','2021-10-16 12:54:56'),(108,'https://www.some_server.com/some_directory/31c62499a9,\"JPEG\"',3,'{\"size\": 55839, \"extension\": \"JPEG\", \"resolution\": \"865x760\"}',1,'2021-10-16 12:53:41','2021-10-16 12:54:56'),(109,'https://www.some_server.com/some_directory/acdf2387fb,\"JPEG\"',2,'{\"size\": 81821, \"extension\": \"JPEG\", \"resolution\": \"762x166\"}',15,'2021-10-16 12:53:41','2021-10-16 12:54:56'),(110,'https://www.some_server.com/some_directory/78daa14661,\"JPEG\"',4,'{\"size\": 527880, \"extension\": \"JPEG\", \"resolution\": \"863x331\"}',37,'2021-10-16 12:53:41','2021-10-16 12:54:56'),(111,'https://www.some_server.com/some_directory/495686fa6d,\"JPEG\"',4,'{\"size\": 274948, \"extension\": \"JPEG\", \"resolution\": \"538x469\"}',23,'2021-10-16 12:53:42','2021-10-16 12:54:56'),(112,'https://www.some_server.com/some_directory/178f302298,\"JPEG\"',1,'{\"size\": 990127, \"extension\": \"JPEG\", \"resolution\": \"679x1026\"}',38,'2021-10-16 12:53:42','2021-10-16 12:54:56'),(113,'https://www.some_server.com/some_directory/55a6108d20,\"JPEG\"',5,'{\"size\": 908985, \"extension\": \"JPEG\", \"resolution\": \"244x1094\"}',23,'2021-10-16 12:53:42','2021-10-16 12:54:56'),(114,'https://www.some_server.com/some_directory/0c13107418,\"JPEG\"',5,'{\"size\": 611585, \"extension\": \"JPEG\", \"resolution\": \"306x296\"}',16,'2021-10-16 12:53:42','2021-10-16 12:54:56'),(115,'https://www.some_server.com/some_directory/979a85e2b6,\"JPEG\"',1,'{\"size\": 465034, \"extension\": \"JPEG\", \"resolution\": \"345x931\"}',18,'2021-10-16 12:53:42','2021-10-16 12:54:56'),(116,'https://www.some_server.com/some_directory/1896490a21,\"JPEG\"',5,'{\"size\": 254726, \"extension\": \"JPEG\", \"resolution\": \"908x378\"}',41,'2021-10-16 12:53:42','2021-10-16 12:54:56'),(117,'https://www.some_server.com/some_directory/620696252a,\"JPEG\"',1,'{\"size\": 478782, \"extension\": \"JPEG\", \"resolution\": \"208x203\"}',9,'2021-10-16 12:53:46','2021-10-16 12:54:56'),(118,'https://www.some_server.com/some_directory/164503eab8,\"JPEG\"',4,'{\"size\": 655147, \"extension\": \"JPEG\", \"resolution\": \"189x584\"}',7,'2021-10-16 12:53:46','2021-10-16 12:54:56'),(119,'https://www.some_server.com/some_directory/f90e3b10ec,\"JPEG\"',1,'{\"size\": 528909, \"extension\": \"JPEG\", \"resolution\": \"469x359\"}',8,'2021-10-16 12:53:47','2021-10-16 12:54:56'),(120,'https://www.some_server.com/some_directory/df0379a8e8,\"JPEG\"',2,'{\"size\": 849977, \"extension\": \"JPEG\", \"resolution\": \"538x741\"}',38,'2021-10-16 12:53:47','2021-10-16 12:54:56'),(121,'https://www.some_server.com/some_directory/ace0221b5a,\"JPEG\"',5,'{\"size\": 376567, \"extension\": \"JPEG\", \"resolution\": \"995x447\"}',3,'2021-10-16 12:53:47','2021-10-16 12:54:56'),(122,'https://www.some_server.com/some_directory/a554d1074c,\"JPEG\"',5,'{\"size\": 61233, \"extension\": \"JPEG\", \"resolution\": \"572x277\"}',20,'2021-10-16 12:53:47','2021-10-16 12:54:56'),(123,'https://www.some_server.com/some_directory/44b77b0b9e,\"JPEG\"',4,'{\"size\": 61524, \"extension\": \"JPEG\", \"resolution\": \"287x850\"}',9,'2021-10-16 12:53:48','2021-10-16 12:54:56'),(124,'https://www.some_server.com/some_directory/b978ad1e14,\"JPEG\"',5,'{\"size\": 792365, \"extension\": \"JPEG\", \"resolution\": \"102x736\"}',8,'2021-10-16 12:53:48','2021-10-16 12:54:56'),(125,'https://www.some_server.com/some_directory/0275d4d919,\"JPEG\"',2,'{\"size\": 496076, \"extension\": \"JPEG\", \"resolution\": \"756x893\"}',42,'2021-10-16 12:53:49','2021-10-16 12:54:56'),(126,'https://www.some_server.com/some_directory/f8f9410717,\"JPEG\"',1,'{\"size\": 463193, \"extension\": \"JPEG\", \"resolution\": \"238x403\"}',5,'2021-10-16 12:53:49','2021-10-16 12:54:56'),(127,'https://www.some_server.com/some_directory/b286f94dca,\"JPEG\"',4,'{\"size\": 783442, \"extension\": \"JPEG\", \"resolution\": \"855x529\"}',37,'2021-10-16 12:53:50','2021-10-16 12:54:56'),(128,'https://www.some_server.com/some_directory/d8c216ed23,\"JPEG\"',5,'{\"size\": 54172, \"extension\": \"JPEG\", \"resolution\": \"756x221\"}',27,'2021-10-16 12:53:50','2021-10-16 12:54:56'),(129,'https://www.some_server.com/some_directory/1edc1c73ef,\"JPEG\"',2,'{\"size\": 640927, \"extension\": \"JPEG\", \"resolution\": \"629x822\"}',2,'2021-10-16 12:53:50','2021-10-16 12:54:56'),(130,'https://www.some_server.com/some_directory/7dd3db344a,\"JPEG\"',4,'{\"size\": 827710, \"extension\": \"JPEG\", \"resolution\": \"1005x142\"}',21,'2021-10-16 12:53:50','2021-10-16 12:54:56'),(131,'https://www.some_server.com/some_directory/98aba5553e,\"JPEG\"',2,'{\"size\": 408525, \"extension\": \"JPEG\", \"resolution\": \"254x645\"}',12,'2021-10-16 12:53:51','2021-10-16 12:54:56'),(132,'https://www.some_server.com/some_directory/9d42bde81a,\"JPEG\"',4,'{\"size\": 97332, \"extension\": \"JPEG\", \"resolution\": \"696x788\"}',28,'2021-10-16 12:53:51','2021-10-16 12:54:56'),(133,'https://www.some_server.com/some_directory/acc7423ca5,\"JPEG\"',1,'{\"size\": 848450, \"extension\": \"JPEG\", \"resolution\": \"1049x302\"}',7,'2021-10-16 12:53:51','2021-10-16 12:54:56'),(134,'https://www.some_server.com/some_directory/f462c9c23d,\"JPEG\"',3,'{\"size\": 309428, \"extension\": \"JPEG\", \"resolution\": \"869x1020\"}',13,'2021-10-16 12:53:51','2021-10-16 12:54:56');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name_type` varchar(150) NOT NULL COMMENT 'Название типа',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Типы медиафайлов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'audio','2021-10-15 23:34:54','2021-10-15 23:34:54'),(2,'image','2021-10-15 23:34:54','2021-10-15 23:34:54'),(3,'video','2021-10-15 23:34:54','2021-10-15 23:34:54'),(4,'gif','2021-10-15 23:34:54','2021-10-15 23:34:54'),(5,'document','2021-10-15 23:34:54','2021-10-15 23:34:54');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `from_employee_id` int unsigned NOT NULL COMMENT 'ссылка на отправителя сообщения',
  `to_employee_id` int unsigned NOT NULL COMMENT 'ссылка на получателя сообщения',
  `body` text NOT NULL COMMENT 'текст сообщения',
  `is_important` tinyint(1) DEFAULT NULL COMMENT 'признак важности',
  `is_delivered` tinyint(1) DEFAULT NULL COMMENT 'признак доставки',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `messages_to_employee_id` (`to_employee_id`),
  KEY `messages_from_employee_id` (`from_employee_id`),
  CONSTRAINT `messages_from_employee_id` FOREIGN KEY (`from_employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `messages_to_employee_id` FOREIGN KEY (`to_employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Сообщения';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,21,32,'Rem dolor cum at. Vel explicabo qui fugit quas ut facere. Earum et consectetur distinctio illum.',1,1,'2021-10-16 15:14:40','2021-10-16 15:14:40'),(2,10,38,'Fuga voluptas nihil ut. Similique distinctio molestiae esse omnis sunt eum. Enim neque recusandae praesentium necessitatibus.',0,0,'2021-10-16 15:14:40','2021-10-16 15:14:40'),(3,35,19,'Unde error occaecati animi labore et nihil. Rerum ad quibusdam et vero voluptatibus eos sed. Modi qui cumque inventore quia excepturi. Voluptate optio omnis voluptas ducimus ullam. Rerum tempora dicta quis optio delectus.',1,1,'2021-10-16 15:14:40','2021-10-16 15:14:40'),(4,30,11,'Eum in aut impedit fugiat impedit sed. Sit ut est mollitia ducimus libero autem. Voluptas laborum repellat sit aut suscipit et. Voluptatem aspernatur corporis consequatur voluptas velit. Est nihil ut qui dolorum eaque amet voluptas occaecati.',1,0,'2021-10-16 15:14:40','2021-10-16 15:14:40'),(5,4,30,'Ut impedit sed repudiandae dignissimos ducimus molestiae. Animi molestias non corrupti neque et. Nihil dolor sequi aperiam voluptatem.',0,1,'2021-10-16 15:14:40','2021-10-16 15:14:40'),(6,10,3,'Tenetur consequuntur aut delectus qui commodi corporis cupiditate. Et possimus et laudantium corrupti. Quia qui non omnis et maiores consectetur. Quia excepturi officia explicabo suscipit voluptates vero.',0,0,'2021-10-16 15:14:40','2021-10-16 15:14:40'),(7,24,27,'Qui ullam molestiae quas iusto. Vero hic sit sequi ut non molestiae. Sit odit totam qui perferendis saepe est dolorum.',1,0,'2021-10-16 15:14:40','2021-10-16 15:14:40'),(8,21,22,'Consequatur iusto itaque qui nemo architecto nulla ut ut. Voluptatem repudiandae similique quam consequatur est veritatis velit iusto. Amet occaecati praesentium consequatur aliquid dicta facilis nostrum quia. Minima non dolorem nam quibusdam et impedit quis.',1,1,'2021-10-16 15:14:40','2021-10-16 15:14:40'),(9,8,12,'Placeat maxime consequatur qui similique dolorem quos veritatis quam. Illum aut molestiae animi voluptatem illo officiis sunt. Suscipit alias quia quisquam officiis consequuntur repudiandae saepe. Tempora maxime eos nesciunt quis expedita voluptas eligendi.',0,0,'2021-10-16 15:14:40','2021-10-16 15:14:40'),(10,38,25,'Molestiae voluptas libero illum soluta sit. Qui magnam impedit nostrum tempora quibusdam. Ab debitis quia id totam incidunt at laudantium.',1,0,'2021-10-16 15:14:40','2021-10-16 15:14:40'),(11,13,32,'Quaerat aliquam modi perspiciatis. Laudantium consequatur magni quos ipsum animi unde. Ex ut rerum expedita delectus non. Deleniti blanditiis totam rerum voluptatem quidem minus porro. Est sed facere accusamus maxime nisi pariatur.',0,1,'2021-10-16 15:14:40','2021-10-16 15:14:40'),(12,36,41,'Sunt laboriosam voluptate asperiores nisi necessitatibus. In dolorem aut saepe quod ut alias. Pariatur quibusdam sint quidem soluta. Ad laudantium sunt ratione et dicta nostrum qui.',1,0,'2021-10-16 15:14:40','2021-10-16 15:14:40'),(13,11,15,'Delectus aut error et. Laboriosam dolorem laboriosam repudiandae. Adipisci alias provident rem aspernatur non quibusdam aspernatur.',0,0,'2021-10-16 15:14:40','2021-10-16 15:14:40'),(14,41,34,'Labore ratione enim autem perspiciatis deleniti molestias. Fugit et velit facere perspiciatis sed dolor. Debitis tempora id et porro est odit mollitia. Quia et nihil eveniet aut unde.',1,0,'2021-10-16 15:14:40','2021-10-16 15:14:40'),(15,6,11,'Tempora vitae rerum sint perspiciatis voluptates temporibus. Voluptatem assumenda ea recusandae amet similique et.',0,0,'2021-10-16 15:14:40','2021-10-16 15:14:40'),(16,36,20,'Aperiam nostrum voluptatum qui nihil et omnis. Nulla qui consequatur ea placeat nisi labore enim. Qui esse sit laboriosam dolorum.',1,1,'2021-10-16 15:14:40','2021-10-16 15:14:40'),(17,32,18,'Velit at ipsum eveniet voluptatem aut dolorem qui ipsam. Consequatur repellendus dolorum ipsam sapiente provident consectetur ipsam. Fuga quae corrupti natus quae ut.',0,1,'2021-10-16 15:14:40','2021-10-16 15:14:40'),(18,33,27,'Autem aliquam laboriosam ex ea eos dicta inventore. At sed cum odio at blanditiis unde necessitatibus. Ea culpa corporis quis laudantium. Ipsam cumque ipsum reprehenderit quia quia.',0,1,'2021-10-16 15:14:40','2021-10-16 15:14:40'),(19,36,14,'Quis est numquam nihil odio non deleniti sit. Voluptates eaque ducimus assumenda. Culpa corrupti alias alias quas voluptatem aliquam explicabo.',1,0,'2021-10-16 15:14:40','2021-10-16 15:14:40'),(20,2,10,'Similique modi voluptatibus eum quibusdam voluptates enim optio. Ea eos qui sed aperiam. Aperiam repellendus maxime nihil neque vel. Ut aspernatur molestiae ut sed voluptatibus et beatae.',0,1,'2021-10-16 15:14:40','2021-10-16 15:14:40');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phones`
--

DROP TABLE IF EXISTS `phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phones` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `affiliate_id` int unsigned NOT NULL COMMENT 'Ссылка на филиал',
  `phone` varchar(12) NOT NULL COMMENT 'Мобильный телефон пользователя',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `affiliate_id` (`affiliate_id`),
  CONSTRAINT `phones_ibfk_1` FOREIGN KEY (`affiliate_id`) REFERENCES `affiliates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Список телефонных номеров';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phones`
--

LOCK TABLES `phones` WRITE;
/*!40000 ALTER TABLE `phones` DISABLE KEYS */;
INSERT INTO `phones` VALUES (1,1,'+74959799622','2021-10-16 09:47:41','2021-10-16 09:47:41'),(2,1,'+74959799633','2021-10-16 09:48:04','2021-10-16 09:48:04'),(3,1,'+74959799644','2021-10-16 09:51:46','2021-10-16 09:51:46'),(4,1,'+74955675254','2021-10-16 10:00:55','2021-10-16 10:00:55'),(5,1,'+74959661362','2021-10-16 10:03:40','2021-10-16 10:03:40'),(6,1,'+74956296327','2021-10-16 10:03:40','2021-10-16 10:03:40'),(7,1,'+74952497548','2021-10-16 10:03:40','2021-10-16 10:03:40'),(8,1,'+74953598760','2021-10-16 10:03:40','2021-10-16 10:03:40'),(9,1,'+74950501156','2021-10-16 10:03:40','2021-10-16 10:03:40'),(10,1,'+74951709502','2021-10-16 10:03:40','2021-10-16 10:03:40'),(11,1,'+74959799611','2021-10-16 09:36:43','2021-10-16 09:36:43'),(12,1,'+74957044042','2021-10-16 10:03:40','2021-10-16 10:03:40'),(13,1,'+74950091709','2021-10-16 10:03:40','2021-10-16 10:03:40'),(14,1,'+74959326418','2021-10-16 10:03:40','2021-10-16 10:03:40'),(15,2,'+34936356964','2021-10-16 10:34:03','2021-10-16 10:34:03'),(16,2,'+34933805570','2021-10-16 10:34:03','2021-10-16 10:34:03'),(17,2,'+34939956957','2021-10-16 10:34:03','2021-10-16 10:34:03'),(18,2,'+34938368078','2021-10-16 10:34:03','2021-10-16 10:34:03'),(19,2,'+34931969520','2021-10-16 10:34:03','2021-10-16 10:34:03'),(20,2,'+34934743367','2021-10-16 10:34:03','2021-10-16 10:34:03'),(21,2,'+34937808274','2021-10-16 10:34:03','2021-10-16 10:34:03'),(22,2,'+34934811272','2021-10-16 10:34:03','2021-10-16 10:34:03'),(23,2,'+34930631540','2021-10-16 10:34:03','2021-10-16 10:34:03'),(24,2,'+34938723880','2021-10-16 10:34:03','2021-10-16 10:34:03'),(25,2,'+34931724788','2021-10-16 10:34:03','2021-10-16 10:34:03'),(26,2,'+34932452299','2021-10-16 10:34:03','2021-10-16 10:34:03'),(27,2,'+34937087129','2021-10-16 10:34:03','2021-10-16 10:34:03'),(28,2,'+34938078752','2021-10-16 10:34:03','2021-10-16 10:34:03'),(29,3,'+39291323780','2021-10-16 10:39:10','2021-10-16 10:39:10'),(30,3,'+39214256299','2021-10-16 10:39:10','2021-10-16 10:39:10'),(31,3,'+39297310156','2021-10-16 10:39:10','2021-10-16 10:39:10'),(32,3,'+39243781888','2021-10-16 10:39:10','2021-10-16 10:39:10'),(33,3,'+39226978976','2021-10-16 10:39:10','2021-10-16 10:39:10'),(34,3,'+39203549221','2021-10-16 10:39:10','2021-10-16 10:39:10'),(35,3,'+39236809178','2021-10-16 10:39:10','2021-10-16 10:39:10'),(36,3,'+39273398234','2021-10-16 10:39:10','2021-10-16 10:39:10'),(37,3,'+39256563639','2021-10-16 10:39:10','2021-10-16 10:39:10'),(38,3,'+39262623499','2021-10-16 10:39:10','2021-10-16 10:39:10'),(39,3,'+39243426579','2021-10-16 10:39:10','2021-10-16 10:39:10'),(40,3,'+39229262405','2021-10-16 10:39:10','2021-10-16 10:39:10'),(41,3,'+39216032291','2021-10-16 10:39:10','2021-10-16 10:39:10'),(42,1,'+74959237423','2021-10-16 10:56:42','2021-10-16 10:56:42');
/*!40000 ALTER TABLE `phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL COMMENT 'Идентификатор строки',
  `name_post` varchar(100) NOT NULL COMMENT 'Название должности',
  `department_id` int unsigned NOT NULL COMMENT 'Ссылка на отдел',
  `responsibility` varchar(200) NOT NULL COMMENT 'Обязанности должности',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата изменения строки',
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица должностей компании';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Head department',1,'Начальник отдела','2021-10-15 23:21:30','2021-10-15 23:21:30'),(2,'Head department',2,'Начальник отдела','2021-10-15 23:21:30','2021-10-15 23:21:30'),(3,'Head department',3,'Начальник отдела','2021-10-15 23:21:30','2021-10-15 23:21:30'),(4,'Head department',4,'Начальник отдела','2021-10-15 23:21:30','2021-10-15 23:21:30'),(5,'Head department',5,'Начальник отдела','2021-10-15 23:21:30','2021-10-15 23:21:30'),(6,'Head department',6,'Начальник отдела','2021-10-15 23:21:30','2021-10-15 23:21:30'),(7,'Head department',7,'Начальник отдела','2021-10-15 23:21:30','2021-10-15 23:21:30'),(8,'Head department',8,'Начальник отдела','2021-10-15 23:21:30','2021-10-15 23:21:30'),(9,'Head department',9,'Начальник отдела','2021-10-15 23:21:30','2021-10-15 23:21:30'),(10,'Head department',10,'Начальник отдела','2021-10-15 23:21:30','2021-10-15 23:21:30'),(11,'Head department',11,'Начальник отдела','2021-10-15 23:21:30','2021-10-15 23:21:30'),(12,'Head department',12,'Начальник отдела','2021-10-15 23:21:30','2021-10-15 23:21:30'),(13,'Head department',13,'Начальник отдела','2021-10-15 23:21:30','2021-10-15 23:21:30'),(14,'Head department',14,'Начальник отдела','2021-10-15 23:21:30','2021-10-15 23:21:30'),(15,'Head department',15,'Начальник отдела','2021-10-15 23:21:30','2021-10-15 23:21:30'),(16,'Buseness manager',2,'Повышение доходов Компании','2021-10-15 23:21:30','2021-10-15 23:21:30'),(17,'Buseness manager',2,'Повышение доходов Компании','2021-10-15 23:21:30','2021-10-15 23:21:30'),(18,'Buseness manager',7,'Повышение доходов Компании','2021-10-15 23:21:30','2021-10-15 23:21:30'),(19,'Buseness manager',7,'Повышение доходов Компании','2021-10-15 23:21:30','2021-10-15 23:21:30'),(20,'Buseness manager',12,'Повышение доходов Компании','2021-10-15 23:21:30','2021-10-15 23:21:30'),(21,'Buseness manager',12,'Повышение доходов Компании','2021-10-15 23:21:30','2021-10-15 23:21:30'),(22,'Specialist',3,'Обеспечение клиентского сервиса','2021-10-15 23:21:30','2021-10-15 23:21:30'),(23,'Specialist',3,'Обеспечение клиентского сервиса','2021-10-15 23:21:30','2021-10-15 23:21:30'),(24,'Specialist',3,'Обеспечение клиентского сервиса','2021-10-15 23:21:30','2021-10-15 23:21:30'),(25,'Specialist',8,'Обеспечение клиентского сервиса','2021-10-15 23:21:30','2021-10-15 23:21:30'),(26,'Specialist',8,'Обеспечение клиентского сервиса','2021-10-15 23:21:30','2021-10-15 23:21:30'),(27,'Specialist',8,'Обеспечение клиентского сервиса','2021-10-15 23:21:30','2021-10-15 23:21:30'),(28,'Specialist',13,'Обеспечение клиентского сервиса','2021-10-15 23:21:30','2021-10-15 23:21:30'),(29,'Specialist',13,'Обеспечение клиентского сервиса','2021-10-15 23:21:30','2021-10-15 23:21:30'),(30,'Manager',4,'Поддержка бизнеса','2021-10-15 23:21:30','2021-10-15 23:21:30'),(31,'Manager',4,'Поддержка бизнеса','2021-10-15 23:21:30','2021-10-15 23:21:30'),(32,'Manager',9,'Поддержка бизнеса','2021-10-15 23:21:30','2021-10-15 23:21:30'),(33,'Manager',9,'Поддержка бизнеса','2021-10-15 23:21:30','2021-10-15 23:21:30'),(34,'Manager',14,'Поддержка бизнеса','2021-10-15 23:21:30','2021-10-15 23:21:30'),(35,'Manager',14,'Поддержка бизнеса','2021-10-15 23:21:30','2021-10-15 23:21:30'),(36,'Analytic',5,'Анализ данных и процессов','2021-10-15 23:21:30','2021-10-15 23:21:30'),(37,'Analytic',5,'Анализ данных и процессов','2021-10-15 23:21:30','2021-10-15 23:21:30'),(38,'Analytic',10,'Анализ данных и процессов','2021-10-15 23:21:30','2021-10-15 23:21:30'),(39,'Analytic',10,'Анализ данных и процессов','2021-10-15 23:21:30','2021-10-15 23:21:30'),(40,'Analytic',15,'Анализ данных и процессов','2021-10-15 23:21:30','2021-10-15 23:21:30'),(41,'Analytic',15,'Анализ данных и процессов','2021-10-15 23:21:30','2021-10-15 23:21:30'),(42,'Manager',14,'Поддержка бизнеса','2021-10-16 10:55:37','2021-10-16 10:55:37');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `employee_id` int unsigned NOT NULL COMMENT 'Идентификатор строки',
  `avatar` int unsigned NOT NULL COMMENT 'Аватар сотрудника',
  `city` varchar(100) DEFAULT NULL COMMENT 'Город проживания сотрудника',
  `country` varchar(100) DEFAULT NULL COMMENT 'Страна проживания',
  `about_yourself` text COMMENT 'Несколько слов в себе',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата изменения строки',
  PRIMARY KEY (`employee_id`),
  KEY `avatar` (`avatar`),
  CONSTRAINT `profiles_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`avatar`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица профилей сотрудников';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,7,'New Verner','Russia','a3ffddaeab','2021-10-16 13:08:41','2021-10-16 13:11:55'),(2,8,'Benberg','Russia','1115d09b64','2021-10-16 13:23:16','2021-10-16 13:23:16'),(3,9,'East Urban','Russia','e6d4bcf259','2021-10-16 13:23:16','2021-10-16 13:23:16'),(4,10,'South Vladimir','Russia','3861e8096d','2021-10-16 13:23:16','2021-10-16 13:23:16'),(5,11,'West Mollie','Russia','27a7804f4a','2021-10-16 13:23:16','2021-10-16 13:23:16'),(6,12,'Marlenhaven','Russia','5650e65a1e','2021-10-16 13:23:16','2021-10-16 13:23:16'),(7,13,'Port Shane','Russia','d550a82a54','2021-10-16 13:23:16','2021-10-16 13:23:16'),(8,14,'New Carsonstad','Russia','505a7b62f6','2021-10-16 13:23:16','2021-10-16 13:23:16'),(9,15,'Port Peggie','Russia','f1b256d4da','2021-10-16 13:23:16','2021-10-16 13:23:16'),(10,16,'Turnerfort','Russia','a5fdb00f91','2021-10-16 13:23:16','2021-10-16 13:23:16'),(11,17,'Estaton','Russia','a3f51bb83f','2021-10-16 13:23:16','2021-10-16 13:23:16'),(12,18,'South Peytonport','Russia','362c134e7f','2021-10-16 13:23:16','2021-10-16 13:23:16'),(13,19,'East Lillian','Russia','e7e0d64fcb','2021-10-16 13:23:16','2021-10-16 13:23:16'),(14,20,'Wilburnmouth','Russia','ab2bd4540b','2021-10-16 13:23:16','2021-10-16 13:23:16'),(15,48,'South Dangelo','Spain','3733bc569e','2021-10-16 13:23:16','2021-10-16 13:44:12'),(16,21,'Jonesport','Spain','917ab9ce05','2021-10-16 13:23:16','2021-10-16 13:23:16'),(17,22,'Carlosmouth','Spain','c9c3f8c576','2021-10-16 13:23:16','2021-10-16 13:23:16'),(18,23,'Lake Melodymouth','Spain','97bdd2386c','2021-10-16 13:23:16','2021-10-16 13:23:16'),(19,24,'Eliasfort','Spain','6ffa2149de','2021-10-16 13:23:16','2021-10-16 13:23:16'),(20,25,'New Shayneburgh','Spain','d9eefcf77a','2021-10-16 13:23:16','2021-10-16 13:23:16'),(21,26,'East Dina','Spain','52eda8b325','2021-10-16 13:23:16','2021-10-16 13:23:16'),(22,27,'East Madelineview','Spain','05962c717f','2021-10-16 13:23:16','2021-10-16 13:23:16'),(23,28,'Nashton','Spain','0141375b92','2021-10-16 13:23:16','2021-10-16 13:23:16'),(24,29,'Reillyfurt','Spain','4a1645f9a3','2021-10-16 13:23:16','2021-10-16 13:23:16'),(25,30,'Kurtisview','Spain','019a9fc941','2021-10-16 13:23:16','2021-10-16 13:23:16'),(26,31,'Christbury','Spain','d51b3e336e','2021-10-16 13:23:16','2021-10-16 13:23:16'),(27,32,'Glennachester','Spain','e67ac53e7f','2021-10-16 13:23:16','2021-10-16 13:23:16'),(28,33,'Stevieborough','Spain','c188fc30a4','2021-10-16 13:23:16','2021-10-16 13:23:16'),(29,34,'South Titoland','Spain','79be4dbf70','2021-10-16 13:23:16','2021-10-16 13:23:16'),(30,35,'East Nicholeport','Italy','1391150f67','2021-10-16 13:23:16','2021-10-16 13:23:16'),(31,36,'Heathcoteside','Italy','70de4dddb6','2021-10-16 13:23:16','2021-10-16 13:23:16'),(32,37,'Dimitribury','Italy','1ce45d9bdb','2021-10-16 13:23:16','2021-10-16 13:23:16'),(33,38,'Lake Tracestad','Italy','b8a2e8fad1','2021-10-16 13:23:16','2021-10-16 13:23:16'),(34,39,'Lisettestad','Italy','600e3190da','2021-10-16 13:23:16','2021-10-16 13:23:16'),(35,40,'Kristopherberg','Italy','965c422584','2021-10-16 13:23:16','2021-10-16 13:23:16'),(36,41,'Eberttown','Italy','b9ad9e7dec','2021-10-16 13:23:16','2021-10-16 13:23:16'),(37,42,'North Minniestad','Italy','7b1042f330','2021-10-16 13:23:16','2021-10-16 13:23:16'),(38,43,'Samanthaview','Italy','f52a89edf2','2021-10-16 13:23:16','2021-10-16 13:23:16'),(39,44,'Elverabury','Italy','959e7ad33e','2021-10-16 13:23:16','2021-10-16 13:23:16'),(40,45,'New Johnborough','Italy','93c2ad1971','2021-10-16 13:23:16','2021-10-16 13:23:16'),(41,46,'Ebertshire','Italy','93f089244a','2021-10-16 13:23:16','2021-10-16 13:23:16'),(42,47,'Jocelynport','Russia','d14d7dd288','2021-10-16 13:23:16','2021-10-16 13:44:10');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_groups`
--

DROP TABLE IF EXISTS `work_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(100) NOT NULL COMMENT 'Название группы',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Рабочие группы над проектом';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_groups`
--

LOCK TABLES `work_groups` WRITE;
/*!40000 ALTER TABLE `work_groups` DISABLE KEYS */;
INSERT INTO `work_groups` VALUES (1,'Новый футболист','2021-10-15 23:45:29','2021-10-15 23:45:29'),(2,'Хороший легионер','2021-10-15 23:45:29','2021-10-15 23:45:29'),(3,'Просмотр игрока','2021-10-15 23:45:29','2021-10-15 23:45:29'),(4,'Поиск финансирования','2021-10-15 23:45:29','2021-10-15 23:45:29'),(5,'Анализ статистики Милана','2021-10-15 23:45:29','2021-10-15 23:45:29'),(6,'Анализ статистики Реала','2021-10-15 23:45:29','2021-10-15 23:45:29'),(7,'В России нет футбола','2021-10-15 23:45:29','2021-10-15 23:45:29'),(8,'Как распилить бюджет','2021-10-15 23:45:29','2021-10-15 23:45:29'),(9,'Продажа абонементов в Барселоне','2021-10-15 23:45:29','2021-10-15 23:45:29'),(10,'Продажа абонементов в Милане','2021-10-15 23:45:29','2021-10-15 23:45:29');
/*!40000 ALTER TABLE `work_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_groups_employees`
--

DROP TABLE IF EXISTS `work_groups_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_groups_employees` (
  `work_group_id` int unsigned NOT NULL COMMENT 'ссылка на рабочую группу',
  `employee_id` int unsigned NOT NULL COMMENT 'ссылка на сотрудника',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`work_group_id`,`employee_id`) COMMENT 'составной первичный ключ',
  KEY `work_groups_employees_employee_id` (`employee_id`),
  CONSTRAINT `work_groups_employees_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `work_groups_employees_work_group_id` FOREIGN KEY (`work_group_id`) REFERENCES `work_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Участники рабочих групп, связь между сотрудниками и группами';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_groups_employees`
--

LOCK TABLES `work_groups_employees` WRITE;
/*!40000 ALTER TABLE `work_groups_employees` DISABLE KEYS */;
INSERT INTO `work_groups_employees` VALUES (1,18,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(1,19,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(1,31,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(2,16,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(2,18,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(2,32,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(3,22,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(3,28,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(3,34,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(4,11,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(4,15,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(4,33,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(5,8,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(5,10,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(5,23,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(6,15,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(6,17,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(6,37,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(7,6,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(7,13,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(7,36,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(8,15,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(8,24,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(8,27,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(9,21,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(9,25,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(9,33,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(10,5,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(10,33,'2021-10-16 14:00:03','2021-10-16 14:00:03'),(10,38,'2021-10-16 14:00:03','2021-10-16 14:00:03');
/*!40000 ALTER TABLE `work_groups_employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-16 15:20:55
