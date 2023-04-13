-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: little_lemon_capstone
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Bookings`
--

DROP TABLE IF EXISTS `Bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bookings` (
  `BookingID` int NOT NULL,
  `Date` datetime NOT NULL,
  `TableNumber` int NOT NULL,
  PRIMARY KEY (`BookingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bookings`
--

LOCK TABLES `Bookings` WRITE;
/*!40000 ALTER TABLE `Bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerDetails`
--

DROP TABLE IF EXISTS `CustomerDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomerDetails` (
  `CustomerID` int NOT NULL,
  `CustomerName` varchar(255) NOT NULL,
  `ContactDetails` int NOT NULL,
  `CustomerDetailscol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerDetails`
--

LOCK TABLES `CustomerDetails` WRITE;
/*!40000 ALTER TABLE `CustomerDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomerDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menu`
--

DROP TABLE IF EXISTS `Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Menu` (
  `MenuID` int NOT NULL,
  `Cuisine` varchar(255) NOT NULL,
  `Starters` varchar(255) NOT NULL,
  `Courses` varchar(255) NOT NULL,
  `Drinks` varchar(255) NOT NULL,
  `Desserts` varchar(255) NOT NULL,
  PRIMARY KEY (`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderDeliveryStatus`
--

DROP TABLE IF EXISTS `OrderDeliveryStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderDeliveryStatus` (
  `OrderStatusID` int NOT NULL,
  `DeliveryDate` datetime NOT NULL,
  `Status` varchar(255) NOT NULL,
  PRIMARY KEY (`OrderStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDeliveryStatus`
--

LOCK TABLES `OrderDeliveryStatus` WRITE;
/*!40000 ALTER TABLE `OrderDeliveryStatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderDeliveryStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `OrderID` int NOT NULL,
  `OrderDate` datetime NOT NULL,
  `Quantity` decimal(6,2) unsigned NOT NULL,
  `TotalCost` decimal(6,2) NOT NULL,
  `BookingID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `OrderStatusID` int NOT NULL,
  `MenuID` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `booking_id_fk_idx` (`BookingID`),
  KEY `customer_id_fk_idx` (`CustomerID`),
  KEY `menu_id_fk_idx` (`MenuID`),
  KEY `order_status_id_fk_idx` (`OrderStatusID`),
  CONSTRAINT `booking_id_fk` FOREIGN KEY (`BookingID`) REFERENCES `Bookings` (`BookingID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_id_fk` FOREIGN KEY (`CustomerID`) REFERENCES `CustomerDetails` (`CustomerID`),
  CONSTRAINT `menu_id_fk` FOREIGN KEY (`MenuID`) REFERENCES `Menu` (`MenuID`),
  CONSTRAINT `order_status_id_fk` FOREIGN KEY (`OrderStatusID`) REFERENCES `OrderDeliveryStatus` (`OrderStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StaffInformation`
--

DROP TABLE IF EXISTS `StaffInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StaffInformation` (
  `StaffID` int NOT NULL,
  `Role` varchar(45) NOT NULL,
  `Salary` decimal(6,2) NOT NULL,
  `CustomerID` int NOT NULL,
  PRIMARY KEY (`StaffID`),
  KEY `customer_id_fk_idx` (`CustomerID`),
  CONSTRAINT `customerid_fk` FOREIGN KEY (`CustomerID`) REFERENCES `CustomerDetails` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StaffInformation`
--

LOCK TABLES `StaffInformation` WRITE;
/*!40000 ALTER TABLE `StaffInformation` DISABLE KEYS */;
/*!40000 ALTER TABLE `StaffInformation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-12 21:38:55
