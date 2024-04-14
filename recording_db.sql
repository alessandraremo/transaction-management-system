-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2023 at 04:37 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recording_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(255) DEFAULT NULL,
  `program` varchar(255) DEFAULT NULL,
  `product` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `grandTotal` decimal(10,2) DEFAULT NULL,
  `modeOfPayment` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`id`, `date`, `name`, `program`, `product`, `price`, `quantity`, `total`, `grandTotal`, `modeOfPayment`) VALUES
(1, '2023-11-30 15:37:23', 'Yezha May Elca', 'Computer Engineering', 'CTC', 50.00, 1, 50.00, 50.00, 'Cash'),
(4, '2023-11-30 15:53:22', 'Juan Dela Cruz', 'Computer Engineering', 'COG', 120.00, 1, 120.00, 120.00, 'Gcash'),
(8, '2023-11-30 16:27:23', 'Alina Cruz', 'Electronic Engineering', 'GOOD MORAL', 150.00, 1, 150.00, 225.00, 'Bank'),
(9, '2023-11-30 16:27:23', 'Alina Cruz', 'Electronic Engineering', 'COR', 75.00, 1, 75.00, 225.00, 'Bank'),
(12, '2023-11-30 16:31:15', 'Cristina Cruz', 'Architecture', 'TOR', 100.00, 2, 200.00, 200.00, 'Cash'),
(15, '2023-11-30 16:40:34', 'Cristina Cruz', 'Architecture', 'GOOD MORAL', 150.00, 1, 150.00, 150.00, 'Gcash'),
(16, '2023-11-30 16:41:52', 'Yezha May Elca', 'Computer Engineering', 'COG', 120.00, 1, 120.00, 195.00, 'Cash'),
(17, '2023-11-30 16:41:52', 'Yezha May Elca', 'Computer Engineering', 'COR', 75.00, 1, 75.00, 195.00, 'Cash'),
(18, '2023-12-01 01:40:42', 'Alina Cruz', 'Electronic Engineering', 'COR', 75.00, 1, 75.00, 75.00, 'Gcash'),
(19, '2023-12-01 12:10:29', 'Alyssa Joanna Frago', 'Mechanical Engineer', 'GOOD MORAL', 150.00, 1, 150.00, 150.00, 'Bank'),
(20, '2023-12-02 02:56:49', 'Alina Cruz', 'Electronic Engineering', 'COG', 120.00, 1, 120.00, 120.00, 'Gcash'),
(21, '2023-12-02 03:04:47', 'Yezha May Elca', 'Computer Engineering', 'COR', 75.00, 1, 75.00, 75.00, 'Bank'),
(22, '2023-12-02 03:09:32', 'Yezha May Elca', 'Computer Engineering', 'TOR', 100.00, 1, 100.00, 100.00, 'Gcash'),
(23, '2023-12-02 03:17:26', 'Alina Cruz', 'Electronic Engineering', 'GOOD MORAL', 150.00, 1, 150.00, 150.00, 'Bank'),
(24, '2023-12-02 05:22:45', 'Alyssa Joanna Frago', 'Mechanical Engineering', 'GOOD MORAL', 150.00, 1, 150.00, 150.00, 'Gcash'),
(25, '2023-12-02 06:02:10', 'Alaissa Chavez', 'Industrial Engineering', 'GOOD MORAL', 150.00, 1, 150.00, 150.00, 'Gcash'),
(26, '2023-12-08 04:30:30', 'Yezha May Elca', 'Computer Engineering', 'Men\'s Uniform', 1000.00, 2, 2000.00, 2075.00, 'Gcash'),
(27, '2023-12-08 04:30:30', 'Yezha May Elca', 'Computer Engineering', 'COR', 75.00, 1, 75.00, 2075.00, 'Gcash'),
(28, '2023-12-08 19:34:18', 'Alaissa Chavez', 'Industrial Engineering', 'CTC', 50.00, 1, 50.00, 50.00, 'Cash'),
(29, '2023-12-08 19:39:03', 'Alaissa Chavez', 'Industrial Engineering', 'CTC', 50.00, 1, 50.00, 50.00, 'Cash'),
(30, '2023-12-08 19:44:34', 'Alessandra Remo', 'Environmental Engineering', 'GOOD MORAL', 150.00, 1, 150.00, 150.00, 'Cash'),
(31, '2023-12-08 20:04:59', 'Alina Cruz', 'Electronic Engineering', 'COG', 120.00, 1, 120.00, 120.00, 'Gcash'),
(32, '2023-12-09 01:36:37', 'Alaissa Chavez', 'Industrial Engineering', 'GOOD MORAL', 150.00, 1, 150.00, 150.00, 'Cash'),
(33, '2023-12-09 03:29:06', 'Yezha May Elca', 'Computer Engineering', 'Men\'s Uniform', 1000.00, 2, 2000.00, 2100.00, 'Cash'),
(34, '2023-12-09 03:29:06', 'Yezha May Elca', 'Computer Engineering', 'CTC', 50.00, 2, 100.00, 2100.00, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_code` varchar(50) NOT NULL,
  `course_title` varchar(255) NOT NULL,
  `lecture` int(11) NOT NULL,
  `laboratory` int(11) NOT NULL,
  `total_units` int(11) NOT NULL,
  `prerequisite` varchar(255) NOT NULL,
  `YrLevel` int(20) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_code`, `course_title`, `lecture`, `laboratory`, `total_units`, `prerequisite`, `YrLevel`) VALUES
