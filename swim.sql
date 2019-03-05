-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2019 at 08:33 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `age`
--

CREATE TABLE `age` (
  `id` int(11) NOT NULL,
  `age_range` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `coach_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `record`
--

CREATE TABLE `record` (
  `id` int(11) NOT NULL,
  `time_swim` float NOT NULL,
  `style_id` int(11) NOT NULL,
  `distance_id` int(11) NOT NULL,
  `date_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `START` time DEFAULT NULL,
  `END` time DEFAULT NULL,
  `exercise_id` int(11) DEFAULT NULL,
  `coach_id` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `style`
--

CREATE TABLE `style` (
  `id` int(11) NOT NULL,
  `swim_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `style`
--

INSERT INTO `style` (`id`, `swim_name`, `description`) VALUES
(1, 'Bơi sải', 'kiểu bơi nhanh nhất trong các kiểu bơi. Sử dụng 2 tay quạt liên tục so le về phía trước, gạt nước về phía sau làm động lực chính đưa cơ thể tiến lên.'),
(2, 'Bơi ếch', 'kiểu bơi chậm nhất trong 4 kiểu bơi thể thao, là kiểu bơi có hình thức giống loài ếch bơi dưới nước.'),
(3, 'Bơi ngửa', 'kiểu bơi có kỹ thuật khá tương tự với bơi trườn sấp nhưng tư thế cơ thể ngược lại, ngửa mặt lên trên.'),
(4, 'Bơi bướm', 'kiểu bơi nhanh, đòi hỏi kỹ thuật và thể lực cao nhất vì phải kết hợp nhịp nhàng của toàn thân.'),
(5, 'Bơi lượn sóng', 'kiểu bơi khép đôi chân lại bằng nhau. dùng lực của lưng nảy người sao cho phần ngực. mông, đôi chân diễn theo hình lượn sóng.'),
(6, 'Bơi chó', 'kiểu bơi úp người, chân đạp giống như bơi sải, còn đôi tay thì để dưới ngực, 5 ngón tay có thể khép hoặc mở, đưa đôi tay về phía trước song song với ngực, rồi đẩy nước về phía sau song song với bụng, động tác lặp đi lặp lại nhiều lần, giống như hoạt động đôi chân trước của một chú chó đang bơi vậy.');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `coach_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `coach_id`, `name`, `age`) VALUES
(1, 5, 'a5', '15');

-- --------------------------------------------------------

--
-- Table structure for table `team-swimmer`
--

CREATE TABLE `team-swimmer` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `phone` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(225) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_phone` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT NULL,
  `age` int(1) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `team_id` int(11) DEFAULT NULL,
  `is_coach` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `role_id`, `username`, `password`, `first_name`, `last_name`, `dob`, `phone`, `email`, `address`, `parent_name`, `parent_phone`, `gender`, `is_verified`, `age`, `height`, `weight`, `avatar`, `slug`, `created_at`, `updated_at`, `team_id`, `is_coach`) VALUES
(3, 2, 'ocean', '$2b$10$qzcbh0CMK2z8lvmtvh5H7Oir75HHjHntUftKMtDMEiMsRmKogJ9xe', 'Duong', 'Le', '1997-02-21 14:00:00', NULL, 'ocean@enclave.vn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0),
(4, 2, 'walker', '$2b$10$yH9taDp2wl47An8Ce9tIDuZ4g5ZjfG.Fo.1d6jfltxyAm8PRXs2KS', 'Tan', 'Ho', '1997-02-21 14:00:00', NULL, 'walker@enclave.vn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0),
(5, 2, 'eddy', '$2a$10$AUZfXSH92y/rh7/ZfftnQ.mWDpYlZjI3v4isNnGZgIBPj/PPQ0y4S', 'Anh', 'Nguyen', '2019-02-25 06:28:05', NULL, 'eddy@enclave.vn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0),
(8, 2, 'triton', '$2b$10$f0nI.KebYOJHszSF1a1oTuxsJyoihoNuI8AJVwaK.k3AF91PuPopW', 'Tri', 'Nguyen', '1997-02-21 14:00:00', NULL, 'triton@enclave.vn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0),
(9, 2, 'kaizer', '$2b$10$y8xIjnyO5y1WFCObR3e4IuXdwaSutW8DOT66HWsQwHmcHVmk8JR2W', 'Khoa', 'Pham', '1997-02-21 14:00:00', NULL, 'kaizer@enclave.vn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0),
(12, 3, 'QK5DN_13', '$2b$10$jWMZZ.j69HC/leCng6O6AeUnmpUd0v4.BhMh3omxIitgHbwq6V2p6', NULL, NULL, '2019-03-05 04:52:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(13, 3, 'QK5DN_12', '$2b$10$nFeQC582e.m1Jn/4i4W2k.edI/IQBX77aQAuRqRmi0JHFbGvIAhUO', NULL, NULL, '2019-03-05 04:52:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(14, 3, 'QK5DN_10', '$2b$10$uVlH0yOsy0l6DmuChjgShu72xz1p0cm4MlkJuK75SInZt1gjUyJ3C', NULL, NULL, '2019-03-05 04:52:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(15, 3, 'QK5DN_14', '$2b$10$KIk/bBSDr/kGD99QNOPmpeE66Kbj/jHgkYQXSsPN73/WVjICz8wTu', NULL, NULL, '2019-03-05 04:52:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(16, 3, 'QK5DN_16', '$2b$10$/BOggxIK0c9Z89qyrCA/We0Rctc34tct7KK11EJCZmEfMmoPg6O2q', NULL, NULL, '2019-03-05 04:52:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(17, 3, 'QK5DN_15', '$2b$10$FPBE5ZYFgQP9DMXwR4ds8OaAuiNv5bILFWCdU86cI.zMeuBkgTqYa', NULL, NULL, '2019-03-05 04:52:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(18, 3, 'QK5DN_17', '$2b$10$V06jkvU6FzZ5/o1ep/b06uAFtc4gRwQOBqIPRGSLLeK4XQ128TjvS', NULL, NULL, '2019-03-05 04:52:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(19, 3, 'QK5DN_11', '$2b$10$FFWLgHPGDjNWgI9PO23vleDUdd1CCjuXK0EW0M2HtRqrLZNs8QWZC', NULL, NULL, '2019-03-05 04:52:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(20, 3, 'QK5DN_18', '$2b$10$keFpm57Nt/eFIgiPwepmOuY.Rl1AwdC5vYp0xiHkd3esMjISYIuR.', NULL, NULL, '2019-03-05 04:52:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(21, 3, 'QK5DN_19', '$2b$10$/DGUvihO9NOnmO/XXrymrutglS0.XT9n9eXz/posAZL57eGDVCwUW', NULL, NULL, '2019-03-05 04:52:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0);

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `age`
--
ALTER TABLE `age`
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
-- Indexes for table `record`
--
ALTER TABLE `record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `style_id` (`style_id`),
  ADD KEY `distance_id` (`distance_id`),
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
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `age`
--
ALTER TABLE `age`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `record`
--
ALTER TABLE `record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `style`
--
ALTER TABLE `style`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `team-swimmer`
--
ALTER TABLE `team-swimmer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


ALTER TABLE `schedule` CHANGE `START` `start_hour` INT NULL DEFAULT NULL;
ALTER TABLE `schedule` CHANGE `END` `end_hour` INT NULL DEFAULT NULL;
ALTER TABLE `schedule` add `start_minute` int;
ALTER TABLE `schedule` add `end_minute` int;
