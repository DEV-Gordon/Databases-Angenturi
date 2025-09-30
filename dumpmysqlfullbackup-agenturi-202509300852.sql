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
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accommodation`
--

LOCK TABLES `Accommodation` WRITE;
/*!40000 ALTER TABLE `Accommodation` DISABLE KEYS */;
INSERT INTO `Accommodation` VALUES (1,'Hotel Sol Caribe','Hotel','Av. Playa 123, Cartagena',1),(2,'Eco Lodge Andino','Lodge','Calle Verde 45, Medellín',2),(3,'Posada Oasis','Hostal','Carretera 7, Ica',3),(4,'Amazon Lodge','Lodge','Km 12 Selva, Manaos',4),(5,'Nevados Resort','Resort','Av. Cordillera 77, Santiago',5),(6,'Hotel Galápagos Explorer','Hotel','Isla Santa Cruz, Galápagos',6),(7,'Le Bristol Paris','Hotel','112 Rue du Faubourg Saint-Honoré',1),(8,'Banyan Tree Phuket','Resort','33 Moo 4, Srisoonthorn Road',2),(9,'The St. Regis Rome','Hotel','Via Vittorio Emanuele Orlando, 3',3),(10,'Grand Hotel Zermatterhof','Hotel','Bahnhofstrasse 55',4),(11,'Burj Al Arab Jumeirah','Hotel','Jumeirah Street',5),(12,'Olissippo Oriente','Hotel','Av. Dom João II',6),(13,'The Ritz-Carlton, Kyoto','Ryokan','Kamogawa, Nakagyo Ward',7),(14,'Opus XVI','Hotel','Vågsallmenningen 1A',8),(15,'Fontainebleau Miami Beach','Resort','4441 Collins Ave',9),(16,'The Fullerton Hotel Sydney','Hotel','1 Martin Place',10),(17,'Palacio del Inka','Hotel','Plaza Limacpampa',11),(18,'Gili Lankanfushi Maldives','Resort','Lankanfushi Island',12),(19,'The Savoy','Hotel','Strand, London',13),(20,'Hotel Dubrovnik Palace','Hotel','Masarykov put 20',14),(21,'The Retreat at Blue Lagoon','Hotel','Norðurljósavegur 9',15),(22,'Alvear Palace Hotel','Hotel','Av. Alvear 1891',16),(23,'Four Seasons Safari Lodge','Lodge','Central Serengeti',17),(24,'Hotel Arts Barcelona','Hotel','Carrer de la Marina, 19-21',18),(25,'Hotel Adlon Kempinski','Hotel','Unter den Linden 77',19),(26,'The Oberoi Rajvilas','Resort','Goner Rd, Jaipur',20),(27,'Tabacon Thermal Resort','Resort','Northwest of the La Fortuna Park',21),(28,'The Balmoral','Hotel','1 Princes St, Edinburgh',22),(29,'Secrets St. James Montego Bay','Resort','Lot 59A, Freeport',23),(30,'The Ritz-Carlton, Moscow','Hotel','Tverskaya St, 3',24),(31,'Peninsula Beijing','Hotel','8 Jinyu Hutong',25),(32,'Four Seasons Resort Sharm El Sheikh','Resort','1 Four Seasons Boulevard',26),(33,'Pera Palace Hotel','Hotel','Meşrutiyet Cd. No:52',27),(34,'Explora Patagonia','Lodge','Torres del Paine National Park',28),(35,'Royal Mansour Marrakech','Riad','Rue Abou Abbas El Sebti',29),(36,'Fairmont Banff Springs','Hotel','405 Spray Ave',30),(37,'Hotel Saint-Paul','Hotel','Rua Saint-Paul, 123',31),(38,'Astra Suites','Hotel','Imerovigli, Santorini',32),(39,'The Rees Hotel','Apartment','377 Frankton Rd',33),(40,'Sofitel Legend Metropole Hanoi','Hotel','15 Ngo Quyen Street',34),(41,'The Shelbourne','Hotel','27 St Stephen’s Green',35),(42,'Four Seasons Hotel Prague','Hotel','Veleslavínova 1098/2a',36),(43,'Hotel Telegraaf','Hotel','Vene 9, Tallinn',37),(44,'The Singular Santiago','Hotel','Merced 294',38),(45,'Four Seasons Resort Maui','Resort','3900 Wailea Alanui Dr',39),(46,'The Mövenpick Resort Petra','Hotel','Main Entrance to Petra',40),(47,'Sarova Whitesands Beach Resort','Resort','Malindi Road',41),(48,'Hotel Sighisoara','Hotel','Strada Consiliul Europei 1',42),(49,'Arctic Light Hotel','Hotel','Valtakatu 18',43),(50,'Gran Hotel Manzana Kempinski La Habana','Hotel','San Rafael, entre Zulueta y Monserrate',44),(51,'Hotel Asia Samarkand','Hotel','Universitetsky Boulevard, 1',45),(52,'The Silo Hotel','Hotel','V&A Waterfront',46),(53,'The Shilla Seoul','Hotel','249 Dongho-ro, Jung-gu',47),(54,'Hotel Goldener Hirsch','Hotel','Getreidegasse 37',48),(55,'Belmond Miraflores Park','Hotel','Av. Malecón de la Reserva 1035',49),(56,'Le Blanc Spa Resort','Resort','Blvd. Kukulcan Km. 10',50),(57,'Enchantment Resort','Resort','525 Boynton Canyon Rd, Sedona',51),(58,'Hotel Sacher Wien','Hotel','Philharmoniker Str. 4',52),(59,'Hotel Amigo','Hotel','Rue de l Amigo 1-3',53),(60,'Conservatorium Hotel','Hotel','Van Baerlestraat 27',54),(61,'Fairmont Royal Palm Marrakech','Resort','Km 12 Route de Targa',55),(62,'Hotel Yak and Yeti','Hotel','Durbar Marg, Kathmandu',56),(63,'Four Seasons Resort Bali at Sayan','Resort','Sayan, Ubud',57),(64,'Hotel Bayerischer Hof','Hotel','Promenadepl. 2-6',58),(65,'Sandy Lane','Resort','Sandy Lane, St. James',59),(66,'InterContinental Bordeaux','Hotel','2-5 Place de la Comédie',60),(67,'Elysium Hotel Paphos','Hotel','Queen Verenikis 8, Paphos',61),(68,'The Chedi Muscat','Resort','133 18th November Street',62),(69,'The Saxon Hotel','Hotel','36 Saxon Rd, Sandhurst',63),(70,'Hotel Arctic','Hotel','Qaannat 1, 3952 Ilulissat',64),(71,'Sails in the Desert','Hotel','Yulara Dr, Yulara',65),(72,'The Duke of Marlborough Hotel','Hotel','35 The Strand, Russell',66),(73,'Hotel Amazonia','Lodge','Vía a Tena Km 2.5',67),(74,'Hotel Alfonso XIII','Hotel','Calle San Fernando, 2',68),(75,'Beit Wakil','Hotel','Old City, Damascus',69),(76,'Grand Hotel Tremezzo','Hotel','Via Regina, 8, Tremezzo',70),(77,'Abu Camp','Lodge','Okavango Delta',71),(78,'The Lord Nelson Hotel & Suites','Hotel','1515 South Park Street',72),(79,'Mandapa, a Ritz-Carlton Reserve','Resort','Jalan Kedewatan, Ubud',73),(80,'Marina Bay Sands','Hotel','10 Bayfront Ave',74),(81,'Nimb Hotel','Hotel','Bernstorffsgade 5',75),(82,'JW Marriott Hotel Ankara','Hotel','Kizilirmak Mahallesi',76),(83,'Museum Hotel Cappadocia','Hotel','Tekeli Mah. No.1',77),(84,'Cliff House at Bald Head','Resort','591 Shore Rd, Ogunquit',78),(85,'Belmond Copacabana Palace','Hotel','Av. Atlântica, 1702',79),(86,'Sheraton Addis','Hotel','Taitu St, Addis Ababa',80),(87,'Pullman Cairns International','Hotel','17 Abbott St, Cairns',81),(88,'Mandarin Oriental, Tokyo','Hotel','2-1-1 Nihonbashi Muromachi',82),(89,'Hotel Teleferic Grand','Hotel','Strada Poiana Soarelui 1',83),(90,'The St. Regis Kuala Lumpur','Hotel','Jalan Stesen Sentral 2',84),(91,'Karibe Hotel','Hotel','Juvenat 7, Pétion-Ville',85),(92,'The Xara Palace Relais & Chateaux','Hotel','Misrah Il Kunsill, Mdina',86),(93,'Hotel Regente','Hotel','Avenida Marechal Hermes, 715',87),(94,'The King David Hotel','Hotel','King David St 23',88),(95,'Hyundai Hotel Vladivostok','Hotel','Semyonovskaya St, 29',89),(96,'Four Seasons Hotel Hangzhou at West Lake','Hotel','Lingyin Rd 5',90),(97,'Sofitel Legend Santa Clara Cartagena','Hotel','Barrio San Diego',91),(98,'Hotel Dukes’ Palace Brugge','Hotel','Prinsesstraat 6',92),(99,'Bougainville Bay Hotel','Hotel','Rruga Butrinti',93),(100,'The Lalit Temple View Khajuraho','Hotel','Opp. Civil Airport',94),(101,'Bwindi Lodge','Lodge','Bwindi Impenetrable NP',95),(102,'Four Seasons Hotel Baku','Hotel','Neftchilar Ave',96),(103,'The Moluccan Explorer','Liveaboard','Ambon Bay',97),(104,'The Fairmont Pittsburgh','Hotel','510 Market St',98),(105,'The Thief','Hotel','Landgangen 1',99),(106,'The Imperial New Delhi','Hotel','Janpath, Connaught Place',100);
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
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Activity`
--

