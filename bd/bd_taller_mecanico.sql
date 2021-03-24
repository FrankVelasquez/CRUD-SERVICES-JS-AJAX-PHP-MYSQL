-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-03-2021 a las 01:56:25
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_taller_mecanico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbcotizaciones`
--

CREATE TABLE `tbcotizaciones` (
  `Num_Cot` int(11) NOT NULL COMMENT 'Numero Cotizacion',
  `Cod_Serv` varchar(50) DEFAULT NULL COMMENT 'Codigo del Servivio',
  `Ced_Cli` varchar(50) NOT NULL COMMENT 'Cedula del Cliente',
  `Placa` varchar(50) NOT NULL COMMENT 'Placa del vehiculo',
  `Fecha_Cot` date DEFAULT NULL COMMENT 'Fecha',
  `Estatus` int(1) NOT NULL COMMENT 'Aprobada o no',
  `Ced_Mecanico` varchar(50) NOT NULL COMMENT 'Mecanico asignado'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Guarda las Cotizaciones de los Clientes';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbnomina`
--

CREATE TABLE `tbnomina` (
  `Cedula` varchar(50) NOT NULL COMMENT 'Cedula de la persona',
  `Cargo` varchar(50) NOT NULL COMMENT 'Cargo de la persona',
  `Especialidad` varchar(50) NOT NULL COMMENT 'Especialidad en el taller'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla del Personal del Taller';

--
-- Volcado de datos para la tabla `tbnomina`
--

INSERT INTO `tbnomina` (`Cedula`, `Cargo`, `Especialidad`) VALUES
('', '', ''),
('1', 'ayudante', ''),
('123345456', 'dfgfdgfdhfdhfghgj', 'gfjghjhgjhghjghj'),
('14876367', 'LIMPIEZA', 'NO'),
('2', 'pintor', 'ninguna'),
('32022134', 'JEFE DE MECANICOS I', 'MECANICO'),
('3453535', 'dfgfdgfdhdhdfhfdh', 'gdgfdgfdgdfg'),
('46456456', 'fgfghfghfghgf', 'fghfghfgfghfghgfgg'),
('67876867', 'fghfghfgjfg', 'fghfghfghfghfg'),
('86876867', 'JEFE DE TALLER', 'DIESEL'),
('8767867', 'JEFE DE DIESES', 'DIESEL'),
('9874532', 'Jefe de Taller', 'Pintura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbpersona`
--

CREATE TABLE `tbpersona` (
  `Identificacion` varchar(50) NOT NULL COMMENT 'Identificacion de la persona',
  `Nombres` varchar(50) NOT NULL COMMENT 'Nombres',
  `Apellidos` varchar(50) NOT NULL COMMENT 'Apellidos',
  `Correo` varchar(100) DEFAULT NULL COMMENT 'Correo electronico',
  `Telefono` varchar(50) NOT NULL COMMENT 'telefono',
  `Direccion` varchar(200) NOT NULL COMMENT 'direccion'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbpersona`
--

INSERT INTO `tbpersona` (`Identificacion`, `Nombres`, `Apellidos`, `Correo`, `Telefono`, `Direccion`) VALUES
('', '', '', '', '', ''),
('13456753', 'ANDRES JESUS', 'BELLORIN COVA', 'NO TIENE', '04148976543', 'PORLAMAR. CALLE 10'),
('14876367', 'KAMILA RACHELL', 'HERNANDEZ VASQUEZ', 'CAMILAHB2013@GMAIL.COM', '04248375232', 'PUNTA DE PIEDRAS.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbproductos`
--

CREATE TABLE `tbproductos` (
  `id` int(11) NOT NULL COMMENT 'identificador',
  `Descripcion` varchar(50) NOT NULL COMMENT 'Descripcion del producto',
  `Serial` varchar(50) NOT NULL COMMENT 'Serial',
  `Costo` varchar(50) NOT NULL COMMENT 'Precio publico',
  `cantidad` int(11) NOT NULL DEFAULT '0' COMMENT 'Cantidad de producto',
  `estatus` int(1) NOT NULL DEFAULT '1' COMMENT 'estatus del producto'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbproductos`
--

INSERT INTO `tbproductos` (`id`, `Descripcion`, `Serial`, `Costo`, `cantidad`, `estatus`) VALUES
(1, 'PARACHOQUE DELANTERO NISSAN B13', 'GHFGJGHJ34544', '1000', 260, 1),
(2, 'TAQUETES SOBRE ROLIN FORD 302', 'JFTDJGYG679GCVB', '20', 15, 0),
(3, 'DISTRIBUIDOR FORD 361', '9879KGGMJKF7709889N', '100', 20, 1),
(4, 'ARRANQUE CHEVROLET 261', '76VNBKJH90KMJB', '40', 25, 1),
(5, 'RADIADOR FORD ', '786876JGHGFHGF', '40', 30, 1),
(6, 'Bomba Electrica de Gasolina', 'GFGU7T7MN76777', '100', 35, 1),
(7, 'CAMARA FORD 302 ', 'SDGDG457576', '100', 40, 1),
(9, 'ROTOR DE DISTRIBUIDOR', '45346RTHGFH', '35', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbrelacioncotserv`
--

CREATE TABLE `tbrelacioncotserv` (
  `Num_Cot` varchar(50) NOT NULL COMMENT 'Numero Cotizacion',
  `Cod_Serv` varchar(50) NOT NULL,
  `Costo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbrelacioncotserv`
--

INSERT INTO `tbrelacioncotserv` (`Num_Cot`, `Cod_Serv`, `Costo`) VALUES
('', '2', '800'),
('', '3', '100');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbreparaciones`
--

CREATE TABLE `tbreparaciones` (
  `Num_Cot` int(11) NOT NULL COMMENT 'Numero Cotizacion',
  `Fecha_Rep` varchar(50) NOT NULL COMMENT 'Fecha Reparacion',
  `Ced_Mec` varchar(50) NOT NULL COMMENT 'Identificacion del mecanico',
  `Placa` varchar(50) NOT NULL COMMENT 'Placa del Vehiculo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbservicios`
--

CREATE TABLE `tbservicios` (
  `Id` varchar(50) NOT NULL COMMENT 'identificador',
  `Descripcion` varchar(50) NOT NULL COMMENT 'Descripcion del servicio',
  `Costo` double NOT NULL COMMENT 'Precio del servicio'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Servicios Ofrecidos de Taller';

--
-- Volcado de datos para la tabla `tbservicios`
--

INSERT INTO `tbservicios` (`Id`, `Descripcion`, `Costo`) VALUES
('1', 'DIAGNOSTICO DE CAJA', 30),
('2', 'CAMBIO DE ACEITE', 10),
('3', 'DIAGNOSTICO TREN DELATERO', 20),
('345', 'INSTALACION DE AMORTIGUADORES', 45),
('4', 'INSTALACION DE REPUESTOS', 10),
('767', 'REPARACION DE CHASIS', 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbusuario`
--

CREATE TABLE `tbusuario` (
  `Id` int(50) NOT NULL COMMENT 'identificador',
  `Nom_Usu` varchar(50) NOT NULL COMMENT 'Nombre de usuario',
  `Cla_usu` varchar(50) NOT NULL COMMENT 'Clave de usuario',
  `Tip_Priv` int(11) NOT NULL COMMENT 'Tipo de privilegio'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Usuarios del Sistema';

--
-- Volcado de datos para la tabla `tbusuario`
--

INSERT INTO `tbusuario` (`Id`, `Nom_Usu`, `Cla_usu`, `Tip_Priv`) VALUES
(2, 'admin', '123', 1),
(5, 'CONSULTA', '321', 1),
(6, 'SHIRLEY', '987', 0),
(7, 'FRANZUA', '15005923', 1),
(8, 'USER_ENCRIPTADO', '123', 1),
(9, 'ENCYPTADO', 'def50200e81d87039dd3f82a7e8618a50bd2cbdbdbb3c170bd', 1),
(10, 'PEPE', 'def5020021f9821f7bf5fc5d9ab36f9fafa5116d062ddd65ff', 1),
(11, 'CRISTOPHER', 'def50200b9e9b24ef8cf710c7e3dc67dc5bcdc575de4875578', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbvehiculo`
--

CREATE TABLE `tbvehiculo` (
  `Placa` varchar(10) NOT NULL COMMENT 'Placa del vehiculo',
  `Marca` varchar(50) NOT NULL COMMENT 'Marca',
  `Modelo` varchar(50) NOT NULL COMMENT 'Modelo',
  `Color` varchar(50) NOT NULL COMMENT 'color',
  `ano` varchar(5) NOT NULL COMMENT 'año'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Vehiculos del taller';

--
-- Volcado de datos para la tabla `tbvehiculo`
--

INSERT INTO `tbvehiculo` (`Placa`, `Marca`, `Modelo`, `Color`, `ano`) VALUES
('123456', 'CHEVROLET', 'PINGUINO', 'NEGRO', '1994'),
('AAB123', 'CHEVROLET', 'MALIBU', 'BLANCO', '1982'),
('APO09TY1', 'FORD', 'F150', 'ROJO', '2014'),
('ARETG3TG', 'MITSUBISHI', 'SIGNO', 'NEGRO', '2010'),
('AS23445', 'FORD', 'ZEPHIR', 'ROJO', '1983'),
('ASE4RT6', 'CHEVROLET', 'CHEVY', 'PLATA', '2012'),
('ASLOCO1', 'MITSUBISHI', 'SIGNO', 'GRIS', '1999'),
('TY7RT6', 'CHEVROLET', 'SWIFT', 'NEGRO', '2012');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbcotizaciones`
--
ALTER TABLE `tbcotizaciones`
  ADD PRIMARY KEY (`Num_Cot`);

--
-- Indices de la tabla `tbnomina`
--
ALTER TABLE `tbnomina`
  ADD PRIMARY KEY (`Cedula`);

--
-- Indices de la tabla `tbpersona`
--
ALTER TABLE `tbpersona`
  ADD PRIMARY KEY (`Identificacion`);

--
-- Indices de la tabla `tbproductos`
--
ALTER TABLE `tbproductos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbservicios`
--
ALTER TABLE `tbservicios`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `tbusuario`
--
ALTER TABLE `tbusuario`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `tbvehiculo`
--
ALTER TABLE `tbvehiculo`
  ADD PRIMARY KEY (`Placa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbcotizaciones`
--
ALTER TABLE `tbcotizaciones`
  MODIFY `Num_Cot` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Numero Cotizacion';

--
-- AUTO_INCREMENT de la tabla `tbproductos`
--
ALTER TABLE `tbproductos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tbusuario`
--
ALTER TABLE `tbusuario`
  MODIFY `Id` int(50) NOT NULL AUTO_INCREMENT COMMENT 'identificador', AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
