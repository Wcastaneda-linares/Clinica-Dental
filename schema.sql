
-- Volcando estructura de base de datos para citas_medicas
CREATE DATABASE IF NOT EXISTS `citas_medicas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `citas_medicas`;

-- Volcando estructura para tabla citas_medicas.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla citas_medicas.category: ~0 rows (aproximadamente)
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'Odontología General'),
	(2, 'Endodoncia'),
	(3, 'Cirugía Oral y Maxilofacial'),
	(4, 'Ortodoncia'),
	(5, 'Odontopediatría'),
	(6, 'Periodoncia');

-- Volcando estructura para tabla citas_medicas.medic
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla citas_medicas.medic: ~0 rows (aproximadamente)
INSERT INTO `medic` (`id`, `no`, `name`, `lastname`, `gender`, `day_of_birth`, `email`, `address`, `phone`, `image`, `is_active`, `created_at`, `category_id`) VALUES
	(1, NULL, 'Marjorie', 'Moran', NULL, NULL, 'mmorann1@miumg.edu.gt', 'Asuncion Mita ,Jutiapa', '55555555', NULL, 1, '2024-05-28 14:39:07', 1);

-- Volcando estructura para tabla citas_medicas.pacient
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla citas_medicas.pacient: ~0 rows (aproximadamente)
INSERT INTO `pacient` (`id`, `no`, `name`, `lastname`, `gender`, `day_of_birth`, `email`, `address`, `phone`, `image`, `sick`, `medicaments`, `alergy`, `is_favorite`, `is_active`, `created_at`) VALUES
	(1, NULL, 'Brandon', 'MontesFlores', 'h', '2000-01-01', 'bmontesfloresr@miumg.edu.gt', 'Asuncion Mita ,Jutiapa', '55555555', NULL, 'Extracción de Muela', 'Ninguno', 'NInguna', 1, 1, '2024-05-28 14:37:56');

-- Volcando estructura para tabla citas_medicas.payment
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla citas_medicas.payment: ~3 rows (aproximadamente)
INSERT INTO `payment` (`id`, `name`) VALUES
	(1, 'Pendiente'),
	(2, 'Pagado'),
	(3, 'Anulado');

-- Volcando estructura para tabla citas_medicas.reservation
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla citas_medicas.reservation: ~0 rows (aproximadamente)
INSERT INTO `reservation` (`id`, `title`, `note`, `message`, `date_at`, `time_at`, `created_at`, `pacient_id`, `symtoms`, `sick`, `medicaments`, `user_id`, `medic_id`, `price`, `is_web`, `payment_id`, `status_id`) VALUES
	(1, 'Extracción de Muela', '', NULL, '2024-05-28', '11:00', '2024-05-28 14:40:14', 1, 'Dolor', 'NInguna', 'Acetaminofen', 1, 1, 100, 0, 1, 3);

-- Volcando estructura para tabla citas_medicas.status
CREATE TABLE IF NOT EXISTS `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla citas_medicas.status: ~4 rows (aproximadamente)
INSERT INTO `status` (`id`, `name`) VALUES
	(1, 'Pendiente'),
	(2, 'Aplicada'),
	(3, 'No asistio'),
	(4, 'Cancelada');

-- Volcando estructura para tabla citas_medicas.user
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

-- Volcando datos para la tabla citas_medicas.user: ~0 rows (aproximadamente)
INSERT INTO `user` (`id`, `username`, `name`, `lastname`, `email`, `password`, `is_active`, `is_admin`, `created_at`) VALUES
	(1, 'admin', NULL, NULL, NULL, '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', 1, 1, '2024-05-28 14:21:51');
