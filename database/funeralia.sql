-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2023 a las 06:01:24
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `funeralia`
--

CREATE DATABASE funeralia;
USE funeralia;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion`
--

CREATE TABLE `asignacion` (
  `id_asignacion` int(11) NOT NULL COMMENT 'Identificador de la asignacion',
  `id_trabajador` int(11) NOT NULL COMMENT 'Identificador del trabajador',
  `id_servicio` int(11) NOT NULL COMMENT 'Identificador del servicio',
  `creates_at` datetime DEFAULT current_timestamp() COMMENT 'Fecha de creación de la asignación',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Fecha de eliminación de la asignación'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL COMMENT 'Identificador del cliente',
  `nombre` int(11) NOT NULL COMMENT 'Nombre completo del cliente',
  `telefono` varchar(10) NOT NULL COMMENT 'Teléfono del cliente',
  `direccion` varchar(255) NOT NULL COMMENT 'Dirección del cliente',
  `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'Fecha de creación del cliente',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Fecha de eliminación del cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gerente`
--

CREATE TABLE `gerente` (
  `id_gerente` int(11) NOT NULL COMMENT 'Identificador del gerente',
  `id_usuario` int(11) NOT NULL COMMENT 'Identificador del usuario',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Fecha de creación del gerente',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Fecha de elim,inación del gerente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mobiliario`
--

CREATE TABLE `mobiliario` (
  `id_mobiliario` int(11) NOT NULL COMMENT 'Identificador del mobiliario',
  `nombre` varchar(255) NOT NULL COMMENT 'Nombre del mobiliario',
  `descripcion` varchar(255) NOT NULL COMMENT 'Descripción del mobiliario',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Fecha de creación del mobiliario',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Fecha de eliminación del mobiliario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mobiliario_total`
--

CREATE TABLE `mobiliario_total` (
  `id_mobiliario_total` int(11) NOT NULL COMMENT 'Identificador del mobiliario total',
  `id_mobiliario` int(11) NOT NULL COMMENT 'Identificador del mobiliario',
  `cantidad` smallint(6) NOT NULL COMMENT 'Cantidad del mobiliario',
  `creates_at` datetime NOT NULL COMMENT 'Fecha de creación del mobiliario total',
  `deleted_at` datetime NOT NULL COMMENT 'Fecha de eliminación del mobiliario total'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secretaria`
--

CREATE TABLE `secretaria` (
  `id_secretaria` int(11) NOT NULL COMMENT 'Identificador de la secretaria',
  `id_usuario` int(11) NOT NULL COMMENT 'Identificador del usuario',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Fecha de creación de la secretaria',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Fecha de eliminación de la secretaría'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL COMMENT 'Identificador del servicio',
  `id_cliente` int(11) NOT NULL COMMENT 'Identificador del cliente',
  `id_mobiliario_total` int(11) NOT NULL COMMENT 'Itenficiador del mobiliario total',
  `tipo_servicio` varchar(255) NOT NULL COMMENT 'Tipo del servicio',
  `fecha_entrega` date NOT NULL COMMENT 'Fecha de ebtrega del servicio',
  `fecha_recogida` date NOT NULL COMMENT 'Fecha de recogida del servicio',
  `created_at` int(11) DEFAULT current_timestamp() COMMENT 'Fecha de creación del servicio',
  `deleted_at` int(11) DEFAULT NULL COMMENT 'Fecha de eliminación del servicio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id_tipo` int(11) NOT NULL COMMENT 'Identificador del tipo',
  `tipo` varchar(255) NOT NULL COMMENT 'Nombre del tipo',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Fecha de creación del tipo',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Fecha de eliminación del tipo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `id_trabajador` int(11) NOT NULL COMMENT 'Identificador del trabajador',
  `id_usuario` int(11) NOT NULL COMMENT 'Identificador del usuario',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Fecha de creación de del trabajador',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Fecha de eliminación del trabajador'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL COMMENT 'Identificador del usuario',
  `nombre` varchar(255) NOT NULL COMMENT 'Nombre(s) del usuario',
  `ap_pat` varchar(255) NOT NULL COMMENT 'Apellido paterno del usuario',
  `ap_mat` varchar(255) NOT NULL COMMENT 'Apellido materno del usuario',
  `telefono` char(10) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `contraseña` varchar(10) NOT NULL COMMENT 'Contraseña del usuario',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Fecha de creación del usuario',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Fecha de eliminación del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD PRIMARY KEY (`id_asignacion`),
  ADD KEY `FK_TRABAJADOR` (`id_trabajador`),
  ADD KEY `FK_SERVICIO` (`id_servicio`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `gerente`
--
ALTER TABLE `gerente`
  ADD PRIMARY KEY (`id_gerente`),
  ADD KEY `FK_USUARIO` (`id_usuario`) USING BTREE;

--
-- Indices de la tabla `mobiliario`
--
ALTER TABLE `mobiliario`
  ADD PRIMARY KEY (`id_mobiliario`);

--
-- Indices de la tabla `mobiliario_total`
--
ALTER TABLE `mobiliario_total`
  ADD PRIMARY KEY (`id_mobiliario_total`),
  ADD UNIQUE KEY `FK_MOBILIARIO` (`id_mobiliario`);

--
-- Indices de la tabla `secretaria`
--
ALTER TABLE `secretaria`
  ADD PRIMARY KEY (`id_secretaria`),
  ADD UNIQUE KEY `FK_USUARIO` (`id_usuario`) USING BTREE;

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`),
  ADD UNIQUE KEY `FK_CLIENTE` (`id_cliente`) USING BTREE,
  ADD UNIQUE KEY `FK_MOBILIARIO_TOTAL` (`id_mobiliario_total`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`id_trabajador`),
  ADD UNIQUE KEY `FK_USUARIO` (`id_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `FK_TIPO` (`id_tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  MODIFY `id_asignacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la asignacion';

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del cliente';

--
-- AUTO_INCREMENT de la tabla `gerente`
--
ALTER TABLE `gerente`
  MODIFY `id_gerente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del gerente';

--
-- AUTO_INCREMENT de la tabla `mobiliario`
--
ALTER TABLE `mobiliario`
  MODIFY `id_mobiliario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del mobiliario';

--
-- AUTO_INCREMENT de la tabla `mobiliario_total`
--
ALTER TABLE `mobiliario_total`
  MODIFY `id_mobiliario_total` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del mobiliario total';

--
-- AUTO_INCREMENT de la tabla `secretaria`
--
ALTER TABLE `secretaria`
  MODIFY `id_secretaria` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la secretaria';

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del servicio';

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del tipo';

--
-- AUTO_INCREMENT de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  MODIFY `id_trabajador` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del trabajador';

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del usuario';

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD CONSTRAINT `asignacion_ibfk_1` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajador` (`id_trabajador`),
  ADD CONSTRAINT `asignacion_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`);

--
-- Filtros para la tabla `gerente`
--
ALTER TABLE `gerente`
  ADD CONSTRAINT `gerente_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `mobiliario_total`
--
ALTER TABLE `mobiliario_total`
  ADD CONSTRAINT `mobiliario_total_ibfk_1` FOREIGN KEY (`id_mobiliario`) REFERENCES `mobiliario` (`id_mobiliario`);

--
-- Filtros para la tabla `secretaria`
--
ALTER TABLE `secretaria`
  ADD CONSTRAINT `secretaria_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`id_mobiliario_total`) REFERENCES `mobiliario_total` (`id_mobiliario_total`),
  ADD CONSTRAINT `servicio_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD CONSTRAINT `tipo_usuario_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD CONSTRAINT `trabajador_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
