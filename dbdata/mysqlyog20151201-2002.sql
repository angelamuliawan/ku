/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.6.26 : Database - baz
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`baz` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `baz`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) DEFAULT NULL,
  `DegreeID` int(11) DEFAULT NULL,
  `AuditedUser` varchar(20) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`CategoryID`,`CategoryName`,`DegreeID`,`AuditedUser`,`AuditedActivity`,`AuditedTime`) values (1,'Biologi',1,'Angela','A','2015-11-30 22:40:24'),(2,'Fisika',1,'Angela','A','2015-12-01 15:41:38');

/*Table structure for table `degree` */

DROP TABLE IF EXISTS `degree`;

CREATE TABLE `degree` (
  `DegreeID` int(11) NOT NULL AUTO_INCREMENT,
  `DegreeName` varchar(50) DEFAULT NULL,
  `AuditedUser` varchar(20) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`DegreeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `degree` */

insert  into `degree`(`DegreeID`,`DegreeName`,`AuditedUser`,`AuditedActivity`,`AuditedTime`) values (1,'SMA','Angela','A','2015-11-30 14:24:28');

/*Table structure for table `level` */

DROP TABLE IF EXISTS `level`;

CREATE TABLE `level` (
  `LevelID` int(11) NOT NULL AUTO_INCREMENT,
  `LevelName` varchar(50) DEFAULT NULL,
  `AuditedUser` varchar(20) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`LevelID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `level` */

insert  into `level`(`LevelID`,`LevelName`,`AuditedUser`,`AuditedActivity`,`AuditedTime`) values (1,'Easy','Angela','A','2015-11-30 14:25:48');

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `TestID` int(11) NOT NULL AUTO_INCREMENT,
  `TestName` varchar(30) DEFAULT NULL,
  `TestDescription` varchar(100) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `LevelID` int(11) DEFAULT NULL,
  `AccessType` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `PublishStartDate` datetime DEFAULT NULL,
  `PublishEndDate` datetime DEFAULT NULL,
  `AuditedUser` varchar(20) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`TestID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `test` */

insert  into `test`(`TestID`,`TestName`,`TestDescription`,`CategoryID`,`LevelID`,`AccessType`,`UserID`,`PublishStartDate`,`PublishEndDate`,`AuditedUser`,`AuditedActivity`,`AuditedTime`) values (1,'Test Mid','Ya gitu deh',1,1,1,1,'2015-11-30 13:37:50','2015-11-30 13:37:50','Amgela','A','2015-12-01 19:47:52');

/*Table structure for table `testdetail` */

DROP TABLE IF EXISTS `testdetail`;

CREATE TABLE `testdetail` (
  `TestDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `TestQuestion` varchar(200) DEFAULT NULL,
  `TestURL` varchar(100) DEFAULT NULL,
  `TestID` int(11) DEFAULT NULL,
  `AuditedUser` varchar(20) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`TestDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `testdetail` */

/*Table structure for table `testdetailanswer` */

DROP TABLE IF EXISTS `testdetailanswer`;

CREATE TABLE `testdetailanswer` (
  `TestDetailAnswerID` int(11) NOT NULL AUTO_INCREMENT,
  `TestDetailAnswerName` varchar(100) DEFAULT NULL,
  `TestDetailAnswerURL` varchar(100) DEFAULT NULL,
  `isAnswer` int(11) DEFAULT NULL,
  `TestDetailID` int(11) DEFAULT NULL,
  `AuditedUser` varchar(20) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`TestDetailAnswerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `testdetailanswer` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(20) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `UserPhoto` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `UserType` varchar(10) DEFAULT NULL,
  `Role` varchar(10) DEFAULT NULL,
  `AuditedUser` varchar(20) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`UserID`,`UserName`,`FullName`,`UserPhoto`,`Password`,`Email`,`UserType`,`Role`,`AuditedUser`,`AuditedActivity`,`AuditedTime`) values (1,'admin','Administrator','admin.jpg','d033e22ae348aeb5660fc2140aec35850c4da997','admin@kertasujian.com','individu','1','Angela','A','2015-11-30 13:37:50'),(2,'alexandrobrian','Brian Alexandro','alexandrobrian.jpg','d033e22ae348aeb5660fc2140aec35850c4da997','alexandrobrian15@gmail.com','individu','0',NULL,'A','2015-11-30 13:39:23'),(3,'Angela','Angela Muliawan','angela.jpg','d033e22ae348aeb5660fc2140aec35850c4da997','amuliawan93@gmail.com','individu','1','Angela','A','2015-11-30 14:31:48');

