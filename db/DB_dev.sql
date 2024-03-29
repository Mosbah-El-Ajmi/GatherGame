-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: localhost    Database: dev3
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `Joueurs`
--

DROP TABLE IF EXISTS `Joueurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Joueurs` (
  `id_joueur` int NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int DEFAULT NULL,
  `id_partie` int DEFAULT NULL,
  `pseudo` varchar(255) DEFAULT NULL,
  `nombre_points` int DEFAULT NULL,
  PRIMARY KEY (`id_joueur`),
  KEY `id_utilisateur` (`id_utilisateur`),
  KEY `id_partie` (`id_partie`),
  CONSTRAINT `joueurs_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `Utilisateur` (`id_compte`),
  CONSTRAINT `joueurs_ibfk_2` FOREIGN KEY (`id_partie`) REFERENCES `Partie` (`id_partie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Joueurs`
--

LOCK TABLES `Joueurs` WRITE;
/*!40000 ALTER TABLE `Joueurs` DISABLE KEYS */;
/*!40000 ALTER TABLE `Joueurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Missions`
--

DROP TABLE IF EXISTS `Missions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Missions` (
  `id_mission` int NOT NULL AUTO_INCREMENT,
  `nom_mission` varchar(50) DEFAULT NULL,
  `description_mission` text,
  `public` tinyint(1) DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  `auteur_id` int DEFAULT NULL,
  `destinataire_id` int DEFAULT NULL,
  `partie_id` int DEFAULT NULL,
  `points` int DEFAULT NULL,
  PRIMARY KEY (`id_mission`),
  KEY `partie_id` (`partie_id`),
  KEY `auteur_id` (`auteur_id`),
  KEY `destinataire_id` (`destinataire_id`),
  CONSTRAINT `missions_ibfk_1` FOREIGN KEY (`partie_id`) REFERENCES `Partie` (`id_partie`),
  CONSTRAINT `missions_ibfk_2` FOREIGN KEY (`auteur_id`) REFERENCES `Joueurs` (`id_joueur`),
  CONSTRAINT `missions_ibfk_3` FOREIGN KEY (`destinataire_id`) REFERENCES `Joueurs` (`id_joueur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Missions`
--

LOCK TABLES `Missions` WRITE;
/*!40000 ALTER TABLE `Missions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Missions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MissionsActives`
--

DROP TABLE IF EXISTS `MissionsActives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MissionsActives` (
  `id_mission_active` int NOT NULL AUTO_INCREMENT,
  `id_joueur` int DEFAULT NULL,
  `id_mission` int DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `id_status` int DEFAULT NULL,
  PRIMARY KEY (`id_mission_active`),
  KEY `id_joueur` (`id_joueur`),
  KEY `id_mission` (`id_mission`),
  KEY `id_status` (`id_status`),
  CONSTRAINT `missionsactives_ibfk_1` FOREIGN KEY (`id_joueur`) REFERENCES `Joueurs` (`id_joueur`),
  CONSTRAINT `missionsactives_ibfk_2` FOREIGN KEY (`id_mission`) REFERENCES `Missions` (`id_mission`),
  CONSTRAINT `missionsactives_ibfk_3` FOREIGN KEY (`id_status`) REFERENCES `Status` (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MissionsActives`
--

LOCK TABLES `MissionsActives` WRITE;
/*!40000 ALTER TABLE `MissionsActives` DISABLE KEYS */;
/*!40000 ALTER TABLE `MissionsActives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Partie`
--

DROP TABLE IF EXISTS `Partie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Partie` (
  `id_partie` int NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  PRIMARY KEY (`id_partie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Partie`
--

LOCK TABLES `Partie` WRITE;
/*!40000 ALTER TABLE `Partie` DISABLE KEYS */;
INSERT INTO `Partie` VALUES (1,'kot','2024-03-19'),(2,'kot','2024-03-19');
/*!40000 ALTER TABLE `Partie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Status`
--

DROP TABLE IF EXISTS `Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Status` (
  `id_status` int NOT NULL,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Status`
--

LOCK TABLES `Status` WRITE;
/*!40000 ALTER TABLE `Status` DISABLE KEYS */;
INSERT INTO `Status` VALUES (1,'active');
/*!40000 ALTER TABLE `Status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Utilisateur`
--

DROP TABLE IF EXISTS `Utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Utilisateur` (
  `id_compte` int NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Utilisateur`
--

LOCK TABLES `Utilisateur` WRITE;
/*!40000 ALTER TABLE `Utilisateur` DISABLE KEYS */;
INSERT INTO `Utilisateur` VALUES (1,'Doe','John','john.doe@example.com','test');
/*!40000 ALTER TABLE `Utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-26  0:16:29
