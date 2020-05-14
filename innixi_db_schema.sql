# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: innixi.cqd8wcdxdx8y.us-east-2.rds.amazonaws.com (MySQL 5.7.22-log)
# Database: innixi
# Generation Time: 2020-05-13 20:59:55 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table authentication
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authentication`;

CREATE TABLE `authentication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(120) NOT NULL,
  `token` varchar(255) NOT NULL DEFAULT '',
  `expiry` datetime NOT NULL DEFAULT '2021-12-31 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table checkin_feeling_activities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `checkin_feeling_activities`;

CREATE TABLE `checkin_feeling_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkInFeelingId` int(11) NOT NULL,
  `activity` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `checkInFeelingId` (`checkInFeelingId`),
  CONSTRAINT `checkin_feeling_activities_ibfk_1` FOREIGN KEY (`checkInFeelingId`) REFERENCES `checkin_feelings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table checkin_feelings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `checkin_feelings`;

CREATE TABLE `checkin_feelings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkInId` int(11) NOT NULL,
  `feeling` varchar(120) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `checkInId` (`checkInId`),
  CONSTRAINT `checkin_feelings_ibfk_1` FOREIGN KEY (`checkInId`) REFERENCES `checkins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table checkins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `checkins`;

CREATE TABLE `checkins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(120) NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table exercise_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exercise_log`;

CREATE TABLE `exercise_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(120) NOT NULL,
  `end` datetime NOT NULL,
  `shown` tinyint(1) DEFAULT '0',
  `text` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table onboarding
# ------------------------------------------------------------

DROP TABLE IF EXISTS `onboarding`;

CREATE TABLE `onboarding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(120) NOT NULL,
  `concern` varchar(120) NOT NULL,
  `type` enum('GENERIC','PANDEMIC') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table sleep_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sleep_log`;

CREATE TABLE `sleep_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(120) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table user_goals
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_goals`;

CREATE TABLE `user_goals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(120) NOT NULL,
  `weeklyCheckin` int(11) NOT NULL,
  `dailySleepHours` int(11) NOT NULL,
  `dailyExerciseHours` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
