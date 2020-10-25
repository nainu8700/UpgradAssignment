-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2020 at 06:26 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `upgrad`
--

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studid` int(10) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `phnum` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `fathersname` varchar(100) NOT NULL,
  `fathersnum` varchar(100) NOT NULL,
  `fathersemail` varchar(100) NOT NULL,
  `university` varchar(100) NOT NULL,
  `stream` varchar(100) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `backlog` int(10) NOT NULL,
  `yop` varchar(50) NOT NULL,
  `pguniversity` varchar(100) NOT NULL,
  `pggrade` varchar(20) NOT NULL,
  `pgbacklog` int(10) NOT NULL,
  `pgyop` varchar(20) NOT NULL,
  `worktitle` varchar(100) NOT NULL,
  `working` varchar(10) NOT NULL,
  `placed` varchar(10) NOT NULL,
  `linkedIn` varchar(50) NOT NULL,
  `github` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studid`, `Name`, `phnum`, `email`, `address`, `fathersname`, `fathersnum`, `fathersemail`, `university`, `stream`, `grade`, `backlog`, `yop`, `pguniversity`, `pggrade`, `pgbacklog`, `pgyop`, `worktitle`, `working`, `placed`, `linkedIn`, `github`) VALUES
(1, 'Nainu Wadhwa', '9518260673', 'nainuwadhwa99@gmailcom', 'ksr Girls hostel,faridabad', 'Surinder Wadhwa ', '8295626275', 'nainuwadhwa769@gmail.com', 'Lingaya\'s Vidyapeeth', 'Computer Science', '9.5', 0, '2021', 'None', 'None', 0, '2021', 'full stack developer', 'No', 'No', 'www.google.com', 'https://github.com/nainu870'),
(2, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', '', '', '', ''),
(3, 'Megha', '8396969870', 'pari20@gmail.com', '404/27 Arjun Nagar \r\nRohtak', 'Mr. surinder wadhwa', '9354542399', 'surinderwadhwa@gmail.com', 'thapar university', 'B Tech ', '81 %', 0, '2021', 'none', '0', 0, 'none', 'web designer', 'yes', '', '', ''),
(4, 'siya kakkar', '9858621221', 'siyakakkar207@gmail.com', '382 A sector 1 \r\nrohtak', 'M.viresh kakka', '9875512525', 'mrviresh@gmail.com', 'Delhi university', 'Medical', '88%', 0, '2019', '', '', 0, '', 'Delhi university', 'NO', 'NO', 'www.mahi.com', 'www.mahi4u.com'),
(5, 'Titiksha Chugh', '9874851551', 'titikshachugh@gmail.com', '678 neelam vihar\r\nDelhi ', 'Mr. ajay chugh', '9841515531', 'ambastudio@gmail.com', 'Punjab University ', 'Bsc', '98%', 0, '', '', '', 0, '', '', '', '', '', ''),
(6, 'Jasjeet singh ', '98854512556', 'jasjeetsingh05@gmail.com', '427 DLF colony \r\nRohtak', 'Mr. ramprakash', '9846756157245', 'naresh@gmail.com', 'Chandigarh university ', 'b tech ', '85', 1, '2021', 'du', '76', 2, '2022', 'android developer', 'Yes', 'Yes', '', ''),
(12, 'Nainu', '9518260673', 'nainuwadhwa99@gmail.com', 'arjun nagar', 'Rakesh', '8295606275', 'suri@gmail.com', 'lingayas', 'CSE', '95', 0, '2021', '', '', 0, 'Select year of passi', 'Coder', 'No', 'No', 'www.google.com', 'www.google.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
