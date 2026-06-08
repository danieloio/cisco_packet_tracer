-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 08-06-2026 a las 15:13:18
-- Versión del servidor: 10.11.14-MariaDB-0ubuntu0.24.04.1
-- Versión de PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresa_multisede`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id_departamento` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id_departamento`, `nombre`, `descripcion`) VALUES
(1, 'Sistemas', 'Administracion de infraestructura IT'),
(2, 'Redes', 'Gestion de redes y conectividad'),
(3, 'Soporte', 'Atencion y resolucion de incidencias'),
(4, 'Base de Datos', 'Administracion y mantenimiento de BBDD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `salario` decimal(8,2) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `id_sede` int(11) DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre`, `apellidos`, `email`, `telefono`, `cargo`, `salario`, `fecha_alta`, `id_sede`, `id_departamento`) VALUES
(1, 'Carlos', 'Garcia Lopez', 'carlos.garcia@empresa.com', '+34 611 111 111', 'Administrador de Sistemas', 32000.00, '2022-01-15', 1, 1),
(2, 'Laura', 'Martinez Ruiz', 'laura.martinez@empresa.com', '+34 622 222 222', 'Tecnico de Redes', 28000.00, '2022-03-10', 1, 2),
(3, 'Pedro', 'Sanchez Gil', 'pedro.sanchez@empresa.com', '+34 633 333 333', 'Tecnico de Soporte', 24000.00, '2023-06-01', 2, 3),
(4, 'Ana', 'Lopez Fernandez', 'ana.lopez@empresa.com', '+34 644 444 444', 'DBA Junior', 26000.00, '2023-09-15', 2, 4),
(5, 'Miguel', 'Torres Alba', 'miguel.torres@empresa.com', '+34 655 555 555', 'Administrador de Redes', 31000.00, '2021-11-20', 3, 2),
(6, 'Sofia', 'Ramos Vega', 'sofia.ramos@empresa.com', '+34 666 666 666', 'Tecnico de Soporte', 24000.00, '2024-01-08', 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id_equipo` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `numero_serie` varchar(100) DEFAULT NULL,
  `estado` enum('activo','baja','reparacion') DEFAULT 'activo',
  `id_sede` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_equipo`, `tipo`, `marca`, `modelo`, `numero_serie`, `estado`, `id_sede`, `id_empleado`) VALUES
(1, 'Servidor', 'Dell', 'PowerEdge R740', 'SRV-MAD-001', 'activo', 1, 1),
(2, 'Switch', 'Cisco', '3650-24PS', 'SW-MAD-001', 'activo', 1, 2),
(3, 'Laptop', 'Lenovo', 'ThinkPad T14', 'LT-BCN-001', 'activo', 2, 3),
(4, 'Laptop', 'Lenovo', 'ThinkPad T14', 'LT-BCN-002', 'activo', 2, 4),
(5, 'Router', 'Cisco', 'ISR 4331', 'RT-VLC-001', 'activo', 3, 5),
(6, 'Laptop', 'HP', 'EliteBook 840', 'LT-VLC-001', 'reparacion', 3, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `id_sede` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`id_sede`, `nombre`, `ciudad`, `direccion`, `telefono`) VALUES
(1, 'Sede Central', 'Madrid', 'Calle Gran Via 45', '+34 910 123 456'),
(2, 'Sede Barcelona', 'Barcelona', 'Avenida Diagonal 200', '+34 930 123 456'),
(3, 'Sede Valencia', 'Valencia', 'Calle Colon 12', '+34 960 123 456');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_sede` (`id_sede`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id_equipo`),
  ADD UNIQUE KEY `numero_serie` (`numero_serie`),
  ADD KEY `id_sede` (`id_sede`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`id_sede`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `id_sede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sedes` (`id_sede`),
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`);

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `equipos_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sedes` (`id_sede`),
  ADD CONSTRAINT `equipos_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
