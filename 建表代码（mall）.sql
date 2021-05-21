/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : mall

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 27/11/2020 11:46:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_cart`;
CREATE TABLE `t_cart`  (
  `cartid` int(11) NOT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `proid` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `checked` int(11) NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updatetime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`cartid`) USING BTREE,
  INDEX `proid`(`proid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  CONSTRAINT `t_cart_ibfk_2` FOREIGN KEY (`proid`) REFERENCES `t_product` (`proid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_cart_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `t_user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cart
-- ----------------------------

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `cateid` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updatetime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`cateid`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES (1, 0, '家电', '家用电器', '2020-11-24 10:40:34', '2020-11-27 09:37:52');
INSERT INTO `t_category` VALUES (2, 0, '手机数码', NULL, '2020-11-24 10:41:19', '2020-11-24 10:41:19');
INSERT INTO `t_category` VALUES (3, 0, '电脑办公', '用来办公的电脑及相关产品', '2020-11-24 10:41:35', '2020-11-27 09:21:52');
INSERT INTO `t_category` VALUES (4, 0, '书籍', '1111', '2020-11-24 10:41:46', '2020-11-27 11:36:16');
INSERT INTO `t_category` VALUES (5, 1, '冰箱', NULL, '2020-11-24 12:37:47', '2020-11-24 12:37:47');
INSERT INTO `t_category` VALUES (10, 4, '科幻小说', NULL, '2020-11-24 14:23:30', '2020-11-24 14:23:30');
INSERT INTO `t_category` VALUES (11, 1, '电饭煲', NULL, '2020-11-26 09:40:18', '2020-11-26 09:40:42');
INSERT INTO `t_category` VALUES (12, 1, '空调', NULL, '2020-11-26 09:40:40', '2020-11-26 09:40:45');
INSERT INTO `t_category` VALUES (13, 2, '华为', NULL, '2020-11-26 09:47:23', '2020-11-26 09:52:34');
INSERT INTO `t_category` VALUES (14, 2, '苹果', NULL, '2020-11-26 09:47:48', '2020-11-26 09:52:39');
INSERT INTO `t_category` VALUES (15, 2, '小米', NULL, '2020-11-26 09:48:10', '2020-11-26 09:52:41');
INSERT INTO `t_category` VALUES (16, 3, '轻薄本', NULL, '2020-11-26 09:50:57', '2020-11-26 09:53:01');
INSERT INTO `t_category` VALUES (17, 3, '游戏本', '性能较高，可用来运行性能要求高的应用程序', '2020-11-26 09:52:07', '2020-11-27 09:22:34');
INSERT INTO `t_category` VALUES (18, 3, '台式机', NULL, '2020-11-26 09:53:37', '2020-11-26 09:53:37');
INSERT INTO `t_category` VALUES (19, 3, '设计师电脑', NULL, '2020-11-26 09:53:57', '2020-11-26 09:53:57');
INSERT INTO `t_category` VALUES (20, 4, '文学小说', NULL, '2020-11-26 09:54:31', '2020-11-26 09:54:31');
INSERT INTO `t_category` VALUES (21, 4, '武功秘籍', NULL, '2020-11-26 10:03:52', '2020-11-26 10:03:52');

-- ----------------------------
-- Table structure for t_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
INSERT INTO `t_manager` VALUES (1, 'masterma', '69', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkYXRlIjoxNjA2NDQ4MTE0LCJ1c2VybmFtZSI6Im1hc3Rlcm1hIn0.F68RW3XFaDnzggcDnDh0wKllqvli6xwl6XsDY3kD2eU');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `orderid` int(11) NOT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `shoppingid` int(11) NULL DEFAULT NULL,
  `payment` decimal(20, 2) NULL DEFAULT NULL,
  `paymenttype` int(11) NULL DEFAULT NULL,
  `postage` decimal(20, 2) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `paymenttime` timestamp(0) NULL DEFAULT NULL,
  `sendtime` timestamp(0) NULL DEFAULT NULL,
  `endtime` timestamp(0) NULL DEFAULT NULL,
  `closetime` timestamp(0) NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updatetime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitem`;
CREATE TABLE `t_orderitem`  (
  `id` int(11) NOT NULL,
  `orderid` int(11) NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `proid` int(11) NULL DEFAULT NULL,
  `proname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `proimage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `currentunitprice` decimal(20, 2) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `totalprice` decimal(20, 2) NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updatetime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orderid`(`orderid`) USING BTREE,
  INDEX `proid`(`proid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  CONSTRAINT `t_orderitem_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `t_order` (`orderid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_orderitem_ibfk_3` FOREIGN KEY (`proid`) REFERENCES `t_product` (`proid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_orderitem_ibfk_4` FOREIGN KEY (`userid`) REFERENCES `t_user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_orderitem
-- ----------------------------

-- ----------------------------
-- Table structure for t_payinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_payinfo`;
CREATE TABLE `t_payinfo`  (
  `payid` int(11) NOT NULL,
  `orderid` int(11) NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `payplatform` int(11) NULL DEFAULT NULL,
  `platformnumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `platformstatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updatetime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`payid`) USING BTREE,
  INDEX `orderid`(`orderid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  CONSTRAINT `t_payinfo_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `t_order` (`orderid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_payinfo_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `t_user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_payinfo
-- ----------------------------

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product`  (
  `proid` int(11) NOT NULL AUTO_INCREMENT,
  `cateid` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mainimage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `price` decimal(20, 2) NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 1,
  `createtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updatetime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`proid`) USING BTREE,
  INDEX `cateid`(`cateid`) USING BTREE,
  CONSTRAINT `t_product_ibfk_1` FOREIGN KEY (`cateid`) REFERENCES `t_category` (`cateid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES (3, 21, '混元功法秘籍', '/static/images/aa64034f78f0f736c40effdc0c55b319eac4137e.jpg', '耗子尾汁', 100000.00, 100, 1, '2020-11-25 10:07:55', '2020-11-26 18:59:47');
INSERT INTO `t_product` VALUES (4, 21, '闪电五连鞭高阶技巧', '/static/images/aa64034f78f0f736c40effdc0c55b319eac4318e.jpg', '现在，我们来打一个连五鞭哈', 100000.00, 50, 1, '2020-11-25 10:09:48', '2020-11-27 09:35:36');
INSERT INTO `t_product` VALUES (6, 12, '美的空调', '/static/images/42166d224f4a20a4021ad69687529822720ed05f.jpg', '冷得要死', 1999.99, 33, 1, '2020-11-25 11:57:24', '2020-11-27 09:39:11');
INSERT INTO `t_product` VALUES (7, 21, '金刚大捣锤秘籍', '/static/images/u=1881275866,1045518049&fm=26&gp=0.jpg', '一锤下去', 100000.00, 30, 1, '2020-11-25 14:29:52', '2020-11-27 09:35:37');
INSERT INTO `t_product` VALUES (8, 11, '某品牌电饭煲', '/static/images/42166d224f4a20a4021ad6968752983525nnf.jpg', '', 300.00, 40, 1, '2020-11-26 10:02:12', '2020-11-27 09:35:38');
INSERT INTO `t_product` VALUES (9, 15, '红米 Redmi 9', '/static/images/64380cd7912397dd48e7de6f5682b2b252fba.jpg', '', 2000.00, 100, 1, '2020-11-26 10:02:24', '2020-11-27 09:35:39');
INSERT INTO `t_product` VALUES (10, 14, 'iPhone 12 Max', '/static/images/436346u7dd48e7de6f5682b2b252fba.jpg', '', 9999.00, 100, 1, '2020-11-26 10:02:55', '2020-11-27 09:35:39');
INSERT INTO `t_product` VALUES (11, 16, '联想 小新Air 15', '/static/images/8896897687dd48e7de6f5682b2b252fba.jpg', '', 5199.00, 66, 1, '2020-11-26 10:08:31', '2020-11-27 09:35:40');
INSERT INTO `t_product` VALUES (12, 17, '红米 Redmi G', '/static/images/68cce93a21a2880ff42c20d199f690b.jpg', '', 4999.00, 77, 1, '2020-11-26 10:09:51', '2020-11-27 09:35:41');
INSERT INTO `t_product` VALUES (13, 10, '三体', '/static/images/u=2293315685,1001386756&fm=26&gp=0.jpg', '', 100.00, 1000, 1, '2020-11-26 11:29:01', '2020-11-27 09:35:41');
INSERT INTO `t_product` VALUES (14, 21, '尚济形意拳练法打法实践', '/static/images/b45a17e161df28c79c2a04d65edf5f5.jpg', '学完挑战泰拳拳王', 100000.00, NULL, 1, '2020-11-26 15:21:15', '2020-11-27 09:35:43');
INSERT INTO `t_product` VALUES (24, 14, 'iPhone1000', '/static/images/d4420fa96592420e9e1ebdd91836f42c.jpeg', '三防手机，防身利器', 100000.00, 1, 1, '2020-11-27 09:32:10', '2020-11-27 09:32:10');
INSERT INTO `t_product` VALUES (25, 16, '惠普电脑', '/static/images/53f78e4d981143e8a81ba0515fc14b7c.png', '10000', 1000.00, 100, 1, '2020-11-27 11:37:55', '2020-11-27 11:37:55');

-- ----------------------------
-- Table structure for t_shopping
-- ----------------------------
DROP TABLE IF EXISTS `t_shopping`;
CREATE TABLE `t_shopping`  (
  `shoppingid` int(11) NOT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `orderid` int(11) NULL DEFAULT NULL,
  `receivername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `receiverphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `receiverprovince` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `receivercity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `receiverdistrict` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `receiveraddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updatetime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`shoppingid`) USING BTREE,
  INDEX `orderid`(`orderid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  CONSTRAINT `t_shopping_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `t_order` (`orderid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_shopping_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `t_user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_shopping
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updatetime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `status` int(11) NULL DEFAULT 1,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, '马保国', '123456', '12121212121', '2020-11-23 16:10:34', '2020-11-24 10:02:48', 1, NULL);
INSERT INTO `t_user` VALUES (2, '英国大力士', '222222', '415425345', '2020-11-23 16:16:36', '2020-11-24 11:39:20', 1, NULL);
INSERT INTO `t_user` VALUES (3, '婷婷', '333333', '32131321314', '2020-11-23 16:26:16', '2020-11-25 19:34:25', 1, NULL);
INSERT INTO `t_user` VALUES (4, '源濑氏·佐田', '1111', '99999999999', '2020-11-24 10:01:28', '2020-11-24 10:01:28', 1, NULL);
INSERT INTO `t_user` VALUES (5, '30岁的年轻人', '1111', '99999999999', '2020-11-24 10:01:28', '2020-11-24 10:01:28', 1, NULL);
INSERT INTO `t_user` VALUES (6, '体重80公斤', '1111', '99999999999', '2020-11-24 10:01:28', '2020-11-24 10:01:28', 1, NULL);
INSERT INTO `t_user` VALUES (7, '体重70公斤', '1111', '99999999999', '2020-11-24 10:01:28', '2020-11-24 10:01:28', 1, NULL);
INSERT INTO `t_user` VALUES (8, '左正蹬', '1111', '99999999999', '2020-11-24 10:01:28', '2020-11-24 10:01:28', 1, NULL);
INSERT INTO `t_user` VALUES (9, '右鞭腿', '1111', '99999999999', '2020-11-24 10:01:28', '2020-11-25 17:02:13', 1, NULL);
INSERT INTO `t_user` VALUES (10, '左刺拳', '1111', '99999999999', '2020-11-24 10:01:28', '2020-11-24 10:01:28', 1, NULL);
INSERT INTO `t_user` VALUES (11, '训练有素', '1111', '99999999999', '2020-11-24 10:02:12', '2020-11-25 11:45:18', 1, NULL);
INSERT INTO `t_user` VALUES (13, '两分钟以后', '222222', '11111', '2020-11-25 20:13:58', '2020-11-25 20:13:58', 1, NULL);
INSERT INTO `t_user` VALUES (14, '凄凄切切群', '111111', '111111', '2020-11-25 20:17:29', '2020-11-25 20:17:29', 1, NULL);
INSERT INTO `t_user` VALUES (15, '哈哈哈哈哈', '123456', '55555', '2020-11-25 20:19:16', '2020-11-27 11:35:49', 0, NULL);
INSERT INTO `t_user` VALUES (17, '123456789', '123456789', '123456789', '2020-11-26 15:08:49', '2020-11-26 15:08:49', 1, NULL);
INSERT INTO `t_user` VALUES (19, '12345678', '123456789', '1234567', '2020-11-26 15:30:31', '2020-11-27 11:41:47', 0, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkYXRlIjoxNjA2NDQ4NTA3LCJ1c2VybmFtZSI6IjEyMzQ1Njc4In0.9Pb7oOYQNnB0n7vDdOxxpuz3PNu3nClPru9zHcgYqBs');
INSERT INTO `t_user` VALUES (20, '1234567', '1234567', '1234567', '2020-11-27 11:38:42', '2020-11-27 11:39:54', 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
