/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.27-log : Database - Redimed
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`Redimed` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `Redimed`;

/*Table structure for table `Appointment` */

DROP TABLE IF EXISTS `Appointment`;

CREATE TABLE `Appointment` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `SiteID` bigint(20) DEFAULT NULL,
  `FromTime` timestamp NULL DEFAULT NULL,
  `ToTime` timestamp NULL DEFAULT NULL,
  `RequestDate` timestamp NULL DEFAULT NULL,
  `ApprovalDate` timestamp NULL DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `Enable` varchar(1) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_SysAppointment_SysSite1_idx` (`SiteID`),
  KEY `idx_UID` (`UID`),
  CONSTRAINT `fk_SysAppointment_SysSite1` FOREIGN KEY (`SiteID`) REFERENCES `Site` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `Appointment` */

/*Table structure for table `ClinicalDetail` */

DROP TABLE IF EXISTS `ClinicalDetail`;

CREATE TABLE `ClinicalDetail` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `TelehealthAppointmentID` bigint(20) NOT NULL,
  `Section` varchar(255) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Value` varchar(45) DEFAULT NULL,
  `ClinicalNote` text,
  `Description` text,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_ClinicalDetail_TelehealthAppointment1_idx` (`TelehealthAppointmentID`),
  CONSTRAINT `fk_ClinicalDetail_TelehealthAppointment1` FOREIGN KEY (`TelehealthAppointmentID`) REFERENCES `TelehealthAppointment` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ClinicalDetail` */

/*Table structure for table `Country` */

DROP TABLE IF EXISTS `Country`;

CREATE TABLE `Country` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `ISO2` char(2) DEFAULT NULL COMMENT 'VN',
  `ShortName` varchar(100) DEFAULT NULL COMMENT 'Vietnam',
  `LongName` varchar(255) DEFAULT NULL COMMENT 'Socialist Republic of Vietnam',
  `ISO3` char(3) DEFAULT NULL COMMENT 'VNM',
  `NumCode` varchar(6) DEFAULT NULL COMMENT '704',
  `UnMember` varchar(12) DEFAULT NULL COMMENT 'yes',
  `CallingCode` varchar(8) DEFAULT NULL COMMENT '84',
  `CCTLD` varchar(5) DEFAULT NULL COMMENT '.vn',
  `Description` text,
  `Enable` varchar(1) DEFAULT NULL COMMENT 'Y/N',
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

/*Data for the table `Country` */

