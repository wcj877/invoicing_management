/*
Navicat MySQL Data Transfer

Source Server         : mysql1
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : invoicing_system

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2020-12-31 23:32:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `buyorder`
-- ----------------------------
DROP TABLE IF EXISTS `buyorder`;
CREATE TABLE `buyorder` (
  `buyOrderId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `buyNumber` int DEFAULT NULL,
  `productId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `supplierId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `staffId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `time` date DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`buyOrderId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of buyorder
-- ----------------------------
INSERT INTO `buyorder` VALUES ('cg11', '60', '105', 'gys11', '511223', '2020-03-02', '2');
INSERT INTO `buyorder` VALUES ('cg12', '50', '106', 'gys12', '511221', '2020-10-01', '10');
INSERT INTO `buyorder` VALUES ('cg13', '12', '107', 'gys12', '511221', '2020-10-01', '3');
INSERT INTO `buyorder` VALUES ('cg14', '26', '103', 'gys12', '511221', '2020-10-01', '4');
INSERT INTO `buyorder` VALUES ('cg15', '12', '103', 'gys10', '511221', '2019-01-16', '3');
INSERT INTO `buyorder` VALUES ('cg20201228100155', '1', '103', 'gys10', '511221', '2020-12-28', '1');
INSERT INTO `buyorder` VALUES ('cg20201228104136', '12', '135', 'gys11', '511221', '2020-12-28', '155');

-- ----------------------------
-- Table structure for `classify`
-- ----------------------------
DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify` (
  `classifyId` int NOT NULL AUTO_INCREMENT,
  `classifyName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`classifyId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of classify
-- ----------------------------
INSERT INTO `classify` VALUES ('201', '食品');
INSERT INTO `classify` VALUES ('301', '生活用品');
INSERT INTO `classify` VALUES ('401', '化妆品');
INSERT INTO `classify` VALUES ('501', '电子设备');
INSERT INTO `classify` VALUES ('504', '水电费规定');

-- ----------------------------
-- Table structure for `client`
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `clientId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clientName` varchar(200) DEFAULT NULL,
  `clientContact` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `clientPhone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`clientId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('kh10', '客户一', '王总', '18328324569');
INSERT INTO `client` VALUES ('kh11', '客户二', '张掌柜', '18328365469');
INSERT INTO `client` VALUES ('kh12', '客户三', '钱多多', '15248323215');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `describes` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `classifyId` int DEFAULT NULL,
  `photo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `storeId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`productId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('102', '薯片12', '薯片制作方法是把马铃薯去皮后切为薄片，然后炸或烤至脆口并加以调味即可，薯片已成为很多国家零食市场重要一部份', '201', '/image/chips.jpg', '1002');
INSERT INTO `product` VALUES ('103', '辣条', '辣条又叫大面筋、素牛筋等，它是以小麦粉或其他谷物、豆类为主要原料做成的一种食品。辣条是一种零食', '201', '/image/spicy.jpg', '1001');
INSERT INTO `product` VALUES ('104', '纯牛奶', '牛奶中含有丰富的蛋白质、脂肪、维生素和矿物质等营养物质，乳蛋白中含有人体所必须的氨基酸；乳脂肪多为短链和中链脂肪酸，极易被人体吸收；钾、磷、钙等矿物质配比合理，易于人体吸收', '201', '/image/milk.jpg', '1002');
INSERT INTO `product` VALUES ('105', '抽纸', '主要是供人们生活日常卫生之用，是人民群众不可缺少的纸种之一。为了使卫生纸柔软，通常利用机械方法使纸产生皱纹，增加卫生纸的柔软度', '301', '/image/paper.jpg', '1001');
INSERT INTO `product` VALUES ('106', '抽纸', '主要是供人们生活日常卫生之用，是人民群众不可缺少的纸种之一。为了使卫生纸柔软，通常利用机械方法使纸产生皱纹，增加卫生纸的柔软度', '301', '/image/paper.jpg', '1002');
INSERT INTO `product` VALUES ('107', '抽纸', '主要是供人们生活日常卫生之用，是人民群众不可缺少的纸种之一。为了使卫生纸柔软，通常利用机械方法使纸产生皱纹，增加卫生纸的柔软度', '301', '/image/paper.jpg', '1001');
INSERT INTO `product` VALUES ('108', '抽纸', '主要是供人们生活日常卫生之用，是人民群众不可缺少的纸种之一。为了使卫生纸柔软，通常利用机械方法使纸产生皱纹，增加卫生纸的柔软度', '301', '/image/paper.jpg', '1002');
INSERT INTO `product` VALUES ('109', '口红', '口红，是一种主要使用于嘴唇上并可以增加嘴唇的色泽或改变嘴唇的颜色的化妆品，是重要的彩妆之一', '401', '/image/lipstick.jpg', '1002');
INSERT INTO `product` VALUES ('110', '口红', '口红，是一种主要使用于嘴唇上并可以增加嘴唇的色泽或改变嘴唇的颜色的化妆品，是重要的彩妆之一', '401', '/image/lipstick.jpg', '1002');
INSERT INTO `product` VALUES ('111', '口红', '口红，是一种主要使用于嘴唇上并可以增加嘴唇的色泽或改变嘴唇的颜色的化妆品，是重要的彩妆之一', '401', '/image/lipstick.jpg', '1001');
INSERT INTO `product` VALUES ('112', '口红', '口红，是一种主要使用于嘴唇上并可以增加嘴唇的色泽或改变嘴唇的颜色的化妆品，是重要的彩妆之一', '401', '/image/lipstick.jpg', '1002');
INSERT INTO `product` VALUES ('113', '口红', '口红，是一种主要使用于嘴唇上并可以增加嘴唇的色泽或改变嘴唇的颜色的化妆品，是重要的彩妆之一', '401', '/image/lipstick.jpg', '1001');
INSERT INTO `product` VALUES ('114', '智能手表', '智能手表除指示时间之外，还应具有提醒、导航、校准、监测、交互等其中一种或者多种功能；显示方式包括指针、数字、图像等', '501', '/image/watch.jpg', '1002');
INSERT INTO `product` VALUES ('115', '智能手表', '智能手表除指示时间之外，还应具有提醒、导航、校准、监测、交互等其中一种或者多种功能；显示方式包括指针、数字、图像等', '501', '/image/watch.jpg', '1002');
INSERT INTO `product` VALUES ('116', '智能手表', '智能手表除指示时间之外，还应具有提醒、导航、校准、监测、交互等其中一种或者多种功能；显示方式包括指针、数字、图像等', '501', '/image/watch.jpg', '1001');
INSERT INTO `product` VALUES ('117', '智能手表', '智能手表除指示时间之外，还应具有提醒、导航、校准、监测、交互等其中一种或者多种功能；显示方式包括指针、数字、图像等', '501', '/image/watch.jpg', '1001');
INSERT INTO `product` VALUES ('118', '智能手表', '智能手表除指示时间之外，还应具有提醒、导航、校准、监测、交互等其中一种或者多种功能；显示方式包括指针、数字、图像等', '501', '/image/watch.jpg', '1002');
INSERT INTO `product` VALUES ('135', '沙发', '让发送到发送到发送到', '301', 'upload/', '1002');

-- ----------------------------
-- Table structure for `salesorder`
-- ----------------------------
DROP TABLE IF EXISTS `salesorder`;
CREATE TABLE `salesorder` (
  `salesOrderId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salesNumber` int DEFAULT NULL,
  `time` date DEFAULT NULL,
  `clientId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `productId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `staffId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`salesOrderId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of salesorder
-- ----------------------------
INSERT INTO `salesorder` VALUES ('xs11', '12', '2020-11-03', 'kh11', '103', '511221', '5');
INSERT INTO `salesorder` VALUES ('xs12', '10', '2020-12-04', 'kh12', '105', '511223', '15');
INSERT INTO `salesorder` VALUES ('xs13', '12', '2020-11-03', 'kh11', '103', '511221', '5');
INSERT INTO `salesorder` VALUES ('xs14', '4', '2020-11-03', 'kh11', '105', '511223', '6.2');
INSERT INTO `salesorder` VALUES ('xs20201228100246', '1', '2020-12-28', 'kh10', '103', '511223', '1');
INSERT INTO `salesorder` VALUES ('xs20201228104244', '10', '2020-12-28', 'kh10', '103', '511223', '230');
INSERT INTO `salesorder` VALUES ('xs20201228104310', '10', '2020-12-28', 'kh10', '135', '511223', '1112');

-- ----------------------------
-- Table structure for `staff`
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `staffId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `staffName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `duty` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `storeId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`staffId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('511220', '陈大山', '采购员', '123456', '1001');
INSERT INTO `staff` VALUES ('511221', '黄一坨', '销售员', '123456', '1002');
INSERT INTO `staff` VALUES ('511222', '赵大嬢', '仓库管理员', '123456', '1001');
INSERT INTO `staff` VALUES ('511223', '孙三娃', '系统管理员', '123465', '1002');

-- ----------------------------
-- Table structure for `store`
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `storeId` int NOT NULL AUTO_INCREMENT,
  `storeName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `staffId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `storeDescribe` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` int DEFAULT NULL,
  PRIMARY KEY (`storeId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('1001', '总仓库', '四川成都高新', '511222', '现代仓库从运输周转、贮存方式和建筑设施上都重视通道的合理布置，货物的分布方式和堆积的最大高度，并配置经济有效的机械化、自动化存取设施，以提高贮存能力和工作效率', '500');
INSERT INTO `store` VALUES ('1002', '第二仓库', '成都温江', '511222', '现代仓库从运输周转、贮存方式和建筑设施上都重视通道的合理布置，货物的分布方式和堆积的最大高度，并配置经济有效的机械化、自动化存取设施，以提高贮存能力和工作效率', '500');
INSERT INTO `store` VALUES ('1004', '123', '123', '123', '123', '500');
INSERT INTO `store` VALUES ('1005', '123水电费沙发', '123阿斯蒂芬阿斯蒂芬', '123', '123阿道夫安抚', '500');

-- ----------------------------
-- Table structure for `supplier`
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `supplierId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplierName` varchar(200) DEFAULT NULL COMMENT '供应商名',
  `supplierContact` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `supplierPhone` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`supplierId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('gys10', '供应商一', '街溜子', '14563254987');
INSERT INTO `supplier` VALUES ('gys11', '供应商二', '老许', '12365897548');
INSERT INTO `supplier` VALUES ('gys12', '供应商三', '张麻子', '15326489576');

-- ----------------------------
-- View structure for `view_buy`
-- ----------------------------
DROP VIEW IF EXISTS `view_buy`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_buy` AS select `product`.`productId` AS `productId`,`product`.`productName` AS `productName`,`product`.`describes` AS `describes`,`product`.`classifyId` AS `classifyId`,`product`.`photo` AS `photo`,`product`.`storeId` AS `storeId`,if((sum((`buyorder`.`buyNumber` * `buyorder`.`price`)) >= 0),sum((`buyorder`.`buyNumber` * `buyorder`.`price`)),0) AS `buyPrice`,if((sum(`buyorder`.`buyNumber`) >= 0),sum(`buyorder`.`buyNumber`),0) AS `buyVolume` from (`product` left join `buyorder` on((`product`.`productId` = `buyorder`.`productId`))) group by `product`.`productId` ;

-- ----------------------------
-- View structure for `view_sa`
-- ----------------------------
DROP VIEW IF EXISTS `view_sa`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_sa` AS select `product`.`productId` AS `productId`,`product`.`productName` AS `productName`,`product`.`describes` AS `describes`,`product`.`classifyId` AS `classifyId`,`product`.`photo` AS `photo`,`product`.`storeId` AS `storeId`,if((sum(`salesorder`.`salesNumber`) >= 0),sum(`salesorder`.`salesNumber`),0) AS `salesVolume`,if((sum((`salesorder`.`salesNumber` * `salesorder`.`price`)) >= 0),sum((`salesorder`.`salesNumber` * `salesorder`.`price`)),0) AS `saPrice` from (`product` left join `salesorder` on((`product`.`productId` = `salesorder`.`productId`))) group by `product`.`productId` ;
