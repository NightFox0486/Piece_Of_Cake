CREATE DATABASE  IF NOT EXISTS `commontest` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `commontest`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 3.35.55.189    Database: commontest
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmarks` (
  `party_seq` int unsigned NOT NULL,
  `user_seq` int unsigned NOT NULL,
  PRIMARY KEY (`party_seq`,`user_seq`),
  KEY `FK4suwwd073ofafhn92bah2ggcq` (`user_seq`),
  CONSTRAINT `FK4suwwd073ofafhn92bah2ggcq` FOREIGN KEY (`user_seq`) REFERENCES `users` (`user_seq`),
  CONSTRAINT `FKtp2pjgyoflcgcsg2revjx50gt` FOREIGN KEY (`party_seq`) REFERENCES `parties` (`party_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks`
--

LOCK TABLES `bookmarks` WRITE;
/*!40000 ALTER TABLE `bookmarks` DISABLE KEYS */;
INSERT INTO `bookmarks` VALUES (2,1),(5,1),(1,2),(3,2),(11,3),(7,4),(9,5),(11,5);
/*!40000 ALTER TABLE `bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_party`
--

DROP TABLE IF EXISTS `my_party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_party` (
  `party_seq` int unsigned NOT NULL,
  `user_seq` int unsigned NOT NULL,
  `my_party_role` varchar(5) NOT NULL,
  PRIMARY KEY (`party_seq`,`user_seq`),
  KEY `FKk2o1xtw6g9kbd08q4jv5edyjv` (`user_seq`),
  CONSTRAINT `FK6m1v52de09acntaejeuahlsyw` FOREIGN KEY (`party_seq`) REFERENCES `parties` (`party_seq`),
  CONSTRAINT `FKk2o1xtw6g9kbd08q4jv5edyjv` FOREIGN KEY (`user_seq`) REFERENCES `users` (`user_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_party`
--

LOCK TABLES `my_party` WRITE;
/*!40000 ALTER TABLE `my_party` DISABLE KEYS */;
INSERT INTO `my_party` VALUES (1,1,'host'),(1,4,'guest'),(2,1,'guest'),(2,2,'host'),(3,1,'host'),(3,2,'guest'),(3,3,'guest'),(3,5,'guest'),(4,1,'host'),(4,4,'guest'),(4,5,'guest'),(5,1,'guest'),(5,2,'host'),(5,4,'guest'),(7,3,'host'),(8,3,'host'),(9,2,'host'),(10,3,'host'),(10,5,'guest'),(11,4,'host'),(11,5,'guest'),(17,5,'host'),(20,4,'host'),(22,3,'host');
/*!40000 ALTER TABLE `my_party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parties`
--

DROP TABLE IF EXISTS `parties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parties` (
  `party_seq` int unsigned NOT NULL AUTO_INCREMENT,
  `item_link` varchar(200) DEFAULT NULL,
  `party_addr` varchar(100) DEFAULT NULL,
  `party_addr_detail` varchar(100) DEFAULT NULL,
  `party_bookmark_count` int unsigned DEFAULT NULL,
  `party_code` varchar(3) NOT NULL,
  `party_content` text NOT NULL,
  `party_main_image_url` varchar(255) DEFAULT NULL,
  `party_member_num_current` int NOT NULL,
  `party_member_num_total` int NOT NULL,
  `party_rdv_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `party_rdv_lat` varchar(20) DEFAULT NULL,
  `party_rdv_lng` varchar(20) DEFAULT NULL,
  `party_reg_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `party_status` tinyint DEFAULT '0',
  `party_title` varchar(100) NOT NULL,
  `party_upd_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` varchar(20) DEFAULT NULL,
  `user_seq` int unsigned NOT NULL,
  PRIMARY KEY (`party_seq`),
  UNIQUE KEY `party_seq` (`party_seq`),
  KEY `FK2316pd3lo3g9js5aak0s6old7` (`user_seq`),
  CONSTRAINT `FK2316pd3lo3g9js5aak0s6old7` FOREIGN KEY (`user_seq`) REFERENCES `users` (`user_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parties`
--

LOCK TABLES `parties` WRITE;
/*!40000 ALTER TABLE `parties` DISABLE KEYS */;
INSERT INTO `parties` VALUES (1,'https://www...','부산광역시 강서구 송정동 1627-5','1627-5',1,'003','치킨두마리 나눠서 주문하실분 구해요','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image1-0.jpg?alt=media&token=5911a11b-e457-4f1a-8065-566e6f1fadf3',2,2,'2022-08-19 00:02:51','35.089398426568884','128.85334353893995','2022-08-19 00:02:51',2,'치킨 같이 주문하실분','2022-08-19 00:02:51','40000',1),(2,'none','부산광역시 사하구 하단2동 524-3','524-3',1,'001','너무 많이 샀어요\n채팅주세요','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image2-0.jpg?alt=media&token=d23341b6-19fd-4a94-8575-c627b3785424',2,4,'2022-08-19 00:03:55','35.10687513977191','128.96326046437025','2022-08-19 00:03:55',1,'수분크림 소분해요','2022-08-19 00:03:55','50000',2),(3,'https://www...','부산광역시 강서구 송정동 1627-5','1627-5',1,'002','2kg당 만원에 파는데 6kg부터 판매하네요','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image3-0.jpg?alt=media&token=60947011-a2dc-4446-87d9-a5bceff6375e',3,3,'2022-08-19 00:04:59','35.089424214687945','128.85329458862543','2022-08-19 00:04:59',2,'소고기 2KG 만원에 같이 공구하실분 ','2022-08-19 00:04:59','30000',1),(4,'none','부산광역시 강서구 송정동 1627-5','1627-5',0,'001','술잔 다 필요없어서 나눠 가지실분','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image4-0.jpg?alt=media&token=93d4d967-bf80-408c-9d08-02de47c30d77',3,3,'2022-08-19 00:06:58','35.0893956831515','128.85336197912693','2022-08-19 00:06:58',2,'술잔 소분하실분','2022-08-19 00:06:58','30000',1),(5,'요기요','부산광역시 강서구 명지동 2869-1','2869-1',1,'003','혼자선 다 못먹겠어요 ㅠ','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image5-0.jpg?alt=media&token=6aae7141-a113-4e2c-8739-62bfb0f78d08',2,2,'2022-08-19 00:11:03','35.09270938976029','128.90707857906818','2022-08-19 00:11:03',2,'돈까스랑 김치볶음밥 드실분???','2022-08-19 00:11:03','30000',2),(7,'','부산광역시 강서구 송정동 1627-5','1627-5',1,'003','배달 ㄱ?','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image7-0.jpg?alt=media&token=14fa7640-cf12-49c4-b978-0ae76b33e3c2',1,2,'2022-08-19 00:32:48','35.08949828689942','128.8533519208431','2022-08-19 00:32:48',1,'야식 ㄱ?','2022-08-19 00:32:48','40000',3),(8,'','부산광역시 강서구 송정동 1627-5','1627-5',0,'002','손세정제 공구','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image8-0.jpg?alt=media&token=948df51a-57cd-473f-a726-aad45d4676d1',1,2,'2022-08-19 00:38:50','35.08940501077029','128.8533455505967','2022-08-19 00:38:50',1,'손세정제 공구','2022-08-19 00:38:50','30000',3),(9,'www.naver.com','부산광역시 사하구 하단2동 517-16','517-16',1,'002','2개 5만원에 싸게 판대요','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image9-0.jpg?alt=media&token=33a269f8-3553-42bd-bf7d-934610c6c79c',1,2,'2022-08-19 00:47:20','35.10758333522911','128.96224223077294','2022-08-19 00:47:20',1,'디퓨저 공구파티 구합니다','2022-08-19 00:47:20','50000',2),(10,'none','부산광역시 강서구 송정동 1627-5','1627-5',0,'001','마스크 너무 많아요 소분해용','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image10-0.jpg?alt=media&token=bc055108-f9ca-4506-9c6f-b0fc2d6bd87f',2,3,'2022-08-19 00:53:23','35.08945164884819','128.85325569659472','2022-08-19 00:53:23',1,'마스크를 너무 많이 삼','2022-08-19 00:53:23','15000',3),(11,'https://baemin.me/AZHPHOSpZ','부산광역시 강서구 신호동 219-4','219-4',2,'003','설빙 시켜먹을건데 배달비가  오천원 ㅠ. 설빙 배달 같이하실 분 구합니다ㅎ\n 선착순2명!!!','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image11-0.jpg?alt=media&token=cb28efdd-ef54-4cd5-aebc-15992852ecab',2,3,'2022-08-19 01:17:55','35.08482447290502','128.87845572084188','2022-08-19 01:17:55',1,'설빙!!','2022-08-19 01:17:55','30000',4),(17,'none','부산광역시 부산진구 초읍동 43','43',0,'001','5개씩 나눠요','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image17-0.jpg?alt=media&token=b399284e-00b1-454d-88ed-5adaabddefa4',1,2,'2022-08-19 02:19:11','35.1855338443794','129.04217641800642','2022-08-19 02:19:11',1,'물티슈 나눠가져요','2022-08-19 02:19:11','11690',5),(20,'none','부산광역시 사하구 하단동 381-18','381-18',0,'001','30개 샀는데 너무 많아요ㅠ 10개씩 쓰실분 찾습니다','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image20-0.jpg?alt=media&token=931f85f2-e610-45ec-acd1-5d2a2a3ba59c',1,3,'2022-08-19 02:25:11','35.10146856956257','128.96600570529696','2022-08-19 02:25:11',1,'포스트잇 넘쳐요 ㅠ','2022-08-19 02:25:11','12000',4),(22,'none','부산광역시 강서구 송정동 1600','1600',0,'001','바세린을 너무 많이 사버렸지 뭐야 싸게 가져가세용','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image22-0.jpg?alt=media&token=c135f529-9233-46c2-9877-b47e3c68e286',1,3,'2022-08-19 02:26:39','35.09732542006134','128.85363187640905','2022-08-19 02:26:39',1,'바세린','2022-08-19 02:26:39','15000',3);
/*!40000 ALTER TABLE `parties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photos` (
  `photo_seq` int unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(45) DEFAULT NULL,
  `file_url` varchar(200) DEFAULT NULL,
  `party_seq` int unsigned NOT NULL,
  PRIMARY KEY (`photo_seq`),
  UNIQUE KEY `photo_seq` (`photo_seq`),
  KEY `FKmj7lggu6y250ij7ijcuap2nno` (`party_seq`),
  CONSTRAINT `FKmj7lggu6y250ij7ijcuap2nno` FOREIGN KEY (`party_seq`) REFERENCES `parties` (`party_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,'image-test/test-image1-0.jpg','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image1-0.jpg?alt=media&token=5911a11b-e457-4f1a-8065-566e6f1fadf3',1),(2,'image-test/test-image2-0.jpg','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image2-0.jpg?alt=media&token=d23341b6-19fd-4a94-8575-c627b3785424',2),(3,'receipt-test/test-receipt2-0.jpg','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/receipt-test%2Ftest-receipt2-0.jpg?alt=media&token=13314861-a352-4069-aeb1-f991d8a9ada4',2),(4,'image-test/test-image2-1.jpg','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image2-1.jpg?alt=media&token=9801cea1-ebda-4026-91af-b0534190c1e9',2),(5,'image-test/test-image3-0.jpg','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image3-0.jpg?alt=media&token=60947011-a2dc-4446-87d9-a5bceff6375e',3),(6,'receipt-test/test-receipt4-0.jpg','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/receipt-test%2Ftest-receipt4-0.jpg?alt=media&token=c468b2c5-ea89-43a4-879e-1dc44b9d2ceb',4),(7,'image-test/test-image4-0.jpg','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image4-0.jpg?alt=media&token=93d4d967-bf80-408c-9d08-02de47c30d77',4),(8,'image-test/test-image5-0.jpg','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image5-0.jpg?alt=media&token=6aae7141-a113-4e2c-8739-62bfb0f78d08',5),(9,'image-test/test-image7-0.jpg','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image7-0.jpg?alt=media&token=14fa7640-cf12-49c4-b978-0ae76b33e3c2',7),(10,'image-test/test-image8-0.jpg','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image8-0.jpg?alt=media&token=948df51a-57cd-473f-a726-aad45d4676d1',8),(11,'image-test/test-image9-0.jpg','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image9-0.jpg?alt=media&token=33a269f8-3553-42bd-bf7d-934610c6c79c',9),(12,'image-test/test-image10-0.jpg','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image10-0.jpg?alt=media&token=bc055108-f9ca-4506-9c6f-b0fc2d6bd87f',10),(13,'image-test/test-image11-0.jpg','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image11-0.jpg?alt=media&token=cb28efdd-ef54-4cd5-aebc-15992852ecab',11),(19,'image-test/test-image17-0.jpg','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image17-0.jpg?alt=media&token=b399284e-00b1-454d-88ed-5adaabddefa4',17),(20,'receipt-test/test-receipt17-0.jpg','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/receipt-test%2Ftest-receipt17-0.jpg?alt=media&token=46cb80d7-46f3-4cb8-abee-2b0f5bfed96a',17),(22,'image-test/test-image20-0.jpg','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image20-0.jpg?alt=media&token=931f85f2-e610-45ec-acd1-5d2a2a3ba59c',20),(23,'receipt-test/test-receipt20-0.jpg','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/receipt-test%2Ftest-receipt20-0.jpg?alt=media&token=46001eb7-df60-4f42-8b68-277ad0840130',20),(25,'receipt-test/test-receipt22-0.jpg','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/receipt-test%2Ftest-receipt22-0.jpg?alt=media&token=3f3e3f1f-b3ec-4d67-bc54-db29e442d2fc',22),(26,'image-test/test-image22-0.jpg','https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image22-0.jpg?alt=media&token=c135f529-9233-46c2-9877-b47e3c68e286',22);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipts`
--

DROP TABLE IF EXISTS `receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipts` (
  `receipt_seq` int unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(45) DEFAULT NULL,
  `file_url` varchar(200) DEFAULT NULL,
  `party_seq` int unsigned NOT NULL,
  PRIMARY KEY (`receipt_seq`),
  UNIQUE KEY `receipt_seq` (`receipt_seq`),
  KEY `FKdv2j6knilyydug0wmeofd2qk8` (`party_seq`),
  CONSTRAINT `FKdv2j6knilyydug0wmeofd2qk8` FOREIGN KEY (`party_seq`) REFERENCES `parties` (`party_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipts`
--

LOCK TABLES `receipts` WRITE;
/*!40000 ALTER TABLE `receipts` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `report_seq` int NOT NULL AUTO_INCREMENT,
  `crime_name` varchar(45) NOT NULL,
  `report_content` text,
  `reported_user_seq` int NOT NULL,
  `reporting_user_seq` int NOT NULL,
  PRIMARY KEY (`report_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_seq` int unsigned NOT NULL AUTO_INCREMENT,
  `user_account` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) NOT NULL,
  `user_image` varchar(200) NOT NULL,
  `user_kakao_login_id` varchar(255) DEFAULT NULL,
  `user_lat` varchar(40) DEFAULT NULL,
  `user_lng` varchar(40) DEFAULT NULL,
  `user_nickname` varchar(20) NOT NULL,
  `user_password` varchar(20) DEFAULT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_rating` double DEFAULT '50',
  PRIMARY KEY (`user_seq`),
  UNIQUE KEY `user_seq` (`user_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'static_quark@kakao.com','https://k.kakaocdn.net/dn/9sbFA/btrG5rBxS4D/77RIiV0GdzfraIa3fcGTok/img_640x640.jpg','2387345633','35.0894168074631','128.85342970490456','승지',NULL,'null',50),(2,NULL,'mx1225@kakao.com','https://k.kakaocdn.net/dn/bcBvc9/btrJm714ZiV/MMwQ8glhdHaqiyNJEaClZ1/img_640x640.jpg','2385250446','35.10727723756039','128.96253291517496','원석',NULL,'null',50),(3,NULL,'seosanggyun@naver.com','https://k.kakaocdn.net/dn/ep3O3f/btrHIZlq1ye/acjxqTcFGxx4gB4366kWmk/img_640x640.jpg','2388755910','35.089443418601086','128.8533354923129','서상균',NULL,'null',80),(4,NULL,'goldflowed@gmail.com','https://k.kakaocdn.net/dn/dpk9l1/btqmGhA2lKL/Oz0wDuJn1YV2DIn92f6DVK/img_640x640.jpg','2375592986',NULL,NULL,'김유ㄹ',NULL,'null',50),(5,NULL,'sumin9366@nate.com','https://k.kakaocdn.net/dn/oSdah/btrDyFqOwsx/Vv1Eu6CfN3AHWMK7WbtSX0/img_640x640.jpg','2391407762',NULL,NULL,'수민이',NULL,'null',50);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'commontest'
--

--
-- Dumping routines for database 'commontest'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-19 11:30:31
