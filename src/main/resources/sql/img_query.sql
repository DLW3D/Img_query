-- 创建用户表
CREATE TABLE `user`(
    `uid` INT(10) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `password` VARCHAR(20) NOT NULL,
    `nickname` VARCHAR(20) NULL,
    PRIMARY KEY(`uid`),
    UNIQUE(`name`)
) ENGINE = InnoDB CHARSET = utf8 COLLATE utf8_general_ci COMMENT = '用户表';

-- 创建图片表
CREATE TABLE `picture` (
 `pid` INT(10) NOT NULL AUTO_INCREMENT COMMENT '图片id' ,
 `name` VARCHAR(20) NOT NULL COMMENT '图片名称' ,
 `type` VARCHAR(20) NULL COMMENT '图片分类' ,
 `uid` INT(10) NOT NULL DEFAULT '0' COMMENT '图片提供者' ,
 `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传日期'
 `used` INT(10) NOT NULL DEFAULT '0' COMMENT '使用次数' ,
 PRIMARY KEY (`pid`),
 UNIQUE `name` (`name`),
 FOREIGN KEY (`uid`) REFERENCES `user`(`uid`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci COMMENT = '图片表';

-- 创建图片评论表
CREATE TABLE `pic_comment` (
 `cid` INT(10) NOT NULL AUTO_INCREMENT COMMENT '评论ID' ,
 `pid` INT(10) NOT NULL COMMENT '图片ID' ,
 `attitude` INT(1) NOT NULL COMMENT '态度(赞/踩)' ,
 `uid` int(10) NOT NULL DEFAULT '0' COMMENT '评论者' ,
 `comment` VARCHAR(255) NOT NULL COMMENT '评论' ,
 `comm_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间' ,
 PRIMARY KEY (`cid`),
 FOREIGN KEY (`pid`) REFERENCES `picture`(`pid`),
 FOREIGN KEY (`uid`) REFERENCES `user`(`uid`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci COMMENT = '图片评论表';

-- 创建图片别名表
CREATE TABLE `pic_nickname` (
 `nid` INT(10) NOT NULL AUTO_INCREMENT COMMENT '别名对照ID' ,
 `pid` INT(10) NOT NULL COMMENT '图片ID' ,
 `nickname` VARCHAR(20) NOT NULL COMMENT '图片别名' ,
 PRIMARY KEY (`nid`),
 FOREIGN KEY (`pid`) REFERENCES `picture`(`pid`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci COMMENT = '图片别名表';

-- 创建图片类型表
CREATE TABLE `pic_type` (
 `tid` INT(10) NOT NULL AUTO_INCREMENT COMMENT '分类ID' ,
 `pid` INT(10) NOT NULL COMMENT '图片ID' ,
 `type_name` VARCHAR(20) NOT NULL COMMENT '分类' ,
 PRIMARY KEY (`tid`),
 FOREIGN KEY (`pid`) REFERENCES `picture`(`pid`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci COMMENT = '图片类型表';