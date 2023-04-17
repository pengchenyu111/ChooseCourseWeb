/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : courseselectionmanagement

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 17/04/2023 15:44:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_class
-- ----------------------------
DROP TABLE IF EXISTS `tb_class`;
CREATE TABLE `tb_class`  (
  `ClassNo` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClassName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ClassNumber` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ClassNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_class
-- ----------------------------
INSERT INTO `tb_class` VALUES ('170001', '软件工程17-1班', 5);
INSERT INTO `tb_class` VALUES ('170002', '软件工程17-2班', 2);
INSERT INTO `tb_class` VALUES ('170003', '软件工程17-3班', 1);
INSERT INTO `tb_class` VALUES ('170011', '计算机科学与技术17-1班', 0);
INSERT INTO `tb_class` VALUES ('170012', '计算机科学与技术17-2班', 0);
INSERT INTO `tb_class` VALUES ('170013', NULL, NULL);

-- ----------------------------
-- Table structure for tb_course
-- ----------------------------
DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE `tb_course`  (
  `CourseNo` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CourseName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CourseCredit` double NULL DEFAULT NULL,
  `CourseType` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CourseTimePlace` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CourseHour` int(11) NULL DEFAULT NULL,
  `CourseStartYear` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CourseStartTerm` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CourseMaxnum` int(11) NULL DEFAULT NULL,
  `CourseChoosennum` int(11) NULL DEFAULT NULL,
  `CourseTextbook` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CourseCode` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CourseNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_course
-- ----------------------------
INSERT INTO `tb_course` VALUES ('170001', '数据结构', 3, '必修课', '1-10周周二5，6节周四1，2节翠3教202，12-18周周三3，4节周四1，2节翠7教403', 80, '2019', '2', 10, 10, '数据结构与算法', 'AJ24540103202LR32340107403');
INSERT INTO `tb_course` VALUES ('170002', 'Linux', 2.5, '必修课', '1-10周周五1，2节翠1教101', 20, '2019', '2', 200, 5, 'Linux基础', 'AJ50100001101ZZ00000000000');
INSERT INTO `tb_course` VALUES ('170003', '操作系统', 3, '必修课', '1-10周周二5，6节周三1，2节翠3教202，12-16周周二1，2节，周四3，4节翠3教202', 80, '2019', '2', 200, 0, '操作系统', 'AJ24530103202LP20142303202');
INSERT INTO `tb_course` VALUES ('170004', '计算机组成原理', 4.5, '必修课', '1-10周周三3，4节周四1，2节翠3教203，12-16周周三3，4节，周四1，2节翠3教203', 80, '2019', '2', 200, 2, '计算机组成原理', 'AJ32340103203LP32340103203');
INSERT INTO `tb_course` VALUES ('170005', '汇编语言', 3, '必修课', '1-10周周二7，8节周四7，8节翠7教103，12-16周周二7，8节，周四7，8节翠5教105', 80, '2019', '2', 200, 1, '汇编语言基础', 'AJ26746707103LP26746705105');
INSERT INTO `tb_course` VALUES ('170006', '智慧养老', 1, '选修课', '3-12周周二9，10节翠6教109', 20, '2019', '2', 300, 2, '无', 'CL28900006109ZZ00000000000');

-- ----------------------------
-- Table structure for tb_login
-- ----------------------------
DROP TABLE IF EXISTS `tb_login`;
CREATE TABLE `tb_login`  (
  `account` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `code` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `power` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_login
-- ----------------------------
INSERT INTO `tb_login` VALUES ('2017211230', '123456', '3');
INSERT INTO `tb_login` VALUES ('2017211231', '123456', '3');
INSERT INTO `tb_login` VALUES ('2017211231', '123456', '3');
INSERT INTO `tb_login` VALUES ('2017211232', '123456', '3');
INSERT INTO `tb_login` VALUES ('1992311589', '456789', '2');
INSERT INTO `tb_login` VALUES ('2017211233', '111111', '3');
INSERT INTO `tb_login` VALUES ('2017211234', '123456', '3');
INSERT INTO `tb_login` VALUES ('2017211235', '123456', '3');
INSERT INTO `tb_login` VALUES ('2017211236', '123456', '3');
INSERT INTO `tb_login` VALUES ('2017211236', '123456', '3');
INSERT INTO `tb_login` VALUES ('2017211237', '123456', '3');
INSERT INTO `tb_login` VALUES ('2017211238', '123456', '3');
INSERT INTO `tb_login` VALUES ('2017211239', '123456', '3');
INSERT INTO `tb_login` VALUES ('2017211240', '123456', '3');
INSERT INTO `tb_login` VALUES ('2000211234', '123456', '2');
INSERT INTO `tb_login` VALUES ('2001123459', '123456', '2');
INSERT INTO `tb_login` VALUES ('2003468464', '123456', '2');
INSERT INTO `tb_login` VALUES ('2012356132', '123456', '2');
INSERT INTO `tb_login` VALUES ('root', '123456', '1');
INSERT INTO `tb_login` VALUES ('2017214858', '123456', '2');
INSERT INTO `tb_login` VALUES ('test', '123456', '2');
INSERT INTO `tb_login` VALUES ('test', '123456', '2');

-- ----------------------------
-- Table structure for tb_sc
-- ----------------------------
DROP TABLE IF EXISTS `tb_sc`;
CREATE TABLE `tb_sc`  (
  `Sno` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CourseNo` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `grade` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Sno`, `CourseNo`) USING BTREE,
  INDEX `CourseNo`(`CourseNo`) USING BTREE,
  CONSTRAINT `CourseNo` FOREIGN KEY (`CourseNo`) REFERENCES `tb_course` (`CourseNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Sno` FOREIGN KEY (`Sno`) REFERENCES `tb_student` (`Sno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sc
-- ----------------------------
INSERT INTO `tb_sc` VALUES ('2017211232', '170001', 100);
INSERT INTO `tb_sc` VALUES ('2017211232', '170002', 100);
INSERT INTO `tb_sc` VALUES ('2017211232', '170006', NULL);
INSERT INTO `tb_sc` VALUES ('2017211233', '170001', 80);
INSERT INTO `tb_sc` VALUES ('2017211233', '170002', 76);
INSERT INTO `tb_sc` VALUES ('2017211233', '170004', 34);
INSERT INTO `tb_sc` VALUES ('2017211233', '170005', 1111);
INSERT INTO `tb_sc` VALUES ('2017211233', '170006', NULL);
INSERT INTO `tb_sc` VALUES ('2017211234', '170001', 66);
INSERT INTO `tb_sc` VALUES ('2017211235', '170001', 94);
INSERT INTO `tb_sc` VALUES ('2017211236', '170001', 89);
INSERT INTO `tb_sc` VALUES ('2017211237', '170001', 86);
INSERT INTO `tb_sc` VALUES ('2017211238', '170001', 86);
INSERT INTO `tb_sc` VALUES ('2017211239', '170001', 69);
INSERT INTO `tb_sc` VALUES ('2017211240', '170002', NULL);

-- ----------------------------
-- Table structure for tb_student
-- ----------------------------
DROP TABLE IF EXISTS `tb_student`;
CREATE TABLE `tb_student`  (
  `Sno` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Sname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Ssex` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Sage` int(11) NULL DEFAULT NULL,
  `ClassNo` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `major` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Scode` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Spower` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Sno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_student
-- ----------------------------
INSERT INTO `tb_student` VALUES ('2017211232', '王五', '男', 21, '170001', '软件工程', '123456', '3');
INSERT INTO `tb_student` VALUES ('2017211233', '林冲', '男', 22, '170001', '软件工程', '111111', '3');
INSERT INTO `tb_student` VALUES ('2017211234', '杨雪', '女', 22, '170001', '软件工程', '123456', '3');
INSERT INTO `tb_student` VALUES ('2017211235', '宁静', '女', 22, '170001', '软件工程', '123456', '3');
INSERT INTO `tb_student` VALUES ('2017211236', '宋江', '男', 21, '170001', '软件工程', '123456', '3');
INSERT INTO `tb_student` VALUES ('2017211237', '武松', '男', 20, '170002', '软件工程', '123456', '3');
INSERT INTO `tb_student` VALUES ('2017211238', '洛苏', '女', 19, '170002', '软件工程', '123456', '3');
INSERT INTO `tb_student` VALUES ('2017211239', '萧潇', '女', 19, '170003', '软件工程', '123456', '3');
INSERT INTO `tb_student` VALUES ('2017211240', '刘笠', '女', 19, '170013', '计算机科学与技术', '123456', '3');

-- ----------------------------
-- Table structure for tb_tc
-- ----------------------------
DROP TABLE IF EXISTS `tb_tc`;
CREATE TABLE `tb_tc`  (
  `CourseNo` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Tno` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`CourseNo`, `Tno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_tc
-- ----------------------------
INSERT INTO `tb_tc` VALUES ('170001', '1992311589');
INSERT INTO `tb_tc` VALUES ('170002', '1992311589');
INSERT INTO `tb_tc` VALUES ('170002', '2000311589');
INSERT INTO `tb_tc` VALUES ('170003', '2001123459');
INSERT INTO `tb_tc` VALUES ('170004', '2003468464');
INSERT INTO `tb_tc` VALUES ('170005', '2012356132');

-- ----------------------------
-- Table structure for tb_teacher
-- ----------------------------
DROP TABLE IF EXISTS `tb_teacher`;
CREATE TABLE `tb_teacher`  (
  `Tno` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Tname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Tsex` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Tage` int(11) NULL DEFAULT NULL,
  `Tposition` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Tcode` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Tpower` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Tno`, `Tpower`) USING BTREE,
  INDEX `Tno`(`Tno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_teacher
-- ----------------------------
INSERT INTO `tb_teacher` VALUES ('2000311589', '郭靖', '男', 36, '副教授', '123456', '2');
INSERT INTO `tb_teacher` VALUES ('2001123459', '洪七', '男', 59, '教授', '123456', '2');
INSERT INTO `tb_teacher` VALUES ('2003468464', '单机', '女', 34, '副教授', '123456', '2');
INSERT INTO `tb_teacher` VALUES ('2012356132', '萨毕', '女', 42, '教授', '123456', '2');
INSERT INTO `tb_teacher` VALUES ('2017214858', '刘强东', '男', 45, '副研究员', '123456', '2');
INSERT INTO `tb_teacher` VALUES ('test', '马云', '男', 56, '教授', '123456', '2');

SET FOREIGN_KEY_CHECKS = 1;
