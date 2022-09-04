-- MySQL dump 10.13  Distrib 8.0.30, for macos12.4 (arm64)
--
-- Host: localhost    Database: 3000PR
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `amount` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_carts_user_id` (`user_id`),
  KEY `fk_carts_product_id` (`product_id`),
  CONSTRAINT `fk_carts_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_carts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `product_id` int NOT NULL,
  `status_order_item_id` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_items_product_id` (`product_id`),
  KEY `fk_order_items_status_order_item_id` (`status_order_item_id`),
  KEY `fk_order_items_order_id` (`order_id`),
  CONSTRAINT `fk_order_items_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_order_items_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_order_items_status_order_item_id` FOREIGN KEY (`status_order_item_id`) REFERENCES `status_order_items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `status_order_id` int NOT NULL,
  `user_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_user_id` (`user_id`),
  KEY `fk_orders_status_order_id` (`status_order_id`),
  KEY `fk_orders_user_address_id` (`user_address_id`),
  CONSTRAINT `fk_orders_status_order_id` FOREIGN KEY (`status_order_id`) REFERENCES `status_orders` (`id`),
  CONSTRAINT `fk_orders_user_address_id` FOREIGN KEY (`user_address_id`) REFERENCES `user_addresses` (`id`),
  CONSTRAINT `fk_orders_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `cover_image_url` varchar(2083) DEFAULT NULL,
  `detail_image_url` varchar(2083) DEFAULT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'판토마임 알파','https://drive.google.com/file/d/1Zu67ok9aS92Z78ZaLa76uf5jMrnsn3-i/view?usp=sharing','https://drive.google.com/file/d/1MIYb2FSq2409Fnx3lPZGSBXJDf1S6hnv/view?usp=sharing',20,1250000.00),(2,'판토마임 베타','https://drive.google.com/file/d/1mv19OXgNWqa6mW0vEVjacBQ5aXkAVqiT/view?usp=sharing','https://drive.google.com/file/d/1OWM7TBTDEzShwkoWcC-2u_8vepsXRjb8/view?usp=sharing',20,1100000.00),(3,'판토마임 XC','https://drive.google.com/file/d/1FPXNUCkpZG3NIjSBH4kkD_1XScPQ28Aw/view?usp=sharing','https://drive.google.com/file/d/1By1fdiHWB_gvDi_DlMoz4TElLUQSVaEZ/view?usp=sharing',20,1080000.00),(4,'EV-마이크로 슈퍼스타','https://drive.google.com/file/d/1Waq6o5CqQKluabeWLSGuVlWF86zXE8NV/view?usp=sharing','https://drive.google.com/file/d/1ppUr9zUom3z0FQYR-UR2AW9bBBf03n-j/view?usp=sharing',20,1000000.00),(5,'EV 슈퍼스타','https://drive.google.com/file/d/1xurlRLr2whr5y32hh594YShpswxBKKyK/view?usp=sharing','https://drive.google.com/file/d/1-Q4yk-vIe-QqBUZdUbCZBqKUigh-OiNH/view?usp=sharing',20,950000.00),(6,'위버스 카본파이버','https://drive.google.com/file/d/140MZCdOBdKAoCC6VKJJZg1-ZMy2Pj1gg/view?usp=sharing','https://drive.google.com/file/d/1sOcLCehtLhCazrH6Z4ABvYTQhRC6sm-c/view?usp=sharing',20,1150000.00),(7,'위버스 80','https://drive.google.com/file/d/1mFYETGJqOnkxhXWZgqL3PofualFCpdQc/view?usp=sharing','https://drive.google.com/file/d/1Mo2ypBMwzdWZgyxeXImgfRfN8Bnye9yP/view?usp=sharing',20,1100000.00),(8,'위버스 70','https://drive.google.com/file/d/17D3mOecGAFPQYzY4ZeiLEH20YRj2Fz77/view?usp=sharing','https://drive.google.com/file/d/1tODhtmh07rKDAfGgOkK3Czg5iZCe4DZJ/view?usp=sharing',20,1020000.00),(9,'위버스 60','https://drive.google.com/file/d/1X14Emuwi5bKBJw7x6Igua4uuP6eJmhR0/view?usp=sharing','https://drive.google.com/file/d/1tODhtmh07rKDAfGgOkK3Czg5iZCe4DZJ/view?usp=sharing',20,980000.00),(10,'위버스 40','https://drive.google.com/file/d/1_TImRoz1lpBYkuv1gu6JKL5lDbslpol5/view?usp=sharing','https://drive.google.com/file/d/1jc6U6R0hEeaMEPIgWEpzyMveeTaaJxVd/view?usp=sharing',20,850000.00),(11,'W3R 16','https://drive.google.com/file/d/1jyzrXHW4G0WbMOTUiLKkb9Lpz0WFOXfU/view?usp=sharing','https://drive.google.com/file/d/1HX0I7nCyJ7fbpzjMcNdHLQuyz4z5AYJw/view?usp=sharing',20,1030000.00),(12,'W3R 12','https://drive.google.com/file/d/1jyzrXHW4G0WbMOTUiLKkb9Lpz0WFOXfU/view?usp=sharing','https://drive.google.com/file/d/1hjiUF0uDZTm5KMgxAl_4Os1-sqT7TMhj/view?usp=sharing',20,970000.00),(13,'W3R 8','https://drive.google.com/file/d/12JWyEmA7GfIjkXwQi0GMkczPc0hdFuL7/view?usp=sharing','https://drive.google.com/file/d/1F-ZdKd_tdboIun63WGDol0MfKiSXL2_r/view?usp=sharing',20,920000.00),(14,'위랠 300','https://drive.google.com/file/d/1uqLJEkxvJz-hWygDZogqD4-kdD9yq-SZ/view?usp=sharing','https://drive.google.com/file/d/1Uvg37TAR6fGUOgzwz7pZBtO1J9zV1vG7/view?usp=sharing',20,850000.00),(15,'위랠 100','https://drive.google.com/file/d/16V-YnhXfirzlVzM4_QX3mmXQp0Zt0TS5/view?usp=sharing','https://drive.google.com/file/d/1unVqZvSoQVW8uF_GSgLQTO-GKWPbbRYZ/view?usp=sharing',20,650000.00);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20220817104036'),('20220817104047'),('20220817104053'),('20220817104103'),('20220817104105'),('20220817104115'),('20220817104121'),('20220817104125'),('20220817104135'),('20220817104137');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_order_items`
