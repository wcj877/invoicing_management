/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : invoicing_system

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 05/01/2021 16:45:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for buyorder
-- ----------------------------
DROP TABLE IF EXISTS `buyorder`;
CREATE TABLE `buyorder`  (
  `buyOrderId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `buyNumber` int(0) NULL DEFAULT NULL,
  `productId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplierId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staffId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` date NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  PRIMARY KEY (`buyOrderId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of buyorder
-- ----------------------------
INSERT INTO `buyorder` VALUES ('cg11', 60, '102', 'gys11', '511223', '2020-03-02', 2);
INSERT INTO `buyorder` VALUES ('cg12', 50, '102', 'gys12', '511221', '2020-10-01', 10);
INSERT INTO `buyorder` VALUES ('cg13', 12, '107', 'gys12', '511221', '2020-10-01', 3);
INSERT INTO `buyorder` VALUES ('cg14', 26, '103', 'gys12', '511221', '2020-10-01', 4);
INSERT INTO `buyorder` VALUES ('cg15', 12, '103', 'gys10', '511221', '2020-12-16', 3);
INSERT INTO `buyorder` VALUES ('cg20201228100155', 1, '102', 'gys10', '511221', '2020-12-28', 1);
INSERT INTO `buyorder` VALUES ('cg20201228104136', 12, '135', 'gys11', '511221', '2020-12-28', 155);
INSERT INTO `buyorder` VALUES ('cg20210105155709', 20, '102', 'gys10', '511223', '2020-01-05', 200);
INSERT INTO `buyorder` VALUES ('cg20210105160229', 80, '102', 'gys11', '511223', '2020-02-05', 50);
INSERT INTO `buyorder` VALUES ('cg20210105160944', 50, '102', 'gys12', '511223', '2020-04-05', 100);
INSERT INTO `buyorder` VALUES ('cg20210105161256', 95, '102', 'gys10', '511223', '2020-05-05', 300);
INSERT INTO `buyorder` VALUES ('cg20210105161758', 90, '102', 'gys11', '511223', '2020-06-05', 30);
INSERT INTO `buyorder` VALUES ('cg20210105162141', 30, '102', 'gys12', '511223', '2020-07-05', 400);
INSERT INTO `buyorder` VALUES ('cg20210105162320', 80, '102', 'gys10', '511223', '2020-08-05', 10);
INSERT INTO `buyorder` VALUES ('cg20210105163302', 50, '102', 'gys10', '511223', '2020-09-05', 10);
INSERT INTO `buyorder` VALUES ('cg20210105163631', 52, '102', 'gys10', '511223', '2020-11-05', 20);

-- ----------------------------
-- Table structure for classify
-- ----------------------------
DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify`  (
  `classifyId` int(0) NOT NULL AUTO_INCREMENT,
  `classifyName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`classifyId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 505 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of classify
-- ----------------------------
INSERT INTO `classify` VALUES (201, '食品');
INSERT INTO `classify` VALUES (301, '生活用品');
INSERT INTO `classify` VALUES (401, '化妆品');
INSERT INTO `classify` VALUES (501, '电子设备');
INSERT INTO `classify` VALUES (504, '家具产品');

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client`  (
  `clientId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clientName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clientContact` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clientPhone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`clientId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('kh10', '客户一', '王总', '18328324569');
INSERT INTO `client` VALUES ('kh11', '客户二', '张掌柜', '18328365469');
INSERT INTO `client` VALUES ('kh12', '客户三', '钱多多', '15248323215');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `productId` int(0) NOT NULL AUTO_INCREMENT,
  `productName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `describes` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `classifyId` int(0) NULL DEFAULT NULL,
  `photo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `storeId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`productId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (102, '薯片', '薯片制作方法是把马铃薯去皮后切为薄片。', 201, '/image/chips.jpg', '1002');
INSERT INTO `product` VALUES (103, '辣条', '辣条又叫大面筋、素牛筋等。', 201, '/image/spicy.jpg', '1001');
INSERT INTO `product` VALUES (104, '纯牛奶', '牛奶中含有丰富的蛋白质、脂肪、维生素和矿物质等营养物质。', 201, '/image/milk.jpg', '1002');
INSERT INTO `product` VALUES (105, '抽纸', '主要是供人们生活日常卫生之用，是人民群众不可缺少的纸种之一。', 301, '/image/paper.jpg', '1001');
INSERT INTO `product` VALUES (106, '牙膏', '对牙齿及其周边进行清洁，使口腔净化清爽。', 301, '/image/paper.jpg', '1002');
INSERT INTO `product` VALUES (107, '毛巾', '方形纯棉纺织品，质地松软。', 301, '/image/paper.jpg', '1001');
INSERT INTO `product` VALUES (108, '洗发水', '保持头皮和头发清洁及头发美观。', 301, '/image/paper.jpg', '1002');
INSERT INTO `product` VALUES (109, '口红', '是一种主要使用于嘴唇上的化妆品。', 401, '/image/lipstick.jpg', '1002');
INSERT INTO `product` VALUES (110, '眼妆', '专门针对眼睛及眼睛周围部分进行上妆，让眼睛更漂亮。', 401, '/image/lipstick.jpg', '1002');
INSERT INTO `product` VALUES (111, '芦荟胶', '具有很好的消炎杀菌美容功效。', 401, '/image/lipstick.jpg', '1001');
INSERT INTO `product` VALUES (112, '面膜', '具有保湿、滋润、营养、改善外观、深层清洁等多种功能。', 401, '/image/lipstick.jpg', '1002');
INSERT INTO `product` VALUES (113, '爽肤水', '使肌肤更好地吸收，并为使用保养品作准备。', 401, '/image/lipstick.jpg', '1001');
INSERT INTO `product` VALUES (114, '智能手表', '具有提醒、导航、校准、监测、交互等其中一种或者多种功能。', 501, '/image/watch.jpg', '1002');
INSERT INTO `product` VALUES (115, 'HomePod mini', '360 度音频填满整个房间，不管从哪个角度听，都让你陶醉。', 501, '/image/watch.jpg', '1002');
INSERT INTO `product` VALUES (116, '蓝牙耳机', '使用者可以免除恼人电线的牵绊，自在地以各种方式轻松通话。', 501, '/image/watch.jpg', '1001');
INSERT INTO `product` VALUES (117, '数码相机', '利用光学成像原理形成影像并使用底片记录影像的设备', 501, '/image/watch.jpg', '1001');
INSERT INTO `product` VALUES (118, '步步高点读机', '哪里不会点哪里。', 501, '/image/watch.jpg', '1002');
INSERT INTO `product` VALUES (135, '沙发', '大多数由木材和海绵制作而成。居家必备产品之一。', 301, 'upload/', '1002');

-- ----------------------------
-- Table structure for salesorder
-- ----------------------------
DROP TABLE IF EXISTS `salesorder`;
CREATE TABLE `salesorder`  (
  `salesOrderId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salesNumber` int(0) NULL DEFAULT NULL,
  `time` date NULL DEFAULT NULL,
  `clientId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staffId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  PRIMARY KEY (`salesOrderId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of salesorder
-- ----------------------------
INSERT INTO `salesorder` VALUES ('xs11', 12, '2020-11-03', 'kh11', '103', '511221', 5);
INSERT INTO `salesorder` VALUES ('xs12', 10, '2020-12-04', 'kh12', '105', '511223', 15);
INSERT INTO `salesorder` VALUES ('xs13', 12, '2020-11-03', 'kh11', '102', '511221', 5);
INSERT INTO `salesorder` VALUES ('xs14', 4, '2020-11-03', 'kh11', '102', '511223', 6.2);
INSERT INTO `salesorder` VALUES ('xs20201228100246', 1, '2020-12-28', 'kh10', '103', '511223', 1);
INSERT INTO `salesorder` VALUES ('xs20201228104244', 10, '2020-12-28', 'kh10', '102', '511223', 230);
INSERT INTO `salesorder` VALUES ('xs20201228104310', 10, '2020-03-28', 'kh10', '102', '511223', 1112);
INSERT INTO `salesorder` VALUES ('xs20210105155743', 15, '2020-01-05', 'kh10', '102', '511223', 300);
INSERT INTO `salesorder` VALUES ('xs20210105160249', 75, '2020-02-05', 'kh11', '102', '511223', 60);
INSERT INTO `salesorder` VALUES ('xs20210105161004', 35, '2020-04-05', 'kh12', '102', '511223', 120);
INSERT INTO `salesorder` VALUES ('xs20210105161313', 60, '2020-05-05', 'kh10', '102', '511223', 350);
INSERT INTO `salesorder` VALUES ('xs20210105161811', 50, '2020-06-05', 'kh11', '102', '511223', 40);
INSERT INTO `salesorder` VALUES ('xs20210105162159', 10, '2020-07-05', 'kh12', '102', '511223', 450);
INSERT INTO `salesorder` VALUES ('xs20210105162336', 77, '2020-08-05', 'kh10', '102', '511223', 20);
INSERT INTO `salesorder` VALUES ('xs20210105163424', 46, '2020-09-05', 'kh10', '102', '511223', 20);
INSERT INTO `salesorder` VALUES ('xs20210105163526', 42, '2020-10-05', 'kh10', '102', '511223', 30);

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `staffId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `staffName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `duty` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `storeId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`staffId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('511220', '陈大山', '采购员', '123456', '1001');
INSERT INTO `staff` VALUES ('511221', '黄一坨', '销售员', '123456', '1002');
INSERT INTO `staff` VALUES ('511222', '赵大嬢', '仓库管理员', '123456', '1001');
INSERT INTO `staff` VALUES ('511223', '孙三娃', '系统管理员', '123465', '1002');

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store`  (
  `storeId` int(0) NOT NULL AUTO_INCREMENT,
  `storeName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staffId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `storeDescribe` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`storeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1007 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES (1001, '总仓库', '四川成都高新', '511222', '现代仓库从运输周转、贮存方式和建筑设施上都重视通道的合理布置。', 500);
INSERT INTO `store` VALUES (1002, '第二仓库', '成都温江', '511222', '配置经济有效的机械化、自动化存取设施，以提高贮存能力和工作效率。', 500);
INSERT INTO `store` VALUES (1004, '西南区域仓', '成都成华', '511222', '西南地区最大储物仓库', 500);
INSERT INTO `store` VALUES (1005, '家具专用仓', '郫都区红星街道', '511222', '各种家具应有尽有，欢迎来访。', 500);

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `supplierId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplierName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名',
  `supplierContact` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplierPhone` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`supplierId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('gys10', '供应商一', '街溜子', '14563254987');
INSERT INTO `supplier` VALUES ('gys11', '供应商二', '老许', '12365897548');
INSERT INTO `supplier` VALUES ('gys12', '供应商三', '张麻子', '15326489576');

-- ----------------------------
-- View structure for view_buy
-- ----------------------------
DROP VIEW IF EXISTS `view_buy`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_buy` AS select `product`.`productId` AS `productId`,`product`.`productName` AS `productName`,`product`.`describes` AS `describes`,`product`.`classifyId` AS `classifyId`,`product`.`photo` AS `photo`,`product`.`storeId` AS `storeId`,if((sum((`buyorder`.`buyNumber` * `buyorder`.`price`)) >= 0),sum((`buyorder`.`buyNumber` * `buyorder`.`price`)),0) AS `buyPrice`,if((sum(`buyorder`.`buyNumber`) >= 0),sum(`buyorder`.`buyNumber`),0) AS `buyVolume` from (`product` left join `buyorder` on((`product`.`productId` = `buyorder`.`productId`))) group by `product`.`productId`;

-- ----------------------------
-- View structure for view_sa
-- ----------------------------
DROP VIEW IF EXISTS `view_sa`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_sa` AS select `product`.`productId` AS `productId`,`product`.`productName` AS `productName`,`product`.`describes` AS `describes`,`product`.`classifyId` AS `classifyId`,`product`.`photo` AS `photo`,`product`.`storeId` AS `storeId`,if((sum(`salesorder`.`salesNumber`) >= 0),sum(`salesorder`.`salesNumber`),0) AS `salesVolume`,if((sum((`salesorder`.`salesNumber` * `salesorder`.`price`)) >= 0),sum((`salesorder`.`salesNumber` * `salesorder`.`price`)),0) AS `saPrice` from (`product` left join `salesorder` on((`product`.`productId` = `salesorder`.`productId`))) group by `product`.`productId`;

SET FOREIGN_KEY_CHECKS = 1;
