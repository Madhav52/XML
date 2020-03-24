-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2019 at 07:56 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coursework`
--

-- --------------------------------------------------------

--
-- Table structure for table `ceo`
--

CREATE TABLE `ceo` (
  `id` int(5) NOT NULL,
  `title` varchar(55) NOT NULL,
  `ceoName` varchar(55) NOT NULL,
  `ceoAddress` varchar(55) NOT NULL,
  `ceoContact` varchar(55) NOT NULL,
  `ceoEmail` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ceo`
--

INSERT INTO `ceo` (`id`, `title`, `ceoName`, `ceoAddress`, `ceoContact`, `ceoEmail`) VALUES
(1, 'Mr.', 'Madhav Belbase', 'Kalanki', '9865373625', 'madhavbelbase52@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `companyinfo`
--

CREATE TABLE `companyinfo` (
  `id` int(5) NOT NULL,
  `companyName` varchar(55) NOT NULL,
  `companyAddress` varchar(55) NOT NULL,
  `companyTelNo` varchar(10) NOT NULL,
  `companyUrl` varchar(55) NOT NULL,
  `companyEmailId` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `companyinfo`
--

INSERT INTO `companyinfo` (`id`, `companyName`, `companyAddress`, `companyTelNo`, `companyUrl`, `companyEmailId`) VALUES
(1, 'A2Z IT Solutions Pvt. Ltd.', 'Kalanki', '014425314', 'www.itsolutions.com.np', 'itsolutions@company.com');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `departmentId` int(5) NOT NULL,
  `departmentName` varchar(55) NOT NULL,
  `departmentMembers` varchar(55) NOT NULL,
  `projectManager` varchar(55) NOT NULL,
  `teamLeader` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentId`, `departmentName`, `departmentMembers`, `projectManager`, `teamLeader`) VALUES
(1, 'Research and Development', 'Bipin Belbase', '', ''),
(2, 'Marketing Department', 'Marcus Kc', 'Sushant Giri', 'Vacant'),
(3, 'Human Resource Department', 'Kalpana Belbase', 'Vacant', 'Ajay Gautam'),
(4, 'Mobile Department', 'Anil Gautam', 'Anisha Giri', 'Anil Kc'),
(5, 'Web Department', 'Anup Adhikari', 'Samikshya Giri', 'Sunil Kc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ceo`
--
ALTER TABLE `ceo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companyinfo`
--
ALTER TABLE `companyinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ceo`
--
ALTER TABLE `ceo`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `companyinfo`
--
ALTER TABLE `companyinfo`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
