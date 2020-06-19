-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 16, 2020 at 01:13 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `physics`
--

-- --------------------------------------------------------

--
-- Table structure for table `apparatus`
--

DROP TABLE IF EXISTS `apparatus`;
CREATE TABLE IF NOT EXISTS `apparatus` (
  `app_id` int(25) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(25) NOT NULL,
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
CREATE TABLE IF NOT EXISTS `borrow` (
  `borrow_id` int(25) NOT NULL AUTO_INCREMENT,
  `borrow_date` date NOT NULL,
  `borrow_time` time(6) NOT NULL,
  `app_name` varchar(45) NOT NULL,
  `borrow_quantity` int(25) NOT NULL,
  PRIMARY KEY (`borrow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `compensate`
--

DROP TABLE IF EXISTS `compensate`;
CREATE TABLE IF NOT EXISTS `compensate` (
  `comp_id` int(25) NOT NULL AUTO_INCREMENT,
  `comp_date` varchar(25) NOT NULL,
  `comp_remarks` varchar(25) NOT NULL,
  PRIMARY KEY (`comp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `experiment`
--

DROP TABLE IF EXISTS `experiment`;
CREATE TABLE IF NOT EXISTS `experiment` (
  `exp_id` int(25) NOT NULL AUTO_INCREMENT,
  `exp_no` int(25) NOT NULL,
  `exp_name` varchar(45) NOT NULL,
  `subj_name` varchar(45) NOT NULL,
  PRIMARY KEY (`exp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `return`
--

DROP TABLE IF EXISTS `return`;
CREATE TABLE IF NOT EXISTS `return` (
  `return_id` int(25) NOT NULL,
  `return_date` date NOT NULL,
  `return_time` time(6) NOT NULL,
  `return_quantity` int(25) NOT NULL,
  `return_remarks` varchar(25) NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `stud_id` int(25) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `course` varchar(25) NOT NULL,
  `year` year(4) NOT NULL,
  `class_code` int(25) NOT NULL,
  `course_number` int(25) NOT NULL,
  PRIMARY KEY (`stud_id`),
  KEY `class_code` (`class_code`),
  KEY `course_number` (`course_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `class_code` int(10) NOT NULL AUTO_INCREMENT,
  `course_number` int(10) NOT NULL,
  `descriptive_title` varchar(25) NOT NULL,
  PRIMARY KEY (`class_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`class_code`) REFERENCES `subject` (`class_code`) ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`course_number`) REFERENCES `subject` (`class_code`) ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`stud_id`) REFERENCES `return` (`return_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
