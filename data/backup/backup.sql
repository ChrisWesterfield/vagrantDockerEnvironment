-- MySQL dump 10.16  Distrib 10.1.20-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.20-MariaDB-1~jessie

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
-- Current Database: `intranet`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `intranet` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `intranet`;

--
-- Table structure for table `accounts_account`
--

DROP TABLE IF EXISTS `accounts_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `tree_root` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `type` int(11) NOT NULL,
  `left` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `right` int(11) NOT NULL,
  `account_number` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `bank_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_name` longtext COLLATE utf8_unicode_ci,
  `additional` longtext COLLATE utf8_unicode_ci,
  `notes` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_157524D89033212A` (`tenant_id`),
  KEY `IDX_157524D8A977936C` (`tree_root`),
  KEY `IDX_157524D8727ACA70` (`parent_id`),
  KEY `IDX_157524D8D40407ED` (`log_created_by`),
  KEY `IDX_157524D81CE8DE5A` (`log_updated_by`),
  CONSTRAINT `FK_157524D81CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_157524D8727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `accounts_account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_157524D89033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_157524D8A977936C` FOREIGN KEY (`tree_root`) REFERENCES `accounts_account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_157524D8D40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account`
--

LOCK TABLES `accounts_account` WRITE;
/*!40000 ALTER TABLE `accounts_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_positions`
--

DROP TABLE IF EXISTS `accounts_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `paymnet_position_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `sorting_position` int(11) NOT NULL,
  `sorting_category` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `date_of_position` datetime NOT NULL,
  `ammount` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_EB1EABD5BAC4638F` (`paymnet_position_id`),
  KEY `IDX_EB1EABD59033212A` (`tenant_id`),
  KEY `IDX_EB1EABD59B6B5FBA` (`account_id`),
  KEY `IDX_EB1EABD5D40407ED` (`log_created_by`),
  KEY `IDX_EB1EABD51CE8DE5A` (`log_updated_by`),
  CONSTRAINT `FK_EB1EABD51CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_EB1EABD59033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_EB1EABD59B6B5FBA` FOREIGN KEY (`account_id`) REFERENCES `accounts_account` (`id`),
  CONSTRAINT `FK_EB1EABD5BAC4638F` FOREIGN KEY (`paymnet_position_id`) REFERENCES `invoice_payment` (`id`),
  CONSTRAINT `FK_EB1EABD5D40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_positions`
--

