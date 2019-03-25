-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2019 at 08:13 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `swim`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`` PROCEDURE `getBMI_tips` (IN `mbi` INT(6))  BEGIN
 SELECT status as myStatus FROM bmi_index WHERE mbi >= min_BMI AND mbi <= max_BMI;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `age`
--

CREATE TABLE `age` (
  `id` int(11) NOT NULL,
  `age_range` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_BMI` float DEFAULT NULL,
  `max_speed` float DEFAULT NULL,
  `max_endurance` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bmi_index`
--

CREATE TABLE `bmi_index` (
  `id` int(11) NOT NULL,
  `min_BMI` float DEFAULT NULL,
  `max_BMI` float DEFAULT NULL,
  `tips` text,
  `status` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bmi_index`
--

INSERT INTO `bmi_index` (`id`, `min_BMI`, `max_BMI`, `tips`, `status`) VALUES
(1, 0, 5, ' ', 'Thiếu cân'),
(2, 6, 85, ' ', 'Sức khỏe dinh dưỡng tốt'),
(3, 86, 95, ' ', 'Thừa cân'),
(4, 95, 1000, ' ', 'Béo phì');

-- --------------------------------------------------------

--
-- Table structure for table `date`
--

CREATE TABLE `date` (
  `id` int(11) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `quarter` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `distance`
--

CREATE TABLE `distance` (
  `id` int(11) NOT NULL,
  `swim_distance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `distance`
--

INSERT INTO `distance` (`id`, `swim_distance`) VALUES
(1, 1500),
(2, 150),
(3, 200),
(4, 300),
(5, 180),
(6, 250),
(7, 360),
(8, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `exercise`
--

CREATE TABLE `exercise` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `style` varchar(255) DEFAULT NULL,
  `distance` float DEFAULT NULL,
  `reps` int(11) DEFAULT NULL,
  `coach_id` int(11) NOT NULL,
  `time` int(11) DEFAULT NULL,
  `description` text,
  `type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exercise`
--

INSERT INTO `exercise` (`id`, `name`, `style`, `distance`, `reps`, `coach_id`, `time`, `description`, `type_id`) VALUES
(14, 'khởi động nhẹ', 'Bơi ếch', 1500, 100, 5, 90, 'khởi động max nhẹ', 1),
(15, 'khởi động nặng', 'Bơi ngửa', 150, 10, 5, 10, 'bơi khởi động cực mạnh', 1),
(16, 'Bơi nhẹ nhàng', 'Bơi ngửa', 150, 10, 5, 10, 'bơi nhẹ thôi', 2),
(17, 'bơi mạnh', 'Bơi bướm', 150, 10, 5, 30, 'bơi full 100% công lực', 3),
(18, 'Thở nhẹ', 'Bơi bướm', 150, 10, 5, 10, 'thở nhẹ nhàng', 4);

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `id` int(11) NOT NULL,
  `coach_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`id`, `coach_id`, `name`) VALUES
(1, 5, ' Khởi đầu ngày mới'),
(2, 5, ' Khởi đầu ngày cũ'),
(3, 5, ' Khởi đầu ngày mới 2'),
(4, 5, 'eddyenclave'),
(5, 5, 'eddyenclave3'),
(6, 5, 'Giáo án 01');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_exercise`
--

CREATE TABLE `lesson_exercise` (
  `id` int(11) NOT NULL,
  `lesson_id` int(11) DEFAULT NULL,
  `exercise_id` int(11) DEFAULT NULL,
  `type_of_exercise_id` int(11) DEFAULT NULL,
  `is_important` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lesson_exercise`
--

INSERT INTO `lesson_exercise` (`id`, `lesson_id`, `exercise_id`, `type_of_exercise_id`, `is_important`, `created_at`, `updated_at`) VALUES
(1, 5, 14, 1, 0, '2019-03-20 06:12:23', '0000-00-00 00:00:00'),
(2, 5, 15, 1, 0, '2019-03-20 06:12:23', '0000-00-00 00:00:00'),
(3, 5, 17, 3, 0, '2019-03-20 06:12:23', '0000-00-00 00:00:00'),
(4, 5, 18, 4, 0, '2019-03-20 06:12:23', '0000-00-00 00:00:00'),
(5, 5, 16, 2, 0, '2019-03-20 06:12:23', '0000-00-00 00:00:00'),
(6, 6, 14, 1, 0, '2019-03-25 04:35:07', '0000-00-00 00:00:00'),
(7, 6, 16, 2, 0, '2019-03-25 04:35:07', '0000-00-00 00:00:00'),
(8, 6, 17, 3, 0, '2019-03-25 04:35:07', '0000-00-00 00:00:00'),
(9, 6, 18, 4, 0, '2019-03-25 04:35:07', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `monthly_record`
--

CREATE TABLE `monthly_record` (
  `id` int(11) NOT NULL,
  `exercise_id` int(11) DEFAULT NULL,
  `avg_min_hr` double DEFAULT NULL,
  `avg_max_hr` double DEFAULT NULL,
  `avg_min_time` double DEFAULT NULL,
  `avg_max_time` double DEFAULT NULL,
  `avg_hr` double DEFAULT NULL,
  `avg_time` double DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `coach_id` int(11) DEFAULT NULL,
  `feed_back` text,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `record`
--

CREATE TABLE `record` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `min_time` int(11) NOT NULL,
  `max_time` int(11) NOT NULL,
  `min_hr` int(11) NOT NULL,
  `max_hr` int(11) NOT NULL,
  `heart_rate` int(11) NOT NULL,
  `attitude` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `time_swim` float NOT NULL,
  `result` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `best_result` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `errors` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coach_id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `record`
--

INSERT INTO `record` (`id`, `user_id`, `date_id`, `schedule_id`, `min_time`, `max_time`, `min_hr`, `max_hr`, `heart_rate`, `attitude`, `time_swim`, `result`, `note`, `best_result`, `errors`, `coach_id`, `exercise_id`, `createdAt`, `updatedAt`) VALUES
(1, 10, 0, 2, 12, 16, 60, 80, 65, ' khá tốt ', 14, 'good', ' aaaaaannnnnncccccccc', '', 'thực hiện lỗi', 5, 14, '2019-03-21 02:31:45', '2019-03-21 02:31:45');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'coach'),
(2, 'admin'),
(3, 'trainee');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `coach_id` int(11) DEFAULT NULL,
  `team_name` varchar(255) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `lesson_id` int(11) DEFAULT NULL,
  `lesson_name` varchar(255) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `start_hour` int(11) DEFAULT NULL,
  `start_minute` int(11) DEFAULT NULL,
  `end_hour` int(11) DEFAULT NULL,
  `end_minute` int(11) DEFAULT NULL,
  `time_start` datetime DEFAULT NULL,
  `time_end` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `coach_id`, `team_name`, `team_id`, `lesson_id`, `lesson_name`, `day`, `month`, `year`, `start_hour`, `start_minute`, `end_hour`, `end_minute`, `time_start`, `time_end`, `created_at`, `updated_at`) VALUES
(2, 5, 'Eddy', 1, 1, ' Khởi đầu ngày mới', 20, 3, 2019, 8, 0, 9, 0, '2019-03-20 01:00:00', '2019-03-20 02:00:00', '2019-03-25 06:27:42', '0000-00-00 00:00:00'),
(3, 5, 'Eddy', 1, 1, ' Khởi đầu ngày mới', 21, 3, 2019, 7, 0, 12, 0, '2019-03-21 00:00:00', '2019-03-21 05:00:00', '2019-03-25 06:27:42', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `style`
--

CREATE TABLE `style` (
  `id` int(11) NOT NULL,
  `swim_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `coach_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `style`
--

INSERT INTO `style` (`id`, `swim_name`, `description`, `coach_id`) VALUES
(1, 'Bơi sải', 'kiểu bơi nhanh nhất trong các kiểu bơi. Sử dụng 2 tay quạt liên tục so le về phía trước, gạt nước về phía sau làm động lực chính đưa cơ thể tiến lên.', NULL),
(2, 'Bơi ếch', 'kiểu bơi chậm nhất trong 4 kiểu bơi thể thao, là kiểu bơi có hình thức giống loài ếch bơi dưới nước.', NULL),
(3, 'Bơi ngửa', 'kiểu bơi có kỹ thuật khá tương tự với bơi trườn sấp nhưng tư thế cơ thể ngược lại, ngửa mặt lên trên.', NULL),
(4, 'Bơi bướm', 'kiểu bơi nhanh, đòi hỏi kỹ thuật và thể lực cao nhất vì phải kết hợp nhịp nhàng của toàn thân.', NULL),
(5, 'Bơi lượn sóng', 'kiểu bơi khép đôi chân lại bằng nhau. dùng lực của lưng nảy người sao cho phần ngực. mông, đôi chân diễn theo hình lượn sóng.', NULL),
(6, 'Bơi chó', 'kiểu bơi úp người, chân đạp giống như bơi sải, còn đôi tay thì để dưới ngực, 5 ngón tay có thể khép hoặc mở, đưa đôi tay về phía trước song song với ngực, rồi đẩy nước về phía sau song song với bụng, động tác lặp đi lặp lại nhiều lần, giống như hoạt động đôi chân trước của một chú chó đang bơi vậy.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `coach_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `coach_id`, `name`, `age`, `created_at`, `updated_at`) VALUES
(1, 5, 'Eddy', '15', '2019-03-25 04:22:38', '0000-00-00 00:00:00'),
(2, 5, 'eddy2', '12', '2019-03-25 04:22:38', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `team-swimmer`
--

CREATE TABLE `team-swimmer` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type_of_exercise`
--

CREATE TABLE `type_of_exercise` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_of_exercise`
--

INSERT INTO `type_of_exercise` (`id`, `name`, `description`, `logo`) VALUES
(1, 'Warm up', NULL, 'https://www.fitfor90.com/hs-fs/hubfs/Fitfor90_April2016/images/icon-warmup.png?width=250&height=250&name=icon-warmup.png'),
(2, 'Main Stroke', NULL, 'http://www.oogazone.com/wp-content/uploads/2018/10/best-swimming-clipart-petition-pictures.jpg'),
(3, 'Final set', NULL, 'http://www2.len.eu/wp-content/uploads/2016/04/openwater.png?v=2.0'),
(4, 'Swim down', NULL, 'http://www2.len.eu/wp-content/uploads/2016/04/synchro.png?v=2.0');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `username` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `phone` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(225) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_phone` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` tinyint(1) DEFAULT '0',
  `is_verified` tinyint(1) DEFAULT '0',
  `age` int(1) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `team_id` int(11) DEFAULT NULL,
  `is_coach` tinyint(4) DEFAULT '0',
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bmi` float DEFAULT NULL,
  `endurance` float DEFAULT NULL,
  `speed` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `role_id`, `username`, `password`, `first_name`, `last_name`, `dob`, `phone`, `email`, `address`, `parent_name`, `parent_phone`, `gender`, `is_verified`, `age`, `height`, `weight`, `avatar`, `slug`, `created_at`, `updated_at`, `team_id`, `is_coach`, `display_name`, `bmi`, `endurance`, `speed`) VALUES
(3, 2, 'ocean', '$2b$10$qzcbh0CMK2z8lvmtvh5H7Oir75HHjHntUftKMtDMEiMsRmKogJ9xe', 'Dương', 'Lê Đại', '1997-08-23 00:00:00', '0121549693', 'ocean@enclave.vn', NULL, NULL, NULL, 0, 1, NULL, 175, 80, 'https://ucarecdn.com/1c922eab-4545-4570-a580-db6fed2009e5/', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0, NULL, NULL, NULL, NULL),
(4, 2, 'walker', '$2b$10$yH9taDp2wl47An8Ce9tIDuZ4g5ZjfG.Fo.1d6jfltxyAm8PRXs2KS', 'Tan', 'Ho', '1997-02-21 14:00:00', NULL, 'walker@enclave.vn', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0, NULL, NULL, NULL, NULL),
(5, 2, 'eddy', '$2a$10$AUZfXSH92y/rh7/ZfftnQ.mWDpYlZjI3v4isNnGZgIBPj/PPQ0y4S', 'Ánh', 'Nguyễn Đắc', '1997-11-18 00:00:00', '0932549693', 'eddy@enclave.vn', NULL, NULL, NULL, 0, 1, NULL, 174, 67, 'https://ucarecdn.com/657fdc37-8193-4616-b195-ddaa7c95d70c/', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0, 'Nguyễn Đắc Ánh', 22.1297, NULL, NULL),
(8, 2, 'triton', '$2b$10$f0nI.KebYOJHszSF1a1oTuxsJyoihoNuI8AJVwaK.k3AF91PuPopW', 'Tri', 'Nguyen', '2019-03-14 01:50:38', '2', 'triton@enclave.vn', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0, 'Nguyen Tri', NULL, NULL, NULL),
(9, 2, 'kaizer', '$2b$10$y8xIjnyO5y1WFCObR3e4IuXdwaSutW8DOT66HWsQwHmcHVmk8JR2W', 'Khoa', 'Phạm', '1997-08-15 00:00:00', '0123456', 'kaizer@enclave.vn', NULL, NULL, NULL, 0, 1, NULL, 170, 67, 'https://ucarecdn.com/bd0f2fed-2f50-462c-adc6-0b5bac345cf9/', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0, NULL, NULL, NULL, NULL),
(10, 3, 'QK5DN_10', '$2b$10$02jrJHaHont/aaglrF.P5.aKXvSg4S1a5jh/IetC9UQoA1wxaHnXi', NULL, NULL, '2019-03-18 07:20:36', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, NULL, NULL, NULL, NULL),
(11, 3, 'QK5DN_12', '$2b$10$YtKnupKnYspa/4rcvItpp..Hdo7R0THnB1AG/VOAB6BCJLVN7XZku', NULL, NULL, '2019-03-18 07:20:36', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, NULL, NULL, NULL, NULL),
(12, 3, 'QK5DN_14', '$2b$10$FKeAzhkISfo9iFGBjay6I.f0zUMfEr3YnyXUH993kCd3t.amHbk/.', NULL, NULL, '2019-03-18 07:20:36', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, NULL, NULL, NULL, NULL),
(13, 3, 'QK5DN_11', '$2b$10$wzVYTYvZnEV0yt69HEYXw.4Jdpg8FgGYM96XOK4BuRMVpdtMGGT9K', NULL, NULL, '2019-03-18 07:20:36', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, NULL, NULL, NULL, NULL),
(14, 3, 'QK5DN_16', '$2b$10$5eKJNOooTzh1bWTcbuerveB4U7JYc6uoZ1wJsq5VX2aMObyrIxXXi', NULL, NULL, '2019-03-18 07:20:36', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, NULL, NULL, NULL, NULL),
(15, 3, 'QK5DN_13', '$2b$10$EXdmDwycQEPWqraw6OvmT.8wF86PuDtr8YpNhjU79RTuoHs1DLRAK', NULL, NULL, '2019-03-18 07:20:36', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, NULL, NULL, NULL, NULL),
(16, 3, 'QK5DN_15', '$2b$10$T6DkWRee.oiLK3Iipd9bUe2GF7AR/MNmrUQVeGky8s8tFMce2zIoG', NULL, NULL, '2019-03-18 07:20:36', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, NULL, NULL, NULL, NULL),
(17, 3, 'QK5DN_17', '$2b$10$rW5.n8XwAi3meNPC5vexQO2eCbIUCycm5SeJKnR8KIRvQzF86WJ5i', NULL, NULL, '2019-03-18 07:20:36', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, NULL, NULL, NULL, NULL),
(18, 3, 'QK5DN_19', '$2b$10$acTJTkmli4nE8P8HZTkuxewfiuQ2xSq3OY2dw1iILHcGrLp3kepBm', NULL, NULL, '2019-03-18 07:20:36', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, NULL, NULL, NULL, NULL),
(19, 3, 'QK5DN_18', '$2b$10$hO66A.t3vEdX/DMkUYScqO1gdwlvgC3hFpnU2kWlFPQfk7J6WICpS', NULL, NULL, '2019-03-18 07:20:36', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, NULL, NULL, NULL, NULL),
(20, 3, 'QK5DN_21', '$2b$10$3UfRbss0bItxk4q7DpInCuian.U1WT3DxNMsMJose8qpxpmnpc97C', NULL, NULL, '2019-03-21 01:49:44', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 0, NULL, NULL, NULL, NULL),
(21, 3, 'QK5DN_20', '$2b$10$wWIXpAhiX/Zvs09KL46Znu0oA4wtn6k5J4heFK8jbhnnHUc90eXRy', NULL, NULL, '2019-03-21 01:49:44', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 0, NULL, NULL, NULL, NULL),
(22, 3, 'QK5DN_22', '$2b$10$tgPXSFTqfN.42OZIsN2ATeyTUQe1hyzCQgTlTa5uEXEeI5UH8OaZe', NULL, NULL, '2019-03-21 01:49:44', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 0, NULL, NULL, NULL, NULL),
(23, 3, 'QK5DN_23', '$2b$10$DSQu9UwRUdw8IB5UzofQ2OhfRlHswzYr7vic0NCemhe2TR6hUTXka', NULL, NULL, '2019-03-21 01:49:44', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 0, NULL, NULL, NULL, NULL),
(24, 3, 'QK5DN_25', '$2b$10$dLY4lj6VEslggPb.l1ZPuuSQkzCa6RXB7WiMcsuoFIiQxuzxTLIHu', NULL, NULL, '2019-03-21 01:49:44', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 0, NULL, NULL, NULL, NULL),
(25, 3, 'QK5DN_24', '$2b$10$Zxywqa6fN8rN7teW0rRrNe1HNwV/jQamjcZ2SUlF0OK.UmSTFCxIC', NULL, NULL, '2019-03-21 01:49:44', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 0, NULL, NULL, NULL, NULL);

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `after_insert_user` AFTER INSERT ON `user` FOR EACH ROW BEGIN
       IF (NEW.team_id <> NULL) THEN 
       INSERT INTO `team-swimmer` (user_id , team_id)  VALUES( NEW.id ,NEW.team_id);
      END IF;
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_user` BEFORE UPDATE ON `user` FOR EACH ROW BEGIN
   set NEW.display_name =  CONCAT(NEW.last_name, " ",NEW.first_name) ;
   set NEW.bmi = NEW.weight / ( NEW.height * NEW.height * 0.0001);

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `version`
--

CREATE TABLE `version` (
  `id` int(11) NOT NULL,
  `front_version` varchar(100) DEFAULT NULL,
  `back_version` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `version`
--

INSERT INTO `version` (`id`, `front_version`, `back_version`, `description`, `name`) VALUES
(1, '0.1.6', '0.1.7', ' Hiện đang trong giai đoạn thử nghiệm và phát triển', ' Phiên bản thử nghiệm');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `age`
--
ALTER TABLE `age`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bmi_index`
--
ALTER TABLE `bmi_index`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `date`
--
ALTER TABLE `date`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `distance`
--
ALTER TABLE `distance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exercise`
--
ALTER TABLE `exercise`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lesson_exercise`
--
ALTER TABLE `lesson_exercise`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `monthly_record`
--
ALTER TABLE `monthly_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `record`
--
ALTER TABLE `record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_id` (`date_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `style`
--
ALTER TABLE `style`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team-swimmer`
--
ALTER TABLE `team-swimmer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `type_of_exercise`
--
ALTER TABLE `type_of_exercise`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `age`
--
ALTER TABLE `age`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bmi_index`
--
ALTER TABLE `bmi_index`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `date`
--
ALTER TABLE `date`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `distance`
--
ALTER TABLE `distance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `exercise`
--
ALTER TABLE `exercise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE `lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lesson_exercise`
--
ALTER TABLE `lesson_exercise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `monthly_record`
--
ALTER TABLE `monthly_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `record`
--
ALTER TABLE `record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `style`
--
ALTER TABLE `style`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `team-swimmer`
--
ALTER TABLE `team-swimmer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type_of_exercise`
--
ALTER TABLE `type_of_exercise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `version`
--
ALTER TABLE `version`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
