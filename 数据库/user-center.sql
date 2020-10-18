/*
 Navicat Premium Data Transfer

 Source Server         : aliyun-connect1
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : rm-uf654i8ok1o971a07ro.mysql.rds.aliyuncs.com:3306
 Source Schema         : user-center

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 18/10/2020 17:25:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bonus_event_log
-- ----------------------------
DROP TABLE IF EXISTS `bonus_event_log`;
CREATE TABLE `bonus_event_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT 'user.id',
  `value` int(11) NULL DEFAULT NULL COMMENT '积分操作值',
  `event` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发生的事件',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_bonus_event_log_user1_idx`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '积分变更记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bonus_event_log
-- ----------------------------
INSERT INTO `bonus_event_log` VALUES (1, 30, 20, 'SIGN_IN', '2020-09-30 20:26:03', 'retgfgfgf');
INSERT INTO `bonus_event_log` VALUES (2, 30, 50, 'CONTRIBUTE', '2020-10-08 21:55:52', '投稿加积分');
INSERT INTO `bonus_event_log` VALUES (3, 30, 50, 'CONTRIBUTE', '2020-10-08 22:04:29', '投稿加积分');
INSERT INTO `bonus_event_log` VALUES (4, 30, 50, 'CONTRIBUTE', '2020-10-08 22:06:22', '投稿加积分');
INSERT INTO `bonus_event_log` VALUES (5, 1, 50, 'CONTRIBUTE', '2020-10-08 22:37:46', '投稿加积分');
INSERT INTO `bonus_event_log` VALUES (6, 1, 50, 'CONTRIBUTE', '2020-10-09 08:32:29', '投稿加积分');
INSERT INTO `bonus_event_log` VALUES (33, 30, -8, 'CONTRIBUTE', '2020-10-18 17:03:45', '兑换扣积分');
INSERT INTO `bonus_event_log` VALUES (34, 30, -5, 'CONTRIBUTE', '2020-10-18 17:05:56', '兑换扣积分');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, '许源', 'https://public-cdn-oss.mosoteach.cn/mssvc/cover/2020/09/7f41b776db0ef26d6bb4d92c61435bcc.jpg');
INSERT INTO `t_user` VALUES (2, '许源', 'https://static-cdn-oss.mosoteach.cn/mssvc/icons/icon_cc_cover1_8@2x.png');
INSERT INTO `t_user` VALUES (3, '许源', 'https://static-cdn-oss.mosoteach.cn/mssvc/icons/icon_cc_cover1_e@2x.png');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `wx_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信id',
  `wx_nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信昵称',
  `roles` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '角色',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头像地址',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  `bonus` int(11) NOT NULL DEFAULT 300 COMMENT '积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分享' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (30, 'ovUz_40l5fIqgRptaRpsQYiYqUGU', '冬青', 'user', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKatxJF3cnOg4jfibxHe9LjsBJGsYiakg7hicbxiaePEMRDOGe6zX6wr7iciaRJiaMhjcZLnuoDjHZGkHHpA/132', '2020-10-17 20:53:42', '2020-10-17 20:53:42', 97);

SET FOREIGN_KEY_CHECKS = 1;
