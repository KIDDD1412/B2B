/*
 Navicat Premium Data Transfer

 Source Server         : jdbc
 Source Server Type    : MySQL
 Source Server Version : 80200 (8.2.0)
 Source Host           : localhost:3306
 Source Schema         : b2b

 Target Server Type    : MySQL
 Target Server Version : 80200 (8.2.0)
 File Encoding         : 65001

 Date: 13/05/2025 21:07:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cid` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `goods_id` int NOT NULL,
  `shoppingnum` int NOT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `bid`(`user_id` ASC) USING BTREE,
  INDEX `gno`(`goods_id` ASC) USING BTREE,
  CONSTRAINT `bid` FOREIGN KEY (`user_id`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `gno` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`gid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (11, 6, 10, 6);
INSERT INTO `cart` VALUES (12, 9, 10, 1);
INSERT INTO `cart` VALUES (13, 2, 18, 4);
INSERT INTO `cart` VALUES (15, 2, 12, 1);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `gid` int NOT NULL AUTO_INCREMENT,
  `gname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gprice` double(10, 2) NULL DEFAULT NULL,
  `gintroduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gpicture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sellerId` int NULL DEFAULT NULL,
  `sid` int NULL DEFAULT NULL,
  `gstatus` int NULL DEFAULT NULL,
  `gamount` int NULL DEFAULT NULL,
  PRIMARY KEY (`gid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (10, '工地原材料', 500.00, '谁来买了工地', '20250512145221736.png', 2, 23, 1, 10000);
INSERT INTO `goods` VALUES (12, '甲方快乐笔', 3.00, '是五彩斑斓的黑色哦', '20250512145231630.jpg', 2, 23, 1, 90000);
INSERT INTO `goods` VALUES (13, '我佛慈杯', 55.00, '功德功德功德功德', '20250512145238269.jpg', 2, 23, 1, 90000);
INSERT INTO `goods` VALUES (14, '大葱明钥匙扣', 20.00, '看上去就很聪明的样子', '20250512145243739.jpg', 2, 23, 1, 90000);
INSERT INTO `goods` VALUES (15, '哈哈杯', 30.00, '没有笑里藏刀的和善杯子', '20240120010805021.jpg', 6, 21, 1, 8000);
INSERT INTO `goods` VALUES (16, '纸雕灯', 70.00, '巨好看巨好看', '20240120010845798.jpg', 6, 21, 1, 500);
INSERT INTO `goods` VALUES (18, '纸笺情愫', 111.00, '111', '20250512145252935.jpg', 2, 23, 1, 1111);
INSERT INTO `goods` VALUES (20, '羽绒服', 998.00, '北面羽绒服大甩卖', '20250512145258358.png', 2, 23, 1, 3);
INSERT INTO `goods` VALUES (21, '篮球鞋', 988.00, '限量篮球鞋', '20250512145014319.png', 2, 23, 1, 3);

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `mid` int NOT NULL AUTO_INCREMENT,
  `mname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mpassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES (1, 'Ash', '1717');
INSERT INTO `manager` VALUES (2, 'Hjx', '2121');
INSERT INTO `manager` VALUES (3, 'admin', 'admin');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `fromid` int NULL DEFAULT NULL,
  `toid` int NULL DEFAULT NULL,
  `context` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (2, 5, '2to5', '1', '2025-03-12 23:59:38');
INSERT INTO `message` VALUES (2, 3, '2to3', '1', '2025-03-12 23:59:38');
INSERT INTO `message` VALUES (2, 4, '2to4', '1', '2025-03-12 23:59:38');
INSERT INTO `message` VALUES (4, 2, '4to2', '1', '2025-03-12 23:59:38');
INSERT INTO `message` VALUES (2, 2, '不可以再便宜了', '1', '2025-03-18 01:07:55');
INSERT INTO `message` VALUES (6, 2, '66给33发的', '1', '2025-03-18 16:05:07');
INSERT INTO `message` VALUES (2, 6, '66你好，但是我是22哎，你好像发错了', '1', '2025-03-19 16:30:41');
INSERT INTO `message` VALUES (2, 4, '44你好，我知道你是44了', '1', '2025-03-19 17:02:25');
INSERT INTO `message` VALUES (2, 6, '所以66你要在我这里买东西吗？', '1', '2025-03-19 17:02:42');
INSERT INTO `message` VALUES (2, 6, '买吗买吗买吗买吗买吗？', '1', '2025-03-19 17:03:03');
INSERT INTO `message` VALUES (7, 2, '你好，工地原材料', '1', '2025-03-19 18:09:07');
INSERT INTO `message` VALUES (6, 2, '我佛慈杯，真的加功德吗？', '1', '2025-03-20 01:15:29');
INSERT INTO `message` VALUES (2, 6, '加的呢，亲，心诚则灵', '1', '2025-03-20 01:17:33');
INSERT INTO `message` VALUES (6, 2, '', '1', '2025-03-20 13:08:18');
INSERT INTO `message` VALUES (6, 2, '', '1', '2025-03-20 13:08:20');
INSERT INTO `message` VALUES (6, 2, '你好', '1', '2025-03-20 13:41:03');
INSERT INTO `message` VALUES (2, 6, 'keyi', '1', '2025-03-20 14:28:07');
INSERT INTO `message` VALUES (2, 6, '', '1', '2025-03-20 14:35:55');
INSERT INTO `message` VALUES (2, 6, 'new message', '1', '2025-05-12 13:17:56');

-- ----------------------------
-- Table structure for orderhistory
-- ----------------------------
DROP TABLE IF EXISTS `orderhistory`;
CREATE TABLE `orderhistory`  (
  `oid` int NULL DEFAULT NULL,
  `gid` int NULL DEFAULT NULL,
  `gamount` int NULL DEFAULT NULL,
  `gprice` double NULL DEFAULT NULL,
  `oprice` double NULL DEFAULT NULL,
  `sid` int NULL DEFAULT NULL,
  `bid` int NULL DEFAULT NULL,
  `contract` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `oversion` int NULL DEFAULT NULL,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderhistory
-- ----------------------------
INSERT INTO `orderhistory` VALUES (2, 2, 10, 2880, 26000, 2, 1, 'd.docx', 1, '2025-03-09 23:57:02');
INSERT INTO `orderhistory` VALUES (4, 5, 100, 35, 3000, 2, 6, 'c.docx', 1, '2025-03-18 14:55:37');
INSERT INTO `orderhistory` VALUES (4, 5, 100, 35, 2800, 2, 6, '6_2_2_', 2, '2025-03-18 20:54:30');
INSERT INTO `orderhistory` VALUES (43, 8, 8, 23, 160, 2, 6, '6_2_0_报错.docx', 1, '2025-03-18 19:58:47');
INSERT INTO `orderhistory` VALUES (43, 8, 8, 23, 160, 2, 6, '6_2_2_报错.docx', 2, '2025-03-18 21:16:22');
INSERT INTO `orderhistory` VALUES (44, 8, 10, 23, 200, 2, 6, 'aaaa.docx', 1, '2025-03-18 20:20:23');
INSERT INTO `orderhistory` VALUES (53, 8, 3, 23, 50, 2, 6, '6_2_0_神秘水杯合同.docx', 1, '2024-03-18 22:47:09');
INSERT INTO `orderhistory` VALUES (68, 123, 123, 123, 123, 2, 123, '123_2_0_郑超+202103150329.doc', 1, '2025-05-12 14:42:05');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` int NOT NULL AUTO_INCREMENT,
  `gid` int NULL DEFAULT NULL,
  `gamount` int NULL DEFAULT NULL,
  `gprice` double NULL DEFAULT NULL,
  `oprice` double NULL DEFAULT NULL,
  `sid` int NULL DEFAULT NULL,
  `bid` int NULL DEFAULT NULL,
  `contract` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `oversion` int UNSIGNED NULL DEFAULT NULL,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 1, 10, 998, 9000, 1, 2, 'c.docx', 1, '2025-03-15 23:57:02', 4);
INSERT INTO `orders` VALUES (2, 2, 10, 2880, 26000, 2, 1, '1_2_2_', 2, '2025-03-18 16:07:49', 1);
INSERT INTO `orders` VALUES (3, 5, 30, 35, 9000, 6, 7, 'c.docx', 1, '2025-03-19 19:28:09', 1);
INSERT INTO `orders` VALUES (4, 5, 100, 35, 2700, 6, 7, '6_2_3_', 3, '2025-03-20 01:35:57', 1);
INSERT INTO `orders` VALUES (5, 5, 50, 35, 1500, 2, 6, 'c.docx', 1, '2025-05-12 13:02:02', 3);
INSERT INTO `orders` VALUES (6, 5, 60, 35, 1800, 2, 6, 'c.docx', 1, '2025-04-18 12:53:16', 1);
INSERT INTO `orders` VALUES (7, 5, 200, 32, 6000, 2, 6, 'c.docx', 1, '2025-03-19 18:56:15', 1);
INSERT INTO `orders` VALUES (51, 12, 12, 12, 12, 2, 6, '12_2_0_aaaa.docx', 1, '2025-03-18 22:32:06', 2);
INSERT INTO `orders` VALUES (52, 21, 21, 21, 21, 2, 6, '21_2_0_aaaa.docx', 1, '2025-03-20 14:30:06', 4);
INSERT INTO `orders` VALUES (53, 8, 3, 23, 50, 2, 6, '6_2_2_cups.docx', 2, '2025-03-18 23:08:10', 4);
INSERT INTO `orders` VALUES (60, 10, 10, 10, 10, 6, 2, '2_6_0_aaaa.docx', 1, '2025-03-20 14:29:50', 1);
INSERT INTO `orders` VALUES (61, 16, 10, 70, 600, 2, 2, '2_2_0_cups.docx', 1, '2025-04-18 10:55:19', 1);
INSERT INTO `orders` VALUES (67, 11, 12, 121, 212, 2, 3, '3_2_0_xx合同.docx', 1, '2025-05-12 14:34:35', 0);
INSERT INTO `orders` VALUES (68, 123, 123, 123, 123, 2, 123, '123_2_2_xx合同.docx', 2, '2025-05-12 14:42:40', 0);

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store`  (
  `sid` int NOT NULL AUTO_INCREMENT,
  `sname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sellID` int NULL DEFAULT NULL,
  `sstatus` int NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES (2, '三三店', 3, 1);
INSERT INTO `store` VALUES (21, '文艺小六', 6, 1);
INSERT INTO `store` VALUES (23, '万有铺子（重生版）', 2, 1);
INSERT INTO `store` VALUES (24, '长江边上的7号铺子', 7, 0);

-- ----------------------------
-- Table structure for trade
-- ----------------------------
DROP TABLE IF EXISTS `trade`;
CREATE TABLE `trade`  (
  `tid` int NOT NULL AUTO_INCREMENT,
  `account_in` int NOT NULL,
  `account_out` int NOT NULL,
  `order_id` int NOT NULL,
  `date` datetime NOT NULL,
  `amount` double NULL DEFAULT NULL,
  PRIMARY KEY (`tid`) USING BTREE,
  INDEX `account_in_id`(`account_in` ASC) USING BTREE,
  INDEX `account_out_id`(`account_out` ASC) USING BTREE,
  INDEX `orderid`(`order_id` ASC) USING BTREE,
  CONSTRAINT `account_in_id` FOREIGN KEY (`account_in`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_out_id` FOREIGN KEY (`account_out`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orderid` FOREIGN KEY (`order_id`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of trade
-- ----------------------------
INSERT INTO `trade` VALUES (1, 1, 2, 1, '2025-03-10 23:57:02', 998);
INSERT INTO `trade` VALUES (6, 2, 6, 6, '2025-03-11 22:54:53', 1800);
INSERT INTO `trade` VALUES (11, 2, 6, 7, '2025-03-18 17:09:44', 6000);
INSERT INTO `trade` VALUES (12, 2, 6, 53, '2025-03-18 22:53:24', 50);
INSERT INTO `trade` VALUES (13, 2, 6, 4, '2025-03-19 18:46:45', 2700);
INSERT INTO `trade` VALUES (14, 2, 6, 7, '2025-03-19 18:56:15', 6000);
INSERT INTO `trade` VALUES (15, 2, 6, 5, '2025-01-20 14:29:56', 1500);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `upassword` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `uidcard` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ubalance` double NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', '12345', 20000);
INSERT INTO `user` VALUES (2, '22', '22', '202122', 40300);
INSERT INTO `user` VALUES (3, '33', '33', '202133', 1500);
INSERT INTO `user` VALUES (4, '44', '44', '202144', 20000);
INSERT INTO `user` VALUES (5, '55', '55', '202155', 30000);
INSERT INTO `user` VALUES (6, '66', '66', '202166', 100200);
INSERT INTO `user` VALUES (9, '77', '77', '202177', 143);
INSERT INTO `user` VALUES (10, '88', '88', '202188', NULL);
INSERT INTO `user` VALUES (11, '1412', '1412', '1412', NULL);

-- ----------------------------
-- Table structure for user_browse
-- ----------------------------
DROP TABLE IF EXISTS `user_browse`;
CREATE TABLE `user_browse`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `gid` int NOT NULL,
  `browse_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_browse
-- ----------------------------
INSERT INTO `user_browse` VALUES (1, 2, 21, '2025-05-13 17:13:16');

-- ----------------------------
-- Table structure for user_purchase
-- ----------------------------
DROP TABLE IF EXISTS `user_purchase`;
CREATE TABLE `user_purchase`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `gid` int NOT NULL,
  `purchase_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_purchase
-- ----------------------------

-- ----------------------------
-- View structure for messagewithname
-- ----------------------------
DROP VIEW IF EXISTS `messagewithname`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `messagewithname` AS select `message`.`fromid` AS `fromid`,`u2`.`uname` AS `fromname`,`message`.`toid` AS `toid`,`u1`.`uname` AS `toname`,`message`.`context` AS `context`,`message`.`time` AS `time`,`message`.`type` AS `type` from ((`message` join `user` `u1` on((`message`.`toid` = `u1`.`uid`))) join `user` `u2` on((`message`.`fromid` = `u2`.`uid`)));

SET FOREIGN_KEY_CHECKS = 1;
