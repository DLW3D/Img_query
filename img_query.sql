-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2019-02-09 10:35:31
-- 服务器版本： 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `img_query`
--

-- --------------------------------------------------------

--
-- 表的结构 `picture`
--

DROP TABLE IF EXISTS `picture`;
CREATE TABLE IF NOT EXISTS `picture` (
  `pid` int(10) NOT NULL AUTO_INCREMENT COMMENT '图片id',
  `name` varchar(20) NOT NULL COMMENT '图片名称',
  `type` varchar(20) DEFAULT NULL COMMENT '图片分类',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '图片提供者',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传日期',
  `used` int(10) NOT NULL DEFAULT '0' COMMENT '使用次数',
  PRIMARY KEY (`pid`),
  UNIQUE KEY `name` (`name`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='图片表';

--
-- 转存表中的数据 `picture`
--

INSERT INTO `picture` (`pid`, `name`, `type`, `uid`, `date`, `used`) VALUES
(2, '昆西吃草', NULL, 1, '2019-02-08 17:03:39', 0),
(6, '迟到30年 新闻总是那么及时', NULL, 0, '2019-02-08 20:33:25', 0),
(9, '昆西趴桌子', NULL, 1, '2019-02-09 17:39:02', 0),
(10, '昆西牛吃草', NULL, 1, '2019-02-09 17:39:46', 0),
(11, '昆西锁屏', NULL, 1, '2019-02-09 17:40:37', 0),
(12, '昆西牛喝牛奶', NULL, 1, '2019-02-09 17:41:28', 0),
(13, '昆西晒太阳', NULL, 1, '2019-02-09 17:42:07', 0),
(14, '昆西牛吃韭喊昆', NULL, 1, '2019-02-09 17:42:41', 0),
(15, '昆西枕鲨鱼', NULL, 1, '2019-02-09 17:43:13', 0),
(16, '昆西滚雪球', NULL, 1, '2019-02-09 17:44:04', 0),
(17, '昆西兔吃草', NULL, 1, '2019-02-09 17:44:31', 0),
(18, '不明真相的吃韭昆西', NULL, 1, '2019-02-09 17:45:02', 0);

-- --------------------------------------------------------

--
-- 表的结构 `pic_comment`
--

DROP TABLE IF EXISTS `pic_comment`;
CREATE TABLE IF NOT EXISTS `pic_comment` (
  `cid` int(10) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `pid` int(10) NOT NULL COMMENT '图片ID',
  `attitude` int(1) NOT NULL COMMENT '态度(赞/踩)',
  `uid` int(10) DEFAULT '0' COMMENT '评论者',
  `comment` varchar(255) NOT NULL COMMENT '评论',
  `comm_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  PRIMARY KEY (`cid`),
  KEY `pid` (`pid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='图片评论表';

--
-- 转存表中的数据 `pic_comment`
--

INSERT INTO `pic_comment` (`cid`, `pid`, `attitude`, `uid`, `comment`, `comm_time`) VALUES
(1, 2, 1, 1, '昆西昆西昆', '2019-02-08 17:06:34'),
(2, 2, 0, 1, '昆西不吃草~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~', '2019-02-08 17:06:34'),
(3, 6, 0, 0, '无可奉告', '2019-02-09 17:21:20'),
(4, 6, -1, 1, '卡里卡气的', '2019-02-09 17:21:52'),
(5, 2, 0, 0, '这个图片没有缩略图,原图还是有的', '2019-02-09 17:50:08');

-- --------------------------------------------------------

--
-- 表的结构 `pic_nickname`
--

DROP TABLE IF EXISTS `pic_nickname`;
CREATE TABLE IF NOT EXISTS `pic_nickname` (
  `nid` int(10) NOT NULL AUTO_INCREMENT COMMENT '别名对照ID',
  `pid` int(10) NOT NULL COMMENT '图片ID',
  `nickname` varchar(20) NOT NULL COMMENT '图片别名',
  PRIMARY KEY (`nid`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='图片别名表';

--
-- 转存表中的数据 `pic_nickname`
--

INSERT INTO `pic_nickname` (`nid`, `pid`, `nickname`) VALUES
(1, 2, '昆西牛'),
(2, 2, '除草机'),
(12, 9, '昆西昆'),
(13, 15, '昆西摸鲸'),
(14, 18, '昆西吃草');

-- --------------------------------------------------------

--
-- 表的结构 `pic_type`
--

DROP TABLE IF EXISTS `pic_type`;
CREATE TABLE IF NOT EXISTS `pic_type` (
  `tid` int(10) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `pid` int(10) NOT NULL COMMENT '图片ID',
  `type_name` varchar(20) NOT NULL COMMENT '分类',
  PRIMARY KEY (`tid`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='图片类型表';

--
-- 转存表中的数据 `pic_type`
--

INSERT INTO `pic_type` (`tid`, `pid`, `type_name`) VALUES
(1, 2, '昆西'),
(2, 2, '你游'),
(3, 6, '是首相'),
(4, 6, '真人'),
(5, 6, '火星'),
(6, 9, '昆西'),
(7, 10, '昆西不昆'),
(8, 11, '锁屏'),
(9, 14, '昆西'),
(10, 18, '奶牛昆');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`uid`, `name`, `password`, `nickname`) VALUES
(0, 'Anonym', 'Anonym', 'Anonym'),
(1, 'a', 'a', '3D'),
(2, 'b', 'b', NULL),
(3, 'c', 'c', 'c');

--
-- 限制导出的表
--

--
-- 限制表 `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);

--
-- 限制表 `pic_comment`
--
ALTER TABLE `pic_comment`
  ADD CONSTRAINT `pic_comment_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `picture` (`pid`),
  ADD CONSTRAINT `pic_comment_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);

--
-- 限制表 `pic_nickname`
--
ALTER TABLE `pic_nickname`
  ADD CONSTRAINT `pic_nickname_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `picture` (`pid`);

--
-- 限制表 `pic_type`
--
ALTER TABLE `pic_type`
  ADD CONSTRAINT `pic_type_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `picture` (`pid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
