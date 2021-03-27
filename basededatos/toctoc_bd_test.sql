-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-03-2021 a las 17:34:39
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `toctoc_bd_test`
--
CREATE DATABASE IF NOT EXISTS `toctoc_bd_test` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `toctoc_bd_test`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE `bancos` (
  `BANCO_ID` int(11) NOT NULL,
  `BANCO_NOMBRE` varchar(120) NOT NULL,
  `BANCO_CODIGO` varchar(100) NOT NULL,
  `BANCO_ESTADO` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`BANCO_ID`, `BANCO_NOMBRE`, `BANCO_CODIGO`, `BANCO_ESTADO`) VALUES
(1, 'Banco de Chile', 'MP67QY3MQNAWWNU84K', 1),
(2, 'Banco Falabella', 'MVYJD7ASXUVNCAQPM6', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunas`
--

CREATE TABLE `comunas` (
  `COMUNA_ID` int(11) NOT NULL,
  `COMUNA_NOMBRE` varchar(120) NOT NULL,
  `COMUNA_ESTADO` int(11) NOT NULL,
  `REGIONES_REGION_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comunas`
--

INSERT INTO `comunas` (`COMUNA_ID`, `COMUNA_NOMBRE`, `COMUNA_ESTADO`, `REGIONES_REGION_ID`) VALUES
(1, 'La Cisterna', 1, 1),
(2, 'Santiago', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_horarios`
--

CREATE TABLE `control_horarios` (
  `CONTROL_HORARIO_ID` int(11) NOT NULL,
  `CONTROL_HORARIO_DIA` date NOT NULL,
  `CONTROL_HORARIO_ENTRADA` time NOT NULL,
  `CONTROL_HORARIO_SALIDA` time DEFAULT NULL,
  `CONTROL_HORARIO_OBSERVACION` text DEFAULT NULL,
  `CONTROL_HORARIO_ESTADO` int(11) NOT NULL,
  `EMPLEADOS_EMPLEADO_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `control_horarios`
--

INSERT INTO `control_horarios` (`CONTROL_HORARIO_ID`, `CONTROL_HORARIO_DIA`, `CONTROL_HORARIO_ENTRADA`, `CONTROL_HORARIO_SALIDA`, `CONTROL_HORARIO_OBSERVACION`, `CONTROL_HORARIO_ESTADO`, `EMPLEADOS_EMPLEADO_ID`) VALUES
(5, '2021-03-26', '10:00:00', '19:00:00', 'Llega atrasado 1 hora', 1, 5),
(6, '2021-03-27', '09:00:00', '22:00:00', 'Se queda trabajando 3 horas extras.', 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `EMPLEADO_ID` int(11) NOT NULL,
  `EMPLEADO_ESTADO` int(11) NOT NULL,
  `SUCURSALES_SUCURSAL_ID` int(11) NOT NULL,
  `TRABAJADORES_TRABAJADOR_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`EMPLEADO_ID`, `EMPLEADO_ESTADO`, `SUCURSALES_SUCURSAL_ID`, `TRABAJADORES_TRABAJADOR_ID`) VALUES
(5, 1, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `PAIS_ID` int(11) NOT NULL,
  `PAIS_NOMBRE` varchar(120) NOT NULL,
  `PAIS_ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`PAIS_ID`, `PAIS_NOMBRE`, `PAIS_ESTADO`) VALUES
(1, 'Chile', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regiones`
--

CREATE TABLE `regiones` (
  `REGION_ID` int(11) NOT NULL,
  `REGION_NOMBRE` varchar(120) NOT NULL,
  `REGION_ESTADO` int(11) NOT NULL,
  `PAISES_PAIS_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `regiones`
--

INSERT INTO `regiones` (`REGION_ID`, `REGION_NOMBRE`, `REGION_ESTADO`, `PAISES_PAIS_ID`) VALUES
(1, 'Región Metropolitana', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes_diarios`
--

CREATE TABLE `reportes_diarios` (
  `REPORTE_DIARIO_ID` int(11) NOT NULL,
  `REPORTE_DIARIO_DIA` date NOT NULL,
  `REPORTE_DIARIO_OBSERVACIONES` text NOT NULL,
  `SUCURSALES_SUCURSAL_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reportes_diarios`
--

INSERT INTO `reportes_diarios` (`REPORTE_DIARIO_ID`, `REPORTE_DIARIO_DIA`, `REPORTE_DIARIO_OBSERVACIONES`, `SUCURSALES_SUCURSAL_ID`) VALUES
(1, '2021-03-26', 'Incidente con asaltante, se llamó a carabineros y estos llegaron a controlar la situación. 17:00.', 1),
(2, '2021-03-27', 'El día estuvo bastante tranquilo en general', 1),
(3, '2021-03-26', 'Todo ok.', 2),
(4, '2021-03-27', 'Un canino ingreso en la sucursal, fue prontamente despachado: 10:00.', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `SUCURSAL_ID` int(11) NOT NULL,
  `SUCURSAL_NOMBRE` varchar(120) NOT NULL,
  `SUCURSAL_CODIGO` varchar(100) NOT NULL,
  `SUCURSAL_DIRECCION` varchar(150) NOT NULL,
  `SUCURSAL_ESTADO` int(11) NOT NULL,
  `BANCOS_BANCO_ID` int(11) NOT NULL,
  `COMUNAS_COMUNA_ID` int(11) NOT NULL,
  `VIGILANTES_VIGILANTE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`SUCURSAL_ID`, `SUCURSAL_NOMBRE`, `SUCURSAL_CODIGO`, `SUCURSAL_DIRECCION`, `SUCURSAL_ESTADO`, `BANCOS_BANCO_ID`, `COMUNAS_COMUNA_ID`, `VIGILANTES_VIGILANTE_ID`) VALUES
(1, 'Banco Falabella - Intermodal La Cisterna', 'YL6VJF3NA8D6YHPQMK', 'Av. Américo Vespucio 33, La Cisterna, Región Metropolitana', 1, 2, 1, 1),
(2, 'Banco de Chile Casa Matriz', 'XVSX3V64YMX5JV3DBX', 'Paseo Ahumada 251, Santiago, Región Metropolitana', 1, 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE `trabajadores` (
  `TRABAJADOR_ID` int(11) NOT NULL,
  `TRABAJADOR_RUT` varchar(12) NOT NULL,
  `TRABAJADOR_NOMBRE` varchar(120) NOT NULL,
  `TRABAJADOR_EDAD` int(11) DEFAULT NULL,
  `TRABAJADOR_ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `trabajadores`
--

INSERT INTO `trabajadores` (`TRABAJADOR_ID`, `TRABAJADOR_RUT`, `TRABAJADOR_NOMBRE`, `TRABAJADOR_EDAD`, `TRABAJADOR_ESTADO`) VALUES
(1, '18.610.349-1', 'Enrique Solis', 26, 1),
(2, '8.004.271-K', 'Juan Perez', 50, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `USUARIO_ID` int(11) NOT NULL,
  `USUARIO_EMAIL` varchar(120) NOT NULL,
  `USUARIO_PASS` varchar(64) NOT NULL,
  `TRABAJADORES_TRABAJADOR_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`USUARIO_ID`, `USUARIO_EMAIL`, `USUARIO_PASS`, `TRABAJADORES_TRABAJADOR_ID`) VALUES
(1, 'enrique@micorreo.pro', '6AH47C7TXDLRJ8YAGAQYR2UJEQ2LUQC624XX4HCT7DD4EYTJKQVC3WNJFYZ7D93E', 1),
(2, 'bn969e@gmail.com', '32Y5EK3JAR8HANBGYF8SN3WT6YP4HP5AGHG9ZXA6S9C9UF9H7J4LXLHEGVLRQJEC', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vigilantes`
--

CREATE TABLE `vigilantes` (
  `VIGILANTE_ID` int(11) NOT NULL,
  `VIGILANTE_FECHA_CONTRATACION` date NOT NULL,
  `VIGILANTE_ESTADO` int(11) NOT NULL,
  `TRABAJADORES_TRABAJADOR_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vigilantes`
--

INSERT INTO `vigilantes` (`VIGILANTE_ID`, `VIGILANTE_FECHA_CONTRATACION`, `VIGILANTE_ESTADO`, `TRABAJADORES_TRABAJADOR_ID`) VALUES
(1, '2021-03-27', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`BANCO_ID`),
  ADD UNIQUE KEY `BANCO_CODIGO_UNIQUE` (`BANCO_CODIGO`);

--
-- Indices de la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD PRIMARY KEY (`COMUNA_ID`),
  ADD KEY `fk_COMUNAS_REGIONES1_idx` (`REGIONES_REGION_ID`);

--
-- Indices de la tabla `control_horarios`
--
ALTER TABLE `control_horarios`
  ADD PRIMARY KEY (`CONTROL_HORARIO_ID`),
  ADD KEY `fk_CONTROL_HORARIOS_EMPLEADOS1_idx` (`EMPLEADOS_EMPLEADO_ID`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`EMPLEADO_ID`),
  ADD KEY `fk_EMPLEADOS_SUCURSALES1_idx` (`SUCURSALES_SUCURSAL_ID`),
  ADD KEY `fk_EMPLEADOS_TRABAJADORES1_idx` (`TRABAJADORES_TRABAJADOR_ID`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`PAIS_ID`);

--
-- Indices de la tabla `regiones`
--
ALTER TABLE `regiones`
  ADD PRIMARY KEY (`REGION_ID`),
  ADD KEY `fk_REGIONES_PAISES1_idx` (`PAISES_PAIS_ID`);

--
-- Indices de la tabla `reportes_diarios`
--
ALTER TABLE `reportes_diarios`
  ADD PRIMARY KEY (`REPORTE_DIARIO_ID`),
  ADD KEY `fk_REPORTES_DIARIOS_SUCURSALES1_idx` (`SUCURSALES_SUCURSAL_ID`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`SUCURSAL_ID`),
  ADD UNIQUE KEY `SUCURSAL_CODIGO_UNIQUE` (`SUCURSAL_CODIGO`),
  ADD KEY `fk_SUCURSALES_BANCOS_idx` (`BANCOS_BANCO_ID`),
  ADD KEY `fk_SUCURSALES_COMUNAS1_idx` (`COMUNAS_COMUNA_ID`),
  ADD KEY `fk_SUCURSALES_VIGILANTES1_idx` (`VIGILANTES_VIGILANTE_ID`);

--
-- Indices de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`TRABAJADOR_ID`),
  ADD UNIQUE KEY `TRABAJADOR_RUT_UNIQUE` (`TRABAJADOR_RUT`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`USUARIO_ID`),
  ADD KEY `fk_USUARIOS_TRABAJADORES1_idx` (`TRABAJADORES_TRABAJADOR_ID`);

--
-- Indices de la tabla `vigilantes`
--
ALTER TABLE `vigilantes`
  ADD PRIMARY KEY (`VIGILANTE_ID`),
  ADD KEY `fk_VIGILANTES_TRABAJADORES1_idx` (`TRABAJADORES_TRABAJADOR_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `BANCO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `comunas`
--
ALTER TABLE `comunas`
  MODIFY `COMUNA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `control_horarios`
--
ALTER TABLE `control_horarios`
  MODIFY `CONTROL_HORARIO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `EMPLEADO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `PAIS_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `regiones`
--
ALTER TABLE `regiones`
  MODIFY `REGION_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `reportes_diarios`
--
ALTER TABLE `reportes_diarios`
  MODIFY `REPORTE_DIARIO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `SUCURSAL_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  MODIFY `TRABAJADOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `USUARIO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vigilantes`
--
ALTER TABLE `vigilantes`
  MODIFY `VIGILANTE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD CONSTRAINT `fk_COMUNAS_REGIONES1` FOREIGN KEY (`REGIONES_REGION_ID`) REFERENCES `regiones` (`REGION_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `control_horarios`
--
ALTER TABLE `control_horarios`
  ADD CONSTRAINT `fk_CONTROL_HORARIOS_EMPLEADOS1` FOREIGN KEY (`EMPLEADOS_EMPLEADO_ID`) REFERENCES `empleados` (`EMPLEADO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `fk_EMPLEADOS_SUCURSALES1` FOREIGN KEY (`SUCURSALES_SUCURSAL_ID`) REFERENCES `sucursales` (`SUCURSAL_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_EMPLEADOS_TRABAJADORES1` FOREIGN KEY (`TRABAJADORES_TRABAJADOR_ID`) REFERENCES `trabajadores` (`TRABAJADOR_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `regiones`
--
ALTER TABLE `regiones`
  ADD CONSTRAINT `fk_REGIONES_PAISES1` FOREIGN KEY (`PAISES_PAIS_ID`) REFERENCES `paises` (`PAIS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reportes_diarios`
--
ALTER TABLE `reportes_diarios`
  ADD CONSTRAINT `fk_REPORTES_DIARIOS_SUCURSALES1` FOREIGN KEY (`SUCURSALES_SUCURSAL_ID`) REFERENCES `sucursales` (`SUCURSAL_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD CONSTRAINT `fk_SUCURSALES_BANCOS` FOREIGN KEY (`BANCOS_BANCO_ID`) REFERENCES `bancos` (`BANCO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_SUCURSALES_COMUNAS1` FOREIGN KEY (`COMUNAS_COMUNA_ID`) REFERENCES `comunas` (`COMUNA_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_SUCURSALES_VIGILANTES1` FOREIGN KEY (`VIGILANTES_VIGILANTE_ID`) REFERENCES `vigilantes` (`VIGILANTE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_USUARIOS_TRABAJADORES1` FOREIGN KEY (`TRABAJADORES_TRABAJADOR_ID`) REFERENCES `trabajadores` (`TRABAJADOR_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vigilantes`
--
ALTER TABLE `vigilantes`
  ADD CONSTRAINT `fk_VIGILANTES_TRABAJADORES1` FOREIGN KEY (`TRABAJADORES_TRABAJADOR_ID`) REFERENCES `trabajadores` (`TRABAJADOR_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
