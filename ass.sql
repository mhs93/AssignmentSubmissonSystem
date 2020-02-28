-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2019 at 11:25 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ass`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `id` int(11) NOT NULL,
  `reg_no` varchar(50) NOT NULL,
  `course_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignment`
--

INSERT INTO `assignment` (`id`, `reg_no`, `course_id`, `file`, `date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(27, '26', 34, '1551738067_CSE 303_CSE-2019-001.docx', '0000-00-00', '2019-03-05 04:21:07', '2019-03-05 04:21:07', '2019-03-05 04:21:07');

-- --------------------------------------------------------

--
-- Table structure for table `assign_course`
--

CREATE TABLE `assign_course` (
  `id` int(11) NOT NULL,
  `dept_name` varchar(50) NOT NULL,
  `teacher_name` varchar(255) NOT NULL,
  `totlal_credit` int(11) NOT NULL,
  `remaining_credit` int(11) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `course_credit` int(11) NOT NULL,
  `stat` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assign_course`
--

INSERT INTO `assign_course` (`id`, `dept_name`, `teacher_name`, `totlal_credit`, `remaining_credit`, `course_code`, `course_name`, `course_credit`, `stat`, `created_at`, `updated_at`, `deleted_at`) VALUES
(50, '16', 'Sabbir Muhammad Saleh', 30, 27, 'CSE 303', 'Compiler Design', 3, 1, '2019-03-05 04:18:07', '2019-03-05 04:18:07', '2019-03-05 04:18:07');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_code` varchar(255) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `course_credit` int(11) NOT NULL,
  `body` text NOT NULL,
  `dept_id` int(11) NOT NULL,
  `semi_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_code`, `course_name`, `course_credit`, `body`, `dept_id`, `semi_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(23, 'CSE 111', 'Computer Fundamental & Programming Technique', 3, 'this course', 16, 1, 1, '2018-12-08 00:32:32', '2018-12-08 00:32:32', '2018-12-08 00:32:32'),
(24, 'CSE 113', '	Structured Programming Language', 3, 'this course', 16, 1, 1, '2018-12-08 00:39:47', '2018-12-08 00:39:47', '2018-12-08 00:39:47'),
(27, 'CSE 213', 'Data Structure', 3, 'this course for CSE students', 16, 2, 1, '2018-12-08 00:43:59', '2018-12-08 00:43:59', '2018-12-08 00:43:59'),
(28, 'BUS 104', 'Introduction to Business', 3, 'this course for BBA students', 18, 1, 1, '2018-12-08 00:45:39', '2018-12-08 00:45:39', '2018-12-08 00:45:39'),
(29, 'SE 403', 'Software Quality Assurance', 3, 'this course for SE students', 19, 2, 1, '2018-12-08 00:46:57', '2018-12-08 00:46:57', '2018-12-08 00:46:57'),
(30, 'EEE 201', 'Electronic Circuit-1', 3, 'This course for EEE students', 17, 2, 1, '2018-12-08 00:51:04', '2018-12-08 00:51:04', '2018-12-08 00:51:04'),
(31, 'EEE 101', 'Electrical Engineering', 3, 'This course for EEE students', 17, 1, 1, '2018-12-08 00:52:38', '2018-12-08 00:52:38', '2018-12-08 00:52:38'),
(32, 'CIS 101', 'System Analysis & Design', 3, 'This course for CIS students', 20, 1, 1, '2018-12-08 00:53:55', '2018-12-08 00:53:55', '2018-12-08 00:53:55'),
(33, 'CIS 201', 'Digital System Design	', 3, 'This course for CIS students', 20, 3, 1, '2018-12-08 00:54:43', '2018-12-08 00:54:43', '2018-12-08 00:54:43'),
(34, 'CSE 303', 'Compiler Design', 3, 'This Course for CSE students in 7th semester', 16, 7, 1, '2018-12-08 03:55:16', '2018-12-08 03:55:16', '2018-12-08 03:55:16'),
(35, 'CSE 133', 'Structured Programming Language', 3, 'This course ', 16, 2, 1, '2019-02-25 04:41:20', '2019-02-25 04:41:20', '2019-02-25 04:41:20'),
(36, 'CSE 313', 'System Analysis', 3, 'this course', 19, 8, 1, '2019-02-25 05:04:51', '2019-02-25 05:04:51', '2019-02-25 05:04:51');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `code`, `title`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(16, 'CSE', 'Computer Science And Engineering', 1, '2018-12-08 00:02:19', '2018-12-08 00:02:19', '2018-12-08 00:02:19'),
(17, 'EEE', 'Electrical And Electronics Engineering', 1, '2018-12-08 00:04:02', '2018-12-08 00:04:02', '2018-12-08 00:04:02'),
(18, 'BBA', 'Bachelor of Business Administration', 1, '2018-12-08 00:05:48', '2018-12-08 00:05:48', '2018-12-08 00:05:48'),
(19, 'SE', 'Software Engineering', 1, '2018-12-08 00:07:30', '2018-12-08 00:07:30', '2018-12-08 00:07:30'),
(20, 'CIS', 'Computer Information System', 1, '2018-12-08 00:08:36', '2018-12-08 00:08:36', '2018-12-08 00:08:36');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `did` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`did`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Lecturer', '2017-04-27 12:04:56', '2017-04-27 12:04:56', '2017-04-27 12:04:56'),
(2, 'Assistant Professor', '2017-04-27 12:04:56', '2017-04-27 12:04:56', '2017-04-27 12:04:56'),
(3, 'Professor', '2017-04-27 12:04:56', '2017-04-27 12:04:56', '2017-04-27 12:04:56');

-- --------------------------------------------------------

--
-- Table structure for table `entrol_course`
--

CREATE TABLE `entrol_course` (
  `id` int(11) NOT NULL,
  `reg_no` varchar(50) NOT NULL,
  `course_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entrol_course`
--

INSERT INTO `entrol_course` (`id`, `reg_no`, `course_id`, `date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(34, '26', 34, '2019-03-04', '2019-03-05 04:19:30', '2019-03-05 04:19:30', '2019-03-05 04:19:30');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(11) NOT NULL,
  `grade` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `grade`) VALUES
