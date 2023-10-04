-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-10-2023 a las 03:45:50
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hogwarts`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casa_preferencia`
--

CREATE TABLE `casa_preferencia` (
  `id_Casa_de_preferencia` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deporte_preferencia`
--

CREATE TABLE `deporte_preferencia` (
  `id_Deporte_de_preferencia` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad_interes`
--

CREATE TABLE `especialidad_interes` (
  `id_Especialidad_de_interes` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hogwarts_entry_form`
--

CREATE TABLE `hogwarts_entry_form` (
  `id_SOLICITUD_DE_ADMISION_A_HOGWARTS` int(10) UNSIGNED NOT NULL,
  `Nombre_y_Apellido` varchar(40) NOT NULL,
  `Fecha_Nac` date DEFAULT NULL,
  `Nacionalidad` varchar(16) NOT NULL,
  `id_Casa_de_preferencia` varchar(4) NOT NULL,
  `id_Especialidad_de_interes` varchar(7) NOT NULL,
  `id_Deporte_de_preferencia` varchar(4) NOT NULL,
  `Familiar_mago` enum('2') NOT NULL,
  `Correo_electronico` varchar(50) NOT NULL,
  `Porque_ingresar` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hogwarts_form`
--

CREATE TABLE `hogwarts_form` (
  `id_SOLICITUD_DE_ADMISION_A_HOGWARTS` int(10) UNSIGNED NOT NULL,
  `Nombre_y_Apellido` varchar(40) NOT NULL,
  `Fecha_Nac` date DEFAULT NULL,
  `Nacionalidad` varchar(16) NOT NULL,
  `id_Casa_de_preferencia` varchar(4) NOT NULL,
  `id_Especialidad_de_interes` varchar(7) NOT NULL,
  `id_Deporte_de_preferencia` varchar(4) NOT NULL,
  `Familiar_mago` enum('Si,No') NOT NULL,
  `Correo_electronico` varchar(50) NOT NULL,
  `Porque_ingresar` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `casa_preferencia`
--
ALTER TABLE `casa_preferencia`
  ADD PRIMARY KEY (`id_Casa_de_preferencia`);

--
-- Indices de la tabla `deporte_preferencia`
--
ALTER TABLE `deporte_preferencia`
  ADD PRIMARY KEY (`id_Deporte_de_preferencia`);

--
-- Indices de la tabla `especialidad_interes`
--
ALTER TABLE `especialidad_interes`
  ADD PRIMARY KEY (`id_Especialidad_de_interes`);

--
-- Indices de la tabla `hogwarts_entry_form`
--
ALTER TABLE `hogwarts_entry_form`
  ADD PRIMARY KEY (`id_SOLICITUD_DE_ADMISION_A_HOGWARTS`);

--
-- Indices de la tabla `hogwarts_form`
--
ALTER TABLE `hogwarts_form`
  ADD PRIMARY KEY (`id_SOLICITUD_DE_ADMISION_A_HOGWARTS`),
  ADD KEY `fk_Casa_de_preferencia` (`id_Casa_de_preferencia`),
  ADD KEY `fk_Especialidad_de_interes` (`id_Especialidad_de_interes`),
  ADD KEY `fk_Deporte_preferencia` (`id_Deporte_de_preferencia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `hogwarts_entry_form`
--
ALTER TABLE `hogwarts_entry_form`
  MODIFY `id_SOLICITUD_DE_ADMISION_A_HOGWARTS` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hogwarts_form`
--
ALTER TABLE `hogwarts_form`
  MODIFY `id_SOLICITUD_DE_ADMISION_A_HOGWARTS` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `hogwarts_form`
--
ALTER TABLE `hogwarts_form`
  ADD CONSTRAINT `fk_Casa_de_preferencia` FOREIGN KEY (`id_Casa_de_preferencia`) REFERENCES `casa_preferencia` (`id_Casa_de_preferencia`),
  ADD CONSTRAINT `fk_Deporte_preferencia` FOREIGN KEY (`id_Deporte_de_preferencia`) REFERENCES `deporte_preferencia` (`id_Deporte_de_preferencia`),
  ADD CONSTRAINT `fk_Especialidad_de_interes` FOREIGN KEY (`id_Especialidad_de_interes`) REFERENCES `especialidad_interes` (`id_Especialidad_de_interes`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
