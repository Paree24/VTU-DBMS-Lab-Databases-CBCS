CREATE DATABASE  IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `library`;
-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `Book_id` int(11) NOT NULL,
  `Title` char(20) DEFAULT NULL,
  `Publisher_Name` char(20) DEFAULT NULL,
  `Pub_Year` int(11) DEFAULT NULL,
  PRIMARY KEY (`Book_id`),
  KEY `Publisher_Name` (`Publisher_Name`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`Publisher_Name`) REFERENCES `publisher` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Algorithms','Pearson',2014),(2,'Data Structures','McGrew Hill',2015),(3,'C Programming','Oxford',2014),(4,'UNIX','Penguin',2003);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_author`
--

DROP TABLE IF EXISTS `book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_author` (
  `Book_id` int(11) NOT NULL,
  `author` char(20) NOT NULL,
  PRIMARY KEY (`Book_id`,`author`),
  CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `book` (`Book_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_author`
--

LOCK TABLES `book_author` WRITE;
/*!40000 ALTER TABLE `book_author` DISABLE KEYS */;
INSERT INTO `book_author` VALUES (1,'Levitin'),(2,'Lipchutz'),(3,'Ritchie'),(4,'Linus');
/*!40000 ALTER TABLE `book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_copies`
--

DROP TABLE IF EXISTS `book_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_copies` (
  `book_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `No_of_copies` int(11) DEFAULT NULL,
  PRIMARY KEY (`book_id`,`branch_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `book_copies_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`Book_id`) ON DELETE CASCADE,
  CONSTRAINT `book_copies_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `library_branch` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_copies`
--

LOCK TABLES `book_copies` WRITE;
/*!40000 ALTER TABLE `book_copies` DISABLE KEYS */;
INSERT INTO `book_copies` VALUES (1,1000,7),(2,1001,9),(3,1002,15),(4,1003,5);
/*!40000 ALTER TABLE `book_copies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `book_copies_view`
--

DROP TABLE IF EXISTS `book_copies_view`;
/*!50001 DROP VIEW IF EXISTS `book_copies_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `book_copies_view` AS SELECT 
 1 AS `book_id`,
 1 AS `title`,
 1 AS `no_of_copies`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `book_lending`
--

DROP TABLE IF EXISTS `book_lending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_lending` (
  `book_id` int(11) NOT NULL,
  `Branch_id` int(11) NOT NULL,
  `card_no` int(11) NOT NULL,
  `date_out` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  PRIMARY KEY (`book_id`,`Branch_id`,`card_no`),
  KEY `Branch_id` (`Branch_id`),
  KEY `card_no` (`card_no`),
  CONSTRAINT `book_lending_ibfk_1` FOREIGN KEY (`Branch_id`) REFERENCES `library_branch` (`branch_id`),
  CONSTRAINT `book_lending_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`Book_id`) ON DELETE CASCADE,
  CONSTRAINT `book_lending_ibfk_3` FOREIGN KEY (`card_no`) REFERENCES `borrower` (`card_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_lending`
--

LOCK TABLES `book_lending` WRITE;
/*!40000 ALTER TABLE `book_lending` DISABLE KEYS */;
INSERT INTO `book_lending` VALUES (1,1000,100,'2017-01-31','2017-02-21'),(2,1001,100,'2017-04-01','2017-04-11'),(3,1002,100,'2017-05-31','2017-06-21'),(4,1003,101,'2017-03-01','2017-04-11');
/*!40000 ALTER TABLE `book_lending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower`
--

DROP TABLE IF EXISTS `borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower` (
  `card_no` int(11) NOT NULL,
  `Bname` char(20) DEFAULT NULL,
  `Branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`card_no`),
  KEY `Branch_id` (`Branch_id`),
  CONSTRAINT `borrower_ibfk_1` FOREIGN KEY (`Branch_id`) REFERENCES `library_branch` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower`
--

LOCK TABLES `borrower` WRITE;
/*!40000 ALTER TABLE `borrower` DISABLE KEYS */;
INSERT INTO `borrower` VALUES (100,'Paree',1000),(101,'Ponnanna',1004),(102,'Nithin',1003),(103,'Sumukh',1001),(104,'Pai',1002);
/*!40000 ALTER TABLE `borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_branch`
--

DROP TABLE IF EXISTS `library_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library_branch` (
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(20) DEFAULT NULL,
  `Address` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_branch`
--

LOCK TABLES `library_branch` WRITE;
/*!40000 ALTER TABLE `library_branch` DISABLE KEYS */;
INSERT INTO `library_branch` VALUES (1000,'Mysore','KM Puram'),(1001,'Bangalore','Hebbal'),(1002,'Bangalore 2','Kengeri'),(1003,'Mysore 2','Gokulam'),(1004,'Kodagu','Gonikoppal');
/*!40000 ALTER TABLE `library_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher` (
  `name` char(20) NOT NULL,
  `address` varchar(40) DEFAULT NULL,
  `Phone` char(10) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES ('Cambridge','Mysore','345612'),('McGrew Hill','Delhi','987765'),('Oxford','Mumbai','435612'),('Pearson','Bangalore','467812'),('Penguin','Delhi','873765');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `book_copies_view`
--

/*!50001 DROP VIEW IF EXISTS `book_copies_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `book_copies_view` AS select `b`.`Book_id` AS `book_id`,`b`.`Title` AS `title`,`c`.`No_of_copies` AS `no_of_copies` from ((`book` `b` join `book_copies` `c`) join `library_branch` `l`) where ((`b`.`Book_id` = `c`.`book_id`) and (`l`.`branch_id` = `c`.`branch_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-04 22:45:05
