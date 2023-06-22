# ************************************************************
# Sequel Ace SQL dump
# バージョン 20046
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# データベース: hostnavi
# 生成時間: 2023-06-19 14:11:22 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# テーブルのダンプ inn_amenity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inn_amenity`;

CREATE TABLE `inn_amenity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `inn_amenity` WRITE;
/*!40000 ALTER TABLE `inn_amenity` DISABLE KEYS */;

INSERT INTO `inn_amenity` (`id`, `name`)
VALUES
	(1,'歯ブラシ・歯磨き粉'),
	(2,'シャンプー・コンディショナー'),
	(3,'ボディーソープ'),
	(4,'洗顔料'),
	(5,'シャワーキャップ'),
	(6,'綿棒'),
	(7,'コットン'),
	(8,'ヘアブラシ'),
	(9,'バスタオル'),
	(10,'フェイスタオル'),
	(11,'室内着'),
	(12,'救急箱');

/*!40000 ALTER TABLE `inn_amenity` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ inn_facility
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inn_facility`;

CREATE TABLE `inn_facility` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `inn_facility` WRITE;
/*!40000 ALTER TABLE `inn_facility` DISABLE KEYS */;

INSERT INTO `inn_facility` (`id`, `name`)
VALUES
	(1,'Wi-Fi'),
	(2,'テレビ'),
	(3,'キッチン'),
	(4,'洗濯機'),
	(5,'駐車場'),
	(6,'エアコン'),
	(7,'プール'),
	(8,'露天風呂・ジャグジー'),
	(9,'屋上テラス'),
	(10,'庭園'),
	(11,'屋外調理設備'),
	(12,'ボードゲーム'),
	(13,'ビデオゲーム'),
	(14,'ゲームテーブル'),
	(15,'トレーニング器具'),
	(16,'朝食付き'),
	(17,'昼食付き'),
	(18,'夕食付き'),
	(19,'レンタル自転車'),
	(20,'火災報知器'),
	(21,'消火器'),
	(22,'防犯カメラ'),
	(23,'仕事スペース');

/*!40000 ALTER TABLE `inn_facility` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ inn_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inn_image`;

CREATE TABLE `inn_image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `inn_id` bigint NOT NULL,
  `name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `image_url` varchar(500) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `inn_id` (`inn_id`),
  CONSTRAINT `inn_image_ibfk_1` FOREIGN KEY (`inn_id`) REFERENCES `inn_inn` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# テーブルのダンプ inn_inn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inn_inn`;

CREATE TABLE `inn_inn` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `fee` int NOT NULL,
  `status_id` int NOT NULL,
  `type_id` int NOT NULL,
  `address` varchar(100) NOT NULL,
  `guest_number` tinyint NOT NULL,
  `bedroom_number` tinyint NOT NULL,
  `bed_number` tinyint NOT NULL,
  `bathroom_number` tinyint NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `status_id` (`status_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `inn_inn_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`),
  CONSTRAINT `inn_inn_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `inn_status` (`id`),
  CONSTRAINT `inn_inn_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `inn_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `inn_inn` WRITE;
/*!40000 ALTER TABLE `inn_inn` DISABLE KEYS */;

