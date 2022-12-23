-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: ONLINE_SHOPPING
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assigned_to`
--

DROP TABLE IF EXISTS `assigned_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assigned_to` (
  `emailAddress` varchar(32) NOT NULL,
  `orderID` int NOT NULL,
  `DemailAddress` varchar(32) NOT NULL,
  `DorderID` int NOT NULL,
  `DproductID` int NOT NULL,
  `orderDate` date NOT NULL,
  KEY `emailAddress` (`emailAddress`),
  KEY `orderID` (`orderID`),
  KEY `DemailAddress` (`DemailAddress`,`DorderID`,`DproductID`,`orderDate`),
  CONSTRAINT `assigned_to_ibfk_1` FOREIGN KEY (`emailAddress`) REFERENCES `user` (`emailAddress`),
  CONSTRAINT `assigned_to_ibfk_2` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`),
  CONSTRAINT `assigned_to_ibfk_3` FOREIGN KEY (`DemailAddress`, `DorderID`, `DproductID`, `orderDate`) REFERENCES `delivery_boy` (`emailAddress`, `orderID`, `productID`, `orderDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assigned_to`
--

LOCK TABLES `assigned_to` WRITE;
/*!40000 ALTER TABLE `assigned_to` DISABLE KEYS */;
/*!40000 ALTER TABLE `assigned_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `username` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `expiryDate` date NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `card_ibfk_1` FOREIGN KEY (`username`) REFERENCES `payment_method` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES ('jay1','Jay Mupiddi','2026-11-30');
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `emailAddress` varchar(32) NOT NULL,
  `cartItems` varchar(32) NOT NULL,
  PRIMARY KEY (`emailAddress`,`cartItems`),
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`emailAddress`) REFERENCES `user` (`emailAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_on_delivery`
--

DROP TABLE IF EXISTS `cash_on_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash_on_delivery` (
  `username` varchar(32) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `cash_on_delivery_ibfk_1` FOREIGN KEY (`username`) REFERENCES `payment_method` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_on_delivery`
--

LOCK TABLES `cash_on_delivery` WRITE;
/*!40000 ALTER TABLE `cash_on_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_on_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_code`
--

DROP TABLE IF EXISTS `coupon_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_code` (
  `name` varchar(32) NOT NULL,
  `discountPercent` int NOT NULL,
  `expiryDate` date NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_code`
--

LOCK TABLES `coupon_code` WRITE;
/*!40000 ALTER TABLE `coupon_code` DISABLE KEYS */;
INSERT INTO `coupon_code` VALUES ('ash20',20,'2022-11-30'),('ash45',45,'2022-12-30'),('welcome10',10,'2022-12-25');
/*!40000 ALTER TABLE `coupon_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_boy`
--

DROP TABLE IF EXISTS `delivery_boy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_boy` (
  `emailAddress` varchar(32) NOT NULL,
  `orderID` int NOT NULL,
  `productID` int NOT NULL,
  `orderDate` date NOT NULL,
  `orderAmount` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `orderAddress` varchar(128) NOT NULL,
  `arrivalTime` date NOT NULL,
  PRIMARY KEY (`emailAddress`,`orderID`,`productID`,`orderDate`),
  KEY `orderID` (`orderID`),
  KEY `productID` (`productID`),
  CONSTRAINT `delivery_boy_ibfk_1` FOREIGN KEY (`emailAddress`) REFERENCES `user` (`emailAddress`),
  CONSTRAINT `delivery_boy_ibfk_2` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`),
  CONSTRAINT `delivery_boy_ibfk_3` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_boy`
--

LOCK TABLES `delivery_boy` WRITE;
/*!40000 ALTER TABLE `delivery_boy` DISABLE KEYS */;
INSERT INTO `delivery_boy` VALUES ('jay@gmail.com',1,3,'2022-11-25',220,'Kishore','Hyderabad','2022-12-02'),('shara@gmail.com',2,5,'2022-11-27',2000,'Lokesh','Mumbai','2022-11-15');
/*!40000 ALTER TABLE `delivery_boy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gives`
--

DROP TABLE IF EXISTS `gives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gives` (
  `emailAddress` varchar(32) NOT NULL,
  `productID` int NOT NULL,
  `reviewEmailAddress` varchar(32) NOT NULL,
  `reviewProductID` int NOT NULL,
  `ratings` decimal(10,1) NOT NULL,
  KEY `emailAddress` (`emailAddress`),
  KEY `productID` (`productID`),
  KEY `reviewEmailAddress` (`reviewEmailAddress`,`reviewProductID`,`ratings`),
  CONSTRAINT `gives_ibfk_1` FOREIGN KEY (`emailAddress`) REFERENCES `user` (`emailAddress`),
  CONSTRAINT `gives_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`),
  CONSTRAINT `gives_ibfk_3` FOREIGN KEY (`reviewEmailAddress`, `reviewProductID`, `ratings`) REFERENCES `review` (`emailAddress`, `productID`, `ratings`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gives`
--

LOCK TABLES `gives` WRITE;
/*!40000 ALTER TABLE `gives` DISABLE KEYS */;
/*!40000 ALTER TABLE `gives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderID` int NOT NULL,
  `orderStatus` varchar(32) DEFAULT NULL,
  `orderCost` int NOT NULL,
  `orderDate` date NOT NULL,
  `estimatedArrival` date NOT NULL,
  `userWhoOrdered` varchar(32) DEFAULT NULL,
  `couponUsed` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `userWhoOrdered` (`userWhoOrdered`),
  KEY `couponUsed` (`couponUsed`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userWhoOrdered`) REFERENCES `user` (`username`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`couponUsed`) REFERENCES `coupon_code` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'Shipped',220,'2022-11-25','2022-12-02','shara12','ash45'),(2,'Confirmed',2000,'2022-11-27','2022-12-05','jay1','ash45'),(3,'Delivered',20000,'2022-11-10','2022-11-25','jiya12','welcome10'),(4,'Confirmed',5000,'2022-11-27','2022-12-05','shara12',NULL),(5,'Shipping',20,'2022-11-15','2022-11-16','jiya12','ash45'),(6,'Confirmed',35,'2022-11-02','2022-11-07','shara12',NULL),(7,'Shipped',7000,'2022-11-27','2022-12-06','shara12',NULL),(8,'Shipping',1000,'2022-11-27','2022-12-30','jiya12','ash20'),(9,'Shipped',79,'2022-11-27','2022-11-29','shashwat',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `username` varchar(32) NOT NULL,
  `isDefaultMethod` varchar(32) DEFAULT NULL,
  `dateAdded` date DEFAULT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `payment_method_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES ('jay1','card','2022-11-27'),('jiya12',NULL,NULL),('shara12','upi','2022-11-22');
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `present_at`
--

DROP TABLE IF EXISTS `present_at`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `present_at` (
  `sellerID` int NOT NULL,
  `productID` int NOT NULL,
  `warehouseID` int NOT NULL,
  PRIMARY KEY (`productID`),
  KEY `sellerID` (`sellerID`),
  KEY `warehouseID` (`warehouseID`),
  CONSTRAINT `present_at_ibfk_1` FOREIGN KEY (`sellerID`) REFERENCES `seller` (`sellerID`),
  CONSTRAINT `present_at_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`),
  CONSTRAINT `present_at_ibfk_3` FOREIGN KEY (`warehouseID`) REFERENCES `warehouse` (`warehouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `present_at`
--

LOCK TABLES `present_at` WRITE;
/*!40000 ALTER TABLE `present_at` DISABLE KEYS */;
/*!40000 ALTER TABLE `present_at` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productID` int NOT NULL,
  `productName` varchar(32) NOT NULL,
  `productStock` int NOT NULL,
  `productCost` int NOT NULL,
  `productRating` decimal(10,1) NOT NULL,
  `comboPackID` int DEFAULT NULL,
  PRIMARY KEY (`productID`),
  KEY `comboPackID` (`comboPackID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`comboPackID`) REFERENCES `product` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Bottle',10,20,4.0,NULL),(2,'Bag',10,100,3.0,NULL),(3,'Phone',20,10000,5.0,NULL),(4,'Laptop',22,2340000,5.0,NULL),(5,'Stove',5,200,4.0,NULL),(6,'Pen',100,10,2.5,NULL),(7,'PinkBottle',7,500,4.0,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `productID` int NOT NULL,
  `productCategory` varchar(128) NOT NULL,
  PRIMARY KEY (`productID`,`productCategory`),
  CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'Daily Use'),(2,'Daily Use'),(3,'Electronics'),(4,'Electronics'),(4,'KitchenWare');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_at_warehouse`
--

DROP TABLE IF EXISTS `products_at_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_at_warehouse` (
  `warehouseID` int NOT NULL,
  `productName` varchar(32) NOT NULL,
  PRIMARY KEY (`warehouseID`,`productName`),
  CONSTRAINT `products_at_warehouse_ibfk_1` FOREIGN KEY (`warehouseID`) REFERENCES `warehouse` (`warehouseID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_at_warehouse`
--

LOCK TABLES `products_at_warehouse` WRITE;
/*!40000 ALTER TABLE `products_at_warehouse` DISABLE KEYS */;
INSERT INTO `products_at_warehouse` VALUES (1,'Bag'),(1,'Bottle'),(1,'Stove'),(2,'Laptop'),(2,'Phone');
/*!40000 ALTER TABLE `products_at_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_ordered`
--

DROP TABLE IF EXISTS `products_ordered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_ordered` (
  `orderID` int NOT NULL,
  `productsOrdered` varchar(32) NOT NULL,
  PRIMARY KEY (`orderID`,`productsOrdered`),
  CONSTRAINT `products_ordered_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_ordered`
--

LOCK TABLES `products_ordered` WRITE;
/*!40000 ALTER TABLE `products_ordered` DISABLE KEYS */;
INSERT INTO `products_ordered` VALUES (1,'Phone'),(2,'Shirt'),(2,'Stove'),(3,'Bottle');
/*!40000 ALTER TABLE `products_ordered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_owned`
--

DROP TABLE IF EXISTS `products_owned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_owned` (
  `sellerID` int NOT NULL,
  `productOwned` varchar(32) NOT NULL,
  PRIMARY KEY (`sellerID`,`productOwned`),
  CONSTRAINT `products_owned_ibfk_1` FOREIGN KEY (`sellerID`) REFERENCES `seller` (`sellerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_owned`
--

LOCK TABLES `products_owned` WRITE;
/*!40000 ALTER TABLE `products_owned` DISABLE KEYS */;
INSERT INTO `products_owned` VALUES (1,'Laptop'),(1,'Phone'),(2,'Bag'),(2,'Bottle'),(3,'Stove');
/*!40000 ALTER TABLE `products_owned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returns`
--

DROP TABLE IF EXISTS `returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returns` (
  `orderID` int NOT NULL,
  `productsReturned` varchar(32) NOT NULL,
  `returnStatus` varchar(32) NOT NULL,
  `address` varchar(128) NOT NULL,
  `returnDate` date NOT NULL,
  PRIMARY KEY (`orderID`,`productsReturned`),
  CONSTRAINT `returns_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returns`
--

LOCK TABLES `returns` WRITE;
/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
INSERT INTO `returns` VALUES (1,'bottle','Confirmed','hyd','2022-12-02');
/*!40000 ALTER TABLE `returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `emailAddress` varchar(32) NOT NULL,
  `productID` int NOT NULL,
  `ratings` decimal(10,1) NOT NULL,
  PRIMARY KEY (`emailAddress`,`productID`,`ratings`),
  KEY `productID` (`productID`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`emailAddress`) REFERENCES `user` (`emailAddress`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_of_product`
--

DROP TABLE IF EXISTS `review_of_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_of_product` (
  `emailAddress` varchar(32) NOT NULL,
  `productID` int NOT NULL,
  `ratings` decimal(10,1) NOT NULL,
  `reviewOfProduct` varchar(32) NOT NULL,
  PRIMARY KEY (`emailAddress`,`productID`,`ratings`,`reviewOfProduct`),
  CONSTRAINT `review_of_product_ibfk_1` FOREIGN KEY (`emailAddress`, `productID`, `ratings`) REFERENCES `review` (`emailAddress`, `productID`, `ratings`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_of_product`
--

LOCK TABLES `review_of_product` WRITE;
/*!40000 ALTER TABLE `review_of_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_of_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `sellerID` int NOT NULL,
  `sellerName` varchar(32) NOT NULL,
  `GSTNO` int NOT NULL,
  PRIMARY KEY (`sellerID`),
  UNIQUE KEY `GSTNO` (`GSTNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Radhikesh',111),(2,'Balaji',121),(3,'Rishikesh',200),(4,'Arun',125);
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upi`
--

DROP TABLE IF EXISTS `upi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upi` (
  `username` varchar(32) NOT NULL,
  `upiID` int NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `upi_ibfk_1` FOREIGN KEY (`username`) REFERENCES `payment_method` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upi`
--

LOCK TABLES `upi` WRITE;
/*!40000 ALTER TABLE `upi` DISABLE KEYS */;
INSERT INTO `upi` VALUES ('shara12',101);
/*!40000 ALTER TABLE `upi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `emailAddress` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `phoneNumber` int DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`emailAddress`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phoneNumber` (`phoneNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('jay@gmail.com','jay1',5678,'Hyderabad'),('jiya@gmail.com','jiya12',1212,'Hyderabad'),('shara@gmail.com','shara12',3004,'Mumbai'),('shashwat@gmail.com','shashwat',565,'Hyderabad');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uses_on`
--

DROP TABLE IF EXISTS `uses_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uses_on` (
  `emailAddress` varchar(32) NOT NULL,
  `couponName` varchar(32) NOT NULL,
  `orderID` int NOT NULL,
  PRIMARY KEY (`emailAddress`,`couponName`,`orderID`),
  KEY `couponName` (`couponName`),
  KEY `orderID` (`orderID`),
  CONSTRAINT `uses_on_ibfk_1` FOREIGN KEY (`emailAddress`) REFERENCES `user` (`emailAddress`),
  CONSTRAINT `uses_on_ibfk_2` FOREIGN KEY (`couponName`) REFERENCES `coupon_code` (`name`),
  CONSTRAINT `uses_on_ibfk_3` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uses_on`
--

LOCK TABLES `uses_on` WRITE;
/*!40000 ALTER TABLE `uses_on` DISABLE KEYS */;
/*!40000 ALTER TABLE `uses_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `warehouseID` int NOT NULL,
  `securityGuard` varchar(32) NOT NULL,
  `location` varchar(32) NOT NULL,
  PRIMARY KEY (`warehouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'Rajesh','Hyderabad'),(2,'Kavita','Mumbai');
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `emailAddress` varchar(32) NOT NULL,
  `wishList` varchar(32) NOT NULL,
  PRIMARY KEY (`emailAddress`,`wishList`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`emailAddress`) REFERENCES `user` (`emailAddress`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES ('jay@gmail.com','Chair');
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-27 17:48:21
