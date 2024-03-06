/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE IF NOT EXISTS `citas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_paciente` int NOT NULL,
  `id_doctor` int NOT NULL,
  `id_especialidad` int NOT NULL,
  `observacion` varchar(250) NOT NULL,
  `estado` int NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `estado` (`estado`),
  CONSTRAINT `FK_citas_estado` FOREIGN KEY (`estado`) REFERENCES `estado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `citas` (`id`, `fecha`, `hora`, `id_paciente`, `id_doctor`, `id_especialidad`, `observacion`, `estado`, `fecha_registro`) VALUES
	(11, '2024-03-05', '19:05:00', 2, 6, 7, 'primero ', 1, '2024-03-06 23:05:51');

CREATE TABLE IF NOT EXISTS `doctor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cedula` varchar(50) DEFAULT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `id_especialidad` int NOT NULL,
  `sexo` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_especialidad` (`id_especialidad`),
  CONSTRAINT `FK_doctor_especialidades` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `doctor` (`id`, `cedula`, `nombres`, `id_especialidad`, `sexo`, `telefono`, `fecha`, `fecha_registro`, `correo`) VALUES
	(6, '101', 'mariana', 8, 'Masculino', '99111656701', '2022-09-05', '2022-09-05 15:56:14', 'mugarte5672@gmail.com'),
	(7, '8', 'pedro', 5, 'Masculino', '99111656701', '2023-08-19', '2023-08-19 14:54:13', 'lex@hotmail.com'),
	(9, '57', 'miguel', 6, 'Masculino', '99111656701', '2023-08-19', '2023-08-19 14:58:13', 'lex@hotmail.com');

CREATE TABLE IF NOT EXISTS `especialidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `especialidades` (`id`, `nombre`, `fecha`) VALUES
	(1, 'Medicina General', '2022-08-25 01:20:04'),
	(5, 'Cardiologia', '2022-08-25 01:51:36'),
	(6, 'Pediatria', '2022-08-25 01:51:51'),
	(7, 'Dermatologia', '2022-08-25 06:11:51'),
	(8, 'Odontologia', '2022-08-25 16:46:32'),
	(9, 'Fisioterapia', '2023-08-19 15:20:32');

CREATE TABLE IF NOT EXISTS `estado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `estado` (`id`, `estado`) VALUES
	(1, 'Atendido'),
	(2, 'Pendiente');

CREATE TABLE IF NOT EXISTS `horario` (
  `id` int NOT NULL,
  `dias` varchar(50) NOT NULL,
  `id_doctor` int NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_doctor` (`id_doctor`),
  CONSTRAINT `FK_horario_doctor` FOREIGN KEY (`id_doctor`) REFERENCES `doctor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `horario` (`id`, `dias`, `id_doctor`, `fecha`) VALUES
	(1, 'Lunes, Jueves, Sabado', 6, '2022-08-25 06:02:19'),
	(4, 'Domingos, Lunes, Viernes', 7, '2022-08-25 16:44:49'),
	(5, 'Martes', 9, '2023-08-19 15:22:47');

CREATE TABLE IF NOT EXISTS `pacientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `sexo` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `pacientes` (`id`, `nombre`, `sexo`, `correo`, `telefono`, `fecha`, `estado`) VALUES
	(1, 'Johan', 'Masculino', 'usuario@gmail.com', '773', '2022-08-25 14:47:15', 'Pendiente'),
	(2, 'Francisco', 'Masculino', 'yomero@gmail.com', '78637832', '2022-08-25 16:48:03', 'Atendido'),
	(3, 'Juan', 'Masculino', 'Usuario@gmail.com', '1654684', '2022-08-27 13:33:30', 'Pendiente'),
	(4, 'Ernesto Cruz', 'Masculino', 'ernesto24@gmail.com', '99111656701', '2022-08-29 16:10:09', 'Pendiente'),
	(5, 'usuario', 'Masculino', 'campos12@gmail.com', '99111656701', '2023-08-19 15:19:49', 'Pendiente');

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `roles` (`id`, `rol`) VALUES
	(1, 'Administrador'),
	(2, 'Empleado'),
	(3, 'Paciente');

CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rol` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`),
  KEY `rol` (`rol`),
  CONSTRAINT `FK_user_roles` FOREIGN KEY (`rol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `user` (`id`, `nombre`, `correo`, `password`, `fecha`, `rol`) VALUES
	(1, 'user', 'usuario@gmail.com', '12345', '2022-08-27 16:43:37', 2),
	(2, 'Administrador', 'admin@admin.com', '12345', '2022-08-29 14:22:36', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
