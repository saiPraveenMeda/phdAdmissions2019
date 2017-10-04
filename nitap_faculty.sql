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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (17,'pbkdf2_sha256$36000$cXT8NOW8qsOS$Y3sDqAC/8KkX6K0/H5aMRfVsCEc2yH4UzuZ5CsggyuM=','2017-09-20 13:37:05.102222',1,'wsdc','','','',1,1,'2017-09-20 13:36:15.447432');
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
INSERT INTO `django_session` VALUES ('0m0edyphx4y1fcq9nn5sv1ozq5egfkuf','NTA4NWEzYTY5MjM3YmEyZTIyMDllMTljYWY5ZmQxOTNjMWQ3YTBmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjA1MjVmMTYwNDA5YjZkZTVmMDMxMzQ1N2UwNTYxZGEyYTVjNjczNTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=','2017-10-01 14:43:36.309003'),('1zlx7zoopcwutmexob1llavcpu2f3pdw','NzIzY2M2YTkzMWQ1ODhkNWRhYTlkYzA4YTk2NzM1YjQ1Y2UyZmNjZDp7fQ==','2017-10-04 07:50:31.527792'),('30b3ft151vgi56n80e0zmnitcyenvnwe','NzM1NmYwODVhZDM2MWIwNzkyYzQyZjNlM2Q5ZTFmNWYxNjI5MGZmOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQyZDgyNTAxYTllZDk0ZGViMWNjMDY1MDlkYjIxMTU4YzkyOWFmZmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-09-23 18:26:39.931191'),('4sdfsjt06xd6piujrezcug5xxtkknv9z','OWY3OTc0ZGM2M2ZiMzQyMTc2ZDQ1NGMxN2U3OTEwM2E3NThjMjEyMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ5NWUyYTMxMzNiNDJhMWFlYjhjNjVjOGY2YjY4YjhlZTMxZjY1MmMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI5In0=','2017-10-04 07:01:11.008388'),('4xa40cek100o2ogsy67xil3lnlxti885','NTA4NWEzYTY5MjM3YmEyZTIyMDllMTljYWY5ZmQxOTNjMWQ3YTBmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjA1MjVmMTYwNDA5YjZkZTVmMDMxMzQ1N2UwNTYxZGEyYTVjNjczNTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=','2017-10-02 16:04:20.018582'),('67sscqh1i4cszvr261ap89on3luw6son','NzM1NmYwODVhZDM2MWIwNzkyYzQyZjNlM2Q5ZTFmNWYxNjI5MGZmOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQyZDgyNTAxYTllZDk0ZGViMWNjMDY1MDlkYjIxMTU4YzkyOWFmZmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-09-25 12:57:40.190880'),('7190vg4x951y2doghj1drmd9n93xb2o5','NzBkZWEzYjYzZTY0MjBiZjNiZjM3YjZhNzg4YmVjNjU1NzhjM2E3ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjI1YWU3ODRhYTc4YWZhOGZkZGMwOTM0MDRkY2M3YTZjYjAwYmNkYTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSJ9','2017-10-04 12:34:29.830741'),('a51s6r37b7kzf9lqc9hd9cvlcaou6j9v','OWY3OTc0ZGM2M2ZiMzQyMTc2ZDQ1NGMxN2U3OTEwM2E3NThjMjEyMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ5NWUyYTMxMzNiNDJhMWFlYjhjNjVjOGY2YjY4YjhlZTMxZjY1MmMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI5In0=','2017-10-04 10:53:07.432453'),('bgyk9ialrdetbhomeli9ztxh8gl4exb7','YzA1ZGExNTZkY2Q5NjE5Y2Y3ODk2NzkyZWM5ZDk5NGZkOTVkNzMyZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjcyMzJhZTQ4NjYwNTE5NWYzZTM0MzY0ZGYwYzRmODk5M2FlMzNlOTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-10-03 13:22:42.306402'),('czblqam7qdd637ymhc9tetgvu8sjnhoy','MWNjNzM1MzBhYWVhMTc3OGJiMWY5MzQ0ODFjMjc1N2RlOWI1NzU0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE2N2ZkNTkzZTM5MmI3OGEyOTBhM2JiZmQ0ZmQzYjViOWYxMGY0ZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-10-02 05:51:43.979823'),('f6ztrrgnb7pys9406twqvwld2phtpfyc','MWNjNzM1MzBhYWVhMTc3OGJiMWY5MzQ0ODFjMjc1N2RlOWI1NzU0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE2N2ZkNTkzZTM5MmI3OGEyOTBhM2JiZmQ0ZmQzYjViOWYxMGY0ZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-09-23 18:27:15.175840'),('glerixt6ezparpurscyvtjdo474cf622','M2EwNjM1N2Q1MWQ0ZGQwNWRiNzNhODQ4OTgwMWQxYzYxMmIxMzc1Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjJkYTBiNTBmYjEzYzI4N2FkYTkyODBiZjFmYmIwMTRjYTk4YzhmOGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMCJ9','2017-10-03 04:29:09.962002'),('goy3oks6jvqxptjy5tfxt46vizbkxayi','YzA1ZGExNTZkY2Q5NjE5Y2Y3ODk2NzkyZWM5ZDk5NGZkOTVkNzMyZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjcyMzJhZTQ4NjYwNTE5NWYzZTM0MzY0ZGYwYzRmODk5M2FlMzNlOTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-10-04 11:27:11.439714'),('gulyvt86g0w6wuc0i6yn71lzrch9w6xp','MWNjNzM1MzBhYWVhMTc3OGJiMWY5MzQ0ODFjMjc1N2RlOWI1NzU0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE2N2ZkNTkzZTM5MmI3OGEyOTBhM2JiZmQ0ZmQzYjViOWYxMGY0ZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-10-03 04:33:57.039409'),('hbr374596x8zwoeif55p40rm581qwoui','MWNjNzM1MzBhYWVhMTc3OGJiMWY5MzQ0ODFjMjc1N2RlOWI1NzU0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE2N2ZkNTkzZTM5MmI3OGEyOTBhM2JiZmQ0ZmQzYjViOWYxMGY0ZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-09-30 17:56:29.093033'),('ic09rc9h3lufeco1fwfc49gmelckyf0q','MWNjNzM1MzBhYWVhMTc3OGJiMWY5MzQ0ODFjMjc1N2RlOWI1NzU0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE2N2ZkNTkzZTM5MmI3OGEyOTBhM2JiZmQ0ZmQzYjViOWYxMGY0ZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-10-04 12:34:26.532124'),('jf9y3dewlhjj7a5n13px6mp3r7jnuoy9','MWNjNzM1MzBhYWVhMTc3OGJiMWY5MzQ0ODFjMjc1N2RlOWI1NzU0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE2N2ZkNTkzZTM5MmI3OGEyOTBhM2JiZmQ0ZmQzYjViOWYxMGY0ZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-10-04 13:04:03.013542'),('rotdvehkf2jkl1busei3pxzhirjmdw2l','MWNjNzM1MzBhYWVhMTc3OGJiMWY5MzQ0ODFjMjc1N2RlOWI1NzU0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE2N2ZkNTkzZTM5MmI3OGEyOTBhM2JiZmQ0ZmQzYjViOWYxMGY0ZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-10-04 11:26:46.925240'),('rs9y8yz7pbozubec4ptl6vt5mf3udsjl','MWNjNzM1MzBhYWVhMTc3OGJiMWY5MzQ0ODFjMjc1N2RlOWI1NzU0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE2N2ZkNTkzZTM5MmI3OGEyOTBhM2JiZmQ0ZmQzYjViOWYxMGY0ZjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-10-04 11:57:36.113432'),('tiv5ic2a1q211lzqh0lvhclvlmbscysq','ZjExZjFmZjY1OTAyOTgxNzQ0MmNiYjI2MWJjNzBhNmNhMzM1ZjgwZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFmOWFiZmM3OWNjNjA3NjI1MGU4ZjAyYzBlMmUzYTgyMjg4NzEwYTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=','2017-10-01 17:39:06.616187'),('u71d38vtidctnlzbg01554dotugkn9v9','NzIzY2M2YTkzMWQ1ODhkNWRhYTlkYzA4YTk2NzM1YjQ1Y2UyZmNjZDp7fQ==','2017-09-23 18:25:44.192624'),('v99ebe6qossa7ybefd9bizejk3juvh5m','ZjExZjFmZjY1OTAyOTgxNzQ0MmNiYjI2MWJjNzBhNmNhMzM1ZjgwZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFmOWFiZmM3OWNjNjA3NjI1MGU4ZjAyYzBlMmUzYTgyMjg4NzEwYTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=','2017-10-02 04:59:25.999283');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_a`
--

LOCK TABLES `recruit_acad_annex_a` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_a` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_e12`
--

LOCK TABLES `recruit_acad_annex_e12` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_e12` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_h`
--

LOCK TABLES `recruit_acad_annex_h` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_h` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_i`
--

LOCK TABLES `recruit_acad_annex_i` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_i` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_j`
--

LOCK TABLES `recruit_acad_annex_j` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_j` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_k`
--

LOCK TABLES `recruit_acad_annex_k` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_k` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_l`
--

LOCK TABLES `recruit_acad_annex_l` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_l` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_m`
--

LOCK TABLES `recruit_acad_annex_m` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_m` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_n`
--

LOCK TABLES `recruit_acad_annex_n` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_n` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_o`
--

LOCK TABLES `recruit_acad_annex_o` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_o` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_p`
--

LOCK TABLES `recruit_acad_annex_p` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_p` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_q`
--

LOCK TABLES `recruit_acad_annex_q` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_q` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_r`
--

LOCK TABLES `recruit_acad_annex_r` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_r` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_s`
--

LOCK TABLES `recruit_acad_annex_s` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_s` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_t`
--

LOCK TABLES `recruit_acad_annex_t` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_t` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_u`
--

LOCK TABLES `recruit_acad_annex_u` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_u` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_v`
--

LOCK TABLES `recruit_acad_annex_v` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_v` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_w1_w2`
--

LOCK TABLES `recruit_acad_annex_w1_w2` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_w1_w2` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_x`
--

LOCK TABLES `recruit_acad_annex_x` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_x` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_y`
--

LOCK TABLES `recruit_acad_annex_y` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_y` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_acad_annex_z`
--

LOCK TABLES `recruit_acad_annex_z` WRITE;
/*!40000 ALTER TABLE `recruit_acad_annex_z` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_conference_paper_sci`
--

