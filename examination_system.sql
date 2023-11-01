/*
SQLyog Ultimate v12.14 (64 bit)
MySQL - 5.5.40 : Database - examination_system
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`examination_system` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `examination_system`;

/*Table structure for table `college` */

DROP TABLE IF EXISTS `college`;

CREATE TABLE `college` (
  `collegeID` int(11) NOT NULL,
  `collegeName` varchar(200) NOT NULL COMMENT '课程名',
  PRIMARY KEY (`collegeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `college` */

insert  into `college`(`collegeID`,`collegeName`) values
(1,'海洋科学'),
(2,'海洋科学(中外合办)'),
(3,'大气科学'),
(4,'物理学'),
(5,'光电信息科学与工程'),
(6,'电子信息科学与技术'),
(7,'电子信息工程'),
(8,'通信工程'),
(9,'微电子科学与工程'),
(10,'智能科学与技术'),
(11,'数据科学与大数据'),
(12,'网络空间安全'),
(13,'计算机科学与技术'),
(14,'计算机科学与技术(中外合办)'),
(15,'保密管理'),
(16,'海洋技术'),
(17,'化学'),
(18,'化学工程与工艺'),
(19,'地质学'),
(20,'勘查技术与工程'),
(21,'勘察技术与工程(卓越班)'),
(22,'地球信息科学与技术'),
(23,'生物科学'),
(24,'生物技术'),
(25,'生态学'),
(26,'水产养殖学'),
(27,'海洋资源与环境'),
(28,'海洋渔业科学与技术'),
(29,'食品科学与工程'),
(30,'生物工程'),
(31,'海洋资源开发技术'),
(32,'药学'),
(33,'土木工程'),
(34,'工程管理'),
(35,'港口航道与海岸工程'),
(36,'船舶与海洋工程'),
(37,'机械设计制造及其自动化'),
(38,'工业设计'),
(39,'轮机工程'),
(40,'自动化'),
(41,'环境科学'),
(42,'环境工程'),
(43,'工商管理'),
(44,'会计学'),
(45,'会计学(ACCA)'),
(46,'财务管理'),
(47,'市场营销'),
(48,'电子商务'),
(49,'旅游管理'),
(50,'金融学'),
(51,'金融学(CFA)'),
(52,'国际经济与贸易'),
(53,'物流管理'),
(54,'经济学'),
(55,'英语'),
(56,'日语'),
(57,'朝鲜语'),
(58,'法语'),
(59,'德语'),
(60,'汉语言文学'),
(61,'文华产业管理'),
(62,'新闻学'),
(63,'网络与新媒体'),
(64,'法学'),
(65,'政治学与行政学'),
(66,'行政管理'),
(67,'公告事业该管理'),
(68,'数学与应用数学'),
(69,'信息与计算科学'),
(70,'材料科学与工程'),
(71,'高分子材料与工程'),
(72,'运动训练'),
(73,'音乐表演');




/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `courseID` int(11) NOT NULL,
  `courseName` varchar(200) NOT NULL COMMENT '课程名称',
  `teacherID` int(11) NOT NULL,
  `courseTime` varchar(200) DEFAULT NULL COMMENT '开课时间',
  `classRoom` varchar(200) DEFAULT NULL COMMENT '开课地点',
  `courseWeek` int(200) DEFAULT NULL COMMENT '学时',
  `courseType` varchar(20) DEFAULT NULL COMMENT '课程类型',
  `collegeID` int(11) NOT NULL COMMENT '所属院系',
  `score` int(11) NOT NULL COMMENT '学分',
  PRIMARY KEY (`courseID`),
  KEY `collegeID` (`collegeID`),
  KEY `teacherID` (`teacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`courseID`,`courseName`,`teacherID`,`courseTime`,`classRoom`,`courseWeek`,`courseType`,`collegeID`,`score`) values 

(1,'C语言程序设计',1001,'周二','科401',18,'必修课',1,3),
(2,'Python爬虫技巧',1001,'周四','X402',18,'必修课',1,3),
(3,'数据结构',1001,'周四','科401',18,'必修课',1,2),
(4,'Java程序设计',1002,'周五','科401',18,'必修课',1,2),
(5,'英语',1002,'周四','X302',18,'必修课',2,2),
(6,'服装设计',1003,'周一','科401',18,'选修课',2,2);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `roleID` int(11) NOT NULL,
  `roleName` varchar(20) NOT NULL,
  `permissions` varchar(255) DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`roleID`,`roleName`,`permissions`) values 

