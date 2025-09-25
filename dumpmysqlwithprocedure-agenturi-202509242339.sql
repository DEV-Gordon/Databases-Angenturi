-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 172.29.74.134    Database: agenturi
-- ------------------------------------------------------
-- Server version	8.4.6

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
-- Table structure for table `Accommodation`
--

DROP TABLE IF EXISTS `Accommodation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accommodation` (
  `id_accommodation` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `id_destination` int DEFAULT NULL,
  PRIMARY KEY (`id_accommodation`),
  KEY `id_destination` (`id_destination`),
  CONSTRAINT `Accommodation_ibfk_1` FOREIGN KEY (`id_destination`) REFERENCES `Destination` (`id_destination`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accommodation`
--

LOCK TABLES `Accommodation` WRITE;
/*!40000 ALTER TABLE `Accommodation` DISABLE KEYS */;
INSERT INTO `Accommodation` VALUES (1,'Hotel Sol Caribe','Hotel','Av. Playa 123, Cartagena',1),(2,'Eco Lodge Andino','Lodge','Calle Verde 45, Medellín',2),(3,'Posada Oasis','Hostal','Carretera 7, Ica',3),(4,'Amazon Lodge','Lodge','Km 12 Selva, Manaos',4),(5,'Nevados Resort','Resort','Av. Cordillera 77, Santiago',5),(6,'Hotel Galápagos Explorer','Hotel','Isla Santa Cruz, Galápagos',6);
/*!40000 ALTER TABLE `Accommodation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Activity`
--

DROP TABLE IF EXISTS `Activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Activity` (
  `id_activity` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `extra_cost` decimal(10,2) DEFAULT '0.00',
  `id_itinerary` int DEFAULT NULL,
  PRIMARY KEY (`id_activity`),
  KEY `id_itinerary` (`id_itinerary`),
  CONSTRAINT `Activity_ibfk_1` FOREIGN KEY (`id_itinerary`) REFERENCES `Itinerary` (`id_itinerary`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Activity`
--

LOCK TABLES `Activity` WRITE;
/*!40000 ALTER TABLE `Activity` DISABLE KEYS */;
INSERT INTO `Activity` VALUES (1,'Tour en lancha','Paseo por las islas cercanas',50.00,2),(2,'Snorkel','Exploración de arrecifes coralinos',80.00,2),(3,'Escalada','Escalada guiada en roca natural',120.00,3),(4,'Tirolesa','Recorrido en canopy sobre el valle',90.00,4),(5,'Sandboarding','Deslizarse en tabla por las dunas',40.00,5),(6,'Kayak en el río','Recorrido guiado por aguas amazónicas',100.00,7),(7,'Avistamiento de aves','Exploración con guía ornitólogo',60.00,8),(8,'Clases de esquí','Lecciones para principiantes',150.00,9),(9,'Montañismo','Ascenso a cumbre nevada',200.00,10),(10,'Buceo en Galápagos','Exploración submarina con instructor',300.00,12);
/*!40000 ALTER TABLE `Activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Booking` (
  `id_booking` int NOT NULL AUTO_INCREMENT,
  `booking_date` date NOT NULL,
  `status` enum('pending','paid','canceled') DEFAULT 'pending',
  `id_customer` int DEFAULT NULL,
  `id_plan` int DEFAULT NULL,
  PRIMARY KEY (`id_booking`),
  KEY `id_customer` (`id_customer`),
  KEY `id_plan` (`id_plan`),
  CONSTRAINT `Booking_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `Customer` (`id_customer`),
  CONSTRAINT `Booking_ibfk_2` FOREIGN KEY (`id_plan`) REFERENCES `Plan` (`id_plan`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
INSERT INTO `Booking` VALUES (1,'2025-01-15','paid',1,1),(2,'2025-02-10','pending',2,2),(3,'2025-03-05','canceled',3,3),(4,'2025-04-01','paid',4,4),(5,'2025-04-10','pending',5,5),(6,'2025-05-02','paid',6,6),(7,'2025-05-15','pending',7,1),(8,'2025-06-20','canceled',8,2);
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BookingActivity`
--

DROP TABLE IF EXISTS `BookingActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BookingActivity` (
  `id_booking` int NOT NULL,
  `id_activity` int NOT NULL,
  PRIMARY KEY (`id_booking`,`id_activity`),
  KEY `id_activity` (`id_activity`),
  CONSTRAINT `BookingActivity_ibfk_1` FOREIGN KEY (`id_booking`) REFERENCES `Booking` (`id_booking`),
  CONSTRAINT `BookingActivity_ibfk_2` FOREIGN KEY (`id_activity`) REFERENCES `Activity` (`id_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BookingActivity`
--

LOCK TABLES `BookingActivity` WRITE;
/*!40000 ALTER TABLE `BookingActivity` DISABLE KEYS */;
INSERT INTO `BookingActivity` VALUES (1,1),(1,2),(2,3);
/*!40000 ALTER TABLE `BookingActivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `id_customer` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(120) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_customer`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Carlos','Zarate','carlos@example.com','+573001112233'),(2,'Ana','Martínez','ana@example.com','+573224445566'),(3,'Luis','Fernández','luis@example.com','+573339998877'),(4,'Sofía','González','sofia@example.com','+573228889999'),(5,'Miguel','Ramírez','miguel@example.com','+573223334455'),(6,'Valentina','Pérez','valentina@example.com','+573334446677'),(7,'Andrés','Torres','andres@example.com','+573335551122'),(8,'Laura','Jiménez','laura@example.com','+573336669988');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Destination`
--

DROP TABLE IF EXISTS `Destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Destination` (
  `id_destination` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_destination`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Destination`
--

LOCK TABLES `Destination` WRITE;
/*!40000 ALTER TABLE `Destination` DISABLE KEYS */;
INSERT INTO `Destination` VALUES (1,'Playa Blanca','Colombia','Cartagena'),(2,'Montañas Azules','Colombia','Medellín'),(3,'Desierto Dorado','Perú','Ica'),(4,'Selva Amazónica','Brasil','Manaos'),(5,'Nevados Andinos','Chile','Santiago'),(6,'Islas Galápagos','Ecuador','Puerto Ayora');
/*!40000 ALTER TABLE `Destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Guide`
--

DROP TABLE IF EXISTS `Guide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Guide` (
  `id_guide` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `id_plan` int DEFAULT NULL,
  PRIMARY KEY (`id_guide`),
  KEY `id_plan` (`id_plan`),
  CONSTRAINT `Guide_ibfk_1` FOREIGN KEY (`id_plan`) REFERENCES `Plan` (`id_plan`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Guide`
--

LOCK TABLES `Guide` WRITE;
/*!40000 ALTER TABLE `Guide` DISABLE KEYS */;
INSERT INTO `Guide` VALUES (1,'María Gómez','+573000111222','Español',1),(2,'John Doe','+573001234567','Inglés',2),(3,'Pedro Castillo','+51987123456','Español',3),(4,'Ricardo Silva','+55987123456','Portugués',4),(5,'Emily Brown','+56987123456','Inglés',5),(6,'Daniela Cruz','+593998812345','Español',6);
/*!40000 ALTER TABLE `Guide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Itinerary`
--

DROP TABLE IF EXISTS `Itinerary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Itinerary` (
  `id_itinerary` int NOT NULL AUTO_INCREMENT,
  `day` int NOT NULL,
  `description` text,
  `id_plan` int DEFAULT NULL,
  PRIMARY KEY (`id_itinerary`),
  KEY `id_plan` (`id_plan`),
  CONSTRAINT `Itinerary_ibfk_1` FOREIGN KEY (`id_plan`) REFERENCES `Plan` (`id_plan`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Itinerary`
--

LOCK TABLES `Itinerary` WRITE;
/*!40000 ALTER TABLE `Itinerary` DISABLE KEYS */;
INSERT INTO `Itinerary` VALUES (1,1,'Llegada al hotel y tour por la ciudad',1),(2,2,'Día de playa y actividades acuáticas',1),(3,1,'Caminata ecológica por las montañas',2),(4,2,'Deportes extremos y visita cultural',2),(5,1,'Tour en buggy por las dunas',3),(6,2,'Cena típica en restaurante local',3),(7,1,'Ingreso a la reserva natural y caminata inicial',4),(8,2,'Safari nocturno en la selva',4),(9,1,'Llegada al centro de esquí y clase introductoria',5),(10,2,'Excursión a la montaña y fogata',5),(11,1,'Tour en barco por las islas',6),(12,2,'Snorkel con lobos marinos',6);
/*!40000 ALTER TABLE `Itinerary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `id_payment` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `method` varchar(50) DEFAULT NULL,
  `id_booking` int DEFAULT NULL,
  PRIMARY KEY (`id_payment`),
  KEY `id_booking` (`id_booking`),
  CONSTRAINT `Payment_ibfk_1` FOREIGN KEY (`id_booking`) REFERENCES `Booking` (`id_booking`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (1,450.00,'2025-01-16','Tarjeta de Crédito',1),(2,750.00,'2025-04-02','Efectivo',4),(3,1200.00,'2025-05-03','Transferencia',6);
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plan`
--

DROP TABLE IF EXISTS `Plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Plan` (
  `id_plan` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `base_price` decimal(10,2) NOT NULL,
  `id_destination` int DEFAULT NULL,
  PRIMARY KEY (`id_plan`),
  KEY `id_destination` (`id_destination`),
  CONSTRAINT `Plan_ibfk_1` FOREIGN KEY (`id_destination`) REFERENCES `Destination` (`id_destination`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plan`
--

LOCK TABLES `Plan` WRITE;
/*!40000 ALTER TABLE `Plan` DISABLE KEYS */;
INSERT INTO `Plan` VALUES (1,'Plan Caribeño','Disfruta del sol y el mar en Cartagena',450.00,1),(2,'Plan Aventura Andina','Explora montañas y naturaleza en Medellín',600.00,2),(3,'Plan Oasis','Experiencia única en el desierto de Ica',350.00,3),(4,'Expedición Amazónica','Tour por la selva con guía local',750.00,4),(5,'Aventura en los Nevados','Esquí y montañismo en los Andes',950.00,5),(6,'Exploración Galápagos','Crucero y avistamiento de fauna marina',1200.00,6);
/*!40000 ALTER TABLE `Plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transport`
--

DROP TABLE IF EXISTS `Transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transport` (
  `id_transport` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `id_destination` int DEFAULT NULL,
  PRIMARY KEY (`id_transport`),
  KEY `id_destination` (`id_destination`),
  CONSTRAINT `Transport_ibfk_1` FOREIGN KEY (`id_destination`) REFERENCES `Destination` (`id_destination`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transport`
--

LOCK TABLES `Transport` WRITE;
/*!40000 ALTER TABLE `Transport` DISABLE KEYS */;
INSERT INTO `Transport` VALUES (1,'Bus turístico','Viajes Caribe S.A.',1),(2,'Jeep 4x4','Aventura Andina Ltda.',2),(3,'Buggy','Desert Tours Perú',3),(4,'Lancha rápida','Amazon Tours',4),(5,'Teleférico','Nevados Sky',5),(6,'Crucero','Galápagos Cruises',6);
/*!40000 ALTER TABLE `Transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'agenturi'
--
/*!50003 DROP PROCEDURE IF EXISTS `ActividadesReservadas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `ActividadesReservadas`()
BEGIN

    SELECT 

        c.first_name,

        c.last_name,

        p.name AS plan_name,

        a.name AS activity_name,

        a.extra_cost

    FROM Customer c

    JOIN Booking b ON c.id_customer = b.id_customer

    JOIN BookingActivity ba ON b.id_booking = ba.id_booking

    JOIN Activity a ON ba.id_activity = a.id_activity

    JOIN Plan p ON b.id_plan = p.id_plan;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ClientesEmpiezanA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `ClientesEmpiezanA`()
BEGIN

    SELECT * 

    FROM Customer

    WHERE first_name LIKE 'A%';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ClientesPagoMayorPromedio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `ClientesPagoMayorPromedio`()
BEGIN

    SELECT 

        c.id_customer,

        c.first_name,

        c.last_name,

        SUM(pay.amount) AS total_paid

    FROM Customer c

    JOIN Booking b ON c.id_customer = b.id_customer

    JOIN Payment pay ON b.id_booking = pay.id_booking

    GROUP BY c.id_customer, c.first_name, c.last_name

    HAVING SUM(pay.amount) > (

        SELECT AVG(amount) FROM Payment

    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DestinosConCO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `DestinosConCO`()
BEGIN

    SELECT * 

    FROM Destination

    WHERE country LIKE '%co%';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pagos2025` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Pagos2025`()
BEGIN

    SELECT 

        id_payment, 

        amount, 

        payment_date, 

        method

    FROM Payment

    WHERE payment_date BETWEEN '2025-01-01' AND '2025-12-31';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PlanesID2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `PlanesID2`()
BEGIN

    SELECT * 

    FROM Plan

    WHERE id_plan = 2;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PlanesPrecioMayorPromedio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `PlanesPrecioMayorPromedio`()
BEGIN

    SELECT 

        id_plan,

        name AS plan_name,

        base_price

    FROM Plan

    WHERE base_price > (

        SELECT AVG(base_price) FROM Plan

    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PlanesRango5001500` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `PlanesRango5001500`()
BEGIN

    SELECT 

        id_plan, 

        name, 

        base_price

    FROM Plan

    WHERE base_price BETWEEN 500 AND 1500;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReservasPagadas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `ReservasPagadas`()
BEGIN

    SELECT * 

    FROM Booking

    WHERE status = 'paid';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TodasReservasNombreClientePlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `TodasReservasNombreClientePlan`()
BEGIN

    SELECT

        b.id_booking,

        c.first_name,

        c.last_name,

        p.name AS plan_name,

        d.name AS destination_name,

        b.status

    FROM Booking b

    JOIN Customer c ON b.id_customer = c.id_customer

    JOIN Plan p ON b.id_plan = p.id_plan

    JOIN Destination d ON p.id_destination = d.id_destination;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-24 23:39:08
