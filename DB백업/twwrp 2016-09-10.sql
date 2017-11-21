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
-- Definition of table `ban`
--

DROP TABLE IF EXISTS `ban`;
CREATE TABLE `ban` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` text,
  `IP` text,
  `Type` text,
  `gA_Name` text,
  `reason` text,
  `Year` int(10) DEFAULT NULL,
  `Month` int(10) DEFAULT NULL,
  `Day` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ban`
--

/*!40000 ALTER TABLE `ban` DISABLE KEYS */;
/*!40000 ALTER TABLE `ban` ENABLE KEYS */;


--
-- Definition of table `country_vehicle`
--

DROP TABLE IF EXISTS `country_vehicle`;
CREATE TABLE `country_vehicle` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Create` int(11) DEFAULT NULL,
  `Number` int(11) DEFAULT NULL,
  `Country` int(11) DEFAULT NULL,
  `Health` float(10,5) DEFAULT NULL,
  `vLock` int(11) DEFAULT NULL,
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
  `Type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enter`
--

/*!40000 ALTER TABLE `enter` DISABLE KEYS */;
INSERT INTO `enter` (`ID`,`Number`,`Create`,`PosX`,`PosY`,`PosZ`,`InPosX`,`InPosY`,`InPosZ`,`Interior`,`VirtualWorld`,`SameInterior`,`InInterior`,`InVirtualWorld`,`pickupid`,`Name`,`InNotice`,`Type`) VALUES 
 (1,'0','1',-1285.28259,470.77655,7.18750,'401.158782','617.647705','1021.482849','0','0',NULL,'1','0','1239','러시아 내무반','','1'),
 (2,'1','1',153.67400,1845.03613,17.64062,'-201.745193','278.154296','1004.483276','0','0',NULL,'1','0','1239','미국 내무반','','1'),
 (3,'2','1',-212.50687,285.40176,1004.48328,'1760.082031','4036.547851','1.786399','1','0',NULL,'0','1','1239','미국 목욕탕','','2'),
 (5,'3','1',411.29633,624.92059,1021.48285,'1760.046020','4036.479980','1.786399','1','0',NULL,'0','2','1239','러시아 목욕탕','','2'),
 (6,'4','1',152.03079,1831.43896,17.64806,'1742.641357','4036.828857','1.786399','0','0',NULL,'0','1','1239','미국 목욕탕 뒷문','','2'),
 (7,'5','1',-1278.90552,470.86234,7.18750,'1742.604858','4036.828857','1.786399','0','0',NULL,'0','2','1239','러시아 목욕탕 뒷문','','2'),
 (8,'6','1',-1291.66357,470.89087,7.18750,'286.536590','-86.781349','1001.522888','0','0',NULL,'4','0','1239','러시아 무장소','','1'),
 (9,'7','1',172.01546,1834.86084,17.64062,'286.094238','-41.804191','1001.515625','0','0',NULL,'1','0','1239','미국 무장소','','1'),
 (10,'8','1',286.15491,-30.27269,1001.51562,'286.110961','-28.623001','1001.515625','1','0',NULL,'1','0','1239','미국 사격장','','3'),
 (11,'9','1',301.81271,-76.86456,1001.51562,'301.784667','-75.138702','1001.515625','4','0',NULL,'4','0','1239','러시아 사격장','','3');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gangzone`
--

/*!40000 ALTER TABLE `gangzone` DISABLE KEYS */;
INSERT INTO `gangzone` (`ID`,`Create`,`S_PosX`,`S_PosY`,`E_PosX`,`E_PosY`,`Number`,`Name`,`Color`) VALUES 
 (4,1,-33.13428,1650.40308,400.52362,2122.71826,0,'미국 갱존','0x292FFCAA'),
 (5,1,-1749.84619,231.42809,-1213.10535,526.06531,1,'러시아 갱존','0xFF0000AA'),
 (9,1,-363.92795,1009.19128,120.34776,1247.38123,2,'캉마을','0x5B5BFFFF');
/*!40000 ALTER TABLE `gangzone` ENABLE KEYS */;


--
-- Definition of table `occupy_area`
--

