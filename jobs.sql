-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2020 at 06:25 PM
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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `jobid` int(100) NOT NULL,
  `Cname` varchar(100) NOT NULL,
  `DriveDate` date NOT NULL,
  `LastUpdateDate` date NOT NULL,
  `NumVacancies` int(50) NOT NULL,
  `RelevantVacancies` varchar(100) NOT NULL,
  `CTC` double NOT NULL,
  `AvgCTC` int(50) NOT NULL,
  `Stipend` int(50) NOT NULL,
  `AvgStipend` int(50) NOT NULL,
  `DriveStatus` varchar(100) NOT NULL,
  `Profile` varchar(100) NOT NULL,
  `Remarks` varchar(200) NOT NULL,
  `DriveSent` varchar(100) NOT NULL,
  `Description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`jobid`, `Cname`, `DriveDate`, `LastUpdateDate`, `NumVacancies`, `RelevantVacancies`, `CTC`, `AvgCTC`, `Stipend`, `AvgStipend`, `DriveStatus`, `Profile`, `Remarks`, `DriveSent`, `Description`) VALUES
(1, 'upgrad', '2020-10-28', '2020-10-13', 10, '4', 5.6, 5, 30000, 20000, 'Ongoing', 'Design Lead - Product (UI/UX)', 'Position - Design Lead  Product\r\n\r\nLocation - Mumbai/Bangalore\r\n\r\n ', 'Yes', 'Work closely with your team and other designers in defining, designing and iterating on product features across web and mobile platforms\r\nGet out of the Office and work with research to observe the impact of your work in the real world, and take that input back to your work as a designer to be const'),
(2, 'Upgrad', '2020-11-11', '2020-10-22', 12, '8', 8.5, 6, 40000, 250000, 'Ongoing', 'Technical Architect (Android)', 'Location: Mumbai / Bengaluru\r\nFull-time', 'Yes', 'Lead a project end-to-end and collaborate across functions.\r\nDrive planning, estimation and execution.\r\nUnderstand requirements well and come up with efficient design, while developing complex, well backed and bug-free products\r\nBe the go-to person for the mobile application developers and mentor th'),
(3, 'Upgrad', '2020-09-09', '2020-08-08', 4, '3', 7.6, 5, 350000, 250000, 'Completed', 'Content Strategist - Data', 'Location: Mumbai\r\nFull-time', 'Yes', 'Develop world-class content for online courses on Data Science, Neural Networks, Deep Learning. This job will equip the candidate with highly sought-after skills and will be a great starting point for a career.\r\nUnderstand the industry requirements and develop courses to help students meet high stan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`jobid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