(1, 'SOCI 1103', 'Contemporary World', 3, 0, 3, 'None', 1),
(2, 'MATH 1103', 'Mathematics in the Modern World', 3, 0, 3, 'None', 2),
(3, 'MATH 2033', 'College and Advanced Algebra', 2, 3, 3, 'None', 1),
(4, 'MATH 2044', 'Plane & Spherical Trigonometry, Analytic & Solid Geometry', 3, 3, 4, 'None', 2),
(5, 'NASC 2013', 'Chemistry for Engineers (lec)', 3, 0, 3, 'None', 1),
(6, 'NASC 2011', 'Chemistry for Engineers (lab)', 0, 3, 1, 'None', 1),
(7, 'COEN 1101', 'Computer Engineering as Discipline', 1, 0, 1, 'None', 3),
(8, 'COEN 1102', 'Programming Logic and Design', 0, 6, 2, 'None', 1),
(9, 'ENGL 1103', 'Purposive Communication', 3, 0, 3, 'None', 1),
(10, 'PSYC 1103', 'Understanding the Self', 3, 0, 3, 'None', 1),
(11, 'PHED 1102', 'Physical Education 1', 2, 0, 2, 'None', 1),
(12, 'NSTP 1103', 'National Service Training Program 1', 3, 0, 3, 'None', 1),
(13, 'HUMA 1013', 'Art Appreciation', 3, 0, 3, 'None', 1),
(14, 'MATH 2073', 'Calculus 1 (Differential Calculus)', 3, 0, 3, 'Algebra, Trigonometry', 3),
(15, 'ENSC 1013', 'Science, Technology and Society', 3, 0, 3, 'None', 1),
(16, 'COEN 1202', 'Object Oriented Programming', 0, 6, 2, 'Programming Logic and Design', 1),
(17, 'ENSC 2013', 'Engineering Data Analysis', 3, 0, 3, 'Calculus 1', 1),
(18, 'PHED 1022', 'Physical Education 2', 2, 0, 2, 'PE 1', 1),
(19, 'NSTP 1023', 'National Service Training Program 2', 3, 0, 3, 'NSTP 1', 1),
(20, 'NASC 2053', 'Physics for Engineers (lec)', 3, 0, 3, 'Calculus 1 (Differential Calculus)', 1),
(21, 'NASC 2051', 'Physics for Engineers\r\n', 0, 3, 1, 'Calculus 1 (Differential Calculus)', 1),
(22, 'MATH 2093', 'Calculus 2 (Integral Calculus)', 3, 0, 3, 'Calculus 1 (Differential Calculus)', 4),
(23, 'ENSC 2021', 'Computer-Aided Drafting', 0, 3, 1, 'None', 1),
(24, 'ECEN 2103', 'Fundamentals of Electrical Circuits (lec)', 3, 0, 3, 'Physics for Engineers', 1),
(25, 'ECEN 2101', 'Fundamentals of Electrical Circuits (lab)', 0, 3, 1, 'Physics for Engineers', 4),
(26, 'MATH 2103', 'Differential Equations', 3, 0, 3, 'Calculus 2 (Integral Calculus)', 1),
(27, 'COEN 2102', 'Data Structures and Algorithms', 0, 6, 2, 'Object Oriented Programming', 1),
(28, 'ENVI 2103', 'Environmental Science and Engineering', 3, 0, 3, 'None', 1),
(29, 'ENSC 2103', 'Engineering Economics', 3, 0, 3, '2nd Year Standing', 1),
(30, 'COEN 2112', 'Fundamentals of Computer Hardware', 0, 6, 2, 'None', 1),
(31, 'PHED 2112', 'Physical Education 3', 2, 0, 2, 'Physical Education 2', 1),
(32, 'COEN 2213', 'Numerical Methods', 3, 0, 3, 'Differential Equations', 1),
(33, 'COEN 2203', 'Software Design', 3, 0, 3, 'Data Structures and Algorithms', 1),
(34, 'COEN 2201', 'Software Design (Lab)', 0, 3, 1, 'Data Structures and Algorithms', 1),
(35, 'HIST 1023', 'Life and Works of Rizal', 3, 0, 3, 'None', 1),
(36, 'GECE 2203', 'GEC Free Elective 1 (People and The Earth Ecosystem)', 3, 0, 3, 'None', 1),
(37, 'COEN 1203', 'Discrete Mathematics', 3, 0, 3, 'Calculus 1 (Differential Calculus)', 1),
(38, 'COEN 2233', 'Fundamentals of Electronic Circuits (Lec)', 3, 0, 3, 'Fundamentals of Electronic Circuits', 1),
(39, 'COEN 2231', 'Fundamentals of Electronic Circuits (Lab)', 0, 3, 1, 'Fundamentals of Electronic Circuits', 1),
(40, 'HIST 1013', 'Readings in Philippine History', 3, 0, 3, 'None', 1),
(41, 'PHED 1042', 'Physical Education 4', 2, 0, 2, 'Physical Education  3', 1),
(42, 'GECE 2213', 'GEC Free Elective 2 (Gender and Society)', 3, 0, 3, 'None', 1),
(43, 'COEN 3103', 'Logic, Circuit and Design', 3, 0, 3, 'Fundamentals of Electronic Circuits', 1),
(44, 'COEN 3101', 'Logic, Circuit and Design (Lab)', 0, 3, 1, 'Fundamentals of Electronic Circuits', 1),
(45, 'COEN 3123', 'Operating System', 3, 0, 3, 'Data Structures and Algorithms', 1),
(46, 'COEN 3113', 'Data and Digital Communication', 3, 0, 3, 'Fundamentals of Electronic Circuits', 1),
(47, 'COEN 3111', 'Introduction to HDL', 0, 3, 1, 'Programming Logic and Design, Fundamentals of Electronic Circuits', 1),
(48, 'COEN 3133', 'Feedback and Control System', 3, 0, 3, 'Fundamentals of Electronic Circuits, Numerical Methods', 1),
(49, 'COEN 3143', 'Fundamentals of Mixed Signals and Sensors', 3, 0, 3, 'Fundamentals of Electronic Circuits', 1),
(50, 'COGE 3103', 'Cognate Elective 1 (Project Management w/ PL Application)', 2, 3, 3, 'None', 1),
(51, 'COEN 3121', 'Computer Engineering Drafting and Design', 0, 3, 1, 'Fundamentals of Electronic Circuits', 1),
(52, 'COEN 3203', 'Computer Networks and Security', 3, 0, 3, 'Data and Digital Communication', 1),
(53, 'COEN 3201', 'Computer Networks and Security (Lab)', 0, 3, 1, 'Data and Digital Communication', 1),
(54, 'COEN 3213', 'Microprocessors', 3, 0, 3, 'Logic, Circuit and Design', 1),
(55, 'COEN 3211', 'Microprocessors (Lab)', 0, 3, 1, 'Logic, Circuit and Design', 1),
(56, 'COEN 3202', 'Methods of Research', 2, 0, 2, 'Engineering Data Analysis, Purposive Communication, Logic Circuit and Design', 1),
(57, 'ENSC 3203', 'Basic Occupational Health and Safety', 3, 0, 3, '3rd Year Standing', 1),
(58, 'ENSC 2113', 'Technopreneurship', 3, 0, 3, '3rd Year Standing', 1),
(59, 'COEN 3212', 'Programmable Logic Control, Robotics and Mechatronics', 0, 6, 2, 'Logic, Circuit and Design', 1),
(60, 'COGE 3203', 'Cognate Elective 2 (DBMS w/ PL Application)', 2, 3, 3, 'Cognate 1', 1),
(61, 'COEN 3223', 'On-the-Job Training', 0, 6, 2, '3rd Year Standing', 1),
(62, 'COEN 4103', 'Computer Architecture and Organization', 3, 0, 3, 'Microprocessors', 1),
(63, 'COEN 4101', 'Computer Architecture and Organization (Lab)', 0, 3, 1, 'Microprocessors', 1),
(64, 'COEN 4113', 'CpE Laws and Professional Practice', 2, 0, 2, '4th Year Standing', 1),
(65, 'COEN 4111', 'Cpe Project Design 1', 0, 3, 1, 'Microprocessors, Methods of Research', 1),
(66, 'COEN 4123', 'Digital Signal Processing', 3, 0, 3, 'Feedback and Control System', 1),
(67, 'COEN 4121', 'Digital Signal Processing (Lab)', 0, 3, 1, 'Feedback and Control System', 1),
(68, 'GECE 4103', 'GEC Free Elective 3', 3, 0, 3, 'GEC Free Elective 2', 1),
(69, 'COEN 4203', 'Emerging Technologies in CpE', 3, 0, 3, '4th Year Standing', 1),
(70, 'COEN 4202', 'CpE Practice and Design 2', 0, 6, 2, 'CpE Practice and Design 1', 1),
(71, 'COEN 4201', 'Seminars and Fieldtrips', 0, 3, 1, '4th Year Standing', 1),
(72, 'COEN 4213', 'Embedded Systems', 3, 0, 3, 'Microprocessors', 1),
(73, 'COEN 4211', 'Embedded Systems (Lab)', 0, 3, 1, 'Microprocessors', 1),
(74, 'COGE 4223', 'Cognate Elective 3 (AI w/ Data Analytics)', 2, 3, 3, 'Cognate Elective 2', 1),
(75, 'PHIL 1013', 'Ethics', 3, 0, 3, 'None', 1),
(76, 'HUMA 1013', 'Art Appreciation', 3, 0, 3, 'None', 1),
(77, 'IEEN 101', 'Industrial Engineering Orientation', 1, 0, 1, 'None', 1),
(78, 'MATH 2033', 'College and Advanced Algebra', 2, 3, 3, 'None', 1),
(79, 'MATH 2044', 'Plane & Spherical Trigonometry, Analytic & Solid Geometry', 3, 3, 4, 'None', 1),
(80, 'ENSC 2021', 'Computer-Aided Drafting', 0, 3, 1, 'None', 1),
(81, 'ENSC 2192', 'Computer Fundamentals and Programming', 0, 6, 2, 'None', 1),
(82, 'PHED 1012', 'Physical Education 1', 2, 0, 2, 'None', 1),
(83, 'NSTP 1013', 'NSTP 1', 3, 0, 3, 'None', 1),
(84, 'MATH 2073', 'Calculus 1', 3, 0, 3, 'College and Advanced Algebra; Plane & Spherical Trigonometry, Analytic & Solid Geometry', 1),
(85, 'MATH 1013', 'Mathematics in the Modern World', 3, 0, 3, 'None', 1),
(86, 'IEEN 1203', 'Statistical Analysis for Industrial Engineering 1', 3, 0, 3, 'None', 1),
(87, 'IEEN 1213', 'Principles of Economics', 3, 0, 3, 'None', 1),
(88, 'IEEN 1223', 'Financial Accounting', 3, 0, 3, 'None', 1),
(89, 'NASC 2011', 'Chemistry for Engineers (Lab)', 0, 3, 1, 'None', 1),
(90, 'NASC 2013', 'Chemistry for Engineers (Lec)', 3, 0, 3, 'None', 1),
(91, 'PHED 1022', 'Physical Education 2', 2, 0, 2, 'Physical Education 1', 1),
(92, 'NSTP 1023', 'NSTP 2', 3, 0, 3, 'NSTP 1', 1),
(93, 'NASC 2051', 'Physics for Engineers (Lab)', 0, 3, 1, 'Calculus 2', 1),
(94, 'NASC 2053', 'Physics for Engineers (Lec)', 3, 0, 3, 'Calculus 2', 1),
(95, 'MATH 2093', 'Calculus 2', 3, 0, 3, 'Calculus 1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `program` varchar(255) NOT NULL,
  `student_no` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `semester` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `program`, `student_no`, `address`, `gender`, `semester`, `email`) VALUES