LOCK TABLES `Activity` WRITE;
/*!40000 ALTER TABLE `Activity` DISABLE KEYS */;
INSERT INTO `Activity` VALUES (1,'Tour en lancha','Paseo por las islas cercanas',50.00,2),(2,'Snorkel','Exploración de arrecifes coralinos',80.00,2),(3,'Escalada','Escalada guiada en roca natural',120.00,3),(4,'Tirolesa','Recorrido en canopy sobre el valle',90.00,4),(5,'Sandboarding','Deslizarse en tabla por las dunas',40.00,5),(6,'Kayak en el río','Recorrido guiado por aguas amazónicas',100.00,7),(7,'Avistamiento de aves','Exploración con guía ornitólogo',60.00,8),(8,'Clases de esquí','Lecciones para principiantes',150.00,9),(9,'Montañismo','Ascenso a cumbre nevada',200.00,10),(10,'Buceo en Galápagos','Exploración submarina con instructor',300.00,12),(11,'Sacred Valley Day Trip','Full-day tour to Ollantaytambo and Pisac.',80.00,11),(12,'Private Sandbank Picnic','Lunch on a secluded sandbank with champagne.',150.00,12),(13,'Second West End Show Ticket','Ticket to a popular musical or play.',100.00,13),(14,'Lokrum Island Ferry','Round-trip ferry ticket to Lokrum Island.',15.00,14),(15,'Glacier Hiking Tour','Guided walk on a glacier with necessary equipment.',160.00,15),(16,'Private Tango Lesson','One-hour private lesson with a master tango dancer.',70.00,16),(17,'Hot Air Balloon Safari','Sunrise hot air balloon ride over the Serengeti.',550.00,17),(18,'La Pedrera (Casa Milà) Ticket','Entrance ticket to Gaudí’s famous building.',28.00,18),(19,'East Side Gallery Tour','Guided tour of the remaining section of the Berlin Wall.',25.00,19),(20,'Elephant Ride at Amer Fort','Traditional elephant ride up to Amer Fort.',40.00,20),(21,'Canyoning Adventure','Guided descent through canyons and waterfalls.',65.00,21),(22,'Loch Ness Cruise','Boat trip on Loch Ness to look for the monster.',30.00,22),(23,'Dunn\'s River Falls Excursion','Guided climb up the famous waterfalls.',50.00,23),(24,'Dining Car Experience','Dinner in the exclusive dining car (one segment).',110.00,24),(25,'Mutianyu Cable Car','Round-trip cable car ticket to the Great Wall section.',35.00,25),(26,'Wreck Diving Excursion','Guided dive to a shipwreck site (certified divers only).',85.00,26),(27,'Bosphorus Dinner Cruise','Evening cruise with dinner and traditional shows.',70.00,27),(28,'Trekking Poles Rental','Rental of high-quality trekking poles for the hike.',15.00,28),(29,'Hammam Spa Experience','Traditional Moroccan spa and massage.',80.00,29),(30,'Lake Louise Canoe Rental','One-hour rental of a canoe on Lake Louise.',55.00,30),(31,'Piranha Fishing Trip','Guided fishing trip on the Amazon River.',40.00,31),(32,'Caldera Boat Tour','Day cruise around the caldera islands.',90.00,32),(33,'Bungee Jumping','One jump from the Kawarau Bridge.',180.00,33),(34,'Water Puppet Show','Tickets for a traditional Vietnamese water puppet performance.',15.00,34),(35,'Guinness Storehouse Tour','Self-guided tour and pint at the top of the storehouse.',30.00,35),(36,'Charles Bridge Tower Climb','Entrance to the Old Town Bridge Tower viewpoint.',10.00,36),(37,'Kiek in de Kök Museum','Entrance ticket to the cannon tower and museum.',12.00,37),(38,'Zodiac Boat Landing','Excursion to land on a remote beach.',45.00,38),(39,'Road to Hana Tour','Full-day guided scenic drive along the famous road.',75.00,39),(40,'Little Petra Visit','Guided tour of the smaller archaeological site.',20.00,40),(41,'Dhow Boat Sunset Cruise','Traditional sailing boat cruise along the coast.',40.00,41),(42,'Bran Castle (Dracula\'s Castle) Entry','Entrance ticket to Bran Castle.',18.00,42),(43,'Reindeer Sleigh Ride','Short sleigh ride with reindeer in the forest.',50.00,43),(44,'Classic Car Photography Session','Professional photos with a classic Cuban car.',60.00,44),(45,'Bukhara Day Trip','Full-day train trip to the neighboring city of Bukhara.',70.00,45),(46,'Robben Island Ferry & Tour','Ferry and guided tour of Robben Island.',45.00,46),(47,'Demilitarized Zone (DMZ) Tour','Full-day guided tour to the DMZ (military zone).',95.00,47),(48,'Hellbrunn Palace Trick Fountains','Entry to the famous water features.',20.00,48),(49,'Cooking Class with Chef','Hands-on class with a renowned Peruvian chef.',150.00,49),(50,'Jungle Tour & Zip-lines','Half-day jungle exploration with zip-lining.',70.00,50),(51,'Skywalk Grand Canyon','Access to the glass-bottomed horseshoe-shaped bridge.',75.00,51),(52,'Schönbrunn Palace Tour','Imperial tour of the famous palace.',35.00,52),(53,'Belgian Beer Tasting','Guided tasting of local craft beers.',40.00,53),(54,'Van Gogh Museum Entry','Entrance ticket to the famous art museum.',22.00,54),(55,'Traditional Tannery Visit','Guided visit to the famous tanneries in Fez.',15.00,55),(56,'Lukla Flight & Permits','Cost of scenic flight and trekking permits.',300.00,56),(57,'Balinese Dance Performance','Tickets to a traditional evening dance show.',25.00,57),(58,'Neuschwanstein Castle Day Trip','Full-day bus and castle ticket to the fairy-tale castle.',60.00,58),(59,'Catamaran Snorkel Trip','Half-day catamaran trip with snorkeling stops.',55.00,59),(60,'Château Visit & Tasting','Guided tour and premier wine tasting at a famous château.',85.00,60),(61,'Tomb of the Kings Entry','Entrance ticket to the UNESCO World Heritage site.',15.00,61),(62,'Dolphin Watching Cruise','Morning cruise to spot dolphins in the Gulf of Oman.',60.00,62),(63,'Soweto Bicycle Tour','Guided bicycle tour through Soweto township.',40.00,63),(64,'Whale Watching Tour','Guided boat tour to spot humpback whales (seasonal).',110.00,64),(65,'Field of Light Installation','Evening viewing of the massive light installation.',45.00,65),(66,'Waitangi Treaty Grounds Entry','Entrance to the significant historical site.',25.00,66),(67,'Jungle Night Walk','Guided walk to spot nocturnal wildlife.',30.00,67),(68,'Flamenco Show with Dinner','Evening show with traditional Andalusian dinner.',75.00,68),(69,'Azem Palace Visit','Entrance ticket to the historical palace.',10.00,69),(70,'Villa del Balbianello Tour','Boat trip and guided tour of the famous villa.',35.00,70),(71,'Bush Walk with Guide','Guided walking safari focusing on smaller flora and fauna.',50.00,71),(72,'Peggy\'s Cove Trip','Half-day bus trip to the iconic fishing village.',35.00,72),(73,'Mount Batur Sunrise Trek','Early morning guided trek to watch the sunrise.',45.00,73),(74,'Singapore Flyer Ticket','Ride on the giant observation wheel.',30.00,74),(75,'Rosenborg Castle Treasury','Entry to the castle and the crown jewels.',18.00,75),(76,'Museum of Anatolian Civilizations','Entrance ticket to the renowned museum.',12.00,76),(77,'Underground City Tour','Guided tour of the ancient underground cities.',25.00,77),(78,'Whale Watching in Maine','Boat tour for whale spotting (seasonal).',70.00,78),(79,'Sambadrome Tickets','Tickets for a top-tier parade at the Carnival.',200.00,79),(80,'Mount Entoto Excursion','Half-day trip to the mountain for panoramic views.',30.00,80),(81,'Ocean Walker Helmet Dive','Underwater walk on the seafloor.',120.00,81),(82,'TeamLab Borderless Exhibit','Entrance to the immersive digital art museum.',35.00,82),(83,'Poiana Brașov Cable Car','Round-trip ticket to the mountain resort.',20.00,83),(84,'Batu Caves Visit','Half-day trip to the famous Hindu shrine.',10.00,84),(85,'Iron Market Shopping Trip','Guided visit and shopping in the historic market.',20.00,85),(86,'Gozo Island Ferry','Round-trip ferry and bus tour of Gozo.',40.00,86),(87,'Igarapé do Ceará Boat Trip','Excursion to a nearby river beach.',25.00,87),(88,'Yad Vashem Holocaust Memorial','Guided tour of the memorial.',0.00,88),(89,'Egersheld Lighthouse Visit','Trip to the famous lighthouse for sunset views.',20.00,89),(90,'Feilai Feng Grottoes','Entry to the Buddhist grottoes and carvings.',15.00,90),(91,'Rosario Islands Day Trip','Boat trip to the beautiful Rosario Islands.',60.00,91),(92,'Chocolate Museum Entry','Entry and tasting at the Belgian Chocolate Museum.',15.00,92),(93,'Butrint National Park Entry','Entrance to the ancient Greek/Roman ruins.',10.00,93),(94,'Sound and Light Show','Evening sound and light show at the temples.',15.00,94),(95,'Gorilla Trekking Permit','Mandatory permit for the gorilla trek.',700.00,95),(96,'Carpet Weaving Workshop','Participation in a traditional carpet weaving workshop.',30.00,96),(97,'Macro Diving Session','Guided dive focused on small marine life.',65.00,97),(98,'Duquesne Incline Ride','Round-trip ride on the historic funicular.',5.00,98),(99,'Kon-Tiki Museum Visit','Entrance to the museum dedicated to Thor Heyerdahl.',15.00,99),(100,'Delhi Historical Monuments','Entrance ticket to the UNESCO World Heritage site.',12.00,100);
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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
INSERT INTO `Booking` VALUES (1,'2025-01-15','paid',1,1),(2,'2025-02-10','pending',2,2),(3,'2025-03-05','canceled',3,3),(4,'2025-04-01','paid',4,4),(5,'2025-04-10','pending',5,5),(6,'2025-05-02','paid',6,6),(7,'2025-05-15','pending',7,1),(8,'2025-06-20','canceled',8,2),(9,'2024-09-01','paid',1,1),(10,'2024-08-20','paid',2,2),(11,'2024-07-15','paid',3,3),(12,'2024-09-10','pending',4,4),(13,'2024-08-05','paid',5,5),(14,'2024-07-25','canceled',6,6),(15,'2024-09-15','paid',7,7),(16,'2024-08-12','pending',8,8),(17,'2024-07-01','paid',9,9),(18,'2024-09-22','paid',10,10),(19,'2024-08-18','paid',11,11),(20,'2024-07-05','paid',12,12),(21,'2024-09-08','pending',13,13),(22,'2024-08-25','paid',14,14),(23,'2024-07-10','paid',15,15),(24,'2024-09-19','canceled',16,16),(25,'2024-08-02','paid',17,17),(26,'2024-07-28','paid',18,18),(27,'2024-09-05','pending',19,19),(28,'2024-08-14','paid',20,20),(29,'2024-07-20','paid',21,21),(30,'2024-09-25','paid',22,22),(31,'2024-08-07','paid',23,23),(32,'2024-07-03','pending',24,24),(33,'2024-09-11','paid',25,25),(34,'2024-08-29','canceled',26,26),(35,'2024-07-18','paid',27,27),(36,'2024-09-02','paid',28,28),(37,'2024-08-10','paid',29,29),(38,'2024-07-07','pending',30,30),(39,'2024-09-17','paid',31,31),(40,'2024-08-22','paid',32,32),(41,'2024-07-12','canceled',33,33),(42,'2024-09-28','paid',34,34),(43,'2024-08-04','paid',35,35),(44,'2024-07-23','pending',36,36),(45,'2024-09-06','paid',37,37),(46,'2024-08-16','paid',38,38),(47,'2024-07-09','paid',39,39),(48,'2024-09-21','canceled',40,40),(49,'2024-08-08','paid',41,41),(50,'2024-07-30','paid',42,42),(51,'2024-09-14','pending',43,43),(52,'2024-08-27','paid',44,44),(53,'2024-07-14','paid',45,45),(54,'2024-09-03','paid',46,46),(55,'2024-08-24','canceled',47,47),(56,'2024-07-16','paid',48,48),(57,'2024-09-29','paid',49,49),(58,'2024-08-11','pending',50,50),(59,'2024-07-27','paid',51,51),(60,'2024-09-13','paid',52,52),(61,'2024-08-06','canceled',53,53),(62,'2024-07-02','paid',54,54),(63,'2024-09-16','paid',55,55),(64,'2024-08-21','paid',56,56),(65,'2024-07-08','pending',57,57),(66,'2024-09-20','paid',58,58),(67,'2024-08-09','paid',59,59),(68,'2024-07-29','paid',60,60),(69,'2024-09-04','canceled',61,61),(70,'2024-08-17','paid',62,62),(71,'2024-07-24','paid',63,63),(72,'2024-09-23','pending',64,64),(73,'2024-08-03','paid',65,65),(74,'2024-07-19','paid',66,66),(75,'2024-09-18','paid',67,67),(76,'2024-08-26','canceled',68,68),(77,'2024-07-11','paid',69,69),(78,'2024-09-07','paid',70,70),(79,'2024-08-19','pending',71,71),(80,'2024-07-04','paid',72,72),(81,'2024-09-26','paid',73,73),(82,'2024-08-13','paid',74,74),(83,'2024-07-21','canceled',75,75),(84,'2024-09-30','paid',76,76),(85,'2024-08-15','paid',77,77),(86,'2024-07-26','pending',78,78),(87,'2024-09-12','paid',79,79),(88,'2024-08-28','paid',80,80),(89,'2024-07-06','canceled',81,81),(90,'2024-09-09','paid',82,82),(91,'2024-08-31','paid',83,83),(92,'2024-07-17','pending',84,84),(93,'2024-09-27','paid',85,85),(94,'2024-08-01','paid',86,86),(95,'2024-07-22','canceled',87,87),(96,'2024-09-05','paid',88,88),(97,'2024-08-18','paid',89,89),(98,'2024-07-13','pending',90,90),(99,'2024-09-24','paid',91,91),(100,'2024-08-05','paid',92,92),(101,'2024-07-25','canceled',93,93),(102,'2024-09-01','paid',94,94),(103,'2024-08-20','paid',95,95),(104,'2024-07-15','pending',96,96),(105,'2024-09-10','paid',97,97),(106,'2024-08-05','paid',98,98),(107,'2024-07-25','canceled',99,99),(108,'2024-09-15','paid',100,100);
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
INSERT INTO `BookingActivity` VALUES (1,1),(1,2),(3,2),(2,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50),(51,51),(52,52),(53,53),(54,54),(55,55),(56,56),(57,57),(58,58),(59,59),(60,60),(61,61),(62,62),(63,63),(64,64),(65,65),(66,66),(67,67),(68,68),(69,69),(70,70),(71,71),(72,72),(73,73),(74,74),(75,75),(76,76),(77,77),(78,78),(79,79),(80,80),(81,81),(82,82),(83,83),(84,84),(85,85),(86,86),(87,87),(88,88),(89,89),(90,90),(91,91),(92,92),(93,93),(94,94),(95,95),(96,96),(97,97),(98,98),(99,99),(100,100);
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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Carlos','Zarate','carlos@example.com','+573001112233'),(2,'Ana','Martínez','ana@example.com','+573224445566'),(3,'Luis','Fernández','luis@example.com','+573339998877'),(4,'Sofía','González','sofia@example.com','+573228889999'),(5,'Miguel','Ramírez','miguel@example.com','+573223334455'),(6,'Valentina','Pérez','valentina@example.com','+573334446677'),(7,'Andrés','Torres','andres@example.com','+573335551122'),(8,'Laura','Jiménez','laura@example.com','+573336669988'),(9,'Alex','Johnson','alex.johnson@example.com','555-0101'),(10,'Maria','Garcia','maria.garcia@example.com','555-0102'),(11,'Chen','Wei','chen.wei@example.com','555-0103'),(12,'Sophie','Dubois','sophie.dubois@example.com','555-0104'),(13,'Liam','O’Connell','liam.oconnell@example.com','555-0105'),(14,'Fatima','Almarri','fatima.almarri@example.com','555-0106'),(15,'Javier','Perez','javier.perez@example.com','555-0107'),(16,'Yuki','Tanaka','yuki.tanaka@example.com','555-0108'),(17,'Hans','Muller','hans.muller@example.com','555-0109'),(18,'Isabella','Rossi','isabella.rossi@example.com','555-0110'),(19,'David','Smith','david.smith@example.com','555-0111'),(20,'Priya','Sharma','priya.sharma@example.com','555-0112'),(21,'Michael','Brown','michael.brown@example.com','555-0113'),(22,'Emily','Davis','emily.davis@example.com','555-0114'),(23,'Robert','Wilson','robert.wilson@example.com','555-0115'),(24,'Jessica','Miller','jessica.miller@example.com','555-0116'),(25,'William','Moore','william.moore@example.com','555-0117'),(26,'Sarah','Taylor','sarah.taylor@example.com','555-0118'),(27,'Richard','Anderson','richard.anderson@example.com','555-0119'),(28,'Elizabeth','Thomas','elizabeth.thomas@example.com','555-0120'),(29,'Charles','Jackson','charles.jackson@example.com','555-0121'),(30,'Laura','White','laura.white@example.com','555-0122'),(31,'James','Harris','james.harris@example.com','555-0123'),(32,'Linda','Martin','linda.martin@example.com','555-0124'),(33,'Joseph','Thompson','joseph.thompson@example.com','555-0125'),(34,'Karen','Allen','karen.allen@example.com','555-0126'),(35,'Thomas','Young','thomas.young@example.com','555-0127'),(36,'Nancy','King','nancy.king@example.com','555-0128'),(37,'Paul','Wright','paul.wright@example.com','555-0129'),(38,'Betty','Scott','betty.scott@example.com','555-0130'),(39,'Steven','Green','steven.green@example.com','555-0131'),(40,'Donna','Baker','donna.baker@example.com','555-0132'),(41,'George','Nelson','george.nelson@example.com','555-0133'),(42,'Carol','Carter','carol.carter@example.com','555-0134'),(43,'Kenneth','Mitchell','kenneth.mitchell@example.com','555-0135'),(44,'Sharon','Roberts','sharon.roberts@example.com','555-0136'),(45,'Edward','Campbell','edward.campbell@example.com','555-0137'),(46,'Michelle','Phillips','michelle.phillips@example.com','555-0138'),(47,'Donald','Evans','donald.evans@example.com','555-0139'),(48,'Susan','Turner','susan.turner@example.com','555-0140'),(49,'Ronald','Parker','ronald.parker@example.com','555-0141'),(50,'Deborah','Collins','deborah.collins@example.com','555-0142'),(51,'Mark','Stewart','mark.stewart@example.com','555-0143'),(52,'Diane','Sanchez','diane.sanchez@example.com','555-0144'),(53,'Andrew','Morris','andrew.morris@example.com','555-0145'),(54,'Stephanie','Rogers','stephanie.rogers@example.com','555-0146'),(55,'Joshua','Reed','joshua.reed@example.com','555-0147'),(56,'Ruth','Cook','ruth.cook@example.com','555-0148'),(57,'Gregory','Morgan','gregory.morgan@example.com','555-0149'),(58,'Lisa','Bell','lisa.bell@example.com','555-0150'),(59,'Jeffrey','Murphy','jeffrey.murphy@example.com','555-0151'),(60,'Kimberly','Bailey','kimberly.bailey@example.com','555-0152'),(61,'Ryan','Rivera','ryan.rivera@example.com','555-0153'),(62,'Joyce','Cooper','joyce.cooper@example.com','555-0154'),(63,'Gary','Peterson','gary.peterson@example.com','555-0155'),(64,'Christine','Cox','christine.cox@example.com','555-0156'),(65,'Dennis','Howard','dennis.howard@example.com','555-0157'),(66,'Marilyn','Ward','marilyn.ward@example.com','555-0158'),(67,'Jerry','Torres','jerry.torres@example.com','555-0159'),(68,'Cheryl','Foster','cheryl.foster@example.com','555-0160'),(69,'Peter','Sanders','peter.sanders@example.com','555-0161'),(70,'Kathryn','Powell','kathryn.powell@example.com','555-0162'),(71,'Henry','Long','henry.long@example.com','555-0163'),(72,'Heather','Simmons','heather.simmons@example.com','555-0164'),(73,'Walter','Barnes','walter.barnes@example.com','555-0165'),(74,'Nicole','Fisher','nicole.fisher@example.com','555-0166'),(75,'Aaron','Henderson','aaron.henderson@example.com','555-0167'),(76,'Evelyn','Bryant','evelyn.bryant@example.com','555-0168'),(77,'Timothy','Alexander','timothy.alexander@example.com','555-0169'),(78,'Christina','Russell','christina.russell@example.com','555-0170'),(79,'Chris','Diaz','chris.diaz@example.com','555-0171'),(80,'Gloria','Hayes','gloria.hayes@example.com','555-0172'),(81,'Roger','Myers','roger.myers@example.com','555-0173'),(82,'Judy','Jenkins','judy.jenkins@example.com','555-0174'),(83,'Harold','Gomez','harold.gomez@example.com','555-0175'),(84,'Pamela','Murray','pamela.murray@example.com','555-0176'),(85,'Keith','Ford','keith.ford@example.com','555-0177'),(86,'Janice','Hamilton','janice.hamilton@example.com','555-0178'),(87,'Victor','Graham','victor.graham@example.com','555-0179'),(88,'Teresa','Walsh','teresa.walsh@example.com','555-0180'),(89,'Randy','Weber','randy.weber@example.com','555-0181'),(90,'Kelly','Rice','kelly.rice@example.com','555-0182'),(91,'Phillip','Olson','phillip.olson@example.com','555-0183'),(92,'Martha','Gibson','martha.gibson@example.com','555-0184'),(93,'Jack','Spencer','jack.spencer@example.com','555-0185'),(94,'Debra','Stone','debra.stone@example.com','555-0186'),(95,'Willie','Hunt','willie.hunt@example.com','555-0187'),(96,'Helen','Fowler','helen.fowler@example.com','555-0188'),(97,'Raymond','Burns','raymond.burns@example.com','555-0189'),(98,'Cynthia','Jacobs','cynthia.jacobs@example.com','555-0190'),(99,'Jeremy','Mills','jeremy.mills@example.com','555-0191'),(100,'Katherine','Daniels','katherine.daniels@example.com','555-0192'),(101,'Jesse','Snyder','jesse.snyder@example.com','555-0193'),(102,'Ann','Gordon','ann.gordon@example.com','555-0194'),(103,'Bobby','Pope','bobby.pope@example.com','555-0195'),(104,'Alice','Flores','alice.flores@example.com','555-0196'),(105,'Russell','Dean','russell.dean@example.com','555-0197'),(106,'Julie','Meyer','julie.meyer@example.com','555-0198'),(107,'Wayne','Chapman','wayne.chapman@example.com','555-0199'),(108,'Marilyn','Sims','marilyn.sims@example.com','555-0200');
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
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Destination`
--

LOCK TABLES `Destination` WRITE;
/*!40000 ALTER TABLE `Destination` DISABLE KEYS */;
INSERT INTO `Destination` VALUES (1,'Playa Blanca','Colombia','Cartagena'),(2,'Montañas Azules','Colombia','Medellín'),(3,'Desierto Dorado','Perú','Ica'),(4,'Selva Amazónica','Brasil','Manaos'),(5,'Nevados Andinos','Chile','Santiago'),(6,'Islas Galápagos','Ecuador','Puerto Ayora'),(7,'Romantic Getaway','France','Paris'),(8,'Tropical Escape','Thailand','Phuket'),(9,'Ancient History Tour','Italy','Rome'),(10,'Mountain Adventure','Switzerland','Zermatt'),(11,'Desert Safari','UAE','Dubai'),(12,'Coastal Retreat','Portugal','Lisbon'),(13,'Cultural Immersion','Japan','Kyoto'),(14,'Viking Trails','Norway','Bergen'),(15,'Art Deco Wonders','USA','Miami'),(16,'Outback Expedition','Australia','Sydney'),(17,'Andean Peaks','Peru','Cusco'),(18,'Island Paradise','Maldives','Male'),(19,'Urban Sprawl','UK','London'),(20,'Balkan Beauty','Croatia','Dubrovnik'),(21,'Volcanic Views','Iceland','Reykjavik'),(22,'Tango Nights','Argentina','Buenos Aires'),(23,'Safari Dreams','Tanzania','Serengeti'),(24,'Wine Country Tour','Spain','Barcelona'),(25,'Tech Hub Exploration','Germany','Berlin'),(26,'Exotic Spice Route','India','Jaipur'),(27,'Jungle Trek','Costa Rica','La Fortuna'),(28,'Highland Games','Scotland','Edinburgh'),(29,'Caribbean Rhythms','Jamaica','Montego Bay'),(30,'Trans-Siberian Journey','Russia','Moscow'),(31,'Great Wall Experience','China','Beijing'),(32,'Red Sea Diving','Egypt','Sharm El Sheikh'),(33,'Historic Crossroads','Turkey','Istanbul'),(34,'Patagonian Wilderness','Chile','Torres del Paine'),(35,'Moroccan Souks','Morocco','Marrakech'),(36,'Canadian Rockies','Canada','Banff'),(37,'Amazon Basin','Brazil','Manaus'),(38,'Greek Isles Cruise','Greece','Santorini'),(39,'Kiwi Adventures','New Zealand','Queenstown'),(40,'Mekong Delta Life','Vietnam','Hanoi'),(41,'The Emerald Isle','Ireland','Dublin'),(42,'Bohemian Rhapsody','Czech Republic','Prague'),(43,'Baltic History','Estonia','Tallinn'),(44,'Fjord Exploration','Chile','Puerto Montt'),(45,'Hawaiian Hula','USA','Maui'),(46,'Ancient Wonders','Jordan','Petra'),(47,'East African Coast','Kenya','Mombasa'),(48,'Transylvanian Myths','Romania','Sighisoara'),(49,'Northern Lights Quest','Finland','Rovaniemi'),(50,'Cuban Salsa','Cuba','Havana'),(51,'Silk Road Echoes','Uzbekistan','Samarkand'),(52,'Table Mountain Views','South Africa','Cape Town'),(53,'Korean Temples','South Korea','Seoul'),(54,'Austrian Alps','Austria','Salzburg'),(55,'Peruvian Coast','Peru','Lima'),(56,'Mayan Ruins','Mexico','Cancun'),(57,'The Grand Canyon','USA','Arizona'),(58,'Symphony City','Austria','Vienna'),(59,'Chocolate and Waffles','Belgium','Brussels'),(60,'Tulip Fields','Netherlands','Amsterdam'),(61,'Sahara Gateway','Morocco','Casablanca'),(62,'Himalayan Ascent','Nepal','Kathmandu'),(63,'Tropical Rainforest','Indonesia','Bali'),(64,'Medieval Towns','Germany','Munich'),(65,'Carribean Jewel','Barbados','Bridgetown'),(66,'Wine Tasting Trip','France','Bordeaux'),(67,'Mediterranean Blue','Cyprus','Paphos'),(68,'Desert Oasis','Oman','Muscat'),(69,'City of Gold','South Africa','Johannesburg'),(70,'Glacial Beauty','Greenland','Ilulissat'),(71,'Red Center','Australia','Uluru'),(72,'Bay of Islands','New Zealand','Paihia'),(73,'Amazon River Tour','Ecuador','Tena'),(74,'Gothic Charm','Spain','Seville'),(75,'Ancient Citadel','Syria','Damascus'),(76,'Mountain Lakes','Italy','Como'),(77,'Wildlife Haven','Botswana','Okavango'),(78,'Fishing Villages','Canada','Halifax'),(79,'Paddy Fields','Indonesia','Ubud'),(80,'Historical Ports','Singapore','Singapore'),(81,'Nordic Design','Denmark','Copenhagen'),(82,'Bosphorus Views','Turkey','Ankara'),(83,'Fairy Chimneys','Turkey','Cappadocia'),(84,'Rocky Coastline','USA','Maine'),(85,'Carnival City','Brazil','Rio de Janeiro'),(86,'The Cradle of Humankind','Ethiopia','Addis Ababa'),(87,'The Great Barrier Reef','Australia','Cairns'),(88,'Cherry Blossom','Japan','Tokyo'),(89,'Transylvanian Castle','Romania','Brasov'),(90,'Sultan Palaces','Malaysia','Kuala Lumpur'),(91,'Pearl of the Antilles','Haiti','Port-au-Prince'),(92,'The Silent City','Malta','Mdina'),(93,'The Amazon Mouth','Brazil','Belém'),(94,'The Holy Land','Israel','Jerusalem'),(95,'Wonders of Siberia','Russia','Vladivostok'),(96,'The Silk Capital','China','Hangzhou'),(97,'Caribbean Coast','Colombia','Cartagena'),(98,'Flemish Art Cities','Belgium','Bruges'),(99,'Adriatic Coast','Albania','Sarande'),(100,'The City of Statues','India','Khajuraho'),(101,'The Pearl of Africa','Uganda','Bwindi'),(102,'The Land of Fire','Azerbaijan','Baku'),(103,'The Spice Islands','Indonesia','Ambon'),(104,'The City of Bridges','USA','Pittsburgh'),(105,'The Land of Fjords','Norway','Oslo'),(106,'The Golden Triangle','India','Delhi'),(107,'The Desert Rose','UAE','Abu Dhabi');
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
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Guide`
--