/*Table structure for table `useranswer` */

DROP TABLE IF EXISTS `useranswer`;

CREATE TABLE `useranswer` (
  `UserAnswerID` int(11) NOT NULL AUTO_INCREMENT,
  `TestID` int(11) DEFAULT NULL,
  `isInvited` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `UserEmail` varchar(100) DEFAULT NULL,
  `AuditedUser` varchar(20) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`UserAnswerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `useranswer` */

/*Table structure for table `useranswerdetail` */

DROP TABLE IF EXISTS `useranswerdetail`;

CREATE TABLE `useranswerdetail` (
  `UserAnswerDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `UserAnswerID` int(11) DEFAULT NULL,
  `TestDetailID` int(11) DEFAULT NULL,
  `TestDetailAnswerID` int(11) DEFAULT NULL,
  `AuditedUser` varchar(20) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`UserAnswerDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `useranswerdetail` */

/* Procedure structure for procedure `ChangePassword` */

/*!50003 DROP PROCEDURE IF EXISTS  `ChangePassword` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ChangePassword`(
	IN Paramuserid int,
	IN ParamPassword varchar(100),
	IN ParamNewPassword varchar(100),
	IN ParamAuditedUser varchar(20)
)
BEGIN
	 UPDATE `User`
	 SET Password=ParamNewPassword, AuditedUser = ParamAuditedUser,
		AuditedActivity = 'E', AuditedTime = CURRENT_TIMESTAMP()
	 WHERE 
		UserID = Paramuserid
		AND
		`Password`=ParamNewPassword;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `ChangeUserProfile` */

/*!50003 DROP PROCEDURE IF EXISTS  `ChangeUserProfile` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ChangeUserProfile`(
	IN Paramuserid int,
	IN ParamFullName varchar(100),
	IN ParamEmail varchar(100), 
	IN ParamUserPhoto varchar(100),
	IN ParamAuditedUser varchar(20)
)
BEGIN
	UPDATE `User`
	    SET FullName = ParamFullName, Email = ParamEmail, UserPhoto = ParamUserPhoto, AuditedUser = ParamAuditedUser,
	    AuditedActivity = 'E', AuditedTime = CURRENT_TIMESTAMP()
	WHERE 
	UserID = Paramuserid;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `CheckLogin` */

/*!50003 DROP PROCEDURE IF EXISTS  `CheckLogin` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckLogin`(
	In ParamUsername varchar(20),
	IN ParamPassword varchar(100)
)
BEGIN
	IF EXISTS (SELECT * FROM `User` WHERE UserName = ParamUsername AND Password = ParamPassword AND AuditedActivity <> 'D')
	THEN
		SELECT UserID, UserName, UserType, `Role`
		FROM `User`
		WHERE 
		UserName = ParamUsername 
		AND 
		Password = ParamPassword 
		AND 
		AuditedActivity <> 'D';
	ELSE
		SELECT -1 'UserID';
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteCategory` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteCategory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteCategory`(
	IN ParamCategoryID int,
	IN ParamAuditedUser varchar(20)
)
BEGIN
	UPDATE `Category`
	SET 
	AuditedUser = ParamAuditedUser,
	AuditedActivity = 'D',
	AuditedTime = CURRENT_TIMESTAMP()
	WHERE CategoryID = ParamCategoryID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteDegree` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteDegree` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteDegree`(
	IN ParamDegreeID int,
	IN ParamAuditedUser varchar(20)
)
BEGIN
	UPDATE Degree
	SET 
		AuditedUser = ParamAuditedUser,
		AuditedActivity = 'D',
		AuditedTime = CURRENT_TIMESTAMP()
	WHERE DegreeID = ParamDegreeID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteLevel` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteLevel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteLevel`(
	IN ParamLevelID int,
	IN ParamAuditedUser varchar(20)
)
BEGIN
	UPDATE `Level`
	SET AuditedUser = ParamAuditedUser,
	AuditedActivity = 'D',
	AuditedTime = CURRENT_TIMESTAMP()
	WHERE LevelID = ParamLevelID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteTest` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteTest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteTest`(
	IN ParamTestID int,
	IN ParamAuditedUser varchar(20)
)
BEGIN
	UPDATE `Test`
	SET AuditedUser = ParamAuditedUser,
	AuditedActivity = 'D',
	AuditedTime = CURRENT_TIMESTAMP()
	WHERE TestID = ParamTestID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteUser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteUser`(
	IN ParamUserID int,
	IN ParamAuditedUser varchar(20)
)
BEGIN
	UPDATE `User`
	SET AuditedUser = ParamAuditedUser,
	AuditedActivity = 'D',
	AuditedTime = CURRENT_TIMESTAMP()
	WHERE UserID = ParamUserID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `EditCategory` */

/*!50003 DROP PROCEDURE IF EXISTS  `EditCategory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `EditCategory`(
	IN ParamCategoryID int,
	IN ParamCategoryName varchar(50),
	IN ParamDegreeID int,
	IN ParamAuditedUser varchar(20)
)
BEGIN
	UPDATE Category
	SET CategoryName = ParamCategoryName,
	DegreeID = ParamDegreeID,
	AuditedUser = ParamAuditedUser,
	AuditedActivity = 'E',
	AuditedTime = CURRENT_TIMESTAMP()
	WHERE CategoryID = ParamCategoryID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `EditDegree` */

/*!50003 DROP PROCEDURE IF EXISTS  `EditDegree` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `EditDegree`(
	IN ParamDegreeID int,
	IN ParamDegreeName varchar(50),
	IN ParamAuditedUser varchar(20)
)
BEGIN
	UPDATE Degree
	SET 
		DegreeName = ParamDegreeName,
		AuditedUser = ParamAuditedUser,
		AuditedActivity = 'E',
		AuditedTime = CURRENT_TIMESTAMP()
	WHERE DegreeID = ParamDegreeID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `EditLevel` */

/*!50003 DROP PROCEDURE IF EXISTS  `EditLevel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `EditLevel`(
	IN ParamLevelID int,
	in ParamLevelName varchar(50),
	IN ParamAuditedUser varchar(20)
)
BEGIN
	UPDATE `Level`
	SET LevelName = ParamLevelName,
	AuditedUser = ParamAuditedUser,
	AuditedActivity = 'E',
	AuditedTime = CURRENT_TIMESTAMP()
	WHERE LevelID = ParamLevelID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetAllTest` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetAllTest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllTest`()
BEGIN
	SELECT t.TestID, LevelName, 
	CAST(DATE_FORMAT(PublishStartDate,'%d %b %Y') as CHAR)+ ' - '+CAST(DATE_FORMAT(PublishEndDate,'%d %b %Y') as CHAR) 'PublishDate', 
	TestName, DegreeName, CategoryName, AccessType, COUNT(ua.TestID) 'NumberOfPeople'
	FROM Test t
	JOIN Category c on t.CategoryID = c.CategoryID
	JOIN Degree d on d.DegreeID = c.DegreeID
	LEFT Join UserAnswer ua on ua.TestID = t.TestID
	JOIN `Level` l on l.LevelID = t.LevelID
	WHERE t.AuditedActivity <> 'D' AND c.AuditedActivity <> 'D' AND d.AuditedActivity <> 'D'
	GROUP BY t.TestID, PublishStartDate, PublishEndDate, TestName, DegreeName, CategoryName, AccessType, LevelName;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetCategory` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetCategory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCategory`()
BEGIN
	SELECT CategoryID, CategoryName, DegreeID From `Category`
	WHERE AuditedActivity <> 'D';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetCategoryByDegreeID` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetCategoryByDegreeID` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCategoryByDegreeID`(
	IN ParamDegreeID int
)
BEGIN
	SELECT
		*
	FROM
		Category
	WHERE
		DegreeID = ParamDegreeID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetCategoryPerDegree` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetCategoryPerDegree` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCategoryPerDegree`()
BEGIN
	SELECT c.DegreeID, DegreeName, CategoryID, CategoryName
	FROM
	Category c
	JOIN Degree d on c.DegreeID = d.DegreeID
	WHERE 
	c.AuditedActivity <> 'D' AND d.AuditedActivity <> 'D' 
	order by DegreeName;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetCreationTest` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetCreationTest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCreationTest`(
	IN ParamUserID int
)
BEGIN
	SELECT t.TestID, LevelName, 
	DATE_FORMAT(PublishStartDate,'%d %b %Y')+ ' - '+DATE_FORMAT(PublishStartDate,'%d %b %Y') 'PublishDate', 
	TestName, DegreeName, CategoryName, AccessType, COUNT(ua.TestID) 'NumberOfPeople'
	FROM Test t
	JOIN Category c on t.CategoryID = c.CategoryID
	JOIN Degree d on d.DegreeID = c.DegreeID
	LEFT Join UserAnswer ua on ua.TestID = t.TestID
	JOIN `Level` l on l.LevelID = t.LevelID
	WHERE t.UserID = ParamUserID AND t.AuditedActivity <> 'D' AND c.AuditedActivity <> 'D' AND d.AuditedActivity <> 'D'
	GROUP BY t.TestID, PublishStartDate, PublishEndDate, TestName, DegreeName, CategoryName, AccessType, LevelName;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetDegree` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetDegree` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDegree`()
BEGIN
	SELECT DegreeID, DegreeName FROM `Degree`
	WHERE AuditedActivity <> 'D';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetLevel` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetLevel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetLevel`()
BEGIN
	SELECT LevelID, LevelName FROM `Level`
	WHERE AuditedActivity <> 'D';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetListItemPerCategory` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetListItemPerCategory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetListItemPerCategory`(
	IN ParamCategoryID int
)
BEGIN
	SELECT  
	  t.TestID,  
	  TestName,  
	  TestDescription,  
	  PassedBy = COUNT(ua.UserID)  
	FROM Test t
	LEFT JOIN UserAnswer ua on ua.TestID = t.TestID
	WHERE  
	  CategoryID = ParamCategoryID AND  
	  t.AuditedActivity <> 'D'  
	GROUP BY  
	  t.TestID,  
	  TestName,  
	  TestDescription;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetNumberOfPeople` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetNumberOfPeople` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNumberOfPeople`(
	IN ParamTestID int
)
BEGIN
	SELECT 
		`Name`=CASE 
		WHEN ua.UserID = NULL THEN UserEmail
		ELSE CAST(u.UserName as char)
		END,
		`Type`=CASE
		WHEN AccessType = 1 THEN 'Private'
		ELSE 'Public'
		END,
		CAST(SUM(CASE WHEN tda.isAnswer = 1 THEN 1 ELSE 0 END) as char)
		+ '/'+
		CAST(COUNT(td.TestID) as char) 'RightTotalAnswer'
	FROM UserAnswer ua
	LEFT JOIN `User` u ON ua.UserID = u.UserID AND u.AuditedActivity<>'D'
	JOIN Test t ON ua.TestID = t.TestID AND t.AuditedActivity<>'D'
	JOIN TestDetail td ON td.TestID = t.TestID AND td.AuditedActivity<>'D'
	JOIN UserAnswerDetail uad ON uad.UserAnswerID= ua.UserAnswerID AND uad.testDetailID = td.TestDetailID AND uad.AuditedActivity<>'D'
	JOIN TestDetailAnswer tda ON tda.TestDetailAnswerID = uad.TestDetailAnswerID AND tda.AuditedActivity<>'D'
	WHERE ua.testid = ParamTestID AND ua.AuditedActivity<>'D'
	GROUP BY ua.UserID, UserEmail, AccessType, u.UserName;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetPassedTest` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetPassedTest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPassedTest`(
	IN ParamUserID int
)
BEGIN
	SELECT 
		t.TestID, DATE_FORMAT(ua.AuditedTime,'%d %b %Y') 'Date',
		TestName, DegreeName, CategoryName, LevelName,
		(CAST(SUM(CASE WHEN tda.isAnswer = 1 THEN 1 ELSE 0 END) as DECIMAL(16,2))/
		CAST(COUNT(td.TestID)as DECIMAL(16,2)))*100 'Score'
	FROM Test t
	JOIN Category c on t.CategoryID = c.CategoryID
	JOIN Degree d on d.DegreeID = c.DegreeID
	Join UserAnswer ua on ua.TestID = t.TestID
	JOIN TestDetail td on td.TestID = t.TestID
	JOIN `Level` l on l.LevelID = t.LevelID
	JOIN UserAnswerDetail uad on uad.UserAnswerID= ua.UserAnswerID AND uad.testDetailID = td.TestDetailID
	JOIN TestDetailAnswer tda on tda.TestDetailAnswerID = uad.TestDetailAnswerID
	WHERE ua.UserID = ParamUserID
		AND t.AuditedActivity <> 'D' 
		AND c.AuditedActivity <> 'D' 
		AND d.AuditedActivity <> 'D'
		AND ua.AuditedActivity <> 'D'
		AND td.AuditedActivity <> 'D'
		AND uad.AuditedActivity <> 'D'
		AND tda.AuditedActivity <> 'D'
		AND l.AuditedActivity <> 'D'
	GROUP BY t.TestID, TestName, DegreeName, CategoryName, ua.AuditedTime, LevelName;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetTopTest` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetTopTest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTopTest`()
BEGIN
	SELECT LevelID, t.TestID, TestName, CategoryName, DegreeName, FullName, Count(ua.TestID) 'NumberOfPeople'
	FROM
	Test t
	JOIN Category c on t.CategoryID = c.CategoryID
	JOIN Degree d on d.DegreeID = c.DegreeID
	JOIN `User` u on u.UserID = t.UserID
	Join UserAnswer ua on ua.TestID = t.TestID
	WHERE t.TestID in (SELECT TestID From UserAnswer  GROUP BY TestID ORDER BY COUNT(TestID) /*limit 5*/)
	AND t.AuditedActivity <> 'D' AND c.AuditedActivity <> 'D' AND ua.AuditedActivity <> 'D'
	 AND d.AuditedActivity <> 'D' AND u.AuditedActivity <> 'D'
	GROUP BY LevelID, t.TestID, TestName, CategoryName, DegreeName, FullName
	limit 10
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetUserAndAnswer` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetUserAndAnswer` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserAndAnswer`()
BEGIN
	select u.UserID, UserName, FullName, Email, UserType, COUNT(t.UserID) 'CreateTest', COUNT(ua.UserID) 'PassedTest'
	from `User` u
	LEFT JOIN `Test` t on u.UserID = t.UserID
	LEFT JOIN `UserAnswer` ua on ua.UserID = u.UserID
	where role <> 1 /*bukan admin */
	and u.auditedactivity <> 'D'
	group by u.UserID, UserName, FullName, Email, UserType;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetUserProfile` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetUserProfile` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserProfile`(
	IN ParamUserID int
)
BEGIN
	SELECT UserName,UserPhoto, FullName,Email,UserType
	From `User`
	WHERE 
	UserID = ParamUserID
	AND
	AuditedActivity <> 'D';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertCategory` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertCategory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCategory`(
	IN ParamCategoryName varchar(50),
	IN ParamDegreeID int,
	IN ParamAuditedUser varchar(20)
)
BEGIN
	INSERT INTO Category
	(CategoryName, DegreeID, AuditedUser, AuditedActivity, AuditedTime)
	VALUES 
	(ParamCategoryName,ParamDegreeID, ParamAuditedUser, 'A', CURRENT_TIMESTAMP());
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertDegree` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertDegree` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertDegree`(
	IN ParamDegreeName varchar(50),
	IN ParamAuditedUser varchar(20)
)
BEGIN
	INSERT INTO Degree (DegreeName, AuditedUser, AuditedActivity, AuditedTime) VALUES (ParamDegreeName, ParamAuditedUser, 'A', CURRENT_TIMESTAMP());
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertLevel` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertLevel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertLevel`(
	IN ParamLevelName varchar(50),
	IN ParamAuditedUser varchar(20)
)
BEGIN
	INSERT INTO Level (levelName, AuditedUser, AuditedActivity, AuditedTime) VALUES (ParamLevelName, ParamAuditedUser, 'A', CURRENT_TIMESTAMP());
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertTest` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertTest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertTest`(
	IN ParamTestName varchar(30), 
	IN ParamTestDescription varchar(100),
	IN ParamCategoryID int, 
	IN ParamLevelID int, 
	IN ParamDegreeID int, 
	IN ParamUserID int, 
	IN ParamAccessType int, --  0 public, 1 private
	IN ParamPublishStartDate datetime,
	IN ParamPublishEndDate datetime,
	IN ParamUploadTutorial varchar(100),
	IN ParamAuditedUser varchar(20)
)
BEGIN
	INSERT INTO `Test` 
		(TestName, TestDescription, CategoryID, LevelID,
		AccessType, UserID, PublishStartDate, PublishEndDate,
		-- UploadTutorial, 
		AuditedUser, AuditedActivity, AuditedTime 
		/*, DegreeID*/
		)
	VALUES 
	(
		ParamTestName, 
		ParamTestDescription,
		ParamCategoryID, 
		ParamLevelID, 
		ParamAccessType, --  0 public, 1 private
		ParamUserID, 
		ParamPublishStartDate,
		ParamPublishEndDate,
		-- ParamUploadTutorial,
		ParamAuditedUser, 
		'A', 
		CURRENT_TIMESTAMP() -- ,
		-- ParamDegreeID
	);
	SELECT LAST_INSERT_ID();
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertTestDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertTestDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertTestDetail`(
	IN ParamTestQuestion varchar(200),
	IN ParamTestURL varchar(100),
	IN ParamTestID int,
	IN ParamAuditedUser varchar(20))
