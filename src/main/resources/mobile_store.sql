/*
SQLyog Ultimate v12.09 (64 bit)
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `brand` */

insert  into `brand`(`id`,`name`,`pic_url`) values (4,'Alcatel','falk'),(5,'Google','aberh'),(6,'Samsung','geqb'),(7,'iPhone','btr');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pic_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`name`,`pic_name`) values (10,'Սմարտֆոններ','icon1_100x100.png'),(11,'Պլանշետներ','icon2_100x100.png'),(12,'Նոթբուկներ','icon3_100x100.png'),(13,'Աքսեսուարներ','icon4_100x100.png'),(14,'Տեսախցիկներ','icon5_100x100.png'),(15,'Հեռուստացույցներ','icon6_100x100.png'),(16,'Տպիչներ','icon7_100x100.png'),(18,'Դինամիկներ','icon8_100x100.png');

/*Table structure for table `os` */

DROP TABLE IF EXISTS `os`;

CREATE TABLE `os` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `os` */

insert  into `os`(`id`,`name`) values (4,'Android'),(5,'IOS'),(6,'Windows Phone');

/*Table structure for table `picture` */

DROP TABLE IF EXISTS `picture`;

CREATE TABLE `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_url` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Data for the table `picture` */

insert  into `picture`(`id`,`pic_url`,`product_id`) values (12,'1526243916884_blog2_1024x1024.jpg',13),(14,'1526243917052_blog3_1024x1024.jpg',13),(15,'1526314038102_product22_320x320.jpg',14),(16,'1526314038202_product23_320x320.jpg',14),(17,'1526314038303_product24_320x320.jpg',14),(18,'1526314038358_product25_320x320.jpg',14),(19,'1526314038414_product26_320x320.jpg',14),(20,'1526314038470_product27_320x320.jpg',14),(21,'1526314038526_product28_320x320.jpg',14),(22,'1526314038582_product29_320x320.jpg',14),(23,'1526314038638_product30_320x320.jpg',14),(24,'1526314038693_product31_320x320.jpg',14),(25,'1526314038749_product32_320x320.jpg',14),(26,'1526314038805_product33_320x320.jpg',14),(27,'1526314841252_product1_320x320.jpg',15),(28,'1526314841309_product2_320x320.jpg',15),(29,'1526314841364_product02_800x800.jpg',15),(30,'1526314841466_product3_320x320.jpg',15),(31,'1526314841554_product03_800x800.jpg',15),(32,'1526314841609_product4_320x320.jpg',15),(33,'1526314841665_product5_320x320.jpg',15),(34,'1526314841721_product6_320x320.jpg',15),(35,'1526414098588_product9_320x320.jpg',16),(36,'1526414133817_product9_320x320.jpg',16),(37,'1526414160568_product10_320x320.jpg',16),(38,'1526414165582_product11_320x320.jpg',16),(39,'1526414169291_product12_320x320.jpg',16),(40,'1526414171588_product13_320x320.jpg',16),(41,'1526414381273_icon1_100x100.png',17),(42,'1526414383723_icon1_100x100.png',17),(43,'1526414484361_icon2_100x100.png',17),(44,'1526414490968_icon3_100x100.png',17),(45,'1526414513848_icon4_100x100.png',17);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) NOT NULL,
  `os_id` int(11) NOT NULL,
  `os_version` double NOT NULL,
  `camera` int(11) NOT NULL,
  `cpu` varchar(255) NOT NULL,
  `ram` int(11) NOT NULL,
  `memory` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `pic_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `os_id` (`os_id`),
  KEY `category_id` (`category_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`os_id`) REFERENCES `os` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`model`,`os_id`,`os_version`,`camera`,`cpu`,`ram`,`memory`,`category_id`,`brand_id`,`pic_url`) values (13,'Idol 4',4,6,13,'Snapdregon',3,16,10,4,'1526243916717_blog1_85x55.jpg'),(14,'Pixel',4,6,5,'MediaTek',5,16,10,5,'1526314038749_product32_320x320.jpg'),(15,'5s',5,5,8,'A8',3,64,10,7,'1526314841721_product6_320x320.jpg'),(16,'j5',4,5,4,'A8',4,85,10,6,'1526414098588_product9_320x320.jpg'),(17,'j5',4,5,4,'A8',4,85,10,6,'1526414381273_icon1_100x100.png');

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
