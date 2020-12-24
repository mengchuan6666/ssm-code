/*
Navicat MySQL Data Transfer

Source Server         : tests
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : laboratory

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-11-19 16:22:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_brand`
-- ----------------------------
DROP TABLE IF EXISTS `t_brand`;
CREATE TABLE `t_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isDelete` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `Category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_893pccjfcvay83qhve9xo2tcm` (`Category_id`),
  CONSTRAINT `FK_893pccjfcvay83qhve9xo2tcm` FOREIGN KEY (`Category_id`) REFERENCES `t_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_brand
-- ----------------------------

-- ----------------------------
-- Table structure for `t_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isDelete` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------

-- ----------------------------
-- Table structure for `t_equipment`
-- ----------------------------
DROP TABLE IF EXISTS `t_equipment`;
CREATE TABLE `t_equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bz` varchar(255) DEFAULT NULL,
  `isBx` int(11) NOT NULL DEFAULT '0',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `jg` double DEFAULT NULL,
  `sbxlh` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `xh` varchar(255) DEFAULT NULL,
  `zzs` varchar(255) DEFAULT NULL,
  `Laboratory_id` int(11) DEFAULT NULL,
  `fwTime` datetime DEFAULT NULL,
  `ht` varchar(255) DEFAULT NULL,
  `isFw` int(11) NOT NULL DEFAULT '0',
  `photo` varchar(255) DEFAULT NULL,
  `bxLogid` int(11) DEFAULT NULL,
  `isJy` int(11) NOT NULL DEFAULT '0',
  `jyId` int(11) DEFAULT NULL,
  `JyUser_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4gbru41steogqjjxhx0d8nnci` (`Laboratory_id`),
  KEY `FK_hklhbo0lr2su1yo1w1ott8d2s` (`JyUser_id`),
  CONSTRAINT `FK_hklhbo0lr2su1yo1w1ott8d2s` FOREIGN KEY (`JyUser_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_4gbru41steogqjjxhx0d8nnci` FOREIGN KEY (`Laboratory_id`) REFERENCES `t_laboratory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_equipment
-- ----------------------------
INSERT INTO `t_equipment` VALUES ('1', '11', '0', '0', '11', '11', null, '测试', '11', '6', '2016-11-17 09:32:29', '\\upload\\75b40810ad5f11e6779fd863d0b032aa实时位置和轨迹接口.doc', '1', '\\upload\\63cfd790ad6011e6779fd863d0b032aa13.jpg', '9', '1', '9', '6');
INSERT INTO `t_equipment` VALUES ('2', '22', '0', '0', '222', '22', null, '222', '22', '7', '2016-11-17 09:58:57', '\\upload\\fe25ef90ae2911e6f233742beffe859a实验室设备管理系统详细功能.docx', '1', '\\upload\\20b2c030ad6011e6779fd863d0b032aa9.jpg', '7', '0', '11', '1');
INSERT INTO `t_equipment` VALUES ('3', '33', '0', '0', '33', '33', null, '33', '33', '5', '2016-11-17 09:59:23', null, '1', '\\upload\\1e96d640ae2a11e6f233742beffe859a9.jpg', null, '1', '12', '6');
INSERT INTO `t_equipment` VALUES ('4', '44', '0', '0', '44', '44', null, '44', '44', '5', '2016-11-17 09:27:33', null, '1', null, null, '0', '10', '4');
INSERT INTO `t_equipment` VALUES ('5', '55', '0', '0', '55', '55', null, '55', '55', '6', '2016-11-19 15:30:34', null, '1', null, null, '0', null, null);
INSERT INTO `t_equipment` VALUES ('6', '66', '0', '0', '666', '66', null, '666', '666', '6', null, null, '0', null, null, '0', null, null);
INSERT INTO `t_equipment` VALUES ('7', '77', '0', '0', '77', '77', null, '777', '77', '3', null, null, '0', null, null, '0', null, null);
INSERT INTO `t_equipment` VALUES ('8', '88', '0', '0', '88', '88', null, '88', '88', '4', '2016-11-19 16:11:48', null, '1', null, null, '0', null, null);
INSERT INTO `t_equipment` VALUES ('9', '99', '0', '1', '99', '99', null, '99', '99', '7', null, null, '0', null, null, '0', null, null);
INSERT INTO `t_equipment` VALUES ('10', '333', '0', '0', '222', '333', null, '测试测试', '测试测试', '9', '2016-11-19 15:31:11', null, '1', null, null, '0', null, null);
INSERT INTO `t_equipment` VALUES ('11', '实验室管理测试', '0', '0', '11', '222', null, '实验室管理测试', '实验室管理测试', '10', '2016-11-19 15:47:05', '\\upload\\63ae2510ae2c11e6be0c12c967dbb02e实验室设备管理系统详细功能.docx', '1', '\\upload\\7fc8a9f0ae2c11e6be0c12c967dbb02e1.jpg', null, '0', null, null);

-- ----------------------------
-- Table structure for `t_equipmentlog`
-- ----------------------------
DROP TABLE IF EXISTS `t_equipmentlog`;
CREATE TABLE `t_equipmentlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `endTime` datetime DEFAULT NULL,
  `isYy` int(11) NOT NULL DEFAULT '0',
  `qx` tinyblob,
  `time` datetime DEFAULT NULL,
  `user` tinyblob,
  `Equipment_id` int(11) DEFAULT NULL,
  `qx_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_aj076up5mm5gyl3q97bl2if78` (`Equipment_id`),
  KEY `FK_a4m6nesgv6t398u3r2dd2o0w0` (`qx_id`),
  KEY `FK_lmr7ywifxyrrkc3xj24hm8l6f` (`user_id`),
  CONSTRAINT `FK_lmr7ywifxyrrkc3xj24hm8l6f` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_a4m6nesgv6t398u3r2dd2o0w0` FOREIGN KEY (`qx_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_aj076up5mm5gyl3q97bl2if78` FOREIGN KEY (`Equipment_id`) REFERENCES `t_equipment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_equipmentlog
-- ----------------------------
INSERT INTO `t_equipmentlog` VALUES ('6', '2016-11-19 11:55:38', '0', null, '2016-11-19 11:55:22', null, '1', '1', '1');
INSERT INTO `t_equipmentlog` VALUES ('7', '2016-11-19 11:56:02', '0', null, '2016-11-19 11:55:45', null, '1', '7', '7');
INSERT INTO `t_equipmentlog` VALUES ('8', '2016-11-19 11:58:11', '0', null, '2016-11-19 11:58:00', null, '1', '1', '1');
INSERT INTO `t_equipmentlog` VALUES ('9', null, '0', null, '2016-11-19 15:11:21', null, '1', null, '6');
INSERT INTO `t_equipmentlog` VALUES ('10', '2016-11-19 15:32:57', '0', null, '2016-11-19 15:32:52', null, '4', '4', '4');
INSERT INTO `t_equipmentlog` VALUES ('11', '2016-11-19 15:48:57', '0', null, '2016-11-19 15:48:54', null, '2', '1', '1');
INSERT INTO `t_equipmentlog` VALUES ('12', null, '0', null, '2016-11-19 15:49:02', null, '3', null, '6');

-- ----------------------------
-- Table structure for `t_introduction`
-- ----------------------------
DROP TABLE IF EXISTS `t_introduction`;
CREATE TABLE `t_introduction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gg` varchar(255) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_introduction
-- ----------------------------

-- ----------------------------
-- Table structure for `t_laboratory`
-- ----------------------------
DROP TABLE IF EXISTS `t_laboratory`;
CREATE TABLE `t_laboratory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `bz` varchar(255) DEFAULT NULL,
  `fzr` varchar(255) DEFAULT NULL,
  `fzrDh` varchar(255) DEFAULT NULL,
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `isYy` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `laboratoryLogId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_oiwbrfnohrp1gwe00ly8rb5vg` (`user_id`),
  CONSTRAINT `FK_oiwbrfnohrp1gwe00ly8rb5vg` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_laboratory
-- ----------------------------
INSERT INTO `t_laboratory` VALUES ('1', '1', '1', '1', '1', '0', '1', '1', '2016-11-14 16:25:51', '6', '13');
INSERT INTO `t_laboratory` VALUES ('2', '2', '2222', '2', '2', '0', '1', '2', '2016-11-14 16:29:32', '1', '14');
INSERT INTO `t_laboratory` VALUES ('3', '3', '3', '3', '3', '0', '0', '3', '2016-11-14 16:29:43', null, null);
INSERT INTO `t_laboratory` VALUES ('4', '4', '4', '4', '4', '0', '0', '4', '2016-11-14 16:29:50', null, null);
INSERT INTO `t_laboratory` VALUES ('5', '555', '555', '555', '555', '0', '0', '555', '2016-11-14 16:29:57', null, null);
INSERT INTO `t_laboratory` VALUES ('6', '6', '6', '6', '6', '0', '0', '9999', '2016-11-15 09:00:49', null, null);
INSERT INTO `t_laboratory` VALUES ('7', 'aaa', 'aaa', 'aa', 'aa', '1', '0', 'hhhh', '2016-11-15 13:02:11', null, null);
INSERT INTO `t_laboratory` VALUES ('8', null, '', null, null, '1', '0', null, '2016-11-15 17:17:41', null, null);
INSERT INTO `t_laboratory` VALUES ('9', '测试测试', '测试测试', '测试测试', '11111111111', '0', '0', '测试测试', '2016-11-19 15:28:33', null, null);
INSERT INTO `t_laboratory` VALUES ('10', '实验室管理测试', '实验室管理测试', '实验室管理测试', '11111111111', '0', '0', '实验室管理测试', '2016-11-19 15:45:35', null, '15');

-- ----------------------------
-- Table structure for `t_laboratorylog`
-- ----------------------------
DROP TABLE IF EXISTS `t_laboratorylog`;
CREATE TABLE `t_laboratorylog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isYy` int(11) NOT NULL DEFAULT '0',
  `time` datetime DEFAULT NULL,
  `laboratory_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `userQx_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bflao1s1awsf0h4jtycc2xgky` (`laboratory_id`),
  KEY `FK_of6onusgky4n43a3fjpjvd1xf` (`user_id`),
  KEY `FK_1v21erw5dwhs38nqj5h452fpa` (`userQx_id`),
  CONSTRAINT `FK_1v21erw5dwhs38nqj5h452fpa` FOREIGN KEY (`userQx_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_bflao1s1awsf0h4jtycc2xgky` FOREIGN KEY (`laboratory_id`) REFERENCES `t_laboratory` (`id`),
  CONSTRAINT `FK_of6onusgky4n43a3fjpjvd1xf` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_laboratorylog
-- ----------------------------
INSERT INTO `t_laboratorylog` VALUES ('7', '0', '2016-11-19 10:24:18', '1', '1', '2016-11-19 10:24:21', '1');
INSERT INTO `t_laboratorylog` VALUES ('8', '0', '2016-11-19 10:35:41', '1', '1', '2016-11-19 10:35:44', '1');
INSERT INTO `t_laboratorylog` VALUES ('9', '0', '2016-11-19 10:38:06', '1', '1', '2016-11-19 10:38:14', '7');
INSERT INTO `t_laboratorylog` VALUES ('10', '0', '2016-11-19 10:39:06', '1', '1', '2016-11-19 10:42:44', '1');
INSERT INTO `t_laboratorylog` VALUES ('11', '0', '2016-11-19 10:53:41', '1', '1', '2016-11-19 15:13:55', '1');
INSERT INTO `t_laboratorylog` VALUES ('12', '0', '2016-11-19 15:11:09', '2', '6', '2016-11-19 15:13:44', '6');
INSERT INTO `t_laboratorylog` VALUES ('13', '0', '2016-11-19 15:14:44', '1', '6', null, null);
INSERT INTO `t_laboratorylog` VALUES ('14', '0', '2016-11-19 15:28:52', '2', '1', null, null);
INSERT INTO `t_laboratorylog` VALUES ('15', '0', '2016-11-19 15:46:04', '10', '6', '2016-11-19 15:46:19', '6');

-- ----------------------------
-- Table structure for `t_message`
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` varchar(255) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `User_Fsr` int(11) DEFAULT NULL,
  `User_Jsr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_oa4mv5qj0sqj0we556035uujp` (`User_Fsr`),
  KEY `FK_f8e6w63qcqq7ovck9p24tarfn` (`User_Jsr`),
  CONSTRAINT `FK_f8e6w63qcqq7ovck9p24tarfn` FOREIGN KEY (`User_Jsr`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_oa4mv5qj0sqj0we556035uujp` FOREIGN KEY (`User_Fsr`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message
-- ----------------------------

-- ----------------------------
-- Table structure for `t_photo`
-- ----------------------------
DROP TABLE IF EXISTS `t_photo`;
CREATE TABLE `t_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `fileName1` varchar(255) DEFAULT NULL,
  `fileName2` varchar(255) DEFAULT NULL,
  `fileName3` varchar(255) DEFAULT NULL,
  `fileName4` varchar(255) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  `jg` double NOT NULL,
  `js` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_auktpin78v83k3m853icf84pc` (`brand_id`),
  KEY `FK_2d9pnn6ktk352aa8dc7fjqgfv` (`category_id`),
  KEY `FK_pk1m1dnqq1ehyv197nf76moa3` (`user_id`),
  CONSTRAINT `FK_2d9pnn6ktk352aa8dc7fjqgfv` FOREIGN KEY (`category_id`) REFERENCES `t_category` (`id`),
  CONSTRAINT `FK_auktpin78v83k3m853icf84pc` FOREIGN KEY (`brand_id`) REFERENCES `t_brand` (`id`),
  CONSTRAINT `FK_pk1m1dnqq1ehyv197nf76moa3` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_photo
-- ----------------------------

-- ----------------------------
-- Table structure for `t_purchase`
-- ----------------------------
DROP TABLE IF EXISTS `t_purchase`;
CREATE TABLE `t_purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  `money` double NOT NULL,
  `price` double NOT NULL,
  `time` datetime DEFAULT NULL,
  `photo_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mk4hqspsn92mxmjoqydy99pla` (`photo_id`),
  KEY `FK_207dkr7b4an3av28b483722kt` (`user_id`),
  CONSTRAINT `FK_207dkr7b4an3av28b483722kt` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_mk4hqspsn92mxmjoqydy99pla` FOREIGN KEY (`photo_id`) REFERENCES `t_photo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_purchase
-- ----------------------------

-- ----------------------------
-- Table structure for `t_repairlog`
-- ----------------------------
DROP TABLE IF EXISTS `t_repairlog`;
CREATE TABLE `t_repairlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bxTime` datetime DEFAULT NULL,
  `bz` varchar(255) DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `wz` varchar(255) DEFAULT NULL,
  `Equipment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_awqus26wjn9jwoqdgkpqascpt` (`Equipment_id`),
  CONSTRAINT `FK_awqus26wjn9jwoqdgkpqascpt` FOREIGN KEY (`Equipment_id`) REFERENCES `t_equipment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_repairlog
-- ----------------------------
INSERT INTO `t_repairlog` VALUES ('5', '2016-11-18 15:59:09', '33', '2016-11-18 16:01:16', '0', '33', '33', '1');
INSERT INTO `t_repairlog` VALUES ('6', '2016-11-18 16:33:40', '测试', '2016-11-19 15:32:04', '0', '测试', '测试', '1');
INSERT INTO `t_repairlog` VALUES ('7', '2016-11-18 16:36:00', '33', '2016-11-19 15:32:07', '0', '33', '33', '1');
INSERT INTO `t_repairlog` VALUES ('8', '2016-11-19 15:32:15', '测试测试', '2016-11-19 15:32:28', '0', '测试测试', '测试测试', '10');
INSERT INTO `t_repairlog` VALUES ('9', '2016-11-19 15:48:36', '实验室管理测试', '2016-11-19 15:48:40', '0', '实验室管理测试', '实验室管理测试', '5');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enName` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'admin', '管理员');
INSERT INTO `t_role` VALUES ('2', 'js', '教师');
INSERT INTO `t_role` VALUES ('3', 'xs', '学生');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bj` varchar(255) DEFAULT NULL,
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `isSh` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `xy` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `bz` varchar(255) DEFAULT NULL,
  `fzr` varchar(255) DEFAULT NULL,
  `fzrDh` varchar(255) DEFAULT NULL,
  `isYy` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2qjfg4ive1qmy8ev91c0mwvlm` (`role_id`),
  KEY `FK_1mede137ulc3ntvt2xkxpt7sd` (`user_id`),
  CONSTRAINT `FK_1mede137ulc3ntvt2xkxpt7sd` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_2qjfg4ive1qmy8ev91c0mwvlm` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '0', '0', '1', 'admin', '0', '111111', '0', '实验室管教1', '2016-11-14 15:23:32', '0', '1', null, null, null, null, '0', null);
INSERT INTO `t_user` VALUES ('4', '111', '0', '1', 'xs', '1', '111111', '17913863545', '学生11', '2016-11-15 14:03:11', '13333', '3', null, null, null, null, '0', null);
INSERT INTO `t_user` VALUES ('6', '11', '0', '1', 'js', '1', '111111', '17913863545', '教师', '2016-11-15 14:28:32', '1', '2', null, null, null, null, '0', null);
INSERT INTO `t_user` VALUES ('7', '0', '0', '1', 'admin1', '0', '111111', '0', '管理员2', null, null, '1', null, null, null, null, '0', null);
INSERT INTO `t_user` VALUES ('8', '11', '0', '1', 'abc', 'abc', '111111', '17913863545', 'abc', '2016-11-19 15:44:41', '11', '3', null, null, null, null, '0', null);