BEGIN
	INSERT INTO
	TestDetail
	(
		TestQuestion, TestURL, TestID, AuditedUser, AuditedActivity, AuditedTime
	)
	VALUES
	(
		ParamTestQuestion,
		ParamTestURL,
		ParamTestID,
		ParamAuditedUser,
		'A',
		CURRENT_TIMESTAMP()
	);
	SELECT LAST_INSERT_ID();
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertTestDetailAnswer` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertTestDetailAnswer` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertTestDetailAnswer`(
	IN ParamTestDetailAnswerName varchar(100),
	IN ParamTestDetailURL varchar(100),
	IN ParamisAnswer int,
	IN ParamTestDetailID int,
	IN ParamAuditedUser varchar(20)
)
BEGIN
	INSERT INTO
		TestDetailAnswer
	(TestDetailAnswerName, TestDetailURL, isAnswer, TestDetailID, AuditedUser, AuditedActivity, AuditedTime)
	VALUES
	(
		ParamTestDetailAnswerName,
		ParamTestDetailURL,
		ParamisAnswer,
		ParamTestDetailID,
		ParamAuditedUser,
		'A',
		CURRENT_TIMESTAMP()
	);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertUser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertUser`(
	ParamUserName varchar(20),
	ParamFullName varchar(100),
	ParamUserPhoto varchar(100),
	ParamPassword varchar(100),
	ParamEmail varchar(100),
	ParamUserType varchar(10),
	ParamAuditedUser varchar(20)
)
BEGIN
	
	INSERT INTO `User` 
	(UserName, FullName, UserPhoto, `Password`, Email, UserType, Role, AuditedUser, AuditedActivity, AuditedTime)
	VALUES 
	(ParamUserName, ParamFullName, ParamUserPhoto, ParamPassword, ParamEmail, ParamUserType, 0, ParamAuditedUser, 'A', CURRENT_TIMESTAMP());
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