LOCK TABLES `accounts_positions` WRITE;
/*!40000 ALTER TABLE `accounts_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_action`
--

DROP TABLE IF EXISTS `acl_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'core',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1C96BBC2D40407ED` (`log_created_by`),
  KEY `IDX_1C96BBC21CE8DE5A` (`log_updated_by`),
  CONSTRAINT `FK_1C96BBC21CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_1C96BBC2D40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_action`
--

LOCK TABLES `acl_action` WRITE;
/*!40000 ALTER TABLE `acl_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_map`
--

DROP TABLE IF EXISTS `acl_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `acl_mapping_index` (`action_id`,`role_id`,`resource_id`),
  KEY `IDX_9D8D13CA9D32F035` (`action_id`),
  KEY `IDX_9D8D13CA89329D25` (`resource_id`),
  KEY `IDX_9D8D13CAD60322AC` (`role_id`),
  CONSTRAINT `FK_9D8D13CA89329D25` FOREIGN KEY (`resource_id`) REFERENCES `acl_resource` (`id`),
  CONSTRAINT `FK_9D8D13CA9D32F035` FOREIGN KEY (`action_id`) REFERENCES `acl_action` (`id`),
  CONSTRAINT `FK_9D8D13CAD60322AC` FOREIGN KEY (`role_id`) REFERENCES `acl_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_map`
--

LOCK TABLES `acl_map` WRITE;
/*!40000 ALTER TABLE `acl_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_resource`
--

DROP TABLE IF EXISTS `acl_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'core',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `tree_left` int(11) NOT NULL,
  `tree_level` int(11) NOT NULL,
  `tree_right` int(11) NOT NULL,
  `tree_root` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_BE9757175E237E06` (`name`),
  KEY `IDX_BE975717D40407ED` (`log_created_by`),
  KEY `IDX_BE9757171CE8DE5A` (`log_updated_by`),
  KEY `IDX_BE975717727ACA70` (`parent_id`),
  CONSTRAINT `FK_BE9757171CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_BE975717727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `acl_resource` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_BE975717D40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_resource`
--

LOCK TABLES `acl_resource` WRITE;
/*!40000 ALTER TABLE `acl_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_role`
--

DROP TABLE IF EXISTS `acl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'core',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `tree_left` int(11) NOT NULL,
  `tree_level` int(11) NOT NULL,
  `tree_right` int(11) NOT NULL,
  `tree_root` int(11) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_7065EB79D40407ED` (`log_created_by`),
  KEY `IDX_7065EB791CE8DE5A` (`log_updated_by`),
  KEY `IDX_7065EB79727ACA70` (`parent_id`),
  CONSTRAINT `FK_7065EB791CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_7065EB79727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `acl_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7065EB79D40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_role`
--

LOCK TABLES `acl_role` WRITE;
/*!40000 ALTER TABLE `acl_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_role_user_map`
--

DROP TABLE IF EXISTS `acl_role_user_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_role_user_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_66DAC6AD40407ED` (`log_created_by`),
  KEY `IDX_66DAC6A1CE8DE5A` (`log_updated_by`),
  KEY `IDX_66DAC6AA76ED395` (`user_id`),
  KEY `IDX_66DAC6AD60322AC` (`role_id`),
  CONSTRAINT `FK_66DAC6A1CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_66DAC6AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_66DAC6AD40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_66DAC6AD60322AC` FOREIGN KEY (`role_id`) REFERENCES `acl_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_role_user_map`
--

LOCK TABLES `acl_role_user_map` WRITE;
/*!40000 ALTER TABLE `acl_role_user_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_role_user_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_category`
--

DROP TABLE IF EXISTS `article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `tree_root` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `left` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `right` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_53A4EDAA9033212A` (`tenant_id`),
  KEY `IDX_53A4EDAAA977936C` (`tree_root`),
  KEY `IDX_53A4EDAA727ACA70` (`parent_id`),
  KEY `IDX_53A4EDAAD40407ED` (`log_created_by`),
  KEY `IDX_53A4EDAA1CE8DE5A` (`log_updated_by`),
  CONSTRAINT `FK_53A4EDAA1CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_53A4EDAA727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `accounts_account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_53A4EDAA9033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_53A4EDAAA977936C` FOREIGN KEY (`tree_root`) REFERENCES `accounts_account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_53A4EDAAD40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_category`
--

LOCK TABLES `article_category` WRITE;
/*!40000 ALTER TABLE `article_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_images`
--

DROP TABLE IF EXISTS `article_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `article_id` int(11) NOT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `image` longblob,
  `meta_data` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8AD829EA9033212A` (`tenant_id`),
  KEY `IDX_8AD829EA7294869C` (`article_id`),
  KEY `IDX_8AD829EAD40407ED` (`log_created_by`),
  KEY `IDX_8AD829EA1CE8DE5A` (`log_updated_by`),
  CONSTRAINT `FK_8AD829EA1CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_8AD829EA7294869C` FOREIGN KEY (`article_id`) REFERENCES `article_main` (`id`),
  CONSTRAINT `FK_8AD829EA9033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_8AD829EAD40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_images`
--

LOCK TABLES `article_images` WRITE;
/*!40000 ALTER TABLE `article_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_main`
--

DROP TABLE IF EXISTS `article_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `article_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F6A4A65FC5788D4` (`article_number`),
  KEY `IDX_F6A4A659033212A` (`tenant_id`),
  KEY `IDX_F6A4A65D40407ED` (`log_created_by`),
  KEY `IDX_F6A4A651CE8DE5A` (`log_updated_by`),
  CONSTRAINT `FK_F6A4A651CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_F6A4A659033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_F6A4A65D40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_main`
--

LOCK TABLES `article_main` WRITE;
/*!40000 ALTER TABLE `article_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_article`
--

DROP TABLE IF EXISTS `category_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_article` (
  `category_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`article_id`),
  KEY `IDX_C5E24E1812469DE2` (`category_id`),
  KEY `IDX_C5E24E187294869C` (`article_id`),
  CONSTRAINT `FK_C5E24E1812469DE2` FOREIGN KEY (`category_id`) REFERENCES `article_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C5E24E187294869C` FOREIGN KEY (`article_id`) REFERENCES `article_main` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_article`
--

LOCK TABLES `category_article` WRITE;
/*!40000 ALTER TABLE `category_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `type` int(11) NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci,
  `post_code` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `last_contact` datetime DEFAULT NULL,
  `contact_period` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `next_contact_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4FBF094FD40407ED` (`log_created_by`),
  KEY `IDX_4FBF094F1CE8DE5A` (`log_updated_by`),
  KEY `IDX_4FBF094F9033212A` (`tenant_id`),
  CONSTRAINT `FK_4FBF094F1CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_4FBF094F9033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_4FBF094FD40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,NULL,NULL,1,'Admin Company','Admin','User','Administrator',0,'Street 1\r\nStreet 2\r\nStreet 3','12345','City','DE','admin@dev','2017-01-16 23:35:51','2017-01-16 23:35:51',NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_notes`
--

DROP TABLE IF EXISTS `company_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_46EA04E99033212A` (`tenant_id`),
  KEY `IDX_46EA04E99395C3F3` (`customer_id`),
  KEY `IDX_46EA04E9D40407ED` (`log_created_by`),
  KEY `IDX_46EA04E91CE8DE5A` (`log_updated_by`),
  CONSTRAINT `FK_46EA04E91CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_46EA04E99033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_46EA04E99395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_46EA04E9D40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_notes`
--

LOCK TABLES `company_notes` WRITE;
/*!40000 ALTER TABLE `company_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_main`
--

DROP TABLE IF EXISTS `contract_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `term_period` int(11) NOT NULL,
  `contract_start` datetime NOT NULL,
  `contract_terms` longtext COLLATE utf8_unicode_ci NOT NULL,
  `canlation_time` int(11) NOT NULL,
  `canclation_terms` longtext COLLATE utf8_unicode_ci NOT NULL,
  `template` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_D75D830C9033212A` (`tenant_id`),
  KEY `IDX_D75D830CD40407ED` (`log_created_by`),
  KEY `IDX_D75D830C1CE8DE5A` (`log_updated_by`),
  KEY `IDX_D75D830C9395C3F3` (`customer_id`),
  CONSTRAINT `FK_D75D830C1CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_D75D830C9033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_D75D830C9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_D75D830CD40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_main`
--

LOCK TABLES `contract_main` WRITE;
/*!40000 ALTER TABLE `contract_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_notes`
--

DROP TABLE IF EXISTS `contract_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `contract_id` int(11) NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_421A3AA89033212A` (`tenant_id`),
  KEY `IDX_421A3AA8D40407ED` (`log_created_by`),
  KEY `IDX_421A3AA81CE8DE5A` (`log_updated_by`),
  KEY `IDX_421A3AA82576E0FD` (`contract_id`),
  CONSTRAINT `FK_421A3AA81CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_421A3AA82576E0FD` FOREIGN KEY (`contract_id`) REFERENCES `contract_main` (`id`),
  CONSTRAINT `FK_421A3AA89033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_421A3AA8D40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_notes`
--

LOCK TABLES `contract_notes` WRITE;
/*!40000 ALTER TABLE `contract_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_position`
--

DROP TABLE IF EXISTS `contract_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `payed` tinyint(1) NOT NULL DEFAULT '0',
  `meta_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ammount` double NOT NULL,
  `price` double NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D39BFF0A9033212A` (`tenant_id`),
  KEY `IDX_D39BFF0AD40407ED` (`log_created_by`),
  KEY `IDX_D39BFF0A1CE8DE5A` (`log_updated_by`),
  KEY `IDX_D39BFF0A7294869C` (`article_id`),
  CONSTRAINT `FK_D39BFF0A1CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_D39BFF0A7294869C` FOREIGN KEY (`article_id`) REFERENCES `article_main` (`id`),
  CONSTRAINT `FK_D39BFF0A9033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_D39BFF0AD40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_position`
--

LOCK TABLES `contract_position` WRITE;
/*!40000 ALTER TABLE `contract_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dms_directory`
--

DROP TABLE IF EXISTS `dms_directory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dms_directory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `tree_root` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `left` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `right` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `source_directory` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F86D22EF9033212A` (`tenant_id`),
  KEY `IDX_F86D22EFA977936C` (`tree_root`),
  KEY `IDX_F86D22EF727ACA70` (`parent_id`),
  KEY `IDX_F86D22EFD40407ED` (`log_created_by`),
  KEY `IDX_F86D22EF1CE8DE5A` (`log_updated_by`),
  KEY `IDX_F86D22EF9395C3F3` (`customer_id`),
  CONSTRAINT `FK_F86D22EF1CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_F86D22EF727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `accounts_account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F86D22EF9033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_F86D22EF9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_F86D22EFA977936C` FOREIGN KEY (`tree_root`) REFERENCES `accounts_account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F86D22EFD40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dms_directory`
--

LOCK TABLES `dms_directory` WRITE;
/*!40000 ALTER TABLE `dms_directory` DISABLE KEYS */;
/*!40000 ALTER TABLE `dms_directory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dms_document`
--

DROP TABLE IF EXISTS `dms_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dms_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `revisions_id` int(11) DEFAULT NULL,
  `revision_id` int(11) NOT NULL,
  `metadata_id` int(11) NOT NULL,
  `tree_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C61FAF041DFA7C8F` (`revision_id`),
  UNIQUE KEY `UNIQ_C61FAF04DC9EE959` (`metadata_id`),
  KEY `IDX_C61FAF049033212A` (`tenant_id`),
  KEY `IDX_C61FAF049395C3F3` (`customer_id`),
  KEY `IDX_C61FAF049A6BD9E8` (`revisions_id`),
  KEY `IDX_C61FAF0478B64A2` (`tree_id`),
  KEY `IDX_C61FAF04D40407ED` (`log_created_by`),
  KEY `IDX_C61FAF041CE8DE5A` (`log_updated_by`),
  CONSTRAINT `FK_C61FAF041CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_C61FAF041DFA7C8F` FOREIGN KEY (`revision_id`) REFERENCES `dms_revision` (`id`),
  CONSTRAINT `FK_C61FAF0478B64A2` FOREIGN KEY (`tree_id`) REFERENCES `dms_directory` (`id`),
  CONSTRAINT `FK_C61FAF049033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_C61FAF049395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_C61FAF049A6BD9E8` FOREIGN KEY (`revisions_id`) REFERENCES `dms_revision` (`id`),
  CONSTRAINT `FK_C61FAF04D40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_C61FAF04DC9EE959` FOREIGN KEY (`metadata_id`) REFERENCES `dms_metadata` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dms_document`
--

LOCK TABLES `dms_document` WRITE;
/*!40000 ALTER TABLE `dms_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `dms_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dms_metadata`
--

DROP TABLE IF EXISTS `dms_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dms_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `meta_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_516211669033212A` (`tenant_id`),
  KEY `IDX_51621166D40407ED` (`log_created_by`),
  KEY `IDX_516211661CE8DE5A` (`log_updated_by`),
  CONSTRAINT `FK_516211661CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_516211669033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_51621166D40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dms_metadata`
--

LOCK TABLES `dms_metadata` WRITE;
/*!40000 ALTER TABLE `dms_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `dms_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dms_revision`
--

DROP TABLE IF EXISTS `dms_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dms_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `md5_string` longtext COLLATE utf8_unicode_ci NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_731530BE9033212A` (`tenant_id`),
  KEY `IDX_731530BED40407ED` (`log_created_by`),
  KEY `IDX_731530BE1CE8DE5A` (`log_updated_by`),
  CONSTRAINT `FK_731530BE1CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_731530BE9033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_731530BED40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dms_revision`
--

LOCK TABLES `dms_revision` WRITE;
/*!40000 ALTER TABLE `dms_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `dms_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_log_entries`
--

DROP TABLE IF EXISTS `ext_log_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_log_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `logged_at` datetime NOT NULL,
  `object_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` int(11) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `log_class_lookup_idx` (`object_class`),
  KEY `log_date_lookup_idx` (`logged_at`),
  KEY `log_user_lookup_idx` (`username`),
  KEY `log_version_lookup_idx` (`object_id`,`object_class`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_log_entries`
--

LOCK TABLES `ext_log_entries` WRITE;
/*!40000 ALTER TABLE `ext_log_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ext_log_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_translations`
--

DROP TABLE IF EXISTS `ext_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `object_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lookup_unique_idx` (`locale`,`object_class`,`field`,`foreign_key`),
  KEY `translations_lookup_idx` (`locale`,`object_class`,`foreign_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_translations`
--

LOCK TABLES `ext_translations` WRITE;
/*!40000 ALTER TABLE `ext_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ext_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_document`
--

DROP TABLE IF EXISTS `invoice_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `meta_data_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `notes` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C741D02E7E8EBEDE` (`meta_data_id`),
  KEY `IDX_C741D02E9033212A` (`tenant_id`),
  KEY `IDX_C741D02ED40407ED` (`log_created_by`),
  KEY `IDX_C741D02E1CE8DE5A` (`log_updated_by`),
  KEY `IDX_C741D02E9395C3F3` (`customer_id`),
  CONSTRAINT `FK_C741D02E1CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_C741D02E7E8EBEDE` FOREIGN KEY (`meta_data_id`) REFERENCES `invoice_metadata` (`id`),
  CONSTRAINT `FK_C741D02E9033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_C741D02E9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_C741D02ED40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_document`
--

LOCK TABLES `invoice_document` WRITE;
/*!40000 ALTER TABLE `invoice_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_metadata`
--

DROP TABLE IF EXISTS `invoice_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `payed` tinyint(1) NOT NULL DEFAULT '0',
  `meta_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_503C6E4C9033212A` (`tenant_id`),
  KEY `IDX_503C6E4CD40407ED` (`log_created_by`),
  KEY `IDX_503C6E4C1CE8DE5A` (`log_updated_by`),
  CONSTRAINT `FK_503C6E4C1CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_503C6E4C9033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_503C6E4CD40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_metadata`
--

LOCK TABLES `invoice_metadata` WRITE;
/*!40000 ALTER TABLE `invoice_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_payment`
--

DROP TABLE IF EXISTS `invoice_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9FF1B2DE9033212A` (`tenant_id`),
  KEY `IDX_9FF1B2DEC33F7837` (`document_id`),
  KEY `IDX_9FF1B2DED40407ED` (`log_created_by`),
  KEY `IDX_9FF1B2DE1CE8DE5A` (`log_updated_by`),
  KEY `IDX_9FF1B2DE9395C3F3` (`customer_id`),
  CONSTRAINT `FK_9FF1B2DE1CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_9FF1B2DE9033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_9FF1B2DE9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_9FF1B2DEC33F7837` FOREIGN KEY (`document_id`) REFERENCES `invoice_document` (`id`),
  CONSTRAINT `FK_9FF1B2DED40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_payment`
--

LOCK TABLES `invoice_payment` WRITE;
/*!40000 ALTER TABLE `invoice_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_position`
--

DROP TABLE IF EXISTS `invoice_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `payed` tinyint(1) NOT NULL DEFAULT '0',
  `meta_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ammount` double NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5904BEAD9033212A` (`tenant_id`),
  KEY `IDX_5904BEADC33F7837` (`document_id`),
  KEY `IDX_5904BEADD40407ED` (`log_created_by`),
  KEY `IDX_5904BEAD1CE8DE5A` (`log_updated_by`),
  KEY `IDX_5904BEAD7294869C` (`article_id`),
  CONSTRAINT `FK_5904BEAD1CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_5904BEAD7294869C` FOREIGN KEY (`article_id`) REFERENCES `article_main` (`id`),
  CONSTRAINT `FK_5904BEAD9033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_5904BEADC33F7837` FOREIGN KEY (`document_id`) REFERENCES `invoice_document` (`id`),
  CONSTRAINT `FK_5904BEADD40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_position`
--

LOCK TABLES `invoice_position` WRITE;
/*!40000 ALTER TABLE `invoice_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages_list`
--

DROP TABLE IF EXISTS `messages_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_9625B2A59033212A` (`tenant_id`),
  KEY `IDX_9625B2A59395C3F3` (`customer_id`),
  KEY `IDX_9625B2A52989F1FD` (`invoice_id`),
  CONSTRAINT `FK_9625B2A52989F1FD` FOREIGN KEY (`invoice_id`) REFERENCES `invoice_document` (`id`),
  CONSTRAINT `FK_9625B2A59033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_9625B2A59395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages_list`
--

LOCK TABLES `messages_list` WRITE;
/*!40000 ALTER TABLE `messages_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_article`
--

DROP TABLE IF EXISTS `news_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `typ_id` int(11) NOT NULL,
  `headline` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `teaser` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `notes` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_55DE12809033212A` (`tenant_id`),
  KEY `IDX_55DE1280D40407ED` (`log_created_by`),
  KEY `IDX_55DE12801CE8DE5A` (`log_updated_by`),
  KEY `IDX_55DE1280278CD074` (`typ_id`),
  CONSTRAINT `FK_55DE12801CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_55DE1280278CD074` FOREIGN KEY (`typ_id`) REFERENCES `news_typ` (`id`),
  CONSTRAINT `FK_55DE12809033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_55DE1280D40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_article`
--

LOCK TABLES `news_article` WRITE;
/*!40000 ALTER TABLE `news_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_category`
--

DROP TABLE IF EXISTS `news_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `tree_root` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `left` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `right` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4F72BA909033212A` (`tenant_id`),
  KEY `IDX_4F72BA90A977936C` (`tree_root`),
  KEY `IDX_4F72BA90727ACA70` (`parent_id`),
  KEY `IDX_4F72BA90D40407ED` (`log_created_by`),
  KEY `IDX_4F72BA901CE8DE5A` (`log_updated_by`),
  CONSTRAINT `FK_4F72BA901CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_4F72BA90727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `accounts_account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4F72BA909033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_4F72BA90A977936C` FOREIGN KEY (`tree_root`) REFERENCES `accounts_account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4F72BA90D40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_category`
--

LOCK TABLES `news_category` WRITE;
/*!40000 ALTER TABLE `news_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_category_mapping`
--

DROP TABLE IF EXISTS `news_category_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_category_mapping` (
  `news_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`,`category_id`),
  KEY `IDX_A620ABAB5A459A0` (`news_id`),
  KEY `IDX_A620ABA12469DE2` (`category_id`),
  CONSTRAINT `FK_A620ABA12469DE2` FOREIGN KEY (`category_id`) REFERENCES `news_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A620ABAB5A459A0` FOREIGN KEY (`news_id`) REFERENCES `news_article` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_category_mapping`
--

LOCK TABLES `news_category_mapping` WRITE;
/*!40000 ALTER TABLE `news_category_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_category_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_typ`
--

DROP TABLE IF EXISTS `news_typ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_typ` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `export_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `meta_data` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_BFF6C53F9033212A` (`tenant_id`),
  KEY `IDX_BFF6C53FD40407ED` (`log_created_by`),
  KEY `IDX_BFF6C53F1CE8DE5A` (`log_updated_by`),
  CONSTRAINT `FK_BFF6C53F1CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_BFF6C53F9033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_BFF6C53FD40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_typ`
--

LOCK TABLES `news_typ` WRITE;
/*!40000 ALTER TABLE `news_typ` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_typ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_configuration`
--

DROP TABLE IF EXISTS `system_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `modul` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'core',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_configuration`
--

LOCK TABLES `system_configuration` WRITE;
/*!40000 ALTER TABLE `system_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_profiler`
--

DROP TABLE IF EXISTS `system_profiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_profiler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `perfdata` longblob,
  `cookie` longblob,
  `request_post` longblob,
  `request_get` longblob,
  `pmu` int(11) DEFAULT NULL,
  `wt` int(11) DEFAULT NULL,
  `cpu` int(11) DEFAULT NULL,
  `server_id` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT 't11',
  `aggregateCalls_include` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `raw` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_profiler`
--

LOCK TABLES `system_profiler` WRITE;
/*!40000 ALTER TABLE `system_profiler` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_profiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_schedular`
--

DROP TABLE IF EXISTS `system_schedular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_schedular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `command` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `arguments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cron_expression` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_execution` datetime DEFAULT NULL,
  `last_return_code` int(11) DEFAULT NULL,
  `log_file` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `execute_immediately` tinyint(1) NOT NULL,
  `disabled` tinyint(1) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_schedular`
--

LOCK TABLES `system_schedular` WRITE;
/*!40000 ALTER TABLE `system_schedular` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_schedular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user`
--

DROP TABLE IF EXISTS `system_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `tenant_default_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `password` longtext COLLATE utf8_unicode_ci,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `credentials_expire_date` datetime DEFAULT NULL,
  `account_expire_date` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9C5F65BF94069D85` (`tenant_default_id`),
  KEY `IDX_9C5F65BF9033212A` (`tenant_id`),
  KEY `IDX_9C5F65BFD40407ED` (`log_created_by`),
  KEY `IDX_9C5F65BF1CE8DE5A` (`log_updated_by`),
  KEY `IDX_9C5F65BF979B1AD6` (`company_id`),
  CONSTRAINT `FK_9C5F65BF1CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_9C5F65BF9033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_9C5F65BF94069D85` FOREIGN KEY (`tenant_default_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_9C5F65BF979B1AD6` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_9C5F65BFD40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user`
--

LOCK TABLES `system_user` WRITE;
/*!40000 ALTER TABLE `system_user` DISABLE KEYS */;
INSERT INTO `system_user` VALUES (1,NULL,NULL,NULL,1,1,'admin@dev','admin','admin','user','2017-01-16 23:35:51','2017-01-16 23:35:51',NULL,1,'$2y$12$zIC.871sgIvPfXIz3wvJe.7xOIJ2tX1Ib9IdqG33PiyCnqtixhVha','ROLE_ROOT',NULL,NULL,NULL);
/*!40000 ALTER TABLE `system_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_versions`
--

DROP TABLE IF EXISTS `system_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_versions`
--

LOCK TABLES `system_versions` WRITE;
/*!40000 ALTER TABLE `system_versions` DISABLE KEYS */;
INSERT INTO `system_versions` VALUES ('20170102221131'),('20170107212036'),('20170115194350'),('20170115210824');
/*!40000 ALTER TABLE `system_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_web_profiler`
--

DROP TABLE IF EXISTS `system_web_profiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_web_profiler` (
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci,
  `ip` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` int(10) unsigned NOT NULL,
  `parent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL,
  `status_code` int(11) NOT NULL,
  PRIMARY KEY (`token`),
  KEY `system_profiler_created` (`created_at`),
  KEY `system_profiler_ip` (`ip`),
  KEY `system_profiler_method` (`method`),
  KEY `system_profiler_url` (`url`),
  KEY `system_profiler_parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_web_profiler`
--

LOCK TABLES `system_web_profiler` WRITE;
/*!40000 ALTER TABLE `system_web_profiler` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_web_profiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant`
--

DROP TABLE IF EXISTS `tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4E59C462979B1AD6` (`company_id`),
  KEY `IDX_4E59C462D40407ED` (`log_created_by`),
  KEY `IDX_4E59C4621CE8DE5A` (`log_updated_by`),
  CONSTRAINT `FK_4E59C4621CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_4E59C462979B1AD6` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_4E59C462D40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant`
--

LOCK TABLES `tenant` WRITE;
/*!40000 ALTER TABLE `tenant` DISABLE KEYS */;
INSERT INTO `tenant` VALUES (1,1,NULL,NULL,'Master Tenant','2017-01-16 23:35:51','2017-01-16 23:35:51',1);
/*!40000 ALTER TABLE `tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_user_map`
--

DROP TABLE IF EXISTS `tenant_user_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_user_map` (
  `tenant_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`tenant_id`,`user_id`),
  KEY `IDX_591DA9C79033212A` (`tenant_id`),
  KEY `IDX_591DA9C7A76ED395` (`user_id`),
  CONSTRAINT `FK_591DA9C79033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_591DA9C7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `system_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_user_map`
--

LOCK TABLES `tenant_user_map` WRITE;
/*!40000 ALTER TABLE `tenant_user_map` DISABLE KEYS */;
INSERT INTO `tenant_user_map` VALUES (1,1);
/*!40000 ALTER TABLE `tenant_user_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_message`
--

DROP TABLE IF EXISTS `tickets_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_23595C349033212A` (`tenant_id`),
  KEY `IDX_23595C34700047D2` (`ticket_id`),
  KEY `IDX_23595C34F675F31B` (`author_id`),
  KEY `IDX_23595C34D40407ED` (`log_created_by`),
  KEY `IDX_23595C341CE8DE5A` (`log_updated_by`),
  CONSTRAINT `FK_23595C341CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_23595C34700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `tickets_ticket` (`id`),
  CONSTRAINT `FK_23595C349033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_23595C34D40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_23595C34F675F31B` FOREIGN KEY (`author_id`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_message`
--

LOCK TABLES `tickets_message` WRITE;
/*!40000 ALTER TABLE `tickets_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_note`
--

DROP TABLE IF EXISTS `tickets_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CAC62CC99033212A` (`tenant_id`),
  KEY `IDX_CAC62CC9700047D2` (`ticket_id`),
  KEY `IDX_CAC62CC9F675F31B` (`author_id`),
  KEY `IDX_CAC62CC9D40407ED` (`log_created_by`),
  KEY `IDX_CAC62CC91CE8DE5A` (`log_updated_by`),
  CONSTRAINT `FK_CAC62CC91CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_CAC62CC9700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `tickets_ticket` (`id`),
  CONSTRAINT `FK_CAC62CC99033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_CAC62CC9D40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_CAC62CC9F675F31B` FOREIGN KEY (`author_id`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_note`
--

LOCK TABLES `tickets_note` WRITE;
/*!40000 ALTER TABLE `tickets_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_ticket`
--

DROP TABLE IF EXISTS `tickets_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `source` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `metadata` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CC86646B9033212A` (`tenant_id`),
  KEY `IDX_CC86646B9395C3F3` (`customer_id`),
  KEY `IDX_CC86646BD40407ED` (`log_created_by`),
  KEY `IDX_CC86646B1CE8DE5A` (`log_updated_by`),
  CONSTRAINT `FK_CC86646B1CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_CC86646B9033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_CC86646B9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_CC86646BD40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_ticket`
--

LOCK TABLES `tickets_ticket` WRITE;
/*!40000 ALTER TABLE `tickets_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_main`
--

DROP TABLE IF EXISTS `workflow_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `related_entity` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FAB7DD5FD40407ED` (`log_created_by`),
  KEY `IDX_FAB7DD5F1CE8DE5A` (`log_updated_by`),
  CONSTRAINT `FK_FAB7DD5F1CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_FAB7DD5FD40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_main`
--

LOCK TABLES `workflow_main` WRITE;
/*!40000 ALTER TABLE `workflow_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_state`
--

DROP TABLE IF EXISTS `workflow_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `workflow_state_unique_name_id` (`name`,`workflow_id`),
  KEY `IDX_12DDA4CFD40407ED` (`log_created_by`),
  KEY `IDX_12DDA4CF1CE8DE5A` (`log_updated_by`),
  KEY `IDX_12DDA4CF2C7C2CBA` (`workflow_id`),
  CONSTRAINT `FK_12DDA4CF1CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_12DDA4CF2C7C2CBA` FOREIGN KEY (`workflow_id`) REFERENCES `workflow_main` (`id`),
  CONSTRAINT `FK_12DDA4CFD40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_state`
--

LOCK TABLES `workflow_state` WRITE;
/*!40000 ALTER TABLE `workflow_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_transition`
--

DROP TABLE IF EXISTS `workflow_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_transition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inbound_id` int(11) DEFAULT NULL,
  `outbound_id` int(11) DEFAULT NULL,
  `log_created_by` int(11) DEFAULT NULL,
  `log_updated_by` int(11) DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `role_permission` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_6A3A796FE540AF18` (`inbound_id`),
  KEY `IDX_6A3A796FAA1DBDF5` (`outbound_id`),
  KEY `IDX_6A3A796FD40407ED` (`log_created_by`),
  KEY `IDX_6A3A796F1CE8DE5A` (`log_updated_by`),
  KEY `IDX_6A3A796F2C7C2CBA` (`workflow_id`),
  CONSTRAINT `FK_6A3A796F1CE8DE5A` FOREIGN KEY (`log_updated_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_6A3A796F2C7C2CBA` FOREIGN KEY (`workflow_id`) REFERENCES `workflow_main` (`id`),
  CONSTRAINT `FK_6A3A796FAA1DBDF5` FOREIGN KEY (`outbound_id`) REFERENCES `workflow_state` (`id`),
  CONSTRAINT `FK_6A3A796FD40407ED` FOREIGN KEY (`log_created_by`) REFERENCES `system_user` (`id`),
  CONSTRAINT `FK_6A3A796FE540AF18` FOREIGN KEY (`inbound_id`) REFERENCES `workflow_state` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_transition`
--

LOCK TABLES `workflow_transition` WRITE;
/*!40000 ALTER TABLE `workflow_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_transition` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-16 23:36:07
