/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : learning

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2022-05-15 09:20:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '答案ID',
  `content` varchar(1000) NOT NULL COMMENT '内容',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `question_id` bigint(20) NOT NULL COMMENT '问题ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='答案';

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(20) NOT NULL COMMENT '名称',
  `parent_id` int(11) NOT NULL COMMENT '父级ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='分类';

-- ----------------------------
-- Table structure for category_course
-- ----------------------------
DROP TABLE IF EXISTS `category_course`;
CREATE TABLE `category_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类-课程关系ID',
  `category_id` int(11) NOT NULL COMMENT '分类ID',
  `course_id` bigint(20) NOT NULL COMMENT '课程ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for chapter
-- ----------------------------
DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '小节ID',
  `section_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'section id',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `type` varchar(10) NOT NULL COMMENT '内容类型',
  `video_url` varchar(255) DEFAULT NULL COMMENT '视频链接',
  `video_time` varchar(20) DEFAULT NULL COMMENT '视频时长',
  `course_id` bigint(20) DEFAULT NULL,
  `text_content` text COMMENT '文字内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='小节';

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `price` decimal(10,2) NOT NULL COMMENT '价格',
  `description` varchar(200) NOT NULL COMMENT '简介',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `average_score` tinyint(4) NOT NULL COMMENT '平均评分',
  `cover_picture` varchar(100) NOT NULL COMMENT '封面图片地址',
  `approved` tinyint(4) NOT NULL COMMENT '审核通过',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='课程';

-- ----------------------------
-- Table structure for evaluation
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `score` tinyint(4) NOT NULL COMMENT '评分',
  `comment` varchar(255) NOT NULL COMMENT '评论',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `course_id` bigint(20) NOT NULL COMMENT '课程ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='评价';

-- ----------------------------
-- Table structure for note
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '笔记ID',
  `content` text NOT NULL COMMENT '内容',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `course_id` bigint(20) NOT NULL COMMENT '课程ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='笔记';

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trade_no` varchar(40) NOT NULL COMMENT '交易编号',
  `price` decimal(10,2) NOT NULL COMMENT '价格',
  `user_name` varchar(255) NOT NULL COMMENT '买家',
  `product_id` bigint(20) NOT NULL COMMENT '商品ID',
  `product_name` varchar(255) NOT NULL COMMENT '商品名称',
  `close_milliseconds` bigint(20) NOT NULL COMMENT '关闭时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `status` tinyint(4) NOT NULL COMMENT '状态：0->未支付 1->已支付 2->已关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单';

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '问题ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` varchar(1000) NOT NULL COMMENT '内容',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `course_id` bigint(20) NOT NULL COMMENT '课程ID',
  `answer_count` int(11) NOT NULL COMMENT '答案数量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='问题';

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(20) NOT NULL COMMENT '角色名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Table structure for section
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='章';

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `full_name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `gender` char(2) DEFAULT NULL COMMENT '性别',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `email_address` varchar(100) NOT NULL COMMENT '邮箱地址',
  `phone_number` varchar(100) DEFAULT NULL COMMENT '手机号码',
  `profile_picture` varchar(100) DEFAULT NULL COMMENT '头像链接',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Table structure for user_chapter
-- ----------------------------
DROP TABLE IF EXISTS `user_chapter`;
CREATE TABLE `user_chapter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户-章节关系ID',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `chapter_id` bigint(20) NOT NULL COMMENT '章节ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_course
-- ----------------------------
DROP TABLE IF EXISTS `user_course`;
CREATE TABLE `user_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户-课程关系ID',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `course_id` bigint(20) NOT NULL COMMENT '课程ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


INSERT INTO `role` VALUES (1, '学生', '2021-01-26 14:46:24', '2021-01-26 14:46:26');
INSERT INTO `role` VALUES (2, '教师', '2021-03-14 13:46:10', '2021-03-14 13:46:12');
INSERT INTO `role` VALUES (3, '管理员', '2021-03-14 13:46:21', '2021-03-14 13:46:24');

INSERT INTO `user` VALUES (1, 'admin', '$2a$10$YmZg6KFPsMVUyWzsxiNgOun7SYoKW1FiAqFvaqnehx2fj0xh5geSa', '张三', '男', 2, 'admin@qq.com', '15648768456', 'http://localhost:8080/dfs/profile-pictures/default.jpg', '2021-01-26 14:36:52', '2021-03-16 19:53:49');



