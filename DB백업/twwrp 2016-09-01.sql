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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pPassword` text,
  `pName` text,
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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`ID`,`pPassword`,`pName`,`pSex`,`pCountry`,`pAdmin`,`pAdminName`,`pTut`,`pAge`,`pInterior`,`pVirtualWorld`,`pPosX`,`pPosY`,`pPosZ`,`pAngle`,`pNPCQwest`,`pPlatoon`,`pCorps`,`pClass`,`pMoney`,`pPlayHour`,`pPlayMinute`,`pPlaySecond`,`pHealth`,`pArmour`,`pPlatoonLevel`,`pMedal`,`pPlatoonType`,`pDeMorgan`,`pDeMorganTimer`,`pJail`,`pJailTimer`,`pWarning`,`pIDBan`,`pgIDBanName`,`pIDBanDate_0`,`pIDBanDate_1`,`pIDBanDate_2`,`pIDBanReason`,`pChatBan`,`pDie`,`pDieTime`,`pPhoneFrequency`,`pClothes`,`pI_ItemID_0`,`pI_Number_0`,`pI_ItemID_1`,`pI_Number_1`,`pI_ItemID_2`,`pI_Number_2`,`pI_ItemID_3`,`pI_Number_3`,`pI_ItemID_4`,`pI_Number_4`,`pI_ItemID_5`,`pI_Number_5`,`pI_ItemID_6`,`pI_Number_6`,`pI_ItemID_7`,`pI_Number_7`,`pI_ItemID_8`,`pI_Number_8`,`pI_ItemID_9`,`pI_Number_9`,`pI_ItemID_10`,`pI_Number_10`,`pI_ItemID_11`,`pI_Number_11`,`pI_ItemID_12`,`pI_Number_12`,`pI_ItemID_13`,`pI_Number_13`,`pI_ItemID_14`,`pI_Number_14`,`pI_ItemID_15`,`pI_Number_15`,`pI_ItemID_16`,`pI_Number_16`,`pI_ItemID_17`,`pI_Number_17`,`pI_ItemID_18`,`pI_Number_18`,`pI_ItemID_19`,`pI_Number_19`,`pI_ItemID_20`,`pI_Number_20`,`pI_ItemID_21`,`pI_Number_21`,`pI_ItemID_22`,`pI_Number_22`,`pI_ItemID_23`,`pI_Number_23`,`pI_ItemID_24`,`pI_Number_24`,`pI_ItemID_25`,`pI_Number_25`,`pI_ItemID_26`,`pI_Number_26`,`pI_ItemID_27`,`pI_Number_27`,`pI_ItemID_28`,`pI_Number_28`,`pI_ItemID_29`,`pI_Number_29`,`pI_ItemID_30`,`pI_Number_30`,`pI_ItemID_31`,`pI_Number_31`,`pI_ItemID_32`,`pI_Number_32`,`pI_ItemID_33`,`pI_Number_33`,`pI_ItemID_34`,`pI_Number_34`,`pI_ItemID_35`,`pI_Number_35`,`pI_ItemID_36`,`pI_Number_36`,`pI_ItemID_37`,`pI_Number_37`,`pI_ItemID_38`,`pI_Number_38`,`pI_ItemID_39`,`pI_Number_39`,`pI_ItemID_40`,`pI_Number_40`,`pI_ItemID_41`,`pI_Number_41`,`pI_ItemID_42`,`pI_Number_42`,`pI_ItemID_43`,`pI_Number_43`,`pI_ItemID_44`,`pI_Number_44`,`pI_ItemID_45`,`pI_Number_45`,`pI_ItemID_46`,`pI_Number_46`,`pI_ItemID_47`,`pI_Number_47`,`pI_ItemID_48`,`pI_Number_48`,`pI_ItemID_49`,`pI_Number_49`,`pWeaponID_0`,`pAmmo_0`,`pWeaponID_1`,`pAmmo_1`,`pWeaponID_2`,`pAmmo_2`,`pWeaponID_3`,`pAmmo_3`,`pWeaponID_4`,`pAmmo_4`,`pWeaponID_5`,`pAmmo_5`,`pWeaponID_6`,`pAmmo_6`,`pWeaponID_7`,`pAmmo_7`,`pWeaponID_8`,`pAmmo_8`,`pWeaponID_9`,`pAmmo_9`,`pWeaponID_10`,`pAmmo_10`,`pWeaponID_11`,`pAmmo_11`,`pWeaponID_12`,`pAmmo_12`,`pEnlistDate_0`,`pEnlistDate_1`,`pEnlistDate_2`) VALUES 
 (1,'cef14aa7838e07352bea0eda77d6dd11','Hojin_Kim',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