DROP TABLE IF EXISTS `occupy_area`;
CREATE TABLE `occupy_area` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Number` int(10) DEFAULT NULL,
  `Name` text,
  `Occupy` int(10) DEFAULT NULL,
  `Create` int(10) DEFAULT NULL,
  `Country` int(10) DEFAULT NULL,
  `PosX` float(10,5) DEFAULT NULL,
  `PosY` float(10,5) DEFAULT NULL,
  `PosZ` float(10,5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `occupy_area`
--

/*!40000 ALTER TABLE `occupy_area` DISABLE KEYS */;
INSERT INTO `occupy_area` (`ID`,`Number`,`Name`,`Occupy`,`Create`,`Country`,`PosX`,`PosY`,`PosZ`) VALUES 
 (1,0,'캉마을',0,1,1,-188.72241,1099.38818,19.60151);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `platoon`
--

/*!40000 ALTER TABLE `platoon` DISABLE KEYS */;
INSERT INTO `platoon` (`ID`,`Create`,`Country`,`Number`,`Name`,`_Number`,`Type`) VALUES 
 (11,1,1,1,'임시소대',1,1),
 (12,1,2,2,'임시소대',2,1);
/*!40000 ALTER TABLE `platoon` ENABLE KEYS */;


--
-- Definition of table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Create` int(10) DEFAULT NULL,
  `PosX` float(10,5) DEFAULT NULL,
  `PosY` float(10,5) DEFAULT NULL,
  `PosZ` float(10,5) DEFAULT NULL,
  `Number` int(10) DEFAULT NULL,
  `ObjectID` int(10) DEFAULT NULL,
  `Money` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`ID`,`Create`,`PosX`,`PosY`,`PosZ`,`Number`,`ObjectID`,`Money`) VALUES 
 (1,1,379.17087,589.19897,1021.47510,0,1580,1),
 (2,1,379.28296,592.06836,1021.47510,1,330,5),
 (3,1,379.70746,595.02808,1021.47510,2,2709,2),
 (4,1,379.71445,597.90228,1021.47510,3,2041,2),
 (5,1,379.40292,600.98938,1021.47510,4,1546,1),
 (6,1,397.99182,583.32446,1021.47510,5,1485,1),
 (7,1,-192.81850,268.87100,1004.48328,6,1485,1),
 (8,1,-180.50320,269.43460,1004.48328,7,1580,1),
 (9,1,-180.46962,266.29144,1004.48328,8,330,5),
 (10,1,-180.46991,263.28149,1004.48328,9,2709,3),
 (11,1,-180.42670,260.08093,1004.48328,10,2041,2),
 (12,1,-180.42986,257.06342,1004.48328,11,1546,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Definition of table `server_info`
--

DROP TABLE IF EXISTS `server_info`;
CREATE TABLE `server_info` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Number` int(5) DEFAULT NULL,
  `USA_Money` int(10) DEFAULT NULL,
  `Rusia_Money` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `server_info`
--

/*!40000 ALTER TABLE `server_info` DISABLE KEYS */;
INSERT INTO `server_info` (`ID`,`Number`,`USA_Money`,`Rusia_Money`) VALUES 
 (2,1,1004,1077);
/*!40000 ALTER TABLE `server_info` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pName` text,
  `pPassword` text,
  `pSex` int(10) DEFAULT NULL,
  `pCountry` int(10) DEFAULT NULL,
  `pAdmin` int(10) DEFAULT NULL,
  `pAdminName` text,
  `pTut` int(10) DEFAULT NULL,
  `pAge` int(10) DEFAULT NULL,
  `pInterior` int(10) DEFAULT NULL,
  `pVirtualWorld` int(10) DEFAULT NULL,
  `pPosX` float(10,5) DEFAULT NULL,
  `pPosY` float(10,5) DEFAULT NULL,
  `pPosZ` float(10,5) DEFAULT NULL,
  `pAngle` float(10,5) DEFAULT NULL,
  `pNPCQwest` int(10) DEFAULT NULL,
  `pPlatoon` int(10) DEFAULT NULL,
  `pCorps` int(10) DEFAULT NULL,
  `pClass` int(10) DEFAULT NULL,
  `pMoney` int(10) DEFAULT NULL,
  `pPlayHour` int(10) DEFAULT NULL,
  `pPlayMinute` int(10) DEFAULT NULL,
  `pPlaySecond` int(10) DEFAULT NULL,
  `pHealth` float(10,5) DEFAULT NULL,
  `pArmour` float(10,5) DEFAULT NULL,
  `pPlatoonLevel` int(10) DEFAULT NULL,
  `pMedal` int(10) DEFAULT NULL,
  `pPlatoonType` int(10) DEFAULT NULL,
  `pDeMorgan` int(10) DEFAULT NULL,
  `pDeMorganTimer` int(10) DEFAULT NULL,
  `pJail` int(10) DEFAULT NULL,
  `pJailTimer` int(10) DEFAULT NULL,
  `pWarning` int(10) DEFAULT NULL,
  `pIDBan` int(10) DEFAULT NULL,
  `pgIDBanName` text,
  `pIDBanDate_0` int(10) DEFAULT NULL,
  `pIDBanDate_1` int(10) DEFAULT NULL,
  `pIDBanDate_2` int(10) DEFAULT NULL,
  `pIDBanReason` text,
  `pChatBan` int(10) DEFAULT NULL,
  `pDie` int(10) DEFAULT NULL,
  `pDieTime` int(10) DEFAULT NULL,
  `pPhoneFrequency` int(10) DEFAULT NULL,
  `pClothes` int(10) DEFAULT NULL,
  `pI_ItemID_0` int(10) DEFAULT NULL,
  `pI_Number_0` int(10) DEFAULT NULL,
  `pI_ItemID_1` int(10) DEFAULT NULL,
  `pI_Number_1` int(10) DEFAULT NULL,
  `pI_ItemID_2` int(10) DEFAULT NULL,
  `pI_Number_2` int(10) DEFAULT NULL,
  `pI_ItemID_3` int(10) DEFAULT NULL,
  `pI_Number_3` int(10) DEFAULT NULL,
  `pI_ItemID_4` int(10) DEFAULT NULL,
  `pI_Number_4` int(10) DEFAULT NULL,
  `pI_ItemID_5` int(10) DEFAULT NULL,
  `pI_Number_5` int(10) DEFAULT NULL,
  `pI_ItemID_6` int(10) DEFAULT NULL,
  `pI_Number_6` int(10) DEFAULT NULL,
  `pI_ItemID_7` int(10) DEFAULT NULL,
  `pI_Number_7` int(10) DEFAULT NULL,
  `pI_ItemID_8` int(10) DEFAULT NULL,
  `pI_Number_8` int(10) DEFAULT NULL,
  `pI_ItemID_9` int(10) DEFAULT NULL,
  `pI_Number_9` int(10) DEFAULT NULL,
  `pI_ItemID_10` int(10) DEFAULT NULL,
  `pI_Number_10` int(10) DEFAULT NULL,
  `pI_ItemID_11` int(10) DEFAULT NULL,
  `pI_Number_11` int(10) DEFAULT NULL,
  `pI_ItemID_12` int(10) DEFAULT NULL,
  `pI_Number_12` int(10) DEFAULT NULL,
  `pI_ItemID_13` int(10) DEFAULT NULL,
  `pI_Number_13` int(10) DEFAULT NULL,
  `pI_ItemID_14` int(10) DEFAULT NULL,
  `pI_Number_14` int(10) DEFAULT NULL,
  `pI_ItemID_15` int(10) DEFAULT NULL,
  `pI_Number_15` int(10) DEFAULT NULL,
  `pI_ItemID_16` int(10) DEFAULT NULL,
  `pI_Number_16` int(10) DEFAULT NULL,
  `pI_ItemID_17` int(10) DEFAULT NULL,
  `pI_Number_17` int(10) DEFAULT NULL,
  `pI_ItemID_18` int(10) DEFAULT NULL,
  `pI_Number_18` int(10) DEFAULT NULL,
  `pI_ItemID_19` int(10) DEFAULT NULL,
  `pI_Number_19` int(10) DEFAULT NULL,
  `pI_ItemID_20` int(10) DEFAULT NULL,
  `pI_Number_20` int(10) DEFAULT NULL,
  `pI_ItemID_21` int(10) DEFAULT NULL,
  `pI_Number_21` int(10) DEFAULT NULL,
  `pI_ItemID_22` int(10) DEFAULT NULL,
  `pI_Number_22` int(10) DEFAULT NULL,
  `pI_ItemID_23` int(10) DEFAULT NULL,
  `pI_Number_23` int(10) DEFAULT NULL,
  `pI_ItemID_24` int(10) DEFAULT NULL,
  `pI_Number_24` int(10) DEFAULT NULL,
  `pI_ItemID_25` int(10) DEFAULT NULL,
  `pI_Number_25` int(10) DEFAULT NULL,
  `pI_ItemID_26` int(10) DEFAULT NULL,
  `pI_Number_26` int(10) DEFAULT NULL,
  `pI_ItemID_27` int(10) DEFAULT NULL,
  `pI_Number_27` int(10) DEFAULT NULL,
  `pI_ItemID_28` int(10) DEFAULT NULL,
  `pI_Number_28` int(10) DEFAULT NULL,
  `pI_ItemID_29` int(10) DEFAULT NULL,
  `pI_Number_29` int(10) DEFAULT NULL,
  `pI_ItemID_30` int(10) DEFAULT NULL,
  `pI_Number_30` int(10) DEFAULT NULL,
  `pI_ItemID_31` int(10) DEFAULT NULL,
  `pI_Number_31` int(10) DEFAULT NULL,
  `pI_ItemID_32` int(10) DEFAULT NULL,
  `pI_Number_32` int(10) DEFAULT NULL,
  `pI_ItemID_33` int(10) DEFAULT NULL,
  `pI_Number_33` int(10) DEFAULT NULL,
  `pI_ItemID_34` int(10) DEFAULT NULL,
  `pI_Number_34` int(10) DEFAULT NULL,
  `pI_ItemID_35` int(10) DEFAULT NULL,
  `pI_Number_35` int(10) DEFAULT NULL,
  `pI_ItemID_36` int(10) DEFAULT NULL,
  `pI_Number_36` int(10) DEFAULT NULL,
  `pI_ItemID_37` int(10) DEFAULT NULL,
  `pI_Number_37` int(10) DEFAULT NULL,
  `pI_ItemID_38` int(10) DEFAULT NULL,
  `pI_Number_38` int(10) DEFAULT NULL,
  `pI_ItemID_39` int(10) DEFAULT NULL,
  `pI_Number_39` int(10) DEFAULT NULL,
  `pI_ItemID_40` int(10) DEFAULT NULL,
  `pI_Number_40` int(10) DEFAULT NULL,
  `pI_ItemID_41` int(10) DEFAULT NULL,
  `pI_Number_41` int(10) DEFAULT NULL,
  `pI_ItemID_42` int(10) DEFAULT NULL,
  `pI_Number_42` int(10) DEFAULT NULL,
  `pI_ItemID_43` int(10) DEFAULT NULL,
  `pI_Number_43` int(10) DEFAULT NULL,
  `pI_ItemID_44` int(10) DEFAULT NULL,
  `pI_Number_44` int(10) DEFAULT NULL,
  `pI_ItemID_45` int(10) DEFAULT NULL,
  `pI_Number_45` int(10) DEFAULT NULL,
  `pI_ItemID_46` int(10) DEFAULT NULL,
  `pI_Number_46` int(10) DEFAULT NULL,
  `pI_ItemID_47` int(10) DEFAULT NULL,
  `pI_Number_47` int(10) DEFAULT NULL,
  `pI_ItemID_48` int(10) DEFAULT NULL,
  `pI_Number_48` int(10) DEFAULT NULL,
  `pI_ItemID_49` int(10) DEFAULT NULL,
  `pI_Number_49` int(10) DEFAULT NULL,
  `pWeaponID_0` int(10) DEFAULT NULL,
  `pAmmo_0` int(10) DEFAULT NULL,
  `pWeaponID_1` int(10) DEFAULT NULL,
  `pAmmo_1` int(10) DEFAULT NULL,
  `pWeaponID_2` int(10) DEFAULT NULL,
  `pAmmo_2` int(10) DEFAULT NULL,
  `pWeaponID_3` int(10) DEFAULT NULL,
  `pAmmo_3` int(10) DEFAULT NULL,
  `pWeaponID_4` int(10) DEFAULT NULL,
  `pAmmo_4` int(10) DEFAULT NULL,
  `pWeaponID_5` int(10) DEFAULT NULL,
  `pAmmo_5` int(10) DEFAULT NULL,
  `pWeaponID_6` int(10) DEFAULT NULL,
  `pAmmo_6` int(10) DEFAULT NULL,
  `pWeaponID_7` int(10) DEFAULT NULL,
  `pAmmo_7` int(10) DEFAULT NULL,
  `pWeaponID_8` int(10) DEFAULT NULL,
  `pAmmo_8` int(10) DEFAULT NULL,
  `pWeaponID_9` int(10) DEFAULT NULL,
  `pAmmo_9` int(10) DEFAULT NULL,
  `pWeaponID_10` int(10) DEFAULT NULL,
  `pAmmo_10` int(10) DEFAULT NULL,
  `pWeaponID_11` int(10) DEFAULT NULL,
  `pAmmo_11` int(10) DEFAULT NULL,
  `pWeaponID_12` int(10) DEFAULT NULL,
  `pAmmo_12` int(10) DEFAULT NULL,
  `pEnlistDate_0` int(10) DEFAULT NULL,
  `pEnlistDate_1` int(10) DEFAULT NULL,
  `pEnlistDate_2` int(10) DEFAULT NULL,
  `pSet_Spec` int(10) DEFAULT NULL,
  `pHungry` int(10) DEFAULT NULL,
  `pClean` int(10) DEFAULT NULL,
  `pDonation` int(10) DEFAULT NULL,
  `pPhoneNum` int(10) DEFAULT NULL,
  `pPraise` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`ID`,`pName`,`pPassword`,`pSex`,`pCountry`,`pAdmin`,`pAdminName`,`pTut`,`pAge`,`pInterior`,`pVirtualWorld`,`pPosX`,`pPosY`,`pPosZ`,`pAngle`,`pNPCQwest`,`pPlatoon`,`pCorps`,`pClass`,`pMoney`,`pPlayHour`,`pPlayMinute`,`pPlaySecond`,`pHealth`,`pArmour`,`pPlatoonLevel`,`pMedal`,`pPlatoonType`,`pDeMorgan`,`pDeMorganTimer`,`pJail`,`pJailTimer`,`pWarning`,`pIDBan`,`pgIDBanName`,`pIDBanDate_0`,`pIDBanDate_1`,`pIDBanDate_2`,`pIDBanReason`,`pChatBan`,`pDie`,`pDieTime`,`pPhoneFrequency`,`pClothes`,`pI_ItemID_0`,`pI_Number_0`,`pI_ItemID_1`,`pI_Number_1`,`pI_ItemID_2`,`pI_Number_2`,`pI_ItemID_3`,`pI_Number_3`,`pI_ItemID_4`,`pI_Number_4`,`pI_ItemID_5`,`pI_Number_5`,`pI_ItemID_6`,`pI_Number_6`,`pI_ItemID_7`,`pI_Number_7`,`pI_ItemID_8`,`pI_Number_8`,`pI_ItemID_9`,`pI_Number_9`,`pI_ItemID_10`,`pI_Number_10`,`pI_ItemID_11`,`pI_Number_11`,`pI_ItemID_12`,`pI_Number_12`,`pI_ItemID_13`,`pI_Number_13`,`pI_ItemID_14`,`pI_Number_14`,`pI_ItemID_15`,`pI_Number_15`,`pI_ItemID_16`,`pI_Number_16`,`pI_ItemID_17`,`pI_Number_17`,`pI_ItemID_18`,`pI_Number_18`,`pI_ItemID_19`,`pI_Number_19`,`pI_ItemID_20`,`pI_Number_20`,`pI_ItemID_21`,`pI_Number_21`,`pI_ItemID_22`,`pI_Number_22`,`pI_ItemID_23`,`pI_Number_23`,`pI_ItemID_24`,`pI_Number_24`,`pI_ItemID_25`,`pI_Number_25`,`pI_ItemID_26`,`pI_Number_26`,`pI_ItemID_27`,`pI_Number_27`,`pI_ItemID_28`,`pI_Number_28`,`pI_ItemID_29`,`pI_Number_29`,`pI_ItemID_30`,`pI_Number_30`,`pI_ItemID_31`,`pI_Number_31`,`pI_ItemID_32`,`pI_Number_32`,`pI_ItemID_33`,`pI_Number_33`,`pI_ItemID_34`,`pI_Number_34`,`pI_ItemID_35`,`pI_Number_35`,`pI_ItemID_36`,`pI_Number_36`,`pI_ItemID_37`,`pI_Number_37`,`pI_ItemID_38`,`pI_Number_38`,`pI_ItemID_39`,`pI_Number_39`,`pI_ItemID_40`,`pI_Number_40`,`pI_ItemID_41`,`pI_Number_41`,`pI_ItemID_42`,`pI_Number_42`,`pI_ItemID_43`,`pI_Number_43`,`pI_ItemID_44`,`pI_Number_44`,`pI_ItemID_45`,`pI_Number_45`,`pI_ItemID_46`,`pI_Number_46`,`pI_ItemID_47`,`pI_Number_47`,`pI_ItemID_48`,`pI_Number_48`,`pI_ItemID_49`,`pI_Number_49`,`pWeaponID_0`,`pAmmo_0`,`pWeaponID_1`,`pAmmo_1`,`pWeaponID_2`,`pAmmo_2`,`pWeaponID_3`,`pAmmo_3`,`pWeaponID_4`,`pAmmo_4`,`pWeaponID_5`,`pAmmo_5`,`pWeaponID_6`,`pAmmo_6`,`pWeaponID_7`,`pAmmo_7`,`pWeaponID_8`,`pAmmo_8`,`pWeaponID_9`,`pAmmo_9`,`pWeaponID_10`,`pAmmo_10`,`pWeaponID_11`,`pAmmo_11`,`pWeaponID_12`,`pAmmo_12`,`pEnlistDate_0`,`pEnlistDate_1`,`pEnlistDate_2`,`pSet_Spec`,`pHungry`,`pClean`,`pDonation`,`pPhoneNum`,`pPraise`) VALUES 
 (42,'Hojin_Kim','228760acec1189e2a7c9d95ba61c97685a04adc10e5e309431d9b12602b6fad304901df06040f20e373abc218cdfe952697d774b2d804d63b9fcd154eb6874a',1,1,5,'모드메이커',2,20,0,0,226.72466,1890.35034,17.64062,179.35532,9,1,1,1,4,3,1,12,100.00000,100.00000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,27,2,28,1215752279,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (43,'Solomon_MacKenzie','a688f2ec759aee5316ba76271a715a4ace7258d1dc3eda18a7b4c283bf229652b0581050fadecbbce9572ba933501666e600207c5273689ab390a12b6cfae09',1,1,0,'None',2,24,0,0,80.80750,1934.16846,17.64062,185.38199,9,1,1,0,0,0,16,5,100.00000,100.00000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,285,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,164,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (44,'Ogloc_Dylan','7a267e4d561600e1293d8d37262a3ca66f750173e11a464322da92ce6556339f4c817fc94beb2c52749be8025a70e5fc4ab111f422fa38f1dd98771ecd3c74e',1,2,0,'None',2,24,0,0,-1291.69397,472.74274,11.72095,274.51746,9,2,1,0,0,0,16,10,100.00000,95.05000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,287,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,30,238,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (45,'Samuel_Columbus','597e5e5fb0ba8f07325817ad342b7189394e32fee1b27368c300f56f9602a30a5b6b8d481b1704b4a486e52295969ec33d9c165621322bd6e06cae5129e7d98',1,1,0,'None',2,19,0,0,90.43087,1920.09668,17.94929,215.86525,9,1,1,0,0,0,16,28,100.00000,100.00000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,285,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (46,'Stephen_Calloway','5bca2213c46cd0f16a5b647108f523ec6de9f539b3c7d8b9cf0e4e768c7736e2e87de896adf3f1a723ce842c2ec3879b32fd60c50ee41d4883e2b15e48b2187',1,1,0,'None',2,23,0,0,87.69431,1921.47803,17.86012,76.97893,9,1,1,0,0,0,19,53,100.00000,100.00000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,285,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,244,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (47,'Beulradimir_Kush','a64930a8b32e80ea216551f2d6903e0d6983dc1b0664fc53354a2db493a72d9b59703a9c3e002ddcd288fcb6cc8000293bc786f6abe95487a362ae9570bce26',1,2,0,'None',2,19,0,0,-1289.44543,447.08679,11.21858,0.99995,9,2,1,0,0,0,22,33,10.00000,0.00000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,2,199,0,287,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (48,'Donald_Rumsfeld','9fea4b83a10f11dc1c894138c9b6437dc9071020c275b151992cd71137c1affae68cda93f0ec60ea344f5f644827fbd5e4b162d78e7f8e622bbc83af6a86fdd',1,1,0,'None',2,27,0,0,214.96716,1886.62231,14.45173,49.53346,9,1,1,0,0,0,7,1,100.00000,95.05000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,285,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,246,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (49,'Ko_Ala','b70af3b71f4a2af14d72b91ec68f5bcb959affb454d039d255e444fd53ceb5589fc5507d3062b3c835f8004e36750a52d0282ec41dcf93c5e6c562f18bcc128',1,2,0,'None',2,20,0,0,-1282.47339,464.46768,7.18092,110.45544,9,2,3,0,0,0,6,24,100.00000,100.00000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,287,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,30,236,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (50,'Kakashi_Hatake','5743f9a25f3daa666e98c754e0c85d62d287a2ae8ac3044cc120d039383404bc86a4acc313ce0f78a26c643cbcd03115c7d6c456d2e8ca318b68b38896766d',1,2,0,'None',2,19,0,0,-1330.06445,536.97302,43.61211,269.99997,9,2,1,0,0,0,13,7,30.00000,0.10000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,287,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (51,'Tww_GM','e1fa637d4093ac95cdc0401bc4f152ba7f56274f4b48c85b134b486f687c07d288d6744471300037fa80e9e3d463d8b8f6d772c3c6f859cdb152d4caf75fe51',1,2,3,'닭',2,23,0,0,165.12410,2164.16699,21.67126,88.73070,9,2,3,0,0,0,41,32,16.40000,0.00000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (52,'Scott_Randlebury','5bca2213c46cd0f16a5b647108f523ec6de9f539b3c7d8b9cf0e4e768c7736e2e87de896adf3f1a723ce842c2ec3879b32fd60c50ee41d4883e2b15e48b2187',1,1,0,'None',2,27,0,0,90.58625,1922.05542,17.94802,323.73990,9,1,1,0,0,0,19,11,100.00000,100.00000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,285,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,240,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (53,'Tww_AdminTeam','854e382fc273921a75bbcae909881870a28ab3f32e98e2807e599fc925fa02dd22f8c4aa9ce1d9a250241652da3d4164bae63f77f7aaaed176386a7627a7821',1,2,3,'Navy',2,23,0,0,131.58533,-68.37687,1.57812,132.70346,9,2,3,0,0,0,11,56,95.05000,0.00000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (54,'Akiten_Rindburk','9dcae67c7fe5f3465322c275730b7d718bc8d9f598ac1ec8f5c0406add9fe77bf6fcce89e56f3b37f99368d7c26be27d67c0576c05d45a971b8dec39c9127f8',1,1,3,'벛꽃',2,32,0,0,-1297.60718,475.69458,10.72095,270.00000,9,1,1,0,0,0,10,35,37.44794,0.00000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,285,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (55,'Jostph_Campbell','1a177e6a0099bdb0c56b491159fb809bdc3ebe16196a679ee36bb76b54a4aa53145efb9963a5c0ad450df3619c14f1da9fd1a0b3c9e5c063240bffdada51f23',1,1,0,'None',2,25,1,0,-1420.83911,2102.55835,63.84721,0.99995,9,1,1,0,0,0,10,57,100.00000,100.00000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,285,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (56,'Felix_Baumgartner','d404559f602eab6fd602ac7680dacbfaadd13630335e951f97af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db',1,1,0,'None',2,24,0,0,352.28183,2316.08496,71.01096,180.99535,9,1,1,0,0,0,9,31,100.00000,100.00000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,285,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (57,'Soap_Aventador','f34c4110b96f13b92bcf4f62e19b507c88b571cabb47632a19880b631e3e0c82bf45b8cc0398815c67bbe3f7c16b37bd364f4b3dfe9388cd2d67a01a6861e5',1,2,0,'None',2,35,0,0,-1312.53125,475.84766,10.68988,81.20667,9,2,1,0,0,0,7,36,100.00000,70.05000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,287,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,30,188,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (58,'Clayton','d404559f602eab6fd602ac7680dacbfaadd13630335e951f97af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db',1,0,0,'None',0,23,0,0,0.00000,0.00000,0.00000,0.00000,0,0,0,0,0,0,0,0,50.00000,0.00000,0,0,0,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
 (59,'Boruto_Uzumaki','6ca6b22a714a1adebe8643ae607387ca950fe566739706286edc13b3f17d935cbdda36669f818714d7ac45545e323ecd8626c4c5e4856bdaceba2b741cc6d82',1,2,0,'None',2,22,0,0,286.53659,-86.78135,1001.52289,240.39044,9,2,1,0,0,0,8,11,100.00000,100.00000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,287,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,30,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (60,'Neville_Kharlos','8278cce6cb6843dbbb62b103408f36d06ecb1fc96f39a06ba606e3cfa5bae3fc11822cfa16f4aeb37a2549ed5ee7bac87daa1692e05fb4660b14e8e29505a41',1,1,0,'None',2,28,0,0,202.75752,1862.41333,20.15206,230.64729,9,1,2,0,0,0,25,4,100.00000,95.05000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,285,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,248,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (61,'Clayton_Saintsbury','d404559f602eab6fd602ac7680dacbfaadd13630335e951f97af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db',1,1,0,'None',2,22,0,0,82.25515,1918.61182,20.76901,80.51608,9,1,1,0,0,0,10,15,100.00000,100.00000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,285,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,244,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (62,'Mike_Lee','b2a9fa32acca335b6d7df23a0fa013897b0098c01590c79afd5e2246603d1ffacf5a82ae8e003378940baa4cdd06efa582d92b592c76748a32508ae777d8a4',1,1,0,'None',2,28,0,0,111.00678,1901.80005,18.58456,54.84547,9,1,2,0,0,0,7,13,100.00000,100.00000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,285,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (63,'Edward_Kenway','1ecbcdfca93d8d62398f8b999f1ca0a6b48e111a6bf3ce5e87c6cb798b03185267b4b1a37f80c5bc4f8457ca3d4096d45564c12d02c2b88afc4d556d00c713a',1,1,0,'None',2,19,0,0,-19.91578,1844.93823,17.81161,269.14249,9,1,2,0,0,0,7,7,10.00000,0.10000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,2,164,0,285,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (64,'Guy_Might','8deac85b0290ba8f1fc36020feada1f25f8a5af32c079d2291962bf23289b77942d203a7b231f059a5198b9dbf8b27ec921000b37d3aec3369508c58e212db',1,2,0,'None',2,22,0,0,-1324.30676,470.92490,7.18750,0.99995,9,2,1,0,0,0,7,10,10.00000,0.10000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,2,245,0,287,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (65,'Make_Evan','b07553ffeb2a7ea7e1939d74953f5a9dbf016d1f2f2da8e6391cc8d934174042ce745d8ccd2e6049f08f56e99dce79464e8ded1b37c9c6724bfe5fc3634217f',1,1,0,'None',2,24,0,0,84.72478,1924.51392,17.77440,161.41832,9,1,2,0,0,0,6,14,100.00000,100.00000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,285,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (66,'Koala_McAngus','b70af3b71f4a2af14d72b91ec68f5bcb959affb454d039d255e444fd53ceb5589fc5507d3062b3c835f8004e36750a52d0282ec41dcf93c5e6c562f18bcc128',1,2,0,'None',2,20,0,0,-1309.73633,436.21002,7.18750,0.99995,9,2,3,0,0,0,6,7,10.00000,0.43000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,2,255,0,287,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (67,'Ace_Voss_Roux','3ffdb04bc5d544b2125b7052ecc718afebc78f34a598500fa96431acf482fa5e2c0b604d8db458c547b54f576cc5bda69b468f96263c90d5ddb10299203524a',1,2,0,'None',2,25,0,0,-1308.82922,463.02402,7.18750,190.84605,9,2,1,0,0,0,5,12,100.00000,90.10000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,287,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,30,240,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (68,'B_Cup','adf85dcd201ea9f087d59e1ccbfb4c066bac86999822b2be4c1f043978d0f4944e12940871225d56610246565cd7fbc8f76ff3a252219555f3a45cacf4ace61',2,2,0,'None',1,22,1,0,1212.65125,-262.12000,1021.79932,0.00000,0,0,0,0,0,0,0,0,50.00000,0.00000,0,0,0,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,85,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
 (69,'Jason_Cup','adf85dcd201ea9f087d59e1ccbfb4c066bac86999822b2be4c1f043978d0f4944e12940871225d56610246565cd7fbc8f76ff3a252219555f3a45cacf4ace61',2,2,0,'None',2,22,0,0,-1299.79346,461.87000,7.18750,170.41353,9,2,1,0,0,0,1,54,100.00000,90.10000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,85,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,30,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (70,'Trauma_Banks','d404559f602eab6fd602ac7680dacbfaadd13630335e951f97af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db',1,1,0,'None',2,21,1,0,-228.03236,284.71045,1005.26544,38.45674,9,0,1,0,0,0,2,54,50.00000,0.00000,0,0,0,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (71,'Atder_Yu','e023517dd9e2e25b924f1013d9fadcddc71e05d3217988d9c018f2a682b7513fdd0803dcf036ecc5144480ec61d574b7c9299b122cf7f3dd78e8b9e79ac7fb4',1,2,0,'None',2,29,0,0,-1337.30627,453.81226,30.72247,342.13046,9,2,2,0,0,0,5,31,45.05000,0.00000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,287,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,30,226,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (72,'James_Adrian','9f65b0093629e837a03b2c7d4375e3228d4160b049bac078fe34de0844394c9ed4c56a5f0529999332f1b482c8c1d8ea000bb674a93ac0dc276473b577a34a5',1,1,0,'None',2,31,0,0,88.67114,1919.92737,17.89254,88.41256,9,1,2,0,0,0,5,21,100.00000,100.00000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,285,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (73,'Frisk_Hecox','6f3f6a7fab79cd223d4ce7a17a409fd4ed88b6213cf3eb38e31db5d00ff2618e90043d81a74b0ec9abe2ef91c40fd93c54e3ae87424fb0a5946ad05da5a1263',1,2,0,'None',2,22,0,0,-1341.16602,497.92212,11.19531,79.93733,9,0,1,0,0,0,1,47,50.00000,0.00000,0,0,0,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (74,'Chris_Voss_Roux','602ae77134b55e96317593641ad0ce2f2fb28dc58901ea5a1cb78818bbe4bb7787399fc2ff3adcf6f7f3df9d0b83525e53ea3c3e9bbdd5062094c15c215a3d0',1,2,0,'None',2,20,0,0,-1283.59180,468.80804,7.18092,35.37555,9,0,1,0,0,0,0,46,50.00000,0.00000,0,0,0,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (75,'Jonathan_McCauley','47b04c58b7a4a53fad467c282b9853f9540964c995cfa50dd46c79aa1fae9bd2bdf88d756607a6235970a4d604ac61bb0432f5c98ab18cd6b18bc0623acc1f0',1,1,0,'None',2,26,0,0,104.12331,1934.83728,18.45973,350.39902,9,0,1,0,0,0,2,4,50.00000,0.00000,0,0,0,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,17,0,50,50,0,0,0),
 (76,'Tww_Max','a7659f749fc31360a8c3313d60203efbe1232671fc94b7afd7ff79c7a8dd3802a1ebbeb348cba1134296efa0e6ce9085d9a6a4528decaa80d8e4bd2d500d10e',1,1,5,'MAX',2,33,1,0,-223.30209,281.76434,1004.48328,335.08191,9,1,3,0,10,0,29,50,19.05000,0.00000,1,0,1,0,0,0,0,0,0,'',0,0,0,'',0,0,0,0,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,9,18,0,50,50,0,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `vehiclestartup`
--

DROP TABLE IF EXISTS `vehiclestartup`;
CREATE TABLE `vehiclestartup` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ModelID` int(10) DEFAULT NULL,
  `Create` int(10) DEFAULT NULL,
  `Platoon_0` int(10) DEFAULT NULL,
  `Platoon_1` int(10) DEFAULT NULL,
  `Platoon_2` int(10) DEFAULT NULL,
  `Platoon_3` int(10) DEFAULT NULL,
  `Platoon_4` int(10) DEFAULT NULL,
  `Class` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vehiclestartup`
--

/*!40000 ALTER TABLE `vehiclestartup` DISABLE KEYS */;
INSERT INTO `vehiclestartup` (`ID`,`ModelID`,`Create`,`Platoon_0`,`Platoon_1`,`Platoon_2`,`Platoon_3`,`Platoon_4`,`Class`) VALUES 
 (1,6,1,1,0,0,0,0,-1),
 (2,470,1,1,0,0,0,0,-1);
/*!40000 ALTER TABLE `vehiclestartup` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