insert  into `Country`(`ID`,`UID`,`ISO2`,`ShortName`,`LongName`,`ISO3`,`NumCode`,`UnMember`,`CallingCode`,`CCTLD`,`Description`,`Enable`,`CreatedDate`,`CreatedBy`,`ModifiedDate`,`ModifiedBy`) values (1,'a59e9e44-6ca5-11e5-8fed-28d2445daad7','AF','Afghanistan','Islamic Republic of Afghanistan','AFG','004','yes','93','.af',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(2,'a59ea08d-6ca5-11e5-8fed-28d2445daad7','AX','Aland Islands','&Aring;land Islands','ALA','248','no','358','.ax',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(3,'a59ea14d-6ca5-11e5-8fed-28d2445daad7','AL','Albania','Republic of Albania','ALB','008','yes','355','.al',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(4,'a59ea1b3-6ca5-11e5-8fed-28d2445daad7','DZ','Algeria','People\'s Democratic Republic of Algeria','DZA','012','yes','213','.dz',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(5,'a59ea21e-6ca5-11e5-8fed-28d2445daad7','AS','American Samoa','American Samoa','ASM','016','no','1+684','.as',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(6,'a59ea26f-6ca5-11e5-8fed-28d2445daad7','AD','Andorra','Principality of Andorra','AND','020','yes','376','.ad',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(7,'a59ea2d1-6ca5-11e5-8fed-28d2445daad7','AO','Angola','Republic of Angola','AGO','024','yes','244','.ao',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(8,'a59ea326-6ca5-11e5-8fed-28d2445daad7','AI','Anguilla','Anguilla','AIA','660','no','1+264','.ai',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(9,'a59ea37a-6ca5-11e5-8fed-28d2445daad7','AQ','Antarctica','Antarctica','ATA','010','no','672','.aq',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(10,'a59ea3c6-6ca5-11e5-8fed-28d2445daad7','AG','Antigua and Barbuda','Antigua and Barbuda','ATG','028','yes','1+268','.ag',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(11,'a59ea417-6ca5-11e5-8fed-28d2445daad7','AR','Argentina','Argentine Republic','ARG','032','yes','54','.ar',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(12,'a59ea467-6ca5-11e5-8fed-28d2445daad7','AM','Armenia','Republic of Armenia','ARM','051','yes','374','.am',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(13,'a59ea4d2-6ca5-11e5-8fed-28d2445daad7','AW','Aruba','Aruba','ABW','533','no','297','.aw',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(14,'a59ea51e-6ca5-11e5-8fed-28d2445daad7','AU','Australia','Commonwealth of Australia','AUS','036','yes','61','.au',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(15,'a59ea573-6ca5-11e5-8fed-28d2445daad7','AT','Austria','Republic of Austria','AUT','040','yes','43','.at',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(16,'a59ea5bf-6ca5-11e5-8fed-28d2445daad7','AZ','Azerbaijan','Republic of Azerbaijan','AZE','031','yes','994','.az',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(17,'a59ea60a-6ca5-11e5-8fed-28d2445daad7','BS','Bahamas','Commonwealth of The Bahamas','BHS','044','yes','1+242','.bs',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(18,'a59ea65b-6ca5-11e5-8fed-28d2445daad7','BH','Bahrain','Kingdom of Bahrain','BHR','048','yes','973','.bh',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(19,'a59ea6ab-6ca5-11e5-8fed-28d2445daad7','BD','Bangladesh','People\'s Republic of Bangladesh','BGD','050','yes','880','.bd',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(20,'a59ea6f7-6ca5-11e5-8fed-28d2445daad7','BB','Barbados','Barbados','BRB','052','yes','1+246','.bb',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(21,'a59ea747-6ca5-11e5-8fed-28d2445daad7','BY','Belarus','Republic of Belarus','BLR','112','yes','375','.by',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(22,'a59ea793-6ca5-11e5-8fed-28d2445daad7','BE','Belgium','Kingdom of Belgium','BEL','056','yes','32','.be',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(23,'a59ea7df-6ca5-11e5-8fed-28d2445daad7','BZ','Belize','Belize','BLZ','084','yes','501','.bz',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(24,'a59ea82b-6ca5-11e5-8fed-28d2445daad7','BJ','Benin','Republic of Benin','BEN','204','yes','229','.bj',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(25,'a59ec149-6ca5-11e5-8fed-28d2445daad7','BM','Bermuda','Bermuda Islands','BMU','060','no','1+441','.bm',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(26,'a59ec339-6ca5-11e5-8fed-28d2445daad7','BT','Bhutan','Kingdom of Bhutan','BTN','064','yes','975','.bt',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(27,'a59ec3c7-6ca5-11e5-8fed-28d2445daad7','BO','Bolivia','Plurinational State of Bolivia','BOL','068','yes','591','.bo',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(28,'a59ec444-6ca5-11e5-8fed-28d2445daad7','BQ','Bonaire, Sint Eustatius and Saba','Bonaire, Sint Eustatius and Saba','BES','535','no','599','.bq',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(29,'a59ec4c1-6ca5-11e5-8fed-28d2445daad7','BA','Bosnia and Herzegovina','Bosnia and Herzegovina','BIH','070','yes','387','.ba',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(30,'a59ec531-6ca5-11e5-8fed-28d2445daad7','BW','Botswana','Republic of Botswana','BWA','072','yes','267','.bw',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(31,'a59ec59c-6ca5-11e5-8fed-28d2445daad7','BV','Bouvet Island','Bouvet Island','BVT','074','no','NONE','.bv',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(32,'a59ec607-6ca5-11e5-8fed-28d2445daad7','BR','Brazil','Federative Republic of Brazil','BRA','076','yes','55','.br',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(33,'a59ec677-6ca5-11e5-8fed-28d2445daad7','IO','British Indian Ocean Territory','British Indian Ocean Territory','IOT','086','no','246','.io',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(34,'a59ec705-6ca5-11e5-8fed-28d2445daad7','BN','Brunei','Brunei Darussalam','BRN','096','yes','673','.bn',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(35,'a59ec775-6ca5-11e5-8fed-28d2445daad7','BG','Bulgaria','Republic of Bulgaria','BGR','100','yes','359','.bg',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(36,'a59ec7e0-6ca5-11e5-8fed-28d2445daad7','BF','Burkina Faso','Burkina Faso','BFA','854','yes','226','.bf',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(37,'a59ec84b-6ca5-11e5-8fed-28d2445daad7','BI','Burundi','Republic of Burundi','BDI','108','yes','257','.bi',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(38,'a59ec8b6-6ca5-11e5-8fed-28d2445daad7','KH','Cambodia','Kingdom of Cambodia','KHM','116','yes','855','.kh',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(39,'a59ec91d-6ca5-11e5-8fed-28d2445daad7','CM','Cameroon','Republic of Cameroon','CMR','120','yes','237','.cm',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(40,'a59ec984-6ca5-11e5-8fed-28d2445daad7','CA','Canada','Canada','CAN','124','yes','1','.ca',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(41,'a59ec9ef-6ca5-11e5-8fed-28d2445daad7','CV','Cape Verde','Republic of Cape Verde','CPV','132','yes','238','.cv',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(42,'a59eca5a-6ca5-11e5-8fed-28d2445daad7','KY','Cayman Islands','The Cayman Islands','CYM','136','no','1+345','.ky',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(43,'a59ecac5-6ca5-11e5-8fed-28d2445daad7','CF','Central African Republic','Central African Republic','CAF','140','yes','236','.cf',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(44,'a59ecb34-6ca5-11e5-8fed-28d2445daad7','TD','Chad','Republic of Chad','TCD','148','yes','235','.td',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(45,'a59ecba0-6ca5-11e5-8fed-28d2445daad7','CL','Chile','Republic of Chile','CHL','152','yes','56','.cl',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(46,'a59ecc0b-6ca5-11e5-8fed-28d2445daad7','CN','China','People\'s Republic of China','CHN','156','yes','86','.cn',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(47,'a59ecc7a-6ca5-11e5-8fed-28d2445daad7','CX','Christmas Island','Christmas Island','CXR','162','no','61','.cx',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(48,'a59ecce5-6ca5-11e5-8fed-28d2445daad7','CC','Cocos (Keeling) Islands','Cocos (Keeling) Islands','CCK','166','no','61','.cc',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(49,'a59ecd55-6ca5-11e5-8fed-28d2445daad7','CO','Colombia','Republic of Colombia','COL','170','yes','57','.co',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(50,'a59ecdbc-6ca5-11e5-8fed-28d2445daad7','KM','Comoros','Union of the Comoros','COM','174','yes','269','.km',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(51,'a59ece27-6ca5-11e5-8fed-28d2445daad7','CG','Congo','Republic of the Congo','COG','178','yes','242','.cg',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(52,'a59ece8d-6ca5-11e5-8fed-28d2445daad7','CK','Cook Islands','Cook Islands','COK','184','some','682','.ck',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(53,'a59ecef4-6ca5-11e5-8fed-28d2445daad7','CR','Costa Rica','Republic of Costa Rica','CRI','188','yes','506','.cr',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(54,'a59ecf63-6ca5-11e5-8fed-28d2445daad7','CI','Cote d\'ivoire (Ivory Coast)','Republic of C&ocirc;te D\'Ivoire (Ivory Coast)','CIV','384','yes','225','.ci',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(55,'a59ecfd7-6ca5-11e5-8fed-28d2445daad7','HR','Croatia','Republic of Croatia','HRV','191','yes','385','.hr',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(56,'a59ed03e-6ca5-11e5-8fed-28d2445daad7','CU','Cuba','Republic of Cuba','CUB','192','yes','53','.cu',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(57,'a59ed0a5-6ca5-11e5-8fed-28d2445daad7','CW','Curacao','Cura&ccedil;ao','CUW','531','no','599','.cw',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(58,'a59ed10b-6ca5-11e5-8fed-28d2445daad7','CY','Cyprus','Republic of Cyprus','CYP','196','yes','357','.cy',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(59,'a59ed176-6ca5-11e5-8fed-28d2445daad7','CZ','Czech Republic','Czech Republic','CZE','203','yes','420','.cz',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(60,'a59ed1dd-6ca5-11e5-8fed-28d2445daad7','CD','Democratic Republic of the Congo','Democratic Republic of the Congo','COD','180','yes','243','.cd',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(61,'a59ed24d-6ca5-11e5-8fed-28d2445daad7','DK','Denmark','Kingdom of Denmark','DNK','208','yes','45','.dk',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(62,'a59ed2b3-6ca5-11e5-8fed-28d2445daad7','DJ','Djibouti','Republic of Djibouti','DJI','262','yes','253','.dj',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(63,'a59ed31a-6ca5-11e5-8fed-28d2445daad7','DM','Dominica','Commonwealth of Dominica','DMA','212','yes','1+767','.dm',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(64,'a59ed385-6ca5-11e5-8fed-28d2445daad7','DO','Dominican Republic','Dominican Republic','DOM','214','yes','1+809, 8','.do',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(65,'a59ed3f0-6ca5-11e5-8fed-28d2445daad7','EC','Ecuador','Republic of Ecuador','ECU','218','yes','593','.ec',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(66,'a59ed457-6ca5-11e5-8fed-28d2445daad7','EG','Egypt','Arab Republic of Egypt','EGY','818','yes','20','.eg',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(67,'a59ed4bd-6ca5-11e5-8fed-28d2445daad7','SV','El Salvador','Republic of El Salvador','SLV','222','yes','503','.sv',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(68,'a59ed529-6ca5-11e5-8fed-28d2445daad7','GQ','Equatorial Guinea','Republic of Equatorial Guinea','GNQ','226','yes','240','.gq',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(69,'a59ed5a1-6ca5-11e5-8fed-28d2445daad7','ER','Eritrea','State of Eritrea','ERI','232','yes','291','.er',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(70,'a59ed608-6ca5-11e5-8fed-28d2445daad7','EE','Estonia','Republic of Estonia','EST','233','yes','372','.ee',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(71,'a59ed66e-6ca5-11e5-8fed-28d2445daad7','ET','Ethiopia','Federal Democratic Republic of Ethiopia','ETH','231','yes','251','.et',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(72,'a59ed6de-6ca5-11e5-8fed-28d2445daad7','FK','Falkland Islands (Malvinas)','The Falkland Islands (Malvinas)','FLK','238','no','500','.fk',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(73,'a59ed756-6ca5-11e5-8fed-28d2445daad7','FO','Faroe Islands','The Faroe Islands','FRO','234','no','298','.fo',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(74,'a59ed7c1-6ca5-11e5-8fed-28d2445daad7','FJ','Fiji','Republic of Fiji','FJI','242','yes','679','.fj',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(75,'a59ed824-6ca5-11e5-8fed-28d2445daad7','FI','Finland','Republic of Finland','FIN','246','yes','358','.fi',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(76,'a59ed88a-6ca5-11e5-8fed-28d2445daad7','FR','France','French Republic','FRA','250','yes','33','.fr',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(77,'a59ed8f5-6ca5-11e5-8fed-28d2445daad7','GF','French Guiana','French Guiana','GUF','254','no','594','.gf',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(78,'a59ed95c-6ca5-11e5-8fed-28d2445daad7','PF','French Polynesia','French Polynesia','PYF','258','no','689','.pf',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(79,'a59ed9c7-6ca5-11e5-8fed-28d2445daad7','TF','French Southern Territories','French Southern Territories','ATF','260','no',NULL,'.tf',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(80,'a59eda44-6ca5-11e5-8fed-28d2445daad7','GA','Gabon','Gabonese Republic','GAB','266','yes','241','.ga',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(81,'a59edaaf-6ca5-11e5-8fed-28d2445daad7','GM','Gambia','Republic of The Gambia','GMB','270','yes','220','.gm',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(82,'a59edb16-6ca5-11e5-8fed-28d2445daad7','GE','Georgia','Georgia','GEO','268','yes','995','.ge',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(83,'a59edb7c-6ca5-11e5-8fed-28d2445daad7','DE','Germany','Federal Republic of Germany','DEU','276','yes','49','.de',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(84,'a59edbe7-6ca5-11e5-8fed-28d2445daad7','GH','Ghana','Republic of Ghana','GHA','288','yes','233','.gh',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(85,'a59edc4e-6ca5-11e5-8fed-28d2445daad7','GI','Gibraltar','Gibraltar','GIB','292','no','350','.gi',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(86,'a59edcb5-6ca5-11e5-8fed-28d2445daad7','GR','Greece','Hellenic Republic','GRC','300','yes','30','.gr',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(87,'a59edd1b-6ca5-11e5-8fed-28d2445daad7','GL','Greenland','Greenland','GRL','304','no','299','.gl',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(88,'a59edd82-6ca5-11e5-8fed-28d2445daad7','GD','Grenada','Grenada','GRD','308','yes','1+473','.gd',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(89,'a59edded-6ca5-11e5-8fed-28d2445daad7','GP','Guadaloupe','Guadeloupe','GLP','312','no','590','.gp',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(90,'a59ede54-6ca5-11e5-8fed-28d2445daad7','GU','Guam','Guam','GUM','316','no','1+671','.gu',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(91,'a59edeba-6ca5-11e5-8fed-28d2445daad7','GT','Guatemala','Republic of Guatemala','GTM','320','yes','502','.gt',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(92,'a59edf21-6ca5-11e5-8fed-28d2445daad7','GG','Guernsey','Guernsey','GGY','831','no','44','.gg',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(93,'a59edf88-6ca5-11e5-8fed-28d2445daad7','GN','Guinea','Republic of Guinea','GIN','324','yes','224','.gn',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(94,'a59edfee-6ca5-11e5-8fed-28d2445daad7','GW','Guinea-Bissau','Republic of Guinea-Bissau','GNB','624','yes','245','.gw',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(95,'a59ee059-6ca5-11e5-8fed-28d2445daad7','GY','Guyana','Co-operative Republic of Guyana','GUY','328','yes','592','.gy',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(96,'a59ee0c0-6ca5-11e5-8fed-28d2445daad7','HT','Haiti','Republic of Haiti','HTI','332','yes','509','.ht',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(97,'a59ee127-6ca5-11e5-8fed-28d2445daad7','HM','Heard Island and McDonald Islands','Heard Island and McDonald Islands','HMD','334','no','NONE','.hm',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(98,'a59ee196-6ca5-11e5-8fed-28d2445daad7','HN','Honduras','Republic of Honduras','HND','340','yes','504','.hn',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(99,'a59ee1fd-6ca5-11e5-8fed-28d2445daad7','HK','Hong Kong','Hong Kong','HKG','344','no','852','.hk',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(100,'a59ee264-6ca5-11e5-8fed-28d2445daad7','HU','Hungary','Hungary','HUN','348','yes','36','.hu',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(101,'a59ee2ca-6ca5-11e5-8fed-28d2445daad7','IS','Iceland','Republic of Iceland','ISL','352','yes','354','.is',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(102,'a59ee331-6ca5-11e5-8fed-28d2445daad7','IN','India','Republic of India','IND','356','yes','91','.in',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(103,'a59ee393-6ca5-11e5-8fed-28d2445daad7','ID','Indonesia','Republic of Indonesia','IDN','360','yes','62','.id',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(104,'a59ee3fa-6ca5-11e5-8fed-28d2445daad7','IR','Iran','Islamic Republic of Iran','IRN','364','yes','98','.ir',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(105,'a59ee4cb-6ca5-11e5-8fed-28d2445daad7','IQ','Iraq','Republic of Iraq','IRQ','368','yes','964','.iq',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(106,'a59ee525-6ca5-11e5-8fed-28d2445daad7','IE','Ireland','Ireland','IRL','372','yes','353','.ie',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(107,'a59ee57e-6ca5-11e5-8fed-28d2445daad7','IM','Isle of Man','Isle of Man','IMN','833','no','44','.im',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(108,'a59ee5d7-6ca5-11e5-8fed-28d2445daad7','IL','Israel','State of Israel','ISR','376','yes','972','.il',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(109,'a59ee635-6ca5-11e5-8fed-28d2445daad7','IT','Italy','Italian Republic','ITA','380','yes','39','.jm',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(110,'a59ee693-6ca5-11e5-8fed-28d2445daad7','JM','Jamaica','Jamaica','JAM','388','yes','1+876','.jm',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(111,'a59ee6ec-6ca5-11e5-8fed-28d2445daad7','JP','Japan','Japan','JPN','392','yes','81','.jp',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(112,'a59ee745-6ca5-11e5-8fed-28d2445daad7','JE','Jersey','The Bailiwick of Jersey','JEY','832','no','44','.je',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(113,'a59ee7a3-6ca5-11e5-8fed-28d2445daad7','JO','Jordan','Hashemite Kingdom of Jordan','JOR','400','yes','962','.jo',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(114,'a59ee7fc-6ca5-11e5-8fed-28d2445daad7','KZ','Kazakhstan','Republic of Kazakhstan','KAZ','398','yes','7','.kz',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(115,'a59ee855-6ca5-11e5-8fed-28d2445daad7','KE','Kenya','Republic of Kenya','KEN','404','yes','254','.ke',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(116,'a59ee8ae-6ca5-11e5-8fed-28d2445daad7','KI','Kiribati','Republic of Kiribati','KIR','296','yes','686','.ki',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(117,'a59ee90c-6ca5-11e5-8fed-28d2445daad7','XK','Kosovo','Republic of Kosovo','---','---','some','381','',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(118,'a59ee96a-6ca5-11e5-8fed-28d2445daad7','KW','Kuwait','State of Kuwait','KWT','414','yes','965','.kw',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(119,'a59ee9c3-6ca5-11e5-8fed-28d2445daad7','KG','Kyrgyzstan','Kyrgyz Republic','KGZ','417','yes','996','.kg',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(120,'a59ef1f0-6ca5-11e5-8fed-28d2445daad7','LA','Laos','Lao People\'s Democratic Republic','LAO','418','yes','856','.la',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(121,'a59ef288-6ca5-11e5-8fed-28d2445daad7','LV','Latvia','Republic of Latvia','LVA','428','yes','371','.lv',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(122,'a59ef2ee-6ca5-11e5-8fed-28d2445daad7','LB','Lebanon','Republic of Lebanon','LBN','422','yes','961','.lb',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(123,'a59ef355-6ca5-11e5-8fed-28d2445daad7','LS','Lesotho','Kingdom of Lesotho','LSO','426','yes','266','.ls',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(124,'a59ef3bc-6ca5-11e5-8fed-28d2445daad7','LR','Liberia','Republic of Liberia','LBR','430','yes','231','.lr',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(125,'a59ef419-6ca5-11e5-8fed-28d2445daad7','LY','Libya','Libya','LBY','434','yes','218','.ly',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(126,'a59ef47c-6ca5-11e5-8fed-28d2445daad7','LI','Liechtenstein','Principality of Liechtenstein','LIE','438','yes','423','.li',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(127,'a59ef4d9-6ca5-11e5-8fed-28d2445daad7','LT','Lithuania','Republic of Lithuania','LTU','440','yes','370','.lt',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(128,'a59ef53b-6ca5-11e5-8fed-28d2445daad7','LU','Luxembourg','Grand Duchy of Luxembourg','LUX','442','yes','352','.lu',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(129,'a59ef59e-6ca5-11e5-8fed-28d2445daad7','MO','Macao','The Macao Special Administrative Region','MAC','446','no','853','.mo',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(130,'a59ef604-6ca5-11e5-8fed-28d2445daad7','MK','Macedonia','The Former Yugoslav Republic of Macedonia','MKD','807','yes','389','.mk',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(131,'a59ef66f-6ca5-11e5-8fed-28d2445daad7','MG','Madagascar','Republic of Madagascar','MDG','450','yes','261','.mg',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(132,'a59ef769-6ca5-11e5-8fed-28d2445daad7','MW','Malawi','Republic of Malawi','MWI','454','yes','265','.mw',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(133,'a59ef7d4-6ca5-11e5-8fed-28d2445daad7','MY','Malaysia','Malaysia','MYS','458','yes','60','.my',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(134,'a59ef83b-6ca5-11e5-8fed-28d2445daad7','MV','Maldives','Republic of Maldives','MDV','462','yes','960','.mv',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(135,'a59ef8ab-6ca5-11e5-8fed-28d2445daad7','ML','Mali','Republic of Mali','MLI','466','yes','223','.ml',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(136,'a59ef908-6ca5-11e5-8fed-28d2445daad7','MT','Malta','Republic of Malta','MLT','470','yes','356','.mt',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(137,'a59ef962-6ca5-11e5-8fed-28d2445daad7','MH','Marshall Islands','Republic of the Marshall Islands','MHL','584','yes','692','.mh',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(138,'a59ef9c4-6ca5-11e5-8fed-28d2445daad7','MQ','Martinique','Martinique','MTQ','474','no','596','.mq',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(139,'a59efa21-6ca5-11e5-8fed-28d2445daad7','MR','Mauritania','Islamic Republic of Mauritania','MRT','478','yes','222','.mr',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(140,'a59efa7b-6ca5-11e5-8fed-28d2445daad7','MU','Mauritius','Republic of Mauritius','MUS','480','yes','230','.mu',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(141,'a59efad4-6ca5-11e5-8fed-28d2445daad7','YT','Mayotte','Mayotte','MYT','175','no','262','.yt',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(142,'a59efb2d-6ca5-11e5-8fed-28d2445daad7','MX','Mexico','United Mexican States','MEX','484','yes','52','.mx',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(143,'a59efb86-6ca5-11e5-8fed-28d2445daad7','FM','Micronesia','Federated States of Micronesia','FSM','583','yes','691','.fm',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(144,'a59efbe4-6ca5-11e5-8fed-28d2445daad7','MD','Moldava','Republic of Moldova','MDA','498','yes','373','.md',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(145,'a59efc3d-6ca5-11e5-8fed-28d2445daad7','MC','Monaco','Principality of Monaco','MCO','492','yes','377','.mc',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(146,'a59efc97-6ca5-11e5-8fed-28d2445daad7','MN','Mongolia','Mongolia','MNG','496','yes','976','.mn',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(147,'a59efcf0-6ca5-11e5-8fed-28d2445daad7','ME','Montenegro','Montenegro','MNE','499','yes','382','.me',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(148,'a59efd49-6ca5-11e5-8fed-28d2445daad7','MS','Montserrat','Montserrat','MSR','500','no','1+664','.ms',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(149,'a59efd9e-6ca5-11e5-8fed-28d2445daad7','MA','Morocco','Kingdom of Morocco','MAR','504','yes','212','.ma',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(150,'a59efdf7-6ca5-11e5-8fed-28d2445daad7','MZ','Mozambique','Republic of Mozambique','MOZ','508','yes','258','.mz',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(151,'a59efe6b-6ca5-11e5-8fed-28d2445daad7','MM','Myanmar (Burma)','Republic of the Union of Myanmar','MMR','104','yes','95','.mm',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(152,'a59efef6-6ca5-11e5-8fed-28d2445daad7','NA','Namibia','Republic of Namibia','NAM','516','yes','264','.na',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(153,'a59eff4f-6ca5-11e5-8fed-28d2445daad7','NR','Nauru','Republic of Nauru','NRU','520','yes','674','.nr',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(154,'a59effac-6ca5-11e5-8fed-28d2445daad7','NP','Nepal','Federal Democratic Republic of Nepal','NPL','524','yes','977','.np',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(155,'a59f0006-6ca5-11e5-8fed-28d2445daad7','NL','Netherlands','Kingdom of the Netherlands','NLD','528','yes','31','.nl',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(156,'a59f005f-6ca5-11e5-8fed-28d2445daad7','NC','New Caledonia','New Caledonia','NCL','540','no','687','.nc',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(157,'a59f00bd-6ca5-11e5-8fed-28d2445daad7','NZ','New Zealand','New Zealand','NZL','554','yes','64','.nz',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(158,'a59f0111-6ca5-11e5-8fed-28d2445daad7','NI','Nicaragua','Republic of Nicaragua','NIC','558','yes','505','.ni',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(159,'a59f016b-6ca5-11e5-8fed-28d2445daad7','NE','Niger','Republic of Niger','NER','562','yes','227','.ne',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(160,'a59f01c4-6ca5-11e5-8fed-28d2445daad7','NG','Nigeria','Federal Republic of Nigeria','NGA','566','yes','234','.ng',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(161,'a59f021d-6ca5-11e5-8fed-28d2445daad7','NU','Niue','Niue','NIU','570','some','683','.nu',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(162,'a59f0276-6ca5-11e5-8fed-28d2445daad7','NF','Norfolk Island','Norfolk Island','NFK','574','no','672','.nf',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(163,'a59f02d0-6ca5-11e5-8fed-28d2445daad7','KP','North Korea','Democratic People\'s Republic of Korea','PRK','408','yes','850','.kp',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(164,'a59f0332-6ca5-11e5-8fed-28d2445daad7','MP','Northern Mariana Islands','Northern Mariana Islands','MNP','580','no','1+670','.mp',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(165,'a59f0394-6ca5-11e5-8fed-28d2445daad7','NO','Norway','Kingdom of Norway','NOR','578','yes','47','.no',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(166,'a59f03ed-6ca5-11e5-8fed-28d2445daad7','OM','Oman','Sultanate of Oman','OMN','512','yes','968','.om',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(167,'a59f0447-6ca5-11e5-8fed-28d2445daad7','PK','Pakistan','Islamic Republic of Pakistan','PAK','586','yes','92','.pk',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(168,'a59f04a0-6ca5-11e5-8fed-28d2445daad7','PW','Palau','Republic of Palau','PLW','585','yes','680','.pw',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(169,'a59f04f9-6ca5-11e5-8fed-28d2445daad7','PS','Palestine','State of Palestine (or Occupied Palestinian Territory)','PSE','275','some','970','.ps',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(170,'a59f0557-6ca5-11e5-8fed-28d2445daad7','PA','Panama','Republic of Panama','PAN','591','yes','507','.pa',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(171,'a59f05b0-6ca5-11e5-8fed-28d2445daad7','PG','Papua New Guinea','Independent State of Papua New Guinea','PNG','598','yes','675','.pg',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(172,'a59f0612-6ca5-11e5-8fed-28d2445daad7','PY','Paraguay','Republic of Paraguay','PRY','600','yes','595','.py',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(173,'a59f066b-6ca5-11e5-8fed-28d2445daad7','PE','Peru','Republic of Peru','PER','604','yes','51','.pe',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(174,'a59f06c9-6ca5-11e5-8fed-28d2445daad7','PH','Phillipines','Republic of the Philippines','PHL','608','yes','63','.ph',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(175,'a59f0722-6ca5-11e5-8fed-28d2445daad7','PN','Pitcairn','Pitcairn','PCN','612','no','NONE','.pn',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(176,'a59f077c-6ca5-11e5-8fed-28d2445daad7','PL','Poland','Republic of Poland','POL','616','yes','48','.pl',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(177,'a59f07d5-6ca5-11e5-8fed-28d2445daad7','PT','Portugal','Portuguese Republic','PRT','620','yes','351','.pt',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(178,'a59f082e-6ca5-11e5-8fed-28d2445daad7','PR','Puerto Rico','Commonwealth of Puerto Rico','PRI','630','no','1+939','.pr',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(179,'a5a70cb6-6ca5-11e5-8fed-28d2445daad7','QA','Qatar','State of Qatar','QAT','634','yes','974','.qa',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(180,'a5a711b6-6ca5-11e5-8fed-28d2445daad7','RE','Reunion','R&eacute;union','REU','638','no','262','.re',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(181,'a5a713d7-6ca5-11e5-8fed-28d2445daad7','RO','Romania','Romania','ROU','642','yes','40','.ro',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(182,'a5a714eb-6ca5-11e5-8fed-28d2445daad7','RU','Russia','Russian Federation','RUS','643','yes','7','.ru',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(183,'a5a715d4-6ca5-11e5-8fed-28d2445daad7','RW','Rwanda','Republic of Rwanda','RWA','646','yes','250','.rw',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(184,'a5a716a5-6ca5-11e5-8fed-28d2445daad7','BL','Saint Barthelemy','Saint Barth&eacute;lemy','BLM','652','no','590','.bl',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(185,'a5a71780-6ca5-11e5-8fed-28d2445daad7','SH','Saint Helena','Saint Helena, Ascension and Tristan da Cunha','SHN','654','no','290','.sh',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(186,'a5a718af-6ca5-11e5-8fed-28d2445daad7','KN','Saint Kitts and Nevis','Federation of Saint Christopher and Nevis','KNA','659','yes','1+869','.kn',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(187,'a5a719a0-6ca5-11e5-8fed-28d2445daad7','LC','Saint Lucia','Saint Lucia','LCA','662','yes','1+758','.lc',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(188,'a5a71a6e-6ca5-11e5-8fed-28d2445daad7','MF','Saint Martin','Saint Martin','MAF','663','no','590','.mf',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(189,'a5a71b3b-6ca5-11e5-8fed-28d2445daad7','PM','Saint Pierre and Miquelon','Saint Pierre and Miquelon','SPM','666','no','508','.pm',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(190,'a5a71c1a-6ca5-11e5-8fed-28d2445daad7','VC','Saint Vincent and the Grenadines','Saint Vincent and the Grenadines','VCT','670','yes','1+784','.vc',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(191,'a5a71d2f-6ca5-11e5-8fed-28d2445daad7','WS','Samoa','Independent State of Samoa','WSM','882','yes','685','.ws',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(192,'a5a71e32-6ca5-11e5-8fed-28d2445daad7','SM','San Marino','Republic of San Marino','SMR','674','yes','378','.sm',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(193,'a5a71f03-6ca5-11e5-8fed-28d2445daad7','ST','Sao Tome and Principe','Democratic Republic of S&atilde;o Tom&eacute; and Pr&iacute;ncipe','STP','678','yes','239','.st',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(194,'a5a71feb-6ca5-11e5-8fed-28d2445daad7','SA','Saudi Arabia','Kingdom of Saudi Arabia','SAU','682','yes','966','.sa',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(195,'a5a720b0-6ca5-11e5-8fed-28d2445daad7','SN','Senegal','Republic of Senegal','SEN','686','yes','221','.sn',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(196,'a5a72186-6ca5-11e5-8fed-28d2445daad7','RS','Serbia','Republic of Serbia','SRB','688','yes','381','.rs',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(197,'a5a7224a-6ca5-11e5-8fed-28d2445daad7','SC','Seychelles','Republic of Seychelles','SYC','690','yes','248','.sc',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(198,'a5a7231c-6ca5-11e5-8fed-28d2445daad7','SL','Sierra Leone','Republic of Sierra Leone','SLE','694','yes','232','.sl',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(199,'a5a723e5-6ca5-11e5-8fed-28d2445daad7','SG','Singapore','Republic of Singapore','SGP','702','yes','65','.sg',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(200,'a5a724a9-6ca5-11e5-8fed-28d2445daad7','SX','Sint Maarten','Sint Maarten','SXM','534','no','1+721','.sx',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(201,'a5a72572-6ca5-11e5-8fed-28d2445daad7','SK','Slovakia','Slovak Republic','SVK','703','yes','421','.sk',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(202,'a5a7263f-6ca5-11e5-8fed-28d2445daad7','SI','Slovenia','Republic of Slovenia','SVN','705','yes','386','.si',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(203,'a5a72708-6ca5-11e5-8fed-28d2445daad7','SB','Solomon Islands','Solomon Islands','SLB','090','yes','677','.sb',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(204,'a5a727d5-6ca5-11e5-8fed-28d2445daad7','SO','Somalia','Somali Republic','SOM','706','yes','252','.so',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(205,'a5a7289e-6ca5-11e5-8fed-28d2445daad7','ZA','South Africa','Republic of South Africa','ZAF','710','yes','27','.za',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(206,'a5a72974-6ca5-11e5-8fed-28d2445daad7','GS','South Georgia and the South Sandwich Islands','South Georgia and the South Sandwich Islands','SGS','239','no','500','.gs',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(207,'a5a72a5c-6ca5-11e5-8fed-28d2445daad7','KR','South Korea','Republic of Korea','KOR','410','yes','82','.kr',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(208,'a5a72b2e-6ca5-11e5-8fed-28d2445daad7','SS','South Sudan','Republic of South Sudan','SSD','728','yes','211','.ss',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(209,'a5a72bf7-6ca5-11e5-8fed-28d2445daad7','ES','Spain','Kingdom of Spain','ESP','724','yes','34','.es',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(210,'a5a72cc0-6ca5-11e5-8fed-28d2445daad7','LK','Sri Lanka','Democratic Socialist Republic of Sri Lanka','LKA','144','yes','94','.lk',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(211,'a5a72da3-6ca5-11e5-8fed-28d2445daad7','SD','Sudan','Republic of the Sudan','SDN','729','yes','249','.sd',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(212,'a5a72e6c-6ca5-11e5-8fed-28d2445daad7','SR','Suriname','Republic of Suriname','SUR','740','yes','597','.sr',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(213,'a5a72f39-6ca5-11e5-8fed-28d2445daad7','SJ','Svalbard and Jan Mayen','Svalbard and Jan Mayen','SJM','744','no','47','.sj',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(214,'a5a7300b-6ca5-11e5-8fed-28d2445daad7','SZ','Swaziland','Kingdom of Swaziland','SWZ','748','yes','268','.sz',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(215,'a5a730cf-6ca5-11e5-8fed-28d2445daad7','SE','Sweden','Kingdom of Sweden','SWE','752','yes','46','.se',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(216,'a5a73198-6ca5-11e5-8fed-28d2445daad7','CH','Switzerland','Swiss Confederation','CHE','756','yes','41','.ch',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(217,'a5a7325d-6ca5-11e5-8fed-28d2445daad7','SY','Syria','Syrian Arab Republic','SYR','760','yes','963','.sy',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(218,'a5a7332a-6ca5-11e5-8fed-28d2445daad7','TW','Taiwan','Republic of China (Taiwan)','TWN','158','former','886','.tw',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(219,'a5a733f7-6ca5-11e5-8fed-28d2445daad7','TJ','Tajikistan','Republic of Tajikistan','TJK','762','yes','992','.tj',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(220,'a5a734bc-6ca5-11e5-8fed-28d2445daad7','TZ','Tanzania','United Republic of Tanzania','TZA','834','yes','255','.tz',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(221,'a5a73584-6ca5-11e5-8fed-28d2445daad7','TH','Thailand','Kingdom of Thailand','THA','764','yes','66','.th',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(222,'a5a7364d-6ca5-11e5-8fed-28d2445daad7','TL','Timor-Leste (East Timor)','Democratic Republic of Timor-Leste','TLS','626','yes','670','.tl',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(223,'a5a73728-6ca5-11e5-8fed-28d2445daad7','TG','Togo','Togolese Republic','TGO','768','yes','228','.tg',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(224,'a5a737f5-6ca5-11e5-8fed-28d2445daad7','TK','Tokelau','Tokelau','TKL','772','no','690','.tk',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(225,'a5a738b5-6ca5-11e5-8fed-28d2445daad7','TO','Tonga','Kingdom of Tonga','TON','776','yes','676','.to',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(226,'a5a7398b-6ca5-11e5-8fed-28d2445daad7','TT','Trinidad and Tobago','Republic of Trinidad and Tobago','TTO','780','yes','1+868','.tt',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(227,'a5a73a61-6ca5-11e5-8fed-28d2445daad7','TN','Tunisia','Republic of Tunisia','TUN','788','yes','216','.tn',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(228,'a5a73b2a-6ca5-11e5-8fed-28d2445daad7','TR','Turkey','Republic of Turkey','TUR','792','yes','90','.tr',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(229,'a5a73bf3-6ca5-11e5-8fed-28d2445daad7','TM','Turkmenistan','Turkmenistan','TKM','795','yes','993','.tm',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(230,'a5a73cb7-6ca5-11e5-8fed-28d2445daad7','TC','Turks and Caicos Islands','Turks and Caicos Islands','TCA','796','no','1+649','.tc',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(231,'a5a73d96-6ca5-11e5-8fed-28d2445daad7','TV','Tuvalu','Tuvalu','TUV','798','yes','688','.tv',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(232,'a5a73e5f-6ca5-11e5-8fed-28d2445daad7','UG','Uganda','Republic of Uganda','UGA','800','yes','256','.ug',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(233,'a5a73f2d-6ca5-11e5-8fed-28d2445daad7','UA','Ukraine','Ukraine','UKR','804','yes','380','.ua',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(234,'a5a7402f-6ca5-11e5-8fed-28d2445daad7','AE','United Arab Emirates','United Arab Emirates','ARE','784','yes','971','.ae',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(235,'a5a740fd-6ca5-11e5-8fed-28d2445daad7','GB','United Kingdom','United Kingdom of Great Britain and Nothern Ireland','GBR','826','yes','44','.uk',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(236,'a5a741dc-6ca5-11e5-8fed-28d2445daad7','US','United States','United States of America','USA','840','yes','1','.us',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(237,'a5a742a5-6ca5-11e5-8fed-28d2445daad7','UM','United States Minor Outlying Islands','United States Minor Outlying Islands','UMI','581','no','NONE','NONE',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(238,'a5a74388-6ca5-11e5-8fed-28d2445daad7','UY','Uruguay','Eastern Republic of Uruguay','URY','858','yes','598','.uy',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(239,'a5a7445a-6ca5-11e5-8fed-28d2445daad7','UZ','Uzbekistan','Republic of Uzbekistan','UZB','860','yes','998','.uz',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(240,'a5a7451e-6ca5-11e5-8fed-28d2445daad7','VU','Vanuatu','Republic of Vanuatu','VUT','548','yes','678','.vu',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(241,'a5a745ec-6ca5-11e5-8fed-28d2445daad7','VA','Vatican City','State of the Vatican City','VAT','336','no','39','.va',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(242,'a5a746b4-6ca5-11e5-8fed-28d2445daad7','VE','Venezuela','Bolivarian Republic of Venezuela','VEN','862','yes','58','.ve',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(243,'a5a74782-6ca5-11e5-8fed-28d2445daad7','VN','Vietnam','Socialist Republic of Vietnam','VNM','704','yes','84','.vn',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(244,'a5a7484a-6ca5-11e5-8fed-28d2445daad7','VG','Virgin Islands, British','British Virgin Islands','VGB','092','no','1+284','.vg',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(245,'a5a7492a-6ca5-11e5-8fed-28d2445daad7','VI','Virgin Islands, US','Virgin Islands of the United States','VIR','850','no','1+340','.vi',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(246,'a5a74a12-6ca5-11e5-8fed-28d2445daad7','WF','Wallis and Futuna','Wallis and Futuna','WLF','876','no','681','.wf',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(247,'a5a74adf-6ca5-11e5-8fed-28d2445daad7','EH','Western Sahara','Western Sahara','ESH','732','no','212','.eh',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(248,'a5a74ba8-6ca5-11e5-8fed-28d2445daad7','YE','Yemen','Republic of Yemen','YEM','887','yes','967','.ye',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(249,'a5a74c6c-6ca5-11e5-8fed-28d2445daad7','ZM','Zambia','Republic of Zambia','ZMB','894','yes','260','.zm',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL),(250,'a5a74d35-6ca5-11e5-8fed-28d2445daad7','ZW','Zimbabwe','Republic of Zimbabwe','ZWE','716','yes','263','.zw',NULL,'Y','2015-10-07 03:43:17',NULL,'2015-10-07 03:43:17',NULL);

/*Table structure for table `Department` */

DROP TABLE IF EXISTS `Department`;

CREATE TABLE `Department` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `SiteID` bigint(20) DEFAULT NULL,
  `DepartmentCode` varchar(100) DEFAULT NULL COMMENT 'DEP.0001',
  `DepartmentName` varchar(255) DEFAULT NULL COMMENT 'IT/ISO',
  `Description` text,
  `Enable` varchar(1) DEFAULT NULL COMMENT 'Y/N',
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Department_Site1_idx` (`SiteID`),
  CONSTRAINT `fk_Department_Site1` FOREIGN KEY (`SiteID`) REFERENCES `Site` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `Department` */

/*Table structure for table `Doctor` */

DROP TABLE IF EXISTS `Doctor`;

CREATE TABLE `Doctor` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `SiteID` bigint(20) DEFAULT NULL,
  `UserAccountID` bigint(20) NOT NULL,
  `DepartmentID` bigint(20) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(100) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `DOB` timestamp NULL DEFAULT NULL,
  `Postcode` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Signature` bigint(20) DEFAULT NULL,
  `HealthLink` varchar(255) DEFAULT NULL,
  `ProviderNumber` varchar(255) DEFAULT NULL,
  `Enable` varchar(1) DEFAULT NULL COMMENT 'Y/N',
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_SysDoctor_SysSite1_idx` (`SiteID`),
  KEY `fk_SysDoctor_SysUserAccount1_idx` (`UserAccountID`),
  KEY `idx_UID` (`UID`),
  KEY `fk_Doctor_Department1_idx` (`DepartmentID`),
  KEY `fk_Doctor_FileUpload1_idx` (`Signature`),
  CONSTRAINT `fk_Doctor_Department1` FOREIGN KEY (`DepartmentID`) REFERENCES `Department` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doctor_FileUpload1` FOREIGN KEY (`Signature`) REFERENCES `FileUpload` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SysDoctor_SysSite1` FOREIGN KEY (`SiteID`) REFERENCES `Site` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SysDoctor_SysUserAccount1` FOREIGN KEY (`UserAccountID`) REFERENCES `UserAccount` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `Doctor` */

/*Table structure for table `DocumentFile` */

DROP TABLE IF EXISTS `DocumentFile`;

CREATE TABLE `DocumentFile` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FileUploadID` bigint(20) NOT NULL,
  `DocType` varchar(45) DEFAULT NULL COMMENT 'DOC, XLS, PDF, ...',
  PRIMARY KEY (`ID`),
  KEY `fk_DocumentFile_FileUpload1_idx` (`FileUploadID`),
  CONSTRAINT `fk_DocumentFile_FileUpload1` FOREIGN KEY (`FileUploadID`) REFERENCES `FileUpload` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `DocumentFile` */

/*Table structure for table `ExaminationRequired` */

DROP TABLE IF EXISTS `ExaminationRequired`;

CREATE TABLE `ExaminationRequired` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TelehealthAppointmentID` bigint(20) NOT NULL,
  `Private` varchar(1) DEFAULT NULL,
  `Public` varchar(1) DEFAULT NULL,
  `DVA` varchar(1) DEFAULT NULL,
  `WorkersComp` varchar(1) DEFAULT NULL,
  `MVIT` varchar(1) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_ExaminationRequired_TelehealthAppointment1_idx` (`TelehealthAppointmentID`),
  CONSTRAINT `fk_ExaminationRequired_TelehealthAppointment1` FOREIGN KEY (`TelehealthAppointmentID`) REFERENCES `TelehealthAppointment` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ExaminationRequired` */

/*Table structure for table `FileUpload` */

DROP TABLE IF EXISTS `FileUpload`;

CREATE TABLE `FileUpload` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) DEFAULT NULL,
  `UserAccountID` bigint(20) DEFAULT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `FileLocation` varchar(255) DEFAULT NULL,
  `FileType` varchar(45) DEFAULT NULL COMMENT 'Image, Document, Avatar, ...',
  `FileExtension` varchar(45) DEFAULT NULL COMMENT 'DOC, DOCX, XLS, PDF, ...',
  `Description` text,
  `Enable` varchar(1) DEFAULT NULL COMMENT 'Y/N',
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_FileUpload_UserAccount1` (`UserAccountID`),
  KEY `idx_UID` (`UID`),
  CONSTRAINT `fk_FileUpload_UserAccount1` FOREIGN KEY (`UserAccountID`) REFERENCES `UserAccount` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `FileUpload` */

insert  into `FileUpload`(`ID`,`UID`,`UserAccountID`,`FileName`,`FileLocation`,`FileType`,`FileExtension`,`Description`,`Enable`,`CreatedDate`,`CreatedBy`,`ModifiedDate`,`ModifiedBy`) values (1,'501',NULL,NULL,'uploadfiles/en_501',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'501',NULL,NULL,'uploadfiles/en_501',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'501',NULL,NULL,'uploadfiles/en_501',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'057e517f-abf6-4f67-a25a-cbf7304ff648',NULL,NULL,'uploadfiles/en_057e517f-abf6-4f67-a25a-cbf7304ff648',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'089abbf3-bc8a-4ef1-b1c1-32d2df2f33d2',NULL,NULL,'uploadfiles/en_089abbf3-bc8a-4ef1-b1c1-32d2df2f33d2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'09dbc19a-194b-41b4-87c6-ae60e2ce7f14',NULL,NULL,'uploadfiles/en_09dbc19a-194b-41b4-87c6-ae60e2ce7f14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'c21ce440-ffd3-447e-83c5-a816d20bbdf8',NULL,'20141129_170617.jpg','uploadfiles/c21ce440-ffd3-447e-83c5-a816d20bbdf8','jpg','jpg',NULL,NULL,NULL,NULL,NULL,NULL),(8,'76b832d5-94b2-4d67-ae44-bdb762817314',NULL,'Photo 7-12-2013 12 59 26 pm.jpg','uploadfiles/76b832d5-94b2-4d67-ae44-bdb762817314','jpg','jpg',NULL,NULL,NULL,NULL,NULL,NULL),(9,'84497d6f-7297-4a69-888f-d06dbcfc0909',NULL,'Photo 9-09-13 9 18 21 AM.jpg','uploadfiles/84497d6f-7297-4a69-888f-d06dbcfc0909','jpg','jpg',NULL,NULL,NULL,NULL,NULL,NULL),(10,'73fa5a7e-84bf-436e-b8dd-f37dc9d59a20',NULL,'20141129_170617.jpg','uploadfiles/73fa5a7e-84bf-436e-b8dd-f37dc9d59a20','jpg','jpg',NULL,NULL,'2015-10-04 21:33:17',NULL,'2015-10-04 21:33:17',NULL),(11,'8aac37cf-a7d4-4818-a70e-3d09586db957',NULL,'Photo 7-12-2013 12 59 26 pm.jpg','uploadfiles/8aac37cf-a7d4-4818-a70e-3d09586db957','jpg','jpg',NULL,NULL,'2015-10-04 21:33:18',NULL,'2015-10-04 21:33:18',NULL),(12,'2e99f5ed-7982-4773-bba6-a188442cc4ac',NULL,'Photo 9-09-13 9 18 21 AM.jpg','uploadfiles/2e99f5ed-7982-4773-bba6-a188442cc4ac','jpg','jpg',NULL,NULL,'2015-10-04 21:33:18',NULL,'2015-10-04 21:33:18',NULL),(13,'50a83274-cca7-4dca-be92-0f15a3ae10ca',NULL,'20141129_170514.jpg','uploadfiles/50a83274-cca7-4dca-be92-0f15a3ae10ca','jpg','jpg',NULL,NULL,'2015-10-05 02:35:18',NULL,'2015-10-05 02:35:18',NULL),(14,'538b7502-77c7-4ba0-af5b-8fc65f5fbf09',NULL,'20141129_170617.jpg','uploadfiles/538b7502-77c7-4ba0-af5b-8fc65f5fbf09','jpg','jpg',NULL,NULL,'2015-10-05 02:35:19',NULL,'2015-10-05 02:35:19',NULL),(15,'97d1126b-a8ca-4192-a41c-3716f9d42afe',NULL,'539891_10150771209068948_250988853947_9530644_1476570888_n.jpeg','uploadfiles/97d1126b-a8ca-4192-a41c-3716f9d42afe','jpeg','jpeg',NULL,NULL,'2015-10-05 02:35:19',NULL,'2015-10-05 02:35:19',NULL),(16,'ef6d147d-a87c-46b2-b0a3-57664ad15a71',NULL,'DSC_3918.jpg','uploadfiles/ef6d147d-a87c-46b2-b0a3-57664ad15a71','jpg','jpg',NULL,NULL,'2015-10-05 02:38:27',NULL,'2015-10-05 02:38:27',NULL),(17,'1efa8c90-f27b-4902-8546-3baf9375e13f',NULL,'20150521_092549.jpg','uploadfiles/1efa8c90-f27b-4902-8546-3baf9375e13f','jpg','jpg',NULL,NULL,'2015-10-05 23:12:22',NULL,'2015-10-05 23:12:22',NULL),(18,'ffab96ab-d554-472a-b216-82d78b42f797',NULL,'20150521_092549.jpg','uploadfiles/ffab96ab-d554-472a-b216-82d78b42f797','jpg','jpg',NULL,NULL,'2015-10-05 23:12:48',NULL,'2015-10-05 23:12:48',NULL),(19,'a0d7355b-71df-4c1f-a1c6-acd6a1f441c5',NULL,'2015-03-20 21.16.33.jpg','uploadfiles/a0d7355b-71df-4c1f-a1c6-acd6a1f441c5','jpg','jpg',NULL,NULL,'2015-10-05 23:12:48',NULL,'2015-10-05 23:12:48',NULL),(20,'5df8f20d-f0d4-48ae-945d-a4b81745c79b',NULL,'DSC_3918.jpg','uploadfiles/5df8f20d-f0d4-48ae-945d-a4b81745c79b','jpg','jpg',NULL,NULL,'2015-10-05 23:12:48',NULL,'2015-10-05 23:12:48',NULL),(21,'fb89e821-ecb9-412d-a12d-61127824f9f4',NULL,'20150521_092549.jpg','uploadfiles/fb89e821-ecb9-412d-a12d-61127824f9f4','jpg','jpg',NULL,NULL,'2015-10-05 23:25:00',NULL,'2015-10-05 23:25:00',NULL),(22,'df53fc7a-e3ef-45d3-be9f-d11212b05c5b',NULL,'2015-03-20 21.16.33.jpg','uploadfiles/df53fc7a-e3ef-45d3-be9f-d11212b05c5b','jpg','jpg',NULL,NULL,'2015-10-05 23:25:00',NULL,'2015-10-05 23:25:00',NULL),(23,'5328555c-0005-41f7-8b53-a1b105b00459',NULL,'Appointment.js','uploadfiles/5328555c-0005-41f7-8b53-a1b105b00459','js','js',NULL,NULL,'2015-10-05 23:30:18',NULL,'2015-10-05 23:30:18',NULL),(24,'d1c873e2-21a7-4001-b121-a74ad92be769',NULL,'GenerateData.js','uploadfiles/d1c873e2-21a7-4001-b121-a74ad92be769','js','js',NULL,NULL,'2015-10-05 23:30:18',NULL,'2015-10-05 23:30:18',NULL),(25,'cd60b0c8-28ae-412d-83e8-710da01ff936',NULL,'Pagination.js','uploadfiles/cd60b0c8-28ae-412d-83e8-710da01ff936','js','js',NULL,NULL,'2015-10-05 23:30:18',NULL,'2015-10-05 23:30:18',NULL),(26,'bc75b84e-0bfa-4946-8224-effd0a6d9a83',NULL,'20150521_092549.jpg','uploadfiles/bc75b84e-0bfa-4946-8224-effd0a6d9a83','jpg','jpg',NULL,NULL,'2015-10-05 23:36:15',NULL,'2015-10-05 23:36:15',NULL),(27,'02716630-4193-405a-9114-c22ad9401a05',NULL,'2015-03-20 21.16.33.jpg','uploadfiles/02716630-4193-405a-9114-c22ad9401a05','jpg','jpg',NULL,NULL,'2015-10-05 23:36:15',NULL,'2015-10-05 23:36:15',NULL),(28,'a54c23a9-497c-4d5e-b142-b043067ef48f',NULL,'bg_home .jpg','uploadfiles/a54c23a9-497c-4d5e-b142-b043067ef48f','jpg','jpg',NULL,NULL,'2015-10-05 23:43:12',NULL,'2015-10-05 23:43:12',NULL),(29,'6fe65d1e-fea1-4487-b668-4e5d7afbf79d',NULL,'bg_home1.jpg','uploadfiles/6fe65d1e-fea1-4487-b668-4e5d7afbf79d','jpg','jpg',NULL,NULL,'2015-10-05 23:43:12',NULL,'2015-10-05 23:43:12',NULL),(30,'0a006a3e-f1ac-40d9-9850-8bc5b4967e50',NULL,'9.jpg','uploadfiles/0a006a3e-f1ac-40d9-9850-8bc5b4967e50','jpg','jpg',NULL,NULL,'2015-10-06 04:03:47',NULL,'2015-10-06 04:03:47',NULL),(31,'0672bab1-0f0d-4f54-98c3-de787778716c',NULL,'640-Flowers-Near-Fence-l.jpg','uploadfiles/0672bab1-0f0d-4f54-98c3-de787778716c','jpg','jpg',NULL,NULL,'2015-10-06 04:03:47',NULL,'2015-10-06 04:03:47',NULL),(32,'c0230b7e-db78-418a-b47b-5aef3a0295a4',NULL,'900-above_the_clouds-l.jpg','uploadfiles/c0230b7e-db78-418a-b47b-5aef3a0295a4','jpg','jpg',NULL,NULL,'2015-10-06 04:03:47',NULL,'2015-10-06 04:03:47',NULL),(33,'b4671d8e-8811-4328-9012-960767d7fa80',NULL,'900-bridge-fre-sonneveld-oakland-l.jpg','uploadfiles/b4671d8e-8811-4328-9012-960767d7fa80','jpg','jpg',NULL,NULL,'2015-10-06 04:03:47',NULL,'2015-10-06 04:03:47',NULL),(34,'f16d4717-a8a7-4a2a-8c52-f51a06b99079',NULL,'900-Cherry-Blossoms-l.jpg','uploadfiles/f16d4717-a8a7-4a2a-8c52-f51a06b99079','jpg','jpg',NULL,NULL,'2015-10-06 04:03:47',NULL,'2015-10-06 04:03:47',NULL),(35,'b572a84b-96a6-45a0-bbec-10c16986da74',NULL,'20150521_092549.jpg','uploadfiles/b572a84b-96a6-45a0-bbec-10c16986da74','jpg','jpg',NULL,NULL,'2015-10-06 18:47:04',NULL,'2015-10-06 18:47:04',NULL);

/*Table structure for table `MedicalImage` */

DROP TABLE IF EXISTS `MedicalImage`;

CREATE TABLE `MedicalImage` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FileUploadID` bigint(20) NOT NULL,
  `BodyPart` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_TelehealthInjuryImage_FileUpload1_idx` (`FileUploadID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `MedicalImage` */

/*Table structure for table `MessageQueue` */

DROP TABLE IF EXISTS `MessageQueue`;

CREATE TABLE `MessageQueue` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `UrgentRequestID` bigint(20) NOT NULL,
  `Source` varchar(100) DEFAULT NULL,
  `SourceID` int(11) DEFAULT NULL,
  `Job` varchar(100) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `StartTime` timestamp NULL DEFAULT NULL,
  `CompletedTime` timestamp NULL DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_MessageQueue_UrgentRequest1_idx` (`UrgentRequestID`),
  KEY `idx_UID` (`UID`),
  CONSTRAINT `fk_MessageQueue_UrgentRequest1` FOREIGN KEY (`UrgentRequestID`) REFERENCES `UrgentRequest` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

/*Data for the table `MessageQueue` */

insert  into `MessageQueue`(`ID`,`UID`,`UrgentRequestID`,`Source`,`SourceID`,`Job`,`Status`,`StartTime`,`CompletedTime`,`CreatedDate`,`CreatedBy`,`ModifiedDate`,`ModifiedBy`) values (154,'f505cdad-bfb9-47cd-b3a2-bc6d32d493f1',362,'Urgent Request',1,'Receive email urgent request','spending','2015-09-24 06:46:35',NULL,'2015-09-24 06:46:35',NULL,NULL,NULL),(155,'27be3ac3-aed9-4c9a-87ef-b3882a29d245',363,'Urgent Request',1,'Receive email urgent request','completed','2015-09-24 07:08:37','2015-09-24 07:13:37','2015-09-24 07:08:37',NULL,'2015-09-24 07:13:37',NULL),(156,'61745e2a-a672-4d66-bca7-6d64c8ccf264',364,'Urgent Request',1,'Receive email urgent request','completed','2015-09-24 07:38:54','2015-09-24 07:43:54','2015-09-24 07:38:54',NULL,'2015-09-24 07:43:54',NULL),(157,'c26576ff-9d15-45f6-8c26-2e2bf7d9d433',365,'Urgent Request',1,'Receive email urgent request','completed','2015-09-24 07:58:24','2015-09-24 08:03:24','2015-09-24 07:58:24',NULL,'2015-09-24 08:03:24',NULL),(158,'c521a12b-8adc-46d5-810b-b78142f26102',366,'Urgent Request',1,'Receive email urgent request','completed','2015-09-24 08:00:29','2015-09-24 08:05:29','2015-09-24 08:00:29',NULL,'2015-09-24 08:05:29',NULL),(159,'a913a91b-74a3-4c8f-ab55-021857afdace',367,'Urgent Request',1,'Receive email urgent request','completed','2015-09-24 08:03:53','2015-09-24 08:08:53','2015-09-24 08:03:53',NULL,'2015-09-24 08:08:53',NULL),(160,'444065a6-3624-46f0-8042-9f0d3cc7e84f',368,'Urgent Request',1,'Receive email urgent request','completed','2015-09-24 08:05:56','2015-09-24 08:10:56','2015-09-24 08:05:56',NULL,'2015-09-24 08:10:56',NULL),(161,'83dffaa9-090a-4edf-9223-d2cc8b7c11c9',369,'Urgent Request',1,'Receive email urgent request','completed','2015-09-24 08:17:20','2015-09-24 08:22:20','2015-09-24 08:17:20',NULL,'2015-09-24 08:22:20',NULL),(162,'3e66b4e7-7da8-4f31-b1a4-e9b8fe39bfe3',370,'Urgent Request',1,'Receive email urgent request','completed','2015-09-24 08:17:34','2015-09-24 08:22:34','2015-09-24 08:17:34',NULL,'2015-09-24 08:22:34',NULL),(163,'e1bb2d08-6426-40bb-9a0d-df1e6c39b7d7',371,'Urgent Request',1,'Receive email urgent request','completed','2015-09-24 08:18:18','2015-09-24 08:23:18','2015-09-24 08:18:18',NULL,'2015-09-24 08:23:18',NULL);

/*Table structure for table `Module` */

DROP TABLE IF EXISTS `Module`;

CREATE TABLE `Module` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `ModuleName` varchar(255) DEFAULT NULL,
  `Description` text,
  `Enable` varchar(1) DEFAULT NULL COMMENT 'Y/N',
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `Module` */

insert  into `Module`(`ID`,`UID`,`ModuleName`,`Description`,`Enable`,`CreatedDate`,`CreatedBy`,`ModifiedDate`,`ModifiedBy`) values (1,'123456','ModuleName','Description','Y','2015-10-08 11:09:36',NULL,'2015-10-08 11:09:36',NULL);

/*Table structure for table `Patient` */

DROP TABLE IF EXISTS `Patient`;

CREATE TABLE `Patient` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `SiteID` bigint(20) DEFAULT NULL,
  `UserAccountID` bigint(20) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(100) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `DOB` timestamp NULL DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL COMMENT 'M/F',
  `Address` varchar(255) DEFAULT NULL,
  `Suburb` varchar(100) DEFAULT NULL,
  `Postcode` varchar(100) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `HomePhoneNumber` varchar(20) DEFAULT NULL,
  `CountryID` bigint(20) DEFAULT NULL,
  `Enable` varchar(1) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_SysPatient_SysSite1_idx` (`SiteID`),
  KEY `fk_SysPatient_SysUserAccount1_idx` (`UserAccountID`),
  KEY `fk_SysPatient_SysCountry1_idx` (`CountryID`),
  KEY `idx_UID` (`UID`),
  CONSTRAINT `fk_SysPatient_SysCountry1_idx` FOREIGN KEY (`CountryID`) REFERENCES `Country` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SysPatient_SysSite1` FOREIGN KEY (`SiteID`) REFERENCES `Site` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SysPatient_SysUserAccount1` FOREIGN KEY (`UserAccountID`) REFERENCES `UserAccount` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `Patient` */

insert  into `Patient`(`ID`,`UID`,`SiteID`,`UserAccountID`,`FirstName`,`MiddleName`,`LastName`,`DOB`,`Gender`,`Address`,`Suburb`,`Postcode`,`Email`,`HomePhoneNumber`,`CountryID`,`Enable`,`CreatedDate`,`CreatedBy`,`ModifiedDate`,`ModifiedBy`) values (3,'c2af34c7-1365-4406-b087-861b74fa5f79',1,5,'Linh','Ha','Nguyen',NULL,'F','a14/11t ap 2 xa Binh Hung huyen Binh Chanh',NULL,'',NULL,NULL,84,'Y',NULL,NULL,NULL,NULL),(4,'8b40acf1-8eb9-4fe9-a61f-2e21c2c32016',1,6,'rasonaldo','delifsama','Di','2015-10-30 07:12:12','F','a14/11t ap 2 xa Binh Hung huyen Binh Chanh',NULL,'',NULL,NULL,84,'Y','2015-10-07 02:28:48',NULL,NULL,NULL),(5,'a7fdb7a0-b21d-4238-98dd-13c9983f92a7',1,7,'KaKa','DeDe','MaMa','2015-05-02 05:00:00','F','a14/11t ap 2 xa Binh Hung huyen Binh Chanh',NULL,'',NULL,NULL,84,'Y','2015-10-07 02:29:32',NULL,NULL,NULL),(6,'64551c71-70cb-4f66-9ba1-50e1d5b67ccc',1,8,'Nhung','Hong','Do','2015-01-30 06:00:00','F','Ha Dong Ha Noi',NULL,'',NULL,NULL,84,'Y','2015-10-07 02:30:17',NULL,'2015-10-07 02:49:02',NULL),(7,'122a736c-e17b-414a-8477-84d0855651c5',1,14,'Kim','Da','Gay','2015-10-06 17:00:00','F','addddd','asdasdasdas','asdoasdasdasdsadasiodhasd',NULL,NULL,200,'Y','2015-10-07 04:33:07',NULL,'2015-10-07 08:23:03',NULL),(8,'90b850e3-6a3f-42bf-970a-a57db56bb04f',1,16,'Bog','Gon','KIKI','2015-01-30 02:00:00','F','a14/11t ap 2 xa Binh Hung huyen Binh Chanh',NULL,'',NULL,NULL,84,'Y','2015-10-07 04:39:48',NULL,NULL,NULL),(9,'5af96807-d6ed-41d5-ae79-5735483400f0',1,18,'Bog','Gon','KIKI','2015-10-06 17:00:00',NULL,'a14/11t ap 2 xa Binh Hung huyen Binh Chanh','bomb','asdoasiodhasd','biladen@gmail.com',NULL,84,'Y','2015-10-07 06:57:10',NULL,NULL,NULL),(10,'d952e552-3c9b-474c-989a-b012a9258f3c',1,19,'Bog','Gon','KIKI',NULL,NULL,'a14/11t anh','bomb','asdoasiodhasd','obama@gmail.com',NULL,84,'Y','2015-10-07 07:01:22',NULL,NULL,NULL),(11,'9a7cc6a4-c63e-4003-8065-3515e9c4c19b',1,20,'Bsog','a','KIKI','2015-01-30 02:00:00',NULL,'a14/11t anh','bomb','asdoasiodhasd','spiderman@gmail.com',NULL,84,'Y','2015-10-07 07:02:06',NULL,NULL,NULL),(12,'2ef428a5-6112-4418-87a3-c8cbbd0c9846',1,28,'Chan','Nhu','ConGian','2015-01-30 02:00:00',NULL,'addddd','bb_ok','asdoasdasdasdsadasiodhasd','as12s@gmail.com','0933990549',84,'Y','2015-10-07 07:37:37',NULL,NULL,NULL),(13,'5b6ae14d-261d-462b-9590-213d8e2d4656',1,34,'Chan','Nhu','ConGian','2015-01-30 02:00:00',NULL,'addddd','bb_ok','asdoasdasdasdsadasiodhasd','uihiuhuihihi@gmail.com',NULL,84,'Y','2015-10-07 07:45:45',NULL,NULL,NULL),(14,'30b017c9-7a99-4ae7-adf6-ded948b93191',1,37,'Chan','Nhu','ConGian','2015-01-30 02:00:00',NULL,'addddd','bb_ok','asdoasdasdasdsadasiodhasd','as@gmail.com',NULL,84,'Y','2015-10-07 08:04:25',NULL,NULL,NULL),(15,'8a5f7a82-a4e2-4f95-a86b-b74c41f3ba29',1,39,'Chan','Nhu','ConGian','2015-01-30 02:00:00',NULL,'addddd','bb_ok','asdoasdasdasdsadasiodhasd','b16@gmail.com',NULL,84,'Y','2015-10-07 08:04:45',NULL,NULL,NULL),(16,'32f4ca12-b350-4355-ab53-55fc297a10c2',1,40,'Chan','Nhu','ConGian','2015-01-30 02:00:00',NULL,'addddd','bb_ok','asdoasdasdasdsadasiodhasd',NULL,NULL,84,'Y','2015-10-07 08:09:36',NULL,NULL,NULL),(17,'fff0226e-2f5d-46d4-b930-00adf20b7390',1,41,'Northland ','asdvvasd','aa',NULL,NULL,'24 / as',NULL,NULL,'kakalot08@gmail.com',NULL,NULL,'Y','2015-10-08 11:03:56',NULL,NULL,NULL);

/*Table structure for table `PatientAppointment` */

DROP TABLE IF EXISTS `PatientAppointment`;

CREATE TABLE `PatientAppointment` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `TelehealthAppointmentID` bigint(20) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(100) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `DOB` timestamp NULL DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Suburb` varchar(100) DEFAULT NULL,
  `Postcode` varchar(100) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `HomePhoneNumber` varchar(20) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_PatientAppointment_TelehealthAppointment1_idx` (`TelehealthAppointmentID`),
  KEY `idx_UID` (`UID`),
  CONSTRAINT `fk_PatientAppointment_TelehealthAppointment1` FOREIGN KEY (`TelehealthAppointmentID`) REFERENCES `TelehealthAppointment` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `PatientAppointment` */

/*Table structure for table `PostCode` */

DROP TABLE IF EXISTS `PostCode`;

CREATE TABLE `PostCode` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Postcode` varchar(100) NOT NULL,
  `Suburb` varchar(45) NOT NULL,
  `State` varchar(4) NOT NULL,
  `DC` varchar(45) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `Lat` double NOT NULL DEFAULT '0',
  `Lon` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `idx_lon` (`Lon`),
  KEY `idx_lat` (`Lat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `PostCode` */

/*Table structure for table `PreferedPlasticSurgeon` */

DROP TABLE IF EXISTS `PreferedPlasticSurgeon`;

CREATE TABLE `PreferedPlasticSurgeon` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TelehealthAppointmentID` bigint(20) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_PreferedPlasticSurgeon_TelehealthAppointment1_idx` (`TelehealthAppointmentID`),
  CONSTRAINT `fk_PreferedPlasticSurgeon_TelehealthAppointment1` FOREIGN KEY (`TelehealthAppointmentID`) REFERENCES `TelehealthAppointment` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `PreferedPlasticSurgeon` */

/*Table structure for table `RelDoctorAppointment` */

DROP TABLE IF EXISTS `RelDoctorAppointment`;

CREATE TABLE `RelDoctorAppointment` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DoctorID` bigint(20) NOT NULL,
  `AppointmentID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_RelDoctorAppointment_Doctor1_idx` (`DoctorID`),
  KEY `fk_RelDoctorAppointment_Appointment1_idx` (`AppointmentID`),
  CONSTRAINT `fk_RelDoctorAppointment_Appointment1` FOREIGN KEY (`AppointmentID`) REFERENCES `Appointment` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_RelDoctorAppointment_Doctor1` FOREIGN KEY (`DoctorID`) REFERENCES `Doctor` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `RelDoctorAppointment` */

/*Table structure for table `RelPatientAppointment` */

DROP TABLE IF EXISTS `RelPatientAppointment`;

CREATE TABLE `RelPatientAppointment` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PatientID` bigint(20) NOT NULL,
  `AppointmentID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_RelPatientAppointment_Patient1_idx` (`PatientID`),
  KEY `fk_RelPatientAppointment_Appointment1_idx` (`AppointmentID`),
  CONSTRAINT `fk_RelPatientAppointment_Appointment1` FOREIGN KEY (`AppointmentID`) REFERENCES `Appointment` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_RelPatientAppointment_Patient1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `RelPatientAppointment` */

/*Table structure for table `RelTelehealthAppointmentDoctor` */

DROP TABLE IF EXISTS `RelTelehealthAppointmentDoctor`;

CREATE TABLE `RelTelehealthAppointmentDoctor` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TelehealthAppointmentID` bigint(20) NOT NULL,
  `DoctorID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_RelTelehealthAppointmentDoctor_TelehealthAppointment1_idx` (`TelehealthAppointmentID`),
  KEY `fk_RelTelehealthAppointmentDoctor_Doctor1_idx` (`DoctorID`),
  CONSTRAINT `fk_RelTelehealthAppointmentDoctor_Doctor1` FOREIGN KEY (`DoctorID`) REFERENCES `Doctor` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_RelTelehealthAppointmentDoctor_TelehealthAppointment1` FOREIGN KEY (`TelehealthAppointmentID`) REFERENCES `TelehealthAppointment` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `RelTelehealthAppointmentDoctor` */

/*Table structure for table `RelUserRole` */

DROP TABLE IF EXISTS `RelUserRole`;

CREATE TABLE `RelUserRole` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserAccountId` bigint(20) NOT NULL,
  `RoleId` bigint(20) NOT NULL,
  `SiteId` bigint(20) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_SysRelUserRole_SysUserAccount_idx` (`UserAccountId`),
  KEY `fk_SysRelUserRole_SysSite1_idx` (`SiteId`),
  KEY `fk_SysRelUserRole_SysRole1_idx` (`RoleId`),
  CONSTRAINT `fk_SysRelUserRole_SysRole1` FOREIGN KEY (`RoleId`) REFERENCES `Role` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SysRelUserRole_SysSite1` FOREIGN KEY (`SiteId`) REFERENCES `Site` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SysRelUserRole_SysUserAccount` FOREIGN KEY (`UserAccountId`) REFERENCES `UserAccount` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `RelUserRole` */

insert  into `RelUserRole`(`ID`,`UserAccountId`,`RoleId`,`SiteId`,`CreationDate`,`CreatedBy`,`ModifiedDate`,`ModifiedBy`) values (1,4,1,1,NULL,NULL,NULL,NULL);

/*Table structure for table `Role` */

DROP TABLE IF EXISTS `Role`;

CREATE TABLE `Role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `RoleCode` varchar(255) DEFAULT NULL,
  `RoleName` varchar(256) NOT NULL,
  `Description` text,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RoleCode_UNIQUE` (`RoleCode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `Role` */

insert  into `Role`(`ID`,`UID`,`RoleCode`,`RoleName`,`Description`,`CreatedDate`,`CreatedBy`,`ModifiedDate`,`ModifiedBy`) values (1,'111',NULL,'Admin','desc1',NULL,NULL,NULL,NULL);

/*Table structure for table `Site` */

DROP TABLE IF EXISTS `Site`;

CREATE TABLE `Site` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `SiteName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `FaxNumber` varchar(20) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `Description` text,
  `Enable` varchar(1) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `Site` */

insert  into `Site`(`ID`,`UID`,`SiteName`,`Address`,`PhoneNumber`,`FaxNumber`,`Email`,`Location`,`Description`,`Enable`,`CreatedDate`,`CreatedBy`,`ModifiedDate`,`ModifiedBy`) values (1,'4f12c400-6ca9-11e5-b221-e03f49aecb14','Joondalup',NULL,NULL,NULL,NULL,'81 McLarty Avenue, Joondalup WA 6027',NULL,'Y',NULL,NULL,NULL,NULL),(2,'50b8179c-6ca9-11e5-b221-e03f49aecb14','Belmont',NULL,NULL,NULL,NULL,'1 Frederick Street, Belmont WA 6104',NULL,'Y',NULL,NULL,NULL,NULL),(3,'517db2dc-6ca9-11e5-b221-e03f49aecb14','Rockingham',NULL,NULL,NULL,NULL,'Unit 1/23 Chalgrove Avenue, Rockingham WA 6168',NULL,'Y',NULL,NULL,NULL,NULL);

/*Table structure for table `TelehealthAppointment` */

DROP TABLE IF EXISTS `TelehealthAppointment`;

CREATE TABLE `TelehealthAppointment` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `AppointmentID` bigint(20) NOT NULL,
  `Description` text,
  `Fund` varchar(255) DEFAULT NULL,
  `Correspondence` varchar(1) DEFAULT NULL COMMENT 'Y/N',
  `RefName` varchar(255) DEFAULT NULL,
  `RefHealthLink` varchar(255) DEFAULT NULL,
  `RefAddress` varchar(255) DEFAULT NULL,
  `RefTelePhone` varchar(20) DEFAULT NULL,
  `RefPostcode` varchar(100) DEFAULT NULL,
  `RefSignature` varchar(255) DEFAULT NULL,
  `RefDate` timestamp NULL DEFAULT NULL,
  `RefProviderNumber` varchar(45) DEFAULT NULL,
  `RefDurationOfReferal` varchar(2) DEFAULT NULL COMMENT '- 3 months: 03\n- 12 months: 12\n- indefinite: 00',
  `PresentComplain` text,
  `Allergy` text,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_TelehealthAppointment_Appointment1_idx` (`AppointmentID`),
  KEY `idx_UID` (`UID`),
  CONSTRAINT `fk_TelehealthAppointment_Appointment1` FOREIGN KEY (`AppointmentID`) REFERENCES `Appointment` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `TelehealthAppointment` */

/*Table structure for table `TelehealthCallLog` */

DROP TABLE IF EXISTS `TelehealthCallLog`;

CREATE TABLE `TelehealthCallLog` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `FromUserAccountID` bigint(20) NOT NULL,
  `ToUserAccountID` bigint(20) NOT NULL,
  `StartTime` timestamp NULL DEFAULT NULL,
  `EndTime` timestamp NULL DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `NetWorkSpeed` varchar(50) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_UID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `TelehealthCallLog` */

/*Table structure for table `TelehealthCallUser` */

DROP TABLE IF EXISTS `TelehealthCallUser`;

CREATE TABLE `TelehealthCallUser` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TelehealthCallLogID` bigint(20) NOT NULL,
  `TelehealthUserID` bigint(20) NOT NULL,
  `Latitude` varchar(20) DEFAULT NULL,
  `Longitude` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_TelehealthCallLocation_TelehealthCallLog1_idx` (`TelehealthCallLogID`),
  KEY `fk_TelehealthCallLocation_TelehealthUser1_idx` (`TelehealthUserID`),
  CONSTRAINT `fk_TelehealthCallLocation_TelehealthCallLog1` FOREIGN KEY (`TelehealthCallLogID`) REFERENCES `TelehealthCallLog` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TelehealthCallLocation_TelehealthUser1` FOREIGN KEY (`TelehealthUserID`) REFERENCES `TelehealthUser` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `TelehealthCallUser` */

/*Table structure for table `TelehealthDevice` */

DROP TABLE IF EXISTS `TelehealthDevice`;

CREATE TABLE `TelehealthDevice` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `TelehealthUserID` bigint(20) DEFAULT NULL,
  `DeviceToken` text,
  `DeviceID` text,
  `Type` varchar(45) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_TelehealthDevice_TelehealthUser1_idx` (`TelehealthUserID`),
  KEY `idx_UID` (`UID`),
  CONSTRAINT `fk_TelehealthDevice_TelehealthUser1` FOREIGN KEY (`TelehealthUserID`) REFERENCES `TelehealthUser` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `TelehealthDevice` */

/*Table structure for table `TelehealthUser` */

DROP TABLE IF EXISTS `TelehealthUser`;

CREATE TABLE `TelehealthUser` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `UserAccountID` bigint(20) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `DOB` timestamp NULL DEFAULT NULL,
  `Address1` varchar(255) DEFAULT NULL,
  `Address2` varchar(255) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_TelehealthUser_UserAccount1_idx` (`UserAccountID`),
  KEY `idx_UID` (`UID`),
  CONSTRAINT `fk_TelehealthUser_UserAccount1` FOREIGN KEY (`UserAccountID`) REFERENCES `UserAccount` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `TelehealthUser` */

insert  into `TelehealthUser`(`ID`,`UID`,`UserAccountID`,`FirstName`,`LastName`,`DOB`,`Address1`,`Address2`,`CreatedDate`,`CreatedBy`,`ModifiedDate`,`ModifiedBy`) values (1,'16d78cca-33bf-4f59-bf95-8b98b21250a6',37,NULL,NULL,NULL,NULL,NULL,'2015-10-07 09:12:04',NULL,'2015-10-07 09:12:04',NULL);

/*Table structure for table `UrgentRequest` */

DROP TABLE IF EXISTS `UrgentRequest`;

CREATE TABLE `UrgentRequest` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `UserAccountID` bigint(20) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `DOB` timestamp NULL DEFAULT NULL,
  `Suburb` varchar(100) DEFAULT NULL,
  `Ip` varchar(20) DEFAULT NULL,
  `GPReferal` varchar(1) DEFAULT NULL,
  `ServiceType` varchar(3) DEFAULT NULL,
  `RequestType` varchar(255) DEFAULT NULL,
  `RequestDate` timestamp NULL DEFAULT NULL,
  `Tried` int(11) DEFAULT NULL,
  `Interval` int(11) DEFAULT NULL,
  `Further` text,
  `UrgentRequestType` varchar(255) DEFAULT NULL,
  `ConfirmUserName` varchar(255) DEFAULT NULL,
  `CompanyName` varchar(255) DEFAULT NULL,
  `CompanyPhoneNumber` varchar(20) DEFAULT NULL,
  `ContactPerson` varchar(255) DEFAULT NULL,
  `Description` text,
  `Enable` varchar(1) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_UID` (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=372 DEFAULT CHARSET=utf8;

/*Data for the table `UrgentRequest` */

insert  into `UrgentRequest`(`ID`,`UID`,`UserAccountID`,`FirstName`,`LastName`,`PhoneNumber`,`Gender`,`Email`,`DOB`,`Suburb`,`Ip`,`GPReferal`,`ServiceType`,`RequestType`,`RequestDate`,`Tried`,`Interval`,`Further`,`UrgentRequestType`,`ConfirmUserName`,`CompanyName`,`CompanyPhoneNumber`,`ContactPerson`,`Description`,`Enable`,`Status`,`CreatedDate`,`CreatedBy`,`ModifiedDate`,`ModifiedBy`) values (362,'2a787f6f-4aed-49ae-a237-0fb6cd425d55',NULL,'Le','Thanh','+61896356369',NULL,'Thanh@Gmail.com','1990-01-01 17:00:00','Hahah','::ffff:192.168.1.111','Y','HAN',NULL,'2015-09-24 06:46:35',1,5,NULL,NULL,'28:d2:44:65:6a:c4',NULL,NULL,NULL,'Nshsnsn','1','confirmed','2015-09-24 06:46:35',NULL,'2015-09-24 06:57:50',NULL),(363,'cfc18e56-5e58-4e1d-a28b-b2d4714d5579',NULL,'11','111','1111','M','111',NULL,NULL,'192.168.1.1',NULL,NULL,NULL,'2015-09-24 07:08:37',1,5,NULL,NULL,'e0:3f:49:ae:cb:14',NULL,NULL,NULL,NULL,'1','confirmed','2015-09-24 07:08:37',NULL,'2015-09-24 07:23:02',NULL),(364,'fc375fd3-4916-45b1-8653-84c388ae90e2',NULL,'Hdjfj','Bchchchgjj','+61956868898',NULL,'Kdjdjdjdjd@mail.com','1990-01-01 17:00:00','Bdhdhdjffj','::ffff:192.168.1.19','Y','SPE',NULL,'2015-09-24 07:38:54',1,5,NULL,NULL,NULL,NULL,NULL,NULL,'Hdhfjfjcj','1','spending','2015-09-24 07:38:54',NULL,NULL,NULL),(365,'caa748cf-9433-4659-a5be-11e794161ad9',NULL,'Hfhfhh','Hfhfhfh','+61124346565',NULL,'Kfjdjdj@gmail.com','1990-01-01 17:00:00','Hdhfhfhf','192.168.1.1','Y','SPE',NULL,'2015-09-24 07:58:24',1,5,NULL,'UrgentCare','e0:3f:49:ae:cb:14',NULL,NULL,NULL,'Hdhcjcjcj','1','confirmed','2015-09-24 07:58:24',NULL,'2015-09-24 07:58:57',NULL),(366,'1294da5b-7178-4f43-8565-7348f25968c0',NULL,'Hdjfjfh','Hfhfhfhfh','+61124346598',NULL,'Ndjfnfj@gmail.com','1990-01-01 17:00:00','Hxhdhfjcjf','192.168.1.1','Y','PHY',NULL,'2015-09-24 08:00:29',1,5,NULL,'UrgentCare','e0:3f:49:ae:cb:14',NULL,NULL,NULL,'Hxjcjcjcj','1','confirmed','2015-09-24 08:00:29',NULL,'2015-09-24 08:02:06',NULL),(367,'a6dcb279-9a53-4796-a266-25129b67024d',NULL,'manh','duc','+061',NULL,'manh@yahoo.com','2015-09-23 17:00:00','123','::ffff:192.168.1.237','Y','PHY',NULL,'2015-09-24 08:03:53',1,5,NULL,'UrgentCare',NULL,NULL,NULL,NULL,' description','1','spending','2015-09-24 08:03:53',NULL,NULL,NULL),(368,'afed83b9-bbba-4d2c-874c-e857c0ce3008',NULL,'manh','duc','+061',NULL,'manh@yahoo.com','2015-09-23 17:00:00','123123123','192.168.1.1','Y','PHY',NULL,'2015-09-24 08:05:56',1,5,NULL,'UrgentCare',NULL,NULL,NULL,NULL,' description','1','spending','2015-09-24 08:05:56',NULL,NULL,NULL),(369,'5f49f60f-c0a8-44f7-bd44-2164501022ed',NULL,'Hjj','Ghh','+61123456789',NULL,'Kdkdjfh@gmail.com','1990-01-01 17:00:00','Jjdjfjfhfh','192.168.1.1','Y','SPE',NULL,'2015-09-24 08:17:20',1,5,NULL,'UrgentCare',NULL,NULL,NULL,NULL,'Hfhfh','1','spending','2015-09-24 08:17:20',NULL,NULL,NULL),(370,'3f2b2e69-2886-420d-a7c2-cbc36cec5c79',NULL,'manh','duc','+061',NULL,'manh@yahoo.com','2015-09-23 17:00:00','surburb','192.168.1.1','Y','PHY',NULL,'2015-09-24 08:17:34',1,5,NULL,'UrgentCare',NULL,NULL,NULL,NULL,' des','1','spending','2015-09-24 08:17:34',NULL,NULL,NULL),(371,'bd7ec4e3-b84c-492d-9c1a-14ac836f3376',NULL,'Hdhfjfj','Hdhfhfh','+61653295646',NULL,'Jdjfhch@phan.con','1990-01-01 17:00:00','Hdhfhfhfh','192.168.1.1','Y','PHY',NULL,'2015-09-24 08:18:18',1,5,NULL,'UrgentCare','28:d2:44:65:6a:c4',NULL,NULL,NULL,'Hfjfjfj','1','confirmed','2015-09-24 08:18:18',NULL,'2015-09-25 02:10:39',NULL);

/*Table structure for table `UserAccount` */

DROP TABLE IF EXISTS `UserAccount`;

CREATE TABLE `UserAccount` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Password` varchar(256) NOT NULL,
  `PasswordSalt` varchar(256) DEFAULT NULL,
  `PasswordHashAlgorithm` varchar(256) DEFAULT NULL,
  `Activated` varchar(1) DEFAULT NULL,
  `Enable` varchar(1) DEFAULT NULL,
  `UserType` varchar(3) DEFAULT NULL,
  `Token` varchar(256) DEFAULT NULL,
  `TokenExpired` timestamp NULL DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UserName_UNIQUE` (`UserName`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `PhoneNumber_UNIQUE` (`PhoneNumber`),
  KEY `idx_UID` (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

/*Data for the table `UserAccount` */

insert  into `UserAccount`(`ID`,`UID`,`UserName`,`Email`,`PhoneNumber`,`Password`,`PasswordSalt`,`PasswordHashAlgorithm`,`Activated`,`Enable`,`UserType`,`Token`,`TokenExpired`,`CreatedDate`,`CreatedBy`,`ModifiedDate`,`ModifiedBy`) values (1,'1111223232323232323','tan','tan@gmail.com','123','$2a$10$mmS44InuEay4Ad/0FIJE/.B0bZBwXla/o1yEX5iB9nXZSsFNKU7OG','123',NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'7cebeb14-e675-49c8-9d93-329341dc224a','kkkk','kkkk.aaaa@gmail.com','3333','$2a$10$mmS44InuEay4Ad/0FIJE/.B0bZBwXla/o1yEX5iB9nXZSsFNKU7OG',NULL,NULL,'Y','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'6a316ebf-0ea8-4365-ac95-8b9ab340f2cf','admin','admin@gmail.com','0411111111','$2a$10$0I2JJr25u4wodtpNZTAKueg3lS19K/hCMV9FMF0NOw8Uc.XSE193G',NULL,NULL,'Y','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'b06b043b-e690-4e94-950b-20e95aad7f14','499999996','halinh@gmail.com','499999996','$2a$10$51d2NVIz9TRRurSv4DseEuwa.BNqHQtI48fOyIZrIg0HCJhnxcMkW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'f88209a6-d0ba-49fa-b1e9-cbb37a9e4108','411221355','hihih1ai@gmail.com','+61411221355','$2a$10$5DvN/WpsAZTnTqrkkLEpvONvjIK5XGRIsV2TdR1dazQ/jLS94ASx6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 02:28:48',NULL,NULL,NULL),(7,'afa75d76-3863-405c-8f90-30149ff220e6','484685963','congalatao@gmail.com','+61484685963','$2a$10$vxDb7p0nft/muhBXWc1H1.EQ0EqS2OobRgd7pYhzoSLDkyvbcPZyu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 02:29:32',NULL,NULL,NULL),(8,'44bd4f71-932f-4b79-8f9e-e65afd5e4414','439349324','asdasd@gmail.com','+61439349324','$2a$10$TbvWM1RnblUJnZskSdohiOvQDjqg7G1swyqzWaOEDGWeKoXDdR856',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 02:30:17',NULL,NULL,NULL),(11,'e429da8e-8874-4f2b-a963-7f8fcd17736e','477889944','bibi@gmail.com','+61477889944','$2a$10$MlWFebVxPA55TG3tGXnuGu9Wxy./JYhsMcR64FWZU.NzwUnXSqNOG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 04:31:41',NULL,NULL,NULL),(14,'45d42d52-181b-45e1-9614-6190cfe0c6cd','477889554','giangvo1125@gmail.com','+61477889554','$2a$10$dRB0LF4EUSaiGRcMi.CWZ.YBN11LCnGwwJj0PP9cmPaLKQpMFBfme',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 04:33:07',NULL,NULL,NULL),(16,'fa59a948-05a7-437f-8e83-c74bb54da81c','432112352','hihiahihihm@gmail.com','+61432112352','$2a$10$vjvyH2m8xF3Oo943Sh/XKesWPoThnu5zGjdkHoEY4c/hPyngr7fE.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 04:39:48',NULL,NULL,NULL),(18,'f41e15c1-b513-45ef-b3f6-e4b288eaea77','484686428','biladen@gmail.com','+61484686428','$2a$10$.MtzfUyw8NHyLWmECm43X.bLqTT6rSH.hJEkFFzNHDiayf7cTHsxi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 06:57:10',NULL,NULL,NULL),(19,'0a9edb16-33fc-4ec3-917a-ed153d2fb06f','417171714','obama@gmail.com','+61417171714','$2a$10$1YQTJnjOCunBp.1VgHlSneRX9o22Uw0P1RxMkYVtA6QD3jMI.e7OO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 07:01:22',NULL,NULL,NULL),(20,'8fbdebba-1f77-45be-a5b6-f270dffc7ce8','424242424','spiderman@gmail.com','+61424242424','$2a$10$UFHj/UxsO8b/V/NwepJfUuPVD00QReZR.lHhIdKohjUOpbZ5ZE1du',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 07:02:06',NULL,NULL,NULL),(21,'b8047d89-1fa6-4c84-a095-1b3215a2300e','465656574','DOPA@gmail.com','+61465656574','$2a$10$9XzPoYtVDtrVIfD1uoPpUey.S4a212f2KA85YGqvVlAr6nxBD35Li',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 07:20:18',NULL,NULL,NULL),(23,'90c9ed59-1a0b-448d-9e9f-552fd14356bb','452525225','ssss@gmail.com','+61452525225','$2a$10$gvKVPai1xWYTZSO5DDMWiuAWGB7l47uqSTTQ5kh8QceI6mCUB8Izi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 07:23:12',NULL,NULL,NULL),(24,'71a52d3a-3b73-427f-86d0-dd65f6270a56','432657812','bv@gmail.com','+61432657812','$2a$10$JfMBXsbxT659m32bnrec7eTiNWtrMdM05ecnwigsVZuWSOjQBC8hC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 07:24:29',NULL,NULL,NULL),(25,'b3efcfba-1835-430e-8fce-ef731a12a72e','427722742','yeszz@gmail.com','+61427722742','$2a$10$o9KDNvyUTO3uokUE8A0CTOHiZ57y0qestu7aq5oLOwNiGFoOetriW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 07:36:33',NULL,NULL,NULL),(28,'e89205ad-e8f8-45d8-86ea-9ffddee8e7af','477441111','as12s@gmail.com','+61477441111','$2a$10$MkAc9ONLBbAMyxKSFf90o.9YghZWKa4smWwmj26IgaRKqIAsY2TPS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 07:37:36',NULL,NULL,NULL),(29,'6594f1fd-fec9-470b-a30c-3f260d6b54ac','422997518','yesqw2112@gmail.com','+61422997518','$2a$10$rsnBlxboMPCDQUGJl1rADeBaxpp2DnSc83/eyEpLqjf5v8UmET7J6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 07:40:15',NULL,NULL,NULL),(31,'964199a8-734e-4e5d-aa02-a69e7baf2ba9','427419758','bb21a@gmail.com','+61427419758','$2a$10$l7jxs5MnaraP.hsExOBaK.lYqVL7sAVMOb20tmtL9Yy8FFM89wHci',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 07:41:12',NULL,NULL,NULL),(33,'de8d46d6-c46d-4e74-ab95-5726ceb68963','416794328','987giu@gmail.com','+61416794328','$2a$10$4BvnFloEwWp9/8Mrpxt8NuAx1H/raM2srYLL3NIBUN2C.Y8Z9ZoNS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 07:44:45',NULL,NULL,NULL),(34,'ddc9e298-227c-46c0-917b-a350bf9ede6c','437952791','uihiuhuihihi@gmail.com','+84908618694','$2a$10$tiu7KNBYVhKhPcSWSxr72ejLmQXemJGJVsoZxxlGjfWtzqB2BV4SG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 07:45:45',NULL,NULL,NULL),(35,'0ab30d23-af19-4fd2-865d-769fb3e4b702','438769854','hihx@gmail.com','+841267146714','$2a$10$6JHUOHAnkw2OIe8sWQp/1e0bMGUYAyprMAmqNWS/jJkgrblkkKhdi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 07:51:46',NULL,NULL,NULL),(37,'b8734cc6-3d2f-4f3f-8cf1-2070d1d25bff','415975382','as@gmail.com','+84988880682','$2a$10$.LLFHDr1GmZCbNLYTNZDKeuyIfzJUoNNGOh/0McKUnp.bBsgepAju',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 08:04:25',NULL,NULL,NULL),(39,'e8eb39ac-848b-41bd-b7fe-cfab4283f1a0','doctor1','doctor1@gmail.com','+61437194625','$2a$10$3h7OjQgbU.dQ.YfCLKrrQuo0nLvjVRM5roguttul1ZcC0pQM3yU2.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-07 08:04:45',NULL,NULL,NULL),(40,'123412asdasdasd','aconkiki','asd99857@gmail.com','+61439371746','weqweqwewq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'944c69fd-8fc9-46ad-9946-2be0b4903b44','+61478915974','kakalot08@gmail.com','+61478915974','$2a$10$Rau3zr4c60hgTPJ3vmXWuOt2wjs9ZPYD.tufeqdN30HNC0mRxl0oS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08 11:03:56',NULL,NULL,NULL);

/*Table structure for table `UserActivation` */

DROP TABLE IF EXISTS `UserActivation`;

CREATE TABLE `UserActivation` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserAccountID` bigint(20) NOT NULL,
  `VerificationCode` varchar(255) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL COMMENT 'IOS: IOS; Website: WEB; Android: ARD',
  `VerificationToken` varchar(255) DEFAULT NULL,
  `DeviceID` text,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_UserActivation_UserAccount1_idx` (`UserAccountID`),
  CONSTRAINT `fk_UserActivation_UserAccount1` FOREIGN KEY (`UserAccountID`) REFERENCES `UserAccount` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `UserActivation` */

insert  into `UserActivation`(`ID`,`UserAccountID`,`VerificationCode`,`Type`,`VerificationToken`,`DeviceID`,`CreatedDate`,`CreatedBy`,`ModifiedDate`,`ModifiedBy`) values (1,1,NULL,'WEB','123323232323',NULL,NULL,NULL,NULL,NULL),(2,1,'123323232323','IOS',NULL,'222',NULL,NULL,NULL,NULL),(3,2,'123323232323','IOS',NULL,'222',NULL,NULL,NULL,NULL),(5,1,'123323232323','IOS',NULL,'222',NULL,NULL,NULL,NULL),(6,1,'123323232323','ARD',NULL,'222',NULL,NULL,NULL,NULL),(7,1,'123323232323','IOS',NULL,'222',NULL,NULL,NULL,NULL),(8,1,'123323232323222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222','IOS',NULL,'222',NULL,NULL,NULL,NULL),(9,1,'2222222','IOS',NULL,'222',NULL,NULL,NULL,NULL),(10,1,'2222222222222','IOS',NULL,'222',NULL,NULL,NULL,NULL),(11,1,'2222222222222','IOS',NULL,'222',NULL,NULL,NULL,NULL),(12,1,'2222222222222','IOS',NULL,'222',NULL,NULL,NULL,NULL),(13,1,'a','IOS',NULL,'222',NULL,NULL,NULL,NULL),(14,1,'33333','IOS',NULL,'222',NULL,NULL,NULL,NULL),(15,1,'33333','IOS',NULL,'222',NULL,NULL,NULL,NULL),(16,1,'333333333333','IOS',NULL,'222',NULL,NULL,NULL,NULL),(17,1,'333333333333654345','IOS',NULL,'222',NULL,NULL,NULL,NULL),(18,1,'333333333333654345','IOS',NULL,'222',NULL,NULL,NULL,NULL),(19,1,'333333333333654345','IOS',NULL,'222',NULL,NULL,NULL,NULL),(20,1,'333333333333654345','IOS',NULL,'222',NULL,NULL,NULL,NULL),(21,1,'333333333333654345','IOS',NULL,'222',NULL,NULL,NULL,NULL),(22,1,'333333333333654345','IOS',NULL,'222',NULL,NULL,NULL,NULL),(23,1,'333333333333654345','IOS',NULL,'222',NULL,NULL,NULL,NULL),(24,1,'333333333333654345','IOS',NULL,'222',NULL,NULL,NULL,NULL),(25,1,'33','IOS',NULL,'222',NULL,NULL,NULL,NULL),(26,1,'33','IOS',NULL,'222',NULL,NULL,NULL,NULL),(27,37,'793642','ios',NULL,'D48E1443-A8FA-4B20-98EB-5CE68A7D0013','2015-10-07 09:11:37',NULL,'2015-10-07 09:11:37',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
