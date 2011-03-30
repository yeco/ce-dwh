/*
SQLyog Community v8.7 
MySQL - 5.1.37-log : Database - kaltura
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `kalturadw`;

/*Table structure for table `dwh_dim_scheduler` */

DROP TABLE IF EXISTS `dwh_dim_scheduler`;

CREATE TABLE `dwh_dim_scheduler` (
  `dwh_id` INT(11) NOT NULL AUTO_INCREMENT,
  `id` INT(11),
  `created_at` DATETIME DEFAULT NULL,
  `created_by` VARCHAR(20) DEFAULT NULL,
  `updated_at` DATETIME DEFAULT NULL,
  `updated_by` VARCHAR(20) DEFAULT NULL,
  `configured_id` INT(11),
  `name` VARCHAR(20) DEFAULT '',
  `description` VARCHAR(20) DEFAULT '',
  `statuses` VARCHAR(255),
  `last_status` DATETIME,
  `host` VARCHAR(63) DEFAULT '',
  `dwh_creation_date` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dwh_update_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ri_ind` TINYINT(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dwh_id`),
  UNIQUE KEY(`id`)
) ENGINE=MYISAM AUTO_INCREMENT=973 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
