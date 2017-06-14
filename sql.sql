/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.40-community : Database - bootshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bootshop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bootshop`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '书籍名称',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `price` decimal(10,2) NOT NULL COMMENT '单价',
  `number` int(11) DEFAULT NULL COMMENT '书籍编号',
  `author` varchar(20) DEFAULT NULL COMMENT '作者',
  `content` varchar(500) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`id`,`name`,`type`,`price`,`number`,`author`,`content`) values (1,'java编程思想','计算机','74.90',1,'sum','这本书很不错'),(2,'论毛泽东思想','政治','38.00',2,'毛泽东','这本书   还凑合'),(3,'狭义相对论','物理','85.00',3,'爱因斯坦','这本书你基本看不懂'),(4,'广义相对论','物理','89.00',4,'爱因斯坦','这本书你根本看不懂'),(5,'水浒传','小说','120.00',5,'施耐庵 ','少年不看水浒，老年不读三国'),(6,'哈利波特','小说','238.00',6,'哈利波特','The book is English book');

/*Table structure for table `bookorder` */

DROP TABLE IF EXISTS `bookorder`;

CREATE TABLE `bookorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) DEFAULT NULL,
  `zong` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `bookorder` */

insert  into `bookorder`(`id`,`time`,`userid`,`zong`) values (1,'2017-03-02 00:00:00',3,'2.00'),(14,'2017-06-10 19:49:00',3,'695.00'),(15,'2017-06-10 19:50:36',2,'74.00'),(16,'2017-06-10 20:51:05',2,'159.00'),(17,'2017-06-10 20:52:40',2,'159.00'),(18,'2017-06-10 20:55:12',2,'159.00'),(19,'2017-06-10 21:08:04',2,'38.00');

/*Table structure for table `shopcart` */

DROP TABLE IF EXISTS `shopcart`;

CREATE TABLE `shopcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  `BookId` int(11) DEFAULT NULL COMMENT '书籍编号',
  `number` int(5) DEFAULT NULL COMMENT '数量',
  `orderId` int(11) DEFAULT '0' COMMENT '0为购物车未结算状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `shopcart` */

insert  into `shopcart`(`id`,`userId`,`BookId`,`number`,`orderId`) values (2,2,2,4,17),(3,2,3,3,1),(4,2,4,2,1),(5,2,5,2,1),(6,2,6,1,1),(7,2,NULL,1,1),(15,3,3,3,0),(16,3,2,3,0),(17,3,4,2,0),(18,3,1,2,0),(19,2,1,1,18),(20,2,3,1,18),(21,2,2,1,19);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) NOT NULL COMMENT '登录名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`password`) values (1,'123','123'),(2,'admin','21232F297A57A5A743894A0E4A801FC3'),(3,'root','63A9F0EA7BB98050796B649E85481845'),(4,'root1','E5D9DEE0892C9F474A174D3BFFFB7810');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
