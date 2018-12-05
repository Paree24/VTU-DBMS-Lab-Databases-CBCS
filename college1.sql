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
-- Database: `college1`
--

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `USN` varchar(10) NOT NULL,
  `SSID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`USN`, `SSID`) VALUES
('1BI15CS101', '4C'),
('1BI15CS102', '8A'),
('1BI15CS103', '8B'),
('1BI15CS104', '8C'),
('1BI15CS105', '5A');

-- --------------------------------------------------------

--
-- Table structure for table `iamarks`
--

CREATE TABLE `iamarks` (
  `USN` varchar(10) NOT NULL,
  `Subcode` varchar(10) NOT NULL,
  `SSID` varchar(10) NOT NULL,
  `test1` int(11) DEFAULT NULL,
  `test2` int(11) DEFAULT NULL,
  `test3` int(11) DEFAULT NULL,
  `FinalIA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iamarks`
--

INSERT INTO `iamarks` (`USN`, `Subcode`, `SSID`, `test1`, `test2`, `test3`, `FinalIA`) VALUES
('1BI15CS101', '15CS43', '4C', 16, 18, 20, 19),
('1BI15CS102', '15CS83', '8A', 16, 18, 20, 19),
('1BI15CS103', '15CS82', '8B', 12, 10, 10, 11),
('1BI15CS104', '15CS83', '8C', 14, 15, 10, 15),
('1BI15CS105', '15CS52', '5A', 14, 15, 10, 15);

-- --------------------------------------------------------

--
-- Table structure for table `semsec`
--

CREATE TABLE `semsec` (
  `SSID` varchar(10) NOT NULL,
  `Sem` varchar(5) DEFAULT NULL,
  `Sec` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semsec`
--

INSERT INTO `semsec` (`SSID`, `Sem`, `Sec`) VALUES
('4C', '4', 'C'),
('5A', '5', 'A'),
('8A', '8', 'A'),
('8B', '8', 'B'),
('8C', '8', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `USN` varchar(10) NOT NULL,
  `Sname` varchar(20) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `Gender` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`USN`, `Sname`, `Address`, `Phone`, `Gender`) VALUES
('1BI15CS101', 'Pai', 'Mysore', '9987654321', 'Female'),
('1BI15CS102', 'Paree', 'Mysore', '9987654322', 'Male'),
('1BI15CS103', 'Ponnanna', 'Mysore', '9987654222', 'Male'),
('1BI15CS104', 'Nithin', 'Mysore', '8987654322', 'Male'),
('1BI15CS105', 'Swathi', 'Mysore', '8987654323', 'Female');

-- --------------------------------------------------------

--
-- Stand-in structure for view `st_test1`
-- (See below for the actual view)
--
CREATE TABLE `st_test1` (
`USN` varchar(10)
,`Sname` varchar(20)
,`Subcode` varchar(10)
,`Test1` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `Subcode` varchar(10) NOT NULL,
  `Title` varchar(25) DEFAULT NULL,
  `Sem` varchar(5) DEFAULT NULL,
  `Credits` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`Subcode`, `Title`, `Sem`, `Credits`) VALUES
('15CS43', 'Algorithms', '4', '4'),
('15CS52', 'DBMS', '5', '4'),
('15CS81', 'Big Data', '8', '4'),
('15CS82', 'IOT', '8', '4'),
('15CS83', 'NLP', '8', '4');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1`
-- (See below for the actual view)
--
CREATE TABLE `view1` (
`test1` int(11)
,`usn` varchar(10)
,`subcode` varchar(10)
);

-- --------------------------------------------------------

--
-- Structure for view `st_test1`
--
DROP TABLE IF EXISTS `st_test1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `st_test1`  AS  select `s`.`USN` AS `USN`,`s`.`Sname` AS `Sname`,`i`.`Subcode` AS `Subcode`,`i`.`test1` AS `Test1` from (`student` `s` join `iamarks` `i`) where ((`s`.`USN` = `i`.`USN`) and (`i`.`USN` = '1BI15CS101')) ;

-- --------------------------------------------------------

--
-- Structure for view `view1`
--
DROP TABLE IF EXISTS `view1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1`  AS  select `i`.`test1` AS `test1`,`i`.`USN` AS `usn`,`i`.`Subcode` AS `subcode` from `iamarks` `i` where (`i`.`USN` = '1BI15cs101') ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`USN`,`SSID`),
  ADD KEY `SSID` (`SSID`);

--
-- Indexes for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD PRIMARY KEY (`USN`,`SSID`,`Subcode`),
  ADD KEY `SSID` (`SSID`),
  ADD KEY `Subcode` (`Subcode`);

--
-- Indexes for table `semsec`
--
ALTER TABLE `semsec`
  ADD PRIMARY KEY (`SSID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`USN`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`Subcode`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`USN`) REFERENCES `student` (`USN`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`SSID`) REFERENCES `semsec` (`SSID`) ON DELETE CASCADE;

--
-- Constraints for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD CONSTRAINT `iamarks_ibfk_1` FOREIGN KEY (`USN`) REFERENCES `student` (`USN`) ON DELETE CASCADE,
  ADD CONSTRAINT `iamarks_ibfk_2` FOREIGN KEY (`SSID`) REFERENCES `semsec` (`SSID`) ON DELETE CASCADE,
  ADD CONSTRAINT `iamarks_ibfk_3` FOREIGN KEY (`Subcode`) REFERENCES `subject` (`Subcode`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
