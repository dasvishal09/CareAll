-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2020 at 09:14 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `careall`
--

-- --------------------------------------------------------

--
-- Table structure for table `allotment`
--

CREATE TABLE `allotment` (
  `a_id` int(10) NOT NULL,
  `y_id` varchar(10) NOT NULL,
  `y_name` varchar(100) NOT NULL,
  `e_id` varchar(10) NOT NULL,
  `e_name` varchar(100) NOT NULL,
  `a_status` varchar(10) NOT NULL DEFAULT 'Pending',
  `a_funds` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `allotment`
--

INSERT INTO `allotment` (`a_id`, `y_id`, `y_name`, `e_id`, `e_name`, `a_status`, `a_funds`) VALUES
(100001, '', '', '', '', 'Pending', ''),
(100002, '10001', 'Nishant Vora', '10001', 'Vishal Das', 'Accept', '500'),
(100003, '10001', 'Nishant Vora', '10002', 'Neha Gupta', 'Pending', '250');

-- --------------------------------------------------------

--
-- Table structure for table `elders`
--

CREATE TABLE `elders` (
  `e_id` int(5) NOT NULL,
  `e_name` varchar(100) NOT NULL,
  `e_email` varchar(100) NOT NULL,
  `available` varchar(5) NOT NULL DEFAULT 'Yes',
  `e_funds` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `elders`
--

INSERT INTO `elders` (`e_id`, `e_name`, `e_email`, `available`, `e_funds`) VALUES
(10001, 'Vishal Das', 'vishal.das@gmail.com', 'No', '500'),
(10002, 'Neha Gupta', 'neha.gupta@gmail.com', 'No', '250'),
(10003, 'Ishita Medekar', 'ishita.medekar@gmail.com', 'Yes', '1000'),
(10004, 'Avadhut Joshi', 'avadhut.joshi@gmail.com', 'Yes', ''),
(10005, 'Nitesh Dave', 'nitesh.dave@gmail.com', 'Yes', ''),
(10006, 'Kunal Kamle', 'kunal.kamle@gmail.com', 'Yes', ''),
(10007, 'Piyush Goyal', 'piyush.goyal@gmail.com', 'Yes', ''),
(10008, 'Ruchika Solan', 'ruchika.so@gmail.com', 'Yes', ''),
(10009, 'Mitesh Dave', 'mitesh.dave@gmail.com', 'Yes', ''),
(10010, 'Dharmesh Maria', 'dharmesh11@gmail.com', 'Yes', ''),
(10011, 'Renuka Hande', 'renuka.hande@gmail.com', 'Yes', ''),
(10012, 'Himanshu Rai', 'himanshu.rai@gmail.com', 'Yes', '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `oldstatus`
-- (See below for the actual view)
--
CREATE TABLE `oldstatus` (
`e_id` int(5)
,`e_name` varchar(100)
,`e_email` varchar(100)
,`available` varchar(5)
,`e_funds` varchar(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `r_id` int(5) NOT NULL,
  `review_from` varchar(10) NOT NULL,
  `review_to` varchar(10) NOT NULL,
  `rating` varchar(10) NOT NULL,
  `content` varchar(400) NOT NULL,
  `r_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`r_id`, `review_from`, `review_to`, `rating`, `content`, `r_date`) VALUES
(100001, 'Vishal Das', 'Nishant Vo', '4', 'With all due respect took care of me and didnt leave my side. thank you Vishal for taking care of me', '2020-01-08 01:32:01');

-- --------------------------------------------------------

--
-- Table structure for table `youngs`
--

CREATE TABLE `youngs` (
  `y_id` int(10) NOT NULL,
  `y_name` varchar(50) NOT NULL,
  `y_email` varchar(100) NOT NULL,
  `y_username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `youngs`
--

INSERT INTO `youngs` (`y_id`, `y_name`, `y_email`, `y_username`) VALUES
(10001, 'Nishant Vora', 'nishant.vora@gmail.com', 'nishant.vora'),
(10002, 'Rahul Devkar', 'rahul.devkar@gmail.com', 'rahul.devkar'),
(10003, 'Priti Doshi', 'priti.doshi@gmail.com', 'priti.doshi'),
(10004, 'Atharva Rane', 'atharva.rane@gmail.com', 'atharva.rane');

-- --------------------------------------------------------

--
-- Structure for view `oldstatus`
--
DROP TABLE IF EXISTS `oldstatus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `oldstatus`  AS  select `elders`.`e_id` AS `e_id`,`elders`.`e_name` AS `e_name`,`elders`.`e_email` AS `e_email`,`elders`.`available` AS `available`,`elders`.`e_funds` AS `e_funds` from `elders` where (`elders`.`available` = 'Yes') ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allotment`
--
ALTER TABLE `allotment`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `elders`
--
ALTER TABLE `elders`
  ADD PRIMARY KEY (`e_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`r_id`);

--
-- Indexes for table `youngs`
--
ALTER TABLE `youngs`
  ADD PRIMARY KEY (`y_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allotment`
--
ALTER TABLE `allotment`
  MODIFY `a_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100004;
--
-- AUTO_INCREMENT for table `elders`
--
ALTER TABLE `elders`
  MODIFY `e_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10013;
--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `r_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100002;
--
-- AUTO_INCREMENT for table `youngs`
--
ALTER TABLE `youngs`
  MODIFY `y_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10005;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
