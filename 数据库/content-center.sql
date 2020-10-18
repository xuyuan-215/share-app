/*
 Navicat Premium Data Transfer

 Source Server         : aliyun-connect1
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : rm-uf654i8ok1o971a07ro.mysql.rds.aliyuncs.com:3306
 Source Schema         : content-center

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 18/10/2020 17:24:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mid_user_share
-- ----------------------------
DROP TABLE IF EXISTS `mid_user_share`;
CREATE TABLE `mid_user_share`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `share_id` int(11) NOT NULL COMMENT 'share.id',
  `user_id` int(11) NOT NULL COMMENT 'user.id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_mid_user_share_share1_idx`(`share_id`) USING BTREE,
  INDEX `fk_mid_user_share_user1_idx`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户-分享中间表【描述用户购买的分享】' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mid_user_share
-- ----------------------------
INSERT INTO `mid_user_share` VALUES (1, 1, 30);
INSERT INTO `mid_user_share` VALUES (16, 6, 30);
INSERT INTO `mid_user_share` VALUES (17, 10, 30);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '内容',
  `show_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示 0:否 1:是',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '冬青', 1, '2020-10-01 12:34:15');
INSERT INTO `notice` VALUES (2, 'starywwwl', 1, '2020-10-02 12:34:42');
INSERT INTO `notice` VALUES (3, '我爱java', 1, '2020-10-04 12:34:56');

-- ----------------------------
-- Table structure for rocketmq_transaction_log
-- ----------------------------
DROP TABLE IF EXISTS `rocketmq_transaction_log`;
CREATE TABLE `rocketmq_transaction_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `transaction_Id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '事务id',
  `log` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'RocketMQ事务日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for share
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '发布人id',
  `title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  `is_original` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否原创 0:否 1:是',
  `author` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '作者',
  `cover` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '封面',
  `summary` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '概要信息',
  `price` int(11) NOT NULL DEFAULT 0 COMMENT '价格（需要的积分）',
  `download_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '下载地址',
  `buy_count` int(11) NOT NULL DEFAULT 0 COMMENT '下载数 ',
  `show_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示 0:否 1:是',
  `audit_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '审核状态 NOT_YET: 待审核 PASSED:审核通过 REJECTED:审核不通过',
  `reason` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '审核不通过原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分享表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of share
-- ----------------------------
INSERT INTO `share` VALUES (1, 30, 'Spring Cloud', '2020-09-09 15:44:28', '2020-09-16 15:44:31', 1, 'Netflix', 'https://img9.doubanio.com/view/subject/s/public/s29434190.jpg', 'Spring Cloud的子项目，大致可分成两类，一类是对现有成熟框架”Spring Boot化”的封装和抽象，也是数量最多的项目', 9, 'https://book.douban.com/subject/27016248/', 1, 1, 'PASS', 'https://book.douban.com/subject/27016248/');
INSERT INTO `share` VALUES (2, 30, '深入理解LINUX内核', '2020-10-01 12:36:01', '2020-10-02 12:36:05', 1, 'Greg Attwood', 'https://img9.doubanio.com/view/subject/s/public/s27314344.jpg', '《深入理解Linux内核，第三版》指导你对内核中使用的最重要的数据结构、算法和程序设计诀窍进行一次遍历。通过对表面特性的探究，作者给那些想知道自己机器工作原理的人提供了颇有价值的见解', 8, 'https://book.douban.com/subject/27016248/', 4, 0, 'pass', '');
INSERT INTO `share` VALUES (3, 30, 'c++语言', '2020-10-02 12:38:05', '2020-10-03 12:38:08', 0, '丹尼斯·里奇', 'https://img9.doubanio.com/view/subject/s/public/s1106934.jpg', '结合实际问题展示算法设计的一般性模式与方法、算法实现的主流技巧，以及算法效率的评判依据和分析方法；以高度概括的体例为线索贯穿全书，并通过对比和类比揭示数据结构与算法的内在联系', 7, 'https://book.douban.com/subject/27016248/', 1, 0, 'pass', '');
INSERT INTO `share` VALUES (4, 30, '计算机系统概论', '2020-10-01 12:39:21', '2020-10-03 12:39:26', 1, '机械工业出版社', 'https://images-cn.ssl-images-amazon.cn/images/I/51KaCosg3IL._SX350_BO1,204,203,200_.jpg', '建议配合北大的coursera课程《计算机组成》一起看', 6, 'https://book.douban.com/subject/27016248/', 4, 0, 'PASSED', 'EE');
INSERT INTO `share` VALUES (5, 23, 'Python源码剖析', '2020-10-07 00:00:00', '2020-10-07 00:00:00', 0, ' 陈儒', 'https://img9.doubanio.com/view/subject/s/public/s3435132.jpg', '作为主流的动态语言，Python不仅简单易学、移植性好，而且拥有强大丰富的库的支持。此外，Python强大的可扩展性，让开发人员既可以非常容易地利用C/C++编写Python的扩展模块，还能将Python嵌入到C/C++程序中，为自己的系统添加动态扩展和动态编程的能力', 1, 'https://book.douban.com/subject/27016248/', 10, 0, 'pass_ney', 'no');
INSERT INTO `share` VALUES (6, 23, 'C语言教程', '2020-10-07 00:00:00', '2020-10-07 00:00:00', 0, '郭天祥', 'https://img9.doubanio.com/view/subject/s/public/s6457519.jpg', '全书分为勾5篇，入门篇、内外部资源操作篇、提高篇、实战篇和拓展篇特别按照初学者所遇到的问题和需求路径安排全书内容以应用需求为主线，搭建了单片机技术上下游的知识体系从实际工程应用入手，通过实验过程和现象讲解单片机原理', 8, 'https://book.douban.com/subject/27016248/', 10, 0, 'pass_ney', 'no');
INSERT INTO `share` VALUES (7, 27, '数据结构（C语言版）', '2020-10-08 00:00:00', '2020-10-08 00:00:00', 1, '严蔚敏 / 吴伟民', 'https://img9.doubanio.com/view/subject/s/public/s26540471.jpg', '本书的前半部分从抽象数据类型的角度讨论各种基本类型的数据结构及其应用；后半部分主要讨论查找和排序的各种实现方法及其综合分析比较。其内容和章节编排1992年4月出版的《数据结构》（第二版）基本一致，但在本书中更突出了抽象数据类型的概念', 7, 'https://book.douban.com/subject/27016248/', 10, 0, 'pass_ney', 'no');
INSERT INTO `share` VALUES (8, 27, '物联网设计', '2020-10-08 00:00:00', '2020-10-08 00:00:00', 1, '[英] Adrian McEwen Hakim Cassimally', 'https://img9.doubanio.com/view/subject/s/public/s27964824.jpg', '本书的主要目标读者是：面对伴随物联网时代而来的硬件创业大潮，想把握其中各种机会的创业者和技术人员；物联网相关领域的从业者；对物联网感兴趣的创客、艺术家和设计师；从事与物联网相关的创新活动的大学和中学师生。', 4, 'https://book.douban.com/subject/27016248/', 10, 0, 'pass_ney', 'no');
INSERT INTO `share` VALUES (9, 27, '人工智能', '2020-10-08 07:19:28', '2020-10-08 07:19:28', 0, 'Stuart J. Russell / Peter Norvig', 'https://img9.doubanio.com/view/subject/s/public/s6829960.jpg', '《人工智能:一种现代的方法(第3版)(影印版)》最权威、最经典的人工智能教材，已被全世界100多个国家的1200多所大学用作教材', 4, 'https://book.douban.com/subject/27016248/', 5, 1, 'PASSED', '通过');
INSERT INTO `share` VALUES (10, 27, 'Effective java 中文版', '2020-10-08 07:20:16', '2020-10-08 07:20:16', 0, '[美] Joshua Bloch', 'https://img9.doubanio.com/view/subject/s/public/s3479802.jpg', '本书介绍了在Java编程中78条极具实用价值的经验规则，这些经验规则涵盖了大多数开发人员每天所面临的问题的解决方案。通过对Java平台设计专家所使用的技术的全面描述，揭示了应该做什么，不应该做什么才能产生清晰、健壮和高效的代码', 5, 'https://book.douban.com/subject/27016248/', 5, 1, 'PASSED', '通过');
INSERT INTO `share` VALUES (11, 27, '深入理解Java虚拟机', '2020-10-29 13:49:32', '2020-10-14 13:49:37', 0, ' 机械工业出版社', 'https://img9.doubanio.com/view/subject/s/public/s33531736.jpg', '本书介绍了在Java编程中78条极具实用价值的经验规则，这些经验规则涵盖了大多数开发人员每天所面临的问题的解决方案。通过对Java平台设计专家所使用的技术的全面描述，揭示了应该做什么，不应该做什么才能产生清晰、健壮和高效的代码', 0, 'https://book.douban.com/subject/27016248/', 0, 0, '0', '');
INSERT INTO `share` VALUES (12, 27, '疯狂Java讲义', '2020-10-22 13:51:36', '2020-10-21 13:51:39', 0, ' 电子工业出版社', 'https://img9.doubanio.com/view/subject/s/public/s6862076.jpg', '它选取了Java并发编程中最核心的技术进行讲解，从JDK源码、JVM、CPU等多角度全面剖析和讲解了Java并发编程的框架、工具、原理和方法，对Java并发编程进行了最为深入和透彻的阐述。', 0, 'https://book.douban.com/subject/27016248/', 0, 1, '0', '');
INSERT INTO `share` VALUES (13, 0, 'Java并发编程的艺术', '2020-10-08 13:53:36', '2020-10-21 13:53:39', 0, ' 方腾飞 / 魏鹏 / 程晓明', 'https://img9.doubanio.com/view/subject/s/public/s28275418.jpg', 'Java并发编程的艺术》内容涵盖Java并发编程机制的底层实现原理、Java内存模型、Java并发编程基础、Java中的锁、并发容器和框架', 0, 'https://book.douban.com/subject/27016248/', 0, 1, '0', '');
INSERT INTO `share` VALUES (14, 0, '实战Java高并发程序设计', '2020-10-08 13:54:41', '2020-10-15 13:54:46', 0, ' 葛一鸣 / 郭超', 'https://img9.doubanio.com/view/subject/s/public/s29405037.jpg', '《实战Java高并发程序设计》主要介绍基于Java的并行程序设计基础、思路、方法和实战。第一，立足于并发程序基础', 0, 'https://book.douban.com/subject/27016248/', 0, 1, '0', '');
INSERT INTO `share` VALUES (15, 0, 'Java Concurrency in Practice', '2020-10-30 13:55:35', '2020-10-30 13:55:39', 0, 'David Holmes / Doug Lea', 'https://img9.doubanio.com/view/subject/s/public/s4227052.jpg', 'https://img9.doubanio.com/view/subject/s/public/s4227052.jpg', 0, 'https://book.douban.com/subject/27016248/', 0, 0, '0', '');

SET FOREIGN_KEY_CHECKS = 1;
