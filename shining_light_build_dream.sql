/*
 Navicat Premium Data Transfer

 Source Server         : database
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : shining_light_build_dream

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 10/11/2023 14:20:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answer_sheet
-- ----------------------------
DROP TABLE IF EXISTS `answer_sheet`;
CREATE TABLE `answer_sheet`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `task_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `child_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contents_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `contents_picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `contents_video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `average_grade` float NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `task_id`(`task_id`) USING BTREE,
  INDEX `child_id`(`child_id`) USING BTREE,
  CONSTRAINT `answer_sheet_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `answer_sheet_ibfk_2` FOREIGN KEY (`child_id`) REFERENCES `child` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answer_sheet
-- ----------------------------
INSERT INTO `answer_sheet` VALUES ('1720457345064910849', 'T001', 'C001', 'string', 'string', 'string', 0, '2023-11-03 14:52:58', '2023-11-03 14:52:58', 'string');
INSERT INTO `answer_sheet` VALUES ('AS001', 'T001', 'C001', 'Type 1', 'picture1.jpg', 'video1.mp4', 90, NULL, NULL, NULL);
INSERT INTO `answer_sheet` VALUES ('AS002', 'T002', 'C002', 'Type 2', 'picture2.jpg', 'video2.mp4', 85, NULL, NULL, NULL);
INSERT INTO `answer_sheet` VALUES ('AS003', 'T003', 'C003', 'Type 3', 'picture3.jpg', 'video3.mp4', 92.5, NULL, NULL, NULL);
INSERT INTO `answer_sheet` VALUES ('AS004', 'T004', 'C004', 'Type 4', 'picture4.jpg', 'video4.mp4', 88, NULL, NULL, NULL);
INSERT INTO `answer_sheet` VALUES ('AS005', 'T005', 'C005', 'Type 5', 'picture5.jpg', 'video5.mp4', 91.5, NULL, NULL, NULL);
INSERT INTO `answer_sheet` VALUES ('AS006', 'T006', 'C006', 'Type 6', 'picture6.jpg', 'video6.mp4', 87.5, NULL, NULL, NULL);
INSERT INTO `answer_sheet` VALUES ('AS007', 'T007', 'C007', 'Type 7', 'picture7.jpg', 'video7.mp4', 89, NULL, NULL, NULL);
INSERT INTO `answer_sheet` VALUES ('AS008', 'T008', 'C008', 'Type 8', 'picture8.jpg', 'video8.mp4', 86.5, NULL, NULL, NULL);
INSERT INTO `answer_sheet` VALUES ('AS009', 'T009', 'C009', 'Type 9', 'picture9.jpg', 'video9.mp4', 90.5, NULL, NULL, NULL);
INSERT INTO `answer_sheet` VALUES ('AS010', 'T010', 'C010', 'Type 10', 'picture10.jpg', 'video10.mp4', 87, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `child_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `donator_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `money` int(0) NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `love_project_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `child_id`(`child_id`) USING BTREE,
  INDEX `donator_id`(`donator_id`) USING BTREE,
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`child_id`) REFERENCES `child` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`donator_id`) REFERENCES `donator` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('B001', 'C001', '1', 1000, NULL, NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('B002', 'C002', '2', 1500, NULL, NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('B003', 'C003', '3', 750, NULL, NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('B004', 'C004', '4', 1200, NULL, NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('B005', 'C005', '5', 1800, NULL, NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('B006', 'C006', '6', 900, NULL, NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('B007', 'C007', '7', 1350, NULL, NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('B008', 'C008', '8', 1600, NULL, NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('B009', 'C009', '9', 800, NULL, NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('B010', 'C010', '10', 1400, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for call_record
-- ----------------------------
DROP TABLE IF EXISTS `call_record`;
CREATE TABLE `call_record`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `caller_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `receiver_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `duration` int(0) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `caller_id`(`caller_id`) USING BTREE,
  INDEX `receiver_id`(`receiver_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of call_record
-- ----------------------------
INSERT INTO `call_record` VALUES ('1721873054596734978', '2023-11-07 12:35:15', '2023-11-07 12:35:15', 'C001', 'V001', 0, 'string', 'string');
INSERT INTO `call_record` VALUES ('1721873650863296513', '2023-11-07 12:35:15', '2023-11-07 12:35:15', 'C001', 'V001', 0, 'string', 'string');
INSERT INTO `call_record` VALUES ('1721874784482988033', '2023-11-07 12:35:15', '2023-11-07 12:35:15', 'V001', 'C001', 0, 'string', 'string');
INSERT INTO `call_record` VALUES ('1721874870185201666', '2023-11-07 12:35:15', '2023-11-07 12:35:15', 'V001', 'C001', 0, 'string', 'string');
INSERT INTO `call_record` VALUES ('1721874883166572546', '2023-11-07 12:35:15', '2023-11-07 12:35:15', 'V001', 'C001', 0, 'string', 'string');
INSERT INTO `call_record` VALUES ('1721875573888647170', '2023-11-07 12:35:15', '2023-11-07 12:35:15', 'V001', 'C001', 0, 'string', 'string');
INSERT INTO `call_record` VALUES ('1721876361876836353', '2023-11-07 12:35:15', '2023-11-07 12:35:15', 'C001', 'V001', 0, 'string', 'string');
INSERT INTO `call_record` VALUES ('1721876832674873346', '2023-11-07 12:35:15', '2023-11-07 12:35:15', 'C001', 'V001', 0, 'string', 'string');
INSERT INTO `call_record` VALUES ('1721876901897666562', '2023-11-07 12:35:15', '2023-11-07 12:35:15', 'C001', 'V001', 0, 'string', 'string');
INSERT INTO `call_record` VALUES ('1721877686706462722', '2023-11-07 12:35:15', '2023-11-07 12:35:15', 'C001', 'V001', 0, 'string', 'string');
INSERT INTO `call_record` VALUES ('1721920655601917954', '2023-11-07 15:55:49', '2023-11-07 15:55:49', 'C001', 'V001', 0, 'zem', 'string');
INSERT INTO `call_record` VALUES ('1722579211078479874', '2023-11-09 11:37:47', NULL, 'C001', 'V001', NULL, 'a', NULL);
INSERT INTO `call_record` VALUES ('1722579250861453313', '2023-11-09 11:37:57', NULL, 'C001', 'V001', NULL, 'a', NULL);
INSERT INTO `call_record` VALUES ('1722579344180523010', '2023-11-09 11:38:19', NULL, 'C001', 'V001', NULL, 'aaa', NULL);
INSERT INTO `call_record` VALUES ('1722584158721421313', '2023-11-09 11:57:27', NULL, 'C001', 'V001', NULL, 'a', NULL);
INSERT INTO `call_record` VALUES ('string', '2023-11-07 15:55:49', '2023-11-07 15:55:49', 'C001', 'V001', 0, 'string', 'string');

-- ----------------------------
-- Table structure for chat_info
-- ----------------------------
DROP TABLE IF EXISTS `chat_info`;
CREATE TABLE `chat_info`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `poster_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `receiver_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contents_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `contents_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `contents_picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `poster_id`(`poster_id`) USING BTREE,
  INDEX `receiver_id`(`receiver_id`) USING BTREE,
  CONSTRAINT `chat_info_ibfk_1` FOREIGN KEY (`poster_id`) REFERENCES `child` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chat_info_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `volunteer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chat_info
-- ----------------------------
INSERT INTO `chat_info` VALUES ('CI001', 'C001', 'V001', 'TEXT', 'Hello, how are you?', NULL, '2023-11-01 11:00:00', NULL, NULL);
INSERT INTO `chat_info` VALUES ('CI002', 'C002', 'V002', 'TEXT', 'Hi, I\'m good. How about you?', NULL, '2023-11-02 12:30:00', NULL, NULL);
INSERT INTO `chat_info` VALUES ('CI003', 'C003', 'V003', 'TEXT', 'I\'m doing well too, thanks.', NULL, '2023-11-03 13:45:00', NULL, NULL);
INSERT INTO `chat_info` VALUES ('CI004', 'C004', 'V004', 'TEXT', 'That\'s great to hear!', NULL, '2023-11-04 15:20:00', NULL, NULL);
INSERT INTO `chat_info` VALUES ('CI005', 'C005', 'V005', 'TEXT', 'Yes, it is. Anything new?', NULL, '2023-11-05 16:10:00', NULL, NULL);
INSERT INTO `chat_info` VALUES ('CI006', 'C006', 'V006', 'TEXT', 'Not much, just the usual.', NULL, '2023-11-06 17:05:00', NULL, NULL);
INSERT INTO `chat_info` VALUES ('CI007', 'C007', 'V007', 'TEXT', 'Alright. Have a nice day!', NULL, '2023-11-07 09:30:00', NULL, NULL);
INSERT INTO `chat_info` VALUES ('CI008', 'C008', 'V008', 'TEXT', 'You too!', NULL, '2023-11-08 10:15:00', NULL, NULL);
INSERT INTO `chat_info` VALUES ('CI009', 'C009', 'V009', 'TEXT', 'Goodbye!', NULL, '2023-11-09 14:50:00', NULL, NULL);
INSERT INTO `chat_info` VALUES ('CI010', 'C010', 'V010', 'TEXT', 'Goodbye, take care!', NULL, '2023-11-10 18:00:00', NULL, NULL);

-- ----------------------------
-- Table structure for child
-- ----------------------------
DROP TABLE IF EXISTS `child`;
CREATE TABLE `child`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int(0) NULL DEFAULT NULL,
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_orphan` int(0) NULL DEFAULT NULL,
  `is_left_behind` int(0) NULL DEFAULT NULL,
  `is_disability` int(0) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `detailed_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `child_pk`(`account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of child
-- ----------------------------
INSERT INTO `child` VALUES ('C001', '111-222-3333', 'child1', 'password1', 'avatar1.jpg', 'Child 1', 8, 'M', 0, 1, 0, 'Description 1', 'Province A', 'City X', 'District 1', 'Address 1', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 1');
INSERT INTO `child` VALUES ('C002', '222-333-4444', 'child2', 'password2', 'avatar2.jpg', 'Child 2', 10, 'F', 1, 0, 0, 'Description 2', 'Province B', 'City Y', 'District 2', 'Address 2', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 2');
INSERT INTO `child` VALUES ('C003', '333-444-5555', 'child3', 'password3', 'avatar3.jpg', 'Child 3', 6, 'M', 0, 1, 1, 'Description 3', 'Province C', 'City Z', 'District 3', 'Address 3', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 3');
INSERT INTO `child` VALUES ('C004', '444-555-6666', 'child4', 'password4', 'avatar4.jpg', 'Child 4', 12, 'F', 1, 0, 0, 'Description 4', 'Province D', 'City W', 'District 4', 'Address 4', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 4');
INSERT INTO `child` VALUES ('C005', '555-666-7777', 'child5', 'password5', 'avatar5.jpg', 'Child 5', 9, 'M', 0, 0, 0, 'Description 5', 'Province E', 'City V', 'District 5', 'Address 5', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 5');
INSERT INTO `child` VALUES ('C006', '666-777-8888', 'child6', 'password6', 'avatar6.jpg', 'Child 6', 7, 'F', 0, 1, 0, 'Description 6', 'Province F', 'City U', 'District 6', 'Address 6', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 6');
INSERT INTO `child` VALUES ('C007', '777-888-9999', 'child7', 'password7', 'avatar7.jpg', 'Child 7', 11, 'M', 1, 0, 1, 'Description 7', 'Province G', 'City T', 'District 7', 'Address 7', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 7');
INSERT INTO `child` VALUES ('C008', '888-999-0000', 'child8', 'password8', 'avatar8.jpg', 'Child 8', 5, 'F', 0, 1, 0, 'Description 8', 'Province H', 'City S', 'District 8', 'Address 8', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 8');
INSERT INTO `child` VALUES ('C009', '999-000-1111', 'child9', 'password9', 'avatar9.jpg', 'Child 9', 13, 'M', 1, 0, 0, 'Description 9', 'Province I', 'City R', 'District 9', 'Address 9', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 9');
INSERT INTO `child` VALUES ('C010', '000-111-2222', '张恩铭', 'password10', 'avatar10.jpg', '张恩铭', 4, 'F', 0, 0, 1, 'Description 10', '北京市', '市辖区', '东城区', 'Address 10', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 10');

-- ----------------------------
-- Table structure for child_credit
-- ----------------------------
DROP TABLE IF EXISTS `child_credit`;
CREATE TABLE `child_credit`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `child_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `total_gained_credit` int(0) NULL DEFAULT NULL,
  `current_credit` int(0) NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `child_id`(`child_id`) USING BTREE,
  CONSTRAINT `child_credit_ibfk_1` FOREIGN KEY (`child_id`) REFERENCES `child` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of child_credit
-- ----------------------------
INSERT INTO `child_credit` VALUES ('CC001', 'C001', 500, 200, NULL, NULL, NULL);
INSERT INTO `child_credit` VALUES ('CC002', 'C002', 800, 350, NULL, NULL, NULL);
INSERT INTO `child_credit` VALUES ('CC003', 'C003', 300, 120, NULL, NULL, NULL);
INSERT INTO `child_credit` VALUES ('CC004', 'C004', 600, 280, NULL, NULL, NULL);
INSERT INTO `child_credit` VALUES ('CC005', 'C005', 950, 400, NULL, NULL, NULL);
INSERT INTO `child_credit` VALUES ('CC006', 'C006', 400, 150, NULL, NULL, NULL);
INSERT INTO `child_credit` VALUES ('CC007', 'C007', 720, 310, NULL, NULL, NULL);
INSERT INTO `child_credit` VALUES ('CC008', 'C008', 850, 390, NULL, NULL, NULL);
INSERT INTO `child_credit` VALUES ('CC009', 'C009', 250, 100, NULL, NULL, NULL);
INSERT INTO `child_credit` VALUES ('CC010', 'C010', 700, 320, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for child_volunteer
-- ----------------------------
DROP TABLE IF EXISTS `child_volunteer`;
CREATE TABLE `child_volunteer`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `child_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `volunteer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `child_id`(`child_id`) USING BTREE,
  INDEX `volunteer_id`(`volunteer_id`) USING BTREE,
  CONSTRAINT `child_volunteer_ibfk_1` FOREIGN KEY (`child_id`) REFERENCES `child` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `child_volunteer_ibfk_2` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of child_volunteer
-- ----------------------------
INSERT INTO `child_volunteer` VALUES ('CV001', 'C001', 'V001', NULL, NULL, NULL);
INSERT INTO `child_volunteer` VALUES ('CV002', 'C002', 'V002', NULL, NULL, NULL);
INSERT INTO `child_volunteer` VALUES ('CV003', 'C003', 'V003', NULL, NULL, NULL);
INSERT INTO `child_volunteer` VALUES ('CV004', 'C004', 'V004', NULL, NULL, NULL);
INSERT INTO `child_volunteer` VALUES ('CV005', 'C005', 'V005', NULL, NULL, NULL);
INSERT INTO `child_volunteer` VALUES ('CV006', 'C006', 'V006', NULL, NULL, NULL);
INSERT INTO `child_volunteer` VALUES ('CV007', 'C007', 'V007', NULL, NULL, NULL);
INSERT INTO `child_volunteer` VALUES ('CV008', 'C008', 'V008', NULL, NULL, NULL);
INSERT INTO `child_volunteer` VALUES ('CV009', 'C009', 'V009', NULL, NULL, NULL);
INSERT INTO `child_volunteer` VALUES ('CV010', 'C010', 'V010', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for donation_activity
-- ----------------------------
DROP TABLE IF EXISTS `donation_activity`;
CREATE TABLE `donation_activity`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `donator_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `donation_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `child_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `love_project_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `item_donation_info_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `donator_id`(`donator_id`) USING BTREE,
  INDEX `child_id`(`child_id`) USING BTREE,
  INDEX `item_donation_info_id`(`item_donation_info_id`) USING BTREE,
  INDEX `love_project_id`(`love_project_id`) USING BTREE,
  CONSTRAINT `donation_activity_ibfk_1` FOREIGN KEY (`donator_id`) REFERENCES `donator` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `donation_activity_ibfk_2` FOREIGN KEY (`child_id`) REFERENCES `child` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donation_activity
-- ----------------------------
INSERT INTO `donation_activity` VALUES ('1722608185062158337', '2', 'child', NULL, NULL, NULL, '', '2023-11-09 21:32:50', NULL, NULL);
INSERT INTO `donation_activity` VALUES ('1722836299553849346', '2', 'child', NULL, NULL, NULL, '', '2023-11-10 12:39:17', NULL, NULL);
INSERT INTO `donation_activity` VALUES ('1722836550729744385', '2', 'child', NULL, NULL, NULL, '', '2023-11-10 12:40:17', NULL, NULL);
INSERT INTO `donation_activity` VALUES ('1722836946940477441', '2', 'child', NULL, NULL, NULL, '', '2023-11-10 12:41:52', NULL, NULL);
INSERT INTO `donation_activity` VALUES ('DA001', '1', 'CASH', 'C001', NULL, NULL, 'Cash donation for Child 1', '2023-11-01 12:00:00', NULL, NULL);
INSERT INTO `donation_activity` VALUES ('DA002', '2', 'ITEM', 'C002', NULL, 'IDI002', 'Item donation for Child 2', '2023-11-02 17:30:00', NULL, NULL);
INSERT INTO `donation_activity` VALUES ('DA003', '3', 'CASH', 'C003', NULL, NULL, 'Cash donation for Child 3', '2023-11-03 16:15:00', NULL, NULL);
INSERT INTO `donation_activity` VALUES ('DA004', '4', 'CASH', 'C004', NULL, NULL, 'Cash donation for Child 4', '2023-11-04 18:30:00', NULL, NULL);
INSERT INTO `donation_activity` VALUES ('DA005', '5', 'PROJECT', NULL, 'LP005', NULL, 'Project donation for Love Project 5', '2023-11-05 13:45:00', NULL, NULL);
INSERT INTO `donation_activity` VALUES ('DA006', '6', 'CASH', 'C006', NULL, NULL, 'Cash donation for Child 6', '2023-11-06 11:20:00', NULL, NULL);
INSERT INTO `donation_activity` VALUES ('DA007', '7', 'CASH', 'C007', NULL, NULL, 'Cash donation for Child 7', '2023-11-07 15:50:00', NULL, NULL);
INSERT INTO `donation_activity` VALUES ('DA008', '8', 'CASH', 'C008', NULL, NULL, 'Cash donation for Child 8', '2023-11-08 14:10:00', NULL, NULL);
INSERT INTO `donation_activity` VALUES ('DA009', '9', 'ITEM', 'C009', NULL, 'IDI009', 'Item donation for Child 9', '2023-11-09 19:00:00', NULL, NULL);
INSERT INTO `donation_activity` VALUES ('DA010', '10', 'CASH', 'C010', NULL, NULL, 'Cash donation for Child 10', '2023-11-10 16:40:00', NULL, NULL);

-- ----------------------------
-- Table structure for donator
-- ----------------------------
DROP TABLE IF EXISTS `donator`;
CREATE TABLE `donator`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `idpid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int(0) NULL DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `score` int(0) NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `detailed_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donator
-- ----------------------------
INSERT INTO `donator` VALUES ('1', '1', 'avatar1.jpg', 'Donator 1', 30, '123-456-7890', 0, 'Province A', 'City X', 'District 1', 'Address 1', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 1');
INSERT INTO `donator` VALUES ('10', '10', 'avatar10.jpg', 'Donator 10', 25, '333-444-5555', 0, 'Province J', 'City Q', 'District 10', 'Address 10', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 10');
INSERT INTO `donator` VALUES ('2', '2', 'avatar2.jpg', 'Donator 2', 45, '987-654-3210', 0, 'Province B', 'City Y', 'District 2', 'Address 2', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 2');
INSERT INTO `donator` VALUES ('3', '3', 'avatar3.jpg', 'Donator 3', 28, '555-123-4567', 0, 'Province C', 'City Z', 'District 3', 'Address 3', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 3');
INSERT INTO `donator` VALUES ('4', '4', 'avatar4.jpg', 'Donator 4', 55, '111-222-3333', 0, 'Province D', 'City W', 'District 4', 'Address 4', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 4');
INSERT INTO `donator` VALUES ('5', '5', 'avatar5.jpg', 'Donator 5', 40, '999-888-7777', 0, 'Province E', 'City V', 'District 5', 'Address 5', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 5');
INSERT INTO `donator` VALUES ('6', '6', 'avatar6.jpg', 'Donator 6', 35, '444-555-6666', 0, 'Province F', 'City U', 'District 6', 'Address 6', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 6');
INSERT INTO `donator` VALUES ('7', '7', 'avatar7.jpg', 'Donator 7', 50, '777-888-9999', 0, 'Province G', 'City T', 'District 7', 'Address 7', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 7');
INSERT INTO `donator` VALUES ('8', '8', 'avatar8.jpg', 'Donator 8', 32, '222-333-4444', 0, 'Province H', 'City S', 'District 8', 'Address 8', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 8');
INSERT INTO `donator` VALUES ('9', '9', 'avatar9.jpg', 'Donator 9', 48, '666-777-8888', 0, 'Province I', 'City R', 'District 9', 'Address 9', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 9');

-- ----------------------------
-- Table structure for donator_child
-- ----------------------------
DROP TABLE IF EXISTS `donator_child`;
CREATE TABLE `donator_child`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `donator_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `child_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `donator_id`(`donator_id`) USING BTREE,
  INDEX `child_id`(`child_id`) USING BTREE,
  CONSTRAINT `donator_child_ibfk_1` FOREIGN KEY (`donator_id`) REFERENCES `donator` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `donator_child_ibfk_2` FOREIGN KEY (`child_id`) REFERENCES `child` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donator_child
-- ----------------------------
INSERT INTO `donator_child` VALUES ('1722644306454343681', '3', 'C004', '2023-11-09 23:56:23', NULL, NULL);
INSERT INTO `donator_child` VALUES ('1722644314238971905', '3', 'C005', '2023-11-09 23:56:24', NULL, NULL);
INSERT INTO `donator_child` VALUES ('1722644337836126210', '3', 'C009', '2023-11-09 23:56:30', NULL, NULL);
INSERT INTO `donator_child` VALUES ('DC001', '1', 'C001', NULL, NULL, NULL);
INSERT INTO `donator_child` VALUES ('DC002', '2', 'C002', NULL, NULL, NULL);
INSERT INTO `donator_child` VALUES ('DC003', '3', 'C003', NULL, NULL, NULL);
INSERT INTO `donator_child` VALUES ('DC004', '4', 'C004', NULL, NULL, NULL);
INSERT INTO `donator_child` VALUES ('DC005', '5', 'C005', NULL, NULL, NULL);
INSERT INTO `donator_child` VALUES ('DC006', '6', 'C006', NULL, NULL, NULL);
INSERT INTO `donator_child` VALUES ('DC007', '7', 'C007', NULL, NULL, NULL);
INSERT INTO `donator_child` VALUES ('DC008', '8', 'C008', NULL, NULL, NULL);
INSERT INTO `donator_child` VALUES ('DC009', '9', 'C009', NULL, NULL, NULL);
INSERT INTO `donator_child` VALUES ('DC010', '10', 'C010', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for donator_project
-- ----------------------------
DROP TABLE IF EXISTS `donator_project`;
CREATE TABLE `donator_project`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `donator_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `love_project_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `donator_id`(`donator_id`) USING BTREE,
  INDEX `love_project_id`(`love_project_id`) USING BTREE,
  CONSTRAINT `donator_project_ibfk_1` FOREIGN KEY (`donator_id`) REFERENCES `donator` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `donator_project_ibfk_2` FOREIGN KEY (`love_project_id`) REFERENCES `love_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donator_project
-- ----------------------------
INSERT INTO `donator_project` VALUES ('DP001', '1', 'LP001', NULL, NULL, NULL);
INSERT INTO `donator_project` VALUES ('DP002', '2', 'LP002', NULL, NULL, NULL);
INSERT INTO `donator_project` VALUES ('DP003', '3', 'LP003', NULL, NULL, NULL);
INSERT INTO `donator_project` VALUES ('DP004', '4', 'LP004', NULL, NULL, NULL);
INSERT INTO `donator_project` VALUES ('DP005', '5', 'LP005', NULL, NULL, NULL);
INSERT INTO `donator_project` VALUES ('DP006', '6', 'LP006', NULL, NULL, NULL);
INSERT INTO `donator_project` VALUES ('DP007', '7', 'LP007', NULL, NULL, NULL);
INSERT INTO `donator_project` VALUES ('DP008', '8', 'LP008', NULL, NULL, NULL);
INSERT INTO `donator_project` VALUES ('DP009', '9', 'LP009', NULL, NULL, NULL);
INSERT INTO `donator_project` VALUES ('DP010', '10', 'LP010', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for exchange_history
-- ----------------------------
DROP TABLE IF EXISTS `exchange_history`;
CREATE TABLE `exchange_history`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `child_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `love_project_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `amount` int(0) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `child_id`(`child_id`) USING BTREE,
  INDEX `love_project_id`(`love_project_id`) USING BTREE,
  CONSTRAINT `exchange_history_ibfk_1` FOREIGN KEY (`child_id`) REFERENCES `child` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exchange_history_ibfk_2` FOREIGN KEY (`love_project_id`) REFERENCES `love_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exchange_history
-- ----------------------------
INSERT INTO `exchange_history` VALUES ('EH001', 'thumbnail1.jpg', 'C001', 'LP001', 1000, 'Exchange 1', NULL, NULL, NULL);
INSERT INTO `exchange_history` VALUES ('EH002', 'thumbnail2.jpg', 'C002', 'LP002', 1500, 'Exchange 2', NULL, NULL, NULL);
INSERT INTO `exchange_history` VALUES ('EH003', 'thumbnail3.jpg', 'C003', 'LP003', 750, 'Exchange 3', NULL, NULL, NULL);
INSERT INTO `exchange_history` VALUES ('EH004', 'thumbnail4.jpg', 'C004', 'LP004', 1200, 'Exchange 4', NULL, NULL, NULL);
INSERT INTO `exchange_history` VALUES ('EH005', 'thumbnail5.jpg', 'C005', 'LP005', 1800, 'Exchange 5', NULL, NULL, NULL);
INSERT INTO `exchange_history` VALUES ('EH006', 'thumbnail6.jpg', 'C006', 'LP006', 900, 'Exchange 6', NULL, NULL, NULL);
INSERT INTO `exchange_history` VALUES ('EH007', 'thumbnail7.jpg', 'C007', 'LP007', 1350, 'Exchange 7', NULL, NULL, NULL);
INSERT INTO `exchange_history` VALUES ('EH008', 'thumbnail8.jpg', 'C008', 'LP008', 1600, 'Exchange 8', NULL, NULL, NULL);
INSERT INTO `exchange_history` VALUES ('EH009', 'thumbnail9.jpg', 'C009', 'LP009', 800, 'Exchange 9', NULL, NULL, NULL);
INSERT INTO `exchange_history` VALUES ('EH010', 'thumbnail10.jpg', 'C010', 'LP010', 1400, 'Exchange 10', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for item_donation_info
-- ----------------------------
DROP TABLE IF EXISTS `item_donation_info`;
CREATE TABLE `item_donation_info`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `item_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `item_picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `donator_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_checked` int(0) NULL DEFAULT NULL,
  `is_passed` int(0) NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `volunteer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `donator_id`(`donator_id`) USING BTREE,
  INDEX `item_donation_info_volunteer_id_fk`(`volunteer_id`) USING BTREE,
  CONSTRAINT `item_donation_info_ibfk_1` FOREIGN KEY (`donator_id`) REFERENCES `donator` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_donation_info
-- ----------------------------
INSERT INTO `item_donation_info` VALUES ('IDI001', 'Item 1', 'item1.jpg', 'Item Description 1', '1', 1, 1, NULL, NULL, NULL, 'V001');
INSERT INTO `item_donation_info` VALUES ('IDI002', 'Item 2', 'item2.jpg', 'Item Description 2', '2', 1, 1, NULL, NULL, NULL, 'V002');
INSERT INTO `item_donation_info` VALUES ('IDI003', 'Item 3', 'item3.jpg', 'Item Description 3', '3', 1, 1, NULL, NULL, NULL, 'V001');
INSERT INTO `item_donation_info` VALUES ('IDI004', 'Item 4', 'item4.jpg', 'Item Description 4', '4', 1, 1, NULL, NULL, NULL, 'V001');
INSERT INTO `item_donation_info` VALUES ('IDI005', 'Item 5', 'item5.jpg', 'Item Description 5', '5', 1, 1, NULL, NULL, NULL, 'V001');
INSERT INTO `item_donation_info` VALUES ('IDI006', 'Item 6', 'item6.jpg', 'Item Description 6', '6', 1, 1, NULL, NULL, NULL, 'V001');
INSERT INTO `item_donation_info` VALUES ('IDI007', 'Item 7', 'item7.jpg', 'Item Description 7', '7', 1, 1, NULL, NULL, NULL, 'V001');
INSERT INTO `item_donation_info` VALUES ('IDI008', 'Item 8', 'item8.jpg', 'Item Description 8', '8', 1, 1, NULL, NULL, NULL, 'V001');
INSERT INTO `item_donation_info` VALUES ('IDI009', 'Item 9', 'item9.jpg', 'Item Description 9', '9', 1, 1, NULL, NULL, NULL, 'V001');
INSERT INTO `item_donation_info` VALUES ('IDI010', 'Item 10', 'item10.jpg', 'Item Description 10', '10', 1, 1, NULL, NULL, NULL, 'V001');

-- ----------------------------
-- Table structure for love_plan
-- ----------------------------
DROP TABLE IF EXISTS `love_plan`;
CREATE TABLE `love_plan`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `target_score` int(0) NULL DEFAULT NULL,
  `is_reached` int(0) NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `donator_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `donator_id`(`donator_id`) USING BTREE,
  CONSTRAINT `love_plan_ibfk_1` FOREIGN KEY (`donator_id`) REFERENCES `donator` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of love_plan
-- ----------------------------
INSERT INTO `love_plan` VALUES ('LPN001', 80, 0, NULL, NULL, NULL, '1');
INSERT INTO `love_plan` VALUES ('LPN002', 120, 0, NULL, NULL, NULL, '2');
INSERT INTO `love_plan` VALUES ('LPN003', 60, 0, NULL, NULL, NULL, '3');
INSERT INTO `love_plan` VALUES ('LPN004', 100, 0, NULL, NULL, NULL, '4');
INSERT INTO `love_plan` VALUES ('LPN005', 150, 0, NULL, NULL, NULL, '5');
INSERT INTO `love_plan` VALUES ('LPN006', 70, 0, NULL, NULL, NULL, '6');
INSERT INTO `love_plan` VALUES ('LPN007', 135, 0, NULL, NULL, NULL, '7');
INSERT INTO `love_plan` VALUES ('LPN008', 160, 0, NULL, NULL, NULL, '8');
INSERT INTO `love_plan` VALUES ('LPN009', 50, 0, NULL, NULL, NULL, '9');
INSERT INTO `love_plan` VALUES ('LPN010', 140, 0, NULL, NULL, NULL, '10');

-- ----------------------------
-- Table structure for love_project
-- ----------------------------
DROP TABLE IF EXISTS `love_project`;
CREATE TABLE `love_project`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `item_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fund` int(0) NULL DEFAULT NULL,
  `amount` int(0) NULL DEFAULT NULL,
  `required_credit` int(0) NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of love_project
-- ----------------------------
INSERT INTO `love_project` VALUES ('LP001', 'Love Project 1', 'Item 1', 5000, 0, 100, '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 1', NULL);
INSERT INTO `love_project` VALUES ('LP002', 'Love Project 2', 'Item 2', 8000, 0, 150, '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 2', NULL);
INSERT INTO `love_project` VALUES ('LP003', 'Love Project 3', 'Item 3', 3000, 0, 75, '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 3', NULL);
INSERT INTO `love_project` VALUES ('LP004', 'Love Project 4', 'Item 4', 6000, 0, 120, '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 4', NULL);
INSERT INTO `love_project` VALUES ('LP005', 'Love Project 5', 'Item 5', 7500, 0, 180, '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 5', NULL);
INSERT INTO `love_project` VALUES ('LP006', 'Love Project 6', 'Item 6', 4000, 0, 90, '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 6', NULL);
INSERT INTO `love_project` VALUES ('LP007', 'Love Project 7', 'Item 7', 5500, 0, 135, '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 7', NULL);
INSERT INTO `love_project` VALUES ('LP008', 'Love Project 8', 'Item 8', 6500, 0, 160, '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 8', NULL);
INSERT INTO `love_project` VALUES ('LP009', 'Love Project 9', 'Item 9', 3500, 0, 70, '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 9', NULL);
INSERT INTO `love_project` VALUES ('LP010', 'Love Project 10', 'Item 10', 7000, 0, 140, '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 10', NULL);

-- ----------------------------
-- Table structure for marking_result
-- ----------------------------
DROP TABLE IF EXISTS `marking_result`;
CREATE TABLE `marking_result`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `answer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `volunteer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `grade` int(0) NULL DEFAULT NULL,
  `is_checked` int(0) NULL DEFAULT NULL,
  `contents_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `contents_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `contents_picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `answer_id`(`answer_id`) USING BTREE,
  INDEX `volunteer_id`(`volunteer_id`) USING BTREE,
  CONSTRAINT `marking_result_ibfk_1` FOREIGN KEY (`answer_id`) REFERENCES `answer_sheet` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `marking_result_ibfk_2` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of marking_result
-- ----------------------------
INSERT INTO `marking_result` VALUES ('1721404228167946241', 'AS002', 'V001', NULL, -1, NULL, NULL, NULL, '2023-11-06 13:48:45', NULL, NULL);
INSERT INTO `marking_result` VALUES ('1721404228167946242', 'AS003', 'V001', NULL, -1, NULL, NULL, NULL, '2023-11-06 13:48:45', NULL, NULL);
INSERT INTO `marking_result` VALUES ('1721404228167946243', 'AS004', 'V001', NULL, -1, NULL, NULL, NULL, '2023-11-06 13:48:45', NULL, NULL);
INSERT INTO `marking_result` VALUES ('1721404228167946244', 'AS005', 'V001', NULL, -1, NULL, NULL, NULL, '2023-11-06 13:48:45', NULL, NULL);
INSERT INTO `marking_result` VALUES ('1721404228167946245', 'AS010', 'V001', NULL, -1, NULL, NULL, NULL, '2023-11-06 13:48:45', NULL, NULL);
INSERT INTO `marking_result` VALUES ('MR001', 'AS001', 'V001', 95, 1, 'Type 1', 'Marking Result 1', 'picture1.jpg', NULL, NULL, NULL);
INSERT INTO `marking_result` VALUES ('MR002', 'AS002', 'V002', 92, 1, 'Type 2', 'Marking Result 2', 'picture2.jpg', NULL, NULL, NULL);
INSERT INTO `marking_result` VALUES ('MR003', 'AS003', 'V003', 94, 1, 'Type 3', 'Marking Result 3', 'picture3.jpg', NULL, NULL, NULL);
INSERT INTO `marking_result` VALUES ('MR004', 'AS004', 'V004', 90, 1, 'Type 4', 'Marking Result 4', 'picture4.jpg', NULL, NULL, NULL);
INSERT INTO `marking_result` VALUES ('MR005', 'AS005', 'V005', 93, 1, 'Type 5', 'Marking Result 5', 'picture5.jpg', NULL, NULL, NULL);
INSERT INTO `marking_result` VALUES ('MR006', 'AS006', 'V006', 91, 1, 'Type 6', 'Marking Result 6', 'picture6.jpg', NULL, NULL, NULL);
INSERT INTO `marking_result` VALUES ('MR007', 'AS007', 'V007', 96, 1, 'Type 7', 'Marking Result 7', 'picture7.jpg', NULL, NULL, NULL);
INSERT INTO `marking_result` VALUES ('MR008', 'AS008', 'V008', 89, 1, 'Type 8', 'Marking Result 8', 'picture8.jpg', NULL, NULL, NULL);
INSERT INTO `marking_result` VALUES ('MR009', 'AS009', 'V009', 97, 1, 'Type 9', 'Marking Result 9', 'picture9.jpg', NULL, NULL, NULL);
INSERT INTO `marking_result` VALUES ('MR010', 'AS010', 'V010', 88, 1, 'Type 10', 'Marking Result 10', 'picture10.jpg', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for personal_info_change_request
-- ----------------------------
DROP TABLE IF EXISTS `personal_info_change_request`;
CREATE TABLE `personal_info_change_request`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applicant_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contents_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `is_visited` int(0) NOT NULL DEFAULT 0,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `applicant_id`(`applicant_id`) USING BTREE,
  CONSTRAINT `personal_info_change_request_ibfk_1` FOREIGN KEY (`applicant_id`) REFERENCES `child` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_info_change_request
-- ----------------------------
INSERT INTO `personal_info_change_request` VALUES ('PIR001', 'C001', 'Change request 1', 0, NULL, NULL);
INSERT INTO `personal_info_change_request` VALUES ('PIR002', 'C002', 'Change request 2', 0, NULL, NULL);
INSERT INTO `personal_info_change_request` VALUES ('PIR003', 'C003', 'Change request 3', 1, NULL, NULL);
INSERT INTO `personal_info_change_request` VALUES ('PIR004', 'C004', 'Change request 4', 0, NULL, NULL);
INSERT INTO `personal_info_change_request` VALUES ('PIR005', 'C005', 'Change request 5', 1, NULL, NULL);
INSERT INTO `personal_info_change_request` VALUES ('PIR006', 'C006', 'Change request 6', 1, NULL, NULL);
INSERT INTO `personal_info_change_request` VALUES ('PIR007', 'C007', 'Change request 7', 0, NULL, NULL);
INSERT INTO `personal_info_change_request` VALUES ('PIR008', 'C008', 'Change request 8', 1, NULL, NULL);
INSERT INTO `personal_info_change_request` VALUES ('PIR009', 'C009', 'Change request 9', 0, NULL, NULL);
INSERT INTO `personal_info_change_request` VALUES ('PIR010', 'C010', 'Change request 10', 1, NULL, NULL);

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `itme_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('1', 'bag_2776.JPG', '0', NULL);
INSERT INTO `picture` VALUES ('10', 'bag_2777.JPG', '0', NULL);
INSERT INTO `picture` VALUES ('11', 'bag_2778.JPG', '0', NULL);
INSERT INTO `picture` VALUES ('12', 'bag_2788.JPG', '0', NULL);
INSERT INTO `picture` VALUES ('13', 'bag_2789.JPG', '0', NULL);
INSERT INTO `picture` VALUES ('14', 'bag_2790.JPG', '0', NULL);
INSERT INTO `picture` VALUES ('15', 'bag_2791.JPG', '0', NULL);
INSERT INTO `picture` VALUES ('2', 'PenBag_2779.JPG', '1', NULL);
INSERT INTO `picture` VALUES ('3', 'PenBag_2780.JPG', '1', NULL);
INSERT INTO `picture` VALUES ('4', 'PenBag_2781.JPG', '1', NULL);
INSERT INTO `picture` VALUES ('5', 'PenBag_2782.JPG', '1', NULL);
INSERT INTO `picture` VALUES ('6', 'PenBag_2785.JPG', '1', NULL);
INSERT INTO `picture` VALUES ('7', 'PenBag_2786.JPG', '1', NULL);
INSERT INTO `picture` VALUES ('8', 'PenBag_2787.JPG', '1', NULL);

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `from_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `to_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contents_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `contents_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `contents_picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `from_id`(`from_id`) USING BTREE,
  INDEX `to_id`(`to_id`) USING BTREE,
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`from_id`) REFERENCES `volunteer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `report_ibfk_2` FOREIGN KEY (`to_id`) REFERENCES `child` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES ('R001', 'V001', 'C001', 'Type 1', 'Report 1 to Child 1', 'picture1.jpg', NULL, NULL);
INSERT INTO `report` VALUES ('R002', 'V002', 'C002', 'Type 2', 'Report 2 to Child 2', 'picture2.jpg', NULL, NULL);
INSERT INTO `report` VALUES ('R003', 'V003', 'C003', 'Type 3', 'Report 3 to Child 3', 'picture3.jpg', NULL, NULL);
INSERT INTO `report` VALUES ('R004', 'V004', 'C004', 'Type 4', 'Report 4 to Child 4', 'picture4.jpg', NULL, NULL);
INSERT INTO `report` VALUES ('R005', 'V005', 'C005', 'Type 5', 'Report 5 to Child 5', 'picture5.jpg', NULL, NULL);
INSERT INTO `report` VALUES ('R006', 'V006', 'C006', 'Type 6', 'Report 6 to Child 6', 'picture6.jpg', NULL, NULL);
INSERT INTO `report` VALUES ('R007', 'V007', 'C007', 'Type 7', 'Report 7 to Child 7', 'picture7.jpg', NULL, NULL);
INSERT INTO `report` VALUES ('R008', 'V008', 'C008', 'Type 8', 'Report 8 to Child 8', 'picture8.jpg', NULL, NULL);
INSERT INTO `report` VALUES ('R009', 'V009', 'C009', 'Type 9', 'Report 9 to Child 9', 'picture9.jpg', NULL, NULL);
INSERT INTO `report` VALUES ('R010', 'V010', 'C010', 'Type 10', 'Report 10 to Child 10', 'picture10.jpg', NULL, NULL);

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `deadline` datetime(0) NULL DEFAULT NULL,
  `contents_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_necessary` int(0) NULL DEFAULT NULL,
  `correction_times` int(0) NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('T001', 'thumbnail1.jpg', 'Task 1', 'Description 1', '2023-12-01 00:00:00', 'Type 1', 1, NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES ('T002', 'thumbnail2.jpg', 'Task 2', 'Description 2', '2023-11-15 00:00:00', 'Type 2', 0, NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES ('T003', 'thumbnail3.jpg', 'Task 3', 'Description 3', '2023-11-30 00:00:00', 'Type 3', 1, NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES ('T004', 'thumbnail4.jpg', 'Task 4', 'Description 4', '2023-12-10 00:00:00', 'Type 4', 0, NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES ('T005', 'thumbnail5.jpg', 'Task 5', 'Description 5', '2023-12-05 00:00:00', 'Type 5', 1, NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES ('T006', 'thumbnail6.jpg', 'Task 6', 'Description 6', '2023-11-20 00:00:00', 'Type 6', 0, NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES ('T007', 'thumbnail7.jpg', 'Task 7', 'Description 7', '2023-12-15 00:00:00', 'Type 7', 1, NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES ('T008', 'thumbnail8.jpg', 'Task 8', 'Description 8', '2023-11-25 00:00:00', 'Type 8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES ('T009', 'thumbnail9.jpg', 'Task 9', 'Description 9', '2023-12-20 00:00:00', 'Type 9', 1, NULL, NULL, NULL, NULL);
INSERT INTO `task` VALUES ('T010', 'thumbnail10.jpg', 'Task 10', 'Description 10', '2023-11-28 00:00:00', 'Type 10', 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for task_history
-- ----------------------------
DROP TABLE IF EXISTS `task_history`;
CREATE TABLE `task_history`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `child_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `task_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `child_id`(`child_id`) USING BTREE,
  INDEX `task_id`(`task_id`) USING BTREE,
  CONSTRAINT `task_history_ibfk_1` FOREIGN KEY (`child_id`) REFERENCES `child` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `task_history_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_history
-- ----------------------------
INSERT INTO `task_history` VALUES ('TH001', 'thumbnail1.jpg', 'C001', 'T001', 'Task History 1', NULL, NULL, NULL);
INSERT INTO `task_history` VALUES ('TH002', 'thumbnail2.jpg', 'C002', 'T002', 'Task History 2', NULL, NULL, NULL);
INSERT INTO `task_history` VALUES ('TH003', 'thumbnail3.jpg', 'C003', 'T003', 'Task History 3', NULL, NULL, NULL);
INSERT INTO `task_history` VALUES ('TH004', 'thumbnail4.jpg', 'C004', 'T004', 'Task History 4', NULL, NULL, NULL);
INSERT INTO `task_history` VALUES ('TH005', 'thumbnail5.jpg', 'C005', 'T005', 'Task History 5', NULL, NULL, NULL);
INSERT INTO `task_history` VALUES ('TH006', 'thumbnail6.jpg', 'C006', 'T006', 'Task History 6', NULL, NULL, NULL);
INSERT INTO `task_history` VALUES ('TH007', 'thumbnail7.jpg', 'C007', 'T007', 'Task History 7', NULL, NULL, NULL);
INSERT INTO `task_history` VALUES ('TH008', 'thumbnail8.jpg', 'C008', 'T008', 'Task History 8', NULL, NULL, NULL);
INSERT INTO `task_history` VALUES ('TH009', 'thumbnail9.jpg', 'C009', 'T009', 'Task History 9', NULL, NULL, NULL);
INSERT INTO `task_history` VALUES ('TH010', 'thumbnail10.jpg', 'C010', 'T010', 'Task History 10', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for volunteer
-- ----------------------------
DROP TABLE IF EXISTS `volunteer`;
CREATE TABLE `volunteer`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int(0) NULL DEFAULT NULL,
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `has_authority` int(0) NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `detailed_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `volunteer_pk`(`account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of volunteer
-- ----------------------------
INSERT INTO `volunteer` VALUES ('V001', 'volunteer1', 'password1', 'avatar1.jpg', 'Volunteer 1', 30, 'M', 1, 'Province A', 'City X', 'District 1', 'Description 1', 'Address 1', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 1');
INSERT INTO `volunteer` VALUES ('V002', 'volunteer2', 'password2', 'avatar2.jpg', 'Volunteer 2', 25, 'F', 0, 'Province B', 'City Y', 'District 2', 'Description 2', 'Address 2', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 2');
INSERT INTO `volunteer` VALUES ('V003', 'volunteer3', 'password3', 'avatar3.jpg', 'Volunteer 3', 40, 'M', 1, 'Province C', 'City Z', 'District 3', 'Description 3', 'Address 3', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 3');
INSERT INTO `volunteer` VALUES ('V004', 'volunteer4', 'password4', 'avatar4.jpg', 'Volunteer 4', 35, 'F', 0, 'Province D', 'City W', 'District 4', 'Description 4', 'Address 4', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 4');
INSERT INTO `volunteer` VALUES ('V005', 'volunteer5', 'password5', 'avatar5.jpg', 'Volunteer 5', 28, 'M', 1, 'Province E', 'City V', 'District 5', 'Description 5', 'Address 5', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 5');
INSERT INTO `volunteer` VALUES ('V006', 'volunteer6', 'password6', 'avatar6.jpg', 'Volunteer 6', 45, 'F', 0, 'Province F', 'City U', 'District 6', 'Description 6', 'Address 6', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 6');
INSERT INTO `volunteer` VALUES ('V007', 'volunteer7', 'password7', 'avatar7.jpg', 'Volunteer 7', 32, 'M', 1, 'Province G', 'City T', 'District 7', 'Description 7', 'Address 7', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 7');
INSERT INTO `volunteer` VALUES ('V008', 'volunteer8', 'password8', 'avatar8.jpg', 'Volunteer 8', 29, 'F', 0, 'Province H', 'City S', 'District 8', 'Description 8', 'Address 8', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 8');
INSERT INTO `volunteer` VALUES ('V009', 'volunteer9', 'password9', 'avatar9.jpg', 'Volunteer 9', 38, 'M', 1, 'Province I', 'City R', 'District 9', 'Description 9', 'Address 9', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 9');
INSERT INTO `volunteer` VALUES ('V010', 'volunteer10', 'password10', 'avatar10.jpg', 'Volunteer 10', 27, 'F', 0, 'Province J', 'City Q', 'District 10', 'Description 10', 'Address 10', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 10');

-- ----------------------------
-- Table structure for volunteer_credit
-- ----------------------------
DROP TABLE IF EXISTS `volunteer_credit`;
CREATE TABLE `volunteer_credit`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `volunteer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `current_credit` int(0) NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `volunteer_id`(`volunteer_id`) USING BTREE,
  CONSTRAINT `volunteer_credit_ibfk_1` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of volunteer_credit
-- ----------------------------
INSERT INTO `volunteer_credit` VALUES ('VC001', 'V001', 500, NULL, NULL, NULL);
INSERT INTO `volunteer_credit` VALUES ('VC002', 'V002', 800, NULL, NULL, NULL);
INSERT INTO `volunteer_credit` VALUES ('VC003', 'V003', 300, NULL, NULL, NULL);
INSERT INTO `volunteer_credit` VALUES ('VC004', 'V004', 600, NULL, NULL, NULL);
INSERT INTO `volunteer_credit` VALUES ('VC005', 'V005', 950, NULL, NULL, NULL);
INSERT INTO `volunteer_credit` VALUES ('VC006', 'V006', 400, NULL, NULL, NULL);
INSERT INTO `volunteer_credit` VALUES ('VC007', 'V007', 720, NULL, NULL, NULL);
INSERT INTO `volunteer_credit` VALUES ('VC008', 'V008', 850, NULL, NULL, NULL);
INSERT INTO `volunteer_credit` VALUES ('VC009', 'V009', 250, NULL, NULL, NULL);
INSERT INTO `volunteer_credit` VALUES ('VC010', 'V010', 700, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