LOCK TABLES `Guide` WRITE;
/*!40000 ALTER TABLE `Guide` DISABLE KEYS */;
INSERT INTO `Guide` VALUES (1,'María Gómez','+573000111222','Español',1),(2,'John Doe','+573001234567','Inglés',2),(3,'Pedro Castillo','+51987123456','Español',3),(4,'Ricardo Silva','+55987123456','Portugués',4),(5,'Emily Brown','+56987123456','Inglés',5),(6,'Daniela Cruz','+593998812345','Español',6),(7,'Antoine Moreau','555-2001','French',1),(8,'Sombat Kanjana','555-2002','Thai, English',2),(9,'Giovanni Vico','555-2003','Italian, Spanish',3),(10,'Elsa Zwingli','555-2004','German, French',4),(11,'Khalid Al Nahyan','555-2005','Arabic, English',5),(12,'Ines Silva','555-2006','Portuguese, Spanish',6),(13,'Kenjiro Sato','555-2007','Japanese, English',7),(14,'Bjorn Halvorsen','555-2008','Norwegian, German',8),(15,'Reggie Jones','555-2009','English, Spanish',9),(16,'Kylie Davies','555-2010','English, Mandarin',10),(17,'Ricardo Huaman','555-2011','Spanish, Quechua',11),(18,'Aishath Naseer','555-2012','Dhivehi, English',12),(19,'Amelia Clark','555-2013','English, French',13),(20,'Luka Kovač','555-2014','Croatian, Italian',14),(21,'Sif Jónsdóttir','555-2015','Icelandic, English',15),(22,'Sofia Ramirez','555-2016','Spanish, Portuguese',16),(23,'Malaika Kessy','555-2017','Swahili, English',17),(24,'Carles Pujol','555-2018','Catalan, Spanish',18),(25,'Klaus Richter','555-2019','German, Russian',19),(26,'Devi Singh','555-2020','Hindi, English',20),(27,'Juan Mora','555-2021','Spanish, English',21),(28,'Hamish McNeil','555-2022','Gaelic, English',22),(29,'Jahmar Lee','555-2023','English, Patois',23),(30,'Dmitri Petrov','555-2024','Russian, German',24),(31,'Li Wei','555-2025','Mandarin, English',25),(32,'Amina Said','555-2026','Arabic, French',26),(33,'Ayşe Yılmaz','555-2027','Turkish, English',27),(34,'Ignacio Soto','555-2028','Spanish, English',28),(35,'Zahra Benali','555-2029','Arabic, French',29),(36,'Mike Chen','555-2030','English, Mandarin',30),(37,'Marcos Silva','555-2031','Portuguese, Spanish',31),(38,'Eleni Kontos','555-2032','Greek, English',32),(39,'Te Rangi Pukeko','555-2033','Maori, English',33),(40,'Thanh Nguyen','555-2034','Vietnamese, French',34),(41,'Aidan Kelly','555-2035','Irish, English',35),(42,'Eva Nováková','555-2036','Czech, German',36),(43,'Madis Oja','555-2037','Estonian, Russian',37),(44,'Catalina Flores','555-2038','Spanish, German',38),(45,'Keoki Kalani','555-2039','Hawaiian, English',39),(46,'Jamal Nabil','555-2040','Arabic, English',40),(47,'Juma Ali','555-2041','Swahili, English',41),(48,'Mircea Popa','555-2042','Romanian, Hungarian',42),(49,'Aatu Laine','555-2043','Finnish, Swedish',43),(50,'Roberto Cruz','555-2044','Spanish, English',44),(51,'Bakhrom Karimov','555-2045','Uzbek, Russian',45),(52,'Lebo Mokoena','555-2046','Zulu, English',46),(53,'Min-ji Kim','555-2047','Korean, Japanese',47),(54,'Johanna Weber','555-2048','German, Italian',48),(55,'Paola Soto','555-2049','Spanish, English',49),(56,'Miguel Flores','555-2050','Spanish, English',50),(57,'Cody Evans','555-2051','English',51),(58,'Franz Gruber','555-2052','German, English',52),(59,'Marc Dubois','555-2053','French, Dutch',53),(60,'Femke De Vries','555-2054','Dutch, English',54),(61,'Mustafa Azizi','555-2055','Arabic, French',55),(62,'Tenzin Sherpa','555-2056','Nepali, English',56),(63,'Wayan Putra','555-2057','Indonesian, English',57),(64,'Ludwig Bauer','555-2058','German, English',58),(65,'Rihanna King','555-2059','English',59),(66,'Jean Luc Riviere','555-2060','French, Spanish',60),(67,'Andreas Christou','555-2061','Greek, English',61),(68,'Fahad Al Said','555-2062','Arabic, English',62),(69,'Nomusa Zulu','555-2063','Zulu, English',63),(70,'Inuk Olsen','555-2064','Greenlandic, Danish',64),(71,'Kym Smith','555-2065','English',65),(72,'Hana Wiki','555-2066','Maori, English',66),(73,'Luis Calero','555-2067','Spanish, Kichwa',67),(74,'Elena Ruiz','555-2068','Spanish, French',68),(75,'Farid Haddad','555-2069','Arabic, French',69),(76,'Marco Bellini','555-2070','Italian, English',70),(77,'Kago Kgosi','555-2071','Setswana, English',71),(78,'Brenda MacLeod','555-2072','English, French',72),(79,'Dewi Sari','555-2073','Indonesian, English',73),(80,'Liang Ming','555-2074','Mandarin, English',74),(81,'Aksel Jensen','555-2075','Danish, English',75),(82,'Can Demir','555-2076','Turkish, German',76),(83,'Emre Kaya','555-2077','Turkish, English',77),(84,'Scott Miller','555-2078','English',78),(85,'Marcela Santos','555-2079','Portuguese, Spanish',79),(86,'Lemi Bekele','555-2080','Amharic, English',80),(87,'Chloe Green','555-2081','English',81),(88,'Akira Kobayashi','555-2082','Japanese, English',82),(89,'Andrei Voicu','555-2083','Romanian, English',83),(90,'Nurul Aini','555-2084','Malay, English',84),(91,'Pierre Louis','555-2085','Haitian Creole, French',85),(92,'Joseph Azzopardi','555-2086','Maltese, English',86),(93,'Joao Mendes','555-2087','Portuguese, Spanish',87),(94,'Yosef Cohen','555-2088','Hebrew, English',88),(95,'Ilya Sokolov','555-2089','Russian, Korean',89),(96,'Xiaoli Duan','555-2090','Mandarin, English',90),(97,'Sofia Cotes','555-2091','Spanish, English',91),(98,'Willem Janssens','555-2092','Dutch, French',92),(99,'Arjan Leka','555-2093','Albanian, Greek',93),(100,'Ashok Kumar','555-2094','Hindi, English',94),(101,'Moses Bwindi','555-2095','Luganda, English',95),(102,'Aida Aliyeva','555-2096','Azerbaijani, Russian',96),(103,'Jan Pieters','555-2097','Indonesian, Dutch',97),(104,'Ben Carter','555-2098','English',98),(105,'Knut Evensen','555-2099','Norwegian, English',99),(106,'Ravi Menon','555-2100','Hindi, English',100);
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Itinerary`
--

LOCK TABLES `Itinerary` WRITE;
/*!40000 ALTER TABLE `Itinerary` DISABLE KEYS */;
INSERT INTO `Itinerary` VALUES (1,1,'Llegada al hotel y tour por la ciudad',1),(2,2,'Día de playa y actividades acuáticas',1),(3,1,'Caminata ecológica por las montañas',2),(4,2,'Deportes extremos y visita cultural',2),(5,1,'Tour en buggy por las dunas',3),(6,2,'Cena típica en restaurante local',3),(7,1,'Ingreso a la reserva natural y caminata inicial',4),(8,2,'Safari nocturno en la selva',4),(9,1,'Llegada al centro de esquí y clase introductoria',5),(10,2,'Excursión a la montaña y fogata',5),(11,1,'Tour en barco por las islas',6),(12,2,'Snorkel con lobos marinos',6),(13,1,'Tarde libre seguida de un espectáculo musical en el West End.',7),(14,1,'Viaje en ferry a la Isla de Lokrum y exploración de la reserva natural.',7),(15,1,'Senderismo guiado en glaciar con equipo de seguridad profesional.',8),(16,1,'Clase privada de una hora de tango con un bailarín maestro local.',8),(17,1,'Safari en globo aerostático al amanecer sobre la planicie del Serengeti.',9),(18,1,'Visita autoguiada a La Pedrera (Casa Milà), la joya de Gaudí.',9),(19,1,'Tour guiado por la East Side Gallery y la historia del Muro de Berlín.',10),(20,1,'Paseo tradicional en elefante hasta la entrada del Fuerte Amer.',10),(21,1,'Aventura de barranquismo (canyoning) descendiendo cascadas.',1),(22,1,'Crucero por el Lago Ness en busca de la legendaria criatura.',1),(23,1,'Excursión guiada para subir las cataratas de Dunn’s River.',2),(24,1,'Cena exclusiva en el coche comedor del tren, disfrutando del paisaje.',2),(25,1,'Ascenso y descenso en teleférico para visitar la sección Mutianyu de la Gran Muralla.',3),(26,1,'Inmersión guiada a un sitio de naufragio (solo para buzos certificados).',3),(27,1,'Crucero nocturno por el Bósforo con cena y espectáculos tradicionales.',4),(28,1,'Día de senderismo con alquiler de bastones para la ruta de trekking.',4),(29,1,'Experiencia completa de spa y masaje en un tradicional Hammam marroquí.',5),(30,1,'Alquiler de canoa por una hora en el pintoresco Lago Louise.',5),(31,1,'Excursión guiada de pesca de pirañas en las aguas del río Amazonas.',6),(32,1,'Paseo en barco de día completo alrededor de los islotes de la caldera.',6),(33,1,'Salto de puenting (Bungee Jumping) desde el Puente Kawarau.',7),(34,1,'Asistencia a un tradicional espectáculo de marionetas acuáticas vietnamitas.',7),(35,1,'Tour autoguiado por la Guinness Storehouse con degustación de cerveza.',8),(36,1,'Ascenso a la Torre del Puente de Carlos para vistas panorámicas.',8),(37,1,'Visita al museo y torre de cañones Kiek in de Kök.',9),(38,1,'Excursión en bote Zodiac para desembarcar en una playa remota.',9),(39,1,'Recorrido escénico guiado de día completo por la famosa Carretera a Hana.',10),(40,1,'Tour guiado por el sitio arqueológico más pequeño de Little Petra.',10),(41,1,'Crucero al atardecer en un tradicional barco Dhow por la costa.',1),(42,1,'Entrada al Castillo de Bran, popularmente conocido como el castillo de Drácula.',1),(43,1,'Paseo corto en trineo tirado por renos a través del bosque nevado.',2),(44,1,'Sesión de fotos profesional con un coche clásico cubano.',2),(45,1,'Viaje en tren de día completo a la histórica ciudad de Bukhara.',3),(46,1,'Ferry y tour guiado por la histórica y emblemática Robben Island.',3),(47,1,'Tour guiado de día completo a la Zona Desmilitarizada (DMZ).',4),(48,1,'Entrada a las famosas fuentes trucadas del Palacio de Hellbrunn.',4),(49,1,'Clase práctica de cocina con un reconocido chef peruano.',5),(50,1,'Exploración de medio día en la selva con recorrido de tirolesas.',5),(51,1,'Acceso a la pasarela de cristal (Skywalk) sobre el Gran Cañón.',6),(52,1,'Tour Imperial por las habitaciones del famoso Palacio de Schönbrunn.',6),(53,1,'Degustación guiada de cervezas artesanales belgas locales.',7),(54,1,'Entrada al famoso museo de arte dedicado a Van Gogh.',7),(55,1,'Visita guiada a las tradicionales y coloridas curtidurías de Fez.',8),(56,1,'Vuelo escénico a Lukla y trámites de permisos de trekking.',8),(57,1,'Entradas para un tradicional espectáculo nocturno de danza balinesa.',9),(58,1,'Excursión de día completo en autobús al castillo de Neuschwanstein.',9),(59,1,'Viaje de medio día en catamarán con paradas para hacer snorkel.',10),(60,1,'Tour guiado y cata de vinos premium en un famoso château.',10),(61,1,'Entrada al sitio arqueológico de la Tumba de los Reyes (Patrimonio UNESCO).',1),(62,1,'Crucero matutino para avistar delfines en el Golfo de Omán.',1),(63,1,'Recorrido guiado en bicicleta por el municipio de Soweto.',2),(64,1,'Tour guiado en barco para el avistamiento de ballenas jorobadas (estacional).',2),(65,1,'Visita nocturna a la gigantesca instalación de luces Field of Light.',3),(66,1,'Entrada al sitio histórico y significativo de Waitangi Treaty Grounds.',3),(67,1,'Caminata nocturna guiada para observar la fauna silvestre.',4),(68,1,'Espectáculo nocturno de flamenco con una tradicional cena andaluza.',4),(69,1,'Entrada al histórico Palacio de Azem.',5),(70,1,'Paseo en barco y tour guiado por la famosa Villa del Balbianello.',5),(71,1,'Safari a pie guiado, centrado en la flora y fauna más pequeña.',6),(72,1,'Viaje en autobús de medio día al emblemático pueblo pesquero de Peggy\'s Cove.',6),(73,1,'Trekking matutino guiado al Monte Batur para ver el amanecer.',7),(74,1,'Paseo en la noria de observación gigante Singapore Flyer.',7),(75,1,'Entrada al Castillo de Rosenborg y su tesorería real.',8),(76,1,'Entrada al reconocido Museo de las Civilizaciones de Anatolia.',8),(77,1,'Tour guiado por las antiguas ciudades subterráneas.',9),(78,1,'Paseo en barco para avistamiento de ballenas en Maine (estacional).',9),(79,1,'Entradas para un desfile de primer nivel en el Sambódromo durante el Carnaval.',10),(80,1,'Excursión de medio día al Monte Entoto para vistas panorámicas.',10),(81,1,'Caminata submarina en el fondo marino con casco Ocean Walker.',1),(82,1,'Entrada a la exposición inmersiva de arte digital TeamLab Borderless.',1),(83,1,'Viaje de ida y vuelta en teleférico al centro de esquí Poiana Brașov.',2),(84,1,'Viaje de medio día al famoso santuario hindú de Batu Caves.',2),(85,1,'Visita guiada y compras en el histórico Iron Market.',3),(86,1,'Ferry de ida y vuelta y tour en autobús por la Isla de Gozo.',3),(87,1,'Excursión en barco a una playa fluvial cercana, Igarapé do Ceará.',4),(88,1,'Tour guiado al memorial del Holocausto de Yad Vashem (sin costo).',4),(89,1,'Viaje al faro de Egersheld para disfrutar de las vistas del atardecer.',5),(90,1,'Entrada a las grutas y tallas budistas de Feilai Feng.',5),(91,1,'Paseo en barco de día completo a las hermosas Islas del Rosario.',6),(92,1,'Entrada y degustación en el Museo del Chocolate Belga.',6),(93,1,'Entrada al Parque Nacional Butrint, ruinas antiguas griegas/romanas.',7),(94,1,'Espectáculo nocturno de luz y sonido en los templos de Luxor.',7),(95,1,'Permiso obligatorio y costoso para el trekking de gorilas.',8),(96,1,'Participación en un taller tradicional de tejido de alfombras.',8),(97,1,'Inmersión guiada de macro buceo enfocada en la vida marina pequeña.',9),(98,1,'Viaje de ida y vuelta en el histórico funicular de Duquesne Incline.',9),(99,1,'Entrada al Museo Kon-Tiki, dedicado a Thor Heyerdahl.',10),(100,1,'Entrada al sitio del Patrimonio Mundial UNESCO, Qutub Minar.',10);
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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (1,450.00,'2025-01-16','Tarjeta de Crédito',1),(2,750.00,'2025-04-02','Efectivo',4),(3,1200.00,'2025-05-03','Transferencia',6),(4,4500.00,'2024-09-01','Credit Card',1),(5,1800.00,'2024-08-20','Bank Transfer',2),(6,2750.00,'2024-07-15','Credit Card',3),(7,390.00,'2024-09-11','Partial Payment',4),(8,5500.00,'2024-08-05','Credit Card',5),(9,1600.00,'2024-07-25','Refunded',6),(10,4800.00,'2024-09-15','Credit Card',7),(11,620.00,'2024-08-13','Partial Payment',8),(12,950.00,'2024-07-01','Credit Card',9),(13,3100.00,'2024-09-22','Bank Transfer',10),(14,2900.00,'2024-08-18','Credit Card',11),(15,7800.00,'2024-07-05','Credit Card',12),(16,210.00,'2024-09-09','Partial Payment',13),(17,1150.00,'2024-08-25','Credit Card',14),(18,3500.00,'2024-07-10','Credit Card',15),(19,2200.00,'2024-09-19','Refunded',16),(20,8900.00,'2024-08-02','Bank Transfer',17),(21,1450.00,'2024-07-28','Credit Card',18),(22,170.00,'2024-09-06','Partial Payment',19),(23,2500.00,'2024-08-14','Credit Card',20),(24,1300.00,'2024-07-20','Credit Card',21),(25,2800.00,'2024-09-25','Credit Card',22),(26,1950.00,'2024-08-07','Bank Transfer',23),(27,720.00,'2024-07-04','Partial Payment',24),(28,2300.00,'2024-09-11','Credit Card',25),(29,1750.00,'2024-08-29','Refunded',26),(30,2150.00,'2024-07-18','Credit Card',27),(31,4100.00,'2024-09-02','Credit Card',28),(32,1500.00,'2024-08-10','Bank Transfer',29),(33,330.00,'2024-07-08','Partial Payment',30),(34,3800.00,'2024-09-17','Credit Card',31),(35,2950.00,'2024-08-22','Credit Card',32),(36,3600.00,'2024-07-12','Refunded',33),(37,1250.00,'2024-09-28','Credit Card',34),(38,1100.00,'2024-08-04','Credit Card',35),(39,155.00,'2024-07-24','Partial Payment',36),(40,980.00,'2024-09-06','Bank Transfer',37),(41,5100.00,'2024-08-16','Credit Card',38),(42,4300.00,'2024-07-09','Credit Card',39),(43,3400.00,'2024-09-21','Refunded',40),(44,2600.00,'2024-08-08','Credit Card',41),(45,1400.00,'2024-07-30','Bank Transfer',42),(46,490.00,'2024-09-15','Partial Payment',43),(47,2350.00,'2024-08-27','Credit Card',44),(48,3150.00,'2024-07-14','Credit Card',45),(49,2700.00,'2024-09-03','Credit Card',46),(50,2400.00,'2024-08-24','Refunded',47),(51,1850.00,'2024-07-16','Credit Card',48),(52,1200.00,'2024-09-29','Bank Transfer',49),(53,305.00,'2024-08-12','Partial Payment',50),(54,2000.00,'2024-07-27','Credit Card',51),(55,1900.00,'2024-09-13','Credit Card',52),(56,1050.00,'2024-08-06','Refunded',53),(57,1750.00,'2024-07-02','Bank Transfer',54),(58,2650.00,'2024-09-16','Credit Card',55),(59,7500.00,'2024-08-21','Credit Card',56),(60,285.00,'2024-07-09','Partial Payment',57),(61,2050.00,'2024-09-20','Credit Card',58),(62,2450.00,'2024-08-09','Bank Transfer',59),(63,3350.00,'2024-07-29','Credit Card',60),(64,1980.00,'2024-09-04','Refunded',61),(65,3700.00,'2024-08-17','Credit Card',62),(66,1580.00,'2024-07-24','Credit Card',63),(67,650.00,'2024-09-24','Partial Payment',64),(68,3000.00,'2024-08-03','Credit Card',65),(69,3250.00,'2024-07-19','Bank Transfer',66),(70,1100.00,'2024-09-18','Credit Card',67),(71,1780.00,'2024-08-26','Refunded',68),(72,3950.00,'2024-07-11','Credit Card',69),(73,5900.00,'2024-09-07','Credit Card',70),(74,950.00,'2024-08-20','Partial Payment',71),(75,1650.00,'2024-07-04','Bank Transfer',72),(76,2150.00,'2024-09-26','Credit Card',73),(77,1350.00,'2024-08-13','Credit Card',74),(78,1880.00,'2024-07-21','Refunded',75),(79,1420.00,'2024-09-30','Credit Card',76),(80,2780.00,'2024-08-15','Bank Transfer',77),(81,128.00,'2024-07-27','Partial Payment',78),(82,4950.00,'2024-09-12','Credit Card',79),(83,2100.00,'2024-08-28','Credit Card',80),(84,3450.00,'2024-07-06','Refunded',81),(85,4150.00,'2024-09-09','Bank Transfer',82),(86,1520.00,'2024-08-31','Credit Card',83),(87,118.00,'2024-07-18','Partial Payment',84),(88,2680.00,'2024-09-27','Credit Card',85),(89,1680.00,'2024-08-01','Bank Transfer',86),(90,2080.00,'2024-07-22','Refunded',87),(91,3200.00,'2024-09-05','Credit Card',88),(92,4050.00,'2024-08-18','Credit Card',89),(93,190.00,'2024-07-14','Partial Payment',90),(94,1850.00,'2024-09-24','Credit Card',91),(95,1220.00,'2024-08-05','Bank Transfer',92),(96,1380.00,'2024-07-25','Refunded',93),(97,2300.00,'2024-09-01','Credit Card',94),(98,8100.00,'2024-08-20','Credit Card',95),(99,172.00,'2024-07-16','Partial Payment',96),(100,3650.00,'2024-09-10','Credit Card',97),(101,900.00,'2024-08-05','Bank Transfer',98),(102,2550.00,'2024-07-25','Refunded',99),(103,2900.00,'2024-09-15','Credit Card',100);
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
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plan`
--

