/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.7.14-log : Database - zycrm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zycrm` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `trueName` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `avatarUrl` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `isDisable` tinyint(1) DEFAULT NULL COMMENT '是否禁用（0：不禁用  1：禁用）',
  `roleId` int(11) DEFAULT NULL COMMENT '角色ID',
  `departmentId` int(11) DEFAULT NULL COMMENT '所属公司ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

/*Table structure for table `approverecord` */

DROP TABLE IF EXISTS `approverecord`;

CREATE TABLE `approverecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL COMMENT '客户报备状态（0：待核，1：已核，2：拒绝）',
  `customerId` int(11) DEFAULT NULL COMMENT '客户ID',
  `adminId` int(11) DEFAULT NULL COMMENT '审核人ID',
  `approveDate` timestamp NULL DEFAULT NULL COMMENT '审批日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='客户审核记录（日志）';

/*Table structure for table `area` */

DROP TABLE IF EXISTS `area`;

CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL COMMENT '区域名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='区域表';

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerName` varchar(128) DEFAULT NULL COMMENT '客户名称',
  `customerCode` varchar(64) DEFAULT NULL COMMENT '客户编号',
  `district` varchar(128) DEFAULT NULL COMMENT '省市',
  `linkPersonName` varchar(64) DEFAULT NULL COMMENT '客户方担当者',
  `linkPersonDuty` varchar(64) DEFAULT NULL COMMENT '客户方担当者职务',
  `tel` varchar(64) DEFAULT NULL COMMENT '客户电话',
  `address` varchar(128) DEFAULT NULL COMMENT '客户地址',
  `fax` varchar(64) DEFAULT NULL COMMENT '客户传真',
  `email` varchar(128) DEFAULT NULL COMMENT '客户Email',
  `compayUrl` varchar(128) DEFAULT NULL COMMENT '公司URL',
  `product` varchar(128) DEFAULT NULL COMMENT '公司产品',
  `equipment` varchar(256) DEFAULT NULL COMMENT '现使用设备',
  `technique` varchar(256) DEFAULT NULL COMMENT '加工工艺',
  `deviceProblem` text COMMENT '设备问题',
  `requirement` text COMMENT '机械要求',
  `features` text COMMENT '计划特点',
  `planDate` date DEFAULT NULL COMMENT '预定日程',
  `signDate` date DEFAULT NULL COMMENT '签约日期',
  `produceDate` date DEFAULT NULL COMMENT '开始生产日期',
  `deviceArriveDate` date DEFAULT NULL COMMENT '设备到达日期',
  `budgetAmount` decimal(12,2) DEFAULT NULL COMMENT '预算金额',
  `budgetStatus` int(11) DEFAULT NULL COMMENT '预算状态（0：不充足，1：充足，2：未拨款）',
  `modelName` varchar(64) DEFAULT NULL COMMENT '机型',
  `num` int(11) DEFAULT NULL COMMENT '台数',
  `otherDevice` varchar(128) DEFAULT NULL COMMENT '其它设备',
  `workProcess` varchar(128) DEFAULT NULL COMMENT '加工工序',
  `transport` varchar(128) DEFAULT NULL COMMENT '工件搬送',
  `clamp` varchar(64) DEFAULT NULL COMMENT '夹具周边',
  `cutter` varchar(64) DEFAULT NULL COMMENT '刀具',
  `drawing` varchar(64) DEFAULT NULL COMMENT '工件图纸',
  `sampleParts` varchar(64) DEFAULT NULL COMMENT '样件',
  `scheme` varchar(128) DEFAULT NULL COMMENT '工艺方案',
  `takt` varchar(128) DEFAULT NULL COMMENT '加工节拍',
  `priceList` varchar(64) DEFAULT NULL COMMENT '报价单',
  `remark` text COMMENT '代理点备注',
  `expect` varchar(128) DEFAULT NULL COMMENT '预计',
  `status` int(11) DEFAULT NULL COMMENT '客户报备状态（0：待核，1：已核，2：拒绝）',
  `createTime` timestamp NULL DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL COMMENT '事物方担当者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COMMENT='客户信息表';

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(64) DEFAULT NULL COMMENT '单位名称',
  `address` varchar(128) DEFAULT NULL COMMENT '地址',
  `tel` varchar(32) DEFAULT NULL COMMENT '电话',
  `areaId` int(11) DEFAULT NULL COMMENT '所属区域',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='单位（分公司）表';

/*Table structure for table `function` */

DROP TABLE IF EXISTS `function`;

CREATE TABLE `function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `functionId` int(11) DEFAULT NULL COMMENT '父功能ID',
  `name` char(64) DEFAULT NULL COMMENT '功能名称',
  `menuCode` char(64) DEFAULT NULL COMMENT '菜单编码',
  `isMenu` tinyint(1) DEFAULT NULL COMMENT '是否子菜单（0：父菜单  1：子菜单）',
  `url` char(128) DEFAULT NULL COMMENT '请求命名空间',
  `action` char(64) DEFAULT NULL COMMENT '执行的方法名',
  `priority` int(11) DEFAULT NULL COMMENT '优先级（菜单排序用，由大到小排列，越大越靠前）',
  `icon` varchar(48) NOT NULL COMMENT '图标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='功能表';

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `status` int(11) DEFAULT NULL COMMENT '状态（0：未发布，1：已发布）',
  `createTime` timestamp NULL DEFAULT NULL COMMENT '发布日期',
  `adminId` int(11) DEFAULT NULL COMMENT '发布人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COMMENT='公告表';