--

DROP TABLE IF EXISTS `status_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_order_items`
--

LOCK TABLES `status_order_items` WRITE;
/*!40000 ALTER TABLE `status_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_orders`
--

DROP TABLE IF EXISTS `status_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_orders`
--

LOCK TABLES `status_orders` WRITE;
/*!40000 ALTER TABLE `status_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_bunches`
--

DROP TABLE IF EXISTS `tag_bunches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_bunches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tag_bunches_tag_id` (`tag_id`),
  KEY `fk_tag_bunches_product_id` (`product_id`),
  CONSTRAINT `fk_tag_bunches_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_tag_bunches_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_bunches`
--

LOCK TABLES `tag_bunches` WRITE;
/*!40000 ALTER TABLE `tag_bunches` DISABLE KEYS */;
INSERT INTO `tag_bunches` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,3,15),(16,4,1),(17,6,2),(18,6,3),(19,6,4),(20,4,5),(21,5,6),(22,6,7),(23,6,8),(24,6,9),(25,6,10),(26,4,11),(27,6,12),(28,4,13),(29,6,14),(30,6,15),(31,7,1),(32,7,2),(33,7,3),(34,7,4),(35,8,5),(36,7,6),(37,7,7),(38,7,8),(39,8,9),(40,8,10),(41,7,11),(42,8,12),(43,8,13),(44,8,14),(45,8,15),(46,9,1),(47,9,2),(48,9,3),(49,9,4),(50,9,5),(51,10,6),(52,10,7),(53,10,8),(54,10,9),(55,10,10),(56,9,11),(57,9,12),(58,9,13),(59,9,14),(60,9,15),(61,11,1),(62,11,4),(63,11,7),(64,11,12),(65,11,13),(66,11,14);
/*!40000 ALTER TABLE `tag_bunches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'#산악'),(2,'#전기'),(3,'#로드'),(4,'#스틸'),(5,'#카본'),(6,'#알루미늄'),(7,'#고가'),(8,'#가성비'),(9,'#트렌디'),(10,'#매니악'),(11,'#인기');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_addresses`
--

DROP TABLE IF EXISTS `user_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_address_user_id` (`user_id`),
  CONSTRAINT `fk_user_address_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_addresses`
--

LOCK TABLES `user_addresses` WRITE;
/*!40000 ALTER TABLE `user_addresses` DISABLE KEYS */;
INSERT INTO `user_addresses` VALUES (2,25,'seoul');
/*!40000 ALTER TABLE `user_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `birth` date NOT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `point` int NOT NULL DEFAULT '10000000',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'lee','hello1@gmail.com','$2b$12$pchrgEmTOIF8iof1QGqqNOEH6NzMPdTwpeqxiOx6.gJq7SHlX7/qG','2000-10-01','010-5555-4444',10000000,'2022-08-22 00:52:29','2022-08-22 00:52:29'),(2,'lee2','hello2@gmail.com','$2b$12$3n6c4fvCoiwnQkeUYlARjeD.zwK1zpt9R.x5/rz94QjWL666hb/Ay','2000-10-01','010-5555-4444',10000000,'2022-08-22 11:07:25','2022-08-22 11:07:25'),(3,'문보성','haydenmoon127@naver.com','$2b$12$XwotV7b9ikr8Lt7514XuwuA34iQ.xTr5KBhPcYgV0.IGcTU9Cq1ZW','1992-01-27','01045778307',10000000,'2022-08-22 12:18:11','2022-08-22 12:18:11'),(4,'asd','qaz@qaz.com','$2b$12$g4yaoNMfsd86uoOVC2GyYeaUDOne5snRZnISua5FlDDZ1dfZPvywq','1992-01-27','01045778307',10000000,'2022-08-22 12:24:44','2022-08-22 12:24:44'),(5,'문보성','mbs127@naver.com','$2b$12$dHx6D9eIjZYUBrS7f9Sf4O0NN2c2sEu8WfzFmosEdLsN..HlznTU6','1992-01-27','01045778307',10000000,'2022-08-22 12:36:54','2022-08-22 12:36:54'),(7,'aha','hello3@gmail.com','$2b$12$GP2A0hr/z6E46unO8xTGh.27Bp.a/HR1hfy2XocK5Iu.U2QWMTQpO','1990-01-01','010-5555-4444',10000000,'2022-08-23 04:56:33','2022-08-23 04:56:33'),(8,'aha','hello4@gmail.com','$2b$12$4NDTsy1q/KFO1hRjiGKl0.AQLh.tUiPsSNfUnt.1eYmfeszAOgkrK','1990-01-01','010-5555-4444',10000000,'2022-08-23 05:12:14','2022-08-23 05:12:14'),(9,'aha','hello5@gmail.com','$2b$12$6NNtpqUfgzhqVxEvzsxYF.pamI0UuC.hfa72JCFBQ.Q5.P/PyY2Eu','1990-01-01','010-5555-4444',10000000,'2022-08-23 05:13:19','2022-08-23 05:13:19'),(10,'aha','hello6@gmail.com','$2b$12$y3.EAaWuERDrYyGSZvgqBOn32qJGhRgiDkbZ/a5koHQ/pDz4iZ/y6','1990-01-01','010-5555-4444',10000000,'2022-08-23 05:17:45','2022-08-23 05:17:45'),(11,'kfk','hello7@gmail.com','$2b$12$VPbDEeJIr.AjYHR26IgcY.ziiRo/GcSJy8kXwLiN4W2UHqhzrv6pS','1990-01-01','010-5555-4444',10000000,'2022-08-23 05:44:02','2022-08-23 05:44:02'),(12,'kfk','hello8@gmail.com','$2b$12$3l6B2/yF8n1/CTFxZ1hS8eK.x3IsnXWbmwODax/xl4fCSlFUr1siK','1990-01-01','010-5555-4444',10000000,'2022-08-23 05:46:30','2022-08-23 05:46:30'),(14,'kfk','hello0@gmail.com','$2b$12$xF70RCbUumc8Kxx8c9asyOdwnSoltd6/.DgCDtYyzJMLXmkgCGmp6','1990-01-01','010-5555-4444',10000000,'2022-08-23 05:48:33','2022-08-23 05:48:33'),(15,'kfk','hello10@gmail.com','$2b$12$kqanrFYsCzjJPRwXfio1UeXdYgllez9ys6/UZnZjziRKnRcc5yMkW','1990-01-01','010-5555-4444',10000000,'2022-08-23 05:56:12','2022-08-23 05:56:12'),(16,'kfk','hello11@gmail.com','$2b$12$UnFSlah/MYHCukzoVsyH5eQ9n7bsh4GWhoINtuJOFcOOLZqwWTMxu','1990-01-01','010-5555-4444',10000000,'2022-08-23 05:58:11','2022-08-23 05:58:11'),(17,'kfk','hello12@gmail.com','$2b$12$lTdRQDlJXurk3yMiK0I3UejHP.FeL0LBfaGkDT7Jt3vDtHUX3K4Fm','1990-01-01','010-5555-4444',10000000,'2022-08-23 05:58:25','2022-08-23 05:58:25'),(18,'kfk','hello13@gmail.com','$2b$12$rB34xvozvAarEncZ9tgIkuTkXvD8WXuDCjP9R8fgiiDX5BXEbr/r6','1990-01-01','010-5555-4444',10000000,'2022-08-23 05:58:49','2022-08-23 05:58:49'),(19,'kfk','hello14@gmail.com','$2b$12$Ee.w3ji8b5iUh3GC8yHdZuXQdIeY5iOnwir32B1LtFQZFLPUCp4Ia','1990-01-01','010-5555-4444',10000000,'2022-08-23 05:59:27','2022-08-23 05:59:27'),(20,'kfk','hello15@gmail.com','$2b$12$Xh.rUfTt8cyoktnsZVgXF.HPqV.U0fs8YmJNipqIyCS6LtM/FRY72','1990-01-01','010-5555-4444',10000000,'2022-08-23 06:00:04','2022-08-23 06:00:04'),(21,'kfk','hello16@gmail.com','$2b$12$gHizKV5rZXuQyqg2HAtKfeyY1BgeIXf7hdEZvl4VoDdpWMvtBUrCW','1990-01-01','010-5555-4444',10000000,'2022-08-23 06:00:29','2022-08-23 06:00:29'),(22,'kfk','hello17@gmail.com','$2b$12$8EeG.4BrRqx2zs9LNLuF5e0mG5NDofc0v5aMGAYDPWD5VHP0MaK/C','1990-01-01','010-5555-4444',10000000,'2022-08-23 06:00:51','2022-08-23 06:00:51'),(23,'kfk','hello18@gmail.com','$2b$12$VNIYPLj1y0eq4J/Sx.Hrf.rYefOhkWr4km27QYh8Ws2osHh45QYxC','1990-01-01','010-5555-4444',10000000,'2022-08-23 06:01:24','2022-08-23 06:01:24'),(25,'kfk','hello20@gmail.com','$2b$12$Kxk4pbKj4/k43IQlsce2ru6LplxkmrrZjSF1TEFTnVLcMYP1l.EPa','1990-01-01','010-5555-4444',10000000,'2022-08-23 06:48:25','2022-08-23 06:48:25');
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

-- Dump completed on 2022-08-23 20:32:08
