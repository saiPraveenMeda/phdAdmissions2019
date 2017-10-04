-- MySQL dump 10.13  Distrib 5.7.19, for Linux (i686)
--
-- Host: localhost    Database: nitap_faculty
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add qualification',7,'add_qualification'),(20,'Can change qualification',7,'change_qualification'),(21,'Can delete qualification',7,'delete_qualification'),(22,'Can add acad_ annex_d',8,'add_acad_annex_d'),(23,'Can change acad_ annex_d',8,'change_acad_annex_d'),(24,'Can delete acad_ annex_d',8,'delete_acad_annex_d'),(25,'Can add acad_ annex_m',9,'add_acad_annex_m'),(26,'Can change acad_ annex_m',9,'change_acad_annex_m'),(27,'Can delete acad_ annex_m',9,'delete_acad_annex_m'),(28,'Can add research',10,'add_research'),(29,'Can change research',10,'change_research'),(30,'Can delete research',10,'delete_research'),(31,'Can add acad_ annex_s',11,'add_acad_annex_s'),(32,'Can change acad_ annex_s',11,'change_acad_annex_s'),(33,'Can delete acad_ annex_s',11,'delete_acad_annex_s'),(34,'Can add acad_ annex_x',12,'add_acad_annex_x'),(35,'Can change acad_ annex_x',12,'change_acad_annex_x'),(36,'Can delete acad_ annex_x',12,'delete_acad_annex_x'),(37,'Can add consultancy_ projects',13,'add_consultancy_projects'),(38,'Can change consultancy_ projects',13,'change_consultancy_projects'),(39,'Can delete consultancy_ projects',13,'delete_consultancy_projects'),(40,'Can add acad_ annex_a',14,'add_acad_annex_a'),(41,'Can change acad_ annex_a',14,'change_acad_annex_a'),(42,'Can delete acad_ annex_a',14,'delete_acad_annex_a'),(43,'Can add other',15,'add_other'),(44,'Can change other',15,'change_other'),(45,'Can delete other',15,'delete_other'),(46,'Can add acad_ annex_r',16,'add_acad_annex_r'),(47,'Can change acad_ annex_r',16,'change_acad_annex_r'),(48,'Can delete acad_ annex_r',16,'delete_acad_annex_r'),(49,'Can add ph d_ completed',17,'add_phd_completed'),(50,'Can change ph d_ completed',17,'change_phd_completed'),(51,'Can delete ph d_ completed',17,'delete_phd_completed'),(52,'Can add acad_ annex_j',18,'add_acad_annex_j'),(53,'Can change acad_ annex_j',18,'change_acad_annex_j'),(54,'Can delete acad_ annex_j',18,'delete_acad_annex_j'),(55,'Can add acad_ annex_y',19,'add_acad_annex_y'),(56,'Can change acad_ annex_y',19,'change_acad_annex_y'),(57,'Can delete acad_ annex_y',19,'delete_acad_annex_y'),(58,'Can add appdata',20,'add_appdata'),(59,'Can change appdata',20,'change_appdata'),(60,'Can delete appdata',20,'delete_appdata'),(61,'Can add acad_ annex_n',21,'add_acad_annex_n'),(62,'Can change acad_ annex_n',21,'change_acad_annex_n'),(63,'Can delete acad_ annex_n',21,'delete_acad_annex_n'),(64,'Can add acad_ annex_t',22,'add_acad_annex_t'),(65,'Can change acad_ annex_t',22,'change_acad_annex_t'),(66,'Can delete acad_ annex_t',22,'delete_acad_annex_t'),(67,'Can add paper',23,'add_paper'),(68,'Can change paper',23,'change_paper'),(69,'Can delete paper',23,'delete_paper'),(70,'Can add acad_ annex_b',24,'add_acad_annex_b'),(71,'Can change acad_ annex_b',24,'change_acad_annex_b'),(72,'Can delete acad_ annex_b',24,'delete_acad_annex_b'),(73,'Can add acad_ annex_k',25,'add_acad_annex_k'),(74,'Can change acad_ annex_k',25,'change_acad_annex_k'),(75,'Can delete acad_ annex_k',25,'delete_acad_annex_k'),(76,'Can add acad_ annex_q',26,'add_acad_annex_q'),(77,'Can change acad_ annex_q',26,'change_acad_annex_q'),(78,'Can delete acad_ annex_q',26,'delete_acad_annex_q'),(79,'Can add acad_ annex_ w1_ w2',27,'add_acad_annex_w1_w2'),(80,'Can change acad_ annex_ w1_ w2',27,'change_acad_annex_w1_w2'),(81,'Can delete acad_ annex_ w1_ w2',27,'delete_acad_annex_w1_w2'),(82,'Can add acad_ annex_f',28,'add_acad_annex_f'),(83,'Can change acad_ annex_f',28,'change_acad_annex_f'),(84,'Can delete acad_ annex_f',28,'delete_acad_annex_f'),(85,'Can add education',29,'add_education'),(86,'Can change education',29,'change_education'),(87,'Can delete education',29,'delete_education'),(88,'Can add acad_ annex_o',30,'add_acad_annex_o'),(89,'Can change acad_ annex_o',30,'change_acad_annex_o'),(90,'Can delete acad_ annex_o',30,'delete_acad_annex_o'),(91,'Can add acad_ annex_u',31,'add_acad_annex_u'),(92,'Can change acad_ annex_u',31,'change_acad_annex_u'),(93,'Can delete acad_ annex_u',31,'delete_acad_annex_u'),(94,'Can add journal_ papers',32,'add_journal_papers'),(95,'Can change journal_ papers',32,'change_journal_papers'),(96,'Can delete journal_ papers',32,'delete_journal_papers'),(97,'Can add acad_ annex_z',33,'add_acad_annex_z'),(98,'Can change acad_ annex_z',33,'change_acad_annex_z'),(99,'Can delete acad_ annex_z',33,'delete_acad_annex_z'),(100,'Can add acad_ annex_c',34,'add_acad_annex_c'),(101,'Can change acad_ annex_c',34,'change_acad_annex_c'),(102,'Can delete acad_ annex_c',34,'delete_acad_annex_c'),(103,'Can add conference_ paper_sci',35,'add_conference_paper_sci'),(104,'Can change conference_ paper_sci',35,'change_conference_paper_sci'),(105,'Can delete conference_ paper_sci',35,'delete_conference_paper_sci'),(106,'Can add acad_ annex_h',36,'add_acad_annex_h'),(107,'Can change acad_ annex_h',36,'change_acad_annex_h'),(108,'Can delete acad_ annex_h',36,'delete_acad_annex_h'),(109,'Can add experience',37,'add_experience'),(110,'Can change experience',37,'change_experience'),(111,'Can delete experience',37,'delete_experience'),(112,'Can add acad_ annex_ e12',38,'add_acad_annex_e12'),(113,'Can change acad_ annex_ e12',38,'change_acad_annex_e12'),(114,'Can delete acad_ annex_ e12',38,'delete_acad_annex_e12'),(115,'Can add acad_ annex_l',39,'add_acad_annex_l'),(116,'Can change acad_ annex_l',39,'change_acad_annex_l'),(117,'Can delete acad_ annex_l',39,'delete_acad_annex_l'),(118,'Can add subject taught',40,'add_subjecttaught'),(119,'Can change subject taught',40,'change_subjecttaught'),(120,'Can delete subject taught',40,'delete_subjecttaught'),(121,'Can add referral',41,'add_referral'),(122,'Can change referral',41,'change_referral'),(123,'Can delete referral',41,'delete_referral'),(124,'Can add acad_ annex_g',42,'add_acad_annex_g'),(125,'Can change acad_ annex_g',42,'change_acad_annex_g'),(126,'Can delete acad_ annex_g',42,'delete_acad_annex_g'),(127,'Can add fac user',43,'add_facuser'),(128,'Can change fac user',43,'change_facuser'),(129,'Can delete fac user',43,'delete_facuser'),(130,'Can add acad_ annex_p',44,'add_acad_annex_p'),(131,'Can change acad_ annex_p',44,'change_acad_annex_p'),(132,'Can delete acad_ annex_p',44,'delete_acad_annex_p'),(133,'Can add acad_ annex_v',45,'add_acad_annex_v'),(134,'Can change acad_ annex_v',45,'change_acad_annex_v'),(135,'Can delete acad_ annex_v',45,'delete_acad_annex_v'),(136,'Can add external_ sponsored_ rn d',46,'add_external_sponsored_rnd'),(137,'Can change external_ sponsored_ rn d',46,'change_external_sponsored_rnd'),(138,'Can delete external_ sponsored_ rn d',46,'delete_external_sponsored_rnd'),(139,'Can add acad_ annex_i',47,'add_acad_annex_i'),(140,'Can change acad_ annex_i',47,'change_acad_annex_i'),(141,'Can delete acad_ annex_i',47,'delete_acad_annex_i'),(142,'Can add user profile',48,'add_userprofile'),(143,'Can change user profile',48,'change_userprofile'),(144,'Can delete user profile',48,'delete_userprofile'),(145,'Can add post',49,'add_post'),(146,'Can change post',49,'change_post'),(147,'Can delete post',49,'delete_post'),(148,'Can add department',50,'add_department'),(149,'Can change department',50,'change_department'),(150,'Can delete department',50,'delete_department'),(151,'Can add payment details',51,'add_paymentdetails'),(152,'Can change payment details',51,'change_paymentdetails'),(153,'Can delete payment details',51,'delete_paymentdetails');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (17,'pbkdf2_sha256$36000$cXT8NOW8qsOS$Y3sDqAC/8KkX6K0/H5aMRfVsCEc2yH4UzuZ5CsggyuM=','2017-09-21 04:29:56.851596',1,'wsdc','','','',1,1,'2017-09-20 13:36:15.447432'),(18,'pbkdf2_sha256$36000$oeLiCoyvJ3hl$9sM3N8m2h3dvwN5toSlpAhRTlihYBgQLCn/Cljuu9vk=','2017-09-20 13:55:08.165801',0,'170430001','Dr  K T V ','Reddy','ktvreddy@gmail.com',0,1,'2017-09-20 13:51:02.140711'),(19,'pbkdf2_sha256$36000$jLCbfKedAuAc$yyK/FJdeCsIAvTUjMrgMVAJPBZTzmeKf7WnfmuQu7zc=','2017-09-20 14:16:42.378347',0,'170310001','Soumen ','Mandal','soumenbhu@gmail.com',0,1,'2017-09-20 14:11:00.863791'),(20,'pbkdf2_sha256$36000$M5TgpvN4nBQF$cwtWm8WFiwCNTpSlen3sFNujBnfpvz7UAhim9TJqwxY=','2017-09-20 14:35:09.641995',0,'171210001','Cherry Mathew','Philipose','cherrymp@gmail.com',0,1,'2017-09-20 14:33:56.306042'),(21,'pbkdf2_sha256$36000$x5EfkNK5b31N$lpbziClFZkcEkSfZlA4qt1NpKM+bkeTt7ap8JzFQYbQ=','2017-09-20 15:40:55.705931',0,'170410002','Abu','Ghazali','anghazali@gmail.com',0,1,'2017-09-20 15:34:39.679022'),(22,'pbkdf2_sha256$36000$tiTJOCtQXe7L$U+1rkJ6ec69Of3qQ9LQO0VY37Va4irUcqNBvcWtEsO8=','2017-09-20 15:52:16.273546',0,'170310002','Balasubramanian','Esakki','esak.bala@gmail.com',0,1,'2017-09-20 15:51:05.847205'),(23,'pbkdf2_sha256$36000$I3UKMZaBpiQh$DDNI5N1RXTZfqwj6edWuz+uX3451bty+LYSizu+VPKo=','2017-09-20 17:16:25.919668',0,'170410003','Shruthi ','Br','shruthibr1992@gmail.com',0,1,'2017-09-20 17:15:16.912123'),(24,'pbkdf2_sha256$36000$pOKRXzi74fnR$0ZuQvQFzXN7q7mRNnom8UTkkWmNHNzWn4NxrpjbsEQc=','2017-09-21 08:52:26.584768',0,'170610001','Tejaswi Sreeram Kumar Reddy','Vakamalla','teja.vakamalla@gmail.com',0,1,'2017-09-20 18:05:26.747011'),(25,'pbkdf2_sha256$36000$DreGwFrmXBXO$RZjhalnVlyR6pi8FfMxYRWcPtSWv6er9cyKcbSr7yjo=','2017-09-20 18:31:59.265806',0,'170310003','Siva','Sankar','sivaswa143@gmail.com',0,1,'2017-09-20 18:27:53.262190'),(26,'pbkdf2_sha256$36000$eJN9n39c0ntT$1wnq4m3emCsHW1tNPjG6f3Uw8GmNZxmb2lH1H47Yxkw=','2017-09-21 12:26:31.722047',0,'170110001','Dr Naveen',' BP','bp.naveen864@gmail.com',0,1,'2017-09-21 01:44:00.143018'),(27,'pbkdf2_sha256$36000$ilQKGv66D20r$e2MiypUtZyE03TYFs0/xlHRiJfRWlFMQMHHrcIZ/QDY=',NULL,0,'170210001','SIVASUBRAMANIAN','M','shivam.annauniversity@gmail.com',0,1,'2017-09-21 04:10:36.637026'),(28,'pbkdf2_sha256$36000$Vvgf9cYeRdGp$7y/DwKSYAf0qC0RmmLiXsCvw7RmJ6UEZrIDu1WLo9Qw=','2017-09-21 04:19:26.883663',0,'170310004','Bhagrav Prajwal','Pathri','bhargavpathri@gmail.com',0,1,'2017-09-21 04:18:22.638511'),(29,'pbkdf2_sha256$36000$SiIPtrObLszC$4AVuY0GYGyrE/T41ZNkSVY+Mh82bgSF7DN96AO1xxAQ=','2017-09-21 04:22:45.046487',0,'170210002','Tejavathu','Ramesh','tramesh.ee@gmail.com',0,1,'2017-09-21 04:21:47.184614'),(30,'pbkdf2_sha256$36000$DxsmTMKnrhVg$XTk2RJ5aE4q+JcnNPldwap6gUe3aPxcvSeZxoA+KZbg=','2017-09-21 04:46:42.324041',0,'170410004','Kannan','R','rrkannaiya@gmail.com',0,1,'2017-09-21 04:45:11.788675'),(31,'pbkdf2_sha256$36000$ZSbjaJU0ioxW$ZFD0BGrcj+z43zF6h80HWn1EeKkIIMyNEpbqsDSWG+k=','2017-09-21 05:05:35.365784',0,'170310005','Balaji','PS','aerobala@gmail.com',0,1,'2017-09-21 05:04:54.885670'),(32,'pbkdf2_sha256$36000$U5jh1impViSR$6WyqOq/tzn6/kLCq49jjJGKD+ty14Hb0L+9he/abHq8=','2017-09-21 12:23:09.537334',0,'170810001','THOLCOPIYAN','LOGANATHAN','arasubiotech13@gmail.com',0,1,'2017-09-21 05:07:40.399791'),(33,'pbkdf2_sha256$36000$b2ErvG0g8Y7V$Klz+rtROLxSnP3LxMC6N/qFITTkvt6V7dgPxudQclrQ=','2017-09-21 05:14:05.103993',0,'170310006','M R KUMAR','VAKKALAGADDA','ravindra.btw@gmail.com',0,1,'2017-09-21 05:11:09.732118'),(34,'pbkdf2_sha256$36000$VFt6tBkk0NFi$1ZXOAMCovpCY8UVmSBvYlUdlxM9KIbu6/wDXhfUI4Uc=','2017-09-21 11:23:10.185381',0,'170910001','Jeevaraj','S','jeevanitt@gmail.com',0,1,'2017-09-21 05:13:11.773482'),(35,'pbkdf2_sha256$36000$IcZJgX9I71Jv$XN5a1IBzwAOmrlW93HAPj2uDdupLAG6NyLrT4H7pDKw=','2017-09-21 13:31:50.014167',0,'170510003','LEELA PYDI PAVITHRA','CHOKKAKULA','chlppavithra@gmail.com',0,1,'2017-09-21 05:16:59.023245'),(36,'pbkdf2_sha256$36000$666gFMWfVZlg$vQdFlMCEPcLjurzyK/68wrfoyHhV5LFUZyCUFP2YnWg=',NULL,0,'170110002','ESAKKIRAJ ','MANOKARAN','manoissac1996@gmail.com',0,1,'2017-09-21 05:16:59.873776'),(37,'pbkdf2_sha256$36000$MNF8GlPKh6KP$Jbku02jvoETant97mibMZSsJAAMxPPw+Dblvm0TYLxU=','2017-09-21 05:21:33.369719',0,'170610002','Subhasis','Mandal','subhasis.chemical@gmail.com',0,1,'2017-09-21 05:19:19.979202'),(38,'pbkdf2_sha256$36000$894moJj7vDvZ$XAt00j/sSKKlK1zwJ14psCxeyFZvQS1ePq5AKUaon4s=','2017-09-21 06:47:34.523394',0,'170130003','Kiran Kumar','Bangalore Venkatesh','kiran_kumarbv@yahoo.com',0,1,'2017-09-21 05:21:35.975311'),(39,'pbkdf2_sha256$36000$3vfvgSLtJJXL$ILY8El3uV61JXvO4FnF5aqvEBSJUAMJtRzRRKBosj+0=',NULL,0,'170710001','SANDHYA','MULAGALA','msandhya.phd@gmail.com',0,1,'2017-09-21 05:23:55.010672'),(40,'pbkdf2_sha256$36000$YdyvlmqbOFCW$hq/B7mG+IbCPsC2dWQpku2iJg/G6yWH5LcAQSDswe3Q=','2017-09-21 08:23:00.336951',0,'170310007','Basil','Kuriachen','basilkuriachen@gmail.com',0,1,'2017-09-21 05:29:34.428899'),(41,'pbkdf2_sha256$36000$qQhnZsNoIO3e$O61XsZskVmQKHJ55H68aRii2ddOC0fA/OCsbifE5MMM=','2017-09-21 05:32:34.995593',0,'170710002','boddu','vijayasree','lingaswamy2k6@gmail.com',0,1,'2017-09-21 05:31:54.227807'),(42,'pbkdf2_sha256$36000$a7Ve2977wce5$ty+MHXjfqk8yFetK7iwURJWeS2+VDbuIc6pLjJb0ofA=','2017-09-21 08:12:31.893473',0,'170210003','MOHAN RAO','UNGARALA','mohan13.nith@gmail.com',0,1,'2017-09-21 05:43:33.219095'),(43,'pbkdf2_sha256$36000$ldSvSS9Sj9co$TD4eUIYtM6EsQJUjoF8L4pDsQ4It409EKNRIe4jCNRI=','2017-09-21 06:13:17.267059',0,'170110004','Giridhar Rajesh','Bande','giridharrajesh@gmail.com',0,1,'2017-09-21 06:04:42.705915'),(44,'pbkdf2_sha256$36000$87XyqXp4GNz2$k40UU0NgMaI2HlVMhz9LfFlYK3Ap2jETGlNFwdfRivY=','2017-09-21 06:27:40.644248',0,'170210004','Yashwant ','Kashyap','yashwant.kashyap@gmail.com',0,1,'2017-09-21 06:26:15.179419'),(45,'pbkdf2_sha256$36000$GaPQZfWQ1ryk$Ziex60O1KoM4DeEMK/3VAkOeEQnkd8iEe4nP2NspVv8=','2017-09-21 07:56:25.117366',0,'170710003','Narasimha Reddy','Soora','snreddy75@yahoo.co.uk',0,1,'2017-09-21 06:30:10.470220'),(46,'pbkdf2_sha256$36000$oKTDAm0WEJLT$FWmrB8tRHqTgfk8+JN6LJuoyGIbShmiVBTNKKlr5xLw=','2017-09-21 06:38:37.758311',0,'170510004','Maridurai','Thirupathy','mari.durai@gmail.com',0,1,'2017-09-21 06:37:39.477117'),(47,'pbkdf2_sha256$36000$GHtB1mLNWsnv$fcMgotyi8oqiERiiRuQaG7aC0oNguf/5GR7htVfQ/PU=','2017-09-21 06:43:34.421892',0,'171110001','VIJAYACHANDRASEKAR','M','sekavijay@gmail.com',0,1,'2017-09-21 06:42:22.051914'),(48,'pbkdf2_sha256$36000$XLO25CNYrr14$/iGsPYqJLmtme/vA09QsQzUd79CH42bfruxnuRhFmk0=','2017-09-21 07:23:29.019089',0,'170710004','Kalyani','Purini','kalyani.purini@gmail.com',0,1,'2017-09-21 07:18:49.934919'),(49,'pbkdf2_sha256$36000$QyQZsJbjrz7a$N+IIrQ4Miq/WbmqJ0S2P6cOib/beBYTgkJeWzEEsPJ8=','2017-09-21 11:20:07.170446',0,'170210005','Dharmendra Kumar ','Dheer','dheer.iitkgp@gmail.com',0,1,'2017-09-21 07:21:38.959520'),(50,'pbkdf2_sha256$36000$TjR06W3k3wHC$CHCoyJn5txGDb1YQnMBh4X5Hejvp7yr0sVYQY9+k/SM=',NULL,0,'170720005','Kalyani','Purini','kalyani.purini@gmail.com',0,1,'2017-09-21 07:21:39.329452'),(51,'pbkdf2_sha256$36000$3ceMu33gIVgz$Ehrul37CcQPc5KTezCgMPigyvXC9yVoxzo9klXWQ5u8=','2017-09-21 07:29:57.356540',0,'171110002','Karuppiah ','Nagaraj ','naturalnagaraj@gmail.com',0,1,'2017-09-21 07:26:44.500754'),(52,'pbkdf2_sha256$36000$XolqQ3uSGUv1$jPejXPGYDP7qyxyN1rmRSSjfGYyhCiIwnh2a1XQ5ikc=','2017-09-21 12:10:54.275281',0,'170810002','Narasimhulu','Korrapati','simha_bt@nitw.ac.in',0,1,'2017-09-21 07:44:06.199038'),(53,'pbkdf2_sha256$36000$ksIFvArrpGVl$0dVvKxeoj8qyR5gE9dDNj+5CftZ6Jq6RKBmdIh5zxiw=',NULL,0,'171010001','VEL','SAMY','VELSAMY15101984@GMAIL.COM',0,1,'2017-09-21 07:57:40.132181'),(54,'pbkdf2_sha256$36000$vqk4ZirRme0e$p5vp1mcXDqXda+ukJpdTdLSbmqzpq2VxoLyIGEg28Xw=','2017-09-21 08:11:25.679448',0,'170710006','sathish','karthikeyan','sathishmultitech435@gmail.com',0,1,'2017-09-21 08:10:50.104987'),(55,'pbkdf2_sha256$36000$iOc05nLNkJ78$+z3DZAKtm0sVydr+rmnPfXALeqh998idr1loIQZqaGY=','2017-09-21 12:23:20.003947',0,'170310008','DEEPAK','KUMAR','deepak.vermag@gmail.com',0,1,'2017-09-21 08:21:08.497198'),(56,'pbkdf2_sha256$36000$dbB86fIdhi4a$Hjri/k46QUhVyKmq3LKcFDmzMQ4p7Zo64S7DtLf7OAs=','2017-09-21 08:40:56.565887',0,'170310009','DEVARAJU','ARURI','aruri_devaraj@yahoo.com',0,1,'2017-09-21 08:39:55.681826'),(57,'pbkdf2_sha256$36000$UVB0YOVlF2ih$wPIIZmrGuQbO1ouWiTPhX57RBPjVQcqSWmRda0Fn7XA=','2017-09-21 13:01:55.132783',0,'171010002','Raghavendra Rao','Juluri','raghavavaphy@gmail.com',0,1,'2017-09-21 08:46:45.856636'),(58,'pbkdf2_sha256$36000$SSdJHs2oBwMR$OzRV+lSOF/1HlZkwgeGtUJU6JsFtq9yDbwqDbO44GMc=','2017-09-21 08:55:07.876956',0,'170210006','Bandaru','Ramakrishna','ramakrishnakitt@gmail.com',0,1,'2017-09-21 08:53:38.796818'),(59,'pbkdf2_sha256$36000$a0GEDRv2F8P0$5/FWtGKE/uT0era8Hz390VmWxWJmtHEBk452RKwuuEg=','2017-09-21 09:06:14.744206',0,'170310010','Prabhakara Rao','Ganji','ganjiprabhakar@gmail.com',0,1,'2017-09-21 09:05:18.507719'),(60,'pbkdf2_sha256$36000$wIkKZ0JB7VxB$ta8WP5Zg72u0vz59FZLo1LUIRJ0VPbwn48YO7RvzCu8=','2017-09-21 09:25:30.783822',0,'171210002','A BALU','VIJAYARAGHAVAN','balu.vijayaraghavan@gmail.com',0,1,'2017-09-21 09:24:27.992914'),(61,'pbkdf2_sha256$36000$BoFNQqQlje5b$K0jBLs6PMg8bUBa9XKcfLvVfy0QNZUlFG43jXjLMpuk=','2017-09-21 10:11:46.523520',0,'170210007','Dr. Suresh','Mikkili','msuresh.ee@gmail.com',0,1,'2017-09-21 09:37:40.790749'),(62,'pbkdf2_sha256$36000$1SJktIwzc0tF$Htbp47RQTQScWQryRT0kkE8oxXZgNM1vt2rk5izuMJc=','2017-09-21 10:16:13.377562',0,'170610003','ANJIREDDY','BHAVANAM','anjireddy.bhavanam@gmail.com',0,1,'2017-09-21 09:42:47.511324'),(63,'pbkdf2_sha256$36000$YI0JV4Jwe0v7$p9sBqXbxpZDbojLlN/mGXAl/gDBvTm670vSq884jov0=','2017-09-21 09:47:49.416878',0,'171110003','vijayalakshmi','babu','vijichemi@gmail.com',0,1,'2017-09-21 09:45:39.817416'),(64,'pbkdf2_sha256$36000$0yVtqnCWCZJL$Tv4xCdepG5qTFj4o+GB1wE0uoWs68XLWdwu1q64zJHA=','2017-09-21 09:58:01.367923',0,'171110004','Sabeel','M Basheer','sabeelmb@yahoo.com',0,1,'2017-09-21 09:56:33.726252'),(65,'pbkdf2_sha256$36000$3f8RcO9RVBFD$H3lJl36Nk1OK1SHlVhH0dVsrK2TsniMCu09E1tpvc3s=','2017-09-21 10:06:50.077972',0,'170210008','kanagalakshmi','sannasy','itskanaga@gmail.com',0,1,'2017-09-21 10:05:42.620535'),(66,'pbkdf2_sha256$36000$z2Wcdpu0pB3p$bzoTCdzu1yO9Rdu+3p01FqV1RSlJeTFrrOaC3PzhCA4=','2017-09-21 11:05:35.389649',0,'170310011','Pravat Ranjan','Pati','pravatpati99@gmail.com',0,1,'2017-09-21 10:09:04.686486'),(67,'pbkdf2_sha256$36000$xLiFntAfjJtC$yM4BwPQVxjLL0rQzI+K0En4v6yCJHhKPoMqG3+0dTak=','2017-09-21 10:23:51.182282',0,'170410005','SUKANYA','GHOSH','gsukanya66@gmail.com',0,1,'2017-09-21 10:15:14.391685'),(68,'pbkdf2_sha256$36000$6SgAVGPY5p3d$gdvjXa1XxdAuFpDEJk4tMzOfcBb0eSJjLVeN6FbIEbY=','2017-09-21 10:42:22.102118',0,'170310012','RAGHAVENDRA','GUJJALA','raghavendra.gujjala@gmail.com',0,1,'2017-09-21 10:24:57.371582'),(69,'pbkdf2_sha256$36000$wjQ0bvMrZ4lw$C3d3LVzVdSRWLxWreE24ZN2dZMHiP6wYd3vwN6JksF4=','2017-09-21 10:31:13.482414',0,'170310013','R','Seetharam','seetharam.seetharam@gmail.com',0,1,'2017-09-21 10:30:17.848172'),(70,'pbkdf2_sha256$36000$mkHSwrZjgIca$nxPKNWuISEypgGxmNwDSAhurrGIX4Rj1n2SQztwFqFE=','2017-09-21 10:53:58.411428',0,'171010003','UDAY BHASKAR','PAMIDI','pamidi_uday@yahoo.co.in',0,1,'2017-09-21 10:39:06.106050'),(71,'pbkdf2_sha256$36000$nqGUhvE7zBWR$yFvO5jyPRmC9TM+pJVdecBQiPBg2dVuqCwXRA9qSD/4=','2017-09-21 10:43:07.534009',0,'170610004','Susarla Venkata Ananata Rama','Sastry','svarsastry@yahoo.com',0,1,'2017-09-21 10:42:10.879954'),(72,'pbkdf2_sha256$36000$OLC9HNl7uZWl$25uJ7+d7dVgLwStAfj/fllq9/1CXKJNVIDepvsV2X2Q=','2017-09-21 12:23:54.398384',0,'170210009','HARISH','BALAGA','harish.balaga@gmail.com',0,1,'2017-09-21 10:47:06.197877'),(73,'pbkdf2_sha256$36000$MzwLACgF52RR$VODD/PFrv79pZRufupni+g4cgIobizyerArCjd5n4TI=','2017-09-21 10:57:01.373849',0,'170310014','MANMADHACHARY','AIAMUNOORI','manmadhachary@gmail.com',0,1,'2017-09-21 10:55:19.298658'),(74,'pbkdf2_sha256$36000$ChoBRZj7bwb7$GSsOJmfaqCQasQxdy/XvK+KeVaunNRhujvRdxG6wdl0=','2017-09-21 11:04:05.383709',0,'170410006','ANITHA','M','anithamanga@gmail.com',0,1,'2017-09-21 11:01:05.146527'),(75,'pbkdf2_sha256$36000$zlAe1AmyzEM6$vdY8qGN1ETbIL+DqYv+qmsmfKC1e2NhDIb3shR/z9DI=',NULL,0,'170210010','SUDHAKAR','AMBARAPU','ambarapu_sudhakar@yahoo.co.in',0,1,'2017-09-21 11:21:49.098083'),(76,'pbkdf2_sha256$36000$WkTCNEzT5fqq$1ygjogJoYER1OtPhDcUJoJRvz0cu2hlWxI35qI69raQ=',NULL,0,'170420007','VANITHA','MANI','drvanithamaniece@gmail.com',0,1,'2017-09-21 11:41:43.484706'),(77,'pbkdf2_sha256$36000$NCnehBe7itti$OIDML91BBcOfK1wQ7mOKqr2VaY1dsj16miXSBKyOJVM=','2017-09-21 12:09:06.830645',0,'170410008','Mohanraj','Thangamuthu','mohanraj_me@yahoo.co.in',0,1,'2017-09-21 12:07:57.691126'),(78,'pbkdf2_sha256$36000$JmF2DIz7I0if$DkstSPmDvE3ws0fKF95EL2oM8ErTnCBBj9Hh52DAN5Q=','2017-09-21 12:21:39.315054',0,'170710007','veeresha','mala','veeresha.mtech@gmail.com',0,1,'2017-09-21 12:11:24.936837'),(79,'pbkdf2_sha256$36000$5IMyAVMYQZz7$q2QJO1YAbSJjG1inrqSHP1SrMmjucwXlqMyLaYK8BKI=','2017-09-21 12:29:57.593524',0,'170810003','NADEEM','SIDDIQUI','nadeem01508@gmail.com',0,1,'2017-09-21 12:15:41.229724'),(80,'pbkdf2_sha256$36000$MEzm8v7Vre7e$MsFfa4EwIUbWSrKXFEjZ1dkw7HmTfYS5JUR1J0eyano=','2017-09-21 12:56:43.785524',0,'170410009','bharath','kumar kammara','kammarabharathkumar@gmail.com',0,1,'2017-09-21 12:54:12.790852'),(81,'pbkdf2_sha256$36000$LEgp4IasNMeW$N+2Ys8Xic49XIeG7kY9Q2SvXkXCqnK96pCORwBOFeqM=','2017-09-21 13:24:40.555628',0,'171110005','Pralok','Samanta','pralok.samanta@gmail.com',0,1,'2017-09-21 13:22:49.842740'),(82,'pbkdf2_sha256$36000$IZMbSzGLSnMJ$FKrM9d/6bqg9G2DURoTNAzJUrhrRW9RkQtsZoDDKgio=',NULL,0,'170720008','puligundla','Neelakantan','pneelaknatan@rediffmail.com',0,1,'2017-09-21 13:42:39.481563'),(83,'pbkdf2_sha256$36000$Aozx79sDP1gx$CL96ipt7+UI9ELEMwEquQSvfMnDsu6Yj2XBxxQuLX/Y=','2017-09-21 13:49:03.374161',0,'170720009','puligundla','neelakantan','pneelakantan@rediffmail.com',0,1,'2017-09-21 13:48:01.188623'),(84,'pbkdf2_sha256$36000$2EVdA31mtver$2C+ZBSLFC/V7e0skYP7biCEdBfJHb1V6BFBPavABxWM=',NULL,0,'170710010','Sathya Babu','Korra','prof.ksb@gmail.com',0,1,'2017-09-21 13:56:20.823986');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (47,'2017-09-20 13:37:25.818719','1','Civil Engineering Department',2,'[{\"changed\": {\"fields\": [\"appCount\"]}}]',50,17),(48,'2017-09-20 13:37:31.773454','2','Electronics and Communication Engineering',2,'[]',50,17),(49,'2017-09-20 13:37:39.919078','3','Computer Science and Engineering',2,'[{\"changed\": {\"fields\": [\"appCount\"]}}]',50,17),(50,'2017-09-20 13:37:48.917328','4','Biotechnology Department',2,'[{\"changed\": {\"fields\": [\"appCount\"]}}]',50,17),(51,'2017-09-20 13:37:55.236456','5','Electrical and Electronics Engineering Department',2,'[]',50,17),(52,'2017-09-20 13:38:01.593480','12','Mathematics Department',2,'[]',50,17),(53,'2017-09-20 13:38:06.679390','11','Physics Department',2,'[]',50,17),(54,'2017-09-20 13:38:11.911193','10','Chemistry Department',2,'[]',50,17),(55,'2017-09-20 13:38:16.669761','9','Humanities and Social Science',2,'[]',50,17),(56,'2017-09-20 13:38:24.933367','8','Chemical Engineering Department',2,'[{\"changed\": {\"fields\": [\"appCount\"]}}]',50,17),(57,'2017-09-20 13:38:30.729681','6','Mechanical Engineering Department',2,'[]',50,17),(58,'2017-09-20 13:38:36.710394','6','Mechanical Engineering Department',2,'[]',50,17),(59,'2017-09-20 13:38:43.494152','5','Electrical and Electronics Engineering Department',2,'[]',50,17),(60,'2017-09-20 13:39:13.539174','14','170730009',3,'',51,17),(61,'2017-09-20 13:39:13.547101','13','170730008',3,'',51,17),(62,'2017-09-20 13:39:13.552791','12','170510002',3,'',51,17),(63,'2017-09-20 13:39:13.554514','11','170610001',3,'',51,17),(64,'2017-09-20 13:39:13.555964','10','170110002',3,'',51,17),(65,'2017-09-20 13:39:13.561071','9','170510001',3,'',51,17),(66,'2017-09-20 13:39:13.562791','8','170710007',3,'',51,17),(67,'2017-09-20 13:39:13.564731','7','170130001',3,'',51,17),(68,'2017-09-20 13:39:13.569457','6','170710006',3,'',51,17),(69,'2017-09-20 13:39:13.570988','5','170710005',3,'',51,17),(70,'2017-09-20 13:39:13.573372','4','170720004',3,'',51,17),(71,'2017-09-20 13:39:13.577371','3','170810001',3,'',51,17),(72,'2017-09-20 13:39:13.578823','2','170710003',3,'',51,17),(73,'2017-09-20 13:39:13.585072','1','170720002',3,'',51,17);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(14,'recruit','acad_annex_a'),(24,'recruit','acad_annex_b'),(34,'recruit','acad_annex_c'),(8,'recruit','acad_annex_d'),(38,'recruit','acad_annex_e12'),(28,'recruit','acad_annex_f'),(42,'recruit','acad_annex_g'),(36,'recruit','acad_annex_h'),(47,'recruit','acad_annex_i'),(18,'recruit','acad_annex_j'),(25,'recruit','acad_annex_k'),(39,'recruit','acad_annex_l'),(9,'recruit','acad_annex_m'),(21,'recruit','acad_annex_n'),(30,'recruit','acad_annex_o'),(44,'recruit','acad_annex_p'),(26,'recruit','acad_annex_q'),(16,'recruit','acad_annex_r'),(11,'recruit','acad_annex_s'),(22,'recruit','acad_annex_t'),(31,'recruit','acad_annex_u'),(45,'recruit','acad_annex_v'),(27,'recruit','acad_annex_w1_w2'),(12,'recruit','acad_annex_x'),(19,'recruit','acad_annex_y'),(33,'recruit','acad_annex_z'),(20,'recruit','appdata'),(35,'recruit','conference_paper_sci'),(13,'recruit','consultancy_projects'),(29,'recruit','education'),(37,'recruit','experience'),(46,'recruit','external_sponsored_rnd'),(43,'recruit','facuser'),(32,'recruit','journal_papers'),(15,'recruit','other'),(23,'recruit','paper'),(17,'recruit','phd_completed'),(7,'recruit','qualification'),(41,'recruit','referral'),(10,'recruit','research'),(40,'recruit','subjecttaught'),(50,'registration','department'),(51,'registration','paymentdetails'),(49,'registration','post'),(48,'registration','userprofile'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-09-09 17:52:13.934973'),(2,'auth','0001_initial','2017-09-09 17:52:15.293762'),(3,'admin','0001_initial','2017-09-09 17:52:15.490346'),(4,'admin','0002_logentry_remove_auto_add','2017-09-09 17:52:15.521294'),(5,'contenttypes','0002_remove_content_type_name','2017-09-09 17:52:15.637398'),(6,'auth','0002_alter_permission_name_max_length','2017-09-09 17:52:15.655481'),(7,'auth','0003_alter_user_email_max_length','2017-09-09 17:52:15.692969'),(8,'auth','0004_alter_user_username_opts','2017-09-09 17:52:15.720264'),(9,'auth','0005_alter_user_last_login_null','2017-09-09 17:52:15.805506'),(10,'auth','0006_require_contenttypes_0002','2017-09-09 17:52:15.807545'),(11,'auth','0007_alter_validators_add_error_messages','2017-09-09 17:52:15.827231'),(12,'auth','0008_alter_user_username_max_length','2017-09-09 17:52:15.873916'),(13,'recruit','0001_initial','2017-09-09 17:52:17.047351'),(14,'recruit','0002_acad_annex_j_acad_annex_k_acad_annex_l_acad_annex_m_acad_annex_n_acad_annex_o_acad_annex_p_acad_anne','2017-09-09 17:52:19.071880'),(15,'recruit','0003_facuser_user','2017-09-09 17:52:19.214740'),(16,'recruit','0004_auto_20170901_2219','2017-09-09 17:52:19.357203'),(17,'recruit','0005_auto_20170901_2232','2017-09-09 17:52:19.632341'),(18,'recruit','0006_facuser_mother_occ','2017-09-09 17:52:19.711834'),(19,'recruit','0007_auto_20170902_1200','2017-09-09 17:52:20.093595'),(20,'recruit','0008_auto_20170902_1208','2017-09-09 17:52:22.035622'),(21,'recruit','0006_auto_20170902_1423','2017-09-09 17:52:22.193264'),(22,'recruit','0007_auto_20170902_1444','2017-09-09 17:52:24.260034'),(23,'recruit','0009_merge_20170902_1636','2017-09-09 17:52:24.263427'),(24,'recruit','0010_auto_20170902_1816','2017-09-09 17:52:24.524032'),(25,'recruit','0011_acad_annex_z_last_prom','2017-09-09 17:52:24.709869'),(26,'recruit','0012_auto_20170902_1915','2017-09-09 17:52:27.840938'),(27,'recruit','0013_auto_20170902_1932','2017-09-09 17:52:30.157834'),(28,'recruit','0014_auto_20170902_1938','2017-09-09 17:52:31.826702'),(29,'recruit','0015_auto_20170903_0410','2017-09-09 17:52:32.997634'),(30,'recruit','0009_subjecttaught','2017-09-09 17:52:33.121151'),(31,'recruit','0009_merge_20170902_2244','2017-09-09 17:52:33.129541'),(32,'recruit','0010_merge_20170903_0322','2017-09-09 17:52:33.133233'),(33,'recruit','0016_merge_20170903_0450','2017-09-09 17:52:33.136386'),(34,'recruit','0017_auto_20170903_0547','2017-09-09 17:52:33.446303'),(35,'recruit','0018_auto_20170903_0552','2017-09-09 17:52:33.645347'),(36,'recruit','0016_merge_20170903_0457','2017-09-09 17:52:33.648720'),(37,'recruit','0019_merge_20170903_0707','2017-09-09 17:52:33.654097'),(38,'recruit','0019_auto_20170903_1110','2017-09-09 17:52:35.928579'),(39,'recruit','0020_merge_20170903_1143','2017-09-09 17:52:35.932645'),(40,'recruit','0021_auto_20170903_1322','2017-09-09 17:52:36.488968'),(41,'recruit','0022_auto_20170903_1400','2017-09-09 17:52:36.940270'),(42,'recruit','0022_auto_20170903_1348','2017-09-09 17:52:40.434149'),(43,'recruit','0023_merge_20170903_1745','2017-09-09 17:52:40.437466'),(44,'recruit','0024_auto_20170903_1809','2017-09-09 17:52:40.657768'),(45,'recruit','0023_merge_20170903_2219','2017-09-09 17:52:40.661582'),(46,'recruit','0025_merge_20170903_2346','2017-09-09 17:52:40.665263'),(47,'recruit','0022_auto_20170903_1448','2017-09-09 17:52:41.231492'),(48,'recruit','0023_acad_annex_y_credit_score','2017-09-09 17:52:41.363233'),(49,'recruit','0024_auto_20170903_1812','2017-09-09 17:52:43.635425'),(50,'recruit','0026_merge_20170903_1843','2017-09-09 17:52:43.638991'),(51,'recruit','0023_merge_20170903_1944','2017-09-09 17:52:43.641780'),(52,'recruit','0027_merge_20170903_1955','2017-09-09 17:52:43.644817'),(53,'recruit','0026_merge_20170904_0008','2017-09-09 17:52:43.647873'),(54,'recruit','0028_merge_20170903_2110','2017-09-09 17:52:43.650842'),(55,'recruit','0029_auto_20170904_1541','2017-09-09 17:52:43.941887'),(56,'recruit','0030_auto_20170906_1548','2017-09-09 17:52:44.767597'),(57,'recruit','0031_auto_20170906_1734','2017-09-09 17:52:44.982578'),(58,'recruit','0032_appdata_locked','2017-09-09 17:52:45.217779'),(59,'recruit','0033_auto_20170907_0844','2017-09-09 17:52:45.325225'),(60,'recruit','0034_auto_20170907_0845','2017-09-09 17:52:45.431762'),(61,'recruit','0035_appdata_submitdate','2017-09-09 17:52:45.550565'),(62,'recruit','0036_auto_20170907_1008','2017-09-09 17:52:45.655813'),(63,'recruit','0037_auto_20170907_1009','2017-09-09 17:52:45.807416'),(64,'recruit','0038_auto_20170907_1057','2017-09-09 17:52:45.910707'),(65,'recruit','0032_auto_20170906_2024','2017-09-09 17:52:46.015530'),(66,'recruit','0039_merge_20170907_1150','2017-09-09 17:52:46.019047'),(67,'recruit','0040_auto_20170908_1332','2017-09-09 17:52:46.620420'),(68,'recruit','0041_auto_20170908_1842','2017-09-09 17:52:49.401924'),(69,'registration','0001_initial','2017-09-09 17:52:49.536285'),(70,'registration','0002_department','2017-09-09 17:52:49.561081'),(71,'registration','0003_post','2017-09-09 17:52:49.588329'),(72,'registration','0004_userprofile_termsread','2017-09-09 17:52:49.747082'),(73,'registration','0005_userprofile_profilepic','2017-09-09 17:52:49.796170'),(74,'registration','0006_remove_userprofile_profilepic','2017-09-09 17:52:49.842619'),(75,'registration','0007_userprofile_profilepic','2017-09-09 17:52:49.891349'),(76,'sessions','0001_initial','2017-09-09 17:52:49.917923'),(77,'recruit','0042_auto_20170916_2216','2017-09-17 05:21:45.799893'),(78,'recruit','0043_auto_20170917_0145','2017-09-17 05:21:46.197628'),(79,'recruit','0042_appdata_paymentuploaded','2017-09-17 05:21:46.520279'),(80,'recruit','0044_merge_20170917_0120','2017-09-17 05:21:46.524113'),(81,'registration','0008_paymentdetails','2017-09-17 05:21:46.597094'),(82,'recruit','0045_auto_20170917_0936','2017-09-17 09:32:57.722627'),(83,'recruit','0046_auto_20170917_0944','2017-09-17 09:33:00.820194'),(84,'registration','0009_auto_20170917_0856','2017-09-17 09:33:00.945542'),(85,'recruit','0047_auto_20170918_0525','2017-09-18 05:28:22.684851'),(86,'recruit','0048_auto_20170919_1136','2017-09-19 12:05:08.184877');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0m0edyphx4y1fcq9nn5sv1ozq5egfkuf','NTA4NWEzYTY5MjM3YmEyZTIyMDllMTljYWY5ZmQxOTNjMWQ3YTBmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjA1MjVmMTYwNDA5YjZkZTVmMDMxMzQ1N2UwNTYxZGEyYTVjNjczNTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=','2017-10-01 14:43:36.309003'),('125hqa1kqzwq51fs210cdiei7cxjyh2k','YzQyZjliNmU0NDRmOTdhOTQwNGYzNmQwZWZiZjcwZjkwZThkYTExNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkMTU5ZDk3NTMyYmQ1NmQ3ZGJkYWQ4ZjQ1ZDZmZGI3ZTA1OWY2OWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3MyJ9','2017-10-05 10:57:01.389823'),('17ab9trm9rmut3psxa9do9nx5ygktmzc','YjFlNmQ4NTE1MTVjOTk5MzYwZmM2ZDJjNWE4YjI1MjU5ZGE4MjZmNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyOGFmMjllMGVkNjVhYWI3YjhjYTA1MzdjMzdjNmYyNzExMTRiNWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1MSJ9','2017-10-05 07:29:57.363260'),('1zlx7zoopcwutmexob1llavcpu2f3pdw','NzIzY2M2YTkzMWQ1ODhkNWRhYTlkYzA4YTk2NzM1YjQ1Y2UyZmNjZDp7fQ==','2017-10-04 07:50:31.527792'),('30b3ft151vgi56n80e0zmnitcyenvnwe','NzM1NmYwODVhZDM2MWIwNzkyYzQyZjNlM2Q5ZTFmNWYxNjI5MGZmOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQyZDgyNTAxYTllZDk0ZGViMWNjMDY1MDlkYjIxMTU4YzkyOWFmZmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-09-23 18:26:39.931191'),('372mfp7p0yqihmphnc61i7mnlenjq6ln','NWY2YTZhZmYyOTM5YWFlY2IxNzUzYjhlZjc4ZGFiZTdhOTQ5OGFhNzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3NTAzNzgxNTY0N2E0NzE1NDkwOGY4NjgwMzliZjQxNmFhOTQ1ZDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3NCJ9','2017-10-05 11:04:05.391860'),('3lwctli11ue8c5t4ej3rufferxwxprgt','N2U5YzkwNjc3ZGQ3YzFmN2IxOGJmMGYyMmQxNzg5MDY2NjliMDExNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNhM2IwMjkwYWM4ZmQ2ZDA5MWNiNTA3ZTI1OTFhODZjZTJhYzljNWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNCJ9','2017-10-05 08:45:26.948401'),('3mm1t3uwy8rn8wzdjleznasq6928exv2','NmM4ZTExMTRhOWRhYzVlZTBlNDFmMTlkNGEyYjJlNzE0YzU5ZGQ3OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ4ZjhiMzBkYjhjMDBmNjBjZDM2MzJjY2Y1OWUzYTA0OTkzN2FlYjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3OCJ9','2017-10-05 12:21:39.321367'),('3qkerbh4eeglg62ilnilln23uz2mshnb','MGJlZjFmNjk0ODVhN2RkNzgxMTRjMjdkM2IxY2Q2NmFlMjk1YjQzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3YzUyZDljYzVjYWU3ZTZmOTIxMTlhZjg4MmQ5NGViMzYzZWRlM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMSJ9','2017-10-05 05:05:35.376470'),('4kg5taziovejlsz8m7d1u9n5avbruich','ZWI3YzQ5Nzg5N2QwZDI0OTI0NTY3OTNiZWRlNjgxNjZlNjExMTUzNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImYzYTBkNWRhNDc3ZTExNDY4MzdhNzI1NmVlOTUzOGU0OGI2MWQxMDEiLCJfYXV0aF91c2VyX2lkIjoiMzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2017-10-05 13:31:50.023635'),('4n5yiyisbmjv75s0jelhdib4cxn2uxil','OWY5YzdlYzI4NWEzZjIyNGI3OTBiZTQ5OTU2NTEzZTM4ZWM4Mjc4ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkyZWIxYmQ0YTgyYWJjYmMzZTMzN2NlMTJiOTdkZjhkZTBmNmI5MGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1NCJ9','2017-10-05 08:11:25.686002'),('4sdfsjt06xd6piujrezcug5xxtkknv9z','OWY3OTc0ZGM2M2ZiMzQyMTc2ZDQ1NGMxN2U3OTEwM2E3NThjMjEyMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ5NWUyYTMxMzNiNDJhMWFlYjhjNjVjOGY2YjY4YjhlZTMxZjY1MmMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI5In0=','2017-10-04 07:01:11.008388'),('4xa40cek100o2ogsy67xil3lnlxti885','NTA4NWEzYTY5MjM3YmEyZTIyMDllMTljYWY5ZmQxOTNjMWQ3YTBmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjA1MjVmMTYwNDA5YjZkZTVmMDMxMzQ1N2UwNTYxZGEyYTVjNjczNTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=','2017-10-02 16:04:20.018582'),('5a4jpnsqf4bueszh731x8wxixcaggbvn','MjEzNWFjZWVmMzU4NmUzZmY0MTg0MWVhYmEyODM3YjRiNzE2NThhMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiZTU1Yjg2MzU1YjlmYjM4YjE1ZGQyOGJkOTQ1ZDE4N2ZlN2ZhNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3MSJ9','2017-10-05 10:43:07.539649'),('62m220qygrtcc4m05wt1gurzg0gda61s','ZjhhNDMxZDM2YWEwM2YyNGI5NGVlMWFmODk4MjgzODQxZGQyYzI0Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjliYzNlMGU3NTJkMjgyZDA3OGMwMzYyMWUyYWFmMjFkOTgxZmRkMTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4MyJ9','2017-10-05 13:49:03.381831'),('67sscqh1i4cszvr261ap89on3luw6son','NzM1NmYwODVhZDM2MWIwNzkyYzQyZjNlM2Q5ZTFmNWYxNjI5MGZmOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQyZDgyNTAxYTllZDk0ZGViMWNjMDY1MDlkYjIxMTU4YzkyOWFmZmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-09-25 12:57:40.190880'),('6ahxjw0hj62og118jxojhgaa19mlrfa2','MGNjZDY0NGZkZmMxMGUzNDZjMWRmOWU1MjAxZmQwZjJhZjliY2YyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjBmMWFhY2E0MTRkODI4NTMyYjk5Mjc4NTUyMGI5YzRhOGQyNWRjMDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzOCJ9','2017-10-05 06:47:34.531401'),('6kplo8g9u9xa0eigbn71m9jfbjekl6io','MDQyOWJlZTMwMmZkNWVmZDUxODkyNDdiMDFiMWE2ODc1YTU0MGVkMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImM3Yjc0YTk3NDRiZDY3ZWQyMjRjODU5YTk2MDNkNTI1MmU1MDc1ZjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMyJ9','2017-10-04 17:16:25.954605'),('7190vg4x951y2doghj1drmd9n93xb2o5','NzBkZWEzYjYzZTY0MjBiZjNiZjM3YjZhNzg4YmVjNjU1NzhjM2E3ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjI1YWU3ODRhYTc4YWZhOGZkZGMwOTM0MDRkY2M3YTZjYjAwYmNkYTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSJ9','2017-10-04 12:34:29.830741'),('7df80cmx08grljnfdodn4hs426zh9n68','M2EwMjRlODRlZmI2ZDIyYTg3ODI1MTdlNmFhZmJlOTliZWUwZGNhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjIxZTdkYjUzNGE3OTQwNjU4OTUxMjc5Njg2ZGEyMzJiNWNiNjgwOWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0NyJ9','2017-10-05 06:43:34.431407'),('a51s6r37b7kzf9lqc9hd9cvlcaou6j9v','OWY3OTc0ZGM2M2ZiMzQyMTc2ZDQ1NGMxN2U3OTEwM2E3NThjMjEyMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ5NWUyYTMxMzNiNDJhMWFlYjhjNjVjOGY2YjY4YjhlZTMxZjY1MmMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI5In0=','2017-10-04 10:53:07.432453'),('a6f2iomklm26426w7zigwoixggpm6m9b','NTliMDQ2MGNlMzNlNDA0MWNlOTYzYWViNzU5MjYwODhjMTE0YzVkYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdkY2U4MDI1NDgyYTk4OWYzZWU1ZTgzM2Q4NWZkMjZiYmJhOGYyM2IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0NiJ9','2017-10-05 06:38:37.763997'),('b8j0rfg0xl8zpn4xrbc6qg8lombbq0na','NDRkOTBhZTk5MGQwYTkyZGEzNzU0MmQwMjBmZDZhYmVhNjNhMzIyZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImFmMDkzMmJhYmIwZmRhN2U2NGFlMzZlODJlMWZiOWU2NjRkNTkxMGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNiJ9','2017-10-05 12:26:31.731601'),('bgyk9ialrdetbhomeli9ztxh8gl4exb7','YzA1ZGExNTZkY2Q5NjE5Y2Y3ODk2NzkyZWM5ZDk5NGZkOTVkNzMyZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjcyMzJhZTQ4NjYwNTE5NWYzZTM0MzY0ZGYwYzRmODk5M2FlMzNlOTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-10-03 13:22:42.306402'),('czblqam7qdd637ymhc9tetgvu8sjnhoy','MWNjNzM1MzBhYWVhMTc3OGJiMWY5MzQ0ODFjMjc1N2RlOWI1NzU0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE2N2ZkNTkzZTM5MmI3OGEyOTBhM2JiZmQ0ZmQzYjViOWYxMGY0ZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-10-02 05:51:43.979823'),('dsogs7hqiqpuigxli7bd7trg6nw442lh','ZDlkYjQyOTgxOWQ4N2JhMGNlODE3Y2M1NWNmZDFmOTUxYjMwZjg2Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5M2QyYWY4MzM0ZWRlNzgyMDYyOTczYmQwM2QyOGM2ODcyOTdiZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1OCJ9','2017-10-05 08:55:07.882571'),('ezsq2fylrksx2i3pbssrnmu3b6olohfu','YzE0YTY5NGQ2ZTY2YzRkNmVjYzhjNTJjNzdlY2I3NzYxZmY3OGI0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzOTkwYjZkOWE4ZDYyNmZmZGQwNWY5YzIyMTRlY2I4YTgyYjJhNzEiLCJfYXV0aF91c2VyX2lkIjoiNzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2017-10-05 11:07:05.010276'),('f6ztrrgnb7pys9406twqvwld2phtpfyc','MWNjNzM1MzBhYWVhMTc3OGJiMWY5MzQ0ODFjMjc1N2RlOWI1NzU0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE2N2ZkNTkzZTM5MmI3OGEyOTBhM2JiZmQ0ZmQzYjViOWYxMGY0ZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-09-23 18:27:15.175840'),('fodtsdml8bo373nxslbw5e8q0vqiflvn','ZGE4MDVjNDc5MDRlMjgwYTVkZjhkYjAzODJmNDcxODRhNzkxNDBmMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImM2ZGM5MDU3Nzc2NDYzNmFjNzZiYjkzZTdmODNkOWNlMjNhZWI5MDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1OSJ9','2017-10-05 09:06:14.749618'),('g4bead6uhs286hhchhb3ppa8aeg1dhh1','MjI2MzI3ZGI5NzE3OGE5M2RkZjYyYWQ5NDZkZWJlYTUxNDBhMWQ1Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAxMzNkNzI1NTAxMTQ3M2E1YzM0YzgwNGU0OTYxMTViNTIzNjUxMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4MCJ9','2017-10-05 12:56:43.794987'),('glerixt6ezparpurscyvtjdo474cf622','M2EwNjM1N2Q1MWQ0ZGQwNWRiNzNhODQ4OTgwMWQxYzYxMmIxMzc1Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjJkYTBiNTBmYjEzYzI4N2FkYTkyODBiZjFmYmIwMTRjYTk4YzhmOGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMCJ9','2017-10-03 04:29:09.962002'),('goy3oks6jvqxptjy5tfxt46vizbkxayi','YzA1ZGExNTZkY2Q5NjE5Y2Y3ODk2NzkyZWM5ZDk5NGZkOTVkNzMyZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjcyMzJhZTQ4NjYwNTE5NWYzZTM0MzY0ZGYwYzRmODk5M2FlMzNlOTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-10-04 11:27:11.439714'),('gulyvt86g0w6wuc0i6yn71lzrch9w6xp','MWNjNzM1MzBhYWVhMTc3OGJiMWY5MzQ0ODFjMjc1N2RlOWI1NzU0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE2N2ZkNTkzZTM5MmI3OGEyOTBhM2JiZmQ0ZmQzYjViOWYxMGY0ZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-10-03 04:33:57.039409'),('h3pf1d6nfobotq528qejdox6h4nluj86','NjFhODk4YjRmODI3ZTYyYzhiZmE3MWQ0Mzk2MzAxYTJiN2E2ODEzYTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE0YTY4MmFmOGIxZGE3MjIxYTY3M2QyZGVhMzZmZjFmNDIyYjc0MTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1NiJ9','2017-10-05 08:40:56.576376'),('h63uosajfixfaorf8joen980ge8rnokw','MjgyMjMxYmEyNmJlZDRkZjRjYzRjZDg5NWU1OTg3YWE1MDE3ZDJlMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjcyMjJhZTBhODE4MWYwYjc3ZTY0Y2U2NDgxZmYwYjAxOGY3MjNiOGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3MCJ9','2017-10-05 10:53:58.417669'),('hawakz2qc4jn6w1b7ll2w1xn8m1zff75','ZGMwM2NjNGQ4YThlZDIyMjc1MmM3YzAyMDBlZTdjNWVlMzY5YzE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjJkNTgyYzAxOGVlMGI1ZjY5YzE3NmFhYzhlMzE1NjU1NjZjMDRhYTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyOCJ9','2017-10-05 04:19:26.947816'),('hbr374596x8zwoeif55p40rm581qwoui','MWNjNzM1MzBhYWVhMTc3OGJiMWY5MzQ0ODFjMjc1N2RlOWI1NzU0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE2N2ZkNTkzZTM5MmI3OGEyOTBhM2JiZmQ0ZmQzYjViOWYxMGY0ZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-09-30 17:56:29.093033'),('hcq08o99dz9vho1jhr70iknu2nn4lrpk','MjQ4NzU5Y2QzZTlhODk5NjRlOTlmZTIxZDEzZWEyYTNkYzI0ODVjYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjMwNDUwNmUyYjViZWJhODRkNmJjM2EyZWE3ZGUxMzMyNjI4NjgzMDciLCJfYXV0aF91c2VyX2lkIjoiNDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2017-10-05 06:13:17.288131'),('hz0eac0ny9bhugfor8giw57lbxh74ga9','NDRkOTBhZTk5MGQwYTkyZGEzNzU0MmQwMjBmZDZhYmVhNjNhMzIyZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImFmMDkzMmJhYmIwZmRhN2U2NGFlMzZlODJlMWZiOWU2NjRkNTkxMGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNiJ9','2017-10-05 01:46:49.338902'),('ibxncgcfuwb61ddwvpghdbrl6hge40j4','MWM2MjNhMjlmNzAzMTc0ZWVkMzEwMzA0MGJjN2UyZGVhNTA1YTQzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI1MWM1MDExMGJlYTc5YWVmMWFkM2E3YjE5MDY1MTZmMzQ3YTY3NDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0MCJ9','2017-10-05 08:23:00.342649'),('ic09rc9h3lufeco1fwfc49gmelckyf0q','MWNjNzM1MzBhYWVhMTc3OGJiMWY5MzQ0ODFjMjc1N2RlOWI1NzU0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE2N2ZkNTkzZTM5MmI3OGEyOTBhM2JiZmQ0ZmQzYjViOWYxMGY0ZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-10-04 12:34:26.532124'),('jf9y3dewlhjj7a5n13px6mp3r7jnuoy9','MWNjNzM1MzBhYWVhMTc3OGJiMWY5MzQ0ODFjMjc1N2RlOWI1NzU0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE2N2ZkNTkzZTM5MmI3OGEyOTBhM2JiZmQ0ZmQzYjViOWYxMGY0ZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-10-04 13:04:03.013542'),('kx8wdg9nrbewg6fgv1feakbm1p3f4uf1','MzhlNGFiNDU4MTBjOTQwZGM0MjBhNjYzNDM2ZGNjNzRmMzE3YzI5Mzp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzOTkwYjZkOWE4ZDYyNmZmZGQwNWY5YzIyMTRlY2I4YTgyYjJhNzEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3MiJ9','2017-10-05 12:23:54.403530'),('l6tolfmf74k0mlcczo1lpcmc59vpqini','NWJmNDllMWQyODAwNmNhNGMzNGMwYjNjY2UzOWQxMjMwYzFlZDhkMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYyOWM1YjIxZmZiOGE1NTc2YzFjOTgxYTRlNjI2NGZiODI0ZjhlODciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxOCJ9','2017-10-04 13:55:08.176079'),('lp40f0exzk6urwbvwc2pzlvdgnax1f8p','YmQxMGQxMWFiMDkwOWE4MjZiNWU3NjhkY2E1NGNjODliZDgyZGYyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjIzODY4NmRhODA5OWQ1Nzk3ZDIwY2RkZjQ4NDc3MjliOTE2NTcwYTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMiJ9','2017-10-05 12:23:09.543441'),('lv9jkj67ug48pumlvyyjcdo6r9h3e26e','NDhlYjc4ODc4ZTkyODk4YTVhZjQxMmNmYTZjYWQ3ODkzMjMwNzFjYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjZlOGY3NGRjMDI0MjU5YTE5YjUyYmI1NjIxOWZiMjJmMzEyMGUyZmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2MSJ9','2017-10-05 10:11:46.530908'),('o3favd6p9ji5mbbmija56p0ajo1fr7kw','ZWFmMjQ1MmJmNzNlNGMwYWJjMDZlNjMzNmIzOTU0MmYxZDQ4NTg4Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjM1ZjZlNGQ4NmY3MjQ0ZWE0MGMwYWU0NDMxNDg5N2ZmODFmMmY5YjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NCJ9','2017-10-05 09:58:01.375836'),('p3vncd1a0x65gq003skgcxgbggfknj1b','YTkyZjAwNzJmMmIzYmRmMDYxMjE5NjgyZjU3NDFiMTFkOWY3YjYzYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ0NzZhZjEyZjUxYmZiNzM4YzRkYmU0MjcwODFjMGRjMDMxYmU3OGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NSJ9','2017-10-05 10:06:50.085514'),('q936zsnbcdiayjr3j0pbguwxiv0y2yt7','NGIzOTM3NThhMGQyY2M4ZWQ3NWQzODg0NmVkZjcwMTkxOTk3OTcyYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjJjODE2Y2Q5MGQ2Mjc0NTlkNGM2OGFhNWZiNmE5NTM2MWU3Zjk1ZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0MiJ9','2017-10-05 08:12:31.899498'),('rlbrrlq90lxd02cnwc7xnjvgu8jn4c54','MmM4ZGNlYWUwZjI0OThjMzE1NmNiZjc3MGMwMDFjZDBmZWU3NDdmYzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc1YmFkYTNjZGI3MWVkOTkwZWYyNmY2N2IzZmUxNGYyZjJkNzIwM2IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0MSJ9','2017-10-05 05:32:35.004028'),('ror6fzb45nq31485cjnpagt6rs8cv2h2','N2U5YzkwNjc3ZGQ3YzFmN2IxOGJmMGYyMmQxNzg5MDY2NjliMDExNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNhM2IwMjkwYWM4ZmQ2ZDA5MWNiNTA3ZTI1OTFhODZjZTJhYzljNWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNCJ9','2017-10-04 18:06:24.306244'),('rotdvehkf2jkl1busei3pxzhirjmdw2l','MWNjNzM1MzBhYWVhMTc3OGJiMWY5MzQ0ODFjMjc1N2RlOWI1NzU0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE2N2ZkNTkzZTM5MmI3OGEyOTBhM2JiZmQ0ZmQzYjViOWYxMGY0ZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-10-04 11:26:46.925240'),('rp0ivwd7qblfpi3y6k7hct7ohvmtcmey','MTYxZTdhNmUyNjg1ZWQyZWVlNWFiNjIyMmNiYjg4ZmFlNzc4NzE4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ3YWY5ZjUyOTc4OGRmZjViOTJhYzdhZDQzYjRjZWFlZjVmNjI5N2IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMCJ9','2017-10-05 04:46:42.370283'),('rs9y8yz7pbozubec4ptl6vt5mf3udsjl','MWNjNzM1MzBhYWVhMTc3OGJiMWY5MzQ0ODFjMjc1N2RlOWI1NzU0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE2N2ZkNTkzZTM5MmI3OGEyOTBhM2JiZmQ0ZmQzYjViOWYxMGY0ZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-10-04 11:57:36.113432'),('s0jq7zwcho6e3gklvch8515lteelpvuo','OWQ3NGE0ZGFkMGNkZmI0MGFmNzNhMzJmZmExYjEwNTU2MTEwZWJhNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImY2YjNkZDE1MjlmYTVjNzE4NWM4ZjZjMGQwMTAzYTgwMGE1ZDRhZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyOSJ9','2017-10-05 04:22:45.098796'),('sww1m6navym1twmm1hcxxrdagxhg1e49','NzgxN2QyZGFkOWU0NWFlYzg1YzVlNTQ1ZWU2NDk2OWY0YTZlNmYzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjYyOTNmZmM2MmFlODhhYTU2ZjEzYzM4NThhNTgzMGEwNWRlYmIxOGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NyJ9','2017-10-05 10:23:51.190212'),('sxi381adx2iq1z5ye7vryolavt66kc9s','Yjg1MTJkNGMzMGVkZDQ3NjE2YjBkYzQ1ODM2YmViZjVhMjg0MjI0Yjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQwOTU0YzQ1ZWVlMTNkZDNiOWRkOTEwNDRmNDc1ZDBmODFmYWFiMDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMiJ9','2017-10-04 15:52:16.279364'),('tfh7ojcuhr01wr9c9jfpiehwpm2wdl3q','MTA2MWYzZDZhYTYzMzU2OTFhMmY3YTNlMTE5NmUxM2U3MmI2ZjVkOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZWU5NjVlMmUyYWUwMzkyMTdjYjEzNGI0ODZhZTBmMTRkOTQxNGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxOSJ9','2017-10-04 14:16:42.384293'),('tiv5ic2a1q211lzqh0lvhclvlmbscysq','ZjExZjFmZjY1OTAyOTgxNzQ0MmNiYjI2MWJjNzBhNmNhMzM1ZjgwZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFmOWFiZmM3OWNjNjA3NjI1MGU4ZjAyYzBlMmUzYTgyMjg4NzEwYTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=','2017-10-01 17:39:06.616187'),('tl68r1p9uxy6ieqdi3auywcdn68luyaq','NzBkNmQ1MDhlZWE2NjkyZjRmMGM2NmNkZmJmNjRhM2MzZWRiNjBkMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjIzODY4NmRhODA5OWQ1Nzk3ZDIwY2RkZjQ4NDc3MjliOTE2NTcwYTEiLCJfYXV0aF91c2VyX2lkIjoiMzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2017-10-05 06:19:56.676068'),('u71d38vtidctnlzbg01554dotugkn9v9','NzIzY2M2YTkzMWQ1ODhkNWRhYTlkYzA4YTk2NzM1YjQ1Y2UyZmNjZDp7fQ==','2017-09-23 18:25:44.192624'),('u9c2bf9pqkv8w3d2p12ad3uy7me1b2ke','MGUzMDZkZTZiMWViMzI1NjIyNjA4ZWJlOWUzMTIzZTY5MGRmODUwNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjAzOGVmNGRiNTMwZDRiMDI2N2Q3ZmVjY2RlNDEyZjAwMzQ5ZjdmMWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0OCJ9','2017-10-05 07:23:29.026285'),('uee8nk9cd9pfxcio09ip6kqx59ivk3ep','N2U5YzkwNjc3ZGQ3YzFmN2IxOGJmMGYyMmQxNzg5MDY2NjliMDExNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNhM2IwMjkwYWM4ZmQ2ZDA5MWNiNTA3ZTI1OTFhODZjZTJhYzljNWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNCJ9','2017-10-05 08:52:26.589123'),('ukduof2uh0avrn4c5b7hfzx2gf4jpyjy','MDdlYzgxZDRlMjczN2UyYmE1YmZlYWEzZjQ3NjY5YWMxMGFiOTFiYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI1OWVmNGY4ODM0NmEwMzgxOGEwZTFlMzU4N2QxYzU2NThhYzljZmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0NCJ9','2017-10-05 06:27:40.653473'),('unbusmhqjeq0hi66s72kry584zjryhay','OWNjOTk5MmUyZGVlNzYyODg2OTNkOTkzNTNlMmI5YjNlZjlmZTkzNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwMzhhYWJlZjY0MWRkMmQyOTc0MjNiODBhYzlkYWY4ZmEwNTY3Y2IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3NyJ9','2017-10-05 12:09:06.835266'),('v99ebe6qossa7ybefd9bizejk3juvh5m','ZjExZjFmZjY1OTAyOTgxNzQ0MmNiYjI2MWJjNzBhNmNhMzM1ZjgwZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFmOWFiZmM3OWNjNjA3NjI1MGU4ZjAyYzBlMmUzYTgyMjg4NzEwYTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=','2017-10-02 04:59:25.999283'),('vd0zvpg555en9vijyn09j0s5zvugzb3f','NDVkNzJhYmZjYmZhYzVmNmYyZDc5MjFmYjcxNTk1NDA4ZjUyMDVlYTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNlYTFhZWNjMTE5MTFiZGE0OTkxYzQ2ZjE2ZTlmOWNhMDVjNjRiMTMiLCJfYXV0aF91c2VyX2lkIjoiNTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2017-10-05 13:01:55.137093'),('w069jrj3kua55figibqvtb37tl03oo5z','YzY3Nzc5ZjdkNGVkNWVkNjI3NjAzYzkwNGUxYzQ1M2UxYTg1ZTg1Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjNhNzEwMzcxNDhlYjBhZjBkMjRjNTMzZTBhNzhiMWRkMTM4YTJlZTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNSJ9','2017-10-04 18:31:59.274368'),('w1shc3jfqr34zzbqvo8rfm6ppml898tj','NTAyZjJjMTM5ZjQ3OGJiMWY5ZDJmZWIwODJlZjE4MTRmYzU0Y2ViMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjM2IyYjMzN2FiYjY2ZWM0MTI5NmI3ZmU1NWJlMGJiOGEwOGNlYjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1NSJ9','2017-10-05 08:35:13.506477'),('xt9lvb0k5ob03pt03zlku5idzywg5k64','OGIxMzk1ZjE4MTNjYWU5ZTVlNzBlMjhlMGNlN2RmMjgxNmRiODUwMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImUwNjNjNGI0NzQ3YWEyN2MxMGQ2YjY4N2Q3ZGU5NjM1NGM2NmUwNDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4MSJ9','2017-10-05 13:24:40.563834'),('yg48ozhbw29703soy2c0ood4l4wnzxss','NzhjNzlkNzQ4YTc3ZjczZjk5NTA0YmFiZTExOTNlNTljNjZjNmE5Mzp7Il9hdXRoX3VzZXJfaGFzaCI6ImZmNTMxMWZkYjMwMzZhY2ZlNmY1NDBhMjkxMTEzYTg1ODU5NTRlNmMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2MyJ9','2017-10-05 09:47:49.423165'),('yuuzb7g981tod2pqki33xl4kgqq9wzev','MGNjZDY0NGZkZmMxMGUzNDZjMWRmOWU1MjAxZmQwZjJhZjliY2YyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjBmMWFhY2E0MTRkODI4NTMyYjk5Mjc4NTUyMGI5YzRhOGQyNWRjMDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzOCJ9','2017-10-05 05:36:43.039589'),('zsnrxkruisvyoxqp266zjxbz9vpv9i7i','NGIzOTM3NThhMGQyY2M4ZWQ3NWQzODg0NmVkZjcwMTkxOTk3OTcyYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjJjODE2Y2Q5MGQ2Mjc0NTlkNGM2OGFhNWZiNmE5NTM2MWU3Zjk1ZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0MiJ9','2017-10-05 06:06:51.636813');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_a`
--

DROP TABLE IF EXISTS `recruit_acad_annex_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_sem` int(11) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_a_app_id_id_dfe7df90_fk_recruit_a` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_a_app_id_id_dfe7df90_fk_recruit_a` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_a`
--

LOCK TABLES `recruit_acad_annex_a` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_a` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_a` VALUES (8,0,'[{\"qualification_a\":\"PhD\",\"degree_a\":\"PhD\",\"marks_a\":\"0.00\",\"div_a\":\"\",\"entry_a\":\"2011-01-26\",\"completion_a\":\"10/03/2014\",\"university_a\":\"BIT MESRA\"},{\"qualification_a\":\"Masters\",\"degree_a\":\"M.E\",\"marks_a\":\"8.23\",\"div_a\":\"1\",\"entry_a\":\"2008-07-26\",\"completion_a\":\"14/07/2010\",\"university_a\":\"BIT MESRA\"},{\"qualification_a\":\"Bachelors\",\"degree_a\":\"B.Tech\",\"marks_a\":\"8.45\",\"div_a\":\"1\",\"entry_a\":\"2004-07-26\",\"completion_a\":\"23/06/2008\",\"university_a\":\"SRM UNIVERSITY\"}]',1,'170410002','users/170410002/papers/DEGREES.pdf'),(9,0,'[{\"qualification_a\":\"PHD\",\"degree_a\":\"Mechanical Engineering\",\"marks_a\":\"7.8\",\"div_a\":\"\",\"entry_a\":\"2011-12-21\",\"completion_a\":\"24/08/2015\",\"university_a\":\"National Institute of Technology Calicut\"}]',1,'170310007','users/170310007/papers/EEDUCATIONAL_CERTIFICATE_FULL.pdf'),(10,0,'[{\"qualification_a\":\"PhD DEGREE\",\"degree_a\":\"PhD\",\"marks_a\":\"8\",\"div_a\":\"I\",\"entry_a\":\"2012-08-30\",\"completion_a\":\"22/08/2017\",\"university_a\":\"IIT MANDI\"}]',1,'170210004','users/170210004/papers/PhD_C.pdf'),(11,0,'[{\"qualification_a\":\"Ph.D.\",\"degree_a\":\"Ph.D.\",\"marks_a\":\"8.45\",\"div_a\":\"First\",\"entry_a\":\"2012-07-16\",\"completion_a\":\"12-08-2017\",\"university_a\":\"IIT Bombay\"}]',1,'170210005','users/170210005/papers/Degree_PhD.pdf'),(12,0,'',1,'170210006','users/170210006/papers/CERTIFICATES.pdf'),(13,0,'[{\"qualification_a\":\"Ph.D\",\"degree_a\":\"Geotechnical Engineering\",\"marks_a\":\"5.4\",\"div_a\":\"First with Distinction\",\"entry_a\":\"2012-06-23\",\"completion_a\":\"25-06-2016\",\"university_a\":\"Indian Institute of Science\"},{\"qualification_a\":\" M.S\",\"degree_a\":\"Geotechnical Engineering\",\"marks_a\":\"6\",\"div_a\":\"First with Distinction\",\"entry_a\":\"2010-01-01\",\"completion_a\":\"22-06-2012\",\"university_a\":\"Indian Institute of Science\"},{\"qualification_a\":\"M.Tech\",\"degree_a\":\"Geotechnical Engineering\",\"marks_a\":\"7.68\",\"div_a\":\"First with Distinction\",\"entry_a\":\"2007-07-01\",\"completion_a\":\"30-06-2009\",\"university_a\":\"National Institute of Technology Karnataka, Surathkal\"},{\"qualification_a\":\"B.E\",\"degree_a\":\"Civil Engineering\",\"marks_a\":\"59.5\",\"div_a\":\"Second\",\"entry_a\":\"2002-06-01\",\"completion_a\":\"30-06-2006\",\"university_a\":\"University Visvesvaraya College of Engineering\"}]',1,'170110001','users/170110001/papers/Transcript.pdf');
/*!40000 ALTER TABLE `recruit_acad_annex_a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_b`
--

DROP TABLE IF EXISTS `recruit_acad_annex_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_b` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_sem` int(11) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_b_app_id_id_7f57baab_fk_recruit_a` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_b_app_id_id_7f57baab_fk_recruit_a` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_b`
--

LOCK TABLES `recruit_acad_annex_b` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruit_acad_annex_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_c`
--

DROP TABLE IF EXISTS `recruit_acad_annex_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_c` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_sem` int(11) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_c_app_id_id_4f7cb555_fk_recruit_a` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_c_app_id_id_4f7cb555_fk_recruit_a` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_c`
--

LOCK TABLES `recruit_acad_annex_c` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruit_acad_annex_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_d`
--

DROP TABLE IF EXISTS `recruit_acad_annex_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_d` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` tinyint(1) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `basic_pay_d` int(11) NOT NULL,
  `basic_pay_r` int(11) NOT NULL,
  `payband_d` int(11) NOT NULL,
  `payband_end_d` int(11) NOT NULL,
  `payband_end_r` int(11) NOT NULL,
  `payband_r` int(11) NOT NULL,
  `total_d` int(11) NOT NULL,
  `total_r` int(11) NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_d_app_id_id_408f1e48_fk_recruit_a` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_d_app_id_id_408f1e48_fk_recruit_a` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_d`
--

LOCK TABLES `recruit_acad_annex_d` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruit_acad_annex_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_e12`
--

DROP TABLE IF EXISTS `recruit_acad_annex_e12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_e12` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_sem` int(11) NOT NULL,
  `annexure_data_e1` longtext NOT NULL,
  `annexure_data_e2` longtext NOT NULL,
  `store_e1` tinyint(1) NOT NULL,
  `store_e2` tinyint(1) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `credit_val` double NOT NULL,
  `total_e1` double NOT NULL,
  `total_e2` double NOT NULL,
  `annexure_file_e1` varchar(100) DEFAULT NULL,
  `annexure_file_e2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_e_app_id_id_f18aed5c_fk_recruit_a` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_e_app_id_id_f18aed5c_fk_recruit_a` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_e12`
--

LOCK TABLES `recruit_acad_annex_e12` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_e12` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_e12` VALUES (5,0,'[{\"title\":\"Numerical modeling, simulations and experimental investigations to improve the surface tribological properties of Ti-6Al-4V through developing wire electrical discharge alloying\",\"progress\":\"Ongoing\",\"funding_agency\":\"SERB, DST\",\"from\":\"2017-03-10\",\"to\":\"Ongoing\",\"amount\":\"2294600\",\"pi_co\":\"PI\",\"total_co_pi\":\"1\",\"credit\":\"5\"}]','[{\"patent\":\"SOAP DISPENSER WITH A BODY SCRUB \",\"status\":\"Published in the patent journal\",\"details\":\"201641024529 \",\"principal_role\":\"Inventor\",\"total_coinv\":\"14\",\"credit\":\"0\"},{\"patent\":\"A universal hexagonal key-cum adjustable spanner wrench\",\"status\":\"filled\",\"details\":\"201731010487\",\"principal_role\":\"Inventor\",\"total_coinv\":\"1\",\"credit\":\"0\"}]',1,1,'170310007',0,5,0,'users/170310007/papers/Sponserd_project_order.pdf','users/170310007/papers/patent.pdf');
/*!40000 ALTER TABLE `recruit_acad_annex_e12` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_f`
--

DROP TABLE IF EXISTS `recruit_acad_annex_f`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_f` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_sem` int(11) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `credit_score` double NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `credit_val` double NOT NULL,
  `total` double NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_f_app_id_id_41c65045_fk_recruit_a` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_f_app_id_id_41c65045_fk_recruit_a` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_f`
--

LOCK TABLES `recruit_acad_annex_f` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_f` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruit_acad_annex_f` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_g`
--

DROP TABLE IF EXISTS `recruit_acad_annex_g`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_g` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_sem` int(11) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `credit_val` double NOT NULL,
  `total` double NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_g_app_id_id_bdc4317c_fk_recruit_a` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_g_app_id_id_bdc4317c_fk_recruit_a` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_g`
--

LOCK TABLES `recruit_acad_annex_g` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_g` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruit_acad_annex_g` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_h`
--

DROP TABLE IF EXISTS `recruit_acad_annex_h`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_h` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_sem` int(11) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `last_prom` varchar(100) NOT NULL,
  `credit_val` double NOT NULL,
  `total` double NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_h_app_id_id_d36d73bf_fk_recruit_a` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_h_app_id_id_d36d73bf_fk_recruit_a` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_h`
--

LOCK TABLES `recruit_acad_annex_h` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_h` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_h` VALUES (5,0,'[{\"title\":\"Cancer progression related with tumor-associated macrophages\",\"journal\":\"Cancer and Oncology Research 4(4):53-63,2016\",\"paid\":\"N\",\"indexed\":\"N\",\"roles\":\"OTHER AUTHORS\",\"no_authors\":\"3\",\"credit\":\"1\"}]',1,'170810001','2017-06-26',0,1,'users/170810001/papers/Cancer_Progression_Related_with.pdf'),(6,0,'[{\"title\":\"Spark Radius Modeling of Resistance-Capacitance Pulse Discharge in Micro Electrical Discharge Machining of Ti-6Al-4V: An Experimental Study\",\"journal\":\"International Journal of Advanced Manufacturing Technology, 2016, Vol. 85(9), pp. 1983-1993\",\"paid\":\"N\",\"indexed\":\"Y\",\"roles\":\"First Author\",\"no_authors\":\"1\",\"credit\":\"2\"},{\"title\":\"3D Numerical simulation of micro electric discharge machining of Ti-6Al-4V\",\"journal\":\"International Journal of Advanced Manufacturing Technology, 2015, Vol. 79, pp. 147-160\",\"paid\":\"N\",\"indexed\":\"Y\",\"roles\":\"First Author\",\"no_authors\":\"4\",\"credit\":\"2\"},{\"title\":\"Multi-response optimization of micro wire electrical discharge machining process\",\"journal\":\"International Journal of Advanced Manufacturing Technology, Vol. 76, 2015, pp. 91-104\",\"paid\":\"N\",\"indexed\":\"Y\",\"roles\":\"First Author\",\"no_authors\":\"2\",\"credit\":\"2\"},{\"title\":\"Experimental Investigation into the Effects of Micro Electric-Discharge Milling Process Parameters on Ti-6Al-4V\",\"journal\":\"Materials and Manufacturing Process, Vol. 0, 2015, pp. 1-8\",\"paid\":\"N\",\"indexed\":\"Y\",\"roles\":\"First Author\",\"no_authors\":\"1\",\"credit\":\"2\"},{\"title\":\"Effect of Powder Mixed Dielectric on Material Removal and Surface Modification in Micro Electrical Discharge Machining of Ti-6Al-4V\",\"journal\":\"Materials and Manufacturing Process, 2016, Vol. 0, pp. 1-8\",\"paid\":\"N\",\"indexed\":\"Y\",\"roles\":\"First Author\",\"no_authors\":\"1\",\"credit\":\"2\"},{\"title\":\"Modeling of material removal mechanism in Micro Electrical Discharge Milling of Ti-6Al-4V\",\"journal\":\"Applied Mechanics and Materials Vols. 592-594, 2014, pp. 516-520\",\"paid\":\"N\",\"indexed\":\"Y\",\"roles\":\"First Author\",\"no_authors\":\"1\",\"credit\":\"2\"},{\"title\":\"Investigations into the effect of process parameters on surface roughness and burr formation during micro end milling of TI-6AL-4V\",\"journal\":\"International Journal of Advanced Manufacturing Technology, DOI 10.1007/s00170-016-9210-3\",\"paid\":\"N\",\"indexed\":\"Y\",\"roles\":\"Other Authors\",\"no_authors\":\"2\",\"credit\":\"1\"},{\"title\":\"Surface Roughness Optimization of Wire Electrical Discharge Machining on AISI 202 Using ABC Algorithm\",\"journal\":\"Applied Mechanics and Materials, Vols. 766-767, 2015, pp. 902-907\",\"paid\":\"N\",\"indexed\":\"Y\",\"roles\":\"Other Authors\",\"no_authors\":\"3\",\"credit\":\"0.33\"}]',1,'170310007','0001-01-01',0,13.33,'users/170310007/papers/journal_pulications.pdf'),(7,0,'[{\"title\":\"Implementation of Multimodel based PID and Intelligent controller for simulated and real time Temperature control of Injection Molding machine\",\"journal\":\"Chemical Engineering Communications,Volume 203, Issue 4,452-462,April 2016\",\"paid\":\"N\",\"indexed\":\"Y\",\"roles\":\"S.Kanagalakshmi, D.Manamalli, M.Mohamed Rafiq\",\"no_authors\":\"3\",\"credit\":\"2\"}]',1,'170210008','2017-09-20',0,2,'users/170210008/papers/JOURNALNEW.pdf');
/*!40000 ALTER TABLE `recruit_acad_annex_h` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_i`
--

DROP TABLE IF EXISTS `recruit_acad_annex_i`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_i` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_sem` int(11) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `credit_val` double NOT NULL,
  `total` double NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_i_app_id_id_d453d1ea_fk_recruit_a` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_i_app_id_id_d453d1ea_fk_recruit_a` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_i`
--

LOCK TABLES `recruit_acad_annex_i` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_i` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_i` VALUES (4,0,'[{\"title\":\"Association of Endothelial nitric oxide synthase gene Glu298Asp polymorphism in Type2 diabetic foot ulcer subjects among South Indian population\",\"conference\":\"National seminar on Recent Trends in Medical Biotechnology (21st July 2012) in Dr.M.G.R Educational and Research Institute University, Chennai, India.\",\"indexed\":\"N\",\"roles\":\"FIRST AUTHOR\",\"no_authors\":\"6\",\"credit\":\"0.6\"},{\"title\":\"Regulation of Osteoclast Differentiation by Periodontal Ligament Cells in Type2 Diabetic Subjects with Periodontal Disease\",\"conference\":\"BIOTRENDZ-2012, National Conference On “Evolutionary Trends in Biochemistry and Molecular Biology” & “1st Annual Seminar on Alzheimer’s Disease - ALZINFO-2012” (20-21st Sep 2012) in Bharathidasan University, Tiruchirappalli, India\",\"indexed\":\"N\",\"roles\":\"FIRST AUTHOR\",\"no_authors\":\"2\",\"credit\":\"0.60\"},{\"title\":\"Association of Interleukin (IL)-12p40 gene Taq1 Polymorphism with type2 diabetes and its complications\",\"conference\":\"23 rd All India Congress Of Zoology National Conference on Conservation and Management of Faunal Resources for Sustainability” (3rd-5th Oct 2012) in Guru Nanak College, Chennai, India\",\"indexed\":\"N\",\"roles\":\"FIRST AUTHOR\",\"no_authors\":\"3\",\"credit\":\"0.60\"},{\"title\":\"Periodontal Ligament Cells Support Osteoclastogenesis in Type 2 Diabetic Subjects with Periodontitis\",\"conference\":\"Research Society for the Study of Diabetes in India  (RSSDI-2012), Chennai, India\",\"indexed\":\"N\",\"roles\":\"FIRST AUTHOR\",\"no_authors\":\"3\",\"credit\":\"0.6\"},{\"title\":\"Identification and molecular characterization of osteoclasts in chronic obstructive pulmonary disease \",\"conference\":\"NATIONAL LEVEL CONFERENCE ON CONTEMPORARY TRENDS IN BIOENERGY AND GREEN TECHNOLOGY: CHALLENGES AND OPPORTUNITIES [ORA-2016] (25-26TH FEBRUARY 2016), KAMARAJ COLLEGE OF ENGINEERING AND TECHNOLOGY, VIRUDHUNAGAR, TAMILNADU\",\"indexed\":\"N\",\"roles\":\"OTHER AUTHOR\",\"no_authors\":\"4\",\"credit\":\"0.2\"}]',1,'170810001',0,2.6,'users/170810001/papers/document_2_f0wW_24022016_3.pdf'),(5,0,'[{\"title\":\"Real time Implementation of Multimodel ANFIS controller in pH neutralization process\",\"conference\":\"Proceedings of 69th Annual session of IIChE CHEMCON-2016,Dec 27-30, 2016\",\"indexed\":\"Y\",\"roles\":\"S.Kanagalakshmi, D.Manamalli,S.MAGESHWARI\",\"no_authors\":\"3\",\"credit\":\"0.6\"},{\"title\":\"Multimodel based control of pH neutralization process”\",\"conference\":\"Proceedings of 66th Canadian Chemical Engineering Conference,Oct 16-19, 2016\",\"indexed\":\"Y\",\"roles\":\"S.Kanagalakshmi, D.Manamalli,S.MAGESHWARI\",\"no_authors\":\"3\",\"credit\":\"0.6\"},{\"title\":\"Real time Implementation of Multimodel Based PID and Fuzzy controller for Injection molding machine\",\"conference\":\"Proceedings of 10th IFAC International symposium DYCOPS-2013 ,Dec 18-20, 2013\",\"indexed\":\"Y\",\"roles\":\"S.Kanagalakshmi, D.Manamalli, M.Mohamed Rafiq\",\"no_authors\":\"3\",\"credit\":\"0.6\"},{\"title\":\"Design of Multimodel based PID controller for Injection Molding machine\",\"conference\":\"TIMA-2013,Dec 22-24 , 2013\",\"indexed\":\"Y\",\"roles\":\"S.Kanagalakshmi, D.Manamalli, M.Mohamed Rafiq\",\"no_authors\":\"3\",\"credit\":\"0.6\"},{\"title\":\"Closed Loop Operation Of Dc-Ac Dual Buck Full Bridge Inverter For Grid Connected Operation Of Renewable Energy Sources\",\"conference\":\"3RD International Conference On Recent Development In Engineering Science , Humanities and Management.26th March 2017.\",\"indexed\":\"Y\",\"roles\":\"S.Mageshwari, M.Nipuan, S.KanagaLakshmi\",\"no_authors\":\"3\",\"credit\":\"0.2\"}]',1,'170210008',0,2.6,'users/170210008/papers/CONFERENCE_NEW.pdf'),(6,0,'[{\"title\":\"Modelling of micro EDM parameters on machining of aerospace alloy\",\"conference\":\"All India Manufacturing Technology, Design and Research Conference, Vol. 2, 2012, pp.1051-1055\",\"indexed\":\"N\",\"roles\":\"First Author\",\"no_authors\":\"3\",\"credit\":\"0.6\"},{\"title\":\"MRR optimization of Inconel 718 in low frequency work piece vibration assisted micro-EDM using RSM\",\"conference\":\"All India Manufacturing Technology, Design and Research Conference,  Vol. 2, 2012, pp.1085-1089\",\"indexed\":\"N\",\"roles\":\"First Author\",\"no_authors\":\"3\",\"credit\":\"0.6\"},{\"title\":\"Numerical simulation of micro electric discharge machining on Ti-6Al-4V\",\"conference\":\"International Conference on Computer Aided Engineering, 2013, pp. 1-6\",\"indexed\":\"N\",\"roles\":\"First Author\",\"no_authors\":\"2\",\"credit\":\"0.6\"},{\"title\":\"Effect of Material properties on Micro EDM Milling Machinability\",\"conference\":\"8th International Conference on Precision, Meso, Micro and Nano Engineering (COPEN 8), 2013,Vol. 1, pp. 246-250.\",\"indexed\":\"N\",\"roles\":\"First Author\",\"no_authors\":\"1\",\"credit\":\"0.6\"},{\"title\":\"Modelling and Multi response optimization of Micro EDM drilling on Inconel 718\",\"conference\":\"of All India Manufacturing Technology, Design and Research Conference (AIMTDR), 2014, pp. 341-1-6\",\"indexed\":\"N\",\"roles\":\"First Author\",\"no_authors\":\"1\",\"credit\":\"0.6\"},{\"title\":\"Spark radius modeling of Micro electric discharge machining of Ti-6Al-4V\",\"conference\":\"All India Manufacturing Technology, Design and Research Conference (AIMTDR), 2014, 342-1-4. \",\"indexed\":\"N\",\"roles\":\"First Author\",\"no_authors\":\"1\",\"credit\":\"0.6\"},{\"title\":\"Thermal Stress Modeling of Micro-Electrodischarge Machining on Titanium Alloy\",\"conference\":\"International Conference on Mathematical Modeling and Computer Simulation, IIT Madras,  2014\",\"indexed\":\"N\",\"roles\":\"First Author\",\"no_authors\":\"2\",\"credit\":\"0.6\"},{\"title\":\"A feasibility study to optimize micro electric discharge drilling of Inconel 718 using Ant Colony Optimization\",\"conference\":\"9th International Conference on Precision, Meso, Micro and Nano Engineering (COPEN 9), 2015\",\"indexed\":\"N\",\"roles\":\"First Author\",\"no_authors\":\"2\",\"credit\":\"0.6\"},{\"title\":\"Modeling and Experimental Investigations on Wire-Electric Discharge Machining of Monel K500 Alloy\",\"conference\":\"9th International Conference on Precision, Meso, Micro and Nano Engineering (COPEN 9), 2015\",\"indexed\":\"N\",\"roles\":\"First Author\",\"no_authors\":\"5\",\"credit\":\"0.6\"},{\"title\":\"Material removal characteristics and surface roughness studies in WEDM of AISI 202 stainless steel\",\"conference\":\"International Conference on Advances in Manufacturing & Thermal Engineering (ICOMATE 2016), 2016\",\"indexed\":\"N\",\"roles\":\"First Author\",\"no_authors\":\"1\",\"credit\":\"0.6\"},{\"title\":\"Finite element modeling of discharge zone in micro-EDM process\",\"conference\":\"International Mechanical Engineering Congress and Exposition (ASME), Vol. 3, Part B, 2012, pp. 1047-1052.\",\"indexed\":\"Y\",\"roles\":\"Other Authors\",\"no_authors\":\"3\",\"credit\":\"0.13\"},{\"title\":\"Experimental Investigations on HAZ and Recast Layer in WEDM on Inconel 718\",\"conference\":\"6th International and 27th National All India Manufacturing Technology, Design and Research Conference 2016. \",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"4\",\"credit\":\"0.1\"},{\"title\":\"Experimental investigations into the effect of welding parameters on dissimilar welding (AISI 4340 alloy steel and AISI 316 SS) using TIG by Autogenously and with different filler wires\",\"conference\":\"6th International and 27th National All India Manufacturing Technology, Design and Research Conference 2016.\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"2\",\"credit\":\"0.2\"},{\"title\":\"Modelling and multi response optimization of µ-WEDM\",\"conference\":\"All India Manufacturing Technology, Design and Research Conference, Vol 2, 2012, pp.1062-1068.\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"3\",\"credit\":\"0.13\"},{\"title\":\"Multi-objective optimization of process parameters in vibration assisted micro-EDM\",\"conference\":\"All India Manufacturing Technology, Design and Research Conference, Vol 2, 2012, pp.1025-1030\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"2\",\"credit\":\"0.2\"},{\"title\":\"Multi-objective optimization of micro ED milling of Ti-6Al-4V using Genetic Algorithm (GA)\",\"conference\":\"COPEN8, 2013, Vol. 1, pp. 157-163\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"2\",\"credit\":\"0.2\"},{\"title\":\"Optimization of Micro Electrical Discharge Milling parameters using Particle Swarm Optimization (PSO)\",\"conference\":\"COPEN8, 2013, Vol. 1, pp. 164-169\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"2\",\"credit\":\"0.2\"},{\"title\":\"Multi-objective optimization and analysis of taper cutting by Silicon Carbide (SiC) abrasive powder mixed micro wire EDM\",\"conference\":\"COPEN8,2013, Vol. 1, pp. 170-175.\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"2\",\"credit\":\"0.2\"},{\"title\":\"Thermo Physical Modeling of Micro Electric Discharge Machining using Finite Element Method\",\"conference\":\"COPEN8, 2013, Vol. 2, pp. 993-998\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"3\",\"credit\":\"0.13\"},{\"title\":\"A Finite Volume Approach for Solving Three Dimensional Micro EDM Model\",\"conference\":\"COPEN8, 2013,Vol 2, pp. 999-1004\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"3\",\"credit\":\"0.13\"},{\"title\":\"Experimental Investigation on Micro-Milling\",\"conference\":\"COPEN8,2013, Vol. 1, pp. 144-148.\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"2\",\"credit\":\"0.2\"},{\"title\":\"Experimental Investigation of Powder Mixed Micro Electrical Discharge Milling Of Ti-6Al-4V\",\"conference\":\"COPEN8, 2013, Vol. 1, pp. 228-233\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"3\",\"credit\":\"0.13\"},{\"title\":\"A Hybrid machining technique in µ-EDM: A combination with low frequency vibration and magnetic field assisted setup to machine stainless steel work piece\",\"conference\":\"COPEN8, 2013, Vol. 1, pp. 234-239.\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"2\",\"credit\":\"0.2\"},{\"title\":\"Experimental Investigation and Optimization of Process Parameters in machining Inconel-718 using Micro-WEDM\",\"conference\":\"COPEN8, 2013, Vol. 1, pp. 240-245.\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"3\",\"credit\":\"0.13\"},{\"title\":\"Modelling of µ-ED milling of Ti-6Al-4V using RSM and ANN\",\"conference\":\"COPEN8, 2013, Vol. 2, pp. 946-950.\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"2\",\"credit\":\"0.2\"},{\"title\":\"Finite element modeling of micro cutting by nonlinear analysis\",\"conference\":\"COPEN8, 2013, Vol. 2, pp. 564-568\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"3\",\"credit\":\"0.13\"},{\"title\":\"ANN modeling and multiple objective optimization of process parameters in micro-EDM drilling using tubular electrodes\",\"conference\":\"COPEN8, 2013, Vol. 2, pp. 951-955\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"2\",\"credit\":\"0.2\"},{\"title\":\"Finite Element Analysis of temperature distribution on various workpiece materials using µ-EDM\",\"conference\":\"COPEN8, 2013, Vol. 1, 251-254.\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"2\",\"credit\":\"0.2\"},{\"title\":\"Optimization of cylindrical grinding parameters using RSM\",\"conference\":\"International Conference on Advanced Manufacturing and Automation, 2013.\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"2\",\"credit\":\"0.2\"},{\"title\":\"Surface roughness optimization of cylindrical grinding process parameters using GA\",\"conference\":\"International Conference on Advanced Materials and Manufacturing, 2013.\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"2\",\"credit\":\"0.2\"},{\"title\":\"Optimizing the Machining Parameters of Wire EDM of AISI D3 using Response Surface Methodology\",\"conference\":\"IDEM, 2014, pp. 154-160.\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"2\",\"credit\":\"0.2\"},{\"title\":\"Parametric optimization and statistical study of wire electrical discharge machining in AISI 202 stainless steel\",\"conference\":\"International Mechanical Engineering Congress, 2014, pp. 233- 237.\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"4\",\"credit\":\"0.1\"},{\"title\":\"Surface roughness optimization of wire electric discharge machining using ABC algorithm\",\"conference\":\"of International Conference on Advances in Materials and Manufacturing Engineering\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"3\",\"credit\":\"0.13\"},{\"title\":\"Modeling of Micro Electric Discharge Machining Using FEM\",\"conference\":\"All India Manufacturing Technology, Design and Research Conference (AIMTDR), 2014, pp. 333-1-6.\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"3\",\"credit\":\"0.13\"},{\"title\":\"Experimental and Finite Element Based Investigations on Powder Mixed Micro-Electrical Discharge Machining of Ti-6Al-4V Alloy\",\"conference\":\"All India Manufacturing Technology, Design and Research Conference (AIMTDR), 2014, pp. 334-1-6.\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"3\",\"credit\":\"0.13\"},{\"title\":\"Modelling and simulation of micro EDM with single and multiple discharge\",\"conference\":\"All India Manufacturing Technology, Design and Research Conference (AIMTDR), 2014, pp. 327-1-6\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"4\",\"credit\":\"0.1\"},{\"title\":\"Modeling and Experimental Investigation of Low Frequency Work piece Vibration-Assisted Micro Electric Discharge Milling on Titanium Alloy\",\"conference\":\"COPEN9, 2015.\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"2\",\"credit\":\"0.2\"},{\"title\":\"Modeling of Thermal Residual Stress during Micro-Electrodischarge Machining of Titanium Alloy\",\"conference\":\"COPEN9, 2015.\",\"indexed\":\"N\",\"roles\":\"Other Authors\",\"no_authors\":\"2\",\"credit\":\"0.2\"},{\"title\":\"Design, optimization and analysis of compressive helical springs for railway locomotive suspension\",\"conference\":\"International Conference on Computer Aided Engineering (CAE 2015), 2015, \",\"indexed\":\"N\",\"roles\":\"Main Supervisor\",\"no_authors\":\"1\",\"credit\":\"0.6\"},{\"title\":\"Design and Stress analysis of Bicycle Frame for Different Materials\",\"conference\":\"International Conference on Computer Aided Engineering (CAE 2015), 2015\",\"indexed\":\"N\",\"roles\":\"Main Supervisor\",\"no_authors\":\"1\",\"credit\":\"0.6\"}]',1,'170310007',0,11.8,'users/170310007/papers/combinepdf-min.pdf');
/*!40000 ALTER TABLE `recruit_acad_annex_i` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_j`
--

DROP TABLE IF EXISTS `recruit_acad_annex_j`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_j` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_sem` int(11) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `credit_score` double NOT NULL,
  `last_prom` varchar(100) NOT NULL,
  `credit_val` double NOT NULL,
  `tot_sem` int(11) NOT NULL,
  `total` double NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_j_app_id_id_366e836d_fk` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_j_app_id_id_366e836d_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_j`
--

LOCK TABLES `recruit_acad_annex_j` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_j` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_j` VALUES (6,0,'170210002','[]',0,0,'',0,0,0,''),(7,0,'170210004','[]',0,0,'',0,0,0,''),(8,0,'170210008','[]',0,0,'',0,0,0,''),(9,0,'170310007','[]',0,0,'',0,0,0,'');
/*!40000 ALTER TABLE `recruit_acad_annex_j` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_k`
--

DROP TABLE IF EXISTS `recruit_acad_annex_k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_k` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_sem` int(11) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `credit_score` double NOT NULL,
  `last_prom` varchar(100) NOT NULL,
  `credit_val` double NOT NULL,
  `tot_sem` int(11) NOT NULL,
  `total` double NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_k_app_id_id_2b3a4a64_fk` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_k_app_id_id_2b3a4a64_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_k`
--

LOCK TABLES `recruit_acad_annex_k` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_k` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_k` VALUES (6,6,'170210002','[]',0,0,'',0,0,0,''),(7,0,'170210004','[]',0,0,'',0,0,0,''),(8,0,'170210008','[]',0,0,'',0,0,0,''),(10,3,'170310007','[{\"title\":\"Faculty in charge NCC\",\"from\":\"2016-06-16\",\"to_date\":\"Continuing\",\"sem\":\"3\"},{\"title\":\"Faculty in charge Swachh Bharat\",\"from\":\"2016-03-28\",\"to_date\":\"Continuing\",\"sem\":\"4\"}]',1,7,'2015-12-21',7,0,7,'users/170310007/papers/NCC_and_swachh_LrUcEEs.pdf');
/*!40000 ALTER TABLE `recruit_acad_annex_k` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_l`
--

DROP TABLE IF EXISTS `recruit_acad_annex_l`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_l` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_sem` int(11) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `credit_score` double NOT NULL,
  `last_prom` varchar(100) NOT NULL,
  `credit_val` double NOT NULL,
  `tot_sem` int(11) NOT NULL,
  `total` double NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_l_app_id_id_db9666bb_fk` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_l_app_id_id_db9666bb_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_l`
--

LOCK TABLES `recruit_acad_annex_l` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_l` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_l` VALUES (6,3,'170210002','[]',0,0,'',0,0,0,''),(7,0,'170210004','[]',0,0,'',0,0,0,''),(9,0,'170310007','[]',0,0,'',0,0,0,'');
/*!40000 ALTER TABLE `recruit_acad_annex_l` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_m`
--

DROP TABLE IF EXISTS `recruit_acad_annex_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_m` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_sem` int(11) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `credit_score` double NOT NULL,
  `last_prom` varchar(100) NOT NULL,
  `credit_val` double NOT NULL,
  `total` double NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_m_app_id_id_54a3eb08_fk` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_m_app_id_id_54a3eb08_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_m`
--

LOCK TABLES `recruit_acad_annex_m` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_m` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_m` VALUES (6,6,'170210002','[]',0,0,'',0,0,''),(7,0,'170210004','[]',0,0,'',0,0,''),(8,0,'170210008','[]',0,0,'',0,0,''),(10,2,'170310007','[{\"title\":\"Lab in charge of Manufacturing technology lab 1\",\"from\":\"2017-02-28\",\"to_date\":\"Continuing\",\"assign\":\"yes\",\"sem\":\"2\"},{\"title\":\"Lab in charge of Manufacturing technology lab 2\",\"from\":\"2017-02-28\",\"to_date\":\"Continuing\",\"assign\":\"yes\",\"sem\":\"2\"},{\"title\":\"Lab in charge of Manufacturing technology lab 2\",\"from\":\"2017-02-28\",\"to_date\":\"Continuing\",\"assign\":\"yes\",\"sem\":\"2\"}]',1,3,'2015-12-21',3,6,'users/170310007/papers/Lab_in_charge_zME0xC3.pdf');
/*!40000 ALTER TABLE `recruit_acad_annex_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_n`
--

DROP TABLE IF EXISTS `recruit_acad_annex_n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_number` int(11) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `last_prom` varchar(100) NOT NULL,
  `credit_val` double NOT NULL,
  `total` double NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_n_app_id_id_1aff8830_fk` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_n_app_id_id_1aff8830_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_n`
--

LOCK TABLES `recruit_acad_annex_n` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_n` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_n` VALUES (6,0,'170210002','[]',0,'',0,0,''),(7,0,'170210004','[]',0,'',0,0,''),(8,0,'170210008','[]',0,'',0,0,''),(9,0,'170310007','[]',0,'',0,0,'');
/*!40000 ALTER TABLE `recruit_acad_annex_n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_o`
--

DROP TABLE IF EXISTS `recruit_acad_annex_o`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_o` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prog_2_week_duration` int(11) NOT NULL,
  `prog_1_week_duration` int(11) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `last_prom` varchar(100) NOT NULL,
  `credit_val` double NOT NULL,
  `total` double NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_o_app_id_id_18f0f4e4_fk` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_o_app_id_id_18f0f4e4_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_o`
--

LOCK TABLES `recruit_acad_annex_o` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_o` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_o` VALUES (6,0,0,'170210002','[]',0,'',0,0,''),(7,0,0,'170210004','[]',0,'',0,0,''),(8,0,0,'170210008','[]',0,'',0,0,''),(9,0,0,'170310007','[]',0,'',0,0,'');
/*!40000 ALTER TABLE `recruit_acad_annex_o` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_p`
--

DROP TABLE IF EXISTS `recruit_acad_annex_p`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_p` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_number` int(11) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `last_prom` varchar(100) NOT NULL,
  `credit_val` double NOT NULL,
  `total` double NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_p_app_id_id_fc1e839d_fk` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_p_app_id_id_fc1e839d_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_p`
--

LOCK TABLES `recruit_acad_annex_p` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_p` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_p` VALUES (6,0,'170210002','[]',0,'',0,0,''),(7,0,'170210004','[]',0,'',0,0,''),(8,0,'170210008','[]',0,'',0,0,''),(9,0,'170310007','[]',0,'',0,0,'');
/*!40000 ALTER TABLE `recruit_acad_annex_p` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_q`
--

DROP TABLE IF EXISTS `recruit_acad_annex_q`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_q` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_years` int(11) NOT NULL,
  `total_months` int(11) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `credit_score` double NOT NULL,
  `total_exp` int(11) NOT NULL,
  `total_exp_after_phd` int(11) NOT NULL,
  `total_exp_cur` int(11) NOT NULL,
  `last_prom` varchar(100) NOT NULL,
  `credit_val` double NOT NULL,
  `total_mnth` int(11) NOT NULL,
  `total_yr` int(11) NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_q_app_id_id_92ea806a_fk` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_q_app_id_id_92ea806a_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_q`
--

LOCK TABLES `recruit_acad_annex_q` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_q` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_q` VALUES (6,1,1,'170210002','[]',0,0,0,0,0,'',0,0,0,''),(7,3,3,'170210004','[]',0,0,0,0,0,'',0,0,0,''),(8,6,6,'170210008','[]',0,0,0,0,0,'',0,0,0,''),(9,1,0,'170310007','[{\"post\":\"Associate Professor\",\"agp\":\"9500\",\"place\":\"VIT University Vellore\",\"from\":\"2015-06-01\",\"to_date\":\"15/12/2015\",\"tot_yrs\":\"0\",\"tot_mnth\":\"6\"},{\"post\":\"Assistant Professor\",\"agp\":\"6000\",\"place\":\"National Institute of Technology Mizoram \",\"from\":\"2015-12-21\",\"to_date\":\"Continuing\",\"tot_yrs\":\"1\",\"tot_mnth\":\"10\"}]',1,2,3,2,1,'2015-12-21',2,4,2,'users/170310007/papers/eXP._CERTIFICATE_vit_BASIL_fyjeB3U.pdf');
/*!40000 ALTER TABLE `recruit_acad_annex_q` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_r`
--

DROP TABLE IF EXISTS `recruit_acad_annex_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_r` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_number` int(11) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `last_prom` varchar(100) NOT NULL,
  `credit_val` double NOT NULL,
  `total` double NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_r_app_id_id_d4916ea7_fk` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_r_app_id_id_d4916ea7_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_r`
--

LOCK TABLES `recruit_acad_annex_r` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_r` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_r` VALUES (6,0,'170210002','[]',0,'',0,0,''),(7,2,'170210004','[]',0,'',0,0,''),(8,0,'170210008','[]',0,'',0,0,''),(9,0,'170310007','[]',0,'',0,0,'');
/*!40000 ALTER TABLE `recruit_acad_annex_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_s`
--

DROP TABLE IF EXISTS `recruit_acad_annex_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_s` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id_id` varchar(10) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `total_credit` int(11) NOT NULL,
  `credit_score` double NOT NULL,
  `extra_load` int(11) NOT NULL,
  `last_prom` varchar(100) NOT NULL,
  `credit_val` double NOT NULL,
  `avg_load` double NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_s_app_id_id_330c0fa7_fk` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_s_app_id_id_330c0fa7_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_s`
--

LOCK TABLES `recruit_acad_annex_s` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_s` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_s` VALUES (7,'170210002','[]',0,0,0,0,'',0,0,''),(8,'170210004','[]',0,0,0,0,'',0,0,''),(9,'170210008','[]',0,0,0,0,'',0,0,''),(10,'170310007','[]',0,0,0,0,'',0,0,'');
/*!40000 ALTER TABLE `recruit_acad_annex_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_t`
--

DROP TABLE IF EXISTS `recruit_acad_annex_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_t` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_number` int(11) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `credit_val` double NOT NULL,
  `last_prom` varchar(100) NOT NULL,
  `total` double NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_t_app_id_id_f47abf0d_fk` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_t_app_id_id_f47abf0d_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_t`
--

LOCK TABLES `recruit_acad_annex_t` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_t` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_t` VALUES (6,3,'170210002','[]',0,0,'',0,''),(7,3,'170210004','[]',0,0,'',0,''),(8,0,'170210008','[]',0,0,'',0,''),(9,0,'170310007','[]',0,0,'',0,'');
/*!40000 ALTER TABLE `recruit_acad_annex_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_u`
--

DROP TABLE IF EXISTS `recruit_acad_annex_u`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_u` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_number` int(11) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `last_prom` varchar(100) NOT NULL,
  `credit_val` double NOT NULL,
  `total` double NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_u_app_id_id_656b32c9_fk` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_u_app_id_id_656b32c9_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_u`
--

LOCK TABLES `recruit_acad_annex_u` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_u` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_u` VALUES (6,2,'170210002','[]',0,'',0,0,''),(7,3,'170210004','[]',0,'',0,0,''),(8,5,'170210008','[]',0,'',0,0,''),(9,2,'170310007','[{\"title\":\"Design and development of a universal hexagonal key cum spanner wrench\",\"name\":\"Dhanunder and Binode Gope\",\"passout\":\"2017\",\"credit\":\"0.25\"},{\"title\":\"Analytical and finite element modelling of cutting forces and co efficient of friction along tool chip interface in machining  of aerospace alloys (inconel 718)\",\"name\":\"Abhishek kumar\",\"passout\":\"2017\",\"credit\":\"0.25\"}]',1,'2015-12-21',0.5,0.5,'users/170310007/papers/UG_thesis_guided.pdf');
/*!40000 ALTER TABLE `recruit_acad_annex_u` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_v`
--

DROP TABLE IF EXISTS `recruit_acad_annex_v`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_v` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_number` int(11) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `last_prom` varchar(100) NOT NULL,
  `credit_val` double NOT NULL,
  `total` double NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_v_app_id_id_cf879087_fk` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_v_app_id_id_cf879087_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_v`
--

LOCK TABLES `recruit_acad_annex_v` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_v` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_v` VALUES (6,0,'170210002','[]',0,'',0,0,''),(7,0,'170210004','[]',0,'',0,0,''),(8,0,'170210008','[]',0,'',0,0,''),(9,0,'170310007','[]',0,'',0,0,'');
/*!40000 ALTER TABLE `recruit_acad_annex_v` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_w1_w2`
--

DROP TABLE IF EXISTS `recruit_acad_annex_w1_w2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_w1_w2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_number` int(11) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `annexure_data1` longtext NOT NULL,
  `annexure_data2` longtext NOT NULL,
  `store_w1` tinyint(1) NOT NULL,
  `last_prom_w1` varchar(100) NOT NULL,
  `last_prom_w2` varchar(100) NOT NULL,
  `store_w2` tinyint(1) NOT NULL,
  `credit_val` double NOT NULL,
  `total_w1` double NOT NULL,
  `total_w2` double NOT NULL,
  `annexure_file_w1` varchar(100) DEFAULT NULL,
  `annexure_file_w2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_w1_w2_app_id_id_4ebf5122_fk` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_w1_w2_app_id_id_4ebf5122_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_w1_w2`
--

LOCK TABLES `recruit_acad_annex_w1_w2` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_w1_w2` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_w1_w2` VALUES (6,0,'170210002','[]','[]',0,'','',0,0,0,0,'',''),(7,0,'170210004','[]','[]',0,'','',0,0,0,0,'',''),(8,0,'170210008','[]','[]',0,'','',0,0,0,0,'',''),(9,0,'170310007','[]','[]',0,'','',0,0,0,0,'','');
/*!40000 ALTER TABLE `recruit_acad_annex_w1_w2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_x`
--

DROP TABLE IF EXISTS `recruit_acad_annex_x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_x` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_number` int(11) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `last_prom` varchar(100) NOT NULL,
  `credit_val` double NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_x_app_id_id_80669e34_fk` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_x_app_id_id_80669e34_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_x`
--

LOCK TABLES `recruit_acad_annex_x` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_x` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_x` VALUES (6,0,'170210002','[]',0,'',0,'',0),(7,0,'170210004','[]',0,'',0,'',0),(8,0,'170210008','[]',0,'',0,'',0),(9,3,'170310007','[{\"act\":\"household survey under UBA\",\"place\":\"Lengpui Village, Aizawl\",\"date\":\"2017-08-11\",\"credit\":\"1\"},{\"act\":\"nano science working group visit\",\"place\":\"IISc Bangalore\",\"date\":\"2016-06-29\",\"credit\":\"1\"},{\"act\":\"lab visit to NIT Agrtala to conduct the manufacturing lab\",\"place\":\"NIT Agrtala \",\"date\":\"2017-04-24\",\"credit\":\"1\"}]',1,'2015-12-21',3,'users/170310007/papers/out_reach_activity.pdf',3);
/*!40000 ALTER TABLE `recruit_acad_annex_x` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_y`
--

DROP TABLE IF EXISTS `recruit_acad_annex_y`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_y` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_number` int(11) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `store` tinyint(1) NOT NULL,
  `credit_val` double NOT NULL,
  `value` varchar(10) NOT NULL,
  `fna` tinyint(1) NOT NULL,
  `fnae` tinyint(1) NOT NULL,
  `fnasc` tinyint(1) NOT NULL,
  `ieee` tinyint(1) NOT NULL,
  `credit_score` double NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_y_app_id_id_68fb1eba_fk` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_y_app_id_id_68fb1eba_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_y`
--

LOCK TABLES `recruit_acad_annex_y` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_y` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_y` VALUES (6,0,'170210002',0,0,'0',0,0,0,0,0,''),(7,0,'170210004',0,0,'NO',0,0,0,0,0,''),(8,0,'170210008',0,0,'0',0,0,0,0,0,''),(9,0,'170310007',0,0,'no',0,0,0,0,0,'');
/*!40000 ALTER TABLE `recruit_acad_annex_y` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_acad_annex_z`
--

DROP TABLE IF EXISTS `recruit_acad_annex_z`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_acad_annex_z` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `percentage` int(11) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `annexure_data` longtext NOT NULL,
  `store` tinyint(1) NOT NULL,
  `total_number` int(11) NOT NULL,
  `last_prom` varchar(100) NOT NULL,
  `credit_val` double NOT NULL,
  `annexure_file` varchar(100) DEFAULT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_acad_annex_z_app_id_id_bed1d668_fk` (`app_id_id`),
  CONSTRAINT `recruit_acad_annex_z_app_id_id_bed1d668_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_z`
--

LOCK TABLES `recruit_acad_annex_z` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_z` DISABLE KEYS */;
INSERT INTO `recruit_acad_annex_z` VALUES (6,0,'170210002','[]',0,0,'',0,'',0),(7,0,'170210004','[]',0,0,'',0,'',0),(8,0,'170210008','[]',0,0,'',0,'',0),(9,0,'170310007','[]',0,0,'',0,'',0);
/*!40000 ALTER TABLE `recruit_acad_annex_z` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_appdata`
--

DROP TABLE IF EXISTS `recruit_appdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_appdata` (
  `app_id` varchar(10) NOT NULL,
  `post_for` varchar(200) NOT NULL,
  `post_in` varchar(200) NOT NULL,
  `specialize` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `agp1` tinyint(1) NOT NULL,
  `agp2` tinyint(1) NOT NULL,
  `agp3` tinyint(1) NOT NULL,
  `submitted` tinyint(1) NOT NULL,
  `submitDate` datetime(6) NOT NULL,
  `paymentUploaded` tinyint(1) NOT NULL,
  PRIMARY KEY (`app_id`),
  KEY `recruit_appdata_user_id_9cb410fc_fk_auth_user_id` (`user_id`),
  CONSTRAINT `recruit_appdata_user_id_9cb410fc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_appdata`
--

LOCK TABLES `recruit_appdata` WRITE;
/*!40000 ALTER TABLE `recruit_appdata` DISABLE KEYS */;
INSERT INTO `recruit_appdata` VALUES ('170110001','Assistant Professor ( AGP-6000/7000/8000)','Civil Engineering Department','',26,1,0,0,0,'2017-09-21 01:44:00.385032',1),('170110002','Assistant Professor ( AGP-6000/7000/8000)','Civil Engineering Department','',36,1,0,0,0,'2017-09-21 05:17:00.052159',0),('170110004','Assistant Professor ( AGP-6000/7000/8000)','Civil Engineering Department','',43,1,0,0,0,'2017-09-21 06:04:42.885723',0),('170130003','Professor ( AGP-10500 )','Civil Engineering Department','',38,1,0,0,0,'2017-09-21 05:21:36.114721',0),('170210002','Assistant Professor ( AGP-6000/7000/8000)','Electrical and Electronics Engineering Department','Power Electronics and Drives',29,1,1,0,0,'2017-09-21 04:21:47.379175',1),('170210003','Assistant Professor ( AGP-6000/7000/8000)','Electrical and Electronics Engineering Department','CONDITION MONITORING/ HIGH VOLTAGE ENGINEERING',42,1,0,0,0,'2017-09-21 05:43:33.367748',1),('170210004','Assistant Professor ( AGP-6000/7000/8000)','Electrical and Electronics Engineering Department','Energy Studies',44,1,1,0,1,'2017-09-21 10:28:19.063908',1),('170210005','Assistant Professor ( AGP-6000/7000/8000)','Electrical and Electronics Engineering Department','Power System',49,1,0,0,0,'2017-09-21 07:21:39.097126',1),('170210006','Assistant Professor ( AGP-6000/7000/8000)','Electrical and Electronics Engineering Department','MEDICAL ELECTRONICS',58,1,1,0,0,'2017-09-21 08:53:38.946127',1),('170210007','Assistant Professor ( AGP-6000/7000/8000)','Electrical and Electronics Engineering Department','',61,1,0,0,0,'2017-09-21 09:37:40.973919',1),('170210008','Assistant Professor ( AGP-6000/7000/8000)','Electrical and Electronics Engineering Department','',65,1,0,0,0,'2017-09-21 10:05:42.772575',1),('170210009','Assistant Professor ( AGP-6000/7000/8000)','Electrical and Electronics Engineering Department','',72,1,0,0,0,'2017-09-21 10:47:06.330813',0),('170210010','Assistant Professor ( AGP-6000/7000/8000)','Electrical and Electronics Engineering Department','',75,1,0,0,0,'2017-09-21 11:21:49.271584',0),('170310001','Assistant Professor ( AGP-6000/7000/8000)','Mechanical Engineering Department','',19,1,0,0,0,'2017-09-20 14:11:01.048782',0),('170310002','Assistant Professor ( AGP-6000/7000/8000)','Mechanical Engineering Department','',22,1,0,0,0,'2017-09-20 15:51:06.048681',0),('170310003','Assistant Professor ( AGP-6000/7000/8000)','Mechanical Engineering Department','',25,1,0,0,0,'2017-09-20 18:27:53.423941',0),('170310004','Assistant Professor ( AGP-6000/7000/8000)','Mechanical Engineering Department','',28,1,0,0,0,'2017-09-21 04:18:22.907674',0),('170310005','Assistant Professor ( AGP-6000/7000/8000)','Mechanical Engineering Department','Design and Dynamics',31,1,0,0,0,'2017-09-21 05:04:55.055755',1),('170310006','Assistant Professor ( AGP-6000/7000/8000)','Mechanical Engineering Department','',33,1,0,0,0,'2017-09-21 05:11:09.880354',1),('170310007','Assistant Professor ( AGP-6000/7000/8000)','Mechanical Engineering Department','Mechanical Engineering (Advanced Manufacturing)',40,1,1,0,0,'2017-09-21 05:29:34.573776',1),('170310008','Assistant Professor ( AGP-6000/7000/8000)','Mechanical Engineering Department','',55,1,0,0,0,'2017-09-21 08:21:08.642765',1),('170310009','Assistant Professor ( AGP-6000/7000/8000)','Mechanical Engineering Department','MATERIALS TECHNOLOGY',56,1,0,0,0,'2017-09-21 08:39:55.829222',1),('170310010','Assistant Professor ( AGP-6000/7000/8000)','Mechanical Engineering Department','',59,1,0,0,0,'2017-09-21 09:05:18.675212',1),('170310011','Assistant Professor ( AGP-6000/7000/8000)','Mechanical Engineering Department','',66,1,0,0,0,'2017-09-21 10:09:04.827238',1),('170310012','Assistant Professor ( AGP-6000/7000/8000)','Mechanical Engineering Department','machine design',68,1,0,1,0,'2017-09-21 10:24:57.532467',1),('170310013','Assistant Professor ( AGP-6000/7000/8000)','Mechanical Engineering Department','',69,1,0,0,0,'2017-09-21 10:30:17.991480',1),('170310014','Assistant Professor ( AGP-6000/7000/8000)','Mechanical Engineering Department','',73,1,0,0,0,'2017-09-21 10:55:19.463894',1),('170410002','Assistant Professor ( AGP-6000/7000/8000)','Electronics and Communication Engineering','',21,1,0,0,0,'2017-09-20 15:34:39.815961',1),('170410003','Assistant Professor ( AGP-6000/7000/8000)','Electronics and Communication Engineering','',23,1,0,0,0,'2017-09-20 17:15:17.082119',0),('170410004','Assistant Professor ( AGP-6000/7000/8000)','Electronics and Communication Engineering','',30,1,0,0,0,'2017-09-21 04:45:11.940902',0),('170410005','Assistant Professor ( AGP-6000/7000/8000)','Electronics and Communication Engineering','',67,1,0,0,0,'2017-09-21 10:15:14.530789',0),('170410006','Assistant Professor ( AGP-6000/7000/8000)','Electronics and Communication Engineering','',74,1,0,0,0,'2017-09-21 11:01:05.287723',0),('170410008','Assistant Professor ( AGP-6000/7000/8000)','Electronics and Communication Engineering','',77,1,0,0,0,'2017-09-21 12:07:57.825457',0),('170410009','Assistant Professor ( AGP-6000/7000/8000)','Electronics and Communication Engineering','',80,1,0,0,0,'2017-09-21 12:54:12.971530',1),('170420007','Associate Professor ( AGP-9500 )','Electronics and Communication Engineering','',76,1,0,0,0,'2017-09-21 11:41:43.625555',0),('170430001','Professor ( AGP-10500 )','Electronics and Communication Engineering','',18,1,0,0,0,'2017-09-20 13:51:02.393935',0),('170510003','Assistant Professor ( AGP-6000/7000/8000)','Metallurgy Department','MATERIALS ENGINEERING',35,1,0,0,0,'2017-09-21 05:16:59.199270',1),('170510004','Assistant Professor ( AGP-6000/7000/8000)','Metallurgy Department','',46,1,0,0,0,'2017-09-21 06:37:39.626759',0),('170610001','Assistant Professor ( AGP-6000/7000/8000)','Chemical Engineering Department','',24,1,0,0,0,'2017-09-20 18:05:26.927974',0),('170610002','Assistant Professor ( AGP-6000/7000/8000)','Chemical Engineering Department','',37,1,0,0,0,'2017-09-21 05:19:20.155412',1),('170610003','Assistant Professor ( AGP-6000/7000/8000)','Chemical Engineering Department','Energy and Environment',62,1,0,0,0,'2017-09-21 09:42:47.679862',1),('170610004','Assistant Professor ( AGP-6000/7000/8000)','Chemical Engineering Department','',71,1,0,0,0,'2017-09-21 10:42:11.017330',0),('170710001','Assistant Professor ( AGP-6000/7000/8000)','Computer Science and Engineering','',39,1,0,0,0,'2017-09-21 05:23:55.158058',0),('170710002','Assistant Professor ( AGP-6000/7000/8000)','Computer Science and Engineering','',41,1,0,0,0,'2017-09-21 05:31:54.370964',1),('170710003','Assistant Professor ( AGP-6000/7000/8000)','Computer Science and Engineering','Image Processing and Pattern Recognition',45,0,0,1,0,'2017-09-21 06:30:10.631323',1),('170710004','Assistant Professor ( AGP-6000/7000/8000)','Computer Science and Engineering','',48,1,0,0,0,'2017-09-21 07:18:50.078790',0),('170710006','Assistant Professor ( AGP-6000/7000/8000)','Computer Science and Engineering','',54,1,0,0,0,'2017-09-21 08:10:50.248967',0),('170710007','Assistant Professor ( AGP-6000/7000/8000)','Computer Science and Engineering','',78,1,0,0,0,'2017-09-21 12:11:25.082831',0),('170710010','Assistant Professor ( AGP-6000/7000/8000)','Computer Science and Engineering','',84,1,0,0,0,'2017-09-21 13:56:20.978289',0),('170720005','Associate Professor ( AGP-9500 )','Computer Science and Engineering','',50,1,0,0,0,'2017-09-21 07:21:39.471256',0),('170720008','Associate Professor ( AGP-9500 )','Computer Science and Engineering','',82,1,0,0,0,'2017-09-21 13:42:39.609297',0),('170720009','Associate Professor ( AGP-9500 )','Computer Science and Engineering','',83,1,0,0,0,'2017-09-21 13:48:01.331736',0),('170810001','Assistant Professor ( AGP-6000/7000/8000)','Biotechnology Department','BIOCHEMISTRY-BIOTECHNOLOGY',32,1,0,0,0,'2017-09-21 05:07:40.568343',1),('170810002','Assistant Professor ( AGP-6000/7000/8000)','Biotechnology Department','Environmental Biotechnology, Bioenergy, Biofuels, Modelling and Simulation of Bioprocesses, Bioprocess Engineering',52,0,0,1,0,'2017-09-21 07:44:06.372580',1),('170810003','Assistant Professor ( AGP-6000/7000/8000)','Biotechnology Department','',79,1,0,0,0,'2017-09-21 12:15:41.368684',1),('170910001','Assistant Professor ( AGP-6000/7000/8000)','Mathematics Department','Mathematics (Fuzzy Mathematics)',34,1,0,0,0,'2017-09-21 05:13:11.890945',1),('171010001','Assistant Professor ( AGP-6000/7000/8000)','Physics Department','',53,1,0,0,0,'2017-09-21 07:57:40.272624',0),('171010002','Assistant Professor ( AGP-6000/7000/8000)','Physics Department','',57,1,0,0,0,'2017-09-21 08:46:46.003603',0),('171010003','Assistant Professor ( AGP-6000/7000/8000)','Physics Department','',70,1,0,0,0,'2017-09-21 10:39:06.239383',0),('171110001','Assistant Professor ( AGP-6000/7000/8000)','Chemistry Department','',47,1,0,0,0,'2017-09-21 06:42:22.207583',0),('171110002','Assistant Professor ( AGP-6000/7000/8000)','Chemistry Department','',51,1,0,0,0,'2017-09-21 07:26:44.635830',0),('171110003','Assistant Professor ( AGP-6000/7000/8000)','Chemistry Department','',63,1,0,0,0,'2017-09-21 09:45:39.968521',0),('171110004','Assistant Professor ( AGP-6000/7000/8000)','Chemistry Department','',64,1,0,0,0,'2017-09-21 09:56:33.902222',1),('171110005','Assistant Professor ( AGP-6000/7000/8000)','Chemistry Department','',81,1,0,0,0,'2017-09-21 13:22:49.996472',0),('171210001','Assistant Professor ( AGP-6000/7000/8000)','Humanities and Social Science','',20,1,0,0,0,'2017-09-20 14:33:56.443437',1),('171210002','Assistant Professor ( AGP-6000/7000/8000)','Humanities and Social Science','',60,1,0,0,0,'2017-09-21 09:24:28.156642',1);
/*!40000 ALTER TABLE `recruit_appdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_conference_paper_sci`
--

DROP TABLE IF EXISTS `recruit_conference_paper_sci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_conference_paper_sci` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_confernce_papers` int(11) NOT NULL,
  `as_first_supervisor` int(11) NOT NULL,
  `papers` longtext NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `credit_val` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_conference_paper_sci_app_id_id_a47c0692_fk` (`app_id_id`),
  CONSTRAINT `recruit_conference_paper_sci_app_id_id_a47c0692_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_conference_paper_sci`
--

LOCK TABLES `recruit_conference_paper_sci` WRITE;
/*!40000 ALTER TABLE `recruit_conference_paper_sci` DISABLE KEYS */;
INSERT INTO `recruit_conference_paper_sci` VALUES (6,13,9,'[]','170210002',0),(7,1,1,'[]','170210004',0),(8,5,4,'[]','170210008',0),(9,40,12,'[]','170310007',11.8);
/*!40000 ALTER TABLE `recruit_conference_paper_sci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_consultancy_projects`
--

DROP TABLE IF EXISTS `recruit_consultancy_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_consultancy_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consultancy_projects_completed` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `credit_val` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_consultancy_projects_app_id_id_2502e623_fk` (`app_id_id`),
  CONSTRAINT `recruit_consultancy_projects_app_id_id_2502e623_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_consultancy_projects`
--

LOCK TABLES `recruit_consultancy_projects` WRITE;
/*!40000 ALTER TABLE `recruit_consultancy_projects` DISABLE KEYS */;
INSERT INTO `recruit_consultancy_projects` VALUES (6,0,0,'170210002',0),(7,0,0,'170210004',0),(8,0,0,'170210008',0),(9,0,0,'170310007',0);
/*!40000 ALTER TABLE `recruit_consultancy_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_education`
--

DROP TABLE IF EXISTS `recruit_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `education` longtext NOT NULL,
  `abstract_thesis` longtext NOT NULL,
  `any_other_info` longtext NOT NULL,
  `sports_extra` longtext NOT NULL,
  `lang` longtext NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_education_app_id_id_24ab0b75_fk` (`app_id_id`),
  CONSTRAINT `recruit_education_app_id_id_24ab0b75_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_education`
--

LOCK TABLES `recruit_education` WRITE;
/*!40000 ALTER TABLE `recruit_education` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruit_education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_experience`
--

DROP TABLE IF EXISTS `recruit_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teaching_exp` int(11) NOT NULL,
  `teaching_data` longtext NOT NULL,
  `research_exp` int(11) NOT NULL,
  `research_data` longtext NOT NULL,
  `industrial_exp` int(11) NOT NULL,
  `industrial_data` longtext NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `postPhd_exp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_experience_app_id_id_b8d43b25_fk` (`app_id_id`),
  CONSTRAINT `recruit_experience_app_id_id_b8d43b25_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_experience`
--

LOCK TABLES `recruit_experience` WRITE;
/*!40000 ALTER TABLE `recruit_experience` DISABLE KEYS */;
INSERT INTO `recruit_experience` VALUES (8,0,'[{\"organization\":\"VRR INSTITUTE OF BIOMEDICAL SCIENCE,CHENNAI,INDIA\",\"designation\":\"RESEARCH ASSOCIATE\",\"joiningDate\":\"2017-06-26\",\"leavingDate\":\"CONTINUING\",\"pay\":\"25000\",\"service\":\"Regular\"}]',4,'[{\"organization\":\"NICHI-IN CENTRE FOR REGENERATIVE MEDICINE,CHENNAI,INDIA\",\"designation\":\"RESEARCH ASSISTANT\",\"joiningDate\":\"2009-07-01\",\"leavingDate\":\"16/07/2011\",\"pay\":\"10000\",\"service\":\"Regular\"},{\"organization\":\"VRR INSTITUTE OF BIOMEDICAL SCIENCE,CHENNAI,INDIA\",\"designation\":\"SENIOR RESEARCH FELLOW\",\"joiningDate\":\"2011-08-01\",\"leavingDate\":\"30/06/2013\",\"pay\":\"18000\",\"service\":\"Contract\"}]',0,'[]','170810001',1),(9,2,'[{\"organization\":\"VIT University Vellore\",\"designation\":\"Associate Professor\",\"joiningDate\":\"2015-06-01\",\"leavingDate\":\"15/12/2015\",\"pay\":\"31600(AGP9500)\",\"service\":\"Regular\"},{\"organization\":\"National Institute of Technology Mizoram\",\"designation\":\"Assistant Professor\",\"joiningDate\":\"2015-12-21\",\"leavingDate\":\"Continuing\",\"pay\":\"21750(AGP6000)\",\"service\":\"Regular\"}]',0,'[]',0,'[]','170310007',2),(10,3,'[{\"organization\":\"DIMAT\",\"designation\":\"ASSISTANT PROFESSOR\",\"joiningDate\":\"2009-01-19\",\"leavingDate\":\"30/06/2012\",\"pay\":\"45000\",\"service\":\"Regular\"}]',5,'[{\"organization\":\"IIT MANDI\",\"designation\":\"RESEARCH SCHOLAR\",\"joiningDate\":\"2012-08-30\",\"leavingDate\":\"28/08/2017\",\"pay\":\"33000\",\"service\":\"Regular\"}]',3,'[{\"organization\":\"ESL INDIA\",\"designation\":\"E-2, ELECTRICAL ENGINEER\",\"joiningDate\":\"2007-11-13\",\"leavingDate\":\"01/12/2008\",\"pay\":\"35000\",\"service\":\"Regular\"},{\"organization\":\"RYB CONSULTANT\",\"designation\":\"ELECTRICAL ENGINEER\",\"joiningDate\":\"2003-06-02\",\"leavingDate\":\"30/08/2005\",\"pay\":\"20000\",\"service\":\"Regular\"}]','170210004',0);
/*!40000 ALTER TABLE `recruit_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_external_sponsored_rnd`
--

DROP TABLE IF EXISTS `recruit_external_sponsored_rnd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_external_sponsored_rnd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_projects` int(11) NOT NULL,
  `project_as_PI` int(11) NOT NULL,
  `projects_not_pi` longtext NOT NULL,
  `total_patents` int(11) NOT NULL,
  `patents_as_pi` int(11) NOT NULL,
  `patents_not_pi` longtext NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `credit_val` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_external_sponsored_rnd_app_id_id_7c19444c_fk` (`app_id_id`),
  CONSTRAINT `recruit_external_sponsored_rnd_app_id_id_7c19444c_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_external_sponsored_rnd`
--

LOCK TABLES `recruit_external_sponsored_rnd` WRITE;
/*!40000 ALTER TABLE `recruit_external_sponsored_rnd` DISABLE KEYS */;
INSERT INTO `recruit_external_sponsored_rnd` VALUES (6,0,0,'[]',0,0,'[]','170210002',0),(7,0,0,'[]',0,0,'[]','170210004',0),(8,0,0,'[]',0,0,'[]','170210008',0),(9,1,1,'[]',0,0,'[]','170310007',5);
/*!40000 ALTER TABLE `recruit_external_sponsored_rnd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_facuser`
--

DROP TABLE IF EXISTS `recruit_facuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_facuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `father_name` varchar(200) NOT NULL,
  `mother_name` varchar(200) NOT NULL,
  `father_occ` varchar(200) NOT NULL,
  `nation` varchar(200) NOT NULL,
  `pob` varchar(200) NOT NULL,
  `dob` date NOT NULL,
  `age` int(11) NOT NULL,
  `permanent_addr` varchar(200) NOT NULL,
  `correspond_addr` varchar(200) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `mother_occ` varchar(200) NOT NULL,
  `category` varchar(10) NOT NULL,
  `pwd` varchar(10) NOT NULL,
  `aadhaarNo` varchar(13) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_facuser_app_id_id_1c185473_fk` (`app_id_id`),
  CONSTRAINT `recruit_facuser_app_id_id_1c185473_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_facuser`
--

LOCK TABLES `recruit_facuser` WRITE;
/*!40000 ALTER TABLE `recruit_facuser` DISABLE KEYS */;
INSERT INTO `recruit_facuser` VALUES (8,'Tejavathu Ramesh','Male','Bheemla','Bikshani','Farmer','Indian','Banapuram Thanda','1987-04-09',30,'NIT Campus, Kurukshetra','FH-6, Faculty House','170210002','Home Maker','ST','no','478982246721'),(9,'JEEVARAJ S','Male','M Selvaraj','S Ambiga','Retired from the service','Indian','Madurai','1990-08-16',27,'Dr. Jeevaraj S, S/o. M. Selvaraj, Selvambiga Illam, 43 Kaja Street, M. K. Puram, Madurai-625011, Tamilnadu, India.','Dr. Jeevaraj S, C/o. Dr. V. Lakshmana Gomathi Nayagam, Room No. 221, Lyceum Building, Department of Mathematics, National Institute of Technology Tiruchirappalli, Tamilnadu-620015, India','170910001','Home Maker','OBC','no',''),(10,'CHOKKAKULA LEELA PYDI PAVITHRA','Female','CHOKKAKULA SIMHACHALAM','CHOKKAKULA PAIDITHALLAMMA','RETIRED','INDIAN','VISAKHAPATNAM','1985-06-14',32,'D/O Ch.Simhachalam,37-6-43/2, Satyanagar, Manchukonda Gardens,VISAKHAPATNAM-530007','D/O Ch.Simhachalam,37-6-43/2, Satyanagar, Manchukonda Gardens,VISAKHAPATNAM-530007','170510003','HOME MAKER','UR','no','894882304222'),(11,'THOLCOPIYAN@CHITRARASU','Male','LOGANATHAN','ALAMELU','FARMER','INDIAN','PUDUCHERRY','1986-07-13',31,'50,PILLAIYAR KOIL ST, KUNICHEMPET, KORAIKENI POST, PUDUCHERRY-605501','1/7,MRB AVENUE, BHAJANAI KOIL ST, KATTUPAKKAM, CHENNAI-56','170810001','HOME MAKER','OBC','yes','308805054776'),(12,'MOHAN RAO UNGARALA','Male','U. CHIRANJEEVI RAO','U. SURYA KUMARI','FARMER','INDIAN','VIZIANAGARAM','1988-05-05',29,'S/O. UNGARALA CHIRANJEEVI RAO, M. VENKATAPURAM, GAJAPATHINAGARAM, VIZIANAGARAM, A.P. 535270.','S/O. UNGARALA CHIRANJEEVI RAO, M. VENKATAPURAM, GAJAPATHINAGARAM, VIZIANAGARAM, A.P. 535270.','170210003','HOME MAKER','UR','no','977467817362'),(13,'NARASIMHA REDDY SOORA','Male','Seetharamulu','Bharathi','Retired as clerk from SCCL','Indian','Hanamkonda','1977-04-08',40,'H. No: 2-4-5, Near Masjid Railway Gate, Jammikunta, Karim Nagar, Telangana, Pin: 505122','H.No: 23-6-50/100/8, First Floor, KRR Town Ship, Shayampet, Hunter Road, Hanamkonda, Warangal, PIN: 506001','170710003','House Wife','UR','no','673609434118'),(14,'BASIL KURIACHEN','Male','K.V.KURIACHEN','MARY KURIACHAN','DIED','INDIAN','Perumbavoor, Kerala, India','1986-03-08',31,'Kattarukudy House, Rayamangalam P.O., Kuruppampady, Ernakulam, Kerala-683545','Assistant Professor, mechanical Engineering Department, National Institute of Technology Mizoram, Chaltlang, Aizawl-796012, Mizoram','170310007','HOME MAKER','UR','no','614727878017'),(15,'YASHWANT KASHYAP','Male','K P KASHYAP','R KASHYAP','RETAIRED GOVT EMPLOYEE','INDIAN','SINGHANPUR','1981-09-17',36,'HOUSSE NO-19, PHASE-2, KHUSHI ENCLAVE, TELIBANDHA, NEAR VIP ROAD, RAIPUR- 492001, CHHATTISGARH','HOUSSE NO-19, PHASE-2, KHUSHI ENCLAVE, TELIBANDHA, NEAR VIP ROAD, RAIPUR- 492001, CHHATTISGARH','170210004','HOUSE WIFE','OBC','no','576816038567'),(16,'KORRAPATI NARASIMHULU','Male','K Venkata Subbaiah','K Subbamma','Farmer','Indian','Kamalakur (Kadapa District)','1976-07-12',41,'Kamalakur village, Via Badvel, Kadapa District, Andhra Pradesh, India.','Dr.K.Narasimhulu, Assistant Professor, Department of Biotechnology, National Institute of Technology Warangal, Warangal-506004, Telangana State, India.','170810002','House wife','OBC','no','356843948855'),(17,'Balaji PS','Male','Selvaraj','Mahalaskshmi','Carpentar','Indian','Chennai','1986-11-27',30,'No 13/1 Siddalu chetty street, Choolai, Chennai 600112','No 13/1 Siddalu chetty street, Choolai, Chennai 600112','170310005','House wife','OBC','no','778388595584'),(18,'DEVARAJU A','Male','KRISHNAMURTHY','PUSHPA','FARMER ','INDIAN','WARANGAL','1984-01-21',33,'H.NO:1-256 SC COLONY NEAR RNR GARDENS MADIKONDA WARANGAL URBAN TELANGANA STATE 506142','H.NO:1-256 SC COLONY NEAR RNR GARDENS MADIKONDA WARANGAL URBAN TELANGANA STATE 506142','170310009','HOUSE WIFE','SC','no','437941773390'),(19,'DR BANDARU RAMAKRISHNA','Male','BHANUMURTHY','PADMA','RET SCCL EMPLOYEE','INDIAN','MANUGURU','1986-08-15',31,'9-1-237 BHAGATHSINGHNAGAR MANUGURU BHADHARDRIKOTHAGUDEM TELANGANA 507117','Biosensors Laboratory, ASB150,160, Department of Applied Mechanics, IIT Madras, Chennai, INDIA.','170210006','HOMEMAKER','OBC','no','282419973771'),(20,'ANJIREDDY BHAVANAM','Male','SUBBAREDDY BHAVANAM','VEERAMMA BHAVANAM','FARMER','INDIAN','KALLAMVARIPALEM, ANDHRAPRADESH','1985-08-15',32,'H.No-2-42, Kallamvaripalem,Bhudavada post,Prakasam District,Andhra Pradesh-523167','Department of Chemical engineering,IIT Guwahati, North Guwahati-781039,Assam,India','170610003','HOUSE WIFE','UR','no','342762505230'),(21,'GUJJALA RAGHAVENDRA','Male','G HONNURAPPA','G LAKSHMI DEVI','RETIRED GOVT. EMPLOYEE','INDIAN','RAYADURG','1986-03-06',31,'H BLOCK 205, GMR BRINDAVAN, WADDEPALLY, HANAMKONDA,506370','ASSISTANT PROFESSOR, MECHANICAL DEPARTMENT, NIT WARANGAL','170310012','HOUSE WIFE','ST','no',''),(22,'DHARMENDRA KUMAR DHEER','Male','Jata Shankar Jha','Saroj Devi','Retired Teacher','Indian','Bhagalpur','1983-08-07',34,'Dr. Dharmendra Kumar Dheer, S/O: Sri Jata Shankar Jha, Vill and Post Bhramarpur, Thana Bihpur, Dist. Bhagalpur, Bihar, Pin: 853201','Dr. Dharmendra Kumar Dheer, Research Associate, Department of Energy Science and Engineering office, IIT Bombay, Powai, Mumbai, Maharashtra, 400076','170210005','House wife','UR','no','340940035611');
/*!40000 ALTER TABLE `recruit_facuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_journal_papers`
--

DROP TABLE IF EXISTS `recruit_journal_papers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_journal_papers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_journal_papers` int(11) NOT NULL,
  `as_first_supervisor` int(11) NOT NULL,
  `papers` longtext NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `credit_val` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_journal_papers_app_id_id_34cd007c_fk` (`app_id_id`),
  CONSTRAINT `recruit_journal_papers_app_id_id_34cd007c_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_journal_papers`
--

LOCK TABLES `recruit_journal_papers` WRITE;
/*!40000 ALTER TABLE `recruit_journal_papers` DISABLE KEYS */;
INSERT INTO `recruit_journal_papers` VALUES (6,9,9,'[]','170210002',0),(7,3,1,'[]','170210004',0),(8,1,4,'[]','170210008',0),(9,8,12,'[]','170310007',13.33);
/*!40000 ALTER TABLE `recruit_journal_papers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_other`
--

DROP TABLE IF EXISTS `recruit_other`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_other` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patent` longtext NOT NULL,
  `consultancy` longtext NOT NULL,
  `admin_resp_held` longtext NOT NULL,
  `minimum_pay_exp` int(11) NOT NULL,
  `time_req` int(11) NOT NULL,
  `honor` longtext NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_other_app_id_id_7271991b_fk` (`app_id_id`),
  CONSTRAINT `recruit_other_app_id_id_7271991b_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_other`
--

LOCK TABLES `recruit_other` WRITE;
/*!40000 ALTER TABLE `recruit_other` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruit_other` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_paper`
--

DROP TABLE IF EXISTS `recruit_paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper1` varchar(100) DEFAULT NULL,
  `paper2` varchar(100) DEFAULT NULL,
  `paper3` varchar(100) DEFAULT NULL,
  `paper4` varchar(100) DEFAULT NULL,
  `paper5` varchar(100) DEFAULT NULL,
  `cvpaper` varchar(100) DEFAULT NULL,
  `app_id_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_paper_app_id_id_a3e44cc0_fk_recruit_appdata_app_id` (`app_id_id`),
  CONSTRAINT `recruit_paper_app_id_id_a3e44cc0_fk_recruit_appdata_app_id` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_paper`
--

LOCK TABLES `recruit_paper` WRITE;
/*!40000 ALTER TABLE `recruit_paper` DISABLE KEYS */;
INSERT INTO `recruit_paper` VALUES (10,'users/170810001/papers/EXPERIENCE.pdf','','','','','','170810001'),(11,'users/170510003/papers/Download_File.pdf','','','','','','170510003'),(12,'users/170710003/papers/Total_Experience.pdf','','','','','','170710003'),(13,'users/170310007/papers/eXP._CERTIFICATE_vit_BASIL.pdf','','','','','','170310007'),(14,'users/170210004/papers/doc.pdf','','','','','users/170210004/papers/YK_CV_5coE4II.pdf','170210004'),(15,'users/170210008/papers/expcombine.pdf','','','','','','170210008'),(16,'users/170110001/papers/Work_experience_combine_74H3mpY.pdf','','','','','users/170110001/papers/Dr._Naveen_BP_CV.pdf','170110001');
/*!40000 ALTER TABLE `recruit_paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_phd_completed`
--

DROP TABLE IF EXISTS `recruit_phd_completed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_phd_completed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_phd` int(11) NOT NULL,
  `as_first_supervisor` int(11) NOT NULL,
  `phds` longtext NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `credit_val` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_phd_completed_app_id_id_278bba51_fk` (`app_id_id`),
  CONSTRAINT `recruit_phd_completed_app_id_id_278bba51_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_phd_completed`
--

LOCK TABLES `recruit_phd_completed` WRITE;
/*!40000 ALTER TABLE `recruit_phd_completed` DISABLE KEYS */;
INSERT INTO `recruit_phd_completed` VALUES (6,0,9,'[]','170210002',0),(7,0,1,'[]','170210004',0),(8,0,4,'[]','170210008',0),(9,0,12,'[]','170310007',0);
/*!40000 ALTER TABLE `recruit_phd_completed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_qualification`
--

DROP TABLE IF EXISTS `recruit_qualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_qualification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `degreeType` varchar(10) NOT NULL,
  `degreeName` varchar(100) NOT NULL,
  `university` varchar(200) NOT NULL,
  `passingYear` int(11) NOT NULL,
  `marks` varchar(10) NOT NULL,
  `division` varchar(100) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_qualification_app_id_id_314ad6ac_fk` (`app_id_id`),
  CONSTRAINT `recruit_qualification_app_id_id_314ad6ac_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_qualification`
--

LOCK TABLES `recruit_qualification` WRITE;
/*!40000 ALTER TABLE `recruit_qualification` DISABLE KEYS */;
INSERT INTO `recruit_qualification` VALUES (23,'UG','BIOTECHNOLOGY','INDIRA GANDHI COLLEGE OF ARTS AND SCIENCE(AFFL TO PONDICHERRY UNIVERSITY)',2006,'60','FIRST','170810001'),(24,'PG','BIOTECHNOLOGY','UNIVERSITY OF MADRAS',2008,'61','FIRST','170810001'),(25,'PHD','BIOCHEMISTRY-BIOTECHNOLOGY','VRR INSTITUTE OF BIOMEDICAL SCIENCE(AFFL TO UNIVERSITY OF MADRAS)',2017,'','THESIS SUBMITTED','170810001'),(26,'other','DIPLOMA IN REGENERATIVE MEDICINE','UNIVERSITY OF TORONTO',2011,'','','170810001'),(27,'UG','B.E., Mechanical Engineering','Anna University Chennai',2008,'69','First Class','170310007'),(28,'PG','M.Tech., Mechanical Engineering (Production and Industrial Engineering)','MG University Kottayam',2011,'7.537','First Class','170310007'),(29,'PHD','Mechanical Engineering','National Institute of Technology Calicut',2015,'','','170310007'),(30,'UG','BE','GEC/GGDU BILASPUR',2003,'68.2','I','170210004'),(31,'PG','MTECH','IIT DELHI',2007,'71.1','I','170210004'),(32,'PHD','PHD','IIT MANDI',2017,'8','I','170210004');
/*!40000 ALTER TABLE `recruit_qualification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_referral`
--

DROP TABLE IF EXISTS `recruit_referral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_referral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_data` longtext NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_referral_app_id_id_aace9029_fk` (`app_id_id`),
  CONSTRAINT `recruit_referral_app_id_id_aace9029_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_referral`
--

LOCK TABLES `recruit_referral` WRITE;
/*!40000 ALTER TABLE `recruit_referral` DISABLE KEYS */;
INSERT INTO `recruit_referral` VALUES (8,'[{\"name\":\"Dr. Ankit Bansal\",\"designation\":\"Assistant Professor\",\"address\":\"Department of Mechanical and Industrial Engineering,\\nIndian Institute of Technology Roorkee,\\nRoorkee-247667, Uttarakhand, India\\nContact Phone/Mobile No. 01332-284781\\nE-mail id: abansfme@iitr.ac.in\\t\\t\\t\\t\\t\\t\\t\\t\"},{\"name\":\"Dr. A. K. Sao\",\"designation\":\"Associate Professor\",\"address\":\"Department of Computing and Electrical Engineering\\nIndian Institute of Technology Mandi\\nMandi-175001, Himachal Pradesh, India\\nContact Phone/Mobile No. 01905 -237918\\nE-mail id: anil@iitmandi.ac.in\"}]','170210004');
/*!40000 ALTER TABLE `recruit_referral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_research`
--

DROP TABLE IF EXISTS `recruit_research`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_research` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `research_publ` longtext NOT NULL,
  `research_proj` longtext NOT NULL,
  `pg` int(11) NOT NULL,
  `phd` int(11) NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_research_app_id_id_5b1c2500_fk` (`app_id_id`),
  CONSTRAINT `recruit_research_app_id_id_5b1c2500_fk` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_research`
--

LOCK TABLES `recruit_research` WRITE;
/*!40000 ALTER TABLE `recruit_research` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruit_research` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_subjecttaught`
--

DROP TABLE IF EXISTS `recruit_subjecttaught`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_subjecttaught` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(10) NOT NULL,
  `courseType` varchar(30) NOT NULL,
  `data` longtext NOT NULL,
  `app_id_id` varchar(10) NOT NULL,
  `credit_val` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruit_subjecttaugh_app_id_id_10c20c70_fk_recruit_a` (`app_id_id`),
  CONSTRAINT `recruit_subjecttaugh_app_id_id_10c20c70_fk_recruit_a` FOREIGN KEY (`app_id_id`) REFERENCES `recruit_appdata` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_subjecttaught`
--

LOCK TABLES `recruit_subjecttaught` WRITE;
/*!40000 ALTER TABLE `recruit_subjecttaught` DISABLE KEYS */;
INSERT INTO `recruit_subjecttaught` VALUES (29,'UG','core','[\"Basic Electrical Engineering &Lab\",\"Electrical Machine & Lab\",\"Non-conventional Sources of Energy\",\"Electrical Power system & Lab\"]','170210004',0),(30,'UG','elective','[]','170210004',0),(31,'PG','core','[\"Case Study of Energy Audit\",\"Master\'s Thesis\"]','170210004',0),(32,'PG','elective','[\"Renewable Energy Basics\",\"Solar Energy\"]','170210004',0);
/*!40000 ALTER TABLE `recruit_subjecttaught` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_department`
--

DROP TABLE IF EXISTS `registration_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `deptID` int(11) NOT NULL,
  `appCount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_department`
--

LOCK TABLES `registration_department` WRITE;
/*!40000 ALTER TABLE `registration_department` DISABLE KEYS */;
INSERT INTO `registration_department` VALUES (1,'Civil Engineering Department',1,4),(2,'Electronics and Communication Engineering',4,9),(3,'Computer Science and Engineering',7,10),(4,'Biotechnology Department',8,3),(5,'Electrical and Electronics Engineering Department',2,10),(6,'Mechanical Engineering Department',3,14),(7,'Metallurgy Department',5,4),(8,'Chemical Engineering Department',6,4),(9,'Humanities and Social Science',12,2),(10,'Chemistry Department',11,5),(11,'Physics Department',10,3),(12,'Mathematics Department',9,1);
/*!40000 ALTER TABLE `registration_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_paymentdetails`
--

DROP TABLE IF EXISTS `registration_paymentdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_paymentdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appID` varchar(10) NOT NULL,
  `bankName` varchar(100) DEFAULT NULL,
  `transID` varchar(50) NOT NULL,
  `accountNum` varchar(30) NOT NULL,
  `payDate` date DEFAULT NULL,
  `receipt` varchar(100) DEFAULT NULL,
  `amount` varchar(10) DEFAULT NULL,
  `payType` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_paymentdetails`
--

LOCK TABLES `registration_paymentdetails` WRITE;
/*!40000 ALTER TABLE `registration_paymentdetails` DISABLE KEYS */;
INSERT INTO `registration_paymentdetails` VALUES (15,'170430001',NULL,'IHF3736970','',NULL,'',NULL,NULL),(16,'170310001',NULL,'IHF3739347','',NULL,'',NULL,NULL),(17,'171210001','SBI','IHF3741905','62035799578','2017-09-20','users/171210001/payment/State_Bank_of_India_Receipt.pdf','Rs.1000','GEN/OBC'),(18,'170410002','Punjab National Bank','107642911','4458000400003921','2017-09-20','users/170410002/payment/fee.pdf','Rs.1000','GEN/OBC'),(19,'170310002',NULL,'726321351534','',NULL,'',NULL,NULL),(20,'170410003',NULL,'Null','',NULL,'',NULL,NULL),(21,'170610001',NULL,'IHF3756177','',NULL,'',NULL,NULL),(22,'170310003',NULL,'5236425','',NULL,'',NULL,NULL),(23,'170110001','STATE BANK OF INDIA','IHF3761087','30213507776','2017-09-21','users/170110001/payment/State_Bank_of_India.pdf','Rs.500','SC/ST/PWD'),(24,'170310004',NULL,'Online','',NULL,'',NULL,NULL),(25,'170210002','SBI','IHF3771972','500','2017-09-21','users/170210002/payment/State_Bank_of_India.pdf','Rs.500','SC/ST/PWD'),(26,'170410004',NULL,'Online','',NULL,'',NULL,NULL),(27,'170310005','SBI, REC WARANGAL Branch.','ITO4088636','00000062476455820','2017-09-21','users/170310005/payment/Payment_Slip_NITAP_Balaji.pdf','Rs.1000','GEN/OBC'),(28,'170810001','Canara bank,Poonamalle branch,Chennai','726410371096','0935101048897','2017-09-21','users/170810001/payment/Canara_Bank_Internet_Banking.pdf','Rs.500','SC/ST/PWD'),(29,'170310006','STATE BANK OF INDIA','IHF3776458','30868158911','2017-09-21','users/170310006/payment/NIT_WARANGAL.pdf','Rs.1000','GEN/OBC'),(30,'170910001','State Bank of India, R E C TIRUCHIRAPALLI','IHF3778428 ','20132047790','2017-09-21','users/170910001/payment/NIT_Andhra_Fees.pdf','Rs.1000','GEN/OBC'),(31,'170510003','SBI IIT Hyderabad','IHF3778809','20109818561','2017-09-21','users/170510003/payment/Leela_Pydi_Pavithra.pdf','Rs.1000','GEN/OBC'),(32,'170110002',NULL,'12345678','',NULL,'',NULL,NULL),(33,'170610002','State Bank of India','IHF3779079','11520060829','2017-09-21','users/170610002/payment/NIT_W_State_Bank_of_India.pdf','Rs.1000','GEN/OBC'),(34,'170130003',NULL,' IMPS00036571526 ','',NULL,'',NULL,NULL),(35,'170710001',NULL,'72641023937','',NULL,'',NULL,NULL),(36,'170310007','SBI','IHF3780697','20124024206','2017-09-21','users/170310007/payment/application_fee_reciept.pdf','Rs.1000','GEN/OBC'),(37,'170710002','HDFC','657498098','01907610043164','2017-09-21','users/170710002/payment/fee.pdf','Rs.1000','GEN/OBC'),(38,'170210003','SBI','IHF3782946','20255556310','2017-09-21','users/170210003/payment/State_Bank_of_India.pdf','Rs.1000','GEN/OBC'),(39,'170110004',NULL,'P17092184628260','',NULL,'',NULL,NULL),(40,'170210004','SBI','IHF3789170','20144699378','2017-09-21','users/170210004/payment/NIT_Warangal.pdf','Rs.1000','GEN/OBC'),(41,'170710003','SBI','IHF3789740','62100676530','2017-09-21','users/170710003/payment/NIT_Andhra_Fee_SBI.pdf','Rs.1000','GEN/OBC'),(42,'170510004',NULL,'123','',NULL,'',NULL,NULL),(43,'171110001',NULL,'2696101016534','',NULL,'',NULL,NULL),(44,'170710004',NULL,'128','',NULL,'',NULL,NULL),(45,'170210005','SBI IIT Powai','IHF3796620','20138656886','2017-09-21','users/170210005/payment/Payment_NIT_AP.pdf','Rs.1000','GEN/OBC'),(46,'170720005',NULL,'136','',NULL,'',NULL,NULL),(47,'171110002',NULL,'8629101103234','',NULL,'',NULL,NULL),(48,'170810002','State Bank of India NIT Warangal Branch','IHF3799786','62052448020','2017-09-21','users/170810002/payment/NIT_AP__fees_Narasimhulu_K.pdf','Rs.1000','GEN/OBC'),(49,'171010001',NULL,'123456','',NULL,'',NULL,NULL),(50,'170710006',NULL,'bank','',NULL,'',NULL,NULL),(51,'170310008','STATE BANK OF INDIA','IHF3802613','11046174451','2017-09-21','users/170310008/payment/State_Bank_of_India.pdf','Rs.1000','GEN/OBC'),(52,'170310009','CANARA BANK','726414080006','2450101022683','2017-09-21','users/170310009/payment/Canara_Bank_Internet_Banking.pdf','Rs.500','SC/ST/PWD'),(53,'171010002',NULL,'ITO4123191','',NULL,'',NULL,NULL),(54,'170210006','SBI',' IHF3808190','20104841380','2017-09-21','users/170210006/payment/nit_w_ap_MONEY_TRANSFER.pdf','Rs.1000','GEN/OBC'),(55,'170310010','State Bank of India','IHF3809422','20031205775','2017-09-21','users/170310010/payment/State_Bank_of_India.pdf','Rs.500','SC/ST/PWD'),(56,'171210002','STATE BANK OF INDIA','IHF3811853','62125879077','2017-09-21','users/171210002/payment/State_Bank_of_India.pdf','Rs.1000','GEN/OBC'),(57,'170210007','Corporation Bank','887603','520101026777602','2017-09-21','users/170210007/payment/Registration_Fee_of_Asst._Prof_Recruitment_in_NIT_AP_Dr._Suresh_Mikkili.pdf','Rs.500','SC/ST/PWD'),(58,'170610003','State Bank of India','IHF3813967','62043654758','2017-09-21','users/170610003/payment/Payment_receipt.pdf','Rs.1000','GEN/OBC'),(59,'171110003',NULL,'IHF38114331','',NULL,'',NULL,NULL),(60,'171110004','SBI Ramanattukara Branch','IHF3815580','20146369461','2017-09-21','users/171110004/payment/Fee.pdf','Rs.1000','GEN/OBC'),(61,'170210008','state bank of india','IHF3816384','32198130763','2017-09-21','users/170210008/payment/State_Bank_of_India_NIT_PAYMENT_RECEIPT.pdf','Rs.500','SC/ST/PWD'),(62,'170310011','State Bank of India','IHF3815875','20081566313','2017-09-21','users/170310011/payment/NIT_AP_Transaction_Receipt.pdf','Rs.1000','GEN/OBC'),(63,'170410005',NULL,'5210860001416967','',NULL,'',NULL,NULL),(64,'170310012','sbh nit warangal','IHF3818634','62327002687','2017-09-21','users/170310012/payment/raghavendra.pdf','Rs.500','SC/ST/PWD'),(65,'170310013','SBI NIT Warangal','IHF3819563 ','62351173982','2017-09-21','users/170310013/payment/State_Bank_of_India.pdf','Rs.500','SC/ST/PWD'),(66,'171010003',NULL,'1000','',NULL,'',NULL,NULL),(67,'170610004',NULL,'1212345467','',NULL,'',NULL,NULL),(68,'170210009',NULL,'UA16682992','',NULL,'',NULL,NULL),(69,'170310014','HDFC','726416110129.','50100158791386','2017-09-21','users/170310014/payment/Fee_recipt.pdf','Rs.1000','GEN/OBC'),(70,'170410006',NULL,'241984','',NULL,'',NULL,NULL),(71,'170210010',NULL,'N264170372116481','',NULL,'',NULL,NULL),(72,'170420007',NULL,'500','',NULL,'',NULL,NULL),(73,'170410008',NULL,'9584','',NULL,'',NULL,NULL),(74,'170710007',NULL,'1212','',NULL,'',NULL,NULL),(75,'170810003','SBI NIT WARANGAL','IHF3831099','62432951997','2017-09-21','users/170810003/payment/NIT_AP_FEE.pdf','Rs.1000','GEN/OBC'),(76,'170410009','canara bank','P17092185293304','0927101204238','2017-09-21','users/170410009/payment/NIT.pdf','Rs.500','SC/ST/PWD'),(77,'171110005',NULL,'IHF3839080 ','',NULL,'',NULL,NULL),(78,'170720008',NULL,'1234','',NULL,'',NULL,NULL),(79,'170720009',NULL,'1234','',NULL,'',NULL,NULL),(80,'170710010',NULL,'IHF3842785','',NULL,'',NULL,NULL);
/*!40000 ALTER TABLE `registration_paymentdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_post`
--

DROP TABLE IF EXISTS `registration_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `postID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_post`
--

LOCK TABLES `registration_post` WRITE;
/*!40000 ALTER TABLE `registration_post` DISABLE KEYS */;
INSERT INTO `registration_post` VALUES (1,'Professor ( AGP-10500 )',3),(2,'Associate Professor ( AGP-9500 )',2),(3,'Assistant Professor ( AGP-6000/7000/8000)',1);
/*!40000 ALTER TABLE `registration_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_userprofile`
--

DROP TABLE IF EXISTS `registration_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicationID` varchar(10) NOT NULL,
  `contact` varchar(14) NOT NULL,
  `departmentApplied` varchar(50) NOT NULL,
  `postApplied` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `termsRead` tinyint(1) NOT NULL,
  `profilePic` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `registration_userprofile_user_id_6e86d1f8_fk_auth_user_id` (`user_id`),
  CONSTRAINT `registration_userprofile_user_id_6e86d1f8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_userprofile`
--

LOCK TABLES `registration_userprofile` WRITE;
/*!40000 ALTER TABLE `registration_userprofile` DISABLE KEYS */;
INSERT INTO `registration_userprofile` VALUES (16,'170430001','9820701995','Electronics and Communication Engineering','Professor ( AGP-10500 )',18,1,''),(17,'170310001','9934175893','Mechanical Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',19,1,''),(18,'171210001','7382673392','Humanities and Social Science','Assistant Professor ( AGP-6000/7000/8000)',20,1,''),(19,'170410002','+918084398383','Electronics and Communication Engineering','Assistant Professor ( AGP-6000/7000/8000)',21,1,''),(20,'170310002','9445801978','Mechanical Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',22,1,''),(21,'170410003','8951604099 ','Electronics and Communication Engineering','Assistant Professor ( AGP-6000/7000/8000)',23,1,''),(22,'170610001','9494082432','Chemical Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',24,1,''),(23,'170310003','8093325500 ','Mechanical Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',25,1,''),(24,'170110001','09916232349','Civil Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',26,1,'users/170110001/profilepic/Dr_NaveenBP.jpg'),(25,'170310004','07727933987','Mechanical Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',28,1,''),(26,'170210002','09034003377','Electrical and Electronics Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',29,1,''),(27,'170410004','9840181019','Electronics and Communication Engineering','Assistant Professor ( AGP-6000/7000/8000)',30,1,''),(28,'170310005','7395979565','Mechanical Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',31,1,'users/170310005/profilepic/Balaji_100kb_-_Copy.jpg'),(29,'170810001','9790792897','Biotechnology Department','Assistant Professor ( AGP-6000/7000/8000)',32,1,'users/170810001/profilepic/Thol_1.jpg'),(30,'170310006','9547891959','Mechanical Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',33,1,''),(31,'170910001','09788868172','Mathematics Department','Assistant Professor ( AGP-6000/7000/8000)',34,1,'users/170910001/profilepic/Scan.jpg'),(32,'170510003','9440303630','Metallurgy Department','Assistant Professor ( AGP-6000/7000/8000)',35,1,'users/170510003/profilepic/pavithra.jpg'),(33,'170110002','9976861464','Civil Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',36,0,''),(34,'170610002','9434555171','Chemical Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',37,1,'users/170610002/profilepic/DSC_3067-1.JPG'),(35,'170130003','+919008093077','Civil Engineering Department','Professor ( AGP-10500 )',38,1,''),(36,'170710001','9394468554','Computer Science and Engineering','Assistant Professor ( AGP-6000/7000/8000)',39,0,''),(37,'170310007','9947187133','Mechanical Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',40,1,'users/170310007/profilepic/photo.jpg'),(38,'170710002','9493754072','Computer Science and Engineering','Assistant Professor ( AGP-6000/7000/8000)',41,1,''),(39,'170210003','8985883186','Electrical and Electronics Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',42,1,'users/170210003/profilepic/150.jpg'),(40,'170110004','9490935916','Civil Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',43,1,''),(41,'170210004','9805911710','Electrical and Electronics Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',44,1,'users/170210004/profilepic/YashwantKashyap1.jpg'),(42,'170710003','09550069520','Computer Science and Engineering','Assistant Professor ( AGP-6000/7000/8000)',45,1,'users/170710003/profilepic/NarasimhaReddySoora_I1500846.jpg'),(43,'170510004','9789069511','Metallurgy Department','Assistant Professor ( AGP-6000/7000/8000)',46,0,''),(44,'171110001','9360165059','Chemistry Department','Assistant Professor ( AGP-6000/7000/8000)',47,1,''),(45,'170710004','8939506006','Computer Science and Engineering','Assistant Professor ( AGP-6000/7000/8000)',48,1,''),(46,'170210005','09167475754','Electrical and Electronics Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',49,1,''),(47,'170720005','8939506006','Computer Science and Engineering','Associate Professor ( AGP-9500 )',50,0,''),(48,'171110002','9677836849','Chemistry Department','Assistant Professor ( AGP-6000/7000/8000)',51,1,''),(49,'170810002','08702462883','Biotechnology Department','Assistant Professor ( AGP-6000/7000/8000)',52,1,'users/170810002/profilepic/Narasimhulu_Passport_Photo.jpg'),(50,'171010001','9655258629','Physics Department','Assistant Professor ( AGP-6000/7000/8000)',53,0,''),(51,'170710006','9884444640','Computer Science and Engineering','Assistant Professor ( AGP-6000/7000/8000)',54,0,''),(52,'170310008','8791184999','Mechanical Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',55,1,''),(53,'170310009','9963336460','Mechanical Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',56,1,'users/170310009/profilepic/devaraj.jpg'),(54,'171010002','9776202640','Physics Department','Assistant Professor ( AGP-6000/7000/8000)',57,1,''),(55,'170210006','09092781394','Electrical and Electronics Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',58,1,'users/170210006/profilepic/photo_1_vnUcQyd.jpg'),(56,'170310010','8332877053','Mechanical Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',59,1,'users/170310010/profilepic/photo-_for_jobs.jpg'),(57,'171210002','7893647596','Humanities and Social Science','Assistant Professor ( AGP-6000/7000/8000)',60,1,'users/171210002/profilepic/5187L.jpg'),(58,'170210007','7588133009','Electrical and Electronics Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',61,1,''),(59,'170610003','8148371241','Chemical Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',62,1,'users/170610003/profilepic/photo_new_jpg.jpg'),(60,'171110003','9980785510','Chemistry Department','Assistant Professor ( AGP-6000/7000/8000)',63,1,''),(61,'171110004','9747608469','Chemistry Department','Assistant Professor ( AGP-6000/7000/8000)',64,1,'users/171110004/profilepic/May2017.jpg'),(62,'170210008','9445324164','Electrical and Electronics Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',65,1,'users/170210008/profilepic/pp3.jpg'),(63,'170310011','7799237156','Mechanical Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',66,1,'users/170310011/profilepic/Photo.jpg'),(64,'170410005','9748713449','Electronics and Communication Engineering','Assistant Professor ( AGP-6000/7000/8000)',67,0,''),(65,'170310012','9985803317','Mechanical Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',68,1,''),(66,'170310013','9618244172','Mechanical Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',69,1,'users/170310013/profilepic/seetharam_1.JPG'),(67,'171010003','09885880288','Physics Department','Assistant Professor ( AGP-6000/7000/8000)',70,1,''),(68,'170610004','7093423964','Chemical Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',71,1,''),(69,'170210009','9494010254','Electrical and Electronics Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',72,1,''),(70,'170310014','09885660279','Mechanical Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',73,1,''),(71,'170410006','7981941862','Electronics and Communication Engineering','Assistant Professor ( AGP-6000/7000/8000)',74,1,''),(72,'170210010','9966424587','Electrical and Electronics Engineering Department','Assistant Professor ( AGP-6000/7000/8000)',75,0,''),(73,'170420007','9952310018','Electronics and Communication Engineering','Associate Professor ( AGP-9500 )',76,0,''),(74,'170410008','9443236320','Electronics and Communication Engineering','Assistant Professor ( AGP-6000/7000/8000)',77,1,''),(75,'170710007','9177983354','Computer Science and Engineering','Assistant Professor ( AGP-6000/7000/8000)',78,1,''),(76,'170810003','8763366087','Biotechnology Department','Assistant Professor ( AGP-6000/7000/8000)',79,1,''),(77,'170410009','09491282508','Electronics and Communication Engineering','Assistant Professor ( AGP-6000/7000/8000)',80,1,''),(78,'171110005','8768084015','Chemistry Department','Assistant Professor ( AGP-6000/7000/8000)',81,1,''),(79,'170720008','7013127589','Computer Science and Engineering','Associate Professor ( AGP-9500 )',82,0,''),(80,'170720009','7013127589','Computer Science and Engineering','Associate Professor ( AGP-9500 )',83,1,''),(81,'170710010','9439432489','Computer Science and Engineering','Assistant Professor ( AGP-6000/7000/8000)',84,0,'');
/*!40000 ALTER TABLE `registration_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-21 19:26:30
