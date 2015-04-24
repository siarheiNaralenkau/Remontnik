CREATE DATABASE  IF NOT EXISTS `remontnik` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `remontnik`;
-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: remontnik
-- ------------------------------------------------------
-- Server version	5.1.73-1

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add Категория работ',7,'add_workcategory'),(20,'Can change Категория работ',7,'change_workcategory'),(21,'Can delete Категория работ',7,'delete_workcategory'),(22,'Can add Вид работы',8,'add_worktype'),(23,'Can change Вид работы',8,'change_worktype'),(24,'Can delete Вид работы',8,'delete_worktype'),(25,'Can add Зарегистрированный пользователь',9,'add_userprofile'),(26,'Can change Зарегистрированный пользователь',9,'change_userprofile'),(27,'Can delete Зарегистрированный пользователь',9,'delete_userprofile'),(28,'Can add Предложение по работе',10,'add_jobsuggestion'),(29,'Can change Предложение по работе',10,'change_jobsuggestion'),(30,'Can delete Предложение по работе',10,'delete_jobsuggestion'),(31,'Can add Фото или видео работы мастера',11,'add_usermedia'),(32,'Can change Фото или видео работы мастера',11,'change_usermedia'),(33,'Can delete Фото или видео работы мастера',11,'delete_usermedia'),(34,'Can add Город',12,'add_city'),(35,'Can change Город',12,'change_city'),(36,'Can delete Город',12,'delete_city'),(37,'Can add Организация',13,'add_organizationprofile'),(38,'Can change Организация',13,'change_organizationprofile'),(39,'Can delete Организация',13,'delete_organizationprofile'),(40,'Can add Специализация',14,'add_workspec'),(41,'Can change Специализация',14,'change_workspec'),(42,'Can delete Специализация',14,'delete_workspec'),(43,'Can add Фотоальбом организации',15,'add_workphotoalbum'),(44,'Can change Фотоальбом организации',15,'change_workphotoalbum'),(45,'Can delete Фотоальбом организации',15,'delete_workphotoalbum'),(46,'Can add Фотография выполненной работы',16,'add_workphoto'),(47,'Can change Фотография выполненной работы',16,'change_workphoto'),(48,'Can delete Фотография выполненной работы',16,'delete_workphoto'),(49,'Can add Статья о стройке и ремонте',17,'add_article'),(50,'Can change Статья о стройке и ремонте',17,'change_article'),(51,'Can delete Статья о стройке и ремонте',17,'delete_article');
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
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$15000$QZmzNlzeRMEE$20DnQ62R8uLlLoJBinw/ZzsurKX/92B3f2n/rLZVDvA=','2015-04-21 11:58:10',1,'remontnik','','','naralenkov2010@gmail.com',1,1,'2015-02-14 08:29:12');
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=261 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-02-14 08:52:49','1','Ремонт квартиры',1,'',7,1),(2,'2015-02-14 09:45:07','2','загородное строительство домов, коттеджей, дач',1,'',7,1),(3,'2015-02-14 11:15:28','1','Строительство, ремонт, монтаж',2,'Изменен name.',7,1),(4,'2015-02-14 11:16:20','2','Архитектура и дизайн',2,'Изменен name.',7,1),(5,'2015-02-14 11:19:11','3','газификация и газоснабжение',1,'',7,1),(6,'2015-02-14 11:19:39','3','Газификация и газоснабжение',2,'Изменен name.',7,1),(7,'2015-02-14 11:20:40','4','Клининговые услуги и демонтажные работы',1,'',7,1),(8,'2015-02-14 11:21:34','5','Кровельные работы',1,'',7,1),(9,'2015-02-14 11:23:58','6','Ландшафт, благоустройство территории',1,'',7,1),(10,'2015-02-14 11:39:48','7','Отделочные работы',1,'',7,1),(11,'2015-02-14 11:47:39','8','Монтаж отопления ',1,'',7,1),(12,'2015-02-14 19:48:28','9','Электромонтажные работы',1,'',7,1),(13,'2015-02-15 15:48:35','8','Архитектура. Дизайн. Проектирование',2,'Изменен name.',7,1),(14,'2015-02-15 15:49:09','7','Ремонтные и отделочные работы',2,'Изменен name.',7,1),(15,'2015-02-15 15:50:54','3','Отопление. Газоснабжение',2,'Изменен name.',7,1),(16,'2015-02-15 16:13:14','1','Дизайн помещений',1,'',8,1),(17,'2015-02-15 16:13:37','2','Аренда строительной техники и оборудования',2,'Изменен name.',7,1),(18,'2015-02-15 16:14:13','2','Архитектурное проектирование',1,'',8,1),(19,'2015-02-15 16:15:14','3','Согласование строительных работ',1,'',8,1),(20,'2015-02-15 16:15:59','4','Перепланировка',1,'',8,1),(21,'2015-02-15 16:17:11','5','Монтаж электропроводки',1,'',8,1),(22,'2015-02-15 16:18:01','1','Строительство домов и сооружений',2,'Изменен name.',7,1),(23,'2015-02-15 16:18:30','6','Монтаж электрического \"теплого пола\"',1,'',8,1),(24,'2015-02-15 16:21:28','1','Строительство.Монтажные работы',2,'Изменен name.',7,1),(25,'2015-02-15 16:24:31','10','Монтаж охранных систем',1,'',7,1),(26,'2015-02-15 16:25:24','7','Установка светильников, розеток, выключателей',1,'',8,1),(27,'2015-02-15 16:26:54','8','Установка охранной сигнализации',1,'',8,1),(28,'2015-02-15 16:27:01','10','Монтаж охранных систем.Видеонаблюдение',2,'Изменен name.',7,1),(29,'2015-02-15 16:27:47','11','Сантехнические работы',1,'',7,1),(30,'2015-02-15 16:30:14','12','Вентиляция. Кондиционирование',1,'',7,1),(31,'2015-02-15 16:30:32','9','Установка видеонаблюдения',1,'',8,1),(32,'2015-02-15 16:32:12','10','Установка системы контроля доступа',1,'',8,1),(33,'2015-02-15 16:32:56','11','Системы автоматизации. \"Умный дом\"',1,'',8,1),(34,'2015-02-15 16:34:09','12','Ремонт под \"ключ\"',1,'',8,1),(35,'2015-02-15 16:34:57','13','Шпаклевочные работы',1,'',8,1),(36,'2015-02-15 16:35:46','14','Плиточные и облицовочные работы',1,'',8,1),(37,'2015-02-15 16:37:09','15','Монтаж и устройство потолков',1,'',8,1),(38,'2015-02-15 16:42:53','1','Строительство. Монтажные работы',2,'Изменен name.',7,1),(39,'2015-02-15 16:43:01','10','Монтаж охранных систем. Видеонаблюдение',2,'Изменен name.',7,1),(40,'2015-02-15 16:50:08','16','Монтаж ворот, заборов, ролетов',1,'',8,1),(41,'2015-02-15 16:51:01','17','Монтаж систем вентиляции',1,'',8,1),(42,'2015-02-15 16:51:31','18','Проектирование систем кондиционирования и вентиляции',1,'',8,1),(43,'2015-02-15 16:52:26','19','Монтаж систем кондиционирования',1,'',8,1),(44,'2015-02-15 16:53:42','20','Монтаж водопровода, канализации в помещении',1,'',8,1),(45,'2015-02-15 16:54:06','21','Установка и подключение сантехники',1,'',8,1),(46,'2015-02-15 16:54:15','22','Установка окон, дверей. Остекление балконов',1,'',8,1),(47,'2015-02-15 16:54:26','23','Бурение и устройство скважин',1,'',8,1),(48,'2015-02-15 16:54:50','24','Наружний монтаж водопровада, канализации',1,'',8,1),(49,'2015-02-15 16:55:15','25','Установка систем фильтрации воды',1,'',8,1),(50,'2015-02-15 16:55:39','26','Септик. Системы автономной канализации',1,'',8,1),(51,'2015-02-15 16:59:13','27','Штукатурные работы',1,'',8,1),(52,'2015-02-15 17:00:48','28','Прочистка канализации',1,'',8,1),(53,'2015-02-15 17:00:52','29','Декоративная штукатурка',1,'',8,1),(54,'2015-02-15 17:01:21','30','Работа с гипсокартоном',1,'',8,1),(55,'2015-02-15 17:02:31','31','Укладка, настил полов. Стяжка пола',1,'',8,1),(56,'2015-02-15 17:02:38','32','Ландшафтный дизайн',1,'',8,1),(57,'2015-02-15 17:03:09','33','Малярные работы',1,'',8,1),(58,'2015-02-15 17:03:17','34','Декоративные водопады, водоемы. Фонтаны',1,'',8,1),(59,'2015-02-15 17:03:58','35','Отделка балконов',1,'',8,1),(60,'2015-02-15 17:04:00','36','Детские площадки',1,'',8,1),(61,'2015-02-15 17:04:26','37','Услуги по уходу за участком',1,'',8,1),(62,'2015-02-15 17:04:37','38','Художественная роспись. Фрески',1,'',8,1),(63,'2015-02-15 17:04:48','39','Озеленение',1,'',8,1),(64,'2015-02-15 17:05:27','40','Укладка тротуарной плитки, дорожек',1,'',8,1),(65,'2015-02-15 17:05:50','41','Автоматический полив',1,'',8,1),(66,'2015-02-15 17:05:51','13','Мелкий бытовой ремонт. \"Муж на час\"',1,'',7,1),(67,'2015-02-15 17:15:18','42','Монтаж и строительство бассейнов',1,'',8,1),(68,'2015-02-15 17:16:09','5','Кровельные работы',3,'',7,1),(69,'2015-02-15 17:16:44','1','Минск',1,'',12,1),(70,'2015-02-15 17:23:32','43','Мелкий бытовой ремонт',1,'',8,1),(71,'2015-02-15 17:25:08','1','ИП Касько В.Я.',1,'',13,1),(72,'2015-02-15 17:25:09','44','Газоснабжение',1,'',8,1),(73,'2015-02-15 17:25:40','45','Прокладка и монтаж систем отопления',1,'',8,1),(74,'2015-02-15 17:26:12','46','Обслуживание, ремонт отопления',1,'',8,1),(75,'2015-02-15 17:26:34','47','Система теплотрасс',1,'',8,1),(76,'2015-02-15 17:27:09','48','Проектирование отопления',1,'',8,1),(77,'2015-02-15 17:27:34','49','Монтаж котельного оборудования',1,'',8,1),(78,'2015-02-15 17:27:56','50','Монтаж и устройство водяных \"теплых полов\"',1,'',8,1),(79,'2015-02-15 17:36:34','51','Аренда строительной техники',1,'',8,1),(80,'2015-02-15 17:37:32','52','Аренда спецтехники',1,'',8,1),(81,'2015-02-15 17:38:24','53','Аренда строительного инструмента',1,'',8,1),(82,'2015-02-15 17:39:03','54','Аренда строительного оборудования',1,'',8,1),(83,'2015-02-15 17:39:43','55','Аренда опалубки',1,'',8,1),(84,'2015-02-15 17:41:20','56','Строительство домов, коттеджей, дач под \"ключ\"',1,'',8,1),(85,'2015-02-15 17:41:38','57','Строительство каркасных домов',1,'',8,1),(86,'2015-02-15 17:42:35','58','Промышленные, торговые здания и сооружения',1,'',8,1),(87,'2015-02-15 17:43:02','59','Строительство домов из блоков и кирпича',1,'',8,1),(88,'2015-02-15 17:43:20','60','Строительство деревянных домов и срубов',1,'',8,1),(89,'2015-02-15 17:43:39','61','Строительство беседок',1,'',8,1),(90,'2015-02-15 17:44:04','2','ИП Кочерго  ',1,'',13,1),(91,'2015-02-15 17:44:06','62','Кровельные работы',1,'',8,1),(92,'2015-02-15 17:48:25','63','Кладка кирпича,стеновых блоков и плит',1,'',8,1),(93,'2015-02-15 17:48:27','2','Брест',1,'',12,1),(94,'2015-02-15 17:48:55','64','Устройство фундамента. Работы с бетоном',1,'',8,1),(95,'2015-02-15 17:49:17','65','Сварочные работы',1,'',8,1),(96,'2015-02-15 17:56:09','3','ИП Кисляк Д.В',1,'',13,1),(97,'2015-02-15 17:57:59','66','Камины. Печи. Дымоходы',1,'',8,1),(98,'2015-02-15 17:58:15','67','Строительство бани, сауны',1,'',8,1),(99,'2015-02-15 17:58:29','68','Фасадные работы',1,'',8,1),(100,'2015-02-15 17:58:45','3','Гомель',1,'',12,1),(101,'2015-02-15 17:59:08','69','Алмазное сверление. Резка. Демонтажные работы',1,'',8,1),(102,'2015-02-15 17:59:27','70','Изоляционные работы',1,'',8,1),(103,'2015-02-15 17:59:42','71','Монтаж и отделка лестниц',1,'',8,1),(104,'2015-02-15 17:59:59','72','Работа с металлом. Ковка',1,'',8,1),(105,'2015-02-15 18:00:17','73','Строительство бассейнов',1,'',8,1),(106,'2015-02-15 18:14:24','4','ООО\"ТрейдОМплюс\"',1,'',13,1),(107,'2015-02-15 18:20:01','5','ИП Хомко',1,'',13,1),(108,'2015-02-15 18:21:50','4','Клининговые услуги',2,'Изменен name.',7,1),(109,'2015-02-15 18:23:36','74','Уборка помещений',1,'',8,1),(110,'2015-02-15 18:23:47','6','Cвит Хоум',1,'',13,1),(111,'2015-02-15 18:24:03','75','Вывоз строительного мусора',1,'',8,1),(112,'2015-02-15 18:24:17','6','Cвит Хоум',2,'Изменен description.',13,1),(113,'2015-02-15 18:24:32','2','ИП Кочерго  ',2,'Изменен type.',13,1),(114,'2015-02-15 18:24:37','76','Мойка фасадов',1,'',8,1),(115,'2015-02-15 18:24:38','3','ИП Кисляк Д.В',2,'Изменен type.',13,1),(116,'2015-02-15 18:25:18','77','Аренда инструмента и оборудования',1,'',8,1),(117,'2015-02-15 18:26:56','7','ИП Небышинец  ',1,'',13,1),(118,'2015-02-15 18:27:03','7','ИП Небышинец  ',2,'Изменен type.',13,1),(119,'2015-02-16 12:59:49','8','\"РеМастер\" ИП Нестеров А.А.  ',1,'',13,1),(120,'2015-02-16 13:08:51','4','--------',1,'',12,1),(121,'2015-02-16 13:12:38','9',' ИП Деткович',1,'',13,1),(122,'2015-02-16 13:13:33','10','Dekora  ',1,'',13,1),(123,'2015-02-16 13:17:55','11','Студия Декора \"Яхорс\"  ',1,'',13,1),(124,'2015-02-16 13:19:00','12','ИП Дударев М.М',1,'',13,1),(125,'2015-02-16 13:23:55','13','Центр бытовых услуг 124',1,'',13,1),(126,'2015-02-16 13:26:42','14','ИП Будай И А  ',1,'',13,1),(127,'2015-02-16 13:28:37','15',' ООО \"ПромЭлектроСтройМонтаж\"  ',1,'',13,1),(128,'2015-02-16 13:31:03','16','Ип Яскевич  ',1,'',13,1),(129,'2015-02-16 13:31:40','17','ИП Кошкаров  ',1,'',13,1),(130,'2015-02-16 13:31:51','16','Ип Яскевич  ',2,'Ни одно поле не изменено.',13,1),(131,'2015-02-16 13:31:57','15',' ООО \"ПромЭлектроСтройМонтаж\"  ',2,'Ни одно поле не изменено.',13,1),(132,'2015-02-16 13:32:10','14','ИП Будай И.А.  ',2,'Изменен name.',13,1),(133,'2015-02-16 13:32:26','13','Центр бытовых услуг 124',2,'Изменен type.',13,1),(134,'2015-02-16 13:32:40','12','ИП Дударев М.М',2,'Изменен type.',13,1),(135,'2015-02-16 13:32:50','11','Студия Декора \"Яхорс\"  ',2,'Ни одно поле не изменено.',13,1),(136,'2015-02-16 13:32:59','9',' ИП Деткович',2,'Изменен type.',13,1),(137,'2015-02-16 13:35:41','18','ИП Манулик П.И.  ',1,'',13,1),(138,'2015-02-16 13:40:44','19','ИП Филиппович А.А.  ',1,'',13,1),(139,'2015-02-16 13:44:34','20','ИП Лоншаков  ',1,'',13,1),(140,'2015-02-16 14:11:41','21','ИП Касько В.Я.  ',1,'',13,1),(141,'2015-02-16 14:14:44','22','ИП ИВАНОВ ',1,'',13,1),(142,'2015-02-16 14:20:38','23','ВВК-Системсгрупп  ',1,'',13,1),(143,'2015-02-19 06:33:45','24','TestOrganization',1,'',13,1),(144,'2015-02-20 11:40:05','25','ИП Юркевич В.А.  ',1,'',13,1),(145,'2015-02-20 11:42:33','26','Ип Селицкая М.С.  ',1,'',13,1),(146,'2015-02-20 11:45:27','27','ОДО \"Фатон\"  ',1,'',13,1),(147,'2015-02-20 11:48:48','28','ИП Илюкович Д.К.  ',1,'',13,1),(148,'2015-02-20 11:56:45','29','Ип Леухин  ',1,'',13,1),(149,'2015-02-20 11:59:21','30','ИП Демчук  ',1,'',13,1),(150,'2015-02-20 11:59:36','31','ИП Демчук  ',1,'',13,1),(151,'2015-02-20 12:00:02','30','ИП Демчук  ',3,'',13,1),(152,'2015-02-20 12:47:55','32','ИП Ляшко  ',1,'',13,1),(153,'2015-02-22 07:18:52','29','Ип Леухин  ',2,'Изменен job_types.',13,1),(154,'2015-02-22 07:19:13','29','Ип Леухин  ',2,'Изменен job_types.',13,1),(155,'2015-02-22 14:52:10','7','Навесные потолки',3,'',10,1),(156,'2015-02-22 14:52:10','6','Навесные потолки',3,'',10,1),(157,'2015-02-22 14:52:10','5','Навесные потолки',3,'',10,1),(158,'2015-02-22 14:52:10','4','Навесные потолки',3,'',10,1),(159,'2015-02-22 14:52:10','3','Навесные потолки',3,'',10,1),(160,'2015-02-22 14:52:10','2','Навесные потолки',3,'',10,1),(161,'2015-02-22 14:52:10','1','Навесные потолки',3,'',10,1),(162,'2015-02-22 15:41:58','12','zxcvbcvb',3,'',10,1),(163,'2015-02-22 15:41:58','11','zxcvbcvb',3,'',10,1),(164,'2015-02-22 15:41:58','10','zxcvbcvb',3,'',10,1),(165,'2015-02-24 21:56:31','33','Альциона УП',1,'',13,1),(166,'2015-02-24 21:58:45','33','Альциона УП',2,'Изменен type.',13,1),(167,'2015-02-24 22:00:39','34','Спецналадка ОДО',1,'',13,1),(168,'2015-02-24 22:01:27','78','Установка пожарной сигнализации',1,'',8,1),(169,'2015-02-24 22:01:50','34','Спецналадка ОДО',2,'Изменен job_types.',13,1),(170,'2015-02-24 22:05:16','35','Гексаэдр УП',1,'',13,1),(171,'2015-02-24 22:06:58','36','ИП Кравцов',1,'',13,1),(172,'2015-02-24 22:07:38','79','Видеонаблюдение',1,'',8,1),(173,'2015-02-24 22:12:15','37','«ArchLine студия»',1,'',13,1),(174,'2015-02-24 22:17:20','38','ЧТУП «КОСКА»',1,'',13,1),(175,'2015-02-24 22:21:59','39','ООО «Вестерос»',1,'',13,1),(176,'2015-02-24 22:26:36','40','УП «PrivateHouse»',1,'',13,1),(177,'2015-02-24 22:31:37','80','Техническое обследование зданий',1,'',8,1),(178,'2015-02-24 22:31:58','8','Архитектура. Дизайн. Проектирование. Оценка',2,'Изменен name.',7,1),(179,'2015-02-24 22:39:11','41','РУП «Белорусский институт строительного проектирования» Управления делами Президента РБ',1,'',13,1),(180,'2015-02-24 22:41:51','42','НПЧУП «СТРОЙРЕКОНСТРУКЦИЯ»',1,'',13,1),(181,'2015-02-24 22:45:14','43','Государственное предприятие \"Институт НИПТИС\" им. Атаева С.С.',1,'',13,1),(182,'2015-02-24 22:46:13','44','ООО «ИНГпроект»',1,'',13,1),(183,'2015-02-24 22:48:09','45','ОДО \"БРЕСТСКАЯ ИНЖЕНЕРНАЯ ГРУППА\"',1,'',13,1),(184,'2015-02-28 15:19:49','46',' ИП Федорович Д.А.',1,'',13,1),(185,'2015-03-10 17:40:41','1','Промышленное строительство',1,'',14,1),(186,'2015-03-10 17:40:47','2','Частное строительство',1,'',14,1),(187,'2015-03-11 19:18:41','47','ИП Жардецкий  ',1,'',13,1),(188,'2015-03-11 19:19:27','47','ИП Жардецкий  ',2,'Изменен spec.',13,1),(189,'2015-03-11 19:20:54','48','ЧСУП\"Олвиданастрой\"  ',1,'',13,1),(190,'2015-03-11 19:30:45','81','Облицовка панелями',1,'',8,1),(191,'2015-03-11 19:30:59','49','ИП Олесюк А.Р.  ',1,'',13,1),(192,'2015-03-11 19:32:25','49','ИП Олесюк А.Р.  ',2,'Изменен logo.',13,1),(193,'2015-03-11 19:36:23','50','ИП Игнатчик',1,'',13,1),(194,'2015-03-11 19:37:06','50','ИП Игнатчик',2,'Ни одно поле не изменено.',13,1),(195,'2015-03-11 19:38:48','51','ИП Кондратенко',1,'',13,1),(196,'2015-03-11 19:43:16','52','ИП Налетко С.В',1,'',13,1),(197,'2015-03-11 19:45:46','53','ООО \"ПромЭлектроСтройМонтаж\"  ',1,'',13,1),(198,'2015-03-11 19:49:01','54','ЧТУП «БетонДомСтрой»',1,'',13,1),(199,'2015-03-11 19:54:17','55','Elektrika.By  ',1,'',13,1),(200,'2015-03-11 19:57:33','56','\"РеМастер\" ИП Нестеров А.А',1,'',13,1),(201,'2015-03-11 20:01:16','57','Astorcom',1,'',13,1),(202,'2015-03-11 20:02:28','58','ИП Коливанов',1,'',13,1),(203,'2015-03-11 20:07:00','59','ИП Леухин',1,'',13,1),(204,'2015-03-11 20:09:52','60','ООО \"ОТДЕЛКА И САНТЕХНИКА\"',1,'',13,1),(205,'2015-03-11 20:14:17','61','ИП Ворона В.С. ',1,'',13,1),(206,'2015-03-11 20:15:23','62','ИП Романенко О.Л. ',1,'',13,1),(207,'2015-03-11 20:16:05','62','ИП Романенко О.Л. ',2,'Изменен logo.',13,1),(208,'2015-03-11 20:17:17','63','Электромонтаж',1,'',13,1),(209,'2015-03-11 20:19:48','64','ИП Апацкий К.В.  ',1,'',13,1),(210,'2015-03-11 20:21:22','65','ООО \"Ординем\"',1,'',13,1),(211,'2015-03-11 20:23:42','66','Электрика',1,'',13,1),(212,'2015-03-11 20:29:23','67','ИП Муравский',1,'',13,1),(213,'2015-03-11 20:32:47','68','ЧСТУП \"Ричеф Групп\" ',1,'',13,1),(214,'2015-03-11 20:36:09','69','ИП Манулик П.И.',1,'',13,1),(215,'2015-03-11 20:39:45','70','ИП Макаревич',1,'',13,1),(216,'2015-03-20 04:44:41','24','TestOrganization',2,'Changed job_types and spec.',13,1),(217,'2015-04-01 12:11:12','71','ИП Витти Авто  ',1,'',13,1),(218,'2015-04-01 12:14:30','72','Ип Селицкая М.С.  ',1,'',13,1),(219,'2015-04-01 12:17:56','73','ИП Демчук  ',1,'',13,1),(220,'2015-04-01 12:22:31','74','Частное Предприятие \"ТермоСтар\"  ',1,'',13,1),(221,'2015-04-01 12:26:14','75','Чуп\"Свитхоум\"  ',1,'',13,1),(222,'2015-04-01 12:31:20','76','ИП Дударев М.М.  ',1,'',13,1),(223,'2015-04-01 12:34:46','77','ЧЕЛКСТРОЙ  ',1,'',13,1),(224,'2015-04-01 12:38:21','78','БелЛайтСтрой  ',1,'',13,1),(225,'2015-04-01 12:44:16','79','Unipron  ',1,'',13,1),(226,'2015-04-01 12:51:57','80','ВИРА ООО ',1,'',13,1),(227,'2015-04-01 12:54:56','81','ВИРА ООО  ',1,'',13,1),(228,'2015-04-01 13:08:19','82','ООО \"СтетКом\"  ',1,'',13,1),(229,'2015-04-01 13:11:43','83','SmartSystems  ',1,'',13,1),(230,'2015-04-01 13:14:45','84','ЧЕЛКСТРОЙ  ',1,'',13,1),(231,'2015-04-01 13:17:38','85','ИП Лисанов С.Н.  ',1,'',13,1),(232,'2015-04-01 13:30:19','86','ООО «Компания СТРОЙМИР»  ',1,'',13,1),(233,'2015-04-01 13:32:57','87','ЧП \"Аксата\"  ',1,'',13,1),(234,'2015-04-01 13:36:07','88','ИП Ляшко  ',1,'',13,1),(235,'2015-04-01 13:39:00','89','ЧТУП \"Гардо-Системз\"  ',1,'',13,1),(236,'2015-04-01 13:42:52','90','ООО \"Партнерконтрактсрой\"  ',1,'',13,1),(237,'2015-04-01 13:46:08','91','ЧУП \"Мегашоп\"  ',1,'',13,1),(238,'2015-04-01 13:48:28','92','Частное Предприятие \"Гардо-Системз\"  ',1,'',13,1),(239,'2015-04-01 13:50:49','93','ВИРА ООО  ',1,'',13,1),(240,'2015-04-01 13:53:03','94','ИП Лисанов С.Н.  ',1,'',13,1),(241,'2015-04-03 19:47:27','95','ИП Гришан А.С.  ',1,'',13,1),(242,'2015-04-03 19:59:06','96','ООО \"Нэвиум\"  ',1,'',13,1),(243,'2015-04-05 13:45:19','97','Тестовая организация',1,'',13,1),(244,'2015-04-05 13:59:01','97','Тестовая организация',3,'',13,1),(245,'2015-04-05 14:09:50','98','Тестовая организация',1,'',13,1),(246,'2015-04-05 14:13:35','99','TestOrganization',1,'',13,1),(247,'2015-04-05 14:14:01','1','Work in Gomel',1,'',15,1),(248,'2015-04-05 14:14:15','2','Work In Minsk',1,'',15,1),(249,'2015-04-05 14:14:37','1','media/TestOrganization/Work%20in%20Gomel/367603_1024x700_time-1427452644.JPG',1,'',16,1),(250,'2015-04-05 14:14:45','2','media/TestOrganization/Work%20in%20Gomel/367604_1024x700_time-1427452644.JPG',1,'',16,1),(251,'2015-04-05 14:14:56','3','media/TestOrganization/Work%20in%20Gomel/367605_1024x700_time-1427452644.JPG',1,'',16,1),(252,'2015-04-05 14:15:08','4','media/TestOrganization/Work%20in%20Gomel/367606_1024x700_time-1427452644.JPG',1,'',16,1),(253,'2015-04-05 14:15:29','5','media/TestOrganization/Work%20in%20Gomel/367607_1024x700_time-1427452644.JPG',1,'',16,1),(254,'2015-04-05 14:15:40','6','media/TestOrganization/Work%20In%20Minsk/352217_1024x700_time-1425379187.jpg',1,'',16,1),(255,'2015-04-05 14:15:48','7','media/TestOrganization/Work%20In%20Minsk/352218_1024x700_time-1425379187.jpg',1,'',16,1),(256,'2015-04-05 14:15:56','8','media/TestOrganization/Work%20In%20Minsk/352219_1024x700_time-1425379187.jpg',1,'',16,1),(257,'2015-04-05 14:16:04','9','media/TestOrganization/Work%20In%20Minsk/352220_1024x700_time-1425379187.jpg',1,'',16,1),(258,'2015-04-05 14:18:48','24','TestOrganization',3,'',13,1),(259,'2015-04-21 12:03:32','1','MyTestArticle',1,'',17,1),(260,'2015-04-21 12:04:32','99','TestOrganization',2,'Changed logo.',13,1);
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
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'Категория работ','remont','workcategory'),(8,'Вид работы','remont','worktype'),(9,'Зарегистрированный пользователь','remont','userprofile'),(10,'Предложение по работе','remont','jobsuggestion'),(11,'Фото или видео работы мастера','remont','usermedia'),(12,'Город','remont','city'),(13,'Организация','remont','organizationprofile'),(14,'Специализация','remont','workspec'),(15,'Фотоальбом организации','remont','workphotoalbum'),(16,'Фотография выполненной работы','remont','workphoto'),(17,'Статья о стройке и ремонте','remont','article');
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
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-02-14 08:28:19'),(2,'auth','0001_initial','2015-02-14 08:28:20'),(3,'admin','0001_initial','2015-02-14 08:28:20'),(4,'sessions','0001_initial','2015-02-14 08:28:20'),(5,'remont','0001_initial','2015-02-14 08:32:27'),(6,'remont','0002_city_organizationprofile','2015-02-15 16:38:25'),(7,'remont','0003_auto_20150215_1750','2015-02-15 16:38:26'),(8,'remont','0004_remove_worktype_icon','2015-02-15 16:38:26'),(9,'remont','0005_auto_20150215_1919','2015-02-15 16:38:26'),(10,'remont','0006_auto_20150215_1922','2015-02-15 16:38:26'),(11,'remont','0007_auto_20150215_2024','2015-02-15 17:37:59'),(12,'remont','0008_auto_20150216_1941','2015-02-16 17:25:53'),(13,'remont','0009_auto_20150216_1956','2015-02-16 17:25:53'),(14,'remont','0010_auto_20150216_2004','2015-02-16 17:25:53'),(15,'remont','0011_auto_20150216_2010','2015-02-16 17:25:54'),(16,'remont','0012_auto_20150222_1020','2015-02-22 15:40:38'),(17,'remont','0013_workspec','2015-03-10 17:38:30'),(18,'remont','0014_auto_20150310_0759','2015-03-10 17:38:31'),(19,'remont','0015_auto_20150310_0813','2015-03-10 17:38:32'),(20,'remont','0016_remove_organizationprofile_type','2015-03-10 17:38:33'),(21,'remont','0017_auto_20150320_0745','2015-04-05 13:27:14'),(22,'remont','0018_organizationprofile_password','2015-04-05 13:27:15'),(23,'remont','0019_organizationprofile_login','2015-04-05 13:27:16'),(24,'remont','0020_workphotoalbum','2015-04-05 13:27:16'),(25,'remont','0021_workphoto','2015-04-05 13:27:17'),(26,'remont','0022_auto_20150405_1655','2015-04-05 14:07:22'),(27,'remont','0023_article','2015-04-21 11:52:13'),(28,'remont','0024_auto_20150421_1244','2015-04-21 11:52:13');
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('oxopqzy8v52cp0pjoy97lqug9egxwj7v','MjM3ZTAzODk1M2Q3NDU0M2Y1MWU5OWIzNjNhNDYwZDM5MzdkNTdiODp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzODdiMDRiMWU2OWYwZTlhNjI5MWI3N2ZiYmExODVkM2JiM2JjMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-02-28 08:33:47'),('nxszf97rhipok8vecwpg9y0r2gf8pzjr','MjM3ZTAzODk1M2Q3NDU0M2Y1MWU5OWIzNjNhNDYwZDM5MzdkNTdiODp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzODdiMDRiMWU2OWYwZTlhNjI5MWI3N2ZiYmExODVkM2JiM2JjMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-02-28 08:59:06'),('98s9uews5977dugy68zg1uz2t8z9grow','MjM3ZTAzODk1M2Q3NDU0M2Y1MWU5OWIzNjNhNDYwZDM5MzdkNTdiODp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzODdiMDRiMWU2OWYwZTlhNjI5MWI3N2ZiYmExODVkM2JiM2JjMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-03-01 14:45:25'),('6l0smzgpksidk04s69cj3833yp0ezaqb','MjM3ZTAzODk1M2Q3NDU0M2Y1MWU5OWIzNjNhNDYwZDM5MzdkNTdiODp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzODdiMDRiMWU2OWYwZTlhNjI5MWI3N2ZiYmExODVkM2JiM2JjMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-03-01 16:31:07'),('bqd0tjqviux4r4yxrssveajanca4iaz0','MjM3ZTAzODk1M2Q3NDU0M2Y1MWU5OWIzNjNhNDYwZDM5MzdkNTdiODp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzODdiMDRiMWU2OWYwZTlhNjI5MWI3N2ZiYmExODVkM2JiM2JjMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-03-03 08:53:23'),('zn9yqgx87k0j6da5o2dgfoo6yfogqzs9','MjM3ZTAzODk1M2Q3NDU0M2Y1MWU5OWIzNjNhNDYwZDM5MzdkNTdiODp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzODdiMDRiMWU2OWYwZTlhNjI5MWI3N2ZiYmExODVkM2JiM2JjMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-03-04 05:22:45'),('yz5szzb7at6nqno9f76msrl0t8lxft20','MjM3ZTAzODk1M2Q3NDU0M2Y1MWU5OWIzNjNhNDYwZDM5MzdkNTdiODp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzODdiMDRiMWU2OWYwZTlhNjI5MWI3N2ZiYmExODVkM2JiM2JjMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-03-05 20:50:56'),('o0p88w437e78rkoe1edj8remkddgw92s','MjM3ZTAzODk1M2Q3NDU0M2Y1MWU5OWIzNjNhNDYwZDM5MzdkNTdiODp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzODdiMDRiMWU2OWYwZTlhNjI5MWI3N2ZiYmExODVkM2JiM2JjMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-03-08 07:18:00'),('as3vhgylm05idpu4d4cztn9v6y0b3lz3','MjM3ZTAzODk1M2Q3NDU0M2Y1MWU5OWIzNjNhNDYwZDM5MzdkNTdiODp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzODdiMDRiMWU2OWYwZTlhNjI5MWI3N2ZiYmExODVkM2JiM2JjMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-03-14 15:10:50'),('b2dvdux3b7shekcaerwfdo7tsjp80ifc','MjM3ZTAzODk1M2Q3NDU0M2Y1MWU5OWIzNjNhNDYwZDM5MzdkNTdiODp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzODdiMDRiMWU2OWYwZTlhNjI5MWI3N2ZiYmExODVkM2JiM2JjMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-03-17 18:49:50'),('ctmbo87psa94zxpozj5q8hyjn5rprbhh','MjM3ZTAzODk1M2Q3NDU0M2Y1MWU5OWIzNjNhNDYwZDM5MzdkNTdiODp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzODdiMDRiMWU2OWYwZTlhNjI5MWI3N2ZiYmExODVkM2JiM2JjMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-03-24 08:43:44'),('qln40ljsz1drjzqjelrm7m8bdid6ffk5','MjM3ZTAzODk1M2Q3NDU0M2Y1MWU5OWIzNjNhNDYwZDM5MzdkNTdiODp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzODdiMDRiMWU2OWYwZTlhNjI5MWI3N2ZiYmExODVkM2JiM2JjMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-03-24 17:39:43'),('8yseac6jj1enmnk8sab93vuya3xo1lnv','MmJmMWY1Y2M3NDUwNGRlYWE4YTNkYzkxM2U2NjY1OTlkY2JkZTBlYzp7fQ==','2015-03-25 12:21:16'),('qohhi1q2pfzo86x1qccfbopphxz6aci4','MjM3ZTAzODk1M2Q3NDU0M2Y1MWU5OWIzNjNhNDYwZDM5MzdkNTdiODp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzODdiMDRiMWU2OWYwZTlhNjI5MWI3N2ZiYmExODVkM2JiM2JjMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-03-25 19:13:12'),('t3locnfgo6cybgq2k4ue9mf1bg98cuvv','MjM3ZTAzODk1M2Q3NDU0M2Y1MWU5OWIzNjNhNDYwZDM5MzdkNTdiODp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzODdiMDRiMWU2OWYwZTlhNjI5MWI3N2ZiYmExODVkM2JiM2JjMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-04-03 04:29:57'),('9nicytfynggilt546ucuwdjslh8xzt3f','MjM3ZTAzODk1M2Q3NDU0M2Y1MWU5OWIzNjNhNDYwZDM5MzdkNTdiODp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzODdiMDRiMWU2OWYwZTlhNjI5MWI3N2ZiYmExODVkM2JiM2JjMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-04-15 11:33:04'),('l3n9yt1tvfuihuzq7ndwizt7ba2dpw1h','MTIwYjFjZWI5YWNjNjQ0ZWQxMzk2OTY3MjIyNGNmMGUyNWE4MzJjNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzODdiMDRiMWU2OWYwZTlhNjI5MWI3N2ZiYmExODVkM2JiM2JjMTIiLCJvcmdfaWQiOjk3LCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2015-04-19 13:45:50'),('3cis1rqkcz8p2u1xordgnq41u8wq4t20','MjM3ZTAzODk1M2Q3NDU0M2Y1MWU5OWIzNjNhNDYwZDM5MzdkNTdiODp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzODdiMDRiMWU2OWYwZTlhNjI5MWI3N2ZiYmExODVkM2JiM2JjMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-04-19 15:51:00'),('3fcvxflkyar7np4dp86s1l0i18c9fs8c','MjM3ZTAzODk1M2Q3NDU0M2Y1MWU5OWIzNjNhNDYwZDM5MzdkNTdiODp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzODdiMDRiMWU2OWYwZTlhNjI5MWI3N2ZiYmExODVkM2JiM2JjMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-04-24 12:07:04'),('vaw1qq29dgdstdkb9kxczugeffewm1yc','MjM3ZTAzODk1M2Q3NDU0M2Y1MWU5OWIzNjNhNDYwZDM5MzdkNTdiODp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzODdiMDRiMWU2OWYwZTlhNjI5MWI3N2ZiYmExODVkM2JiM2JjMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-05-05 11:58:10');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remont_article`
--

DROP TABLE IF EXISTS `remont_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remont_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `date_created` datetime,
  `date_modified` datetime,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remont_article`
--

LOCK TABLES `remont_article` WRITE;
/*!40000 ALTER TABLE `remont_article` DISABLE KEYS */;
INSERT INTO `remont_article` VALUES (1,'MyTestArticle','<p style=\"text-align: center;\"><span style=\"font-size:24px\"><strong>Заголовок статьи</strong></span></p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:24px; line-height:38.4000015258789px\"><span style=\"font-size:14px\">Таблица:</span></span></p>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>dgsdfg</td>\r\n			<td>asdgsdga</td>\r\n			<td>asdgasdg</td>\r\n		</tr>\r\n		<tr>\r\n			<td>asdgasdg</td>\r\n			<td>asdgasdg</td>\r\n			<td>asdgsdg</td>\r\n		</tr>\r\n		<tr>\r\n			<td>asdgsdg</td>\r\n			<td>asdgasdg</td>\r\n			<td>asdgasdg</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:14px\"><span style=\"line-height:38.4000015258789px\">Рисунок:<img alt=\"\" src=\"media/ckeditor_uploads/2015/04/21/367603_1024x700_time-1427452644.JPG\" /></span></span></p>\r\n','2015-04-21 12:03:32','2015-04-21 12:03:32');
/*!40000 ALTER TABLE `remont_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remont_city`
--

DROP TABLE IF EXISTS `remont_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remont_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remont_city`
--

LOCK TABLES `remont_city` WRITE;
/*!40000 ALTER TABLE `remont_city` DISABLE KEYS */;
INSERT INTO `remont_city` VALUES (1,'Минск'),(2,'Брест'),(3,'Гомель'),(4,'--------');
/*!40000 ALTER TABLE `remont_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remont_jobsuggestion`
--

DROP TABLE IF EXISTS `remont_jobsuggestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remont_jobsuggestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_header` varchar(50) NOT NULL,
  `contact_name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `phone` varchar(25) NOT NULL,
  `email` varchar(75) NOT NULL,
  `date_created` datetime NOT NULL,
  `job_type_id` int(11),
  PRIMARY KEY (`id`),
  KEY `remont_jobsuggestion_d1803079` (`job_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remont_jobsuggestion`
--

LOCK TABLES `remont_jobsuggestion` WRITE;
/*!40000 ALTER TABLE `remont_jobsuggestion` DISABLE KEYS */;
INSERT INTO `remont_jobsuggestion` VALUES (16,'','','            ','','','2015-04-03 19:34:51',NULL),(15,'Положить плитку в ванной','Юрий','Положить плитку в ванной комнате, размер комнаты 24 м.кв.  ','+375298652315','','2015-03-03 19:00:03',14),(13,'','','            ','','','2015-02-23 17:07:25',NULL),(14,'Укладка ламината','Юрий','Нужно положить ламинат в спальне 17 м.кв, демонтаж старого пола и стяжка не требуется, пол ровный. Готов заплатить по 2$ за м.кв.','+375298268267','urabrest1@mail.ru','2015-02-23 19:54:43',31),(9,'Поклеить обои','Сергей','Поклеить обои в прихожей квартиры            ','(8029)-1492050','naralenkov2010@gmail.com','2015-02-22 15:01:06',15),(8,'Навесные потолки в квартире','Сергей Викторович','Сделать навесные потолки в 2-х комнатах общей плохадью 30 м квадратных.             ','8029-1492050','naralenkov2010@gmail.com','2015-02-22 14:53:36',68);
/*!40000 ALTER TABLE `remont_jobsuggestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remont_organizationprofile`
--

DROP TABLE IF EXISTS `remont_organizationprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remont_organizationprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `description` longtext NOT NULL,
  `email` varchar(100) NOT NULL,
  `fax` varchar(40) NOT NULL,
  `landline_phone` varchar(30) NOT NULL,
  `mobile_phone` varchar(30) NOT NULL,
  `web_site` varchar(100) NOT NULL,
  `mobile_phone2` varchar(30) NOT NULL,
  `password` varchar(120) DEFAULT NULL,
  `login` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `remont_organizationprofile_c7141997` (`city_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remont_organizationprofile`
--

LOCK TABLES `remont_organizationprofile` WRITE;
/*!40000 ALTER TABLE `remont_organizationprofile` DISABLE KEYS */;
INSERT INTO `remont_organizationprofile` VALUES (1,'ИП Касько В.Я.','Пр.  Независимости','logos/110.png',1,'Мы предлагаем владельцам квартир заменить лампочку, навесить карниз , сушилку ,повесить люстру и выполнить прочую работу на дому качественнее и оперативнее, чем ЖЭСы. Работы проводятся в удобное для заказчика время. \r\n• \r\nРемонт, замена, перенос розеток и выключателей. \r\n• \r\nНавеска, подключение люстр, бра и светильников. \r\n• \r\nСборка, установка карнизов, сушилок, полок, ТВ кронштейнов . \r\n• \r\nУстановка столешниц, врезка моек, варочных панелей \r\n• \r\nЗамена и подключение смесителей. \r\n• \r\nЗамена дверных замков. Ремонт межкомнатных дверей. \r\n• \r\nСборка мебели. \r\n• \r\nНавеска и подключение бытовой техники. \r\n• \r\nУкладка ламината,линолеума,паркетной доски .Оплинтусовка напольных покрытий. \r\n• \r\nМонтаж потолков из ПВХ панели. Большинство работ имеют фиксированую цену ../\r\n\r\nВыезд на замер и оценку работы бесплатно \r\n\r\nЦена ........... 130000 ','','','80297020503','80447474183','','',NULL,NULL),(2,'ИП Кочерго  ','','logos/3133_4_1422609972_1893981_1.jpg',1,'Мелкий ремонт с гарантией качества и недорого. Подключение бытовой техники, ремонт сантехники, розеток, сборка мебели, навеска карнизов, люстр, ремонт замков, компьютерная помощь и др. Работы по дому, офису, квартире. \r\nБолее подробную информацию и цены смотрите на сайте компании.http://masternadomy.by \r\nЗвоните, пишите всем ответим!!!\r\n\r\n-Доставка материалов \r\n-Возможна оплата по б/налу ','','','','80296939396','http://masternadomy.by/','80292939595',NULL,NULL),(3,'ИП Кисляк Д.В','','',2,'Мастер на час \r\nНавеска карнизов, зеркал, полок и др. \r\nЗамена смесителей, моек, раковин, унитазов, бачков. \r\nУстановка люстр, замена розеток, выключателей. \r\nСборка-разборка, ремонт мебели. \r\nМонтаж, демонтаж плинтуса. \r\nУстановка роль-штор, римских штор, штор-плисе. \r\nВрезка замков. \r\nИ другие виды работ.\r\n\r\nВозможна оплата по б/налу \r\n','timon78@tut.by','','','8(029)8008118','','',NULL,NULL),(4,'ООО\"ТрейдОМплюс\"','проспект Октября 67 ,офис 3-5246000	','logos/3026_4_1419329391__.jpg',3,'\r\nПредлагаем услугу - Муж на час - любой мелкий бытовой ремонт в Гомеле, необходимость которого может возникнуть в домашних условиях и выполнять который, по каким-либо причинам Вы сами не хотите или не можете. По услуге муж на час - качество и быстрые сроки выполнения работ гарантированы! Окажем помощь в приобретении материалов и их доставке на дом. \r\n\r\n\r\n\r\nКраткий перечень работ по услуге - Муж на час \r\nМелкий бытовой ремонт на дому - оплата за время работы \r\nУстановка карнизов для штор и пр. \r\nСверление различного рода отверстий в стенах, полу и пр. \r\nНавес зеркал в ванную, коридор и др. места \r\nНавес шкафов и шкафчиков в помещения, ванную, туалет, коридор и др.\r\nИзготовление, замена или ремонт различных видов полок и полочек \r\nРемонт, установка, замена оконной и дверной фурнитуры \r\nРемонт, замена или врезка дверных замков на наружные и внутренние двери \r\nЗамена, вырезка стекол \r\nУстановка, замена, покраска плинтусов в квартирах, домах, офисах \r\nРемонт или замена кафельной плитки или других настенных, потолочных или напольных покрытий \r\nУстановка настенных, напольных креплений под домашние кинотеатры, домашнюю видео-аудио технику \r\nРемонт замков, врезка замков в двери, шкафы \r\nРаботы по ремонту, замене сантехники \r\nРемонт электрики \r\nи другие работы, мужская помощь по дому \r\n\r\n\r\nРасценки на выполнение ремонтных работ по услуге -Муж на час \r\nМы работаем по ценам средним и ниже средних по городу! В течении часа или другого часового или необходимого отрезка времени мастером - мужем на час могут быть выполнены сразу несколько видов ремонта или мелких работ по дому в которых требуется мужская помощь. Вы просто оплачиваете время работы вне зависимости от количества выполненных мужем на час задач.\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','topofice@mail.ru','','80232232269','+37529 129 18 53','','+37529 6290159',NULL,NULL),(5,'ИП Хомко','','',1,'Мы предлогаем мелкий бытовой ремонт любой сложности:мебельные работы; собрать кухню; навесить шкафы; навесить карниз, полку, зеркало, люстру, бра, светильник, кухонную вытяжку, ванный гарнитур, картину; врезка мойки, замена смесителя; монтаж крепления для ТВ панелей; монтаж плинтуса; прокладка ТВ кабеля и многое другое. Аккуратность и качество выполнения работ гарантируем. \r\n\r\n\r\nДоставка материалов ','','','','+37529 624 67 50','','+37529 691 83 21',NULL,NULL),(6,'Cвит Хоум','','',1,'Домашний мастер выполнит любой мелкий бытовой ремонт: навесить карниз; установка креплений под видео/аудио технику;ремонт мебели, навеска люстры, бра; замена замка; установка или замена светильников и др. ','','','','80291074176','','80297664176',NULL,NULL),(7,'ИП Небышинец  ','','',1,'\r\nОбратившись к нам, Вы получаете услуги и помощь профессиональных мастеров, вежливых и доброжелательных мужчин, способных решить Ваши проблемы! Не позволяйте мелочам портить Вам настроение! \r\n\r\nДомашний мастер приедет в удобное для Вас время! \r\n\r\nПри этом расценки Вас непременно порадуют, а качество работ гарантируем высокое! Мы уверены , что Вы останетесь довольны результатом работы и в дальнейшем будете рекомендовать своим знакомым и друзьям! Мастер на все руки у Вас дома! \r\n\r\nЗвоните, обращайтесь, \r\nвсегда поможем, подскажем и проконсультируем по всем вопросам! \r\n\r\nБытовой мега-ас на 1 мега-час (бытовые услуги): \r\n\r\n- монтаж люстры, карнизов, картин, кронштейнов для телевизоров, полок, шкафов, умывальников и т.п.; \r\n\r\n- замена дверного замка, крана, лампочек и т.д.; \r\n\r\n- установка жалюзей, розеток, выключателей, осветительных приборов; \r\n\r\n- сборка и ремонт мебели (офисной, компьютерной, детской, кухонной) и др. \r\n\r\nВыгодное предложение: \r\n\r\nРасценка: 1 час работы = 90 мин. = 140 000 руб.. Каждый последующий час работы = 60 мин. = 110 000 р\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу \r\n\r\nЦена ........... от 100 бел руб час ','','','','+375 29 23 29 387','','+375 25 755 29 04',NULL,NULL),(8,'\"РеМастер\" ИП Нестеров А.А.  ','ул. Притыцкого 112','logos/487_4_1360608236___..jpg',1,'\r\nВыезд мастера в удобное для Вас время. Квалифицированный подход к решению поставленной клиентом задачи. Фиксированная почасовая оплата услуг мастера. Установка бытовой техники и креплений, сборка мебели, установка карнизов, жалюзи, сушилок, столешниц, врезка встраиваемой техники. Другие ремонтные работы.\r\n\r\nДоставка материалов \r\n\r\nЦена ........... 85000 ','nesterov3105@mail.ru','','','+375 29 372 65 16','http://www.remaster.by/','',NULL,NULL),(9,' ИП Деткович','8-029-674-28-05','',4,'ИП Деткович Александр Иванович. \r\n\r\nВыполняем ремонт квартир, офисов, коттеджей и других помещений. \r\nОклейка различными видами обоев, шпатлевание различных поверхностей, окраска, оштукатуривание, отделка откосов, арок, монтаж пробки, потолочного плинтуса и другой широкий спектор услуг.А также различные подготовительные работы. \r\nКачество гарантируем . \r\nВозможность доставки материалов. Консультация по работе. Наличный и безналичный расчёт. \r\n\r\n\r\nИП Деткович \r\nУНП 191458178\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу \r\n','stroika.ale@yandex.by','','','8-029-674-28-05','','',NULL,NULL),(10,'Dekora  ','','',4,'РОСПИСЬ СТЕН - оформление стен жилых домов, офисов, кафе, ресторанов, клубов. \r\nОригинальный, необычный, яркий способ привнести ноту необычности в Ваш интерьер, сделать его незабываемым, вдохнуть в него свой ритм. Для каждого проекта разрабатывается уникальный эскиз, исходя из пожеланий заказчика и особенностей его интерьера. ','elena_mix_rh@mail.ru','','','+375445655421','','+375295161303',NULL,NULL),(11,'Студия Декора \"Яхорс\"  ','','logos/458_4_1360440325_130837541.jpg',1,'Фрески созданы на основе экологически чистых материалов и представляют собой полотна, которые с легкостью клеятся на любую основу. Особенностью Фресок является поверхность, полностью имитирующая старинную стену. Изготавливаются они художниками, и 90% работы выполняется вручную,начиная с выполнения эскиза и заканчивая покрытием защитным лаком. Фрески долговечны, не имеют ограничений в размере и не боятся воды.','yahors@live.ru','','','+375291780766','http://www.beldecor.by/','+37529-178-07-66',NULL,NULL),(12,'ИП Дударев М.М','','logos/70_4_1357582006_Uslugi_jelektrika_Minsk.jpg',1,'Навеска картин, карнизов, полочек, рейлингов, зеркал, кронштейнов, корпусной мебели в Минске и пригороде. \r\n\r\nМастера оказывают услугу навеска зеркал, карнизов (в том числе, на эркер) и других предметов интерьера и мебели. Оперативность и качество проведенных работ гарантировано высоким профессионализмом и многолетним опытом мастеров. \r\nМы предлагаем Вам следующий перечень услуг: \r\nНавеска полок \r\nНавеска карнизов \r\nНавеска зеркал \r\nНавеска крючков и рейлингов на кухне \r\nНавеска шкафчиков \r\nУстановка наборов для ванной и туалета \r\nСверление отверстий в бетоне и кафеле и др. \r\nНавеска полок и кронштейнов под ТВ \r\nНавеска полок и кронштейнов под микроволновую печь \r\nУстановка спортивных стенок \r\n\r\nСборка и ремонт корпусной мебели \r\n\r\nСборка мебели представляет собой сложный процесс, мы рекомендуем не затевать самостоятельную сборку, а сразу обратиться к профессионалам. Это позволит сэкономить Вам время и свести на нет возможность собрать мебель некачественно или повредить её во время сборки. \r\n\r\nПорядок и схема сборки Вашей мебели напрямую будет зависеть от её типа, поэтому учесть все тонкости процесса смогут только опытные, квалифицированные специалисты. Кроме того, именно от качества сборки будет зависеть исправная работа и срок службы вашей мебели. \r\n\r\nНаши мастера используют для работы только профессиональное современное оборудование, которое в совокупности с солидным опытом и высоким уровнем профессиональных навыков позволяет быстро и грамотно осуществлять сборку корпусной мебели от любых производителей. \r\n\r\nМы также осуществляем ремонт любой корпусной мебели. Она очень популярна, ее можно встретить практически в каждой квартире, но, как любая другая, корпусная мебель со временем теряет свои качества и требует ремонта. \r\n\r\nНаши мастера подарят Вашей мебели «вторую жизнь». Большой опыт работы с корпусной мебелью от разных производителей, высокая профессиональная грамотность и применение в работе только качественных материалов и современного специализированного оборудования позволяют с уверенностью гарантировать успех мероприятия. Наши специалисты осмотрят изделие и предложат Вам оптимальный вариант ремонта, а также помогут с выбором материалов и фурнитуры. \r\n\r\nМы всегда рады помочь Вам и предложить высококачественные услуги по выгодным ценам! \r\n\r\n\r\nПредоставим свои услуги по ремонту просевших дверей и установке замков для металлических и деревянных дверей. Мы специализируемся на установке замков и ремонте дверей любой сложности. Обратившись к нам, Вы получите весь спектр услуг, связанных с установкой и заменой замков на дверях любого типа. Гарантия качества присутствует в первую очередь. \r\n\r\nЗа все предшествующие годы нашими специалистами накоплен огромный опыт работы по установке нестандартных замков. Воспользовавшись нашими услугами, Вы будете удивлены ценой и качеством выполненной работы. \r\n\r\nПрофессиональные услуги по установке плинтусов и пластиковых откосов. \r\nОконные откосы служат декоративной частью любого современного окна. Кроме того, что они закрывают собой неэстетичные сколы между окном и стеной здания, некоторые типы оконных откосов, так же, эффективно выполняют теплоизоляционные и вентиляционные функции и поэтому очень важно проведенная правильно установка откосов. \r\n\r\n\r\nПодключение стиральных машин к центральной канализации. \r\n\r\nЗвоните нам и заказывайте подключение стиральной машины! Наш мастер оперативно и качественно приедет к Вам на помощь и произведёт установку стиральной машины с соблюдением всех инструкций и требований от завода изготовителя! Рады сотрудничеству готовы помочь в любую минуту! \r\n\r\nМы выполняем подключение стиральной машины по всему Минску и пригороду! Рады придти Вам на помощь и оказать качественные услуги. Стиральные машины давно вошли в нашу жизнь принося нам экономию времени и комфорт! Выполнить качественное подключение машинки, значит соблюсти все мелочи влияющие на дальнейшую её работу! Эти мелочи известны только специалисту! \r\n\r\nЗвоните: 29-706-34-92 / 44-717-10-88 \r\nЗаходите: jelektrik.by\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','jelektro@ya.ru','','','8044 717 10 88','http://www.jelektrik.by/','8029 706 34 92',NULL,NULL),(13,'Центр бытовых услуг 124','','',1,'\r\nМелкий бытовой ремонт от «Центра бытовых услуг 124» . \r\n\r\nНебольшой ремонт в квартире или офисе: положим плитку на кухне и в ванной, поклеим обои, положим ламинат, повесим карниз, установим батарею, и выполним любой другой бытовой ремонт. \r\n\r\n\r\nДоговор на выполнение работ \r\nВозможна оплата по б/налу \r\nТелефон: 124 (многоканальный, для всех операторов)','','','124','124','http://124.by/','',NULL,NULL),(14,'ИП Будай И.А.  ','','logos/2268_4_1391504246_DSC_0048.jpg',4,'\r\nТолько в ФЕВРАЛЕ!!! \r\nАкции и Скидки% \r\n\r\n1 закажи отделку балкона и получи в подарок сушилку потолочную или скидку 5% \r\n2 закажи обшивку санузлов панелями ПВХ и получи в подарок сушилку потолочную или скидку 5% \r\n3 закажи потолки из ПВХ панелей и получи в подарок встраиваемые светильники или скидку10% \r\n4 при заказе потолков на кухне и санузлах, в туалете -БЕСПЛАТНО... \r\n\r\nБалкон - это 4 квадратных метра квартиры. Сколько они сейчас стоят? Так давайте их ценить. Каждый год зима наступает неожиданно и наши балконы заваливаются снегом, на них льет дождь, а можно наши балконы использовать с пользой. Каждый балкон - это место для сушки белья, место отдыха и складирования закаток, овощей и спортивного инвентаря. \r\n\r\nПри помощи обшивки, которая включает в себя отделку стен, потолка, пола, удается скрыть элементы утеплителя и электропроводку. Профессионально выполненная работа исключит проникновение шума и холода в помещение, позволяя достичь отличной шумо- и теплоизоляции. Профессиональная внутренняя отделка подарит стильный, неповторимый, эстетичный внешний вид балкону, создающий особое настроение и для отдыха, и для работы. \r\n\r\n\r\n\r\nБалконы и лоджии: виды отделки \r\n\r\nДля того, чтобы конструкция была максимально прочной и надежной, необходимо провести грамотные подготовительные мероприятия: аккуратный демонтаж со снятием старой отделки, удаление встроенной мебели и др. \r\n\r\nМы, на высоком профессиональном уровне осуществляем работы по реконструкции практически всех балконов и любых лоджий: \r\n\r\nВнутренняя отделка лоджий, включающая обшивку деревянной вагонкой, стеновыми панелями ПВХ или МДФ. \r\n\r\nУтепление при отделке балконов – это немаловажная составляющая будущего комфорта и уюта. Гарантирована полная ветро- и влагоизоляция. \r\n\r\nНастил пола пола на балконе или лоджии \r\n\r\nУстановку сушилки для белья – которая придется по вкусу современным хозяйкам: недорогая, практичная, удобная модель \r\n\r\nМонтаж электропроводки осветительных приборов, розеток, выключателей и других устройств, необходимых при обустройстве балкона \r\n\r\nУстановку встроенных шкафов \r\n\r\n\r\n\r\nА также предлагаем ряд дополнительных услуг, которые помогут улучшить качество вашей жизни: \r\n\r\nОбшивка ванных комнат \r\n\r\nОбшивка туалетов \r\n\r\nПотолки из панелей ПВХ и др.. \r\n\r\nЗанимаясь ремонтом балконов в Минске мы привыкли выполнять свою работу на совесть. Вы можете, не сомневаясь, поручить нам выполнение самых сложных работ - возможно, даже тех, которые не смогли выполнить другие мастера. \r\n\r\nP.S. Ваш только звонок, все остальное делаем Мы...!!! ','','','','8 033 306-68-14','http://D-os.by/','8 029 128-68-14',NULL,NULL),(15,' ООО \"ПромЭлектроСтройМонтаж\"  ','ул.Притыцкого,62 литер А ком.517	','',1,'ремонт квартир,офисов,зданий и сооружений. замена розеток,выключателей\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','promelektrostroimontazh@mail.ru','','','+375173141039','','+375445762520',NULL,NULL),(16,'Ип Яскевич  ','','logos/2135_4_1387913849_1.jpeg',4,'\r\nБалконы и лоджии под ключ,отделка балконов \r\n-Утепление балконов и лоджий \r\n-отделка(обшивка) балконов и лоджий \r\nдеревянная вагонка, пластик (пвх), \r\nпанели мдф, гипсокартон, декоративной штукатуркой \r\n-укладка полов ( доска, ламинат, и тд) \r\n-электрика \r\nЦена от 20 у.е за м2 \r\nВыезд на замер и оценку работы бесплатно \r\nДоставка материалов ','','','','8029- 875-70-03 ','http://balkon-service.by/','',NULL,NULL),(17,'ИП Кошкаров  ','','logos/847_4_1362557262_.jpg',4,'От гвоздя до полного ремонта\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','IPKoshkarov@yandex.ru','','','+37529 379 44 38','','+37533 392 01 99',NULL,NULL),(18,'ИП Манулик П.И.  ','','logos/1667_4_1374955257_.jpg',4,'Отделочные работы квартиры, дома, офиса, коттеджа: штукатурка, шпатлевание, стяжка пола, покрасочные работы, облицовка плиткой и панелями ПВХ, отделка лоджий, санузел «под ключ», укладка линолеума, ламината и многое другое. \r\nГарантия, качество, приемлемые цены, любые объемы. ','','','','1622067','','7022067',NULL,NULL),(19,'ИП Филиппович А.А.  ','','',1,'Любые виды работ по дому.Налбезнал расчет\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу \r\n\r\nЦена ........... договорная ','artkat19@mail.ru','','','+37544566-42-45','','+37525997-15-87',NULL,NULL),(20,'ИП Лоншаков  ','','logos/458_4_1360440325_130837541_968SPUo.jpg',4,'• продажа,установка оконных и балконных рам,дверей, \r\n• обшивка пластиком, вагонкой, сайдингом,декоративной штукатуркой(мраморная крошка,короед),покраска, \r\n• укладка полов ( доска, ламинат и тд),электрические Теплые полы Без стяжки под плтику,камень! \r\n• утепление (внутреннее) пеноплексом,пенопластом, \r\n• шкафы, тумбочки (встроенные, ДСП, раздвижные), \r\n• внешняя обшивка металлических перил(сайдинг, профнастил, пвх), \r\n• сушилки, освещение,жалюзи,роллеты. \r\nКонсультации и рекомендации в выборе материала,доставка.Действует скидка. ','mikhil@mail.by','','','+37544 569 20 65','','',NULL,NULL),(21,'ИП Касько В.Я.  ','г. М. Горка, ул Последовича 2','logos/2866_4_1416652401_65172357_1_1000x700_ukladka-laminata-minsk_rev001.jpg',1,'Укладка ламината, линолеума, паркетной доски, линолеума, половой доски. Оплинтусовка напольных покрытий. Производим демонтаж напольных и потолочных покрытий. Работы производятся в удобное для Вас время.\r\n\r\nВыезд на замер и оценку работы бесплатно \r\n\r\nЦена ........... 4 $ ','forgeshouse@gmail.com','','','+375 33 900 00 67','http://forgeshouse.com/','',NULL,NULL),(22,'ИП ИВАНОВ ','','logos/2475_4_1422278031_-0003.jpg',4,'Шлифовка, циклевка старого и свежeуложенного паркета, массивной и паркетной доски. Выравнивание чернового пола. Устранение скрипа пола, царапин, щелей, вздутия и потускнения паркета. Тонировка, лакировка. Циклевка (шлифовка) проводится (220 В) . Устройство полов из штучного паркета, массивной, паркетной доски. Профессиональная укладка, циклевка, шлифовка , лакировка полов. Снятие краски со старых дощатых полов – шлифовка, пробивка гвоздей, шпаклевка, тонировка, лакировка, восстановление, ремонт и обслуживание. Ремонт, Реставрация, Укладка, Демонтаж, Монтаж паркета, паркетной доски, (дощатого пола) . Шлифовка паркета и дощатых полов любой сложности, а также лакировка, шпаклёвка, снятие краски, укладка, монтаж, оплинтусовка Имеется широкий выбор лаков. Консультация и выезд бесплатно. Выезжаем в пригород. Опыт работы 14 лет \r\n\r\n+375 29 381 58 76 \r\n+375 29 776 28 83 \r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов ','igorcher2013@yandex.ru','','','+375 29 381 58 76','','+375 29 776 28 83',NULL,NULL),(23,'ВВК-Системсгрупп  ','ул. Западная, 13 каб. 614	','logos/2905_4_1418033581__.jpg',1,'Услуги по укладке ламината, паркетной доски в Минске от компании. Наша компания выполнит: \r\n1. укладка ламината; \r\n2. укладка паркетной доски; \r\n3. укладка линолеума; \r\n4. укладка ковролина \r\nНа все работы предоставляется гарантия качества. При заказе услуг по укладке ламината и паркетной доски предоставляются скидки. \r\nРаботаем за безналичный и наличный расчет!\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу \r\n\r\nЦена ........... 4,5 у.е. за кв.м ','vvk-sistems@mail.ru','','8(017)380-04-24','8(029) 392-25-30','','8 (029)394-58-36',NULL,NULL),(25,'ИП Юркевич В.А.  ',' ул. Плеханова 55','',1,'\r\nВыезжаем в кратчайшие сроки, цены гибкие. Стаж электриков до 20 лет. Выполняем работы по электрике любых объёмов и сложности. Расчёт наличный/безналичный в белорусских рублях без привязки к валюте. \r\n\r\nПредлагаем полный комплекс электромонтажных работ в квартирах, коттеджах, офисных зданиях, помещениях нежилого типа (склады, гаражи и др.): \r\n- монтаж систем электроснабжения зданий и сооружений любого назначения промышленного, общественного и жилого; \r\n- устройство трасс и линий для прокладки кабеля (устройство борозд, прокладка лотков, прокладка короба и т.д.); \r\n- прокладка кабеля силового (скрыто, открыто); \r\n- прокладка слаботочных кабелей (компьютерные, телефонные и телевизионные); \r\n- монтаж электрических вводных и распределительных щитов; \r\n- монтаж электроустановочных изделий (розетки, выключатели и т.д.);\r\n- монтаж силового электрооборудования (вентиляторы, кондиционеры и т.д.); \r\n- монтаж электрооборудования освещения (люстры, светильники, прожекторы и т.д.); \r\n\r\nВ комплекс перечня по электрике входят различные виды работ: \r\n- укладка силового кабеля с различным сечением; \r\n- прокладка труб ПВХ по основанию пола, по стенам и потолкам с диаметром условного прохода с затяжкой провода; \r\n- установка стальных и пластиковых коробов по стенам, потолкам и перегородкам; \r\n- резка штроб различного размера по силикату, гипсокартону, штукатурке, кирпиче, бетоне; \r\n- установка подрозетников, распаечных коробок, розеток и выключателей, проходных выключателей; \r\n- коммутация электрических цепей в распаечных коробках \r\n- установка и подключение накладных розеток и выключателей, накладной розетки для электроплиты, утопленной розетки для электроплиты, звонка, кнопки звонка, вентилятора; \r\n- вывод кабеля 220V для питания светильника, вытяжки, вентилятора;\r\n- разметка, прорезка отверстий для светильников, встраиваемых в потолки; \r\n- крепление, установка и подключение светильников, встраиваемых в потолки, светильников потолочных с лампами накаливания, светильников точечных люминесцентных, люминесцентных светильников (типа Армстронг), бра, люстр, светодиодной подсветки, понижающего трансформатора; \r\n- удлинение проводов; \r\n- сверление стен из различных материалов с помощью сверла диаметром до 18 мм (толщина стены до 25 – 100 см); \r\n- демонтаж розетки, выключателя, коробки, старого щитка освещения;\r\n- монтаж накладного щитка освещения; \r\n- пробивка ниши, установка ЩО (гипс, г/силикат, кирпич, бетон); \r\n- установка автоматических выключателей в ЩО с подключением; \r\n\r\nДополнительно выполняем комплекс отделочных работ по согласованию с заказчиком. Звоните. \r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nВозможна оплата по б/налу \r\n','5414143@gmail.com','','','+375 44 541 41 43','','',NULL,NULL),(26,'Ип Селицкая М.С.  ','г.Смолевичи ул.Заболотная 23Б	 ','logos/3000_4_1418928673_1id137035.jpg',1,'\r\nПрофессиональное выполнение электромонтажных работ в Минской обл. \r\nМы выполним работы любой сложности на профессиональном уровне. Выполняем следующие услуги с вызовом электрика на дом, коттедж, офисное складское помещение и т.д. \r\nзамена проводки \r\nэлектромонтажные работы \r\nвызов электрика на дом \r\nперенос и установка розеток и выключателей \r\nукладка теплого пола \r\nразводку под новую кухню \r\nотдельную линию для стиральной машины, и другого оборудования \r\nмонтаж электропроводки телевизионных и ТВ линий, интернета, домофона \r\nзамена электропроводки в квартире\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','','','','+37529-699-63-87','','',NULL,NULL),(27,'ОДО \"Фатон\"  ','г. Гродно., ул. Пролетарская д.52','',4,'\r\nКвалифицированные специалисты предприятия готовы выполнить следующие работы в Вашем доме, офисе, квартире: \r\n- ремонт (замена) электропроводки; \r\n- перенос (установка) розеток, выключателей; \r\n- прокладка телефонного, антенного кабеля; \r\n- подключение светильников; \r\n- установка электросчетчиков; \r\n- установка и сборка электрощита; \r\n- подключение бытовой техники (стиральных машин, духовых шкафов, посудомоечных машин и т.д.). ','olegpromaster@gmail.com','','+375152 74 11 04','+37529 399 51 55','','+37529 782 49 20',NULL,NULL),(28,'ИП Илюкович Д.К.  ',' ул. Ротмистрова 24-94','logos/680_4_1361177604_.jpg',1,'\r\n•	Электромонтаж квартир, коттеджей, офисов; \r\n•	Электромонтаж жилых помещений; \r\n•	Электромонтаж объектов торговли; \r\n•	Электромонтаж складов и производственных помещений; \r\n•	Замена электропроводки в различных помещениях; \r\n•	Штрабление стены под проводку; \r\n•	Установка электросчетчиков; \r\n•	Установка люстр, бра, локальной подсветки, светильников фасадного освещения; \r\n•	Установка розеток и выключателей; \r\n•	Установка распаечных коробок; \r\n•	Установка светильников любых модификаций; \r\n•	Прокладка электрического кабеля; \r\n•	Подключение и установка вентиляторов; \r\n•	Подключение водонагревателя; \r\n•	Укладка силового провода без штрабы; \r\n•	Замена автоматов защиты; \r\n•	Установка электрощита; \r\n•	Электромонтажные работы на воздушных линиях; \r\n•	Монтаж теплых полов; \r\n•	Подключение бытовой техники (электрических плит, духовых шкафов, варочных панелей, водонагревателей и др.); \r\n•	Архитектурная и декоративная подсветка. \r\nРемонт и обслуживание электрооборудования на производстве .Любая форма оплаты 8-029-387-65-19 Вел./ 8-029-787-65-19 МТС \r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','d3876519@mail.ru','','8 017 278 52 35','8 029 387 65 19','http://elektrik-v-minske.a5.ru/','8 029 787 65 19',NULL,NULL),(29,'Ип Леухин  ','','',4,'\r\nИП Выполнит Электромонтажные работы: — Монтаж и перенос: выключателей и розеток, люстр, светильников и т. д. — Полная и частичная замена, ремонт электропроводки в квартирах, загородных домах, дачах — Обнаружим и устраним неисправности в электрических сетях; — Осуществим замену и ремонт электропроводки, монтаж электропроводки, перенос электросчетчиков, электрощитов, розеток и выключателей; — Подключим электрооборудование и бытовую технику — Демонтаж стенок, перегородок, старой электропроводки Качественное выполнение работ, умеренные цены.\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','mognobolshe@tyt.by','',' 2437957','375445509084','http://leuhinbelprom.deal.by/','375336828952',NULL,NULL),(32,'ИП Ляшко  ','','',4,'\r\nВыполняем монтаж проводки в открытом виде, в трубе, гофре, коробах, кабель-каналах и т.д. с учетом норм и пожеланий заказчика.\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nВозможна оплата по б/налу ','sverlilka@outlook.com','','','+37529-967-90-82','','+37529-766-89-95',NULL,NULL),(31,'ИП Демчук  ','','logos/2543_4_1398115495_IMAG0060_rNC9Aml.jpg',4,'\r\nБыстро и качественно выполним любые электромонтажные работы от полной замены электропроводки до установки розеток, светильников и бытового оборудования !\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','','','','80296044770','','',NULL,NULL),(33,'Альциона УП','','',4,'Абсолютно все работы по проекту и монтажу охранно.-пожарная сигнализация','','','(017) 275-54-47','(029) 674-22-61','','',NULL,NULL),(34,'Спецналадка ОДО','','',4,'Сигнализация охранно-пожарная. Проект, монтаж, тех. обслуживание','','','(0222) 47-69-04','','','',NULL,NULL),(35,'Гексаэдр УП','','',1,'Сигнализация охранно-пожарная. Проект, монтаж, тех. обслуживание','','','(017) 280-49-82','(029) 666-95-46','','',NULL,NULL),(36,'ИП Кравцов','','',1,'Сигнализация охранная, видеонаблюдение, контроль доступа + монтаж','','','(017) 224-11-01','(029) 750-15-40','','',NULL,NULL),(37,'«ArchLine студия»','','',4,'Дизайн интерьеров любой сложности и назначения помещений. 3D визуализация','','','','(029) 677-76-88 ','','(029) 502-05-09',NULL,NULL),(38,'ЧТУП «КОСКА»','','',1,'Выполняем отделочные работы в зданиях любого назначения. Строительно-монтажные и ремонтные работы. Демонтаж, разборка, снос зданий и сооружений.','','','(017) 345-89-76','(029) 611-52-64','','(029) 860-96-65',NULL,NULL),(39,'ООО «Вестерос»','','',1,'Отделка фасадов с тепловой модернизацией; облицовочные работы; малярные работы, штукатурные работы; обойные работы; зашивка стен и потолков гипсокартонном (перегородки); устройство подвесных потолков; заполнение оконных и дверных проемов.','','','(017) 204-20-20','(029) 367-95-30','','(029) 767-45-59',NULL,NULL),(40,'УП «PrivateHouse»','','',1,'Отделочные работы. Наружная отделка.','','','(029) 328-82-28','','','',NULL,NULL),(41,'РУП «Белорусский институт строительного проектирования» Управления делами Президента РБ','','',1,'Детальное обследование зданий и сооружений.','','','(017) 226-42-12','(017) 226-42-11','','',NULL,NULL),(42,'НПЧУП «СТРОЙРЕКОНСТРУКЦИЯ»','220086, ул. Славинского, 1/2-405','',1,'Обследование технического состояния зданий и сооружений I и II классов ответственности.','','','(029) 622-88-66','','','',NULL,NULL),(43,'Государственное предприятие \"Институт НИПТИС\" им. Атаева С.С.','','',1,'Детальное исследование оснований и фундаментов. Проведение общего обследования состояния строительных конструкций зданий и сооружений.','','','','(029) 303-98-08','','',NULL,NULL),(44,'ООО «ИНГпроект»','220108, ул. Корженевского, 3-43','',1,'Все виды технического обследования зданий и сооружений, техническое обследование конструкций, обследование технического состояния зданий и сооружений.','','','','(029) 502-75-22','','',NULL,NULL),(45,'ОДО \"БРЕСТСКАЯ ИНЖЕНЕРНАЯ ГРУППА\"','','',1,'Техническое обследование состояния строительных конструкций, зданий и сооружений.','','','(162) 20-88-37','','','',NULL,NULL),(46,' ИП Федорович Д.А.','','logos/1.jpg',1,'\r\nВыполняем штукатурку, шпаклевку стен, потолков под покраску, под обои, смонтируем потолки, перегородки, стены, откосы и другие конструкции из гипсокартона. Укладка керамической плитки, искусственного и натурального камня. Проконсультируем по материалам, при необходимости поможем с доставкой. Отделка комплексно и частично. Ванная, лоджия, кухня, спальная, гостиная и прочее. Договор, качество, гарантия.\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','dmitryf8@gmail.com','','80172634556','80445362140','','',NULL,NULL),(47,'ИП Жардецкий  ','','',4,'Здравствуйте. \r\nМы хотим предложить ВАМ выполнение работ по внутренней отделки помещений (малярные и гипсокартонные работы, монтаж полов и потолков из любых материалов, укладка плитки любой сложности, установка межкомнатных дверей и многое другое). Четко и грамотно подойдем к выполнению поставленных задач. Быстро, надежно и качественно выполним все работы, касающиеся ремонта и внутренней отделки помещений (квартир, домов, офисов). По окончанию выполнения строительно-монтажных и отделочных работ мы предоставим Вам гарантию сроком на 3 года. Качество, надежность и индивидуальный подход – вот наш девиз. Также мы можем предложить помощь в выборе, приобретении и доставке материалов. Бесплатная консультация поможет принять Вами верное решение. Форма оплаты: наличная и безналичная. \r\nМы сделаем Ваш дом уютнее. \r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/н','Moordoc@tut.by','','','+375296615153','','+375292597669',NULL,NULL),(48,'ЧСУП\"Олвиданастрой\"  ','г. Минск, ул. Кульман 21Б, оф. 6','logos/1351_4_1369340877____9.png',1,'Электромонтажные работы, молниезащита и заземление - это основное направление деятельности нашей компании . Квалифицированные специалисты выполнят электромонтажные работы в коттеджах, квартирах, офисах, производственных помещениях, торговых центрах качественно и оперативно. У Вас возникла необходимость замены или переноса розеток? Нужно установить светильники, бра, люстры? Есть необходимость выполнить электрику офиса, склада, производственного помещения? Мы способны выполнить все задачи, связанные с электромонтажем в сжатые сроки. \r\nПри выборе электромонтажной компании перед заказчиком всегда встает вопрос о стоимости выполняемых работ. Однако в строительной сфере особое внимание должно быть уделено качеству оказываемых услуг, так как от этого прежде всего зависит безопасность людей, находящихся на объекте после его ввода в эксплуатацию. Наша компания предложит вам умеренные цены на оказываемые услуги, сочетаемые с высоким качеством выполнения работ, индивидуальный подход к каждому клиенту, контроль всех этапов выполнения проекта. Что не всегда сочетается в других организациях. А также честность, порядочность, открытость, коммуникабельность, вежливость при работе с клиентом. Важные мелочи, все реже встречающиеся в людях. \r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','7500193@mail.ru','','','+375293500446','http://www.elektromontag.by/','+375297500193',NULL,NULL),(49,'ИП Олесюк А.Р.  ','','logos/1143_4_1366746004_DSCI2959.jpg',1,'1.Срочный аварийный выезд в течении \r\n1-2 часов для быстрого устранения \r\nаварийной ситуации. \r\n\r\n2.Аварийный выезд в течении дня \r\nили на следующий день для устранения \r\nнеисправности. \r\n\r\n3.Полная замена устаревшей электропроводки и электрооборудования в квартире - \r\nс предварительным выездом для осмотра \r\nи замера. \r\n\r\n4.Установка в электрощит специальных автоматов \r\n(устройств защитного отключения - УЗО), \r\nкоторые обеспечивают защиту человека \r\nот поражения электрическим током, \r\nа также обеспечивают защиту электропроводки \r\nи электроприборов от возгорания. \r\n\r\n5.Установка в электрощит датчика от \r\nповышенного напряжения,который защищает \r\nвсю бытовую технику в вашей квартире от \r\nскачков напряжения в сети. (при отсутствии \r\nтакого датчика - вся техника, включенная в сеть \r\nпри скачке напряжения ,выходит из строя). \r\n\r\n6.Монтаж системы защитного заземления- \r\nобеспечивает срабатывание автоматики при \r\nзамыканиях на землю и защищает от появления \r\nна металических корпусах электроприборов \r\nопасного напряжения. \r\n\r\n7.Монтаж розетки для стиральной машины \r\nтолько во влагозащищенном исполнении. \r\n\r\n6. Выполнение следующих видов \r\nэлектромонтажных работ любой сложности: \r\n\r\n1.Монтаж и переборка электрощита с установкой качественного электрооборудования. \r\n2.Монтаж и разводка розеточных линий. \r\n3.Монтаж и разводка линий освещения. \r\n4.Установка, замена и перенос розеток, \r\nвыключателей, люстр, светильников и т. п. \r\n5.Монтаж внутрипотолочного освещения \r\nна 220 и 12 вольт. \r\n6.Установка диммеров, термостатов, терморегуляторов, \r\nдатчиков движения, проходных переключателей и т. п. \r\n7.Прокладка новых линий от электрощита. \r\n8.Подключение мощной бытовой техники - \r\nэлектроплит, водонагревателей, стиральных машин и т. п. \r\n9.Защитное заземление электроприборов, \r\nметалических ванн,раковин,трубопроводов и т. п. \r\n10.Комплексный профилактический осмотр всего \r\nэлектрооборудования с целью выявления проблемных \r\nучастков и предотвращения аварийных ситуаций. \r\n\r\nПри необходимости возможна закупка \r\nнеобходимых электроматериалов по \r\nминимальным оптовым ценам, \r\nа также подбор электрооборудования, \r\nоптимального по цене и качеству. \r\n\r\nПри работах используется только \r\nкачественное электрооборудование \r\nизвестных европейских и отечественных \r\nпроизводителей: \r\nABB, legrand, Schneider Electric, Siemens, \r\nMoeller, Hager, DEKraft, EKF, IEK. \r\n\r\nВсе работы производятся со строгим \r\nсоблюдением правил электромонтажа \r\nи техники безопасности. \r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','Olesiuk.aleksandr@tut.by','','','375296680563','','',NULL,NULL),(50,'ИП Игнатчик','г.Минск ул.Ангарская д.9 к.1кв.3','',1,'\r\nмонтаж гипсакартонных конструкций только по технологий кнауф \r\nмонтаж потолков любой сложности,арок,перегородок с утеплением,и без\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nВозможна оплата по б/налу \r\n','','','','+375291339581','','+375295016401',NULL,NULL),(51,'ИП Кондратенко','','',4,'\r\nГипсокартонные работы. Потолки, перегородки.\r\nВерсия для печати\r\nDefault image\r\nЛюбые работы с гипсокартоном. Одно-, двухуровневые потолки, перегородки, ниши, полки любой сложности. Высокое качество, короткие сроки, квалифицированные рабочие.\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nВозможна оплата по б/налу \r\n\r\nЦена ........... от 8$ ','','','+375 44 5555007','+375 29 6748740','','',NULL,NULL),(52,'ИП Налетко С.В','','',4,'Бригада опытных строителей выполнит монтаж гипсокартонных конструкций любой сложности. Монтаж криволинейных потолков, скрытых подсветок, устройство ниш и полок, зашивка труб коробами. Тепло-шум изоляция. \r\nАдекватные цены!	\r\nТакже выполняем следующие виды услуг: Сопровождение объекта, Сантехника, Электрика, Штукатурка, Стяжка, Монтаж ГКЛ, Облицовка плиткой, Малярные работы, Укладка полов, Балконы под ключ, Натяжные потолки, Изготовление мебели из ДСП. \r\nПри заказе комплексного ремонта предусмотрены скидки! \r\n+37529 673 22 22 \r\nИП Налетко С.В. \r\nУНП 191389891 \r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу \r\n\r\nЦена ........... от 8уе ','sersaby@gmail.com','','','+37529 673 22 22','http://sersa.by/','',NULL,NULL),(53,'ООО \"ПромЭлектроСтройМонтаж\"  ','г.Минск,ул.Притыцкого,62 литер А ком.517','',1,'\r\nMонтаж наружного водпровода и канализации. внутренних сантехнических систем. Септик. Системы автономной канализации.\r\n\r\nУстановка ворот,заборов,ограждений\r\n\r\nCтроительство зданий и сооружений любой сложности. гарантия на все виды работ 5лет.\r\n\r\nCтроительство домов,коттеджей под ключ\r\n\r\nДемонтаж зданий и сооружений\r\n\r\nУкладка тротуарной плитки\r\n\r\nРемонт квартир,офисов,зданий и сооружений. замена розеток,выключателей\r\n\r\nМонтаж систем автоматизации,умный дом. Пусконаладочные и ремонтные работы\r\n\r\nMонтаж светильников,розеток, выключателей,контур заземления,молниезащита.,ремонт электропроводки и электросчетчиков\r\n\r\nСтроительство ЛЭП; монтаж внутренней электропроводки;строительство трансформаторных подстанций; электромонтажные работы\r\n\r\nОказываем помощь в получении всех технических условий, разрешений на производство работ и подготовку документов на сдачу/ввод объекта в эксплуатацию.\r\n\r\nПомомощь в получении технических условий на электроснабжение,газоснабжение,водоснабжение и канализацию. Проектирование инженерных сетей с согласованием в установленном порядке.','promelektrostroimontazh@mail.ru','','+375173141039','+375445762520','','',NULL,NULL),(54,'ЧТУП «БетонДомСтрой»','','logos/index2.jpg',1,'Оказываем весь спектр услуг по строительству домов и коттеджей. А также выполним любые отделочные работы. \r\n\r\nУкладка тротуарной плитки любой сложности. Дорожки, отмостка, площадки, заезды, установка борта. Благоустройство территории. Быстро, качественно, умеренные цены.','deonisi@inbox.ru','','8(29)5054545','','http://betondomstroj.deal.by/','',NULL,NULL),(55,'Elektrika.By  ','г. Минск, ул. Ангарская, 26','logos/706_4_1361225880_ade8b9ad65.jpg',1,'Профессиональные электрики выполнял работы любой сложности.\r\n','','','','80296368694','http://ms-stroy.pulscen.by/','',NULL,NULL),(56,'\"РеМастер\" ИП Нестеров А.А','','logos/index2_1.jpg',3,'\r\nУстановка потолочных и настенных конструкций из гипсокартона в вашей квартире. Цена договорная, в среднем 12$ за кв.м. в зависимости от сложности работ.\r\n\r\nДоставка материалов \r\n\r\nЦена ........... 11$ ','nesterov3105@mail.ru','','','+375 29 372 65 16','http://www.remaster.by/','',NULL,NULL),(57,'Astorcom','г. Минск, ул. Якубова, 80, офис 1Н','',1,'Дома, коттеджи - строительство и ремонт: земляные работы, фундаменты, монолитные работы, кладка блоков, кровельные работы. Штукатурные работы, стяжка пола, сантехнические, электромонтажные. Фасадные работы. Форма оплаты любая.','astorcom@tut.by','','8 (017) 220 - 95 - 46','8 (029) 624 - 46 - 42','http://dombel.by/','',NULL,NULL),(58,'ИП Коливанов','','',4,'\r\nВсе виды работ из гипсокартона: \r\nМногоуровневый потолок из гипсокартона. \r\nПерегородки, полки, декоративные элементы, арки. Обшивка стен,потолков,мансард др. Качественно и недорого\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов ','','','8-029-365-99-46','8-029-760-55-68','http://kolivanov.webprorab.com/','',NULL,NULL),(59,'ИП Леухин','','logos/489_4_1360613529_2664202_w100_h100_ljustra1.jpg',1,'\r\nИП Выполнит Электромонтажные работы: — Монтаж и перенос: выключателей и розеток, люстр, светильников и т. д. — Полная и частичная замена, ремонт электропроводки в квартирах, загородных домах, дачах — Обнаружим и устраним неисправности в электрических сетях; — Осуществим замену и ремонт электропроводки, монтаж электропроводки, перенос электросчетчиков, электрощитов, розеток и выключателей; — Подключим электрооборудование и бытовую технику — Демонтаж стенок, перегародок, старой электроправодки Качественное выполнение работ, умеренные цены.\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу \r\n','lelik1000@tyt.by','','2437957','80333008647','','',NULL,NULL),(60,'ООО \"ОТДЕЛКА И САНТЕХНИКА\"','д.Баровляны, ул.40 лет Победы, дом 34','',1,'\r\nкачественно\r\n\r\nЦена ........... договорная ','A.Shumskiy@tut.by','','','80291277767','','80291277767',NULL,NULL),(61,'ИП Ворона В.С. ','','logos/415_4_1359306297_slider-img2.jpg',1,'\r\nВыполняем все виды электромонтажных работ любой степени сложности в производственных, складских, административных, торговых и жилых зданиях, а также объектах индивидуального строительства. \r\n\r\nЭлектромонтаж любой сложности в нашем исполнении - это сочетание выгодных условий с гарантированно высоким качеством работ, обусловленным знанием и опытом. \r\n\r\nПреимущества нашей компании - подбор правильного решения проведения ремонтных работ, подходящих именно Вашему индивидуальному запросу. Мы учтем все уточнения и пожелания в каждом отдельном случае. На все выполненные виды работ мы предоставляет гарантию. \r\n\r\nБлагодаря высокой квалификации, профессионализму и добросовестности наших специалистов, хорошо организованной командной работе, контролю качества на всех этапах работ, гибкой ценовой политике, а также внимательному отношению к потребностям клиентов мы приобрели репутацию выгодного, надежного и безупречного партнера. \r\n\r\nМы всегда рады новым клиентам и готовы обеспечить качественное и своевременное выполнение строительных работ любого объема и любой степени сложности! Будем рады предложить Вам наши услуги и видеть Вас в качестве наших заказчиков и партнеров. \r\n\r\nПоможем приобрести и доставить по выгодным ценам необходимые для заказа материалы.\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','VoroNst1@mail.ru','','','+(375)296658265','http://remontvdome.by/','+(375)295759075',NULL,NULL),(62,'ИП Романенко О.Л. ','','logos/2330_4_1392667075_f20130305113543-risunok_21.jpg',4,'Выполняем комплексный ( под ключ), а также частичный ремонт квартир, коттеджей. Шпатлёвка стен и потолков, окраска стен и потолков, оклейка обоями, монтаж гипсокартона и конструкций из него, укладка плитки, ламината, электрика, сантехника, установка межкомнатных дверей и многое другое. Качество, гарантия. Помощь в подборе материала.Связаться с нами можно по данным телефонам: \r\n+37525 9916165(лайф) \r\n+37529 6258771 (vel) \r\nИП Романенко О.Л.\r\n\r\nВыезд на замер и оценку работы бесплатно ','frau.romanenko@mail.ru','',' +37529 6258771','+37525 9916165','','',NULL,NULL),(63,'Электромонтаж','','logos/72_4_1357586176_1.jpg',1,'рофессионально, и по умеренной цене выполним следующие работы: \r\n• Установка новых, или замена старых розеток и выключателей \r\n• Навеска и подключение люстр, бра, светильников \r\n• Подключение электроплит, стиральных машин, бойлеров и других электроприборов \r\n• Монтаж теплого пола \r\n• Электротехнические работы по замене и установке электрощита, счетчика \r\n• Монтаж и подсоединение автоматов в щитке \r\n• Прокладка электрокабеля в стенах, кабель-каналах, металлорукавах \r\n• Полная или частичная замена электропроводки \r\n• Прокладка антенного, телефонного и сетевого кабеля \r\n• Электрификация коттеджей, офисов, квартир, дач, гаражей, под ключ. \r\nИндивидуальный подход к каждому клиенту \r\nПоможем в выборе и доставке материала','zemly69@yandex.ru','','','8029 632-55-19','','8029 552-55-19',NULL,NULL),(64,'ИП Апацкий К.В.  ','','',4,'\r\nЭлектромонтажные работы .Прокладка кабельных трасс, выполнение внешних сетей электроснабжения и внутренних электромонтажных работ. Многолетний опыт работы в области энергетики и монтажа. \r\nЭлектромонтажные работы любой сложности. \r\nРазработаю электропроект и, если необходимо, согласую его в Гостехнадзоре. \r\nГарантия 2 года на выполненные работы, а так же дальнейшее сервисное обслуживание. \r\nОперативно и без пыли! \r\nПомогу в покупке материалов по оптовым ценам. \r\nИндивидуальный подход к каждому клиенту. \r\nГИБКАЯ СИСТЕМА СКИДОК!!!! \r\nСтоимость зависит от объема работ и местонахождения объекта.По отзывам клиентов -цены низкие. \r\nК примеру, 1комнатная квартира \"под ключ\" со всевозможными подсветками и теплым полом(проводка полностью новая)-около 250 у.е. \r\n7 дней в неделю. \r\nЗвонить можно с 9 до 21','','','','8 029 2714092','','',NULL,NULL),(65,'ООО \"Ординем\"','г.Минск ул В.Хоружей','',1,'Все виды отделочных работ под ключ\r\n- Офисы \r\n- Торговые помещения \r\n- Коттеджи \r\n- Мед учреждения \r\n- Рестораны и кафе \r\n- Исполнение авторских проектов любой сложности... \r\nОрганизация с европейским опытом отделки помещений, качественно и точно в срок, выполнит частичный, \r\nкосметический или капитальный ремонт или исполнит ваш проект. \r\n* Выравнивание плоскости потолков, стен, полов, дверных и оконных откосов \r\n* Укладка напольных и монтаж настенных покрытий. \r\n* Подвесные потолки и стены из гипсокартона, вагонки, ПВХ и МДФ панелей. \r\n* Сантехнические работы \r\n* Электромонтажные работы \r\nВыезд на Ваш объект и составление сметы-Бесплатно! \r\nКонсультация перед началом и в процессе работ-Бесплатно! \r\nПодбор и закупка \"правильного\" и нужного материала-Бесплатно!\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','','','','+375172331924','','+375291909061',NULL,NULL),(66,'Электрика','','logos/221_4_1357991035_c5d9a32d6a18ebed16fa807c492d0474.jpg',4,'# Монтаж электропроводки, замена и ремонт.. \r\n# Штробление бетонных и кирпичных стен с применением профессионального оборудования. \r\n# Перенос и установка: электрощитов, электросчётчиков, розеток, выключателей, люстр, бра, светильников и т. д. \r\n# Разводка телефонных, электрических, антенных, сетевых, аудио/видео линий. \r\n# Установка электроавтоматов, электрощитов, фотодатчиков , датчиков движения, УЗО и т. д. и т.п \r\n# Подключение к электричеству бытовой техники: стиральных машин, посудомоечных машин, электроплит, электрокаминов, водонагревателей и т. д','','','','+37529-304-77-78','','',NULL,NULL),(67,'ИП Муравский','','logos/index2_2.jpg',4,'Комплексный или частичный ремонт квартир, офисов, коттеджей\r\nВерсия для печати\r\nClick to Enlarge Picture\r\nПредлагаем Вам выполнение всех видов ремонтных отделочных работ. Штукатурные работы, шпатлевка стен, потолков, малярные работы, поклейка обоев, плиточные работы. Монтаж гипсокартонных систем (арки, перегородки, подвесные потолки),декоративная штукатурка. Устройство полов (стяжка, гидроизоляция, линолеум, , ламинат, паркетная доска','murka-190583@mail.ru','','','8044-7604612','http://muravskijstroy.deal.by/','8029-5895885',NULL,NULL),(68,'ЧСТУП \"Ричеф Групп\" ','','logos/302_4_1358233413__.jpg',4,'Ремонт и отделка офисов \r\n\r\nБезналичный расчет \r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу \r\n\r\nЦена ........... от 5$ ','5053205@tut.by','','','(8-029) 505-32-05','','(8-044) 712-08-39',NULL,NULL),(69,'ИП Манулик П.И.','','logos/1662_4_1374954960_.jpg',4,'Отделочные работы квартиры, дома, офиса, коттеджа: штукатурка, шпатлевание, стяжка пола, покрасочные работы, облицовка плиткой и панелями ПВХ, отделка лоджий, санузел «под ключ», укладка линолеума, ламината и многое другое. \r\nГарантия, качество, приемлемые цены, любые объемы. \r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','','','','+375291622067','','+375297022067',NULL,NULL),(70,'ИП Макаревич','','',1,'Гипсокартонные конструкции любой сложности,большой опыт работы.Весь комплекс работ по отделке квартир офисов,коттеджей.Ремонт любой сложности от косметического до элитного.\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','ipremontkv@yandex.ru','','','8-029-686-41-63','http://www.remontik.sml.by/','8-029-779-76-46',NULL,NULL),(71,'ИП Витти Авто  ','г. Минск, ул. Городецкая	','logos/3322_4_1426531158_1.jpg',1,'ЭЛЕКТРОМОНТАЖНЫЕ РАБОТЫ. \r\nПредлагаем Вашему вниманию все виды электромонтажных работ. \r\nВыполняемые работы: \r\n- Все виды электромонтажных работ в квартире, офисе, доме производственных и торговых помещениях. \r\n- Установка розеток, выключателей, переключателей проходных и т.д. \r\n- Установка люстр, точечных светильников, бра и т.д. \r\nПреимущества работы с нами! \r\n- Консультации по выполняемым работам и выбору комплектующих по выполняемым работам. \r\n- Оперативность \r\n- Гарантия, последующие дополнительное обслуживание. \r\nВсе интересующие вопросы можно задать в Skype drivevic \r\nили на e-mail: 0101cc7@mail.ru. \r\nТелефон: \r\n+ 375 (29) 380-01-76 Виктор','0101cc7@mail.ru','','','80293800176','','',NULL,NULL),(72,'Ип Селицкая М.С.  ','г.Смолевичи ул.Заболотная 23Б','logos/3001_4_1418928757_1894022_10.jpg',4,'Профессиональное выполнение электромонтажных работ в Минской обл.\r\nМы выполним работы любой сложности на профессиональном уровне. Выполняем следующие услуги с вызовом электрика на дом, коттедж, офисное складское помещение и т.д. \r\nзамена проводки \r\nэлектромонтажные работы \r\nвызов электрика на дом \r\nперенос и установка розеток и выключателей \r\nукладка теплого пола \r\nразводку под новую кухню \r\nотдельную линию для стиральной машины, и другого оборудования \r\nмонтаж электропроводки телевизионных и ТВ линий, интернета, домофона \r\nзамена электропроводки в квартире\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','servis_minsk@mail.ru','','','+37529-699-63-87','','',NULL,NULL),(73,'ИП Демчук  ','','logos/2545_4_1398116205_IMAG0151.jpg',4,'Качественно и в срок сделаем Ваш дом теплее! \r\nВыполним монтаж теплого пола: на кухне, в коридоре, в ванной комнате, подогрев крыльца и многое другое. \r\nВыполним весь спектр электромонтажных работ!\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','','','','80296044770','','',NULL,NULL),(74,'Частное Предприятие \"ТермоСтар\"  ','г. Минск, ул. Купревича, д. 10, оф. 408','',1,'Квалифицированный монтаж кабельного и пленочного теплого пола. \r\nУстройство обогрева доильных ям, поилок и других сельскохозяйственных объектов. \r\nУстройство тепловых экранов холодильных камер. \r\nЗащита от замерзания трубопроводов. \r\nИзготовление щитов управления обогревом.\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','termostar@tut.by','','8-017-263-67-60','8-029-39-54321','http://www.thermix.by/','',NULL,NULL),(75,'Чуп\"Свитхоум\"  ','','logos/1921_4_1380642489_images9.jpeg',4,'монтаж теплых полов\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоставка материалов ','','','','80291074176','','80297664176',NULL,NULL),(76,'ИП Дударев М.М.  ','','logos/84_4_1379064057_montaj-raspredelitelnyh-schitkov-6.jpg',1,'Вызов электрика избавит Вас от всевозможных проблем, связанных с электрооборудованием\r\n\r\n\r\nЭлектрик в Минске и Минском районе выполнит: \r\n\r\nРемонт электрики квартиры, дачи, дома, коттеджа, офиса, склада или производственного помещения. \r\nПолную или частичную замену электропроводки. \r\nМонтаж и сборку электрощитов. \r\nЗамену пробок на современные автоматические выключатели и дифференциальные реле. \r\nУстановку люстр, бра, светильников. \r\nУстановку или замену розеток, выключателей, электрозвонков. \r\nУстановку датчиков движения, регуляторов теплого пола. \r\nМонтаж слаботочных линий - телефон, TV-антена. \r\nУстановку дистанционного управления для включения и выключения светильников, бра, люстр, подсветок. \r\nУстановку и подключение стабилизатора напряжения. \r\nУстановку и наладку светододиодной подсветки в домах, квартирах, офисах. \r\nШтробление бетонных и кирпичных стен без пыли. ','jelektro@ya.ru','','','29-706-34-92','','44-717-10-88',NULL,NULL),(77,'ЧЕЛКСТРОЙ  ','г. Минск, пр. Партизанский, 8 корпус 14, каб.212','logos/1613_4_1373029354_861_4_1363160342__.jpg',1,'Выполним электромонтажные работы \"под ключ\" любого уровня сложности: \r\nмонтаж новой, замена старой электропроводки; \r\nмонтаж подсветки, \"теплого\" пола, душевых кабин и т.п. \r\nмонтаж слаботочных сетей (TV, tel, Ethernet) в квартирах, коттеджах, офисах; \r\nсоставление исполнительных схем по окончании работ \r\nнизкие цены\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','Vladst@open.by','','','+375445972766','http://www.chelkstroy.by/','',NULL,NULL),(78,'БелЛайтСтрой  ','','',4,'Укладка тёплых полов любой сложности\r\n\r\nНаша компания проводит весь спектр строительных и электромонтажных работ любого уровня сложности в жилых и офисных помещениях, на производстве и в торговых комплексах. Независимо от объёма и сложности работ, мы выполняем заказ в самые сжатые сроки и по приемлемым ценам. Для нас важен индивидуальный подход к каждому клиенту! Также с нами сотрудничают лучшие дизайнеры интерьера, которые создадут неповторимый дизайн-проект, А МЫ ВОПЛОТИМ ЕГО В РЕАЛЬНОСТЬ!!!\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов ','','','','0296879050','','',NULL,NULL),(79,'Unipron  ','г.Минск, Проспект Газеты Правда, 11\"Г\",','logos/317_4_1358241461_mat1.jpg',1,'Электрообогрев: электрический теплый пол UNIPRON\r\n\r\nПроизводитель полимерного греющего кабеля UNIPRON, нагревательных матов UNIPRON, нагревательных плит предлагает: \r\n- проектирование, изготовление и монтаж антиобледенительных систем, систем обогрева ферм (нагревательные плиты), трубопроводов, тротуарных и подъездных дорожек, грунта; \r\n- изготавливаем и устанавливаем системы \"теплый пол\"; \r\n- приглашаем к сотрудничеству частных предпринимателей, плиточников, электриков, монтажников, строительные и проектные организации.\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу \r\n','vasil@tst.by','','+375 17) 207-99-81, 207-49-71','(+375 44) 530 42 78, 530 42 87','http://unipron.by/','(+375 29) 703 35 04, (+375 33)',NULL,NULL),(80,'ВИРА ООО ','Минск, Логойский тракт 20','',1,'Контроль доступа\r\n\r\n\r\nУстановка, обслуживание систем контроля доступа\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','danilatur@gmail.com','','','+375296270830','','',NULL,NULL),(81,'ВИРА ООО  ','Минск, Логойский тракт 20	','',1,'Пожарная сигнализация\r\n\r\n\r\nПроектирование, монтаж, наладка, обслуживание систем пожарной сигнализации\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','danilatur@gmail.com','','','+375296270830','','',NULL,NULL),(82,'ООО \"СтетКом\"  ','г.Минск ул.Геологическая 59, оф.17	 ','',1,'Монтаж охранной сигнализации\r\n\r\nВ условиях неустойчивой экономики и растущей безработицы количество грабежей с каждым годом только увеличивается. Планы ограблений изобретательных злоумышленников становятся все более изощренными, позволяющими их авторам проникнуть практически в любое незащищенное место и, прихватив с собой все ценное, скрыться незамеченными. С целью предотвращения успешного завершения такого алгоритма действий, компания СтетКом предусмотрела все возможные варианты взломов и с помощью монтажа охранной сигнализации готова помочь защитить ваше дорогостоящее имущество. Главное предназначение охраной сигнализации – своевременное и гарантированное информирование правоохранительных органов и владельца о незаконном вторжении постороннего человека в его дом, склад или любое другое охраняемое помещение. Охранная сигнализация – это комплексная система работы ряда технических устройств, способных обнаружить несанкционированное нахождение грабителя в помещении и оповестить об этом заинтересованных лиц. А правильный монтаж системы охранной сигнализации и своевременное техническое обслуживание охранной сигнализации обеспечивают максимальную безопасность и предусматривают различные способы проникновения на частную территорию или в здание. Выделяют следующие виды датчиков охранной сигнализации: \r\n• акустические \r\n• объемные \r\n• магнитоконтактные \r\n• акустические \r\n• вибрационные \r\n• инфракрасные \r\n• радиоволновые \r\n• обладающие направленной диаграммой обнаружения \r\nОдин из важных критериев, по которому принято разделять охранные сигнализации — способ оповещения. Выделяют системы с автономным оповещением и подключенные к охранному пульту. В первом случае локально воспроизводится мощный звуковой сигнал тревоги, во втором — расположенные по охраняемой территории датчики передают показания на центральную контрольную панель, а оттуда сигнал тревоги поступает на пульт охраны. Компания СтетКом гарантирует качественный монтаж охранной сигнализации и правильно налаженную работу датчиков. Для достижения безупречного результата, специалисты компании выезжают на место установки сигнализации, изучают объект, выявляют его уязвимые и наиболее удобные для проникновения в помещение места. При этом неважно, какие датчики вы решили приобрести, квалифицированные сотрудники смогут их правильно скомбинировать, успешно провести монтаж и ознакомить с инструкцией по их правильному пользованию. К тому же, они предложат наиболее оптимальную для вашего конкретного случая систему установки сигнализации: беспроводную, проводную адресную или радиоканальную. Монтаж состоит из следующих основных этапов: \r\n• прокладка кабельных линий к местам расположения стационарных точек; \r\n• установка датчиков, управляющих механизмов и контрольно-исполнительного оборудования, а также дополнительных охранных элементов; \r\n• настройка параметров и проведение пробного запуска системы; \r\n• сдача охранного комплекса заказчику. \r\nДля надежного и качественного функционирования системы охранной сигнализации требуется ее регулярное обслуживание, что позволяет своевременно выявить возникшие технические сбои, поломки оборудования и другие дефекты. У нас вы можете получить квалифицированную консультацию по любым охранным системам от датчиков дыма до видеонаблюдения, мы расскажем о преимуществах и недостатках каждой из них и посоветуем оптимальный вариант исходя из ваших пожеланий, организуем комплексную охрану складов, офисов, магазинов.\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','Stetkom@list.ru','','+375 17 291 99 85','+375 29 356 92 76','','+375 29 370 65 16',NULL,NULL),(83,'SmartSystems  ',' г.Минск, ул. Шафарнянская 11, Бизнес-центр «ПОРТ», оф. 502','',1,'\r\nДля своих заказчиков компания SmartSystems выступает в роли проектировщика инженерных систем автоматизации, инсталлятора аппаратного и программного обеспечения, а также в роли консультанта. \r\n\r\nОсновные направления деятельности нашей компании: \r\n\r\nАвтоматизированные системы управления зданием (BMS); \r\nСистемы автоматизации \"Умный Дом\" (Smart Home); \r\nКонтроль, наблюдение и диспетчеризация инженерных систем (SCADA); \r\nЭлектроснабжение, энергосбережение и ИБП; \r\nСлаботочные системы (СКС, ЛВС, ОС, СКУД, видеонаблюдение); \r\nУправление освещением; \r\nУправление микроклиматом; \r\nМультимедийные системы (Домашний кинотеатр, мультирум, аудиосистемы); \r\nУправление моторизированными рафшторами. \r\nПо всем направлениям мы оказываем полный комплекс услуг: \r\n\r\nСоставление технического задания (ТЗ); \r\nПодготовка проектной документации; \r\nПоставка оборудования; \r\nМонтажные и пусконаладочные работы; \r\nПрограммирование и настройка оборудования; \r\nГарантийное и сервисное обслуживание. \r\nКонсультирование заказчика на всех этапах сотрудничества.\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу \r\n','info@smartsystems.by','','+375(17)-2863689','+375(29)-3818378','http://www.smartsystems.by/','+375(29)-5040976',NULL,NULL),(84,'ЧЕЛКСТРОЙ  ','г. Минск, пр. Партизанский, 8 корпус 14, каб.212	','',1,'\r\n\"Умный дом\" оснащен добрым десятком инженерных (например, водо- и электроснабжение) и информационно-развлекательных систем (телекоммуникации, домашние кинотеатры, установка Мультирум и т.п.) и способен буквально предугадывать желания хозяина. Умный дом создает максимальный уровень комфорта и безопасности при минимальном вмешательстве человека, увязывая в единое целое все системы жизнеобеспечения — от традиционных до ультрасовременных. \r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','Vladst@open.by','','','+375445972766','http://www.chelkstroy.by/','',NULL,NULL),(85,'ИП Лисанов С.Н.  ','','',4,'\r\nЗдравствуйте! Рад приветствовать Вас. Хотелось бы отметить, что грамотный и профессиональный ремонт начинается с идеи, проекта, и конечно первый этап работы — это вызов электрика. \r\n\r\nГарантия! \r\n\r\nВсегда готов выполнить для вас: \r\n\r\n-открытый монтаж электропроводки : кабель каналы, кабельные лотки \r\n-прокладка слаботочных кабелей, разводка антенных, телефонных и интернет кабелей \r\n-штробление стен под электропроводку \r\n-сборка электрощитов \r\n-установка автоматических выключателей, рубильников \r\n-установка узо \r\n-установка счетчиков электроэнергии \r\n-монтаж дополнительной системы уравнивания потенциалов \r\n-установка розеток, выключателей, проходных выключателей, датчиков движения, таймеров \r\n-монтаж и подключение теплого пола, датчиков теплого пола \r\n-монтаж понижающих трансформаторов \r\n-монтаж систем видеонаблюдения, сигнализаций, домофонов - настройка и обслуживание \r\n-подключение внутреннего электрооборудования \r\n-монтаж освещения : установка светильников, люстр, бра, светодиодных шлангов \r\n-установка и подключение кондиционеров. \r\n\r\nКачество для меня задача номер 1, но и о цене мы всегда договоримся. Я — не фирма, могу подстроиться под каждого индивидуально, каждый клиент — не просто заказчик, а настоящий друг и вип-клиент! \r\n\r\nНа сайте lisanov.by вы найдёте мой прайс-лист, но если вы знаете хорошего электрика, который работает дешевле, напишите или позвоните мне — Договоримся \r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','slisanov@gmail.com','','','8882442','http://www.lisanov.by/','',NULL,NULL),(86,'ООО «Компания СТРОЙМИР»  ','Минск, ул. Скрыганова, 6А, ком.222','logos/2700_4_1401864391_4f6bfb33dc7c67efaeda31b5a7f8529e.jpg',1,'ООО «Компания СТРОЙМИР» - мирная компания! Ее специалисты обследуют Ваше предприятие, разработают проект, установят и возьмут на обслуживание системы безопасности и климатического контроля. В сферу деятельности строительно-монтажного предприятия группы компаний «Строймир» входят системы видеонаблюдения и контроля доступа, охранная, пожарная и иные виды сигнализации, слаботочные кабельные сети и климатическое оборудование. Вы можете довериться лидеру рынка Республики Беларусь. http://stroymir-company.by/\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ ','ksm@stroymir.by','','+375 (17) 308-23-33','+375 (29) 671-33-33','http://stroymir-company.by/','+375 (29) 501-33-33',NULL,NULL),(87,'ЧП \"Аксата\"  ','г. Минск, ул. Ложинская, д. 9, секция 1','logos/2569_4_1398861177_ico02.png',1,'Установка систем видеонаблюдения для бизнеса и дома по всей Беларуси.\r\n\r\nПроектирование и установка современных систем видеонаблюдения любой сложности \r\nс гарантиями\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','vladimir@axata.by','','','+ 375 29 177-33-22','http://axata.by/','',NULL,NULL),(88,'ИП Ляшко  ',' г. Минск, ул. Карвата 62-31','logos/2481_4_1396081592_IMG_1419-1.jpg',1,'Системы видеонаблюдения\r\n\r\nВыполним монтаж, настройку и разводку от \"А\" до \"Я\" систем видеонаблюдения в вашем офисе, складе, магазине, т.е. в любом здании и сооружении.\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу \r\n','sverlilka@outlook.com','','','+37529-967-90-82','http://byrenue.by/','+37529-766-89-95, +37533-669-2',NULL,NULL),(89,'ЧТУП \"Гардо-Системз\"  ','г.Минск, ул. Карла Либкнехта, 62Б	','logos/1668_4_1375098175_logogogo.gif',1,'Видеонаблюдение, охранная сигнализация\r\n\r\nКомпания \"Гардо-системз\" предлагает оптовую поставку и монтаж систем безопасности. \r\nМы предлагаем оборудование для систем видеонаблюдения, сигнализации, контроля доступа, домофонных систем. \r\nПриглашаем к сотрудничеству инсталляторов и просто заинтересованных лиц. \r\nДействует система скидок и бонусов. \r\nДля монтажников и инсталляторов отдельные условия.\r\n\r\nДоговор на выполнение работ \r\nВозможна оплата по б/налу ','opt@gardo.by','','017-200-39-83','+375293700562','http://282.shop.by/','+375333700562',NULL,NULL),(90,'ООО \"Партнерконтрактсрой\"  ','г. Минск, ул. Старовиленский тракт 103, 1 этаж	','logos/1002_4_1364458676_psk_logo.jpg',1,'Продажа, консультирование и монтаж систем видеонаблюдения\r\n\r\n\r\nКомпания ООО \"Партнерстройконтракт\" предоставляет полный спектр услуг по созданию и обслуживанию систем охранного видеонаблюдения. Мы работаем на белорусском рынке с 2001 года и реализуем проекты от поставки оборудования и его проектирования, до инсталляции и эксплуатации систем видеонаблюдения. \r\n\r\nПартнерстройконтракт работает напрямую с крупнейшими поставщиками и производителями оборудования видеонаблюдения, что позволяет предлагать оптимальные варианты по выгодным ценам. \r\n\r\nОсновные интеллектуальные и технические ресурсы компания \"Партнерстройконтракт\" направляет на развитие и продвижение полнофункциональных, высокотехнологичных решений и продуктов систем видеонаблюдения. Наши клиенты получают консультации по всем вопросам, связанным с видеонаблюдением. \r\n\r\nС помощью специалистов нашей компании, Вы сможете подобрать системы видеонаблюдения для различных объектов: магазинов, супермаркетов, торговых центров, банков и казино, офиса, производственного объекта или склада. \r\n\r\nРаботаем с такими брендами: ACESEE, BRICKCOM, WIZEBOX, MACROSCOP, MICRODIGITAL.','psk@belpsk.com','','+375 (17) 290-60-20','+375 (29) 155-25-53','http://www.supervision.by/','',NULL,NULL),(91,'ЧУП \"Мегашоп\"  ','','logos/104_4_1357675166_image.jpg',4,'Установка и продажа систем видеонаблюдения и домофонов\r\n\r\nСистемы для видеонаблюдения за вашими загородными домами, офисами, складами, сотрудниками, клиентами, машинами и так далее.....\r\nВидеорегистраторы, камеры, винчестера, блоки питания, кабеля и разъемы \r\nГрамотно подберем, проконсультируем, скомплектуем систему видеонаблюдения. При необходимости Вы можете приобрести полностью готовую систему видеонаблюдения, Вам останется только повесить камеры \r\nНа основе этой системы можно сделать систему контроля доступа за территорией, которая будет вам дозваниваться, отправлять сообщения или включать сирену при изменении изображения в определенных участках охраняемой территории \r\nТеперь находясь в любой точке планеты, где есть интернет Вы можете смотреть в реальном времени что происходит на вашем объекте, а так-же просмотреть что происходило там ранее \r\nПри необходимости произведем качественный монтаж. \r\nВсе оборудование смотрите на нашем сайте!\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоставка материалов \r\nВозможна оплата по б/налу ','megashop.minsk@tut.by','','','+375(44)7217033','http://www.megashop.by/','+375(29)5552662',NULL,NULL),(92,'Частное Предприятие \"Гардо-Системз\"  ',' г. Минск, ул. Бородинская, 1б, оф.3','',1,'Монтаж систем безопасности\r\n\r\nКомпания \"Гардо-системз\" предлагает поставку и монтаж систем безопасности. \r\nМы предлагаем оборудование для систем видеонаблюдения, сигнализации, контроля доступа, домофонных систем. \r\nПродажа оптом и в розницу. Приглашаем к сотрудничеству инсталляторов и просто заинтересованных лиц. \r\nДействует система скидок и бонусов. \r\nВторая покупка скидка 3% \r\nТретья покупка скидка 5% \r\nЧетвертая и более скидка 7%. \r\nДля монтажников и инсталляторов отдельные условия. Звоните!\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','info@gardo.by','','+375173283062','+375 29 6313737','http://www.gardo.by/','+375 33 6313737',NULL,NULL),(93,'ВИРА ООО  ','Минск, Логойский тракт 20','',1,'Установка, обслуживание систем контроля доступа\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу ','danilatur@gmail.com','','',' +375296270830','','',NULL,NULL),(94,'ИП Лисанов С.Н.  ','','',1,'\r\nМонтаж, Подключение, Наладка! Систем доступа!','slisanov@gmail.com','','','+375 (25) 38-48-588','http://www.lisanov.by/','+375 (25) 875-29-25',NULL,NULL),(95,'ИП Гришан А.С.  ','','logos/3283_4_1426069872_.jpg',4,'Аренда погрузчика Bobcat S850\r\n\r\n\r\nАренда погрузчика с бортовым поворотом BOBCAT 850S с оператором. Грузоподъемность 2 тонны ,высота подъема ковш + паллетные вилы 3,6 метров. Маневренность и технические характеристики позволяют BOBCAT 850S выполнять любые поставленные задачи качественно и в срок. Стоимость машино-часа с оператором 380000 бел. рублей.\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nДоставка материалов \r\nВозможна оплата по б/налу \r\n','arendabobcat850s@gmail.com','','','+375292642487','','',NULL,NULL),(96,'ООО \"Нэвиум\"  ','','',1,'АРЕНДА ЭКСКАВАТОРА С ОПЕРАТОРОМ, ПРИМЕНЕНИЕ ГИДРОМОЛОТА, ЭВАКУАЦИЯ\r\n\r\nЧтобы максимально сократить сроки выполняемых работ с грунтом ООО «Нэвиум» предлагает услуги по аренде мини-экскаватора Volvo ЕС25 с оператором. Кроме работ с грунтом есть возможность использования гидромолота Demoter S-130. Для оперативного перемещения экскаватора используется эвакуатор Mercedes-Benz 815D Vario грузоподъёмностью более 5 тонн, который также можно использовать в качестве услуги по перевозке любой Вашей специальной техники в пределах габаритов.\r\n\r\nВыезд на замер и оценку работы бесплатно \r\nДоговор на выполнение работ \r\nВозможна оплата по б/налу ','dolblenie@tut.by','','(017) 396-71-42','(029) 697-64-70','http://www.rezka.by/','(029) 765-45-01','123456',NULL),(98,'Тестовая организация','Головацкого 96 38','logos/example_logo1_LWIxaF7.jpg',3,'Организация по настройке видеонаблюдения и ремонту электроники','test@gmail.com','','','+37291492050','http://www.google.com/','','',''),(99,'TestOrganization','Головацкого 96 38','logos/367603_1024x700_time-1427452644.JPG',3,'Видеонаблюдение','test@gmail.com','','','+375291492050','http://www.google.com/','','','');
/*!40000 ALTER TABLE `remont_organizationprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remont_organizationprofile_job_types`
--

DROP TABLE IF EXISTS `remont_organizationprofile_job_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remont_organizationprofile_job_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organizationprofile_id` int(11) NOT NULL,
  `worktype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizationprofile_id` (`organizationprofile_id`,`worktype_id`),
  KEY `remont_organizationprofile_job_types_d76dbb83` (`organizationprofile_id`),
  KEY `remont_organizationprofile_job_types_61925cfd` (`worktype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=401 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remont_organizationprofile_job_types`
--

LOCK TABLES `remont_organizationprofile_job_types` WRITE;
/*!40000 ALTER TABLE `remont_organizationprofile_job_types` DISABLE KEYS */;
INSERT INTO `remont_organizationprofile_job_types` VALUES (1,1,43),(8,2,43),(9,3,43),(4,4,43),(5,5,43),(7,6,43),(11,7,43),(12,8,43),(28,9,43),(14,10,38),(27,11,38),(26,12,43),(25,13,43),(24,14,35),(23,15,43),(22,16,35),(21,17,43),(29,18,35),(30,19,43),(31,20,35),(32,21,43),(33,22,43),(34,23,43),(338,71,6),(337,71,5),(38,25,5),(39,26,5),(40,27,5),(41,28,5),(50,33,8),(45,32,5),(44,31,5),(48,29,5),(52,34,8),(53,34,78),(54,35,8),(55,35,78),(56,36,8),(57,36,10),(58,37,1),(59,38,33),(60,38,12),(61,38,13),(62,38,14),(63,38,56),(64,38,27),(65,38,29),(66,38,30),(67,38,31),(68,39,33),(69,39,35),(70,39,68),(71,39,12),(72,39,13),(73,39,14),(74,39,15),(75,39,27),(76,39,29),(77,39,30),(78,39,31),(79,40,33),(80,40,35),(81,40,68),(82,40,12),(83,40,13),(84,40,14),(85,40,15),(86,40,22),(87,40,27),(88,40,29),(89,40,30),(90,40,31),(91,41,80),(92,42,80),(93,43,80),(94,44,80),(95,45,80),(96,46,33),(97,46,35),(98,46,12),(99,46,13),(100,46,14),(101,46,15),(102,46,22),(103,46,27),(104,46,29),(105,46,30),(106,46,31),(128,47,31),(127,47,30),(126,47,29),(125,47,27),(124,47,22),(123,47,15),(122,47,14),(121,47,13),(120,47,12),(119,47,35),(118,47,33),(129,48,5),(135,49,7),(134,49,6),(133,49,5),(145,50,31),(141,50,15),(142,50,81),(144,50,30),(143,50,35),(146,51,33),(147,51,35),(148,51,13),(149,51,81),(150,51,27),(151,51,29),(152,51,30),(153,52,33),(154,52,35),(155,52,12),(156,52,13),(157,52,14),(158,52,15),(159,52,81),(160,52,22),(161,52,27),(162,52,29),(163,52,30),(164,52,31),(165,53,64),(166,53,3),(167,53,5),(168,53,6),(169,53,7),(170,53,63),(171,53,11),(172,53,16),(173,53,43),(174,53,20),(175,53,21),(176,53,24),(177,53,56),(178,53,26),(179,53,59),(180,53,58),(181,53,69),(182,54,64),(183,54,33),(184,54,35),(185,54,68),(186,54,38),(187,54,71),(188,54,12),(189,54,13),(190,54,14),(191,54,15),(192,54,27),(193,54,67),(194,54,30),(195,54,22),(196,54,56),(197,54,58),(198,54,59),(199,54,29),(200,54,62),(201,54,31),(202,55,5),(203,55,6),(204,55,7),(205,56,35),(206,56,5),(207,56,6),(208,56,7),(209,56,15),(210,56,81),(211,56,22),(212,56,31),(213,57,64),(214,57,2),(215,57,67),(216,57,68),(217,57,5),(218,57,6),(219,57,7),(220,57,20),(221,57,21),(222,57,24),(223,57,57),(224,57,59),(225,57,60),(226,57,61),(227,57,62),(228,57,63),(229,58,30),(230,58,15),(231,59,5),(232,59,6),(233,59,7),(234,60,33),(235,60,35),(236,60,68),(237,60,5),(238,60,6),(239,60,7),(240,60,31),(241,60,12),(242,60,45),(243,60,14),(244,60,13),(245,60,27),(246,60,49),(247,60,50),(248,60,46),(249,60,22),(250,60,15),(251,60,29),(252,60,30),(253,60,81),(254,61,5),(255,61,6),(256,61,7),(262,62,33),(265,62,30),(266,62,15),(263,62,14),(264,62,13),(267,63,5),(268,63,6),(269,63,7),(270,64,5),(271,64,6),(272,64,7),(273,65,33),(274,65,35),(275,65,12),(276,65,13),(277,65,14),(278,65,15),(279,65,81),(280,65,22),(281,65,27),(282,65,29),(283,65,30),(284,66,5),(285,66,6),(286,66,7),(287,67,33),(288,67,35),(289,67,68),(290,67,12),(291,67,13),(292,67,14),(293,67,15),(294,67,81),(295,67,22),(296,67,27),(297,67,29),(298,67,30),(299,67,31),(300,68,33),(301,68,35),(302,68,12),(303,68,13),(304,68,14),(305,68,15),(306,68,81),(307,68,22),(308,68,27),(309,68,29),(310,68,30),(311,68,31),(312,69,33),(313,69,35),(314,69,12),(315,69,13),(316,69,14),(317,69,15),(318,69,81),(319,69,22),(320,69,27),(321,69,29),(322,69,30),(323,69,31),(324,70,33),(325,70,35),(326,70,12),(327,70,13),(328,70,14),(329,70,15),(330,70,81),(331,70,22),(332,70,27),(333,70,29),(334,70,30),(335,70,31),(339,71,7),(340,72,5),(341,72,6),(342,72,7),(343,73,6),(344,74,6),(345,75,6),(346,76,5),(347,76,6),(348,76,7),(349,77,5),(350,77,6),(351,77,7),(352,78,5),(353,78,6),(354,78,7),(355,79,5),(356,79,6),(357,80,10),(358,81,78),(359,82,8),(360,83,11),(361,84,11),(362,85,11),(363,86,19),(364,86,79),(365,87,79),(366,88,79),(367,89,79),(368,90,79),(369,91,79),(370,92,79),(371,93,10),(372,94,10),(373,95,52),(374,96,52),(399,99,78),(400,99,79),(390,98,79),(389,98,10),(388,98,9),(387,98,8),(386,98,7),(385,98,6),(384,98,5),(398,99,11),(397,99,10),(396,99,8);
/*!40000 ALTER TABLE `remont_organizationprofile_job_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remont_organizationprofile_spec`
--

DROP TABLE IF EXISTS `remont_organizationprofile_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remont_organizationprofile_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organizationprofile_id` int(11) NOT NULL,
  `workspec_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizationprofile_id` (`organizationprofile_id`,`workspec_id`),
  KEY `remont_organizationprofile_spec_d76dbb83` (`organizationprofile_id`),
  KEY `remont_organizationprofile_spec_bb23a962` (`workspec_id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remont_organizationprofile_spec`
--

LOCK TABLES `remont_organizationprofile_spec` WRITE;
/*!40000 ALTER TABLE `remont_organizationprofile_spec` DISABLE KEYS */;
INSERT INTO `remont_organizationprofile_spec` VALUES (2,47,1),(3,47,2),(4,48,2),(6,49,2),(8,50,2),(9,51,2),(10,52,2),(11,53,1),(12,53,2),(13,54,2),(14,55,2),(15,56,2),(16,57,2),(17,58,2),(18,59,2),(19,60,2),(20,61,2),(22,62,2),(23,63,2),(24,64,2),(25,65,2),(26,66,2),(27,67,2),(28,68,2),(29,69,2),(30,70,2),(32,71,2),(33,72,2),(34,73,2),(35,74,1),(36,74,2),(37,75,2),(38,76,2),(39,77,2),(40,78,2),(41,79,1),(42,79,2),(43,80,1),(44,80,2),(45,81,1),(46,81,2),(47,82,1),(48,82,2),(49,83,2),(50,84,2),(51,85,2),(52,86,1),(53,86,2),(54,87,1),(55,87,2),(56,88,1),(57,88,2),(58,89,1),(59,89,2),(60,90,1),(61,90,2),(62,91,1),(63,91,2),(64,92,1),(65,92,2),(66,93,2),(67,94,2),(68,95,1),(69,95,2),(70,96,1),(71,96,2),(73,98,1),(74,98,2),(78,99,2),(77,99,1);
/*!40000 ALTER TABLE `remont_organizationprofile_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remont_organizationprofile_work_cities`
--

DROP TABLE IF EXISTS `remont_organizationprofile_work_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remont_organizationprofile_work_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organizationprofile_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizationprofile_id` (`organizationprofile_id`,`city_id`),
  KEY `remont_organizationprofile_work_cities_d76dbb83` (`organizationprofile_id`),
  KEY `remont_organizationprofile_work_cities_c7141997` (`city_id`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remont_organizationprofile_work_cities`
--

LOCK TABLES `remont_organizationprofile_work_cities` WRITE;
/*!40000 ALTER TABLE `remont_organizationprofile_work_cities` DISABLE KEYS */;
INSERT INTO `remont_organizationprofile_work_cities` VALUES (2,25,1),(3,26,1),(4,27,4),(5,28,1),(11,29,4),(9,32,4),(8,31,4),(13,33,4),(15,34,4),(16,35,1),(17,36,1),(18,37,4),(19,38,1),(20,39,1),(21,40,1),(22,41,1),(23,42,1),(24,43,1),(25,44,1),(26,45,1),(27,46,1),(29,47,4),(30,48,1),(32,49,1),(34,50,1),(35,51,4),(36,52,4),(37,53,1),(38,54,1),(39,55,1),(40,56,4),(41,57,1),(42,58,4),(43,59,1),(44,60,1),(45,61,1),(47,62,4),(48,63,1),(49,64,4),(50,65,1),(51,66,4),(52,67,4),(53,68,4),(54,69,4),(55,70,1),(57,71,1),(58,72,1),(59,73,4),(60,74,1),(61,75,4),(62,76,1),(63,77,1),(64,78,4),(65,79,1),(66,80,1),(67,81,1),(68,82,1),(69,83,1),(70,84,1),(71,85,4),(72,86,1),(73,87,1),(74,88,1),(75,89,1),(76,90,1),(77,91,4),(78,92,1),(79,93,1),(80,94,1),(81,95,4),(82,96,1),(88,98,3),(87,98,2),(86,98,1),(94,99,3),(93,99,2),(92,99,1);
/*!40000 ALTER TABLE `remont_organizationprofile_work_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remont_usermedia`
--

DROP TABLE IF EXISTS `remont_usermedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remont_usermedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `work_file` varchar(100) NOT NULL,
  `file_type` varchar(10) NOT NULL,
  `account_id` int(11),
  PRIMARY KEY (`id`),
  KEY `remont_usermedia_8a089c2a` (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remont_usermedia`
--

LOCK TABLES `remont_usermedia` WRITE;
/*!40000 ALTER TABLE `remont_usermedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `remont_usermedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remont_userprofile`
--

DROP TABLE IF EXISTS `remont_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remont_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_type` varchar(20) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `contact_name` varchar(60) NOT NULL,
  `profile_image` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remont_userprofile`
--

LOCK TABLES `remont_userprofile` WRITE;
/*!40000 ALTER TABLE `remont_userprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `remont_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remont_workcategory`
--

DROP TABLE IF EXISTS `remont_workcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remont_workcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remont_workcategory`
--

LOCK TABLES `remont_workcategory` WRITE;
/*!40000 ALTER TABLE `remont_workcategory` DISABLE KEYS */;
INSERT INTO `remont_workcategory` VALUES (1,'Строительство. Монтажные работы','icons/113.png'),(2,'Аренда строительной техники и оборудования','icons/110.png'),(3,'Отопление. Газоснабжение','icons/110_UK7Q0UH.png'),(4,'Клининговые услуги','icons/110_21UV6V3.png'),(6,'Ландшафт, благоустройство территории','icons/110_FUoOrH1.png'),(7,'Ремонтные и отделочные работы','icons/110_QTWnhxV.png'),(8,'Архитектура. Дизайн. Проектирование. Оценка','icons/110_Q5aW7hw.png'),(9,'Электромонтажные работы','icons/110_QaDj7UO.png'),(10,'Монтаж охранных систем. Видеонаблюдение','icons/110_0K0Pct0.png'),(11,'Сантехнические работы','icons/110_jxc0xUH.png'),(12,'Вентиляция. Кондиционирование','icons/110_o8Ug6xn.png'),(13,'Мелкий бытовой ремонт. \"Муж на час\"','icons/110_ZhjG6fD.png');
/*!40000 ALTER TABLE `remont_workcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remont_workphoto`
--

DROP TABLE IF EXISTS `remont_workphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remont_workphoto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(100) NOT NULL,
  `album_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `remont_workphoto_95c3b9df` (`album_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remont_workphoto`
--

LOCK TABLES `remont_workphoto` WRITE;
/*!40000 ALTER TABLE `remont_workphoto` DISABLE KEYS */;
INSERT INTO `remont_workphoto` VALUES (1,'TestOrganization/Work in Gomel/367603_1024x700_time-1427452644.JPG',1),(2,'TestOrganization/Work in Gomel/367604_1024x700_time-1427452644.JPG',1),(3,'TestOrganization/Work in Gomel/367605_1024x700_time-1427452644.JPG',1),(4,'TestOrganization/Work in Gomel/367606_1024x700_time-1427452644.JPG',1),(5,'TestOrganization/Work in Gomel/367607_1024x700_time-1427452644.JPG',1),(6,'TestOrganization/Work In Minsk/352217_1024x700_time-1425379187.jpg',2),(7,'TestOrganization/Work In Minsk/352218_1024x700_time-1425379187.jpg',2),(8,'TestOrganization/Work In Minsk/352219_1024x700_time-1425379187.jpg',2),(9,'TestOrganization/Work In Minsk/352220_1024x700_time-1425379187.jpg',2);
/*!40000 ALTER TABLE `remont_workphoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remont_workphotoalbum`
--

DROP TABLE IF EXISTS `remont_workphotoalbum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remont_workphotoalbum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `remont_workphotoalbum_26b2345e` (`organization_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remont_workphotoalbum`
--

LOCK TABLES `remont_workphotoalbum` WRITE;
/*!40000 ALTER TABLE `remont_workphotoalbum` DISABLE KEYS */;
INSERT INTO `remont_workphotoalbum` VALUES (1,'Work in Gomel',99),(2,'Work In Minsk',99);
/*!40000 ALTER TABLE `remont_workphotoalbum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remont_workspec`
--

DROP TABLE IF EXISTS `remont_workspec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remont_workspec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remont_workspec`
--

LOCK TABLES `remont_workspec` WRITE;
/*!40000 ALTER TABLE `remont_workspec` DISABLE KEYS */;
INSERT INTO `remont_workspec` VALUES (1,'industrial'),(2,'individual');
/*!40000 ALTER TABLE `remont_workspec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remont_worktype`
--

DROP TABLE IF EXISTS `remont_worktype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remont_worktype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `remont_worktype_b583a629` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remont_worktype`
--

LOCK TABLES `remont_worktype` WRITE;
/*!40000 ALTER TABLE `remont_worktype` DISABLE KEYS */;
INSERT INTO `remont_worktype` VALUES (1,'Дизайн помещений',8),(2,'Архитектурное проектирование',8),(3,'Согласование строительных работ',8),(4,'Перепланировка',8),(5,'Монтаж электропроводки',9),(6,'Монтаж электрического \"теплого пола\"',9),(7,'Установка светильников, розеток, выключателей',9),(8,'Установка охранной сигнализации',10),(9,'Установка видеонаблюдения',9),(10,'Установка системы контроля доступа',10),(11,'Системы автоматизации. \"Умный дом\"',10),(12,'Ремонт под \"ключ\"',7),(13,'Шпаклевочные работы',7),(14,'Плиточные и облицовочные работы',7),(15,'Монтаж и устройство потолков',7),(16,'Монтаж ворот, заборов, ролетов',1),(17,'Монтаж систем вентиляции',12),(18,'Проектирование систем кондиционирования и вентиляции',12),(19,'Монтаж систем кондиционирования',12),(20,'Монтаж водопровода, канализации в помещении',11),(21,'Установка и подключение сантехники',11),(22,'Установка окон, дверей. Остекление балконов',7),(23,'Бурение и устройство скважин',11),(24,'Наружний монтаж водопровада, канализации',11),(25,'Установка систем фильтрации воды',11),(26,'Септик. Системы автономной канализации',11),(27,'Штукатурные работы',7),(28,'Прочистка канализации',11),(29,'Декоративная штукатурка',7),(30,'Работа с гипсокартоном',7),(31,'Укладка, настил полов. Стяжка пола',7),(32,'Ландшафтный дизайн',6),(33,'Малярные работы',7),(34,'Декоративные водопады, водоемы. Фонтаны',6),(35,'Отделка балконов',7),(36,'Детские площадки',6),(37,'Услуги по уходу за участком',6),(38,'Художественная роспись. Фрески',7),(39,'Озеленение',6),(40,'Укладка тротуарной плитки, дорожек',6),(41,'Автоматический полив',6),(42,'Монтаж и строительство бассейнов',6),(43,'Мелкий бытовой ремонт',13),(44,'Газоснабжение',3),(45,'Прокладка и монтаж систем отопления',3),(46,'Обслуживание, ремонт отопления',3),(47,'Система теплотрасс',3),(48,'Проектирование отопления',3),(49,'Монтаж котельного оборудования',3),(50,'Монтаж и устройство водяных \"теплых полов\"',3),(51,'Аренда строительной техники',2),(52,'Аренда спецтехники',2),(53,'Аренда строительного инструмента',2),(54,'Аренда строительного оборудования',2),(55,'Аренда опалубки',2),(56,'Строительство домов, коттеджей, дач под \"ключ\"',1),(57,'Строительство каркасных домов',1),(58,'Промышленные, торговые здания и сооружения',1),(59,'Строительство домов из блоков и кирпича',1),(60,'Строительство деревянных домов и срубов',1),(61,'Строительство беседок',1),(62,'Кровельные работы',1),(63,'Кладка кирпича,стеновых блоков и плит',1),(64,'Устройство фундамента. Работы с бетоном',1),(65,'Сварочные работы',1),(66,'Камины. Печи. Дымоходы',1),(67,'Строительство бани, сауны',1),(68,'Фасадные работы',1),(69,'Алмазное сверление. Резка. Демонтажные работы',1),(70,'Изоляционные работы',1),(71,'Монтаж и отделка лестниц',1),(72,'Работа с металлом. Ковка',1),(73,'Строительство бассейнов',1),(74,'Уборка помещений',4),(75,'Вывоз строительного мусора',4),(76,'Мойка фасадов',4),(77,'Аренда инструмента и оборудования',4),(78,'Установка пожарной сигнализации',10),(79,'Видеонаблюдение',10),(80,'Техническое обследование зданий',8),(81,'Облицовка панелями',7);
/*!40000 ALTER TABLE `remont_worktype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-24  8:58:34