INSERT INTO `inn_inn` (`id`, `user_id`, `name`, `description`, `fee`, `status_id`, `type_id`, `address`, `guest_number`, `bedroom_number`, `bed_number`, `bathroom_number`, `create_time`, `update_time`, `delete_flag`)
VALUES
	(1,1,'石の家','素敵な宿です。',1000,1,1,'神奈川県横浜市',1,1,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00',0),
	(2,1,'石の家','素敵な宿です。',1000,1,1,'神奈川県横浜市',1,1,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00',0);

/*!40000 ALTER TABLE `inn_inn` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ inn_inn_amenity_relation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inn_inn_amenity_relation`;

CREATE TABLE `inn_inn_amenity_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `inn_id` bigint NOT NULL,
  `amenity_id` int NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `inn_id` (`inn_id`),
  KEY `amenity_id` (`amenity_id`),
  CONSTRAINT `inn_inn_amenity_relation_ibfk_1` FOREIGN KEY (`inn_id`) REFERENCES `inn_inn` (`id`),
  CONSTRAINT `inn_inn_amenity_relation_ibfk_2` FOREIGN KEY (`amenity_id`) REFERENCES `inn_amenity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `inn_inn_amenity_relation` WRITE;
/*!40000 ALTER TABLE `inn_inn_amenity_relation` DISABLE KEYS */;

INSERT INTO `inn_inn_amenity_relation` (`id`, `inn_id`, `amenity_id`, `create_time`, `update_time`, `delete_flag`)
VALUES
	(1,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00',0),
	(2,1,2,'2023-01-01 00:00:00','2023-01-01 00:00:00',0),
	(3,2,1,'2023-01-01 00:00:00','2023-01-01 00:00:00',0),
	(4,2,2,'2023-01-01 00:00:00','2023-01-01 00:00:00',0);

/*!40000 ALTER TABLE `inn_inn_amenity_relation` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ inn_inn_facility_relation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inn_inn_facility_relation`;

CREATE TABLE `inn_inn_facility_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `inn_id` bigint NOT NULL,
  `facility_id` int NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `inn_id` (`inn_id`),
  KEY `facility_id` (`facility_id`),
  CONSTRAINT `inn_inn_facility_relation_ibfk_1` FOREIGN KEY (`inn_id`) REFERENCES `inn_inn` (`id`),
  CONSTRAINT `inn_inn_facility_relation_ibfk_2` FOREIGN KEY (`facility_id`) REFERENCES `inn_facility` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `inn_inn_facility_relation` WRITE;
/*!40000 ALTER TABLE `inn_inn_facility_relation` DISABLE KEYS */;

INSERT INTO `inn_inn_facility_relation` (`id`, `inn_id`, `facility_id`, `create_time`, `update_time`, `delete_flag`)
VALUES
	(1,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00',0),
	(2,1,2,'2023-01-01 00:00:00','2023-01-01 00:00:00',0),
	(3,2,1,'2023-01-01 00:00:00','2023-01-01 00:00:00',0),
	(4,2,2,'2023-01-01 00:00:00','2023-01-01 00:00:00',0);

/*!40000 ALTER TABLE `inn_inn_facility_relation` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ inn_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inn_page`;

CREATE TABLE `inn_page` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `inn_page` WRITE;
/*!40000 ALTER TABLE `inn_page` DISABLE KEYS */;

INSERT INTO `inn_page` (`id`, `name`)
VALUES
	(1,'詳細ページ');

/*!40000 ALTER TABLE `inn_page` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ inn_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inn_status`;

CREATE TABLE `inn_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `inn_status` WRITE;
/*!40000 ALTER TABLE `inn_status` DISABLE KEYS */;

INSERT INTO `inn_status` (`id`, `name`)
VALUES
	(1,'公開中'),
	(2,'公開停止中');

/*!40000 ALTER TABLE `inn_status` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ inn_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inn_type`;

CREATE TABLE `inn_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `inn_type` WRITE;
/*!40000 ALTER TABLE `inn_type` DISABLE KEYS */;

INSERT INTO `inn_type` (`id`, `name`)
VALUES
	(1,'一軒家'),
	(2,'個室'),
	(3,'シェアルーム');

/*!40000 ALTER TABLE `inn_type` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ inn_view
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inn_view`;

CREATE TABLE `inn_view` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `inn_id` bigint NOT NULL,
  `viewer_id` bigint NOT NULL,
  `page_id` int NOT NULL,
  `create_time` datetime NOT NULL,
  `delete_flag` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`viewer_id`),
  KEY `inn_id` (`inn_id`),
  KEY `page_id` (`page_id`),
  CONSTRAINT `inn_view_ibfk_1` FOREIGN KEY (`viewer_id`) REFERENCES `user_user` (`id`),
  CONSTRAINT `inn_view_ibfk_2` FOREIGN KEY (`inn_id`) REFERENCES `inn_inn` (`id`),
  CONSTRAINT `inn_view_ibfk_3` FOREIGN KEY (`page_id`) REFERENCES `inn_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# テーブルのダンプ reservation_message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reservation_message`;

CREATE TABLE `reservation_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reservation_id` bigint NOT NULL,
  `sender_id` bigint NOT NULL,
  `receiver_id` bigint NOT NULL,
  `message` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `send_time` datetime NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sender_id` (`sender_id`),
  KEY `receiver_id` (`receiver_id`),
  KEY `reservation_id` (`reservation_id`),
  CONSTRAINT `reservation_message_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user_user` (`id`),
  CONSTRAINT `reservation_message_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `user_user` (`id`),
  CONSTRAINT `reservation_message_ibfk_3` FOREIGN KEY (`reservation_id`) REFERENCES `reservation_reservation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# テーブルのダンプ reservation_reservation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reservation_reservation`;

CREATE TABLE `reservation_reservation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `inn_id` bigint NOT NULL,
  `status_id` int NOT NULL,
  `reserver_id` bigint NOT NULL,
  `check_in_time` datetime NOT NULL,
  `check_out_time` datetime NOT NULL,
  `guest_number` int NOT NULL,
  `fee` int NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`),
  KEY `reserver_id` (`reserver_id`),
  KEY `inn_id` (`inn_id`),
  CONSTRAINT `reservation_reservation_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `reservation_status` (`id`),
  CONSTRAINT `reservation_reservation_ibfk_2` FOREIGN KEY (`reserver_id`) REFERENCES `user_user` (`id`),
  CONSTRAINT `reservation_reservation_ibfk_3` FOREIGN KEY (`inn_id`) REFERENCES `inn_inn` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# テーブルのダンプ reservation_review
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reservation_review`;

CREATE TABLE `reservation_review` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reservation_id` bigint NOT NULL,
  `review` varchar(1000) NOT NULL,
  `clean_score` int NOT NULL,
  `service_score` int NOT NULL,
  `facility_score` int NOT NULL,
  `location_score` int NOT NULL,
  `fee_score` int NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reservation_id` (`reservation_id`),
  CONSTRAINT `reservation_review_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation_reservation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# テーブルのダンプ reservation_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reservation_status`;

CREATE TABLE `reservation_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `reservation_status` WRITE;
/*!40000 ALTER TABLE `reservation_status` DISABLE KEYS */;

INSERT INTO `reservation_status` (`id`, `name`)
VALUES
	(1,'まもなく到着'),
	(2,'現在ホスティング中'),
	(3,'レビュー待ち'),
	(4,'レビュー済み'),
	(5,'キャンセル済み');

/*!40000 ALTER TABLE `reservation_status` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ user_authority
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_authority`;

CREATE TABLE `user_authority` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `user_authority` WRITE;
/*!40000 ALTER TABLE `user_authority` DISABLE KEYS */;

INSERT INTO `user_authority` (`id`, `mail`, `role`)
VALUES
	(1,'sample1@sample.com','USER'),
	(2,'sample2@sample.com','USER');

/*!40000 ALTER TABLE `user_authority` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ user_credit_card
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_credit_card`;

CREATE TABLE `user_credit_card` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `card_number` varchar(100) NOT NULL,
  `expiration_date` datetime NOT NULL,
  `cvv` varchar(100) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `user_credit_card` WRITE;
/*!40000 ALTER TABLE `user_credit_card` DISABLE KEYS */;

INSERT INTO `user_credit_card` (`id`, `card_number`, `expiration_date`, `cvv`, `create_time`, `update_time`, `delete_flag`)
VALUES
	(1,'0000000000000000','2024-01-01 00:00:00','012','2023-01-01 00:00:00','2023-01-01 00:00:00',0);

/*!40000 ALTER TABLE `user_credit_card` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ user_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_user`;

CREATE TABLE `user_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `mail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `credit_card_id` bigint DEFAULT NULL,
  `facebook_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `instagram_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `twitter_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `credit_card_id` (`credit_card_id`),
  CONSTRAINT `user_user_ibfk_1` FOREIGN KEY (`credit_card_id`) REFERENCES `user_credit_card` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `user_user` WRITE;
/*!40000 ALTER TABLE `user_user` DISABLE KEYS */;

INSERT INTO `user_user` (`id`, `image_url`, `name`, `description`, `address`, `occupation`, `phone_number`, `mail`, `password`, `credit_card_id`, `facebook_url`, `instagram_url`, `twitter_url`, `create_time`, `update_time`, `delete_flag`)
VALUES
	(1,'http://localhost:8080','山田太郎','素敵な人です。','神奈川県横浜市','エンジニア','01234567890','sample@sample.com','0123456789',1,'http://localhost:8080','http://localhost:8080','http://localhost:8080','2023-01-01 00:00:00','2023-01-01 00:00:00',0);

/*!40000 ALTER TABLE `user_user` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping routines (PROCEDURE) for database 'hostnavi'
--
DELIMITER ;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE truncateAllTable
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `truncateAllTable` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `truncateAllTable`()
begin
  set foreign_key_checks = 0;
  truncate table inn_image;
  truncate table inn_inn;
  truncate table inn_inn_amenity_relation;
  truncate table inn_inn_facility_relation;
  truncate table inn_view;
  truncate table reservation_message;
  truncate table reservation_reservation;
  truncate table reservation_review;
  truncate table user_credit_card;
  truncate table user_user;
end */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
