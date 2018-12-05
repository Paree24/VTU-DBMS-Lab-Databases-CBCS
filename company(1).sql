-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2018 at 06:58 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `company`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DNO` varchar(20) NOT NULL,
  `DNAME` varchar(20) DEFAULT NULL,
  `MGRSTARTDATE` date DEFAULT NULL,
  `MGRSSN` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DNO`, `DNAME`, `MGRSTARTDATE`, `MGRSSN`) VALUES
('1', 'accounts', '2016-01-01', 'acc01'),
('2', 'management', '2016-01-01', 'mgmt01'),
('3', 'Electronics', '2016-01-01', 'ece01'),
('4', 'Information Science', '2016-01-01', 'ise01'),
('5', 'Computer Science', '2016-01-01', 'cse05');

-- --------------------------------------------------------

--
-- Table structure for table `dlocation`
--

CREATE TABLE `dlocation` (
  `DLOC` varchar(20) NOT NULL,
  `DNO` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dlocation`
--

INSERT INTO `dlocation` (`DLOC`, `DNO`) VALUES
('Mysore', '01'),
('Mysore', '02'),
('Mysore', '03'),
('Mysore', '04'),
('Mysore', '05');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `SSN` varchar(20) NOT NULL,
  `FNAME` varchar(20) DEFAULT NULL,
  `LNAME` varchar(20) DEFAULT NULL,
  `ADDRESS` varchar(20) DEFAULT NULL,
  `SEX` char(1) DEFAULT NULL,
  `SALARY` int(11) DEFAULT NULL,
  `SUPERSSN` varchar(20) DEFAULT NULL,
  `DNO` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`SSN`, `FNAME`, `LNAME`, `ADDRESS`, `SEX`, `SALARY`, `SUPERSSN`, `DNO`) VALUES
('acc01', 'Rob', 'Swire', 'mysore', 'm', 500000, 'mgmt01', '1'),
('acc02', 'Joel', 'Zimmerman', 'mysore', 'm', 450000, 'mgmt01', '1'),
('cse01', 'jim', 'scott', 'mysore', 'm', 450000, 'mgmt01', '5'),
('cse02', 'john', 'smith', 'mysore', 'm', 450000, 'mgmt01', '5'),
('cse03', 'george', 'smith', 'mysore', 'm', 450000, 'mgmt01', '5'),
('cse04', 'george', 'Cornell', 'mysore', 'm', 450000, 'mgmt01', '5'),
('cse05', 'Mike', 'Shinoda', 'mysore', 'm', 600000, 'mgmt01', '5'),
('ece01', 'Nithin', 'Srivatsav', 'mysore', 'm', 600000, 'mgmt01', '3'),
('ise01', 'Nii', 'Badu', 'mysore', 'm', 450000, 'mgmt01', '4'),
('mgmt01', 'Paree', 'Katti', 'mysore', 'm', 1200000, NULL, '2');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `PNO` int(11) NOT NULL,
  `PNAME` varchar(20) DEFAULT NULL,
  `PLOCATION` varchar(20) DEFAULT NULL,
  `DNO` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`PNO`, `PNAME`, `PLOCATION`, `DNO`) VALUES
(1, 'IOT', 'Mysore', '3'),
(2, 'ML', 'Mysore', '5'),
(3, 'DIP', 'Mysore', '4'),
(4, 'SAN', 'Mysore', '4'),
(5, 'JAVA', 'Mysore', '4');

-- --------------------------------------------------------

--
-- Table structure for table `works_on`
--

CREATE TABLE `works_on` (
  `HOURS` int(11) DEFAULT NULL,
  `SSN` varchar(20) NOT NULL,
  `PNO` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `works_on`
--

INSERT INTO `works_on` (`HOURS`, `SSN`, `PNO`) VALUES
(100, 'cse01', '2'),
(100, 'cse02', '3'),
(100, 'cse03', '4'),
(100, 'ece01', '1'),
(100, 'ise01', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DNO`),
  ADD KEY `department_ibfk_1` (`MGRSSN`);

--
-- Indexes for table `dlocation`
--
ALTER TABLE `dlocation`
  ADD PRIMARY KEY (`DNO`,`DLOC`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`SSN`),
  ADD KEY `SUPERSSN` (`SUPERSSN`),
  ADD KEY `DNO` (`DNO`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`PNO`);

--
-- Indexes for table `works_on`
--
ALTER TABLE `works_on`
  ADD PRIMARY KEY (`SSN`,`PNO`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`MGRSSN`) REFERENCES `employee` (`SSN`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`SUPERSSN`) REFERENCES `employee` (`SSN`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`DNO`) REFERENCES `department` (`DNO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
