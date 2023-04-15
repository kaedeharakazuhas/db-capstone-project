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
  `CustomerID` int NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `customer_fk_idx` (`CustomerID`),
  CONSTRAINT `customerids_fk` FOREIGN KEY (`CustomerID`) REFERENCES `CustomerDetails` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bookings`
--

LOCK TABLES `Bookings` WRITE;
/*!40000 ALTER TABLE `Bookings` DISABLE KEYS */;
INSERT INTO `Bookings` VALUES (1,'2023-01-02 12:00:00',1,1),(2,'2023-01-02 13:00:00',2,2),(3,'2023-01-02 14:00:00',3,3),(4,'2023-01-02 15:00:00',4,4),(5,'2023-01-02 16:00:00',5,5),(6,'2023-01-02 17:00:00',6,6),(7,'2023-01-02 18:00:00',7,7),(8,'2023-01-02 19:00:00',8,8),(9,'2023-01-02 20:00:00',9,9),(10,'2023-01-02 21:00:00',10,10);
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
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerDetails`
--

LOCK TABLES `CustomerDetails` WRITE;
/*!40000 ALTER TABLE `CustomerDetails` DISABLE KEYS */;
INSERT INTO `CustomerDetails` VALUES (1,'Amy White',1),(2,'Joakim Iversen',2),(3,'Vanessa McCarthy',3),(4,'Marcos Romero',4),(5,'Hiroki Yamane',5),(6,'Anna Iversen',6),(7,'Daisy Lee',7),(8,'Logan Smith',8),(9,'Jonathan Conner',9),(10,'Jay Brown',0);
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
  `MenuName` varchar(255) NOT NULL,
  `MenuItemsID` int NOT NULL,
  PRIMARY KEY (`MenuID`),
  KEY `menu_item_id_fk_idx` (`MenuItemsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
INSERT INTO `Menu` VALUES (1,'Greek','MenuOne',1),(2,'Greek','MenuTwo',2),(3,'Italian','MenuThree',3),(4,'Italian','MenuFour',4),(5,'Turkish','MenuFive',5);
/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MenuItems`
--

DROP TABLE IF EXISTS `MenuItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MenuItems` (
  `MenuItemsID` int NOT NULL,
  `CourseName` varchar(255) DEFAULT NULL,
  `StarterName` varchar(255) DEFAULT NULL,
  `DrinkName` varchar(255) DEFAULT NULL,
  `DessertName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MenuItemsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuItems`
--

LOCK TABLES `MenuItems` WRITE;
/*!40000 ALTER TABLE `MenuItems` DISABLE KEYS */;
INSERT INTO `MenuItems` VALUES (1,'Grilled Meat','Olives','Water','Cake'),(2,'Fresh Fish','Flatbread','Cider','Mousse'),(3,'Pizza','Salas','Soda','Cupcake'),(4,'Pasta','Fruit','Tea','Fudge'),(5,'Meatballs','Hummus','Wine','Ice Cream');
/*!40000 ALTER TABLE `MenuItems` ENABLE KEYS */;
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
INSERT INTO `OrderDeliveryStatus` VALUES (1,'2023-01-02 13:00:00','Delivered'),(2,'2023-01-02 14:00:00','Delivered'),(3,'2023-01-02 15:00:00','Delivered'),(4,'2023-01-02 16:00:00','Out for Delivery'),(5,'2023-01-02 17:00:00','Out for Delivery'),(6,'2023-01-02 18:00:00','Out for Delivery'),(7,'2023-01-02 19:00:00','Order Placed'),(8,'2023-01-02 20:00:00','Order Placed'),(9,'2023-01-02 21:00:00','Order Placed'),(10,'2023-01-02 22:00:00','Order Placed');
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
-- Temporary view structure for view `ordersview`
--

DROP TABLE IF EXISTS `ordersview`;
/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersview` AS SELECT 
 1 AS `OrderID`,
 1 AS `Quantity`,
 1 AS `TotalCost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `StaffInformation`
--

DROP TABLE IF EXISTS `StaffInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StaffInformation` (
  `StaffID` int NOT NULL,
  `Role` varchar(45) NOT NULL,
  `Salary` decimal(8,2) NOT NULL,
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
INSERT INTO `StaffInformation` VALUES (1,'Manager',100000.00,1),(2,'Assistant Manager',90000.00,2),(3,'Supervisor',80000.00,3),(4,'Head Chef',75000.00,4),(5,'Assistant Chef',70000.00,5),(6,'Assistant Chef',70000.00,6),(7,'Head Waiter',65000.00,7),(8,'Waiter',60000.00,8),(9,'Receptionist',55000.00,9),(10,'Dishwasher',55000.00,10);
/*!40000 ALTER TABLE `StaffInformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `ordersview`
--

/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin5`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersview` AS select `orders`.`OrderID` AS `OrderID`,`orders`.`Quantity` AS `Quantity`,`orders`.`TotalCost` AS `TotalCost` from `orders` where (`orders`.`Quantity` > 2) */;
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

-- Dump completed on 2023-04-15 13:37:16
