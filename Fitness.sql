/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost:3306
 Source Schema         : fitness

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 04/04/2023 20:56:08
*/
use fitness;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '预约id',
  `user_id` int(8) NOT NULL COMMENT '教练id',
  `date` date NOT NULL COMMENT '日期',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '时间段',
  `stu_id` int(8) NOT NULL COMMENT '学员id',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0未完成 1完成',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_coach_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appointment
-- ----------------------------
INSERT INTO `appointment` VALUES (8, 3, '2023-04-10', '9:00-10:00', 1, 1);
INSERT INTO `appointment` VALUES (9, 3, '2023-04-03', '9:00-10:00', 6, 1);
INSERT INTO `appointment` VALUES (10, 5, '2023-04-11', '9:00-10:00', 1, 1);

-- ----------------------------
-- Table structure for coach
-- ----------------------------
DROP TABLE IF EXISTS `coach`;
CREATE TABLE `coach`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '教练id',
  `coach` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '教练名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coach
-- ----------------------------
INSERT INTO `coach` VALUES (1, 'tony');
INSERT INTO `coach` VALUES (2, 'ade');
INSERT INTO `coach` VALUES (3, 'candy');
INSERT INTO `coach` VALUES (4, 'baby');

-- ----------------------------
-- Table structure for diet
-- ----------------------------
DROP TABLE IF EXISTS `diet`;
CREATE TABLE `diet`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT ' ',
  `carbs` double(8, 2) NULL DEFAULT NULL,
  `protein` double(8, 2) NULL DEFAULT NULL,
  `fat` double(8, 2) NULL DEFAULT NULL,
  `user_id` int(8) NOT NULL,
  `date` date NOT NULL,
  `carbsed` double(8, 2) NULL DEFAULT NULL,
  `proteined` double(8, 2) NULL DEFAULT NULL,
  `fated` double(8, 2) NULL DEFAULT NULL,
  `foods` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `all_calorie` double(8, 2) NULL DEFAULT NULL COMMENT '总卡路里',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of diet
-- ----------------------------
INSERT INTO `diet` VALUES (2, 145.00, 111.00, 122.00, 1, '2023-04-03', 0.00, 0.00, 0.00, '2', 59.00);
INSERT INTO `diet` VALUES (3, 103.00, 142.00, 120.00, 1, '2023-04-18', 150.06, 151.28, 150.06, '1,2', 222.91);
INSERT INTO `diet` VALUES (5, 103.00, 250.00, 168.00, 1, '2023-04-04', 66.42, 66.96, 66.42, '1,2', 80.52);
INSERT INTO `diet` VALUES (6, 103.00, 250.00, 168.00, 1, '2023-04-05', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `diet` VALUES (7, 103.00, 250.00, 168.00, 1, '2023-04-06', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `score` int(8) NULL DEFAULT NULL,
  `type` int(8) NOT NULL COMMENT '0反馈，1举报',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `appointment_id` int(8) NOT NULL,
  `user_id` int(8) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES (1, NULL, 'OK', 100, 0, NULL, 7, 1);
INSERT INTO `feedback` VALUES (2, NULL, 'OK', 100, 0, NULL, 7, 1);
INSERT INTO `feedback` VALUES (3, NULL, 'very good', 100, 0, NULL, 8, 1);
INSERT INTO `feedback` VALUES (4, NULL, 'The training arrangement is unreasonable,The training content does not meet personal requirements,Coach misconduct', NULL, 1, NULL, 8, 1);

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `calorie` double NOT NULL COMMENT '卡路里',
  `carbs` double(8, 0) NULL DEFAULT NULL COMMENT '碳水',
  `fat` double(8, 0) NULL DEFAULT NULL COMMENT '脂肪',
  `protein` double(8, 0) NULL DEFAULT NULL COMMENT '蛋白质',
  `user_id` int(8) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES (1, 'potato', 123, 123, 123, 124, NULL);
INSERT INTO `food` VALUES (2, 'fish', 235, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '计划id',
  `plan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '计划名',
  `time` date NOT NULL COMMENT '计划时间',
  `num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '次数',
  `expected_consumption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消耗多少能量',
  `performance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完成情况',
  `user_id` int(8) NOT NULL COMMENT '学员id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_trainess_id`(`user_id`) USING BTREE,
  CONSTRAINT `fk_trainess_id` FOREIGN KEY (`user_id`) REFERENCES `trainees` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES (2, '123', '2022-11-30', '123', '123', '123', 1);
INSERT INTO `plan` VALUES (3, '123', '2022-11-30', '123', '123', '123', 2);
INSERT INTO `plan` VALUES (5, 'push-up', '2021-02-11', '10', '123', '123', 1);

-- ----------------------------
-- Table structure for trainees
-- ----------------------------
DROP TABLE IF EXISTS `trainees`;
CREATE TABLE `trainees`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '学员id',
  `trainees` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学员名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trainees
-- ----------------------------
INSERT INTO `trainees` VALUES (1, 'tom');
INSERT INTO `trainees` VALUES (2, 'lihua');
INSERT INTO `trainees` VALUES (3, 'Flora');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `width` double NULL DEFAULT NULL,
  `height` double NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `age` int(8) NULL DEFAULT NULL,
  `type` int(255) NOT NULL COMMENT '0 学员 1 教练',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123', 'lihua', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `user` VALUES (2, 'adm', '123', 'aricy', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `user` VALUES (3, 'tony', '123', 'tony', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `user` VALUES (5, 'ade', '1234', 'ade', '', 'female', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `user` VALUES (6, 'luc', '1234', 'luc', '20230402203656_file.png', 'female', NULL, NULL, NULL, NULL, 0, '2023-04-02 20:37:00');
INSERT INTO `user` VALUES (7, 'opp', '123', 'opp', '', 'female', NULL, NULL, NULL, NULL, 0, '2023-04-02 20:42:01');

SET FOREIGN_KEY_CHECKS = 1;
