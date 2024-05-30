-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for citas_medicas
CREATE DATABASE IF NOT EXISTS `citas_medicas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `citas_medicas`;

-- Dumping structure for table citas_medicas.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table citas_medicas.category: ~8 rows (approximately)
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'Odontología General'),
	(2, 'Endodoncia'),
	(3, 'Cirugía Oral y Maxilofacial'),
	(4, 'Ortodoncia'),
	(5, 'Odontopediatría'),
	(6, 'Periodoncia'),
	(7, 'Odontología Preventiva'),
	(8, 'Odontología Estética'),
	(9, 'Prostodoncia');

-- Dumping structure for table citas_medicas.medic
CREATE TABLE IF NOT EXISTS `medic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `day_of_birth` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `medic_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table citas_medicas.medic: ~9 rows (approximately)
INSERT INTO `medic` (`id`, `no`, `name`, `lastname`, `gender`, `day_of_birth`, `email`, `address`, `phone`, `image`, `is_active`, `created_at`, `category_id`) VALUES
	(1, NULL, 'Marjorie', 'Moran', NULL, NULL, 'mmorann1@miumg.edu.gt', 'Asuncion Mita, Jutiapa', '45678900', NULL, 1, '2024-05-28 14:39:07', 1),
	(2, NULL, 'Ivonne ', 'Torres', NULL, NULL, 'ivonne@gmail.com', 'Asunción Mita, Jutiapa', '12345678', NULL, 1, '2024-05-29 13:24:08', 1),
	(3, NULL, 'Eddie ', 'Gil', NULL, NULL, 'eddie@gmail.com', 'Asunción Mita, Jutiapa', '87654321', NULL, 1, '2024-05-29 13:24:56', 1),
	(4, NULL, 'Karen', 'Trejo', NULL, NULL, 'karen@gmail.com', 'Jutiapa', '11223344', NULL, 1, '2024-05-29 13:31:35', 4),
	(5, NULL, 'Iris', 'Damian', NULL, NULL, 'iris@gmail.com', 'Asunción Mita, Jutiapa', '55667788', NULL, 1, '2024-05-29 13:33:44', 8),
	(6, NULL, 'Paola', 'Agustín', NULL, NULL, 'paola@gmail.com', 'Asunción Mita, Jutiapa', '34561234', NULL, 1, '2024-05-29 13:34:13', 8),
	(7, NULL, 'Jazmin', 'Gasparico', NULL, NULL, 'jazmin@gmail.com', 'Asunción Mita, Jutiapa', '67852356', NULL, 1, '2024-05-29 13:35:24', 8),
	(8, NULL, 'Febe', 'Ramírez', NULL, NULL, 'febe@gmail.com', 'Asunción Mita, Jutiapa', '99004567', NULL, 1, '2024-05-29 13:36:19', 8),
	(9, NULL, 'Josselin', 'Asabayes', NULL, NULL, 'josseline@gmail.com', 'Asunción Mita, Jutiapa', '55789012', NULL, 1, '2024-05-29 13:36:52', 8),
	(10, NULL, 'Sergio', 'Alarcón', NULL, NULL, 'sergio@gmail.com', 'Ciudad Capital', '44562390', NULL, 1, '2024-05-29 13:40:14', 3),
	(11, NULL, 'Medory', 'Cerritos', NULL, NULL, 'medory@gmail.com', 'Ciudad Capital', '45678912', NULL, 1, '2024-05-29 13:55:40', 3);

-- Dumping structure for table citas_medicas.pacient
CREATE TABLE IF NOT EXISTS `pacient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `day_of_birth` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sick` varchar(500) DEFAULT NULL,
  `medicaments` varchar(500) DEFAULT NULL,
  `alergy` varchar(500) DEFAULT NULL,
  `is_favorite` tinyint(1) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table citas_medicas.pacient: ~5 rows (approximately)
INSERT INTO `pacient` (`id`, `no`, `name`, `lastname`, `gender`, `day_of_birth`, `email`, `address`, `phone`, `image`, `sick`, `medicaments`, `alergy`, `is_favorite`, `is_active`, `created_at`) VALUES
	(1, NULL, 'Brandon', 'Montesflores', 'h', '2000-01-01', 'bjoshuamr@gmail.com', 'Asuncion Mita, Jutiapa', '55090807', NULL, 'Ninguna', 'Ninguno', 'Ninguna', 1, 1, '2024-05-28 14:37:56'),
	(2, NULL, 'Gilberto', 'Rodríguez', 'h', '1985-06-30', 'gilberto@gmail.com', 'Asunción Mita, Jutiapa', '56782314', NULL, 'Periodontal', 'Ninguno', 'Ninguno', 1, 1, '2024-05-30 09:16:57'),
	(3, NULL, 'Elias', 'Vásquez', 'h', '2000-12-10', 'elias@gmail.com', 'Ciudad Capital', '67890934', NULL, 'Asma', 'Ninguno', 'Ninguna', 1, 1, '2024-05-30 13:15:31'),
	(4, NULL, 'María', 'López', 'm', '2010-11-26', 'maria@gmail.com', 'Asuncion Mita, Jutiapa', '12567802', NULL, 'Pre diabetes', 'Ninguno', 'Anestesia', 1, 1, '2024-05-30 14:11:48'),
	(5, NULL, 'Andrea', 'Martínez', 'm', '1990-12-31', 'andrea@gmail.com', 'Asuncion Mita, Jutiapa', '55673412', NULL, 'Diabetes', 'Controlados', 'Ninguna', 1, 1, '2024-05-30 14:14:12');

-- Dumping structure for table citas_medicas.payment
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table citas_medicas.payment: ~3 rows (approximately)
INSERT INTO `payment` (`id`, `name`) VALUES
	(1, 'Pendiente'),
	(2, 'Pagado'),
	(3, 'Anulado');

-- Dumping structure for table citas_medicas.reservation
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `note` text,
  `message` text,
  `date_at` varchar(50) DEFAULT NULL,
  `time_at` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `pacient_id` int DEFAULT NULL,
  `symtoms` text,
  `sick` text,
  `medicaments` text,
  `user_id` int DEFAULT NULL,
  `medic_id` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `is_web` tinyint(1) NOT NULL DEFAULT '0',
  `payment_id` int NOT NULL DEFAULT '1',
  `status_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `payment_id` (`payment_id`),
  KEY `status_id` (`status_id`),
  KEY `user_id` (`user_id`),
  KEY `pacient_id` (`pacient_id`),
  KEY `medic_id` (`medic_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`pacient_id`) REFERENCES `pacient` (`id`),
  CONSTRAINT `reservation_ibfk_5` FOREIGN KEY (`medic_id`) REFERENCES `medic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table citas_medicas.reservation: ~5 rows (approximately)
INSERT INTO `reservation` (`id`, `title`, `note`, `message`, `date_at`, `time_at`, `created_at`, `pacient_id`, `symtoms`, `sick`, `medicaments`, `user_id`, `medic_id`, `price`, `is_web`, `payment_id`, `status_id`) VALUES
	(1, 'Extracción de Muela', '', NULL, '2024-05-28', '11:00', '2024-05-28 14:40:14', 1, 'Dolor', 'Ninguna', 'Acetaminofen', 1, 1, 100, 0, 1, 3),
	(12, 'Limpieza', 'Continuar tratamiento', NULL, '2024-06-02', '18:50', '2024-05-29 17:46:50', 1, 'Ninguno', 'Ninguna', 'Ninguno', 1, 4, 125, 0, 1, 2),
	(13, 'Relleno', 'Urgente', NULL, '2024-06-03', '12:45', '2024-05-29 18:46:19', 1, 'Ninguno', 'Ninguna', 'Ninguno', 1, 2, 250, 0, 1, 2),
	(14, 'Recuperación de encillas', 'Inicio tratamiento', NULL, '2024-06-08', '09:20', '2024-05-30 09:18:55', 2, 'Ninguno', 'Periodontal', 'Ninguno', 1, 3, 300, 0, 1, 2),
	(15, 'Extracción', 'Urgente', NULL, '2024-06-08', '16:00', '2024-05-30 16:01:04', 5, 'Dolor', 'Diabetes', 'Anestesia', 1, 10, 500, 0, 1, 1);

-- Dumping structure for table citas_medicas.status
CREATE TABLE IF NOT EXISTS `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table citas_medicas.status: ~4 rows (approximately)
INSERT INTO `status` (`id`, `name`) VALUES
	(1, 'Pendiente'),
	(2, 'Aplicada'),
	(3, 'No asistio'),
	(4, 'Cancelada');

-- Dumping structure for table citas_medicas.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table citas_medicas.user: ~0 rows (approximately)
INSERT INTO `user` (`id`, `username`, `name`, `lastname`, `email`, `password`, `is_active`, `is_admin`, `created_at`) VALUES
	(1, 'admin', NULL, NULL, NULL, '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', 1, 1, '2024-05-28 14:21:51');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
