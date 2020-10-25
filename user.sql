-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2020 at 06:27 PM
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
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(10) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `fname`, `lname`, `email`, `password`) VALUES
(1, 'Nainu', 'Wadhwa', 'nainuwadhwa99@gmail.com', '$5$rounds=535000$V1nWorBWWC1aAkP0$nq0.69nctHOzfg85mao6quavBL/teLsjyFUThMl5dOC'),
(2, 'Nainuss', 'Wadhwa', 'nainuwadhwa98@gmail.com', '$5$rounds=535000$BvfQnye6OcyprwWO$h4AGdnwjJs1NYu/vGmaw5X17ZXsXuqOQJiaueXnQLJ9'),
(3, 'Nainuss', 'Wadhwa', 'nainuwadhwa98@gmail.com', '$5$rounds=535000$q.NVKbkVMgiWN.RQ$cfImibC/4fH2IuSquC7zp8uqlPR6nBFMNVtvNQACp76'),
(4, 'Nainuss', 'Wadhwa', 'nainuwadhwa98@gmail.com', '$5$rounds=535000$GHqIna..niqtf4dk$rclCsn33UW99AiGFXbfZNC/lys//eGuxt33RLZ2Rrf4'),
(5, 'megha', 'Wadhwa', 'nainuwadhwa94@gmail.com', '$5$rounds=535000$xk2sDS6h8D5HBN95$ebUtVIOpEsyOlK6d8ixLs25T/liOGeWk4V6NoWEmb93');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