(14, 'A+'),
(15, 'A'),
(16, 'A-'),
(17, 'B+'),
(18, 'B'),
(19, 'B-'),
(20, 'C+'),
(21, 'C'),
(22, 'D'),
(23, 'F');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `reg_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(0, '6th Semester', '2017-04-26 16:11:02', '2017-04-26 16:11:02', '2017-04-26 16:11:02'),
(1, ' 1st Semester', '2017-04-26 16:09:48', '2017-04-26 16:09:48', '2017-04-26 16:09:48'),
(2, '2nd Semester', '2017-04-26 16:09:48', '2017-04-26 16:09:48', '2017-04-26 16:09:48'),
(3, '3rd Semester', '2017-04-26 16:10:15', '2017-04-26 16:10:15', '2017-04-26 16:10:15'),
(4, '4th Semester', '2017-04-26 16:10:15', '2017-04-26 16:10:15', '2017-04-26 16:10:15'),
(5, '5th Semester', '2017-04-26 16:11:02', '2017-04-26 16:11:02', '2017-04-26 16:11:02'),
(7, '7th Semester', '2017-04-26 16:11:02', '2017-04-26 16:11:02', '2017-04-26 16:11:02'),
(8, '8th Semester', '2017-04-26 16:11:02', '2017-04-26 16:11:02', '2017-04-26 16:11:02'),
(9, '9th Semester', '2018-12-06 03:43:57', '2018-12-06 03:43:57', '2018-12-06 03:43:57'),
(10, '10th Semester', '2018-12-06 03:43:57', '2018-12-06 03:43:57', '2018-12-06 03:43:57'),
(11, '11th Semester', '2018-12-06 03:44:37', '2018-12-06 03:44:37', '2018-12-06 03:44:37'),
(12, '12th Semester', '2018-12-06 03:44:37', '2018-12-06 03:44:37', '2018-12-06 03:44:37');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(60) NOT NULL,
  `date` date NOT NULL,
  `address` varchar(255) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `reg_no` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `title`, `email`, `contact`, `date`, `address`, `dept_id`, `reg_no`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(26, 'Mominul Hasan', 'mominul93hasan@gmail.com', '01671343973', '2019-03-04', '107/A raysaheb bazar\r\nshormoshia atpara netrokona', 16, 'CSE-2019-001', 1, '2019-03-05 04:18:43', '2019-03-05 04:18:43', '2019-03-05 04:18:43');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(60) NOT NULL,
  `desig_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `total_credit` int(11) NOT NULL,
  `remaining_credit` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `address`, `email`, `contact`, `desig_id`, `dept_id`, `total_credit`, `remaining_credit`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(46, 'Sabbir Muhammad Saleh', 'Dhaka', 'sabbirmuhammadsaleh@gmail.com', '01399456512', 2, 16, 30, 27, 1, '2019-03-05 04:17:28', '2019-03-05 04:17:28', '2019-03-05 04:17:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT '0',
  `password` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `role`, `password`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'admin@gmail.com', 1, 'admin', '2018-11-30 19:36:46', '2018-12-05 19:36:46', '2017-05-07 19:36:46'),
(30, 'teacher368', 'sabbirmuhammadsaleh@gmail.com', 2, 'teacher368', '2019-03-05 04:17:28', '2019-03-05 04:17:28', '2019-03-05 04:17:28'),
(31, 'student326', 'mominul93hasan@gmail.com', 3, 'student326', '2019-03-05 04:18:43', '2019-03-05 04:18:43', '2019-03-05 04:18:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_course`
--
ALTER TABLE `assign_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `entrol_course`
--
ALTER TABLE `entrol_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reg_no` (`reg_no`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `assign_course`
--
ALTER TABLE `assign_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `entrol_course`
--
ALTER TABLE `entrol_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
