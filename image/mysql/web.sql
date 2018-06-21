-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (i486)
--
-- Host: db_server    Database: web
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12

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

CREATE DATABASE web;
use web;
--
-- Table structure for table `account`
--
DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `password` char(32) NOT NULL,
  `question` varchar(64) DEFAULT NULL,
  `answer` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `qq` varchar(16) DEFAULT NULL,
  `tel` varchar(16) DEFAULT NULL,
  `id_type` enum('IdCard') DEFAULT 'IdCard',
  `id_card` varchar(32) DEFAULT NULL,
  `point` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`name`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'test@game.sohu.com','e10adc3949ba59abbe56e057f20f883e','ÎÒµÄÀÏÆÅÃû×ÖÊÇ£¿','2f1d560997865c9288bbfbd865f5aae1',NULL,NULL,'0','IdCard',NULL,100),(2,'1234@game.sohu.com','81dc9bdb52d04dc20036dbd8313ed055','ÎÒµÄÌìÁú¹¤¾ßÄÄÀïÏÂÔØµÄ£¿','7e88dc9057c957447f54c67991ebf4c1',NULL,NULL,NULL,'IdCard',NULL,0),(3,'112233@game.sohu.com','d0970714757783e6cf17b26fb8e2298f','ÎÒµÄÌìÁú¹¤¾ßÄÄÀïÏÂÔØµÄ£¿','7e88dc9057c957447f54c67991ebf4c1',NULL,NULL,'0','IdCard',NULL,0),(5,'445566@game.sohu.com','2b792dabb4328a140caef066322c49ff','ÎÒµÄÌìÁú¹¤¾ßÄÄÀïÏÂÔØµÄ£¿','7e88dc9057c957447f54c67991ebf4c1',NULL,NULL,NULL,'IdCard',NULL,0),(6,'jxsjsf@game.sohu.com','48ee012bddc4b6d2a5c223755c5b2faa','ÎÒµÄÌìÁú¹¤¾ßÄÄÀïÏÂÔØµÄ£¿','7e88dc9057c957447f54c67991ebf4c1',NULL,NULL,'0','IdCard',NULL,0),(7,'12345aa@game.sohu.com','e10adc3949ba59abbe56e057f20f883e','ÎÒµÄÌìÁú¹¤¾ßÄÄÀïÏÂÔØµÄ£¿','7e88dc9057c957447f54c67991ebf4c1',NULL,NULL,NULL,'IdCard',NULL,0),(8,'123456aa@game.sohu.com','93a9e5bb1d598a453606e890f72bd393','a9c4020fa0fc89c333afe8fa91228d28',NULL,'97245265@qq.com',NULL,'0','IdCard',NULL,499),(9,'liuguang@game.sohu.com','71d72f32eb9220d8dab56d77c550a9e6','ÎÒµÄÌìÁú¹¤¾ßÄÄÀïÏÂÔØµÄ£¿','7e88dc9057c957447f54c67991ebf4c1',NULL,NULL,'0','IdCard',NULL,39888);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay`
--

DROP TABLE IF EXISTS `pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay` (
  `trade_no` varchar(20) NOT NULL,
  `channel` varchar(10) DEFAULT NULL,
  `server_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `fee` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` datetime NOT NULL,
  `pay_time` datetime DEFAULT NULL,
  PRIMARY KEY (`trade_no`),
  KEY `trade_no` (`trade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay`
--

LOCK TABLES `pay` WRITE;
/*!40000 ALTER TABLE `pay` DISABLE KEYS */;
INSERT INTO `pay` VALUES ('','bankpay',1,1,10,0,'2011-06-26 09:05:42',NULL),('20110626085922308','bankpay',1,1,1234,0,'2011-06-26 09:01:00',NULL),('2011062609010797','bankpay',1,1,1234,0,'2011-06-26 09:01:10',NULL);
/*!40000 ALTER TABLE `pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `host` char(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` VALUES (1,'','192.168.200.3');
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-16 22:59:37
