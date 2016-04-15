/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.0.27-community-nt : Database - czt
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`czt` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `czt`;

/*Table structure for table `t_applicant` */

DROP TABLE IF EXISTS `t_applicant`;

CREATE TABLE `t_applicant` (
  `id` int(128) NOT NULL auto_increment,
  `MOBILE` varchar(64) collate utf8_bin default NULL,
  `CARCODE` varchar(32) collate utf8_bin default NULL,
  `STATUS` varchar(3) collate utf8_bin default NULL,
  `REFEREES` varchar(128) collate utf8_bin default NULL,
  `OPERTIME` date default NULL,
  `LOANMONEY` int(11) default NULL,
  `REBATEMONEY` int(11) default NULL,
  `INSUSTATUS` varchar(3) collate utf8_bin default NULL,
  `INSUREMARK` varchar(256) collate utf8_bin default NULL,
  `REMARK` varchar(256) collate utf8_bin default NULL,
  `SYNCAPPSTATUS` varchar(3) collate utf8_bin default NULL,
  `SYNCINSUSTATUS` varchar(3) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `t_applicant` */

/*Table structure for table `t_insurance` */

DROP TABLE IF EXISTS `t_insurance`;

CREATE TABLE `t_insurance` (
  `id` int(128) NOT NULL auto_increment,
  `REALNAME` varchar(32) collate utf8_bin NOT NULL,
  `USERNAME` varchar(128) collate utf8_bin NOT NULL,
  `PASSWORD` varchar(128) collate utf8_bin NOT NULL,
  `MOBILE` varchar(64) collate utf8_bin default NULL,
  `INSUNAME` varchar(256) collate utf8_bin default NULL,
  `INSUADDR` varchar(512) collate utf8_bin default NULL,
  `REMARK` varchar(1024) collate utf8_bin default NULL,
  `USERTYPE` varchar(32) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `t_insurance` */

/*Table structure for table `t_washcar` */

DROP TABLE IF EXISTS `t_washcar`;

CREATE TABLE `t_washcar` (
  `id` int(128) NOT NULL auto_increment,
  `REALNAME` varchar(32) collate utf8_bin NOT NULL,
  `USERNAME` varchar(128) collate utf8_bin NOT NULL,
  `PASSWORD` varchar(128) collate utf8_bin NOT NULL,
  `MOBILE` varchar(64) collate utf8_bin default NULL,
  `QQCODE` varchar(128) collate utf8_bin default NULL,
  `CARNAME` varchar(512) collate utf8_bin default NULL,
  `CARADDR` varchar(512) collate utf8_bin default NULL,
  `REMARK` varchar(1024) collate utf8_bin default NULL,
  `USERTYPE` varchar(32) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `t_washcar` */

insert  into `t_washcar`(`id`,`REALNAME`,`USERNAME`,`PASSWORD`,`MOBILE`,`QQCODE`,`CARNAME`,`CARADDR`,`REMARK`,`USERTYPE`) values (1,'管理员','admin','21232f297a57a5a743894a0e4a801fc3',NULL,NULL,NULL,NULL,NULL,'xcd');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