/*Table structure for table `operatorlogrecords` */

DROP TABLE IF EXISTS `operatorlogrecords`;

CREATE TABLE `operatorlogrecords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(128) DEFAULT NULL COMMENT '动作',
  `url` varchar(256) DEFAULT NULL COMMENT '执行URL',
  `description` varchar(512) DEFAULT NULL COMMENT '备注',
  `createTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `adminId` int(11) DEFAULT NULL COMMENT '操作人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4528 DEFAULT CHARSET=utf8mb4 COMMENT='系统后台管理员操作日志表';

/*Table structure for table `parameter` */

DROP TABLE IF EXISTS `parameter`;

CREATE TABLE `parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `enName` varchar(20) DEFAULT NULL COMMENT '英文名称',
  `cnName` varchar(50) DEFAULT NULL COMMENT '中文名称',
  `value` varchar(500) DEFAULT NULL COMMENT '值',
  `description` varchar(500) DEFAULT NULL COMMENT '详细描述',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态（1 有效 0无效）',
  `createdatetime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modifydatetime` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `regulation` */

DROP TABLE IF EXISTS `regulation`;

CREATE TABLE `regulation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL COMMENT '规则标题',
  `content` text COMMENT '规则内容',
  `createTime` timestamp NULL DEFAULT NULL COMMENT '生成日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='报备规则表';

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

/*Table structure for table `rolehasfunction` */

DROP TABLE IF EXISTS `rolehasfunction`;

CREATE TABLE `rolehasfunction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `functionId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COMMENT='角色功能表';

/*Table structure for table `visitrecord` */

DROP TABLE IF EXISTS `visitrecord`;

CREATE TABLE `visitrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitTitle` varchar(128) DEFAULT NULL COMMENT '回访主题',
  `content` text COMMENT '内容概述',
  `visitDate` date DEFAULT NULL COMMENT '回访日期',
  `visitType` int(11) DEFAULT NULL COMMENT '回访方式（1：电话回访，2：亲自上门拜访，3：邮件回访）',
  `customerId` int(11) DEFAULT NULL COMMENT '回访客户ID',
  `adminId` int(11) DEFAULT NULL COMMENT '月报记录人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='客户回访记录表（月报）';

/*Table structure for table `ws_goods` */

DROP TABLE IF EXISTS `ws_goods`;

CREATE TABLE `ws_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `goodsName` varchar(20) DEFAULT NULL COMMENT '物品名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `ws_goodsprice` */

DROP TABLE IF EXISTS `ws_goodsprice`;

CREATE TABLE `ws_goodsprice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `shopId` int(11) DEFAULT NULL COMMENT '商铺id',
  `goodsId` int(11) DEFAULT NULL COMMENT '物品id',
  `price` int(11) DEFAULT NULL COMMENT '物品价格',
  `createTime` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `ws_shop` */

DROP TABLE IF EXISTS `ws_shop`;

CREATE TABLE `ws_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商铺id',
  `shopName` varchar(20) DEFAULT NULL COMMENT '商铺名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/* Function  structure for function  `queryChildrenAreaInfo` */

/*!50003 DROP FUNCTION IF EXISTS `queryChildrenAreaInfo` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `queryChildrenAreaInfo`(areaId INT) RETURNS varchar(4000) CHARSET utf8mb4
BEGIN
	DECLARE sTemp VARCHAR(4000);
	DECLARE sTempChd VARCHAR(4000);
	 
	SET sTemp = '$';
	SET sTempChd = cast(areaId as char);
	 
	WHILE sTempChd is not NULL DO
	SET sTemp = CONCAT(sTemp,',',sTempChd);
	SELECT group_concat(id) INTO sTempChd FROM t_areainfo where FIND_IN_SET(parentId,sTempChd)>0;
	END WHILE;
	return sTemp;
    END */$$
DELIMITER ;

/* Function  structure for function  `queryChildrenDepts` */

/*!50003 DROP FUNCTION IF EXISTS `queryChildrenDepts` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `queryChildrenDepts`(parentId BIGINT) RETURNS varchar(4000) CHARSET utf8mb4
BEGIN
	DECLARE sTemp VARCHAR(4000);  
DECLARE sTempChd VARCHAR(4000);  
SET sTemp = '$';  
SET sTempChd = cast(parentId as char);  
WHILE sTempChd is not NULL DO  
SELECT group_concat(dp_belong) INTO sTempChd FROM depts where FIND_IN_SET(dp_id,sTempChd)>0;  
if(sTempChd is null) then   
SET sTemp = sTemp;  
else   
SET sTemp = CONCAT(sTemp,',',sTempChd);  
end if;  
END WHILE;  
return sTemp; 
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