(0,'admin',NULL),

(1,'teacher',NULL),

(2,'student',NULL);

/*Table structure for table `selectedcourse` */

DROP TABLE IF EXISTS `selectedcourse`;

CREATE TABLE `selectedcourse` (
  `courseID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `mark` int(11) DEFAULT NULL COMMENT '成绩',
  KEY `courseID` (`courseID`),
  KEY `studentID` (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `selectedcourse` */

insert  into `selectedcourse`(`courseID`,`studentID`,`mark`) values 

(2,10001,12),

(1,10001,95),

(1,10002,66),

(2,10003,99),

(5,10001,NULL),

(3,10001,NULL),

(1,10003,NULL),

(4,10003,NULL);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) NOT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `birthYear` date DEFAULT NULL COMMENT '出生日期',
  `grade` date DEFAULT NULL COMMENT '入学时间',
  `collegeID` int(11) NOT NULL COMMENT '院系id',
  PRIMARY KEY (`userID`),
  KEY `collegeID` (`collegeID`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`userID`,`userName`,`sex`,`birthYear`,`grade`,`collegeID`) values 

(9999,'mike1','男','1996-09-03','2019-11-13',3),

(10001,'小红','男','2020-03-02','2020-03-02',1),

(10002,'小绿','男','2020-03-10','2020-03-10',1),

(10003,'小陈','女','1996-09-02','2015-09-02',2),

(10005,'小左','女','1996-09-02','2015-09-02',2),

(10007,'MIke','男','1996-09-02','2015-09-02',2);

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) NOT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `birthYear` date NOT NULL,
  `degree` varchar(20) DEFAULT NULL COMMENT '学历',
  `title` varchar(255) DEFAULT NULL COMMENT '职称',
  `grade` date DEFAULT NULL COMMENT '入职时间',
  `collegeID` int(11) NOT NULL COMMENT '院系',
  PRIMARY KEY (`userID`),
  KEY `collegeID` (`collegeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`userID`,`userName`,`sex`,`birthYear`,`degree`,`title`,`grade`,`collegeID`) values 

(2112001101,'盖元龙','男','1990-03-08','硕士','副教授','2020-09-02',2),
(2112001102,'叶圣杰','男','1996-09-02','博士','讲师','2021-09-02',1),
(2112001103,'白乐志','男','1996-09-02','博士','教授','2017-07-07',21),
(2112001104,'常冠玉','女','1996-09-02','硕士','助教','2017-07-07',17),
(2112001105,'詹安福','男','1996-09-02','博士','副教授','2017-07-07',3),
(2112001106,'周明志','男','1996-09-02','博士','讲师','2017-07-07',1),
(2112001107,'贺宜人','男','1996-09-02','博士','副教授','2017-07-07',10),
(2112001108,'戴成双','男','1996-09-02','博士','副教授','2017-07-07',43),
(2112001109,'怀经义','男','1996-11-02','博士','讲师','2017-07-07',33),
(2112001110,'戴成双','女','1996-12-01','博士','讲师','2017-07-07',1),
(2112001111,'晃星文','男','1998-09-02','博士','讲师','2017-07-07',4),
(2112001112,'乔爱茹','女','1999-10-18','博士','副教授','2017-07-07',1),
(2112001113,'彭幼丝','女','1982-08-06','博士','讲师','2017-07-07',5);


/*Table structure for table `userlogin` */

DROP TABLE IF EXISTS `userlogin`;

CREATE TABLE `userlogin` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '2' COMMENT '角色权限',
  PRIMARY KEY (`userID`),
  KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `userlogin` */

insert  into `userlogin`(`userID`,`userName`,`password`,`role`) values 

(1,'admin','123',0),

(10,'10003','123',2),

(11,'10005','123',2),

(14,'1001','123',1),

(15,'1002','123',1),

(16,'1003','123',1),

(20,'9999','123',2),

(21,'10001','123',2),

(22,'10002','123',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
