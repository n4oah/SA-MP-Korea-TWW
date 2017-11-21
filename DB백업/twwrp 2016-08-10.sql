-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.14-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema twwrp
--

CREATE DATABASE IF NOT EXISTS twwrp;
USE twwrp;

--
-- Definition of table `country_vehicle`
--

DROP TABLE IF EXISTS `country_vehicle`;
CREATE TABLE `country_vehicle` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Create` int(11) DEFAULT NULL,
  `Number` int(11) DEFAULT NULL,
  `Country` int(11) DEFAULT NULL,
  `Color1` int(11) DEFAULT NULL,
  `Color2` int(11) DEFAULT NULL,
  `ModelID` int(11) DEFAULT NULL,
  `PosX` float(10,5) DEFAULT NULL,
  `PosY` float(10,5) DEFAULT NULL,
  `PosZ` float(10,5) DEFAULT NULL,
  `Angle` float(10,5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country_vehicle`
--

/*!40000 ALTER TABLE `country_vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_vehicle` ENABLE KEYS */;


--
-- Definition of table `enter`
--

DROP TABLE IF EXISTS `enter`;
CREATE TABLE `enter` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Number` varchar(45) DEFAULT NULL,
  `Create` varchar(45) DEFAULT NULL,
  `PosX` float(10,5) DEFAULT NULL,
  `PosY` float(10,5) DEFAULT NULL,
  `PosZ` float(10,5) DEFAULT NULL,
  `InPosX` varchar(45) DEFAULT NULL,
  `InPosY` varchar(45) DEFAULT NULL,
  `InPosZ` varchar(45) DEFAULT NULL,
  `Interior` varchar(45) DEFAULT NULL,
  `VirtualWorld` varchar(45) DEFAULT NULL,
  `SameInterior` varchar(45) DEFAULT NULL,
  `InInterior` varchar(45) DEFAULT NULL,
  `InVirtualWorld` varchar(45) DEFAULT NULL,
  `pickupid` varchar(45) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `InNotice` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enter`
--

/*!40000 ALTER TABLE `enter` DISABLE KEYS */;
INSERT INTO `enter` (`ID`,`Number`,`Create`,`PosX`,`PosY`,`PosZ`,`InPosX`,`InPosY`,`InPosZ`,`Interior`,`VirtualWorld`,`SameInterior`,`InInterior`,`InVirtualWorld`,`pickupid`,`Name`,`InNotice`) VALUES 
 (1,'0','1',-1285.28259,470.77655,7.18750,'401.158782','617.647705','1021.482849','0','0',NULL,'1','0','1239','러시아 내무반',''),
 (2,'1','1',153.67400,1845.03613,17.64062,'-201.745193','278.154296','1004.483276','0','0',NULL,'1','0','1239','미국 내무반',''),
 (3,'2','1',-212.50687,285.40176,1004.48328,'1760.082031','4036.547851','1.786399','1','0',NULL,'0','1','1239','미국 목욕탕',''),
 (5,'3','1',411.29633,624.92059,1021.48285,'1760.046020','4036.479980','1.786399','1','0',NULL,'0','2','1239','러시아 목욕탕','');
/*!40000 ALTER TABLE `enter` ENABLE KEYS */;


--
-- Definition of table `gangzone`
--

DROP TABLE IF EXISTS `gangzone`;
CREATE TABLE `gangzone` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Create` int(11) DEFAULT NULL,
  `S_PosX` float(10,5) DEFAULT NULL,
  `S_PosY` float(10,5) DEFAULT NULL,
  `E_PosX` float(10,5) DEFAULT NULL,
  `E_PosY` float(10,5) DEFAULT NULL,
  `Number` int(11) DEFAULT NULL,
  `Name` text,
  `Color` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gangzone`
--

/*!40000 ALTER TABLE `gangzone` DISABLE KEYS */;
INSERT INTO `gangzone` (`ID`,`Create`,`S_PosX`,`S_PosY`,`E_PosX`,`E_PosY`,`Number`,`Name`,`Color`) VALUES 
 (4,1,-33.13428,1650.40308,400.52362,2122.71826,0,'미국 갱존','0x292FFCAA'),
 (5,1,-1749.84619,231.42809,-1213.10535,526.06531,1,'러시아 갱존','0xFF0000AA');
/*!40000 ALTER TABLE `gangzone` ENABLE KEYS */;


--
-- Definition of table `occupy_area`
--

DROP TABLE IF EXISTS `occupy_area`;
CREATE TABLE `occupy_area` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Number` varchar(45) DEFAULT NULL,
  `Name` text,
  `Create` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `PosX` float(10,5) DEFAULT NULL,
  `PosY` float(10,5) DEFAULT NULL,
  `PosZ` float(10,5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `occupy_area`
--

/*!40000 ALTER TABLE `occupy_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `occupy_area` ENABLE KEYS */;


--
-- Definition of table `platoon`
--

DROP TABLE IF EXISTS `platoon`;
CREATE TABLE `platoon` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Create` int(11) DEFAULT NULL,
  `Country` int(11) DEFAULT NULL,
  `Number` int(11) DEFAULT NULL,
  `Name` text,
  `_Number` int(11) DEFAULT NULL,
  `Type` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `platoon`
--

/*!40000 ALTER TABLE `platoon` DISABLE KEYS */;
/*!40000 ALTER TABLE `platoon` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Sex` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `Admin` varchar(45) DEFAULT NULL,
  `AdminName` varchar(45) DEFAULT NULL,
  `Tut` varchar(45) DEFAULT NULL,
  `pAge` varchar(45) DEFAULT NULL,
  `pInterior` varchar(45) DEFAULT NULL,
  `pVirtualWorld` varchar(45) DEFAULT NULL,
  `pPosX` varchar(45) DEFAULT NULL,
  `pPosY` varchar(45) DEFAULT NULL,
  `pPosZ` varchar(45) DEFAULT NULL,
  `pAngle` varchar(45) DEFAULT NULL,
  `pNPCQwest` varchar(45) DEFAULT NULL,
  `pPlatoon` varchar(45) DEFAULT NULL,
  `pCorps` varchar(45) DEFAULT NULL,
  `pClass` varchar(45) DEFAULT NULL,
  `pMoney` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`ID`,`Name`,`Password`,`Sex`,`Country`,`Admin`,`AdminName`,`Tut`,`pAge`,`pInterior`,`pVirtualWorld`,`pPosX`,`pPosY`,`pPosZ`,`pAngle`,`pNPCQwest`,`pPlatoon`,`pCorps`,`pClass`,`pMoney`) VALUES 
 (15,'Hojin_Kim','cef14aa7838e07352bea0eda77d6dd11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (16,'[RS]AWAL_','11ddbaf3386aea1f2974eee984542152',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (17,'Yeongjin_Choi','11ddbaf3386aea1f2974eee984542152',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
