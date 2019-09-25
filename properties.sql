/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : springcloud

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2019-09-24 14:52:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for properties
-- ----------------------------
DROP TABLE IF EXISTS `properties`;
CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `key` varchar(50) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `application` varchar(50) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `profile` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of properties
-- ----------------------------
INSERT INTO `properties` VALUES ('1', 'bar', 'db3-value', 'samplebackendservice', 'master', 'default');
INSERT INTO `properties` VALUES ('2', 'foo', 'db3-value', 'samplebackendservice', 'master', 'default');
