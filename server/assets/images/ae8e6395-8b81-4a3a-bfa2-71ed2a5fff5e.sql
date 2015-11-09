-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: telehealthvietnam.com.vn    Database: Redimed
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `Appointment`
--

DROP TABLE IF EXISTS `Appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Appointment` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `SiteID` bigint(20) NOT NULL,
  `DoctorID` bigint(20) NOT NULL,
  `PatientID` bigint(20) NOT NULL,
  `FromTime` timestamp NULL DEFAULT NULL,
  `ToTime` timestamp NULL DEFAULT NULL,
  `Enable` varchar(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_SysAppointment_SysPatient1_idx` (`PatientID`),
  KEY `fk_SysAppointment_SysSite1_idx` (`SiteID`),
  KEY `fk_SysAppointment_SysDoctor1_idx` (`DoctorID`),
  CONSTRAINT `fk_SysAppointment_SysDoctor1` FOREIGN KEY (`DoctorID`) REFERENCES `Doctor` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SysAppointment_SysPatient1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SysAppointment_SysSite1` FOREIGN KEY (`SiteID`) REFERENCES `Site` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Appointment`
--

LOCK TABLES `Appointment` WRITE;
/*!40000 ALTER TABLE `Appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Country` (
  `ID` bigint(20) NOT NULL,
  `UID` varchar(255) NOT NULL,
  `CountryCode` varchar(2) DEFAULT NULL COMMENT 'EX: Vietnam --> VN',
  `CountryName` varchar(256) DEFAULT NULL,
  `Description` text,
  `Enable` varchar(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doctor` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `SiteID` bigint(20) NOT NULL,
  `UserAccountID` bigint(20) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(100) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Dob` timestamp NULL DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `Phone` varchar(12) DEFAULT NULL,
  `Enable` varchar(1) DEFAULT NULL COMMENT 'Y/N',
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_SysDoctor_SysSite1_idx` (`SiteID`),
  KEY `fk_SysDoctor_SysUserAccount1_idx` (`UserAccountID`),
  CONSTRAINT `fk_SysDoctor_SysSite1` FOREIGN KEY (`SiteID`) REFERENCES `Site` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SysDoctor_SysUserAccount1` FOREIGN KEY (`UserAccountID`) REFERENCES `UserAccount` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor`
--

LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FileUpload`
--

DROP TABLE IF EXISTS `FileUpload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FileUpload` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) DEFAULT NULL,
  `FileLocation` varchar(255) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CreationBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FileUpload`
--

LOCK TABLES `FileUpload` WRITE;
/*!40000 ALTER TABLE `FileUpload` DISABLE KEYS */;
/*!40000 ALTER TABLE `FileUpload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MedicalImage`
--

DROP TABLE IF EXISTS `MedicalImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MedicalImage` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FileUploadID` bigint(20) NOT NULL,
  `BodyPart` varchar(255) DEFAULT NULL,
  `Description` text,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_TelehealthInjuryImage_FileUpload1_idx` (`FileUploadID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MedicalImage`
--

LOCK TABLES `MedicalImage` WRITE;
/*!40000 ALTER TABLE `MedicalImage` DISABLE KEYS */;
/*!40000 ALTER TABLE `MedicalImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MessageQueue`
--

DROP TABLE IF EXISTS `MessageQueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_MessageQueue_UrgentRequest1_idx` (`UrgentRequestID`),
  CONSTRAINT `fk_MessageQueue_UrgentRequest1` FOREIGN KEY (`UrgentRequestID`) REFERENCES `UrgentRequest` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MessageQueue`
--

LOCK TABLES `MessageQueue` WRITE;
/*!40000 ALTER TABLE `MessageQueue` DISABLE KEYS */;
INSERT INTO `MessageQueue` VALUES (154,'f505cdad-bfb9-47cd-b3a2-bc6d32d493f1',362,'Urgent Request',1,'Receive email urgent request','spending','2015-09-24 06:46:35',NULL,'2015-09-24 06:46:35',NULL,NULL,NULL),(155,'27be3ac3-aed9-4c9a-87ef-b3882a29d245',363,'Urgent Request',1,'Receive email urgent request','completed','2015-09-24 07:08:37','2015-09-24 07:13:37','2015-09-24 07:08:37',NULL,'2015-09-24 07:13:37',NULL),(156,'61745e2a-a672-4d66-bca7-6d64c8ccf264',364,'Urgent Request',1,'Receive email urgent request','completed','2015-09-24 07:38:54','2015-09-24 07:43:54','2015-09-24 07:38:54',NULL,'2015-09-24 07:43:54',NULL),(157,'c26576ff-9d15-45f6-8c26-2e2bf7d9d433',365,'Urgent Request',1,'Receive email urgent request','completed','2015-09-24 07:58:24','2015-09-24 08:03:24','2015-09-24 07:58:24',NULL,'2015-09-24 08:03:24',NULL),(158,'c521a12b-8adc-46d5-810b-b78142f26102',366,'Urgent Request',1,'Receive email urgent request','completed','2015-09-24 08:00:29','2015-09-24 08:05:29','2015-09-24 08:00:29',NULL,'2015-09-24 08:05:29',NULL),(159,'a913a91b-74a3-4c8f-ab55-021857afdace',367,'Urgent Request',1,'Receive email urgent request','completed','2015-09-24 08:03:53','2015-09-24 08:08:53','2015-09-24 08:03:53',NULL,'2015-09-24 08:08:53',NULL),(160,'444065a6-3624-46f0-8042-9f0d3cc7e84f',368,'Urgent Request',1,'Receive email urgent request','completed','2015-09-24 08:05:56','2015-09-24 08:10:56','2015-09-24 08:05:56',NULL,'2015-09-24 08:10:56',NULL),(161,'83dffaa9-090a-4edf-9223-d2cc8b7c11c9',369,'Urgent Request',1,'Receive email urgent request','completed','2015-09-24 08:17:20','2015-09-24 08:22:20','2015-09-24 08:17:20',NULL,'2015-09-24 08:22:20',NULL),(162,'3e66b4e7-7da8-4f31-b1a4-e9b8fe39bfe3',370,'Urgent Request',1,'Receive email urgent request','completed','2015-09-24 08:17:34','2015-09-24 08:22:34','2015-09-24 08:17:34',NULL,'2015-09-24 08:22:34',NULL),(163,'e1bb2d08-6426-40bb-9a0d-df1e6c39b7d7',371,'Urgent Request',1,'Receive email urgent request','completed','2015-09-24 08:18:18','2015-09-24 08:23:18','2015-09-24 08:18:18',NULL,'2015-09-24 08:23:18',NULL);
/*!40000 ALTER TABLE `MessageQueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Module`
--

DROP TABLE IF EXISTS `Module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Module` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(100) NOT NULL,
  `ModuleName` varchar(256) DEFAULT NULL,
  `Description` text,
  `Enable` varchar(1) DEFAULT NULL COMMENT 'Y/N',
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Module`
--

LOCK TABLES `Module` WRITE;
/*!40000 ALTER TABLE `Module` DISABLE KEYS */;
/*!40000 ALTER TABLE `Module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patient` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `SiteID` bigint(20) NOT NULL,
  `UserAccountID` bigint(20) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(100) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Dob` timestamp NULL DEFAULT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `CountryID` bigint(20) NOT NULL,
  `Enable` varchar(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_SysPatient_SysSite1_idx` (`SiteID`),
  KEY `fk_SysPatient_SysUserAccount1_idx` (`UserAccountID`),
  KEY `fk_SysPatient_SysCountry1_idx` (`CountryID`),
  CONSTRAINT `fk_SysPatient_SysCountry1` FOREIGN KEY (`CountryID`) REFERENCES `Country` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SysPatient_SysSite1` FOREIGN KEY (`SiteID`) REFERENCES `Site` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SysPatient_SysUserAccount1` FOREIGN KEY (`UserAccountID`) REFERENCES `UserAccount` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RelUserRole`
--

DROP TABLE IF EXISTS `RelUserRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RelUserRole` (
  `UserAccountId` bigint(20) NOT NULL,
  `RoleId` bigint(20) NOT NULL,
  `ModuleId` bigint(20) NOT NULL,
  `SiteId` bigint(20) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  KEY `fk_SysRelUserRole_SysUserAccount_idx` (`UserAccountId`),
  KEY `fk_SysRelUserRole_SysSite1_idx` (`SiteId`),
  KEY `fk_SysRelUserRole_SysRole1_idx` (`RoleId`),
  KEY `fk_SysRelUserRole_SysModule1_idx` (`ModuleId`),
  CONSTRAINT `fk_SysRelUserRole_SysModule1` FOREIGN KEY (`ModuleId`) REFERENCES `Module` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SysRelUserRole_SysRole1` FOREIGN KEY (`RoleId`) REFERENCES `Role` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SysRelUserRole_SysSite1` FOREIGN KEY (`SiteId`) REFERENCES `Site` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SysRelUserRole_SysUserAccount` FOREIGN KEY (`UserAccountId`) REFERENCES `UserAccount` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RelUserRole`
--

LOCK TABLES `RelUserRole` WRITE;
/*!40000 ALTER TABLE `RelUserRole` DISABLE KEYS */;
/*!40000 ALTER TABLE `RelUserRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `RoleName` varchar(256) NOT NULL,
  `Description` text,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Site`
--

DROP TABLE IF EXISTS `Site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Site` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `SiteName` varchar(256) DEFAULT NULL,
  `Location` varchar(256) DEFAULT NULL,
  `Description` text,
  `Enable` varchar(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Site`
--

LOCK TABLES `Site` WRITE;
/*!40000 ALTER TABLE `Site` DISABLE KEYS */;
/*!40000 ALTER TABLE `Site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TelehealthCallLog`
--

DROP TABLE IF EXISTS `TelehealthCallLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TelehealthCallLog` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `FromUserAccountID` bigint(20) NOT NULL,
  `ToUserAccountID` bigint(20) NOT NULL,
  `StartTime` timestamp NULL DEFAULT NULL,
  `EndTime` timestamp NULL DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `NetWorkSpeed` varchar(50) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TelehealthCallLog`
--

LOCK TABLES `TelehealthCallLog` WRITE;
/*!40000 ALTER TABLE `TelehealthCallLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `TelehealthCallLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TelehealthCallUser`
--

DROP TABLE IF EXISTS `TelehealthCallUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TelehealthCallUser` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TelehealthCallLogID` bigint(20) NOT NULL,
  `TelehealthUserID` bigint(20) NOT NULL,
  `Latitude` varchar(20) DEFAULT NULL,
  `Longitude` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_TelehealthCallLocation_TelehealthCallLog1_idx` (`TelehealthCallLogID`),
  KEY `fk_TelehealthCallLocation_TelehealthUser1_idx` (`TelehealthUserID`),
  CONSTRAINT `fk_TelehealthCallLocation_TelehealthCallLog1` FOREIGN KEY (`TelehealthCallLogID`) REFERENCES `TelehealthCallLog` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TelehealthCallLocation_TelehealthUser1` FOREIGN KEY (`TelehealthUserID`) REFERENCES `TelehealthUser` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TelehealthCallUser`
--

LOCK TABLES `TelehealthCallUser` WRITE;
/*!40000 ALTER TABLE `TelehealthCallUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `TelehealthCallUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TelehealthDevice`
--

DROP TABLE IF EXISTS `TelehealthDevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TelehealthDevice` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `TelehealthUserID` bigint(20) DEFAULT NULL,
  `DeviceToken` text,
  `Type` varchar(45) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  `DeviceID` text,
  PRIMARY KEY (`ID`),
  KEY `fk_TelehealthDevice_TelehealthUser1_idx` (`TelehealthUserID`),
  CONSTRAINT `fk_TelehealthDevice_TelehealthUser1` FOREIGN KEY (`TelehealthUserID`) REFERENCES `TelehealthUser` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TelehealthDevice`
--

LOCK TABLES `TelehealthDevice` WRITE;
/*!40000 ALTER TABLE `TelehealthDevice` DISABLE KEYS */;
/*!40000 ALTER TABLE `TelehealthDevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TelehealthUser`
--

DROP TABLE IF EXISTS `TelehealthUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TelehealthUser` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `UserAccountID` bigint(20) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `DOB` timestamp NULL DEFAULT NULL,
  `Address1` varchar(255) DEFAULT NULL,
  `Address2` varchar(255) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_TelehealthUser_UserAccount1_idx` (`UserAccountID`),
  CONSTRAINT `fk_TelehealthUser_UserAccount1` FOREIGN KEY (`UserAccountID`) REFERENCES `UserAccount` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TelehealthUser`
--

LOCK TABLES `TelehealthUser` WRITE;
/*!40000 ALTER TABLE `TelehealthUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `TelehealthUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UrgentRequest`
--

DROP TABLE IF EXISTS `UrgentRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UrgentRequest` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `UserAccountID` bigint(20) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Gender` varchar(100) DEFAULT NULL,
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
  `Description` text,
  `Enable` varchar(1) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=372 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UrgentRequest`
--

LOCK TABLES `UrgentRequest` WRITE;
/*!40000 ALTER TABLE `UrgentRequest` DISABLE KEYS */;
INSERT INTO `UrgentRequest` VALUES (362,'2a787f6f-4aed-49ae-a237-0fb6cd425d55',NULL,'Le','Thanh','+61896356369',NULL,'Thanh@Gmail.com','1990-01-01 17:00:00','Hahah','::ffff:192.168.1.111','Y','HAN',NULL,'2015-09-24 06:46:35',1,5,NULL,NULL,'28:d2:44:65:6a:c4','Nshsnsn','1','confirmed','2015-09-24 06:46:35',NULL,'2015-09-24 06:57:50',NULL),(363,'cfc18e56-5e58-4e1d-a28b-b2d4714d5579',NULL,'11','111','1111','M','111',NULL,NULL,'192.168.1.1',NULL,NULL,NULL,'2015-09-24 07:08:37',1,5,NULL,NULL,'e0:3f:49:ae:cb:14',NULL,'1','confirmed','2015-09-24 07:08:37',NULL,'2015-09-24 07:23:02',NULL),(364,'fc375fd3-4916-45b1-8653-84c388ae90e2',NULL,'Hdjfj','Bchchchgjj','+61956868898',NULL,'Kdjdjdjdjd@mail.com','1990-01-01 17:00:00','Bdhdhdjffj','::ffff:192.168.1.19','Y','SPE',NULL,'2015-09-24 07:38:54',1,5,NULL,NULL,NULL,'Hdhfjfjcj','1','spending','2015-09-24 07:38:54',NULL,NULL,NULL),(365,'caa748cf-9433-4659-a5be-11e794161ad9',NULL,'Hfhfhh','Hfhfhfh','+61124346565',NULL,'Kfjdjdj@gmail.com','1990-01-01 17:00:00','Hdhfhfhf','192.168.1.1','Y','SPE',NULL,'2015-09-24 07:58:24',1,5,NULL,'UrgentCare','e0:3f:49:ae:cb:14','Hdhcjcjcj','1','confirmed','2015-09-24 07:58:24',NULL,'2015-09-24 07:58:57',NULL),(366,'1294da5b-7178-4f43-8565-7348f25968c0',NULL,'Hdjfjfh','Hfhfhfhfh','+61124346598',NULL,'Ndjfnfj@gmail.com','1990-01-01 17:00:00','Hxhdhfjcjf','192.168.1.1','Y','PHY',NULL,'2015-09-24 08:00:29',1,5,NULL,'UrgentCare','e0:3f:49:ae:cb:14','Hxjcjcjcj','1','confirmed','2015-09-24 08:00:29',NULL,'2015-09-24 08:02:06',NULL),(367,'a6dcb279-9a53-4796-a266-25129b67024d',NULL,'manh','duc','+061',NULL,'manh@yahoo.com','2015-09-23 17:00:00','123','::ffff:192.168.1.237','Y','PHY',NULL,'2015-09-24 08:03:53',1,5,NULL,'UrgentCare',NULL,' description','1','spending','2015-09-24 08:03:53',NULL,NULL,NULL),(368,'afed83b9-bbba-4d2c-874c-e857c0ce3008',NULL,'manh','duc','+061',NULL,'manh@yahoo.com','2015-09-23 17:00:00','123123123','192.168.1.1','Y','PHY',NULL,'2015-09-24 08:05:56',1,5,NULL,'UrgentCare',NULL,' description','1','spending','2015-09-24 08:05:56',NULL,NULL,NULL),(369,'5f49f60f-c0a8-44f7-bd44-2164501022ed',NULL,'Hjj','Ghh','+61123456789',NULL,'Kdkdjfh@gmail.com','1990-01-01 17:00:00','Jjdjfjfhfh','192.168.1.1','Y','SPE',NULL,'2015-09-24 08:17:20',1,5,NULL,'UrgentCare',NULL,'Hfhfh','1','spending','2015-09-24 08:17:20',NULL,NULL,NULL),(370,'3f2b2e69-2886-420d-a7c2-cbc36cec5c79',NULL,'manh','duc','+061',NULL,'manh@yahoo.com','2015-09-23 17:00:00','surburb','192.168.1.1','Y','PHY',NULL,'2015-09-24 08:17:34',1,5,NULL,'UrgentCare',NULL,' des','1','spending','2015-09-24 08:17:34',NULL,NULL,NULL),(371,'bd7ec4e3-b84c-492d-9c1a-14ac836f3376',NULL,'Hdhfjfj','Hdhfhfh','+61653295646',NULL,'Jdjfhch@phan.con','1990-01-01 17:00:00','Hdhfhfhfh','192.168.1.1','Y','PHY',NULL,'2015-09-24 08:18:18',1,5,NULL,'UrgentCare','28:d2:44:65:6a:c4','Hfjfjfj','1','confirmed','2015-09-24 08:18:18',NULL,'2015-09-25 02:10:39',NULL);
/*!40000 ALTER TABLE `UrgentRequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserAccount`
--

DROP TABLE IF EXISTS `UserAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserAccount` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `Password` varchar(256) NOT NULL,
  `PasswordSalt` varchar(256) DEFAULT NULL,
  `PasswordHashAlgorithm` varchar(256) DEFAULT NULL,
  `Activated` varchar(1) DEFAULT NULL,
  `Enable` varchar(1) DEFAULT NULL,
  `UserType` varchar(3) DEFAULT NULL,
  `Token` varchar(256) DEFAULT NULL,
  `TokenExpired` timestamp NULL DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UserName_UNIQUE` (`UserName`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `PhoneNumber_UNIQUE` (`PhoneNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserAccount`
--

LOCK TABLES `UserAccount` WRITE;
/*!40000 ALTER TABLE `UserAccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserAccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserActivation`
--

DROP TABLE IF EXISTS `UserActivation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserActivation` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserAccountID` bigint(20) NOT NULL,
  `VerificationCode` varchar(255) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL COMMENT 'IOS: IOS; Website: WEB; Android: ARD',
  `VerificationToken` varchar(255) DEFAULT NULL,
  `DiviceID` text,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CreatedBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_UserActivation_UserAccount1_idx` (`UserAccountID`),
  CONSTRAINT `fk_UserActivation_UserAccount1` FOREIGN KEY (`UserAccountID`) REFERENCES `UserAccount` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserActivation`
--

LOCK TABLES `UserActivation` WRITE;
/*!40000 ALTER TABLE `UserActivation` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserActivation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserFileUpload`
--

DROP TABLE IF EXISTS `UserFileUpload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserFileUpload` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserAccountID` bigint(20) NOT NULL,
  `FileUploadID` bigint(20) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CreationBy` bigint(20) DEFAULT NULL,
  `ModifiedDate` timestamp NULL DEFAULT NULL,
  `ModifiedBy` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_UserFileUpload_FileUpload1_idx` (`UserAccountID`),
  KEY `fk_UserFileUpload_FileUpload1_idx1` (`FileUploadID`),
  CONSTRAINT `fk_UserFileUpload_FileUpload1` FOREIGN KEY (`FileUploadID`) REFERENCES `FileUpload` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UserFileUpload_UserAccount1` FOREIGN KEY (`UserAccountID`) REFERENCES `UserAccount` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserFileUpload`
--

LOCK TABLES `UserFileUpload` WRITE;
/*!40000 ALTER TABLE `UserFileUpload` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserFileUpload` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-28 10:44:36