(5, 'Yezha May Elca', 'Computer Engineering', '20210102001', 'Sucat, Muntinlupa City', 'Female', '2022-2023 First Semester', 'yezhamaye@gmail.com'),
(7, 'Juan Dela Cruz', 'Computer Engineering', '20210102002', 'Plaridel, Bulacan', 'Male', '2022-2023 First Semester', 'juan@gmail.com'),
(8, 'Cristina Cruz', 'Architecture', '20210102003', 'Sucat, Muntinlupa City', 'Female', '2022-2023 First Semester', 'cristina@gmail.com'),
(9, 'Alina Cruz', 'Electronic Engineering', '20210102004', 'San Ildefonso, Bulacan', 'Female', '2022-2023 First Semester', 'alina@gmail.com'),
(10, 'Alyssa Joanna Frago', 'Mechanical Engineering', '20210102005', 'San Pedro, Laguna', 'Female', '2022-2023 First Semester', 'alyssa@gmail.com'),
(11, 'Alaissa Chavez', 'Industrial Engineering', '20210102006', 'Bayanan', 'Female', '2022-2023 First Semester', 'alaiss@gmail.com'),
(12, 'Alessandra Remo', 'Environmental Engineering', '20210102007', 'Binan, Laguna', 'Female', '2022-2023 First Semester', 'alessandra@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `student_program` varchar(255) NOT NULL,
  `student_semester` varchar(255) NOT NULL,
  `course_code` varchar(255) NOT NULL,
  `course_title` varchar(255) NOT NULL,
  `lecture` varchar(255) NOT NULL,
  `laboratory` varchar(255) NOT NULL,
  `total_units` varchar(255) NOT NULL,
  `prerequisite` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `student_name`, `student_program`, `student_semester`, `course_code`, `course_title`, `lecture`, `laboratory`, `total_units`, `prerequisite`) VALUES