LOCK TABLES `recruit_conference_paper_sci` WRITE;
/*!40000 ALTER TABLE `recruit_conference_paper_sci` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_consultancy_projects`
--

LOCK TABLES `recruit_consultancy_projects` WRITE;
/*!40000 ALTER TABLE `recruit_consultancy_projects` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_experience`
--

LOCK TABLES `recruit_experience` WRITE;
/*!40000 ALTER TABLE `recruit_experience` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_external_sponsored_rnd`
--

LOCK TABLES `recruit_external_sponsored_rnd` WRITE;
/*!40000 ALTER TABLE `recruit_external_sponsored_rnd` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_facuser`
--

LOCK TABLES `recruit_facuser` WRITE;
/*!40000 ALTER TABLE `recruit_facuser` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_journal_papers`
--

LOCK TABLES `recruit_journal_papers` WRITE;
/*!40000 ALTER TABLE `recruit_journal_papers` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_paper`
--

LOCK TABLES `recruit_paper` WRITE;
/*!40000 ALTER TABLE `recruit_paper` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_phd_completed`
--

LOCK TABLES `recruit_phd_completed` WRITE;
/*!40000 ALTER TABLE `recruit_phd_completed` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_qualification`
--

LOCK TABLES `recruit_qualification` WRITE;
/*!40000 ALTER TABLE `recruit_qualification` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_referral`
--

LOCK TABLES `recruit_referral` WRITE;
/*!40000 ALTER TABLE `recruit_referral` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_subjecttaught`
--

LOCK TABLES `recruit_subjecttaught` WRITE;
/*!40000 ALTER TABLE `recruit_subjecttaught` DISABLE KEYS */;
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
INSERT INTO `registration_department` VALUES (1,'Civil Engineering Department',1,0),(2,'Electronics and Communication Engineering',4,0),(3,'Computer Science and Engineering',7,0),(4,'Biotechnology Department',8,0),(5,'Electrical and Electronics Engineering Department',2,0),(6,'Mechanical Engineering Department',3,0),(7,'Metallurgy Department',5,2),(8,'Chemical Engineering Department',6,0),(9,'Humanities and Social Science',12,0),(10,'Chemistry Department',11,0),(11,'Physics Department',10,0),(12,'Mathematics Department',9,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_paymentdetails`
--

LOCK TABLES `registration_paymentdetails` WRITE;
/*!40000 ALTER TABLE `registration_paymentdetails` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_userprofile`
--

LOCK TABLES `registration_userprofile` WRITE;
/*!40000 ALTER TABLE `registration_userprofile` DISABLE KEYS */;
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

-- Dump completed on 2017-09-20 19:18:24
