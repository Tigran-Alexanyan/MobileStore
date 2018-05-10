/*
SQLyog Ultimate v12.2.6 (64 bit)
MySQL - 5.7.22 : Database - mobile_store
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mobile_store` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mobile_store`;

/*Table structure for table `brand` */

DROP TABLE IF EXISTS `brand`;

CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pic_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `brand` */

insert  into `brand`(`id`,`name`,`pic_url`) values 

(1,'Samsung','kljfbkdf'),

(2,'Apple','fddfhdf'),

(3,'Alcatel','4u6wjteh'),

(4,'Nokia','grbfs');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pic_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`name`,`pic_url`) values 

(1,'Tablet','ndfn'),

(2,'Phone','fdbdfnbfd'),

(3,'Norebook','rhetg'),

(4,'Tv','fn');

/*Table structure for table `os` */

DROP TABLE IF EXISTS `os`;

CREATE TABLE `os` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `os` */

insert  into `os`(`id`,`name`) values 

(1,'Android'),

(2,'Ios'),

(3,'Windows Phone');

/*Table structure for table `picture` */

DROP TABLE IF EXISTS `picture`;

CREATE TABLE `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_url` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `picture` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) NOT NULL,
  `date` int(11) NOT NULL,
  `os_id` int(11) NOT NULL,
  `os_version` double NOT NULL,
  `display_type` varchar(255) NOT NULL,
  `display_resolution` varchar(255) NOT NULL,
  `display_size` double NOT NULL,
  `camera` int(11) NOT NULL,
  `front_camera` int(11) NOT NULL,
  `cpu` varchar(255) NOT NULL,
  `ram` int(11) NOT NULL,
  `sd_card_slot` enum('Այո','Ոչ') NOT NULL,
  `memory` int(11) NOT NULL,
  `internet` varchar(255) NOT NULL,
  `gps` enum('Այո','Ոչ') NOT NULL,
  `bluetooth` enum('Այո','Ոչ') NOT NULL,
  `3g` enum('Այո','Ոչ') NOT NULL,
  `4g` enum('Այո','Ոչ') NOT NULL,
  `nfc` enum('Այո','Ոչ') NOT NULL,
  `charging` enum('USB Type-C','MicroUSB') NOT NULL,
  `battery_type` varchar(255) NOT NULL,
  `battery_capasity` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `thickness` double NOT NULL,
  `height` double NOT NULL,
  `width` double NOT NULL,
  `audio` varchar(255) NOT NULL,
  `sim` enum('1','2','3') NOT NULL,
  `pic_url` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `os_id` (`os_id`),
  KEY `category_id` (`category_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`os_id`) REFERENCES `os` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` enum('USER','ADMIN') NOT NULL DEFAULT 'USER',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