(11, 'Juan Dela Cruz', 'Computer Engineering', '2022-2023 First Semester', 'NSTP 1103', 'National Service Training Program 1', '3', '0', '3', 'None'),
(12, 'Juan Dela Cruz', 'Computer Engineering', '2022-2023 First Semester', 'NSTP 1103', 'National Service Training Program 1', '3', '0', '3', 'None'),
(13, 'Juan Dela Cruz', 'Computer Engineering', '2022-2023 First Semester', 'HUMA 1013', 'Art Appreciation', '3', '0', '3', 'None'),
(14, 'Juan Dela Cruz', 'Computer Engineering', '2022-2023 First Semester', 'HUMA 1013', 'Art Appreciation', '3', '0', '3', 'None'),
(15, 'Juan Dela Cruz', 'Computer Engineering', '2022-2023 First Semester', 'SOCI 1103', 'Contemporary World', '3', '0', '3', 'None'),
(16, 'Juan Dela Cruz', 'Computer Engineering', '2022-2023 First Semester', 'SOCI 1103', 'Contemporary World', '3', '0', '3', 'None'),
(17, 'Juan Dela Cruz', 'Computer Engineering', '2022-2023 First Semester', 'MATH 1103', 'Mathematics in the Modern World', '3', '0', '3', 'None'),
(18, 'Juan Dela Cruz', 'Computer Engineering', '2022-2023 First Semester', 'MATH 1103', 'Mathematics in the Modern World', '3', '0', '3', 'None'),
(19, 'Juan Dela Cruz', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2033', 'College and Advanced Algebra', '2', '3', '3', 'None'),
(20, 'Juan Dela Cruz', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2033', 'College and Advanced Algebra', '2', '3', '3', 'None'),
(24, 'yezha may elca', 'Computer Engineering', '2022-2023 First Semester', 'ECEN 2103', 'Fundamentals of Electrical Circuits (lec)', '3', '0', '3', 'Physics for Engineers'),
(25, 'yezha may elca', 'Computer Engineering', '2022-2023 First Semester', 'ECEN 2103', 'Fundamentals of Electrical Circuits (lec)', '3', '0', '3', 'Physics for Engineers'),
(26, 'yezha may elca', 'Computer Engineering', '2022-2023 First Semester', 'ECEN 2101', 'Fundamentals of Electrical Circuits (lab)', '0', '3', '1', 'Physics for Engineers'),
(27, 'yezha may elca', 'Computer Engineering', '2022-2023 First Semester', 'ECEN 2101', 'Fundamentals of Electrical Circuits (lab)', '0', '3', '1', 'Physics for Engineers'),
(28, 'yezha may elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2103', 'Differential Equations', '3', '0', '3', 'Calculus 2 (Integral Calculus)'),
(29, 'yezha may elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2103', 'Differential Equations', '3', '0', '3', 'Calculus 2 (Integral Calculus)'),
(30, 'yezha may elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 2102', 'Data Structures and Algorithms', '0', '6', '2', 'Object Oriented Programming'),
(31, 'yezha may elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 2102', 'Data Structures and Algorithms', '0', '6', '2', 'Object Oriented Programming'),
(32, 'yezha may elca', 'Computer Engineering', '2022-2023 First Semester', 'ENVI 2103', 'Environmental Science and Engineering', '3', '0', '3', 'None'),
(33, 'yezha may elca', 'Computer Engineering', '2022-2023 First Semester', 'ENVI 2103', 'Environmental Science and Engineering', '3', '0', '3', 'None'),
(34, 'yezha may elca', 'Computer Engineering', '2022-2023 First Semester', 'ENSC 2103', 'Engineering Economics', '3', '0', '3', '2nd Year Standing'),
(35, 'yezha may elca', 'Computer Engineering', '2022-2023 First Semester', 'ENSC 2103', 'Engineering Economics', '3', '0', '3', '2nd Year Standing'),
(36, 'yezha may elca', 'Computer Engineering', '2022-2023 First Semester', 'PHED 1042', 'Physical Education 4', '2', '0', '2', 'Physical Education  3'),
(37, 'yezha may elca', 'Computer Engineering', '2022-2023 First Semester', 'PHED 1042', 'Physical Education 4', '2', '0', '2', 'Physical Education  3'),
(38, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'SOCI 1103', 'Contemporary World', '3', '0', '3', 'None'),
(39, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'SOCI 1103', 'Contemporary World', '3', '0', '3', 'None'),
(40, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'MATH 1103', 'Mathematics in the Modern World', '3', '0', '3', 'None'),
(41, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'MATH 1103', 'Mathematics in the Modern World', '3', '0', '3', 'None'),
(42, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'MATH 2033', 'College and Advanced Algebra', '2', '3', '3', 'None'),
(43, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'MATH 2033', 'College and Advanced Algebra', '2', '3', '3', 'None'),
(44, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'MATH 2044', 'Plane & Spherical Trigonometry, Analytic & Solid Geometry', '3', '3', '4', 'None'),
(45, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'MATH 2044', 'Plane & Spherical Trigonometry, Analytic & Solid Geometry', '3', '3', '4', 'None'),
(46, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'NASC 2013', 'Chemistry for Engineers (lec)', '3', '0', '3', 'None'),
(47, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'NASC 2013', 'Chemistry for Engineers (lec)', '3', '0', '3', 'None'),
(48, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'NASC 2011', 'Chemistry for Engineers (lab)', '0', '3', '1', 'None'),
(49, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'NASC 2011', 'Chemistry for Engineers (lab)', '0', '3', '1', 'None'),
(50, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'COEN 1101', 'Computer Engineering as Discipline', '1', '0', '1', 'None'),
(51, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'COEN 1101', 'Computer Engineering as Discipline', '1', '0', '1', 'None'),
(52, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'COEN 1102', 'Programming Logic and Design', '0', '6', '2', 'None'),
(53, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'COEN 1102', 'Programming Logic and Design', '0', '6', '2', 'None'),
(54, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'ENGL 1103', 'Purposive Communication', '3', '0', '3', 'None'),
(55, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'ENGL 1103', 'Purposive Communication', '3', '0', '3', 'None'),
(56, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'PSYC 1103', 'Understanding the Self', '3', '0', '3', 'None'),
(57, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'PSYC 1103', 'Understanding the Self', '3', '0', '3', 'None'),
(58, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'PHED 1102', 'Physical Education 1', '2', '0', '2', 'None'),
(59, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'PHED 1102', 'Physical Education 1', '2', '0', '2', 'None'),
(60, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'NSTP 1103', 'National Service Training Program 1', '3', '0', '3', 'None'),
(61, 'Cristina Cruz', 'Architecture', '2022-2023 Second Semester', 'NSTP 1103', 'National Service Training Program 1', '3', '0', '3', 'None'),
(62, 'Alyssa Joanna Frago', 'Mechanical Engineering', '2022-2023 First Semester', 'ENSC 2103', 'Engineering Economics', '3', '0', '3', '2nd Year Standing'),
(63, 'Alyssa Joanna Frago', 'Mechanical Engineering', '2022-2023 First Semester', 'ENSC 2103', 'Engineering Economics', '3', '0', '3', '2nd Year Standing'),
(64, 'Alyssa Joanna Frago', 'Mechanical Engineering', '2022-2023 First Semester', 'COEN 2112', 'Fundamentals of Computer Hardware', '0', '6', '2', 'None'),
(65, 'Alyssa Joanna Frago', 'Mechanical Engineering', '2022-2023 First Semester', 'COEN 2112', 'Fundamentals of Computer Hardware', '0', '6', '2', 'None'),
(66, 'Alyssa Joanna Frago', 'Mechanical Engineering', '2022-2023 First Semester', 'PHED 2112', 'Physical Education 3', '2', '0', '2', 'Physical Education 2'),
(67, 'Alyssa Joanna Frago', 'Mechanical Engineering', '2022-2023 First Semester', 'PHED 2112', 'Physical Education 3', '2', '0', '2', 'Physical Education 2'),
(68, 'Alyssa Joanna Frago', 'Mechanical Engineering', '2022-2023 First Semester', 'COEN 2213', 'Numerical Methods', '3', '0', '3', 'Differential Equations'),
(69, 'Alyssa Joanna Frago', 'Mechanical Engineering', '2022-2023 First Semester', 'COEN 2213', 'Numerical Methods', '3', '0', '3', 'Differential Equations'),
(70, 'Alyssa Joanna Frago', 'Mechanical Engineering', '2022-2023 First Semester', 'COEN 2203', 'Software Design', '3', '0', '3', 'Data Structures and Algorithms'),
(71, 'Alyssa Joanna Frago', 'Mechanical Engineering', '2022-2023 First Semester', 'COEN 2203', 'Software Design', '3', '0', '3', 'Data Structures and Algorithms'),
(72, 'Alina Cruz', 'Electronic Engineering', '2022-2023 Second Semester', 'COEN 4202', 'CpE Practice and Design 2', '0', '6', '2', 'CpE Practice and Design 1'),
(73, 'Alina Cruz', 'Electronic Engineering', '2022-2023 Second Semester', 'COEN 4202', 'CpE Practice and Design 2', '0', '6', '2', 'CpE Practice and Design 1'),
(74, 'Alina Cruz', 'Electronic Engineering', '2022-2023 Second Semester', 'COEN 4201', 'Seminars and Fieldtrips', '0', '3', '1', '4th Year Standing'),
(75, 'Alina Cruz', 'Electronic Engineering', '2022-2023 Second Semester', 'COEN 4201', 'Seminars and Fieldtrips', '0', '3', '1', '4th Year Standing'),
(76, 'Alina Cruz', 'Electronic Engineering', '2022-2023 Second Semester', 'COEN 4213', 'Embedded Systems', '3', '0', '3', 'Microprocessors'),
(77, 'Alina Cruz', 'Electronic Engineering', '2022-2023 Second Semester', 'COEN 4213', 'Embedded Systems', '3', '0', '3', 'Microprocessors'),
(78, 'Alina Cruz', 'Electronic Engineering', '2022-2023 Second Semester', 'COEN 4211', 'Embedded Systems (Lab)', '0', '3', '1', 'Microprocessors'),
(79, 'Alina Cruz', 'Electronic Engineering', '2022-2023 Second Semester', 'COEN 4211', 'Embedded Systems (Lab)', '0', '3', '1', 'Microprocessors'),
(80, 'Alina Cruz', 'Electronic Engineering', '2022-2023 Second Semester', 'COGE 4223', 'Cognate Elective 3 (AI w/ Data Analytics)', '2', '3', '3', 'Cognate Elective 2'),
(81, 'Alina Cruz', 'Electronic Engineering', '2022-2023 Second Semester', 'COGE 4223', 'Cognate Elective 3 (AI w/ Data Analytics)', '2', '3', '3', 'Cognate Elective 2'),
(82, 'Alina Cruz', 'Electronic Engineering', '2022-2023 Second Semester', 'PHIL 1013', 'Ethics', '3', '0', '3', 'None'),
(83, 'Alina Cruz', 'Electronic Engineering', '2022-2023 Second Semester', 'PHIL 1013', 'Ethics', '3', '0', '3', 'None'),
(84, 'Juan Dela Cruz', 'Computer Engineering', '2022-2023 First Semester', 'ENGL 1103', 'Purposive Communication', '3', '0', '3', 'None'),
(85, 'Juan Dela Cruz', 'Computer Engineering', '2022-2023 First Semester', 'ENGL 1103', 'Purposive Communication', '3', '0', '3', 'None'),
(86, 'Alaissa Chavez', 'Industrial Engineering', '2022-2023 First Semester', 'SOCI 1103', 'Contemporary World', '3', '0', '3', 'None'),
(87, 'Alaissa Chavez', 'Industrial Engineering', '2022-2023 First Semester', 'SOCI 1103', 'Contemporary World', '3', '0', '3', 'None'),
(88, 'Alaissa Chavez', 'Industrial Engineering', '2022-2023 First Semester', 'MATH 1103', 'Mathematics in the Modern World', '3', '0', '3', 'None'),
(89, 'Alaissa Chavez', 'Industrial Engineering', '2022-2023 First Semester', 'MATH 1103', 'Mathematics in the Modern World', '3', '0', '3', 'None'),
(90, 'Alaissa Chavez', 'Industrial Engineering', '2022-2023 First Semester', 'MATH 2033', 'College and Advanced Algebra', '2', '3', '3', 'None'),
(91, 'Alaissa Chavez', 'Industrial Engineering', '2022-2023 First Semester', 'MATH 2033', 'College and Advanced Algebra', '2', '3', '3', 'None'),
(92, 'Alaissa Chavez', 'Industrial Engineering', '2022-2023 First Semester', 'MATH 2044', 'Plane & Spherical Trigonometry, Analytic & Solid Geometry', '3', '3', '4', 'None'),
(93, 'Alaissa Chavez', 'Industrial Engineering', '2022-2023 First Semester', 'MATH 2044', 'Plane & Spherical Trigonometry, Analytic & Solid Geometry', '3', '3', '4', 'None'),
(94, 'Alaissa Chavez', 'Industrial Engineering', '2022-2023 First Semester', 'NASC 2013', 'Chemistry for Engineers (lec)', '3', '0', '3', 'None'),
(95, 'Alaissa Chavez', 'Industrial Engineering', '2022-2023 First Semester', 'NASC 2013', 'Chemistry for Engineers (lec)', '3', '0', '3', 'None'),
(96, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2073', 'Calculus 1 (Differential Calculus)', '3', '0', '3', 'Algebra, Trigonometry'),
(97, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2073', 'Calculus 1 (Differential Calculus)', '3', '0', '3', 'Algebra, Trigonometry'),
(98, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3111', 'Introduction to HDL', '0', '3', '1', 'Programming Logic and Design, Fundamentals of Electronic Circuits'),
(99, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3111', 'Introduction to HDL', '0', '3', '1', 'Programming Logic and Design, Fundamentals of Electronic Circuits'),
(100, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3133', 'Feedback and Control System', '3', '0', '3', 'Fundamentals of Electronic Circuits, Numerical Methods'),
(101, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3133', 'Feedback and Control System', '3', '0', '3', 'Fundamentals of Electronic Circuits, Numerical Methods'),
(102, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2093', 'Calculus 2 (Integral Calculus)', '3', '0', '3', 'Calculus 1 (Differential Calculus)'),
(103, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2093', 'Calculus 2 (Integral Calculus)', '3', '0', '3', 'Calculus 1 (Differential Calculus)'),
(104, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ECEN 2101', 'Fundamentals of Electrical Circuits (lab)', '0', '3', '1', 'Physics for Engineers'),
(105, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ECEN 2101', 'Fundamentals of Electrical Circuits (lab)', '0', '3', '1', 'Physics for Engineers'),
(106, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2093', 'Calculus 2 (Integral Calculus)', '3', '0', '3', 'Calculus 1 (Differential Calculus)'),
(107, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2093', 'Calculus 2 (Integral Calculus)', '3', '0', '3', 'Calculus 1 (Differential Calculus)'),
(108, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ECEN 2101', 'Fundamentals of Electrical Circuits (lab)', '0', '3', '1', 'Physics for Engineers'),
(109, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ECEN 2101', 'Fundamentals of Electrical Circuits (lab)', '0', '3', '1', 'Physics for Engineers'),
(110, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 1101', 'Computer Engineering as Discipline', '1', '0', '1', 'None'),
(111, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 1101', 'Computer Engineering as Discipline', '1', '0', '1', 'None'),
(112, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2073', 'Calculus 1 (Differential Calculus)', '3', '0', '3', 'Algebra, Trigonometry'),
(113, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2073', 'Calculus 1 (Differential Calculus)', '3', '0', '3', 'Algebra, Trigonometry'),
(114, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'SOCI 1103', 'Contemporary World', '3', '0', '3', 'None'),
(115, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'SOCI 1103', 'Contemporary World', '3', '0', '3', 'None'),
(116, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2033', 'College and Advanced Algebra', '2', '3', '3', 'None'),
(117, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2033', 'College and Advanced Algebra', '2', '3', '3', 'None'),
(118, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'NASC 2013', 'Chemistry for Engineers (lec)', '3', '0', '3', 'None'),
(119, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'NASC 2013', 'Chemistry for Engineers (lec)', '3', '0', '3', 'None'),
(120, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'NASC 2011', 'Chemistry for Engineers (lab)', '0', '3', '1', 'None'),
(121, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'NASC 2011', 'Chemistry for Engineers (lab)', '0', '3', '1', 'None'),
(122, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 1102', 'Programming Logic and Design', '0', '6', '2', 'None'),
(123, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 1102', 'Programming Logic and Design', '0', '6', '2', 'None'),
(124, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ENGL 1103', 'Purposive Communication', '3', '0', '3', 'None'),
(125, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ENGL 1103', 'Purposive Communication', '3', '0', '3', 'None'),
(126, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'PSYC 1103', 'Understanding the Self', '3', '0', '3', 'None'),
(127, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'PSYC 1103', 'Understanding the Self', '3', '0', '3', 'None'),
(128, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'PHED 1102', 'Physical Education 1', '2', '0', '2', 'None'),
(129, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'PHED 1102', 'Physical Education 1', '2', '0', '2', 'None'),
(130, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'NSTP 1103', 'National Service Training Program 1', '3', '0', '3', 'None'),
(131, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'NSTP 1103', 'National Service Training Program 1', '3', '0', '3', 'None'),
(132, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'HUMA 1013', 'Art Appreciation', '3', '0', '3', 'None'),
(133, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'HUMA 1013', 'Art Appreciation', '3', '0', '3', 'None'),
(134, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ENSC 1013', 'Science, Technology and Society', '3', '0', '3', 'None'),
(135, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ENSC 1013', 'Science, Technology and Society', '3', '0', '3', 'None'),
(136, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 1202', 'Object Oriented Programming', '0', '6', '2', 'Programming Logic and Design'),
(137, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 1202', 'Object Oriented Programming', '0', '6', '2', 'Programming Logic and Design'),
(138, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ENSC 2013', 'Engineering Data Analysis', '3', '0', '3', 'Calculus 1'),
(139, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ENSC 2013', 'Engineering Data Analysis', '3', '0', '3', 'Calculus 1'),
(140, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'PHED 1022', 'Physical Education 2', '2', '0', '2', 'PE 1'),
(141, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'PHED 1022', 'Physical Education 2', '2', '0', '2', 'PE 1'),
(142, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'NSTP 1023', 'National Service Training Program 2', '3', '0', '3', 'NSTP 1'),
(143, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'NSTP 1023', 'National Service Training Program 2', '3', '0', '3', 'NSTP 1'),
(144, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'NASC 2053', 'Physics for Engineers (lec)', '3', '0', '3', 'Calculus 1 (Differential Calculus)'),
(145, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'NASC 2053', 'Physics for Engineers (lec)', '3', '0', '3', 'Calculus 1 (Differential Calculus)'),
(146, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'NASC 2051', 'Physics for Engineers\r\n', '0', '3', '1', 'Calculus 1 (Differential Calculus)'),
(147, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'NASC 2051', 'Physics for Engineers\r\n', '0', '3', '1', 'Calculus 1 (Differential Calculus)'),
(148, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ENSC 2021', 'Computer-Aided Drafting', '0', '3', '1', 'None'),
(149, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ENSC 2021', 'Computer-Aided Drafting', '0', '3', '1', 'None'),
(150, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ECEN 2103', 'Fundamentals of Electrical Circuits (lec)', '3', '0', '3', 'Physics for Engineers'),
(151, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ECEN 2103', 'Fundamentals of Electrical Circuits (lec)', '3', '0', '3', 'Physics for Engineers'),
(152, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2103', 'Differential Equations', '3', '0', '3', 'Calculus 2 (Integral Calculus)'),
(153, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2103', 'Differential Equations', '3', '0', '3', 'Calculus 2 (Integral Calculus)'),
(154, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 2102', 'Data Structures and Algorithms', '0', '6', '2', 'Object Oriented Programming'),
(155, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 2102', 'Data Structures and Algorithms', '0', '6', '2', 'Object Oriented Programming'),
(156, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ENVI 2103', 'Environmental Science and Engineering', '3', '0', '3', 'None'),
(157, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ENVI 2103', 'Environmental Science and Engineering', '3', '0', '3', 'None'),
(158, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ENSC 2103', 'Engineering Economics', '3', '0', '3', '2nd Year Standing'),
(159, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ENSC 2103', 'Engineering Economics', '3', '0', '3', '2nd Year Standing'),
(160, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 2112', 'Fundamentals of Computer Hardware', '0', '6', '2', 'None'),
(161, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 2112', 'Fundamentals of Computer Hardware', '0', '6', '2', 'None'),
(162, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'PHED 2112', 'Physical Education 3', '2', '0', '2', 'Physical Education 2'),
(163, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'PHED 2112', 'Physical Education 3', '2', '0', '2', 'Physical Education 2'),
(164, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 2213', 'Numerical Methods', '3', '0', '3', 'Differential Equations'),
(165, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 2213', 'Numerical Methods', '3', '0', '3', 'Differential Equations'),
(166, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 2203', 'Software Design', '3', '0', '3', 'Data Structures and Algorithms'),
(167, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 2203', 'Software Design', '3', '0', '3', 'Data Structures and Algorithms'),
(168, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 2201', 'Software Design (Lab)', '0', '3', '1', 'Data Structures and Algorithms'),
(169, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 2201', 'Software Design (Lab)', '0', '3', '1', 'Data Structures and Algorithms'),
(170, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'HIST 1023', 'Life and Works of Rizal', '3', '0', '3', 'None'),
(171, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'HIST 1023', 'Life and Works of Rizal', '3', '0', '3', 'None'),
(172, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'GECE 2203', 'GEC Free Elective 1 (People and The Earth Ecosystem)', '3', '0', '3', 'None'),
(173, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'GECE 2203', 'GEC Free Elective 1 (People and The Earth Ecosystem)', '3', '0', '3', 'None'),
(174, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 1203', 'Discrete Mathematics', '3', '0', '3', 'Calculus 1 (Differential Calculus)'),
(175, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 1203', 'Discrete Mathematics', '3', '0', '3', 'Calculus 1 (Differential Calculus)'),
(176, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 2233', 'Fundamentals of Electronic Circuits (Lec)', '3', '0', '3', 'Fundamentals of Electronic Circuits'),
(177, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 2233', 'Fundamentals of Electronic Circuits (Lec)', '3', '0', '3', 'Fundamentals of Electronic Circuits'),
(178, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 2231', 'Fundamentals of Electronic Circuits (Lab)', '0', '3', '1', 'Fundamentals of Electronic Circuits'),
(179, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 2231', 'Fundamentals of Electronic Circuits (Lab)', '0', '3', '1', 'Fundamentals of Electronic Circuits'),
(180, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'HIST 1013', 'Readings in Philippine History', '3', '0', '3', 'None'),
(181, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'HIST 1013', 'Readings in Philippine History', '3', '0', '3', 'None'),
(182, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'PHED 1042', 'Physical Education 4', '2', '0', '2', 'Physical Education  3'),
(183, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'PHED 1042', 'Physical Education 4', '2', '0', '2', 'Physical Education  3'),
(184, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'GECE 2213', 'GEC Free Elective 2 (Gender and Society)', '3', '0', '3', 'None'),
(185, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'GECE 2213', 'GEC Free Elective 2 (Gender and Society)', '3', '0', '3', 'None'),
(186, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3103', 'Logic, Circuit and Design', '3', '0', '3', 'Fundamentals of Electronic Circuits'),
(187, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3103', 'Logic, Circuit and Design', '3', '0', '3', 'Fundamentals of Electronic Circuits'),
(188, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3101', 'Logic, Circuit and Design (Lab)', '0', '3', '1', 'Fundamentals of Electronic Circuits'),
(189, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3101', 'Logic, Circuit and Design (Lab)', '0', '3', '1', 'Fundamentals of Electronic Circuits'),
(190, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3123', 'Operating System', '3', '0', '3', 'Data Structures and Algorithms'),
(191, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3123', 'Operating System', '3', '0', '3', 'Data Structures and Algorithms'),
(192, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3113', 'Data and Digital Communication', '3', '0', '3', 'Fundamentals of Electronic Circuits'),
(193, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3113', 'Data and Digital Communication', '3', '0', '3', 'Fundamentals of Electronic Circuits'),
(194, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3111', 'Introduction to HDL', '0', '3', '1', 'Programming Logic and Design, Fundamentals of Electronic Circuits'),
(195, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3111', 'Introduction to HDL', '0', '3', '1', 'Programming Logic and Design, Fundamentals of Electronic Circuits'),
(196, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3133', 'Feedback and Control System', '3', '0', '3', 'Fundamentals of Electronic Circuits, Numerical Methods'),
(197, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3133', 'Feedback and Control System', '3', '0', '3', 'Fundamentals of Electronic Circuits, Numerical Methods'),
(198, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3143', 'Fundamentals of Mixed Signals and Sensors', '3', '0', '3', 'Fundamentals of Electronic Circuits'),
(199, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3143', 'Fundamentals of Mixed Signals and Sensors', '3', '0', '3', 'Fundamentals of Electronic Circuits'),
(200, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COGE 3103', 'Cognate Elective 1 (Project Management w/ PL Application)', '2', '3', '3', 'None'),
(201, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COGE 3103', 'Cognate Elective 1 (Project Management w/ PL Application)', '2', '3', '3', 'None'),
(202, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3121', 'Computer Engineering Drafting and Design', '0', '3', '1', 'Fundamentals of Electronic Circuits'),
(203, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3121', 'Computer Engineering Drafting and Design', '0', '3', '1', 'Fundamentals of Electronic Circuits'),
(204, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3203', 'Computer Networks and Security', '3', '0', '3', 'Data and Digital Communication'),
(205, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3203', 'Computer Networks and Security', '3', '0', '3', 'Data and Digital Communication'),
(206, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3201', 'Computer Networks and Security (Lab)', '0', '3', '1', 'Data and Digital Communication'),
(207, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3201', 'Computer Networks and Security (Lab)', '0', '3', '1', 'Data and Digital Communication'),
(208, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3213', 'Microprocessors', '3', '0', '3', 'Logic, Circuit and Design'),
(209, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3213', 'Microprocessors', '3', '0', '3', 'Logic, Circuit and Design'),
(210, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3211', 'Microprocessors (Lab)', '0', '3', '1', 'Logic, Circuit and Design'),
(211, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3211', 'Microprocessors (Lab)', '0', '3', '1', 'Logic, Circuit and Design'),
(212, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3202', 'Methods of Research', '2', '0', '2', 'Engineering Data Analysis, Purposive Communication, Logic Circuit and Design'),
(213, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3202', 'Methods of Research', '2', '0', '2', 'Engineering Data Analysis, Purposive Communication, Logic Circuit and Design'),
(214, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ENSC 3203', 'Basic Occupational Health and Safety', '3', '0', '3', '3rd Year Standing'),
(215, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ENSC 3203', 'Basic Occupational Health and Safety', '3', '0', '3', '3rd Year Standing'),
(216, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ENSC 2113', 'Technopreneurship', '3', '0', '3', '3rd Year Standing'),
(217, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ENSC 2113', 'Technopreneurship', '3', '0', '3', '3rd Year Standing'),
(218, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3212', 'Programmable Logic Control, Robotics and Mechatronics', '0', '6', '2', 'Logic, Circuit and Design'),
(219, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3212', 'Programmable Logic Control, Robotics and Mechatronics', '0', '6', '2', 'Logic, Circuit and Design'),
(220, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COGE 3203', 'Cognate Elective 2 (DBMS w/ PL Application)', '2', '3', '3', 'Cognate 1'),
(221, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COGE 3203', 'Cognate Elective 2 (DBMS w/ PL Application)', '2', '3', '3', 'Cognate 1'),
(222, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3223', 'On-the-Job Training', '0', '6', '2', '3rd Year Standing'),
(223, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 3223', 'On-the-Job Training', '0', '6', '2', '3rd Year Standing'),
(224, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4103', 'Computer Architecture and Organization', '3', '0', '3', 'Microprocessors'),
(225, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4103', 'Computer Architecture and Organization', '3', '0', '3', 'Microprocessors'),
(226, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4101', 'Computer Architecture and Organization (Lab)', '0', '3', '1', 'Microprocessors'),
(227, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4101', 'Computer Architecture and Organization (Lab)', '0', '3', '1', 'Microprocessors'),
(228, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4113', 'CpE Laws and Professional Practice', '2', '0', '2', '4th Year Standing'),
(229, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4113', 'CpE Laws and Professional Practice', '2', '0', '2', '4th Year Standing'),
(230, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4111', 'Cpe Project Design 1', '0', '3', '1', 'Microprocessors, Methods of Research'),
(231, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4111', 'Cpe Project Design 1', '0', '3', '1', 'Microprocessors, Methods of Research'),
(232, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4123', 'Digital Signal Processing', '3', '0', '3', 'Feedback and Control System'),
(233, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4123', 'Digital Signal Processing', '3', '0', '3', 'Feedback and Control System'),
(234, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4121', 'Digital Signal Processing (Lab)', '0', '3', '1', 'Feedback and Control System'),
(235, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4121', 'Digital Signal Processing (Lab)', '0', '3', '1', 'Feedback and Control System'),
(236, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'GECE 4103', 'GEC Free Elective 3', '3', '0', '3', 'GEC Free Elective 2'),
(237, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'GECE 4103', 'GEC Free Elective 3', '3', '0', '3', 'GEC Free Elective 2'),
(238, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4203', 'Emerging Technologies in CpE', '3', '0', '3', '4th Year Standing'),
(239, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4203', 'Emerging Technologies in CpE', '3', '0', '3', '4th Year Standing'),
(240, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4202', 'CpE Practice and Design 2', '0', '6', '2', 'CpE Practice and Design 1'),
(241, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4202', 'CpE Practice and Design 2', '0', '6', '2', 'CpE Practice and Design 1'),
(242, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4201', 'Seminars and Fieldtrips', '0', '3', '1', '4th Year Standing'),
(243, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4201', 'Seminars and Fieldtrips', '0', '3', '1', '4th Year Standing'),
(244, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4213', 'Embedded Systems', '3', '0', '3', 'Microprocessors'),
(245, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4213', 'Embedded Systems', '3', '0', '3', 'Microprocessors'),
(246, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4211', 'Embedded Systems (Lab)', '0', '3', '1', 'Microprocessors'),
(247, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COEN 4211', 'Embedded Systems (Lab)', '0', '3', '1', 'Microprocessors'),
(248, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COGE 4223', 'Cognate Elective 3 (AI w/ Data Analytics)', '2', '3', '3', 'Cognate Elective 2'),
(249, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'COGE 4223', 'Cognate Elective 3 (AI w/ Data Analytics)', '2', '3', '3', 'Cognate Elective 2'),
(250, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'PHIL 1013', 'Ethics', '3', '0', '3', 'None'),
(251, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'PHIL 1013', 'Ethics', '3', '0', '3', 'None'),
(252, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'IEEN 101', 'Industrial Engineering Orientation', '1', '0', '1', 'None'),
(253, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'IEEN 101', 'Industrial Engineering Orientation', '1', '0', '1', 'None'),
(254, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2044', 'Plane & Spherical Trigonometry, Analytic & Solid Geometry', '3', '3', '4', 'None'),
(255, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2044', 'Plane & Spherical Trigonometry, Analytic & Solid Geometry', '3', '3', '4', 'None'),
(256, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ENSC 2192', 'Computer Fundamentals and Programming', '0', '6', '2', 'None'),
(257, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'ENSC 2192', 'Computer Fundamentals and Programming', '0', '6', '2', 'None'),
(258, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'PHED 1012', 'Physical Education 1', '2', '0', '2', 'None'),
(259, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'PHED 1012', 'Physical Education 1', '2', '0', '2', 'None'),
(260, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'NSTP 1013', 'NSTP 1', '3', '0', '3', 'None'),
(261, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'NSTP 1013', 'NSTP 1', '3', '0', '3', 'None'),
(262, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2073', 'Calculus 1', '3', '0', '3', 'College and Advanced Algebra; Plane & Spherical Trigonometry, Analytic & Solid Geometry'),
(263, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2073', 'Calculus 1', '3', '0', '3', 'College and Advanced Algebra; Plane & Spherical Trigonometry, Analytic & Solid Geometry'),
(264, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 1013', 'Mathematics in the Modern World', '3', '0', '3', 'None'),
(265, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 1013', 'Mathematics in the Modern World', '3', '0', '3', 'None'),
(266, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'IEEN 1203', 'Statistical Analysis for Industrial Engineering 1', '3', '0', '3', 'None'),
(267, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'IEEN 1203', 'Statistical Analysis for Industrial Engineering 1', '3', '0', '3', 'None'),
(268, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'IEEN 1213', 'Principles of Economics', '3', '0', '3', 'None'),
(269, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'IEEN 1213', 'Principles of Economics', '3', '0', '3', 'None'),
(270, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'IEEN 1223', 'Financial Accounting', '3', '0', '3', 'None'),
(271, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'IEEN 1223', 'Financial Accounting', '3', '0', '3', 'None'),
(272, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2093', 'Calculus 2', '3', '0', '3', 'Calculus 1'),
(273, 'Yezha May Elca', 'Computer Engineering', '2022-2023 First Semester', 'MATH 2093', 'Calculus 2', '3', '0', '3', 'Calculus 1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', '12345'),
(2, 'yezhamay', '12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=274;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