LOCK TABLES `Plan` WRITE;
/*!40000 ALTER TABLE `Plan` DISABLE KEYS */;
INSERT INTO `Plan` VALUES (1,'Plan Caribeño','Disfruta del sol y el mar en Cartagena',450.00,1),(2,'Plan Aventura Andina','Explora montañas y naturaleza en Medellín',600.00,2),(3,'Plan Oasis','Experiencia única en el desierto de Ica',350.00,3),(4,'Expedición Amazónica','Tour por la selva con guía local',750.00,4),(5,'Aventura en los Nevados','Esquí y montañismo en los Andes',950.00,5),(6,'Exploración Galápagos','Crucero y avistamiento de fauna marina',1200.00,6),(7,'Eiffel Tower Romance','A four-day luxury trip focused on Paris, including fine dining and landmark visits.',4500.00,1),(8,'Phuket Beach Bliss','Seven days of sun, sand, and turquoise waters in Thailand.',1800.00,2),(9,'Imperial Rome: 5 Days','Explore the Colosseum, Vatican, and Roman Forum with a private guide.',2750.00,3),(10,'Matterhorn Hiking Trail','A strenuous but rewarding 6-day hike through the Swiss Alps.',3900.00,4),(11,'Luxury Desert Stay','Exclusive 3-day stay in a high-end Dubai resort with private excursions.',5500.00,5),(12,'Lisbon Tram & Fado','A cozy 4-day tour of Lisbon’s historic neighborhoods and musical traditions.',1600.00,6),(13,'Kyoto Zen Garden Tour','Ten days visiting ancient temples, traditional tea houses, and tranquil gardens.',4800.00,7),(14,'Fjord Cruise & Northern Lights','An 8-day cruise exploring the Norwegian coast and hunting for aurora borealis.',6200.00,8),(15,'Miami Art Deco Weekend','A fun 3-day package focusing on South Beach architecture and nightlife.',950.00,9),(16,'Sydney Harbour & Opera','A 5-day trip covering iconic Sydney landmarks and a show at the Opera House.',3100.00,10),(17,'Machu Picchu Trek','A challenging 4-day Inca Trail trek ending at the famous citadel.',2900.00,11),(18,'Maldives Overwater Bungalow','A 7-day luxurious stay in a secluded overwater bungalow.',7800.00,12),(19,'London Theatre Week','Five days in London with tickets to three West End shows.',2100.00,13),(20,'Dubrovnik Wall Walk','A short 3-day historical tour of the walled city.',1150.00,14),(21,'Golden Circle & Blue Lagoon','A 5-day tour of Iceland’s geothermal wonders.',3500.00,15),(22,'Buenos Aires Dance Package','A week in Argentina with private tango lessons and show tickets.',2200.00,16),(23,'Serengeti Migration Safari','A 10-day private tented safari experience.',8900.00,17),(24,'Barcelona Gaudí Trail','Four days dedicated to the architecture of Antoni Gaudí.',1450.00,18),(25,'Berlin Tech & History','A 5-day mix of historical sites and modern tech district visits.',1700.00,19),(26,'Jaipur Palaces & Forts','A week exploring the royal heritage of the Pink City.',2500.00,20),(27,'Arenal Volcano Zip-lining','Three days of adventure sports near the Arenal Volcano.',1300.00,21),(28,'Loch Ness & Whisky Tour','A 6-day tour of the Scottish Highlands and several distilleries.',2800.00,22),(29,'Jamaican Reggae Resort','Seven days all-inclusive stay at a beachfront resort.',1950.00,23),(30,'Moscow to Vladivostok Rail','A 14-day segment of the legendary Trans-Siberian Railway.',7200.00,24),(31,'Great Wall Hiking','Four days exploring different sections of the Great Wall.',2300.00,25),(32,'Red Sea Scuba Certification','A 6-day package for Open Water Dive certification.',1750.00,26),(33,'Istanbul Bazaars & Mosques','Five days exploring the cultural heart of Istanbul.',2150.00,27),(34,'Patagonia Trekking','An intensive 8-day trek through the Patagonian wilderness.',4100.00,28),(35,'Marrakech Spice Trail','Four days navigating the bustling souks and gardens.',1500.00,29),(36,'Banff Lake Louise Photo Tour','A 5-day trip focused on capturing the best mountain vistas.',3300.00,30),(37,'Amazon Riverboat','A 6-day eco-friendly river cruise deep into the jungle.',3800.00,31),(38,'Santorini Sunset Views','A romantic 4-day stay with caldera views.',2950.00,32),(39,'Queenstown Bungee & Thrills','A 5-day package for extreme sports enthusiasts.',3600.00,33),(40,'Hanoi Street Food Tour','A 6-day culinary adventure in Northern Vietnam.',1250.00,34),(41,'Dublin Pub Crawl & History','Three days enjoying Irish culture, history, and nightlife.',1100.00,35),(42,'Prague Castle & Bridges','A 4-day trip focused on the historical center.',1550.00,36),(43,'Tallinn Medieval Fair','A 3-day visit coinciding with a historical fair.',980.00,37),(44,'Chilean Fjords Cruise','A 7-day small ship cruise through the remote fjords.',5100.00,38),(45,'Maui Volcano & Beaches','A 7-day mix of beach relaxation and Haleakalā National Park.',4300.00,39),(46,'Petra Treasury Trek','A 5-day historical journey including Wadi Rum desert.',3400.00,40),(47,'Mombasa Coastal Relaxation','A 7-day all-inclusive beach holiday.',2600.00,41),(48,'Dracula’s Castle Tour','A 4-day tour focused on historical castles and myths.',1400.00,42),(49,'Arctic Snowmobile Tour','A 5-day adventure with snowmobiling and ice fishing.',4900.00,43),(50,'Havana Vintage Car Tour','A 5-day experience focusing on music, cigars, and classic cars.',2350.00,44),(51,'Silk Road Ancient Cities','An 8-day historical tour of Samarkand and Bukhara.',3150.00,45),(52,'Cape Town Table Mountain Hike','A 6-day tour of the city, wine region, and coast.',2700.00,46),(53,'Seoul K-Pop & Culture','A 5-day mix of modern K-Pop culture and historical palaces.',2400.00,47),(54,'Sound of Music Tour','A 4-day tour focusing on filming locations and history.',1850.00,48),(55,'Lima Culinary Experience','A 3-day deep dive into world-class Peruvian cuisine.',1200.00,49),(56,'Cancun All-Inclusive Luxury','Seven days of pure relaxation at a top resort.',3050.00,50),(57,'Grand Canyon Helicopter View','A 3-day package including a scenic flight.',2000.00,51),(58,'Vienna Classical Music','A 4-day trip featuring concerts and historical venues.',1900.00,52),(59,'Brussels Chocolate Workshop','A 3-day tour focusing on chocolate and beer.',1050.00,53),(60,'Amsterdam Canal Cruise','A 4-day tour of canals, museums, and liberal culture.',1750.00,54),(61,'Fez & Casablanca Contrast','A 5-day tour exploring the traditional and modern sides of Morocco.',2650.00,55),(62,'Everest Base Camp View','A 12-day trek to a viewpoint near Everest Base Camp.',7500.00,56),(63,'Bali Spiritual Retreat','Seven days of yoga, meditation, and cultural exploration in Ubud.',2850.00,57),(64,'Munich Beer & Castles','A 5-day tour focusing on Bavarian traditions and castles.',2050.00,58),(65,'Barbados Rum & Reefs','A 7-day all-inclusive package with snorkeling.',2450.00,59),(66,'Bordeaux Vineyard Experience','A 4-day guided tour of famous vineyards and tastings.',3350.00,60),(67,'Paphos Archaeology','A 5-day trip exploring ancient Greek and Roman ruins.',1980.00,61),(68,'Muscat Heritage & Sea','A 6-day tour of Omani history, markets, and coastline.',3700.00,62),(69,'Johannesburg Soweto Tour','A 4-day trip focusing on historical and cultural sites.',1580.00,63),(70,'Greenland Icefjord Kayaking','A 7-day adventure kayaking among icebergs.',6500.00,64),(71,'Uluru Sunrise & Culture','A 4-day indigenous culture and natural wonder tour.',3000.00,65),(72,'Bay of Islands Dolphin Swim','A 5-day relaxed tour focusing on marine life.',3250.00,66),(73,'Tena White Water Rafting','A 3-day adrenaline rush on the Amazon tributaries.',1100.00,67),(74,'Seville Flamenco & Tapas','A 4-day cultural deep dive into Andalusian traditions.',1780.00,68),(75,'Damascus Old City Tour','A 5-day historical and architectural exploration.',3950.00,69),(76,'Lake Como Luxury Villa','A 6-day stay in a private villa with stunning views.',5900.00,70),(77,'Okavango Delta Mokoro Trip','A 7-day traditional canoe safari.',9500.00,71),(78,'Halifax Maritime History','A 4-day tour of lighthouses, museums, and coastal towns.',1650.00,72),(79,'Ubud Rice Terraces','A 5-day photography and wellness tour.',2150.00,73),(80,'Singapore Gardens & Food','A 3-day intensive exploration of modern and natural sights.',1350.00,74),(81,'Copenhagen Hygge Lifestyle','A 4-day tour focused on Danish design and happiness.',1880.00,75),(82,'Ankara Citadel & Museum','A 4-day historical and political capital tour.',1420.00,76),(83,'Cappadocia Balloon Ride','A 5-day package centered around hot air ballooning and cave hotels.',2780.00,77),(84,'Maine Lobster & Lighthouse','A 3-day New England coastal experience.',1280.00,78),(85,'Rio Carnival Experience','A 6-day package coinciding with the famous carnival.',4950.00,79),(86,'Addis Ababa Historical Sites','A 4-day tour exploring ancient churches and museums.',2100.00,80),(87,'Cairns Reef Snorkeling','A 5-day package focusing on the Great Barrier Reef.',3450.00,81),(88,'Tokyo Modern & Tradition','A 6-day mix of neon lights, temples, and markets.',4150.00,82),(89,'Brasov Medieval Legends','A 4-day exploration of Transylvanian history.',1520.00,83),(90,'Kuala Lumpur Twin Towers','A 3-day city break focused on modern architecture and food.',1180.00,84),(91,'Port-au-Prince Art & Culture','A 5-day tour exploring local art and historical sites.',2680.00,85),(92,'Mdina Silent City Tour','A 4-day trip focusing on Maltese history and coastal beauty.',1680.00,86),(93,'Belém Amazon Gateway','A 5-day tour of the city and nearby Amazon islands.',2080.00,87),(94,'Jerusalem Holy Sites','A 6-day spiritual and historical journey.',3200.00,88),(95,'Vladivostok Coastal Exploration','A 5-day tour of Russia’s Pacific gateway.',4050.00,89),(96,'Hangzhou West Lake & Silk','A 4-day scenic and shopping tour.',1900.00,90),(97,'Cartagena Walled City','A 4-day trip exploring the colonial architecture and beaches.',1850.00,91),(98,'Bruges Canals & Chocolate','A 3-day romantic and culinary experience.',1220.00,92),(99,'Sarande Albanian Riviera','A 5-day tour of beaches and historical ruins.',1380.00,93),(100,'Khajuraho Temple Art','A 4-day deep dive into medieval Indian temple architecture.',2300.00,94),(101,'Bwindi Gorilla Trekking','A 5-day challenging trek for gorilla sightings.',8100.00,95),(102,'Baku Flame Towers','A 4-day tour exploring the mix of ancient and modern architecture.',1720.00,96),(103,'Ambon Spice & Diving','A 7-day trip focusing on the spice history and diving spots.',3650.00,97),(104,'Pittsburgh Steel & Culture','A 3-day city tour focusing on history and museums.',900.00,98),(105,'Oslo Viking & Museums','A 4-day tour focused on Norse history and modern architecture.',2550.00,99),(106,'Delhi Golden Triangle Start','A 7-day tour beginning in Delhi, covering historical highlights.',2900.00,100);
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
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transport`
--

LOCK TABLES `Transport` WRITE;
/*!40000 ALTER TABLE `Transport` DISABLE KEYS */;
INSERT INTO `Transport` VALUES (1,'Bus turístico','Viajes Caribe S.A.',1),(2,'Jeep 4x4','Aventura Andina Ltda.',2),(3,'Buggy','Desert Tours Perú',3),(4,'Lancha rápida','Amazon Tours',4),(5,'Teleférico','Nevados Sky',5),(6,'Crucero','Galápagos Cruises',6),(7,'Train','TGV/SNCF',1),(8,'Plane','Thai Airways',2),(9,'Train','Trenitalia',3),(10,'Train','SBB',4),(11,'Plane','Emirates',5),(12,'Tram','Carris',6),(13,'Train','JR Central',7),(14,'Ferry','Hurtigruten',8),(15,'Bus','Miami-Dade Transit',9),(16,'Plane','Qantas',10),(17,'Train','PeruRail',11),(18,'Seaplane','Trans Maldivian Airways',12),(19,'Underground','London Underground',13),(20,'Ferry','Jadrolinija',14),(21,'Bus','Reykjavik Excursions',15),(22,'Plane','Aerolíneas Argentinas',16),(23,'Jeep','Serengeti Safari Co.',17),(24,'Bus','TMB',18),(25,'Train','Deutsche Bahn',19),(26,'Car','Rajasthan Tours',20),(27,'Van','Interbus',21),(28,'Bus','Citylink',22),(29,'Plane','Spirit Airlines',23),(30,'Train','RZD',24),(31,'Bus','China Bus Group',25),(32,'Boat','Red Sea Charters',26),(33,'Tram','Istanbul Tram',27),(34,'Bus','Bus Sur',28),(35,'Carriage','Local Transport',29),(36,'Bus','Roam Transit',30),(37,'Boat','Amazon Cruises',31),(38,'Ferry','Blue Star Ferries',32),(39,'Bus','Connectabus',33),(40,'Motorbike Taxi','Grab',34),(41,'Bus','Dublin Bus',35),(42,'Tram','Prague Public Transit Company',36),(43,'Ferry','Tallinn Ferry',37),(44,'Ferry','Navimag',38),(45,'Plane','Hawaiian Airlines',39),(46,'Bus','JETT',40),(47,'Plane','Kenya Airways',41),(48,'Train','CFR Călători',42),(49,'Snowmobile','Local Tour Operator',43),(50,'Car','Classic Car Rental',44),(51,'Train','Uzbekistan Railways',45),(52,'Cable Car','Table Mountain Aerial Cableway',46),(53,'Bus','Seoul Metro',47),(54,'Bus','Salzburg Verkehr',48),(55,'Bus','Metropolitano de Lima',49),(56,'Plane','Aeromexico',50),(57,'Helicopter','Maverick Helicopters',51),(58,'Tram','Wiener Linien',52),(59,'Train','SNCB',53),(60,'Tram','GVB',54),(61,'Bus','CTM',55),(62,'Plane','Nepal Airlines',56),(63,'Scooter','Local Rental',57),(64,'Train','MVV',58),(65,'Bus','Transport Board',59),(66,'Train','SNCF',60),(67,'Bus','OSYPA Ltd',61),(68,'Car','Oman Luxury Rentals',62),(69,'Bus','Rea Vaya',63),(70,'Boat','Ilulissat Tour',64),(71,'Bus','AAT Kings',65),(72,'Ferry','Fullers GreatSights',66),(73,'Boat','Local Rafting Company',67),(74,'Tram','Tussam',68),(75,'Bus','Public Transit',69),(76,'Ferry','Navigazione Laghi',70),(77,'Mokoro','Local Safari Guide',71),(78,'Bus','Halifax Transit',72),(79,'Car','Bali Driver',73),(80,'MRT','SMRT',74),(81,'Train','DSB',75),(82,'Bus','EGO',76),(83,'Bus','Göreme Bus',77),(84,'Ferry','Casco Bay Lines',78),(85,'Bus','Rio Onibus',79),(86,'Taxi','Local Taxi',80),(87,'Boat','Reef Magic Cruises',81),(88,'Train','JR East',82),(89,'Cable Car','Teleferic Prahova',83),(90,'Monorail','KL Monorail',84),(91,'Bus','Tap Tap',85),(92,'Car','Local Rental',86),(93,'Ferry','Havanatur',87),(94,'Bus','Egged',88),(95,'Train','Siberian Express',89),(96,'Boat','West Lake Ferry',90),(97,'Taxi','Local Taxi',91),(98,'Train','SNCB',92),(99,'Bus','TransUnion',93),(100,'Bus','MP Tourism',94),(101,'Jeep','Local 4x4',95),(102,'Metro','Baku Metro',96),(103,'Boat','Liveaboard Dive',97),(104,'Tram','Pittsburgh Light Rail',98),(105,'Ferry','Ruter',99),(106,'Metro','Delhi Metro',100);
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

-- Dump completed on 2025-09-30  8:52:27
