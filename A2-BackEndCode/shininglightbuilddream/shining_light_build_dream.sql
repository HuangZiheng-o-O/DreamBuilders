
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
INSERT INTO `answer_sheet` VALUES ('1723170633255202817', 'T001', 'C001', 'picture', 'task/16996708707116.png', '', 0, '2023-11-11 10:47:49', NULL, NULL);
INSERT INTO `answer_sheet` VALUES ('1723287786671263745', 'T001', 'C001', 'picture', 'task/1699698803374121.jpg', '', 0, '2023-11-11 18:33:20', NULL, NULL);
INSERT INTO `answer_sheet` VALUES ('1723289710443347969', 'T001', 'C001', 'picture', 'task/1699699261368121.jpg', '', 0, '2023-11-11 18:40:59', NULL, NULL);
INSERT INTO `answer_sheet` VALUES ('1723293422997954561', 'T003', 'C001', 'picture', 'task/169970014861496.jpg', '', 0, '2023-11-11 18:55:44', NULL, NULL);
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
  `child_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `donator_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `money` int(0) NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `love_project_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `child_id`(`child_id`) USING BTREE,
  INDEX `donator_id`(`donator_id`) USING BTREE,
  CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`donator_id`) REFERENCES `donator` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('1722930164814295042', NULL, '2', 80, '2023-11-10 18:52:16', NULL, NULL, 'LP001');
INSERT INTO `bill` VALUES ('1722931948999913474', 'C002', '3', 80, '2023-11-10 18:59:22', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722932158681559041', 'C002', '3', 80, '2023-11-10 19:00:12', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722932288348467202', 'C002', '3', 80, '2023-11-10 19:00:43', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722932858144665602', NULL, '2', 80, '2023-11-10 19:02:59', NULL, NULL, 'LP001');
INSERT INTO `bill` VALUES ('1722937231327334402', 'C002', '3', 80, '2023-11-10 19:20:21', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722938476138024962', 'C001', '3', 80, '2023-11-10 19:25:18', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722938529044975617', 'C001', '3', 80, '2023-11-10 19:25:31', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722944345336659969', 'C001', '3', 80, '2023-11-10 19:48:37', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722949328710877185', 'C001', '3', 500, '2023-11-10 20:08:25', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722949801220218881', 'C001', '3', 500, '2023-11-10 20:10:18', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722950418349137922', 'C002', '3', 1, '2023-11-10 20:12:45', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722950527417819138', 'C002', '3', 100, '2023-11-10 20:13:11', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722951470892949506', 'C001', '3', 100, '2023-11-10 20:16:56', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722951480556625921', 'C001', '3', 100, '2023-11-10 20:16:59', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722951483148705793', 'C001', '3', 100, '2023-11-10 20:16:59', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722951775818838018', 'C001', '3', 100, '2023-11-10 20:18:09', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722951991334776833', 'C001', '3', 100, '2023-11-10 20:19:00', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722952000465776641', 'C001', '3', 100, '2023-11-10 20:19:02', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722952430306439170', 'C001', '3', 100, '2023-11-10 20:20:45', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722952442256011265', 'C001', '3', 1, '2023-11-10 20:20:48', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722952451944853506', 'C001', '3', 1, '2023-11-10 20:20:50', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722955016124215297', NULL, '2', 80, '2023-11-10 20:31:01', NULL, NULL, 'LP001');
INSERT INTO `bill` VALUES ('1722956234372395010', NULL, '1', 20, '2023-11-10 20:35:52', NULL, NULL, 'LP001');
INSERT INTO `bill` VALUES ('1722956242899415042', NULL, '1', 20, '2023-11-10 20:35:54', NULL, NULL, 'LP001');
INSERT INTO `bill` VALUES ('1722959254858481666', 'C002', '3', 10, '2023-11-10 20:47:52', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722959262685052930', 'C002', '3', 10, '2023-11-10 20:47:54', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722959264366968834', 'C002', '3', 10, '2023-11-10 20:47:54', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722960533454299137', 'C001', '3', 0, '2023-11-10 20:52:57', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722968123286482945', 'C001', '3', 200, '2023-11-10 21:23:06', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722968665844871170', 'C001', '3', 80, '2023-11-10 21:25:16', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722969614537715713', 'C002', '3', 0, '2023-11-10 21:29:02', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722970978487627778', 'C001', '3', 0, '2023-11-10 21:34:27', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722974419318468609', 'C001', '3', 0, '2023-11-10 21:48:08', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722974801260179457', 'C001', '3', 0, '2023-11-10 21:49:39', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722974965211328513', 'C001', '3', -1, '2023-11-10 21:50:18', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722976225146695682', 'C001', '3', 1, '2023-11-10 21:55:18', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722976887641206785', 'C001', '3', 1, '2023-11-10 21:57:56', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1722977594180104194', 'C001', '3', 500, '2023-11-10 22:00:44', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1723201399095812097', 'C001', '2', 80, '2023-11-11 12:50:04', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1723290360271073282', 'C001', '2', 80, '2023-11-11 18:43:34', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1723301465655603202', 'C001', '2', 200, '2023-11-11 19:27:41', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1723301501760172034', 'C001', '2', 500, '2023-11-11 19:27:50', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1723301562606940162', 'C001', '2', 80, '2023-11-11 19:28:05', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1723301748141977602', NULL, '2', 0, '2023-11-11 19:28:49', NULL, NULL, 'LP001');
INSERT INTO `bill` VALUES ('1723301830128037889', NULL, '2', 0, '2023-11-11 19:29:08', NULL, NULL, 'LP001');
INSERT INTO `bill` VALUES ('1723302829932670978', 'C007', '2', 200, '2023-11-11 19:33:07', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1723302958467117057', 'C007', '2', 679, '2023-11-11 19:33:37', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1723303068320133121', 'C007', '2', 80, '2023-11-11 19:34:04', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1723303142043414529', 'C009', '2', 80, '2023-11-11 19:34:21', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1723307264826122242', 'C001', '2', 80, '2023-11-11 19:50:44', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1723327367605116930', 'C001', '2', 100, '2023-11-11 21:10:37', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1723327458030116865', 'C001', '2', 1, '2023-11-11 21:10:59', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1723328977957806082', 'C001', '2', 199, '2023-11-11 21:17:01', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1723331127236616193', 'C004', '2', 80, '2023-11-11 21:25:33', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1723376525112217601', 'C001', '3', 80, '2023-11-12 00:25:57', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1723376648865157122', 'C001', '3', 500, '2023-11-12 00:26:27', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1723376955691077633', NULL, '2', 0, '2023-11-12 00:27:40', NULL, NULL, 'LP003');
INSERT INTO `bill` VALUES ('1723377042253123585', NULL, '2', 500, '2023-11-12 00:28:00', NULL, NULL, 'LP003');
INSERT INTO `bill` VALUES ('1723379264668012545', NULL, '2', 100000, '2023-11-12 00:36:50', NULL, NULL, 'LP001');
INSERT INTO `bill` VALUES ('1723379986570645505', NULL, '2', 80, '2023-11-12 00:39:42', NULL, NULL, 'LP001');
INSERT INTO `bill` VALUES ('1723380406927986689', 'C010', '3', 10, '2023-11-12 00:41:23', NULL, NULL, NULL);
INSERT INTO `bill` VALUES ('1723381376059674625', NULL, '2', 10, '2023-11-12 00:45:14', NULL, NULL, 'LP003');
INSERT INTO `bill` VALUES ('1723510153087512578', NULL, '2', 80, '2023-11-12 09:16:56', NULL, NULL, 'LP001');
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
INSERT INTO `call_record` VALUES ('1723178536573841410', '2023-11-11 03:19:19', NULL, 'V001', 'C001', NULL, 'bb', NULL);
INSERT INTO `call_record` VALUES ('1723179429738295298', '2023-11-11 03:22:52', NULL, 'V001', 'C001', NULL, 'bbooo', NULL);
INSERT INTO `call_record` VALUES ('1723179782764474370', '2023-11-11 03:24:16', NULL, 'V001', 'C001', NULL, 'gg', NULL);
INSERT INTO `call_record` VALUES ('1723314265744351233', '2023-11-11 12:18:39', NULL, 'C001', 'V001', NULL, 'g', NULL);
INSERT INTO `call_record` VALUES ('1723315027111190530', '2023-11-11 12:21:41', NULL, 'C001', 'V001', NULL, 'hh', NULL);
INSERT INTO `call_record` VALUES ('1723315209433391106', '2023-11-11 12:22:24', NULL, 'C001', 'V001', NULL, 'kk', NULL);
INSERT INTO `call_record` VALUES ('1723315430473211905', '2023-11-11 12:23:17', NULL, 'C001', 'V001', NULL, 'jjj', NULL);
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
INSERT INTO `child` VALUES ('C001', '111-222-3333', 'child1', 'password1', 'child/childAvatar1.jpg', '陈盈昆', 8, 'M', 0, 1, 0, 'Description 1', '云南省', '保山市', '昌宁县', '翻斗花园', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 1');
INSERT INTO `child` VALUES ('C002', '222-333-4444', 'child2', 'password2', 'child/childAvatar2.jpg', '谈亭美', 10, 'F', 1, 0, 0, 'Description 2', '云南省', '保山市', '昌宁县', '青青草原', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 2');
INSERT INTO `child` VALUES ('C003', '333-444-5555', 'child3', 'password3', 'child/childAvatar2.jpg', '张芳坚', 6, 'M', 0, 1, 1, 'Description 3', '云南省', '保山市', '昌宁县', '呼伦贝尔大草原', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 3');
INSERT INTO `child` VALUES ('C004', '444-555-6666', 'child4', 'password4', 'child/childAvatar3.jpg', 'Child 4', 12, 'F', 1, 0, 0, 'Description 4', '云南省', '保山市', '昌宁县', '理塘广场', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 4');
INSERT INTO `child` VALUES ('C005', '555-666-7777', '陈盈昆', 'password5', '', 'Child 5', 9, 'M', 0, 0, 0, 'Description 5', '云南省', '保山市', '昌宁县', '羊村', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 5');
INSERT INTO `child` VALUES ('C006', '666-777-8888', '谈亭美', 'password6', 'avatar6.jpg', 'Child 6', 7, 'F', 0, 1, 0, 'Description 6', '云南省', '保山市', '昌宁县', '翻斗花园', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 6');
INSERT INTO `child` VALUES ('C007', '777-888-9999', '张芳坚', 'password7', 'avatar7.jpg', 'Child 7', 11, 'M', 1, 0, 1, 'Description 7', '云南省', '保山市', '昌宁县', '翻斗花园', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 7');
INSERT INTO `child` VALUES ('C008', '888-999-0000', '丁俊毅', 'password8', 'avatar8.jpg', 'Child 8', 5, 'F', 0, 1, 0, 'Description 8', '云南省', '保山市', '昌宁县', '翻斗花园', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 8');
INSERT INTO `child` VALUES ('C009', '999-000-1111', '白山贵', 'password9', 'avatar9.jpg', 'Child 9', 13, 'M', 1, 0, 0, 'Description 9', '云南省', '保山市', '昌宁县', '翻斗花园', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 9');
INSERT INTO `child` VALUES ('C010', '000-111-2222', '陈胜火', 'password10', 'avatar10.jpg', 'Child 10', 4, 'F', 0, 0, 1, 'Description 10', '北京市', '市辖区', '东城区', '天安门广场', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 10');

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
INSERT INTO `child_credit` VALUES ('CC001', 'C001', 1111504, 99404, '2023-11-10 16:40:45', NULL, NULL);
INSERT INTO `child_credit` VALUES ('CC002', 'C002', 800, 350, '2023-11-10 16:40:49', NULL, NULL);
INSERT INTO `child_credit` VALUES ('CC003', 'C003', 300, 120, '2023-08-10 16:40:53', NULL, NULL);
INSERT INTO `child_credit` VALUES ('CC004', 'C004', 600, 280, '2023-06-10 16:40:50', NULL, NULL);
INSERT INTO `child_credit` VALUES ('CC005', 'C005', 950, 400, '2023-11-10 16:36:16', NULL, NULL);
INSERT INTO `child_credit` VALUES ('CC006', 'C006', 400, 150, '2023-12-10 16:40:56', NULL, NULL);
INSERT INTO `child_credit` VALUES ('CC007', 'C007', 720, 310, '2023-11-10 16:41:15', NULL, NULL);
INSERT INTO `child_credit` VALUES ('CC008', 'C008', 850, 390, '2023-11-10 16:41:00', NULL, NULL);
INSERT INTO `child_credit` VALUES ('CC009', 'C009', 250, 100, '2021-11-14 16:41:06', NULL, NULL);
INSERT INTO `child_credit` VALUES ('CC010', 'C010', 700, 320, '2023-05-10 16:41:12', NULL, NULL);

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
  `bill_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
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
INSERT INTO `donation_activity` VALUES ('1722608185062158337', '2', 'child', NULL, NULL, NULL, '', '2023-11-09 21:32:50', NULL, NULL, NULL);
INSERT INTO `donation_activity` VALUES ('1722836299553849346', '2', 'child', NULL, NULL, NULL, '', '2023-11-10 12:39:17', NULL, NULL, NULL);
INSERT INTO `donation_activity` VALUES ('1722836550729744385', '2', 'child', NULL, NULL, NULL, '', '2023-11-10 12:40:17', NULL, NULL, NULL);
INSERT INTO `donation_activity` VALUES ('1722836946940477441', '2', 'child', NULL, NULL, NULL, '', '2023-11-10 12:41:52', NULL, NULL, NULL);
INSERT INTO `donation_activity` VALUES ('1722901758231851009', '2', 'PROJECT', NULL, NULL, NULL, 'zem,12312312312,北京市,市辖区,东城区,对zem来说有点多余,null,null', '2023-11-10 16:59:24', NULL, NULL, NULL);
INSERT INTO `donation_activity` VALUES ('1722930164814295043', '2', NULL, NULL, 'LP001', NULL, NULL, '2023-11-10 18:52:16', NULL, NULL, '1722930164814295042');
INSERT INTO `donation_activity` VALUES ('1722931949067022337', '3', 'child', 'C002', NULL, NULL, '', '2023-11-10 18:59:22', NULL, NULL, '1722931948999913474');
INSERT INTO `donation_activity` VALUES ('1722932158748667906', '3', 'child', 'C002', NULL, NULL, '', '2023-11-10 19:00:12', NULL, NULL, '1722932158681559041');
INSERT INTO `donation_activity` VALUES ('1722932288348467203', '3', 'child', 'C002', NULL, NULL, '', '2023-11-10 19:00:43', NULL, NULL, '1722932288348467202');
INSERT INTO `donation_activity` VALUES ('1722932858207580161', '2', NULL, NULL, 'LP001', NULL, NULL, '2023-11-10 19:02:59', NULL, NULL, '1722932858144665602');
INSERT INTO `donation_activity` VALUES ('1722937231327334403', '3', 'child', 'C002', NULL, NULL, '', '2023-11-10 19:20:21', NULL, NULL, '1722937231327334402');
INSERT INTO `donation_activity` VALUES ('1722938476138024963', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 19:25:18', NULL, NULL, '1722938476138024962');
INSERT INTO `donation_activity` VALUES ('1722938529112084482', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 19:25:31', NULL, NULL, '1722938529044975617');
INSERT INTO `donation_activity` VALUES ('1722944345336659970', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 19:48:37', NULL, NULL, '1722944345336659969');
INSERT INTO `donation_activity` VALUES ('1722949328710877186', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 20:08:25', NULL, NULL, '1722949328710877185');
INSERT INTO `donation_activity` VALUES ('1722949801249579009', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 20:10:18', NULL, NULL, '1722949801220218881');
INSERT INTO `donation_activity` VALUES ('1722950418349137923', '3', 'child', 'C002', NULL, NULL, '', '2023-11-10 20:12:45', NULL, NULL, '1722950418349137922');
INSERT INTO `donation_activity` VALUES ('1722950527480733697', '3', 'child', 'C002', NULL, NULL, '', '2023-11-10 20:13:11', NULL, NULL, '1722950527417819138');
INSERT INTO `donation_activity` VALUES ('1722951470955864066', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 20:16:56', NULL, NULL, '1722951470892949506');
INSERT INTO `donation_activity` VALUES ('1722951480556625922', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 20:16:59', NULL, NULL, '1722951480556625921');
INSERT INTO `donation_activity` VALUES ('1722951483148705794', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 20:16:59', NULL, NULL, '1722951483148705793');
INSERT INTO `donation_activity` VALUES ('1722951777068740610', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 20:18:09', NULL, NULL, '1722951775818838018');
INSERT INTO `donation_activity` VALUES ('1722951991808733185', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 20:19:00', NULL, NULL, '1722951991334776833');
INSERT INTO `donation_activity` VALUES ('1722952000532885505', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 20:19:02', NULL, NULL, '1722952000465776641');
INSERT INTO `donation_activity` VALUES ('1722952430373548034', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 20:20:45', NULL, NULL, '1722952430306439170');
INSERT INTO `donation_activity` VALUES ('1722952442256011266', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 20:20:48', NULL, NULL, '1722952442256011265');
INSERT INTO `donation_activity` VALUES ('1722952451944853507', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 20:20:50', NULL, NULL, '1722952451944853506');
INSERT INTO `donation_activity` VALUES ('1722955016191324161', '2', NULL, NULL, 'LP001', NULL, NULL, '2023-11-10 20:31:01', NULL, NULL, '1722955016124215297');
INSERT INTO `donation_activity` VALUES ('1722956234372395011', '1', NULL, NULL, 'LP001', NULL, NULL, '2023-11-10 20:35:52', NULL, NULL, '1722956234372395010');
INSERT INTO `donation_activity` VALUES ('1722956242962329602', '1', NULL, NULL, 'LP001', NULL, NULL, '2023-11-10 20:35:54', NULL, NULL, '1722956242899415042');
INSERT INTO `donation_activity` VALUES ('1722959255038836737', '3', 'child', 'C002', NULL, NULL, '', '2023-11-10 20:47:52', NULL, NULL, '1722959254858481666');
INSERT INTO `donation_activity` VALUES ('1722959262747967490', '3', 'child', 'C002', NULL, NULL, '', '2023-11-10 20:47:54', NULL, NULL, '1722959262685052930');
INSERT INTO `donation_activity` VALUES ('1722959264429883394', '3', 'child', 'C002', NULL, NULL, '', '2023-11-10 20:47:54', NULL, NULL, '1722959264366968834');
INSERT INTO `donation_activity` VALUES ('1722960533634654209', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 20:52:57', NULL, NULL, '1722960533454299137');
INSERT INTO `donation_activity` VALUES ('1722968123328425985', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 21:23:06', NULL, NULL, '1722968123286482945');
INSERT INTO `donation_activity` VALUES ('1722968665911980034', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 21:25:16', NULL, NULL, '1722968665844871170');
INSERT INTO `donation_activity` VALUES ('1722969614600630273', '3', 'child', 'C002', NULL, NULL, '', '2023-11-10 21:29:02', NULL, NULL, '1722969614537715713');
INSERT INTO `donation_activity` VALUES ('1722970978487627779', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 21:34:27', NULL, NULL, '1722970978487627778');
INSERT INTO `donation_activity` VALUES ('1722974419381383169', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 21:48:08', NULL, NULL, '1722974419318468609');
INSERT INTO `donation_activity` VALUES ('1722974801327288322', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 21:49:39', NULL, NULL, '1722974801260179457');
INSERT INTO `donation_activity` VALUES ('1722974965211328514', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 21:50:18', NULL, NULL, '1722974965211328513');
INSERT INTO `donation_activity` VALUES ('1722976225209610242', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 21:55:18', NULL, NULL, '1722976225146695682');
INSERT INTO `donation_activity` VALUES ('1722976887708315650', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 21:57:56', NULL, NULL, '1722976887641206785');
INSERT INTO `donation_activity` VALUES ('1722977594180104195', '3', 'child', 'C001', NULL, NULL, '', '2023-11-10 22:00:44', NULL, NULL, '1722977594180104194');
INSERT INTO `donation_activity` VALUES ('1723201399095812098', '2', 'child', 'C001', NULL, NULL, '', '2023-11-11 12:50:04', NULL, NULL, '1723201399095812097');
INSERT INTO `donation_activity` VALUES ('1723290360304627713', '2', 'child', 'C001', NULL, NULL, '', '2023-11-11 18:43:34', NULL, NULL, '1723290360271073282');
INSERT INTO `donation_activity` VALUES ('1723301465655603203', '2', 'child', 'C001', NULL, NULL, '', '2023-11-11 19:27:41', NULL, NULL, '1723301465655603202');
INSERT INTO `donation_activity` VALUES ('1723301501823086593', '2', 'child', 'C001', NULL, NULL, '', '2023-11-11 19:27:50', NULL, NULL, '1723301501760172034');
INSERT INTO `donation_activity` VALUES ('1723301562674049025', '2', 'child', 'C001', NULL, NULL, '', '2023-11-11 19:28:05', NULL, NULL, '1723301562606940162');
INSERT INTO `donation_activity` VALUES ('1723301748141977603', '2', NULL, NULL, 'LP001', NULL, NULL, '2023-11-11 19:28:49', NULL, NULL, '1723301748141977602');
INSERT INTO `donation_activity` VALUES ('1723301830195146753', '2', NULL, NULL, 'LP001', NULL, NULL, '2023-11-11 19:29:08', NULL, NULL, '1723301830128037889');
INSERT INTO `donation_activity` VALUES ('1723302266209824770', '2', 'PROJECT', NULL, NULL, NULL, '兰,13862555526,辽宁省,本溪市,南芬区,要加油,null,null', '2023-11-11 19:30:52', NULL, NULL, NULL);
INSERT INTO `donation_activity` VALUES ('1723302302427639810', '2', 'PROJECT', NULL, NULL, NULL, '兰,13862555526,辽宁省,本溪市,南芬区,要加油,null,null', '2023-11-11 19:31:01', NULL, NULL, NULL);
INSERT INTO `donation_activity` VALUES ('1723302829932670979', '2', 'child', 'C007', NULL, NULL, '', '2023-11-11 19:33:07', NULL, NULL, '1723302829932670978');
INSERT INTO `donation_activity` VALUES ('1723302958534225922', '2', 'child', 'C007', NULL, NULL, '', '2023-11-11 19:33:37', NULL, NULL, '1723302958467117057');
INSERT INTO `donation_activity` VALUES ('1723303068387241985', '2', 'child', 'C007', NULL, NULL, '', '2023-11-11 19:34:04', NULL, NULL, '1723303068320133121');
INSERT INTO `donation_activity` VALUES ('1723303142043414530', '2', 'child', 'C009', NULL, NULL, '', '2023-11-11 19:34:21', NULL, NULL, '1723303142043414529');
INSERT INTO `donation_activity` VALUES ('1723307264893231105', '2', 'child', 'C001', NULL, NULL, '', '2023-11-11 19:50:44', NULL, NULL, '1723307264826122242');
INSERT INTO `donation_activity` VALUES ('1723327367663837185', '2', 'child', 'C001', NULL, NULL, '', '2023-11-11 21:10:37', NULL, NULL, '1723327367605116930');
INSERT INTO `donation_activity` VALUES ('1723327458030116866', '2', 'child', 'C001', NULL, NULL, '', '2023-11-11 21:10:59', NULL, NULL, '1723327458030116865');
INSERT INTO `donation_activity` VALUES ('1723328977957806083', '2', 'child', 'C001', NULL, NULL, '', '2023-11-11 21:17:01', NULL, NULL, '1723328977957806082');
INSERT INTO `donation_activity` VALUES ('1723331127303725058', '2', 'child', 'C004', NULL, NULL, '', '2023-11-11 21:25:33', NULL, NULL, '1723331127236616193');
INSERT INTO `donation_activity` VALUES ('1723337553195556865', '2', 'PROJECT', NULL, NULL, NULL, 'Erno,28282811111,北京市,市辖区,东城区,1111,null,null', '2023-11-11 21:51:05', NULL, NULL, NULL);
INSERT INTO `donation_activity` VALUES ('1723376525179326466', '3', 'child', 'C001', NULL, NULL, '', '2023-11-12 00:25:57', NULL, NULL, '1723376525112217601');
INSERT INTO `donation_activity` VALUES ('1723376648932265985', '3', 'child', 'C001', NULL, NULL, '', '2023-11-12 00:26:27', NULL, NULL, '1723376648865157122');
INSERT INTO `donation_activity` VALUES ('1723376955691077634', '2', NULL, NULL, 'LP003', NULL, NULL, '2023-11-12 00:27:40', NULL, NULL, '1723376955691077633');
INSERT INTO `donation_activity` VALUES ('1723377042253123586', '2', NULL, NULL, 'LP003', NULL, NULL, '2023-11-12 00:28:00', NULL, NULL, '1723377042253123585');
INSERT INTO `donation_activity` VALUES ('1723379264735121409', '2', NULL, NULL, 'LP001', NULL, NULL, '2023-11-12 00:36:50', NULL, NULL, '1723379264668012545');
INSERT INTO `donation_activity` VALUES ('1723379986637754369', '2', NULL, NULL, 'LP001', NULL, NULL, '2023-11-12 00:39:42', NULL, NULL, '1723379986570645505');
INSERT INTO `donation_activity` VALUES ('1723380406927986690', '3', 'child', 'C010', NULL, NULL, '', '2023-11-12 00:41:23', NULL, NULL, '1723380406927986689');
INSERT INTO `donation_activity` VALUES ('1723380902485004289', '2', 'PROJECT', NULL, NULL, NULL, '张恩铭,12345678901,北京市,市辖区,东城区,QWERTY,null,null', '2023-11-12 00:43:21', NULL, NULL, NULL);
INSERT INTO `donation_activity` VALUES ('1723381376059674626', '2', NULL, NULL, 'LP003', NULL, NULL, '2023-11-12 00:45:14', NULL, NULL, '1723381376059674625');
INSERT INTO `donation_activity` VALUES ('1723510153104289793', '2', 'project', NULL, 'LP001', NULL, NULL, '2023-11-12 09:16:56', NULL, NULL, '1723510153087512578');
INSERT INTO `donation_activity` VALUES ('DA001', '1', 'CASH', 'C001', NULL, NULL, 'Cash donation for Child 1', '2023-11-01 12:00:00', NULL, NULL, NULL);
INSERT INTO `donation_activity` VALUES ('DA002', '2', 'ITEM', 'C002', NULL, 'IDI002', 'Item donation for Child 2', '2023-11-02 17:30:00', NULL, NULL, NULL);
INSERT INTO `donation_activity` VALUES ('DA003', '3', 'CASH', 'C003', NULL, NULL, 'Cash donation for Child 3', '2023-11-03 16:15:00', NULL, NULL, NULL);
INSERT INTO `donation_activity` VALUES ('DA004', '4', 'CASH', 'C004', NULL, NULL, 'Cash donation for Child 4', '2023-11-04 18:30:00', NULL, NULL, NULL);
INSERT INTO `donation_activity` VALUES ('DA005', '5', 'PROJECT', NULL, 'LP005', NULL, 'Project donation for Love Project 5', '2023-11-05 13:45:00', NULL, NULL, NULL);
INSERT INTO `donation_activity` VALUES ('DA006', '6', 'CASH', 'C006', NULL, NULL, 'Cash donation for Child 6', '2023-11-06 11:20:00', NULL, NULL, NULL);
INSERT INTO `donation_activity` VALUES ('DA007', '7', 'CASH', 'C007', NULL, NULL, 'Cash donation for Child 7', '2023-11-07 15:50:00', NULL, NULL, NULL);
INSERT INTO `donation_activity` VALUES ('DA008', '8', 'CASH', 'C008', NULL, NULL, 'Cash donation for Child 8', '2023-11-08 14:10:00', NULL, NULL, NULL);
INSERT INTO `donation_activity` VALUES ('DA009', '9', 'ITEM', 'C009', NULL, 'IDI009', 'Item donation for Child 9', '2023-11-09 19:00:00', NULL, NULL, NULL);
INSERT INTO `donation_activity` VALUES ('DA010', '10', 'CASH', 'C010', NULL, NULL, 'Cash donation for Child 10', '2023-11-10 16:40:00', NULL, NULL, NULL);

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
INSERT INTO `donator` VALUES ('2', '2', 'avatar2.jpg', 'Donator ', 45, '987-654-3210', 250, 'Province B', 'City Y', 'District 2', 'Address 2', '2023-11-03 23:02:03', '2023-11-11 18:47:07', '啦啦啦·');
INSERT INTO `donator` VALUES ('3', '3', 'avatar3.jpg', '张恩铭', 28, '12345678901', 328, 'Province C', 'City Z', 'District 3', 'Address 3', '2023-11-03 23:02:03', '2023-11-12 00:32:41', '吾甚不慧');
INSERT INTO `donator` VALUES ('4', '4', 'avatar4.jpg', 'Donator 4', 55, '111-222-3333', 0, 'Province D', 'City W', 'District 4', 'Address 4', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 4');
INSERT INTO `donator` VALUES ('5', '5', 'avatar5.jpg', 'Donator 5', 40, '999-888-7799', 0, 'Province E', 'City V', 'District 5', 'Address 5', '2023-11-03 23:02:03', '2023-11-11 15:09:48', '000');
INSERT INTO `donator` VALUES ('6', '6', 'avatar6.jpg', 'Donator 6', 35, '444-555-6666', 0, 'Province F', 'City U', 'District 6', 'Address 6', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 6');
INSERT INTO `donator` VALUES ('7', '7', 'avatar7.jpg', 'Donator 7', 50, '777-888-9999', 0, 'Province G', 'City T', 'District 7', 'Address 7', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 7');
INSERT INTO `donator` VALUES ('8', '8', 'avatar8.jpg', 'Donator 8', 32, '222-333-4444', 0, 'Province H', 'City S', 'District 8', 'Address 8', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 8');
INSERT INTO `donator` VALUES ('9', 'string', 'string', 'string1', 0, 'string', 0, 'string', 'string', 'string', 'string', '2023-11-10 15:21:35', '2023-11-10 23:22:37', 'string');

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
INSERT INTO `donator_child` VALUES ('1723307036207194114', '2', 'C010', '2023-11-11 19:49:50', NULL, NULL);
INSERT INTO `donator_child` VALUES ('1723310036912939010', '2', 'C001', '2023-11-11 20:01:45', NULL, NULL);
INSERT INTO `donator_child` VALUES ('1723376068704833538', '3', 'C004', '2023-11-12 00:24:08', NULL, NULL);
INSERT INTO `donator_child` VALUES ('1723376105300135937', '3', 'C006', '2023-11-12 00:24:17', NULL, NULL);
INSERT INTO `donator_child` VALUES ('DC001', '1', 'C001', NULL, NULL, NULL);
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
INSERT INTO `donator_project` VALUES ('1722890889028669442', '2', 'LP005', '2023-11-10 16:16:12', NULL, NULL);
INSERT INTO `donator_project` VALUES ('1723376917489356801', '2', 'LP003', '2023-11-12 00:27:31', NULL, NULL);
INSERT INTO `donator_project` VALUES ('1723377309711306754', '2', 'LP004', '2023-11-12 00:29:04', NULL, NULL);
INSERT INTO `donator_project` VALUES ('DP001', '1', 'LP001', NULL, NULL, NULL);
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
INSERT INTO `exchange_history` VALUES ('1722953877941067777', 'string', 'C001', 'LP001', 0, 'string', '2023-11-10 12:23:06', '2023-11-10 12:23:06', 'string');
INSERT INTO `exchange_history` VALUES ('1722954178697830401', 'string', 'C001', 'LP001', 0, 'string', '2023-11-10 12:23:06', '2023-11-10 12:23:06', 'string');
INSERT INTO `exchange_history` VALUES ('1723308459271626753', 'https://shining-dream.oss-cn-beijing.aliyuncs.com/donator/4A1F.png', 'C001', 'LP002', 750, '888', '2023-11-11 19:55:29', NULL, NULL);
INSERT INTO `exchange_history` VALUES ('1723310998801063937', 'https://shining-dream.oss-cn-beijing.aliyuncs.com/donator/4A1F.png', 'C001', 'LP002', 150, 'xxx', '2023-11-11 20:05:34', NULL, NULL);
INSERT INTO `exchange_history` VALUES ('1723311408576176129', 'https://shining-dream.oss-cn-beijing.aliyuncs.com/donator/4A1F.png', 'C001', 'LP002', 150, '', '2023-11-11 20:07:12', NULL, NULL);
INSERT INTO `exchange_history` VALUES ('1723312044537520129', 'https://shining-dream.oss-cn-beijing.aliyuncs.com/donator/4A1F.png', 'C001', 'LP002', 1500, '', '2023-11-11 20:09:44', NULL, NULL);
INSERT INTO `exchange_history` VALUES ('EH001', 'thumbnail1.jpg', 'C001', 'LP001', 1000, 'Exchange 1', '2023-11-10 19:18:17', NULL, NULL);
INSERT INTO `exchange_history` VALUES ('EH002', 'thumbnail2.jpg', 'C002', 'LP002', 1500, 'Exchange 2', '2023-11-10 19:18:19', NULL, NULL);
INSERT INTO `exchange_history` VALUES ('EH003', 'thumbnail3.jpg', 'C003', 'LP003', 750, 'Exchange 3', '2023-11-10 19:18:23', NULL, NULL);
INSERT INTO `exchange_history` VALUES ('EH004', 'thumbnail4.jpg', 'C004', 'LP004', 1200, 'Exchange 4', '2023-11-10 19:18:24', NULL, NULL);
INSERT INTO `exchange_history` VALUES ('EH005', 'thumbnail5.jpg', 'C005', 'LP005', 1800, 'Exchange 5', '2023-11-10 19:18:26', NULL, NULL);
INSERT INTO `exchange_history` VALUES ('EH006', 'thumbnail6.jpg', 'C006', 'LP006', 900, 'Exchange 6', '2023-11-10 19:18:26', NULL, NULL);
INSERT INTO `exchange_history` VALUES ('EH007', 'thumbnail7.jpg', 'C007', 'LP007', 1350, 'Exchange 7', '2023-11-10 19:18:26', NULL, NULL);
INSERT INTO `exchange_history` VALUES ('EH008', 'thumbnail8.jpg', 'C008', 'LP008', 1600, 'Exchange 8', '2023-11-10 19:18:27', NULL, NULL);
INSERT INTO `exchange_history` VALUES ('EH009', 'thumbnail9.jpg', 'C009', 'LP009', 800, 'Exchange 9', '2023-11-10 19:18:27', NULL, NULL);
INSERT INTO `exchange_history` VALUES ('EH010', 'thumbnail10.jpg', 'C010', 'LP010', 1400, 'Exchange 10', '2023-11-10 19:18:28', NULL, NULL);

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
INSERT INTO `item_donation_info` VALUES ('1722901758273794049', 'zem', NULL, NULL, '2', 0, 0, '2023-11-10 16:59:24', NULL, NULL, NULL);
INSERT INTO `item_donation_info` VALUES ('1723302266209824771', '兰', NULL, NULL, '2', 0, 0, '2023-11-11 19:30:52', NULL, NULL, NULL);
INSERT INTO `item_donation_info` VALUES ('1723302302427639811', '兰', NULL, NULL, '2', 0, 0, '2023-11-11 19:31:01', NULL, NULL, NULL);
INSERT INTO `item_donation_info` VALUES ('1723337553262665729', 'Erno', NULL, NULL, '2', 0, 0, '2023-11-11 21:51:05', NULL, NULL, NULL);
INSERT INTO `item_donation_info` VALUES ('1723380902552113154', '张恩铭', NULL, NULL, '2', 0, 0, '2023-11-12 00:43:21', NULL, NULL, NULL);
INSERT INTO `item_donation_info` VALUES ('IDI001', 'Item 1', 'item1.jpg', 'Item Description 1', '1', 1, 1, NULL, '2023-11-11 00:22:49', NULL, 'V001');
INSERT INTO `item_donation_info` VALUES ('IDI002', 'Item 2', 'item2.jpg', 'Item Description 2', '2', 1, 1, NULL, NULL, NULL, 'V002');
INSERT INTO `item_donation_info` VALUES ('IDI003', 'Item 3', 'item3.jpg', 'Item Description 3', '3', 1, 1, NULL, '2023-11-11 00:22:49', NULL, 'V001');
INSERT INTO `item_donation_info` VALUES ('IDI004', 'Item 4', 'item4.jpg', 'Item Description 4', '4', 1, 1, NULL, '2023-11-11 00:22:49', NULL, 'V001');
INSERT INTO `item_donation_info` VALUES ('IDI005', 'Item 5', 'item5.jpg', 'Item Description 5', '5', 1, 1, NULL, '2023-11-11 00:22:49', NULL, 'V001');
INSERT INTO `item_donation_info` VALUES ('IDI006', 'Item 6', 'item6.jpg', 'Item Description 6', '6', 1, 1, NULL, '2023-11-11 00:22:49', NULL, 'V001');
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
INSERT INTO `love_project` VALUES ('LP001', '义卖', '慈善义卖', 5000, 1000, 100, '2023-11-03 23:02:03', '2023-11-03 23:02:03', '奉献爱心，传递温情', 'https://shining-dream.oss-cn-beijing.aliyuncs.com/donator/1E72.png');
INSERT INTO `love_project` VALUES ('LP002', '童年守护', '童年守护', 8000, 100, 150, '2023-11-03 23:02:03', '2023-11-03 23:02:03', '为困难儿童购置运动用品', 'https://shining-dream.oss-cn-beijing.aliyuncs.com/donator/4A1F.png');
INSERT INTO `love_project` VALUES ('LP003', '灾害支援', '抗疫战线', 3000, 200, 75, '2023-11-03 23:02:03', '2023-11-03 23:02:03', '帮助困难儿童共同抑制疫情入侵', 'https://shining-dream.oss-cn-beijing.aliyuncs.com/donator/13D7.png');
INSERT INTO `love_project` VALUES ('LP004', '童年守护', '彩虹计划', 6000, 300, 120, '2023-11-03 23:02:03', '2023-11-03 23:02:03', '帮助抑郁儿童打开心扉', 'https://shining-dream.oss-cn-beijing.aliyuncs.com/donator/6233.JPG');
INSERT INTO `love_project` VALUES ('LP005', '童年守护', '童话故事', 7500, 400, 180, '2023-11-03 23:02:03', '2023-11-03 23:02:03', '购置画笔，让儿童可以天马行空', 'https://shining-dream.oss-cn-beijing.aliyuncs.com/donator/6235.JPG');
INSERT INTO `love_project` VALUES ('LP006', '灾害支援', '红色支援', 4000, 50, 90, '2023-11-03 23:02:03', '2023-11-03 23:02:03', '帮助困难受灾儿童重建家园', 'https://shining-dream.oss-cn-beijing.aliyuncs.com/donator/BDCF.png');
INSERT INTO `love_project` VALUES ('LP007', '童年守护', '彩虹陪伴', 5500, 550, 135, '2023-11-03 23:02:03', '2023-11-03 23:02:03', '为留守儿童购置大型玩偶', 'https://shining-dream.oss-cn-beijing.aliyuncs.com/donator/DDA0.png');
INSERT INTO `love_project` VALUES ('LP008', '义卖', '爱心义卖', 6500, 250, 160, '2023-11-03 23:02:03', '2023-11-03 23:02:03', '把爱传递下去', 'https://shining-dream.oss-cn-beijing.aliyuncs.com/donator/MG62.JPG');
INSERT INTO `love_project` VALUES ('LP009', '童年守护', '阳光成长-共筑未来', 3500, 20, 70, '2023-11-03 23:02:03', '2023-11-03 23:02:03', '致力于改善儿童生活，提供生活用品', 'https://shining-dream.oss-cn-beijing.aliyuncs.com/donator/F99L.png');
INSERT INTO `love_project` VALUES ('LP010', '灾害支援', '爱心义诊', 7000, 4, 140, '2023-11-03 23:02:03', '2023-11-03 23:02:03', '为受灾儿童提供门诊医疗服务', 'https://shining-dream.oss-cn-beijing.aliyuncs.com/donator/43SF7ZGN.png');
INSERT INTO `love_project` VALUES ('LP011', '童年守护', '爱心义讲', 7777, 50, 200, '2023-11-10 20:55:36', '2023-11-10 20:55:38', '激发儿童形象力、创造力，天马行空，茁壮成长', 'https://shining-dream.oss-cn-beijing.aliyuncs.com/donator/0YNCJQ.png');

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
INSERT INTO `marking_result` VALUES ('1721404228167946241', 'AS002', 'V001', 7, 0, 'string', 'string555666', 'string', '2023-11-10 12:37:20', '2023-11-10 12:37:20', 'string');
INSERT INTO `marking_result` VALUES ('1721404228167946242', 'AS003', 'V001', 8, -1, NULL, '666', NULL, '2023-11-06 13:48:45', '2023-11-11 00:02:36', NULL);
INSERT INTO `marking_result` VALUES ('1721404228167946243', 'AS004', 'V001', NULL, -1, NULL, NULL, NULL, '2023-11-06 13:48:45', NULL, NULL);
INSERT INTO `marking_result` VALUES ('1721404228167946244', 'AS005', 'V001', NULL, -1, NULL, NULL, NULL, '2023-11-06 13:48:45', NULL, NULL);
INSERT INTO `marking_result` VALUES ('1721404228167946245', 'AS010', 'V001', NULL, -1, NULL, NULL, NULL, '2023-11-06 13:48:45', NULL, NULL);
INSERT INTO `marking_result` VALUES ('1722989075881734145', 'AS002', 'V001', NULL, -1, NULL, NULL, NULL, '2023-11-10 22:46:22', NULL, NULL);
INSERT INTO `marking_result` VALUES ('1722989075881734146', 'AS003', 'V001', NULL, -1, NULL, NULL, NULL, '2023-11-10 22:46:22', NULL, NULL);
INSERT INTO `marking_result` VALUES ('MR001', 'AS001', 'V001', 5, 1, 'Type 1', 'Marking Result 155', 'picture1.jpg', NULL, '2023-11-11 00:11:05', NULL);
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
  `item_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('1', 'bag_2776.JPG', '0');
INSERT INTO `picture` VALUES ('10', 'bag_2777.JPG', '0');
INSERT INTO `picture` VALUES ('11', 'bag_2778.JPG', '0');
INSERT INTO `picture` VALUES ('12', 'bag_2788.JPG', '0');
INSERT INTO `picture` VALUES ('13', 'bag_2789.JPG', '0');
INSERT INTO `picture` VALUES ('14', 'bag_2790.JPG', '0');
INSERT INTO `picture` VALUES ('15', 'bag_2791.JPG', '0');
INSERT INTO `picture` VALUES ('2', 'PenBag_2779.JPG', '1');
INSERT INTO `picture` VALUES ('3', 'PenBag_2780.JPG', '1');
INSERT INTO `picture` VALUES ('4', 'PenBag_2781.JPG', '1');
INSERT INTO `picture` VALUES ('5', 'PenBag_2782.JPG', '1');
INSERT INTO `picture` VALUES ('6', 'PenBag_2785.JPG', '1');
INSERT INTO `picture` VALUES ('7', 'PenBag_2786.JPG', '1');
INSERT INTO `picture` VALUES ('8', 'PenBag_2787.JPG', '1');

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
INSERT INTO `task_history` VALUES ('TH001', 'thumbnail1.jpg', 'C001', 'T001', 'Task History 1', '2023-11-10 17:37:49', NULL, NULL);
INSERT INTO `task_history` VALUES ('TH002', 'thumbnail2.jpg', 'C002', 'T002', 'Task History 2', '2023-11-10 17:37:52', NULL, NULL);
INSERT INTO `task_history` VALUES ('TH003', 'thumbnail3.jpg', 'C003', 'T003', 'Task History 3', '2023-11-10 17:37:51', NULL, NULL);
INSERT INTO `task_history` VALUES ('TH004', 'thumbnail4.jpg', 'C004', 'T004', 'Task History 4', '2023-11-10 17:37:52', NULL, NULL);
INSERT INTO `task_history` VALUES ('TH005', 'thumbnail5.jpg', 'C005', 'T005', 'Task History 5', '2023-11-10 17:37:53', NULL, NULL);
INSERT INTO `task_history` VALUES ('TH006', 'thumbnail6.jpg', 'C006', 'T006', 'Task History 6', '2023-11-10 17:37:54', NULL, NULL);
INSERT INTO `task_history` VALUES ('TH007', 'thumbnail7.jpg', 'C007', 'T007', 'Task History 7', '2023-11-10 17:37:56', NULL, NULL);
INSERT INTO `task_history` VALUES ('TH008', 'thumbnail8.jpg', 'C008', 'T008', 'Task History 8', '2023-11-10 17:37:57', NULL, NULL);
INSERT INTO `task_history` VALUES ('TH009', 'thumbnail9.jpg', 'C009', 'T009', 'Task History 9', '2023-11-10 17:37:58', NULL, NULL);
INSERT INTO `task_history` VALUES ('TH010', 'thumbnail10.jpg', 'C010', 'T010', 'Task History 10', '2023-11-10 17:37:59', NULL, NULL);

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
  `tel` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `volunteer_pk`(`account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of volunteer
-- ----------------------------
INSERT INTO `volunteer` VALUES ('V001', 'volunteer1', 'password1', 'volunteer/volunteerAvatar1.png', '杨秋雯', 30, 'M', 1, '云南省', '保山市', '昌宁县', '翻斗花园', 'Address 1', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 1', NULL);
INSERT INTO `volunteer` VALUES ('V002', 'volunteer2', 'password2', 'volunteer/volunteerAvatar2.png', '蔡登木', 25, 'F', 0, '云南省', '保山市', '昌宁县', '青青草原', 'Address 2', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 2', NULL);
INSERT INTO `volunteer` VALUES ('V003', 'volunteer3', 'password3', 'volunteer/volunteerAvatar3.png', '张钧幸', 40, 'M', 1, '云南省', '保山市', '昌宁县', '呼伦贝尔大草原', 'Address 3', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 3', NULL);
INSERT INTO `volunteer` VALUES ('V004', 'volunteer4', 'password4', 'avatar4.jpg', '林怡桦', 35, 'F', 0, '云南省', '保山市', '昌宁县', '理塘广场', 'Address 4', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 4', NULL);
INSERT INTO `volunteer` VALUES ('V005', 'volunteer5', 'password5', 'avatar5.jpg', '郭法美', 28, 'M', 1, '云南省', '保山市', '昌宁县', '羊村', 'Address 5', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 5', NULL);
INSERT INTO `volunteer` VALUES ('V006', 'volunteer6', 'password6', 'avatar6.jpg', '王雅云', 45, 'F', 0, '云南省', '保山市', '昌宁县', '翻斗花园', 'Address 6', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 6', NULL);
INSERT INTO `volunteer` VALUES ('V007', 'volunteer7', 'password7', 'avatar7.jpg', '黄台育', 32, 'M', 1, '云南省', '保山市', '昌宁县', '翻斗花园', 'Address 7', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 7', NULL);
INSERT INTO `volunteer` VALUES ('V008', 'volunteer8', 'password8', 'avatar8.jpg', '王嘉琪', 29, 'F', 0, '云南省', '保山市', '昌宁县', '翻斗花园', 'Address 8', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 8', NULL);
INSERT INTO `volunteer` VALUES ('V009', 'volunteer9', 'password9', 'avatar9.jpg', '胡钰雯', 38, 'M', 1, '云南省', '保山市', '昌宁县', '翻斗花园', 'Address 9', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 9', NULL);
INSERT INTO `volunteer` VALUES ('V010', 'volunteer10', 'password10', 'avatar10.jpg', '汤筠霞', 27, 'F', 0, 'Province J', 'City Q', 'District 10', 'Description 10', 'Address 10', '2023-11-03 23:02:03', '2023-11-03 23:02:03', 'Remark 10', NULL);

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
INSERT INTO `volunteer_credit` VALUES ('VC001', 'V001', 520, NULL, NULL, NULL);
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
