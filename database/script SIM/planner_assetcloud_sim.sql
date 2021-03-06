-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-01-2019 a las 16:35:18
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `planner_assetcloud_sim`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `programar_tareas_armado` (IN `formid` INT, IN `petrid` INT, IN `ordenid` INT)  NO SQL
BEGIN
DECLARE done INT DEFAULT 0;
DECLARE nom VARCHAR(50);
DECLARE idtarea INT;
DECLARE tareas CURSOR FOR
           SELECT VALO_NOMBRE,id_tarea FROM frm_formularios_completados A JOIN tareas B ON A.VALO_NOMBRE=B.descripcion  WHERE form_id = formid and petr_id=petrid and valor="tilde" and descripcion IN (
			'850-LAVADO DE MOTOR DE 4 CILINDRO',
			'860-LAVADO DE MOTOR DE 5 CILINDRO',
			'870-LAVADO DE MOTOR DE 6 CILINDRO',
			'880-LAVADO DE MOTOR DE 8 CILINDRO',
			'881-LAVADO DE MOTOR DE 12 CILINDRO',
			'748-LAVADO DE TAPA DE CILINDRO',
			'750-GRANALLADO DE TAPA DE CILINDRO',
			'1014-SEMI-ARMADO MOTOR NAFTERO 4 CIL.',
			'1020-SEMI-ARMADO MOTOR NAFTERO 5 CIL.',
			'1022-SEMI-ARMADO MOTOR NAFTERO 6 CIL.',
			'1024-SEMI-ARMADO MOTOR NAFTERO 8 CIL.',
			'1054-SEMI-ARMADO MOTOR GASOLERO GR. 4 CIL.',								
			'1060-SEMI-ARMADO MOTOR GASOLERO GR. 5 CIL.',							
			'1062-SEMI-ARMADO MOTOR GASOLERO GR. 6 CIL.',
			'1064-SEMI-ARMADO MOTOR GASOLERO GR. 8 CIL.',
			'1065-SEMI-ARMADO MOTOR GASOLERO GR.12 CIL.',
			'1188-COLOCAR Y PROBAR MOTOR EN BANCO PRUEBA',
			'1191-MANO DE OBRA DESARME & EVALUACION',
			'2066-CONTROLAR Y CALIBRAR BOMBA INYECTORA',
			'2069-CONTROLAR Y CALIBRAR INYECTORES',
			'2075-CAMBIO DE PUNTA DE MANGA DIFERENCIAL',
			'2110-MANO DE OBRA DE SERVICIO EN CAMPO',
			'2110-TRASLADO PARA SERVICIO EN CAMPO',
			'2102-COLOCAR ESCANER PARA EXTRAER DATOS',
			'2045-REPARAR TURBO CAMION',
			'2050-REPARAR TURBO AUTOMOVIL',
			'2060-REPARAR TURBO MAQUINA INDUSTRIAL',
			'1074-ARMADO DE MOTOR NAFTERO 4 CIL.',
			'1080-ARMADO DE MOTOR NAFTERO 5 CIL.',
			'1082-ARMADO DE MOTOR NAFTERO 6 CIL.',
			'1084-ARMADO DE MOTOR NAFTERO 8 CIL.',
			'1094-ARMADO DE MOTOR GASOLERO CH. 4 CIL.',
			'1100-ARMADO DE MOTOR GASOLERO CH. 5 CIL.',
			'1102-ARMADO DE MOTOR GASOLERO CH. 6 CIL.',
			'1104-ARMADO DE MOTOR GASOLERO CH. 8 CIL.',
			'1114-ARMADO DE MOTOR GASOLERO GR. 4 CIL.',
			'1120-ARMADO DE MOTOR GASOLERO GR. 5 CIL.',
			'1122-ARMADO DE MOTOR GASOLERO GR. 6 CIL.',
			'1124-ARMADO DE MOTOR GASOLERO GR. 8 CIL.'
);  
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
OPEN tareas;


Iteracion: LOOP
    FETCH tareas INTO nom,idtarea;
    IF done = 1 THEN
      LEAVE Iteracion;
    END IF;
	INSERT INTO tbl_listarea (tareadescrip,id_tarea,id_orden) values(nom,idtarea,ordenid);

END LOOP Iteracion;

CLOSE tareas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `programar_tareas_reparacion` (IN `formid` INT, IN `petrid` INT, IN `ordenid` INT)  NO SQL
BEGIN
DECLARE done INT DEFAULT 0;
DECLARE nom VARCHAR(50);
DECLARE idtarea INT;
DECLARE tareas CURSOR FOR
           SELECT VALO_NOMBRE,id_tarea FROM frm_formularios_completados A JOIN tareas B ON A.VALO_NOMBRE=B.descripcion  WHERE form_id = formid and petr_id=petrid and valor="tilde" and descripcion NOT IN (
			'850-LAVADO DE MOTOR DE 4 CILINDRO',
			'860-LAVADO DE MOTOR DE 5 CILINDRO',
			'870-LAVADO DE MOTOR DE 6 CILINDRO',
			'880-LAVADO DE MOTOR DE 8 CILINDRO',
			'881-LAVADO DE MOTOR DE 12 CILINDRO',
			'748-LAVADO DE TAPA DE CILINDRO',
			'750-GRANALLADO DE TAPA DE CILINDRO',
			'1014-SEMI-ARMADO MOTOR NAFTERO 4 CIL.',
			'1020-SEMI-ARMADO MOTOR NAFTERO 5 CIL.',
			'1022-SEMI-ARMADO MOTOR NAFTERO 6 CIL.',
			'1024-SEMI-ARMADO MOTOR NAFTERO 8 CIL.',
			'1054-SEMI-ARMADO MOTOR GASOLERO GR. 4 CIL.',								
			'1060-SEMI-ARMADO MOTOR GASOLERO GR. 5 CIL.',							
			'1062-SEMI-ARMADO MOTOR GASOLERO GR. 6 CIL.',
			'1064-SEMI-ARMADO MOTOR GASOLERO GR. 8 CIL.',
			'1065-SEMI-ARMADO MOTOR GASOLERO GR.12 CIL.',
			'1188-COLOCAR Y PROBAR MOTOR EN BANCO PRUEBA',
			'1191-MANO DE OBRA DESARME & EVALUACION',
			'2066-CONTROLAR Y CALIBRAR BOMBA INYECTORA',
			'2069-CONTROLAR Y CALIBRAR INYECTORES',
			'2075-CAMBIO DE PUNTA DE MANGA DIFERENCIAL',
			'2110-MANO DE OBRA DE SERVICIO EN CAMPO',
			'2110-TRASLADO PARA SERVICIO EN CAMPO',
			'2102-COLOCAR ESCANER PARA EXTRAER DATOS',
			'2045-REPARAR TURBO CAMION',
			'2050-REPARAR TURBO AUTOMOVIL',
			'2060-REPARAR TURBO MAQUINA INDUSTRIAL',
			'1074-ARMADO DE MOTOR NAFTERO 4 CIL.',
			'1080-ARMADO DE MOTOR NAFTERO 5 CIL.',
			'1082-ARMADO DE MOTOR NAFTERO 6 CIL.',
			'1084-ARMADO DE MOTOR NAFTERO 8 CIL.',
			'1094-ARMADO DE MOTOR GASOLERO CH. 4 CIL.',
			'1100-ARMADO DE MOTOR GASOLERO CH. 5 CIL.',
			'1102-ARMADO DE MOTOR GASOLERO CH. 6 CIL.',
			'1104-ARMADO DE MOTOR GASOLERO CH. 8 CIL.',
			'1114-ARMADO DE MOTOR GASOLERO GR. 4 CIL.',
			'1120-ARMADO DE MOTOR GASOLERO GR. 5 CIL.',
			'1122-ARMADO DE MOTOR GASOLERO GR. 6 CIL.',
			'1124-ARMADO DE MOTOR GASOLERO GR. 8 CIL.'
);  
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
OPEN tareas;


Iteracion: LOOP
    FETCH tareas INTO nom,idtarea;
    IF done = 1 THEN
      LEAVE Iteracion;
    END IF;
	INSERT INTO tbl_listarea (tareadescrip,id_tarea,id_orden) values(nom,idtarea,ordenid);

END LOOP Iteracion;

CLOSE tareas;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abmdeposito`
--

CREATE TABLE `abmdeposito` (
  `depositoId` int(11) NOT NULL,
  `depositodescrip` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `id_provincial` varchar(255) DEFAULT NULL,
  `id_localidad` varchar(255) DEFAULT NULL,
  `id_pais` varchar(255) DEFAULT NULL,
  `GPS` varchar(255) DEFAULT NULL,
  `estado` varchar(5) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `abmdeposito`
--

INSERT INTO `abmdeposito` (`depositoId`, `depositodescrip`, `direccion`, `id_provincial`, `id_localidad`, `id_pais`, `GPS`, `estado`, `id_empresa`) VALUES
(1, 'deposito 1', 'I. de la Rosa 2345 Rivadavia', NULL, NULL, NULL, NULL, 'AC', 6),
(2, 'Depósito 2', 'Av. Libertador San Martín 2450 oeste', NULL, NULL, NULL, NULL, 'AC', 6),
(4, 'Conteiner Mina Chinchillas', 'MINA Chinchillas', NULL, NULL, NULL, NULL, 'AC', 7),
(5, 'Sucursal Gral. Guemes', 'Tte. Ibañes 42 Gral Guemes Salta', NULL, NULL, NULL, NULL, 'AC', 7),
(6, 'Taller Central ', 'San Juan', NULL, NULL, NULL, NULL, 'AC', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abmproveedores`
--

CREATE TABLE `abmproveedores` (
  `provid` int(10) NOT NULL,
  `provnombre` varchar(255) DEFAULT NULL,
  `provcuit` varchar(50) DEFAULT NULL,
  `provdomicilio` varchar(255) DEFAULT NULL,
  `provtelefono` varchar(50) DEFAULT NULL,
  `provmail` varchar(100) DEFAULT NULL,
  `provestado` varchar(4) DEFAULT NULL,
  `estado` varchar(5) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `abmproveedores`
--

INSERT INTO `abmproveedores` (`provid`, `provnombre`, `provcuit`, `provdomicilio`, `provtelefono`, `provmail`, `provestado`, `estado`, `id_empresa`) VALUES
(1, 'Juan Perez', '2023339814', 'dsadasdasd', '2645677', 'permauricio@gmail.com', '8', 'AC', 6),
(2, 'Trazalog', '20-54545454-9', 'Lib. Gral S Martin 1890', '15555555', 'soporte@trazalog.com', '8', 'AC', 6),
(3, 'Proveedor test', '20-20202022-7', 'Calle proveedor', '1777777777', 'info@proveedor.com', '8', 'AC', 7),
(5, 'Leonardo Pantano Tornero', 'xxxxxx', 'San Juan', '2645053221', 'leonardo.pantano@gmail.com', '8', 'AC', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admcustomers`
--

CREATE TABLE `admcustomers` (
  `cliId` int(11) NOT NULL,
  `cliName` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliLastName` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliDni` varchar(8) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliDateOfBirth` date DEFAULT NULL,
  `cliNroCustomer` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliAddress` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliPhone` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliMovil` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliEmail` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliImagePath` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `zonaId` int(11) DEFAULT NULL,
  `cliDay` int(11) DEFAULT '30',
  `cliColor` varchar(7) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `cliRazonSocial` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `plant_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `admcustomers`
--

INSERT INTO `admcustomers` (`cliId`, `cliName`, `cliLastName`, `cliDni`, `cliDateOfBirth`, `cliNroCustomer`, `cliAddress`, `cliPhone`, `cliMovil`, `cliEmail`, `cliImagePath`, `zonaId`, `cliDay`, `cliColor`, `estado`, `id_empresa`, `cliRazonSocial`, `plant_id`) VALUES
(13, 'Daniel', 'Osvaldo', '31324200', '1984-05-01', '1', 'Av La Humareda 12', '', '', '', '13.png', 10, 30, '#00a65a', 'AC', 6, 'Dani Osvaldo', NULL),
(14, 'Mariana', 'Romero', '31324205', '2016-05-04', '14', 'Av. Simpre Viva 123', '', '', '', '14.png', 11, 15, '#f39c12', 'AC', 6, 'MRomero', NULL),
(15, 'Patricia', 'Moreno', '45632145', '2016-05-19', '15', 'Rogelio Funes Mori y No Fue Corner', '', '', '', '15.png', 10, 10, '#dd4b39', 'AC', 6, 'Pato Moreno', NULL),
(16, 'Homero', 'Perez', '45888882', '2000-05-10', '16', 'Rivadavia 124s', '', '', '', '16.png', 12, 20, '#00a65a', 'AC', 6, 'Homero''s', NULL),
(17, 'Mauricio', 'perez', '23339814', '2016-06-01', '17', 'dd', '26465', '026457070785', 'permaucirio@gmail.com', '17.png', 10, 30, '#00a65a', 'AC', 6, 'Master of ', NULL),
(18, 'asAS', 'ASas', 'ss', '2016-12-16', '18', 'sASAs', 'sss', 's333', 'permauricio23', '18.png', 10, 30, '#00a65a', 'AN', 6, 'ASSAs', NULL),
(19, 'eliana', NULL, '1234', NULL, NULL, 'san lorenzo 1442 este, santa lucia', '02644510131', NULL, 'eli', NULL, NULL, 30, NULL, 'AN', 6, 'nose', NULL),
(20, 'Mina Chinchilla', 'Mina chinchilla', '02333981', NULL, NULL, '-', '-', NULL, '-', NULL, NULL, 30, NULL, 'AC', 7, 'Mina Chinchilla', NULL),
(21, 'Hugo Cliente', NULL, '11111111', NULL, NULL, 'calle 13', '15555555', NULL, 'hugo@trazalog.com', NULL, NULL, 30, NULL, 'AC', 6, 'hugpo s.a.', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admstock`
--

CREATE TABLE `admstock` (
  `stkId` int(11) NOT NULL,
  `prodId` int(11) NOT NULL,
  `stkCant` int(11) NOT NULL,
  `usrId` int(11) NOT NULL,
  `stkDate` datetime NOT NULL,
  `stkMotive` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `admstock`
--

INSERT INTO `admstock` (`stkId`, `prodId`, `stkCant`, `usrId`, `stkDate`, `stkMotive`) VALUES
(27, 8, 10, 1, '2016-05-13 15:59:17', 'Ajuste inicial'),
(28, 9, 5, 1, '2016-05-13 15:59:39', 'Ajuste inicial'),
(29, 10, 20, 1, '2016-05-13 15:59:57', 'Ajuste inicial'),
(30, 9, -2, 1, '2016-05-17 18:15:03', 'Venta'),
(31, 10, 1, 1, '2017-01-19 12:13:25', 'Salida'),
(32, 10, 5, 1, '2017-01-19 12:15:11', 'entrada'),
(33, 10, 5, 1, '2017-01-19 12:15:26', 'salida'),
(34, 9, 3, 1, '2017-01-23 12:30:52', 'Salida'),
(35, 10, 8, 1, '2017-01-23 12:31:10', 'entrada'),
(36, 9, 1, 1, '2017-01-23 13:41:20', 'entrada'),
(37, 8, 1, 1, '2017-03-13 13:39:09', 'prestamo clorox'),
(38, 9, 1, 1, '2017-03-13 13:40:31', 'ingreso'),
(39, 10, 12, 1, '2017-03-13 13:41:09', 'salida'),
(40, 9, 4, 1, '2017-03-28 11:35:41', 'finning');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admvisits`
--

CREATE TABLE `admvisits` (
  `vstId` int(11) NOT NULL,
  `vstDate` datetime NOT NULL,
  `cliId` int(11) NOT NULL,
  `vstNote` text COLLATE utf8_spanish_ci NOT NULL,
  `vstStatus` varchar(2) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `id_area` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `estado` varchar(45) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`id_area`, `descripcion`, `id_empresa`, `estado`) VALUES
(1, 'proceso nuevo de area', 6, 'AC'),
(2, 'gemma area 1', 0, 'AC'),
(3, 'Industrial', 6, 'AC'),
(4, 'Area Nueva', 6, 'AC'),
(5, 'otra area 8', 6, 'AC'),
(6, 'area 9', 4, 'AC'),
(7, 'area 51', 6, 'AC'),
(8, 'Area Testing', 6, 'AC'),
(9, 'Area compras', 6, 'AC'),
(10, 'area 9', 6, 'AC'),
(12, 'MIna', 7, 'AC'),
(13, 'Operaciones', 6, 'AC'),
(14, 'Mina', 7, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles`
--

CREATE TABLE `articles` (
  `artId` int(11) NOT NULL,
  `artBarCode` varchar(50) NOT NULL,
  `artDescription` varchar(50) NOT NULL,
  `artCoste` decimal(14,2) NOT NULL,
  `artMargin` decimal(10,2) NOT NULL,
  `artIsByBox` int(2) NOT NULL,
  `artCantBox` int(11) DEFAULT NULL,
  `artMarginIsPorcent` bit(1) NOT NULL,
  `artEstado` varchar(2) NOT NULL DEFAULT 'AC',
  `famId` int(11) DEFAULT NULL,
  `unidadmedida` int(11) NOT NULL,
  `punto_pedido` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articles`
--

INSERT INTO `articles` (`artId`, `artBarCode`, `artDescription`, `artCoste`, `artMargin`, `artIsByBox`, `artCantBox`, `artMarginIsPorcent`, `artEstado`, `famId`, `unidadmedida`, `punto_pedido`, `id_empresa`) VALUES
(2, '51574', 'FILTRO DE COMBUSTIBLE P/TAMROCK N°88', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(10, '123456', 'BUJE DE ROTACION P/TAMROCK 680', '0.00', '0.00', 0, 6, b'0', 'AN', 9, 2, 0, 6),
(11, '50686', 'BULON NRO. 86321729 P/TAMROCK HL 500', '0.00', '0.00', 1, 1, b'0', 'AC', 1, 1, 0, 6),
(12, '51258', 'DIAFRAGMA N:04114808 P/TAMROCK', '0.00', '0.00', 1, 3, b'0', 'AC', 4, 1, 0, 6),
(13, '51265', 'DIAFRAGMA P/COMP. TAMROCK HL 680-2 A', '0.00', '0.00', 1, 0, b'0', 'AC', 4, 1, 0, 6),
(14, '51315', 'EJE P/ TAMROCK N† 15178158', '0.00', '0.00', 1, 0, b'0', 'AC', 5, 1, 0, 6),
(15, '51317', 'EJE P/TAMROCK 500 ART. 23313378', '0.00', '0.00', 1, 0, b'0', 'AC', 5, 1, 0, 6),
(16, '51471', 'FILTRO  COMBUSTIBLE P 557440 TAMROCK', '0.00', '0.00', 1, 3, b'0', 'AC', 3, 1, 0, 6),
(17, '51571', 'FILTRO TAMROCK ACEITE CAT 1R-0739', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(18, '51545', 'FILTRO TAMROCK AIRE †88546679', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(19, '51546', 'FILTRO TAMROCK AIRE/CABINA PRIMARIO', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(20, '51548', 'FILTRO TAMROCK AIRE/COMPRESOR 885467', '0.00', '0.00', 1, 1, b'0', 'AC', 3, 1, 0, 6),
(21, '51550', 'FILTRO TAMROCK CIRC/HID.RETORNO 8672', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(22, '51551', 'FILTRO TAMROCK CIRC/HID.SANDVICK 815', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(23, '51552', 'FILTRO TAMROCK COMB,N† 1R-0751', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(24, '51553', 'FILTRO TAMROCK COMB,TRAMPA/AGUA 1466', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(25, '53605', 'TRAMPA DE AGUA PARA TAMROCK', '0.00', '0.00', 1, 2, b'0', 'AC', 10, 1, 0, 6),
(26, '53701', 'TUERCA NRO.81125969 P/TAMROCK', '0.00', '0.00', 1, 1, b'0', 'AC', 9, 1, 0, 6),
(27, '53947', 'KIT DE SELLOS NRO.879484449 TAMROCK', '0.00', '0.00', 1, 0, b'0', 'AC', 7, 1, 0, 6),
(28, '53966', 'RETEN NRO 15074808 TAMROCK R -500', '0.00', '0.00', 1, 1, b'0', 'AC', 8, 1, 0, 6),
(29, '53969', 'SELLOS NRO 81820039 TAMROCK R-500', '0.00', '0.00', 1, 3, b'0', 'AC', 7, 1, 0, 6),
(30, '54022', 'BUJE P/TAMROCK N 15021838', '0.00', '0.00', 1, 4, b'0', 'AC', 2, 1, 0, 6),
(31, '54469', 'VALVULA  ART 807 590 69 P/TAMROCK HL', '0.00', '0.00', 1, 2, b'0', 'AC', 6, 1, 0, 6),
(32, '58076', 'FILTRO TAMROCK 500 AIRE COMPRESOR PR', '0.00', '0.00', 1, 1, b'0', 'AC', 3, 1, 0, 6),
(33, '58077', 'FILTRO TAMROCK 500 AIRE SECUNDARIO M', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(34, '58078', 'FILTRO TAMROCK 500 AIRE  PRIMARIO MO', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(35, '58079', 'FILTRO TAMROCK 500 AIRE COMPRESOR SE', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(36, '58080', 'FILTRO TAMROCK 500 GASOIL ART8823923', '0.00', '0.00', 1, 3, b'0', 'AC', 3, 1, 0, 6),
(37, '58081', 'FILTRO TAMROCK 500 GASOIL SEPARADOR', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(38, '58082', 'FILTRO TAMROCK 500 ACEITE MOTOR ART', '0.00', '0.00', 1, 3, b'0', 'AC', 3, 1, 0, 6),
(39, '50190', 'ARANDELA DE BRONCE 7K-1840 P/CAT 966', '0.00', '0.00', 1, 0, b'0', 'AN', 11, 1, 0, 6),
(40, '50236', 'ARANDELAS N  7K-1839 P/CATERPILLAR 9', '0.00', '0.00', 1, 0, b'0', 'AN', 11, 1, 0, 6),
(41, '50465', 'BULON ART. NRO. 6729510 P/ BOB CATERPILLAR', '0.00', '0.00', 0, 0, b'0', 'AC', 1, 4, 0, 6),
(42, '50712', 'BULON   P/ CAT- 966 DIENTE DE CARGAD', '0.00', '0.00', 1, 22, b'0', 'AC', 1, 1, 0, 6),
(43, '50714', 'BULON  8T -6466 P/AIRE ACONDI CAT -', '0.00', '0.00', 1, 0, b'0', 'AC', 1, 1, 0, 6),
(44, '50966', 'COMPRESOR DE AIRE N† 8N 6105 P / CAT', '0.00', '0.00', 1, 0, b'0', 'AC', 19, 1, 0, 6),
(45, '51084', 'CORREA DE ALTERNAD. P/BOBCAT ART.710', '0.00', '0.00', 1, 5, b'0', 'AC', 21, 1, 0, 6),
(46, '51188', 'CORTA CORRIENTE DE 24 VOLT. P/CAT 98', '0.00', '0.00', 1, 1, b'0', 'AC', 20, 1, 0, 6),
(47, '51208', 'CUBIERTA 10 X 16.5 SOLIDEAL P/BOBCAT', '0.00', '0.00', 1, 1, b'0', 'AC', 22, 1, 0, 6),
(48, '51259', 'DIAFRAGMA N† 5V 6125 P/ CAT 980', '0.00', '0.00', 1, 3, b'0', 'AC', 4, 1, 0, 6),
(49, '51455', 'FILTRO BOBCAT ACEIT,HID.N†6661248', '0.00', '0.00', 1, 2, b'0', 'AC', 3, 1, 0, 6),
(50, '51456', 'FILTRO BOBCAT ACEIT,MOTOR N†03974896', '0.00', '0.00', 1, 2, b'0', 'AC', 3, 1, 0, 6),
(51, '51457', 'FILTRO BOBCAT AIRE PRIM.N†06598492', '0.00', '0.00', 1, 8, b'0', 'AC', 3, 1, 0, 6),
(52, '51458', 'FILTRO BOBCAT AIRE SEC.N†06598362', '0.00', '0.00', 1, 9, b'0', 'AC', 3, 1, 0, 6),
(53, '51459', 'FILTRO BOBCAT COMB.N†06667352', '0.00', '0.00', 1, 7, b'0', 'AC', 3, 1, 0, 6),
(54, '51460', 'FILTRO CAT-966 ACEIT/CONV N†9740', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(55, '51461', 'FILTRO CAT-966 ACEIT/HID,N†156-0741-', '0.00', '0.00', 1, 1, b'0', 'AC', 3, 1, 0, 6),
(56, '51462', 'FILTRO CAT-966 ACEITE N†1R-0739', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(57, '51463', 'FILTRO CAT-966 AIRE PRIMARIO 2453818', '0.00', '0.00', 1, 1, b'0', 'AC', 3, 1, 0, 6),
(58, '51464', 'FILTRO CAT-966 AIRE SECUNDARIO 24538', '0.00', '0.00', 1, 1, b'0', 'AC', 3, 1, 0, 6),
(59, '51465', 'FILTRO CAT-966 COMB,N†1P-2299-BOSCH', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(60, '51466', 'FILTRO CAT-980 ACEITE MOTOR', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(61, '51467', 'FILTRO CAT-980 ACEIT/HIDRAULICO', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(62, '51468', 'FILTRO CAT-980 TRASMISION', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(63, '51469', 'FILTRO CAT-980 FILTRO SEPARADOR DE A', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(64, '51470', 'FILTRO CAT-980 CABINA', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(66, '51685', 'GUIA N† 2 L-3650 P/CAT 966', '0.00', '0.00', 1, 1, b'0', 'AC', 12, 1, 0, 6),
(67, '51825', 'JUNTA N† 8S-1605 P/CAT.966', '0.00', '0.00', 1, 0, b'0', 'AC', 15, 1, 0, 6),
(68, '51826', 'JUNTA N† 9Y-1979 P/CAT.966', '0.00', '0.00', 1, 0, b'0', 'AC', 15, 1, 0, 6),
(69, '51829', 'JUNTA NRO. 6684788 P/BOB CAT', '0.00', '0.00', 1, 0, b'0', 'AC', 15, 1, 0, 6),
(70, '52317', 'PERNO DE BALDE  NRO. 8K- 5334 P/CAT.', '0.00', '0.00', 1, 2, b'0', 'AC', 13, 1, 0, 6),
(71, '53371', 'SELLO  N: 2H-6368 P/CAT. 966', '0.00', '0.00', 1, 6, b'0', 'AC', 7, 1, 0, 6),
(72, '53394', 'SELLO N† 6D 692 P/ CAT -980', '0.00', '0.00', 1, 4, b'0', 'AC', 7, 1, 0, 6),
(73, '53703', 'TUERCA P/BOBCAT S150 N€ 6674202', '0.00', '0.00', 1, 0, b'0', 'AC', 9, 1, 0, 6),
(74, '53706', 'TUERCA PARA BULON DE RUEDA, P/ CAT.', '0.00', '0.00', 1, 20, b'0', 'AC', 9, 1, 0, 6),
(75, '53918', 'COJINETE  5M 578 CAT-966', '0.00', '0.00', 1, 4, b'0', 'AC', 14, 1, 0, 6),
(76, '54023', 'BULON 1604 P/CAT 980', '0.00', '0.00', 1, 8, b'0', 'AC', 1, 1, 0, 6),
(77, '54042', 'CABLE DE ACELERADOR P/CAT 980 ART 3V', '0.00', '0.00', 1, 1, b'0', 'AC', 16, 1, 0, 6),
(78, '54210', 'JUNTA 5S-4629 P/CAT-966', '0.00', '0.00', 1, 2, b'0', 'AC', 15, 1, 0, 6),
(79, '57873', 'FILTRO DE COMBUSTIBLE CAT 966H 1R-07', '0.00', '0.00', 1, 3, b'0', 'AC', 3, 1, 0, 6),
(80, '57874', 'FILTRO  DE  ACEITE MOTOR CAT 966H 1R', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(81, '57876', 'FILTRO  DE  ACEITE  HIDRAULICO  CAT', '0.00', '0.00', 1, 7, b'0', 'AC', 3, 1, 0, 6),
(82, '54012', 'BASE  PORTA FILTRO  ART 6N 1044 CAT', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(83, '54833', 'CAMISA CILINDRO DE MOTOR CAT-3306', '0.00', '0.00', 1, 0, b'0', 'AC', 24, 1, 0, 6),
(84, '54834', 'JUEGO DE AROS DE MOTOR CAT-3306', '0.00', '0.00', 1, 0, b'0', 'AC', 24, 1, 0, 6),
(85, '57913', 'RADIADOR AGUA P/CAT 966H', '0.00', '0.00', 1, 0, b'0', 'AC', 23, 1, 0, 6),
(86, '58036', 'TERMOSTATO  NRO 281- 8744 P/CAT 924', '0.00', '0.00', 1, 0, b'0', 'AC', 17, 1, 0, 6),
(87, '58038', 'TERMOSTATO  NRO 248 -5513 P/CAT 966', '0.00', '0.00', 1, 0, b'0', 'AC', 17, 1, 0, 6),
(88, '58275', 'FILTRO CAT-980 MOTOR 1R-1808', '0.00', '0.00', 1, 3, b'0', 'AC', 3, 1, 0, 6),
(89, '58276', 'FILTRO CAT-980 GASOIL 1R0749', '0.00', '0.00', 1, 4, b'0', 'AC', 3, 1, 0, 6),
(90, '58277', 'FILTRO CAT-980 GASOIL SEP 326-1644', '0.00', '0.00', 0, 0, b'0', 'AC', 3, 1, 0, 6),
(91, '58278', 'FILTRO CAT-980 AIRE PRIMARIO 151-773', '0.00', '0.00', 1, 3, b'0', 'AC', 3, 0, 0, 6),
(92, '58279', 'FILTRO CAT-980 AIRE SECUNDARIO 18902', '0.00', '0.00', 1, 7, b'0', 'AN', 3, 1, 0, 6),
(93, '50182', 'ARANDELA ART, 01643-32260 P/ KOMATSU', '0.00', '0.00', 1, 0, b'0', 'AN', 11, 1, 88, 6),
(94, '50400', 'BRACKET P/KOMATSU P/KOMATSU 470', '0.00', '0.00', 1, 2, b'0', 'AN', 1, 1, 0, 6),
(95, '50436', 'BUJE N† 17177-04530 P/KOMATSU WA 420', '0.00', '0.00', 1, 1, b'0', 'AN', 2, 1, 0, 6),
(96, '50461', 'BUJIA NRO. 600-815-2770 P/KOMATSU 42', '0.00', '0.00', 0, 0, b'0', 'IN', 2, 1, 4, 6),
(97, '50684', 'BULON NRO. 16202091-12050 P/ KOMATSU', '0.00', '0.00', 1, 22, b'0', 'AC', 1, 1, 0, 6),
(98, '50685', 'BULON NRO. 419-70-13150 P/KOMATSU 25', '0.00', '0.00', 1, 12, b'0', 'AC', 1, 1, 0, 6),
(99, '50689', 'BULON P/KOMATSU 470 N 2 ART. 09208-1', '0.00', '0.00', 1, 0, b'0', 'AC', 1, 1, 0, 6),
(100, '50715', 'BULON  DE CARDAN P/ KOMATSU 420-3 N†', '0.00', '0.00', 1, 9, b'0', 'AC', 1, 1, 0, 6),
(101, '50716', 'BULON  P/ KOMATSU N† 02090-11490', '0.00', '0.00', 1, 41, b'0', 'AC', 1, 1, 0, 6),
(102, '50717', 'BULON   DE CARDAN P/ KOMATSU 420-3 N', '0.00', '0.00', 1, 23, b'0', 'AC', 1, 0, 0, 6),
(103, '51179', 'CORREA NRO. 6732-81-6170 , P/KOMATSU', '0.00', '0.00', 1, 2, b'0', 'AC', 21, 0, 0, 6),
(104, '51196', 'CRUCETA NRO. 418-20-34620 P/KOMATSU', '0.00', '0.00', 1, 1, b'0', 'AC', 1, 1, 0, 6),
(105, '51197', 'CRUCETA NRO. 421-20-12620 P/KOMATSU', '0.00', '0.00', 1, 1, b'0', 'AC', 25, 1, 0, 6),
(121, '51198', 'ESPEJO NRO. 421-54-25620 P/KOMATSU 4', '0.00', '0.00', 0, NULL, b'0', 'AC', 1, 0, NULL, 6),
(130, '51195', 'CRUCETA NRO 418-20-32620 , P/KOMATSU', '0.00', '0.00', 1, 1, b'0', 'AC', 25, 1, 0, 6),
(133, '51808', 'JUNTA ANULAR P/KOMATSU 470  ART.600-', '0.00', '0.00', 1, 0, b'0', 'AC', 15, 1, 0, 6),
(134, '52304', 'PASADOR P/KOMATSU 470 ART, 092440251', '0.00', '0.00', 1, 3, b'0', 'AC', 28, 1, 0, 6),
(135, '52408', 'PLATOS NRO. 421-70-22140  P/ KOMATSU', '0.00', '0.00', 1, 4, b'0', 'AC', 29, 1, 0, 6),
(136, '53377', 'SELLO 421- 33 - 11480 P/ KOMATSU 420', '0.00', '0.00', 1, 0, b'0', 'AC', 7, 1, 0, 6),
(137, '53637', 'TUERCA 09218 - 12219 P/ KOMATSU WA 4', '0.00', '0.00', 1, 2, b'0', 'AC', 9, 1, 0, 6),
(138, '53693', 'TUERCA N† 02290 - 11422 P/KOMATSU WA', '0.00', '0.00', 1, 0, b'0', 'AC', 9, 1, 0, 6),
(139, '53695', 'TUERCA NRO. 02290-11625, P/KOMATSU 4', '0.00', '0.00', 1, 9, b'0', 'AC', 9, 1, 0, 6),
(140, '53696', 'TUERCA NRO. 091218-12523 P/KOMATSU 2', '0.00', '0.00', 1, 16, b'0', 'AC', 9, 1, 0, 6),
(141, '53698', 'TUERCA NRO. 16202290-12031 P/KOMATSU', '0.00', '0.00', 1, 21, b'0', 'AC', 9, 1, 0, 6),
(142, '53700', 'TUERCA NRO.02290-11422 P/KOMATSU', '0.00', '0.00', 1, 2, b'0', 'AC', 9, 1, 0, 6),
(143, '53721', 'TUERCAS N º 09218-12219 P/ KOMATSU', '0.00', '0.00', 1, 6, b'0', 'AC', 9, 1, 0, 6),
(144, '53820', 'VALVULA P/ FILTRO DE AIRE P/KOMATSU', '0.00', '0.00', 1, 2, b'0', 'AC', 6, 1, 0, 6),
(145, '53991', 'ACOPLE NRO  09281-00041 P/KOMATSU 25', '0.00', '0.00', 1, 1, b'0', 'AC', 18, 1, 0, 6),
(146, '54019', 'BUJE 421-70-11272 P/KOMATSU 470', '0.00', '0.00', 1, 0, b'0', 'AC', 2, 1, 0, 6),
(147, '54045', 'CABLE  NRO 424-9916110  P/KOMATSU', '0.00', '0.00', 1, 1, b'0', 'AC', 1, 1, 0, 6),
(148, '54150', 'FILT.KOMATSU 470 /2 COMBUSTIBLE 600-', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(149, '54411', 'SEGURO NRO. 09283-00000 P/KOMATSU 25', '0.00', '0.00', 1, 1, b'0', 'AC', 30, 1, 0, 6),
(150, '54432', 'TAPA  NRO 09282-00017 P/KOMATSU 250', '0.00', '0.00', 1, 1, b'0', 'AC', 31, 1, 0, 6),
(151, '54504', 'TUERCA DE ACERO / KOMATSU 420', '0.00', '0.00', 1, 8, b'0', 'AC', 9, 1, 0, 6),
(152, '54505', 'BULON NRO 16201010-62075 P/KOMATSU', '0.00', '0.00', 1, 3, b'0', 'AC', 1, 1, 0, 6),
(153, '54929', 'JUNTA ANULAR PARA KOMATSU 470 ART: 1', '0.00', '0.00', 1, 1, b'0', 'AC', 15, 1, 0, 6),
(154, '55204', 'TUERCA P/ EJE DELANTERO P/ KOMATSU 4', '0.00', '0.00', 1, 9, b'0', 'AC', 9, 1, 0, 6),
(155, '55242', 'ALTERNADOR DE 24V. P/KOMATSU', '0.00', '0.00', 1, 0, b'0', 'AC', 32, 1, 0, 6),
(156, '51439', 'FAROS  TOYOTA 3.0', '0.00', '0.00', 1, 0, b'0', 'IN', 33, 1, 0, 6),
(157, '51486', 'FILTRO COMBUSTIBLE  CLARK TOYOTA 233', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(158, '51488', 'FILTRO CLARK TOYOTA MOTOR 90915-2000', '0.00', '0.00', 1, 3, b'0', 'AC', 3, 1, 0, 6),
(159, '51490', 'FILTRO CLARK TOYOTA CONVERTIDOR 3267', '0.00', '0.00', 1, 1, b'0', 'AC', 3, 1, 0, 6),
(160, '51516', 'FILTRO CLARK TOYOTA HIDRAULICO 67502', '0.00', '0.00', 1, 4, b'0', 'AC', 3, 1, 0, 6),
(161, '51517', 'FILTRO CLARK TOYOTA AIRE SECUNDARIO', '0.00', '0.00', 1, 4, b'0', 'AC', 3, 1, 0, 6),
(162, '51518', 'FILTRO CLARK TOYOTA AIRE PRIMARIO P8', '0.00', '0.00', 1, 0, b'0', 'AC', 3, 1, 0, 6),
(163, '50386', 'BOMBIN DE GASOIL P/BOBCAT ART.665773', '0.00', '0.00', 1, 100, b'0', 'AN', 15, 1, 6, 6),
(165, '56174', 'LLANTA NRO. NRPB03535239 P/ BOBCAT S', '0.00', '0.00', 1, 0, b'0', 'AC', 35, 1, 0, 6),
(166, '1234', 'nuevo articulo', '0.00', '0.00', 1, 6, b'0', 'AN', 3, 1, 1203, 6),
(169, '9999', 'nuevo producto', '0.00', '0.00', 1, 23, b'0', 'AN', 13, 2, 1200, 6),
(170, '9987', 'nuevo ver', '0.00', '0.00', 1, 23, b'0', 'AN', 15, 2, 0, 6),
(171, '3115 23 23', 'nose', '0.00', '0.00', 1, 1, b'0', 'AC', 6, 0, 0, 7),
(172, 'xxxxxx', 'yyyyyyy', '0.00', '0.00', 0, 0, b'0', 'AN', 3, 1, 2, 7),
(173, '12345678910', 'nueva descripcion', '0.00', '0.00', 0, 0, b'0', 'AC', 15, 0, 0, 6),
(174, '123456789', 'descripcion de prueba', '0.00', '0.00', 0, 0, b'0', 'AC', 17, 0, 0, 6),
(175, '12345678', 'nuevaaaaaa', '0.00', '0.00', 1, 33, b'0', 'AC', 3, 0, 0, 6),
(176, '15151515', 'producto nuevo', '0.00', '0.00', 0, 0, b'0', 'AC', 1, 0, 3, 6),
(177, '123', '123descripcion', '0.00', '0.00', 1, 6, b'0', 'AN', 1, 2, 2, 6),
(178, '1112', '1112descrip', '0.00', '0.00', 1, 12, b'0', 'AN', 5, 2, 1112, 6),
(185, '11asdf', '11asdf', '0.00', '0.00', 1, 6, b'0', 'AN', 3, 3, 11, 6),
(194, '1codigo-001', 'descripción de código 001', '0.00', '0.00', 0, 0, b'0', 'AN', 22, 1, 1, 6),
(200, '2cod-002', 'descrip cod 002', '0.00', '0.00', 1, 12, b'0', 'AN', 5, 1, 2, 6),
(201, '111', 'ghfhjgfhg', '0.00', '0.00', 0, 0, b'0', 'AN', 3, 1, 2, 6),
(202, '111111111', 'nuevo', '0.00', '0.00', 1, 10, b'0', 'AN', 21, 3, 5, 6),
(203, '123455678', 'eliiiii', '0.00', '0.00', 1, 11, b'0', 'AN', 24, 1, 4, 6),
(210, '3cod-0003', 'descrip', '0.00', '0.00', 0, 0, b'0', 'AN', 5, 2, 3, 6),
(211, '4cod0004a', 'Descrip 03', '0.00', '0.00', 0, 12, b'0', 'AN', 15, 1, 3, 6),
(212, '222233', 'dsadsadsad', '0.00', '0.00', 0, 0, b'0', 'AN', 17, 1, 3, 6),
(213, '333333', 'sdadasdsad', '0.00', '0.00', 1, 4, b'0', 'AN', 22, 1, 4, 6),
(215, '124456897654324', 'hefdiujbwda', '0.00', '0.00', 0, 0, b'0', 'AN', 20, 1, 4, 6),
(216, '1234556678', 'nuevoooooo', '0.00', '0.00', 1, 10, b'0', 'AN', 26, 1, 5, 6),
(221, 'aaa', 'aaa', '0.00', '0.00', 1, 6, b'0', 'AN', 4, 2, 0, 6),
(227, '11187326487234623462783', 'assdasds', '0.00', '0.00', 0, 0, b'0', 'AN', 13, 3, 0, 6),
(228, '122334455', 'nuevo test', '0.00', '0.00', 1, 60, b'0', 'AN', 17, 2, 41, 6),
(229, '123456678', 'test', '0.00', '0.00', 1, 10, b'0', 'AN', 12, 1, 55, 6),
(235, '000', 'nnnn', '0.00', '0.00', 0, 0, b'0', 'AN', 5, 1, 3, 6),
(236, '00001', 'aaaa', '0.00', '0.00', 0, 0, b'0', 'AN', 1, 1, 6, 6),
(238, '1', 'nuevo articulo 112233', '0.00', '0.00', 1, 30, b'0', 'AN', 33, 1, 5, 6),
(239, '2', 'nuevo articulo 2', '0.00', '0.00', 1, 12, b'0', 'AN', 22, 1, 4, 6),
(240, '12345', 'nuevo de 5', '0.00', '0.00', 1, 5, b'0', 'AN', 1, 1, 4, 6),
(245, '8888888888', 'campo de 6 digitos', '0.00', '0.00', 1, 12, b'0', 'AN', 20, 3, 4, 6),
(246, '1122334455', 'eliana', '0.00', '0.00', 1, 44, b'0', 'AN', 1, 1, 5, 6),
(248, '22', 'asdasd', '0.00', '0.00', 1, 0, b'0', 'AC', 1, -1, 3, 7),
(249, '57653456', 'bulon de escalera ', '0.00', '0.00', 1, 0, b'0', 'AC', 1, -1, 1, 7),
(250, '1R-1825 ', 'filtro ', '0.00', '0.00', 1, 2, b'0', 'AN', 3, 1, 4, 7),
(251, 'sdsad', 'sdsd', '0.00', '0.00', 1, 0, b'0', 'AC', 12, 1, 2, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaherramientas`
--

CREATE TABLE `asignaherramientas` (
  `id` int(11) NOT NULL,
  `herrId` int(11) DEFAULT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `fechahora` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignausuario`
--

CREATE TABLE `asignausuario` (
  `id` int(11) NOT NULL,
  `usrId` int(11) DEFAULT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `fechahora` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asignausuario`
--

INSERT INTO `asignausuario` (`id`, `usrId`, `id_orden`, `fechahora`) VALUES
(1, 16, 4, '2018-09-19 11:50:17'),
(2, 17, 4, '2018-09-19 11:50:17'),
(3, 17, 10, '2018-10-18 04:41:14'),
(4, 17, 12, '2018-10-18 04:47:13'),
(5, 17, 19, '2018-10-20 22:28:33'),
(6, 1, 19, '2018-10-20 22:28:33'),
(7, 17, 20, '2018-10-20 23:51:41'),
(8, 18, 22, '2018-10-20 23:56:41'),
(9, 18, 23, '2018-10-20 23:58:00'),
(10, 17, 24, '2018-10-21 00:23:50'),
(11, 18, 25, '2018-10-21 00:27:42'),
(12, 17, 33, '2018-10-21 18:22:05'),
(13, 17, 1, '2018-10-23 19:38:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asp_detaplantillainsumos`
--

CREATE TABLE `asp_detaplantillainsumos` (
  `deta_id` int(11) NOT NULL,
  `artId` int(11) NOT NULL,
  `plant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `asp_detaplantillainsumos`
--

INSERT INTO `asp_detaplantillainsumos` (`deta_id`, `artId`, `plant_id`) VALUES
(1, 2, 1),
(2, 10, 1),
(3, 1234, 8),
(4, 65878, 8),
(5, 0, 9),
(6, 0, 10),
(7, 1234132, 11),
(8, 2345, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asp_plantillainsumos`
--

CREATE TABLE `asp_plantillainsumos` (
  `plant_id` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `plant_nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `asp_plantillainsumos`
--

INSERT INTO `asp_plantillainsumos` (`plant_id`, `descripcion`, `id_empresa`, `plant_nombre`, `estado`) VALUES
(1, 'descripcion plantilla1', 6, 'Plant-001', 'AC'),
(2, 'descrp palnt 1', 6, 'nom palt 1', 'AC'),
(3, 'descrp palnt 2', 6, 'nom palt 2', 'AC'),
(4, 'descrp palnt 2', 6, 'nom palt 2', 'AC'),
(5, 'descrp palnt 2', 6, 'nom palt 2', 'AC'),
(6, 'descrp palnt 2', 6, 'nom palt 2', 'AC'),
(7, 'descrp palnt 2', 6, 'nom palt 2', 'AC'),
(8, 'descrp palnt 2', 6, 'nom palt 2', 'AC'),
(9, 'descripcion 4', 6, 'plant 4 prueba', 'AC'),
(10, 'descrp 5', 6, 'paltilla 5', 'AC'),
(11, 'etrtq', 6, '66666666', 'AC'),
(12, 'adsfa', 6, 'plant 7', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asp_subtareas`
--

CREATE TABLE `asp_subtareas` (
  `id_subtarea` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `tareadescrip` varchar(5000) COLLATE utf8_spanish_ci NOT NULL,
  `id_tarea` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `tarea_realizada` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_equipo` int(11) NOT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `duracion_prog` int(11) DEFAULT NULL,
  `bpm_task_id` int(11) NOT NULL,
  `form_asoc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `asp_subtareas`
--

INSERT INTO `asp_subtareas` (`id_subtarea`, `id_orden`, `tareadescrip`, `id_tarea`, `id_usuario`, `fecha`, `tarea_realizada`, `id_equipo`, `fecha_inicio`, `fecha_fin`, `estado`, `duracion_prog`, `bpm_task_id`, `form_asoc`) VALUES
(2, 2, 'CL-PS: Recepción', 231, NULL, '2018-11-22 17:04:39', NULL, 45, NULL, NULL, 'T', 1, 100471, 1000),
(3, 2, 'CL-PS: Desarme', 231, NULL, '2018-11-23 17:04:39', NULL, 45, NULL, NULL, 'C', 1, 100471, 1200),
(4, 2, 'CL-PS: Lavado', 231, NULL, '2018-11-26 17:04:39', NULL, 45, NULL, NULL, 'T', 2, 100471, 1201),
(5, 2, 'CL-PS: Diagnóstico', 11, NULL, '2018-11-27 17:26:52', NULL, 45, NULL, NULL, 'PR', 2, 100471, NULL),
(6, 3, 'CL-PS: Recepción', 8, 34, '2018-11-22 18:10:53', NULL, 42, NULL, NULL, 'AS', 1, 100514, NULL),
(7, 2, 'CL-PS: Informe Técnico', 12, NULL, '2018-11-28 17:29:33', NULL, 45, NULL, NULL, 'PR', 1, 100471, NULL),
(8, 4, 'CL-PS: Recepción', 8, 34, '2018-11-22 18:41:57', NULL, 42, NULL, NULL, 'AS', 1, 120025, NULL),
(9, 5, 'CL-PS: Pintura', 15, 34, '2018-11-23 18:42:59', NULL, 22, NULL, NULL, 'AS', 3, 120034, NULL),
(10, 6, 'Registro De Trabajos A Realizar (RE-TAL-010-2017) ', 268, 34, '2018-11-22 19:58:36', NULL, 22, NULL, NULL, 'AS', 1, 120062, NULL),
(11, 6, 'Registro Diagnostico Y Reparación Turbo (RE-TAL-031-2017) ', 267, 34, '2018-11-22 19:58:36', NULL, 22, NULL, NULL, 'AS', 1, 120063, NULL),
(12, 6, 'Registro De Diagnostico Y Reparación De Bombas Inyectoras (RE-TAL-030-2018)', 266, 34, '2018-11-24 15:58:36', NULL, 22, NULL, NULL, 'AS', 1, 120064, NULL),
(13, 6, 'Registro Diagnostico De Block De Motor  (RE-TAL-005-2017)', 265, 34, '2018-11-22 12:03:47', NULL, 22, NULL, NULL, 'AS', 1, 120065, NULL),
(21, 7, 'CL-PS: Recepción', 8, 34, '2018-11-22 20:46:12', NULL, 42, NULL, NULL, 'AS', 1, 120117, NULL),
(23, 8, 'Registro De Trabajos A Realizar (RE-TAL-010-2017) ', 268, NULL, '2018-11-23 14:35:38', NULL, 42, NULL, NULL, 'PR', 1, 0, NULL),
(24, 8, 'Registro Diagnostico Y Reparación Turbo (RE-TAL-031-2017) ', 267, NULL, NULL, NULL, 0, NULL, NULL, 'C', NULL, 0, NULL),
(25, 8, 'Registro De Diagnostico Y Reparación De Bombas Inyectoras (RE-TAL-030-2018)', 266, NULL, NULL, NULL, 0, NULL, NULL, 'C', NULL, 0, NULL),
(26, 8, 'Registro Diagnostico De Block De Motor  (RE-TAL-005-2017)', 265, NULL, NULL, NULL, 0, NULL, NULL, 'C', NULL, 0, NULL),
(27, 8, 'Registro Diagnostico Cigüeñal (RE-TAL-001-2017)', 264, NULL, NULL, NULL, 0, NULL, NULL, 'C', NULL, 0, NULL),
(28, 8, 'Registro Diagnostico De  Volante, Placa y Polea (RE-TAL-003-2017)', 263, NULL, NULL, NULL, 0, NULL, NULL, 'C', NULL, 0, NULL),
(29, 8, 'Registro Diagnostico De  Compresor (RE-TAL-006-2017)', 262, NULL, NULL, NULL, 0, NULL, NULL, 'C', NULL, 0, NULL),
(30, 8, 'Registro Diagnostico De  Piezas No Mecanizadas  (RE-TAL-008-2017) ', 261, NULL, NULL, NULL, 0, NULL, NULL, 'C', NULL, 0, NULL),
(31, 8, 'Registro Diagnostico De Tapa De Cilindro (RE-TAL-004-2017) ', 260, NULL, NULL, NULL, 0, NULL, NULL, 'C', NULL, 0, NULL),
(32, 8, 'Registro Diagnostico De Bielas y Pistón (RE-TAL-002-2017)', 259, NULL, NULL, NULL, 0, NULL, NULL, 'C', NULL, 0, NULL),
(33, 8, 'Registro Diagnostico De Árbol De Levas (RE-TAL-007-2017)', 258, NULL, NULL, NULL, 0, NULL, NULL, 'C', NULL, 0, NULL),
(42, 0, 'CL-PS: Rectificado', 13, NULL, '2018-11-23 15:12:05', NULL, 48, NULL, NULL, 'PR', 8, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `idCiudades` int(11) NOT NULL,
  `Paises_Codigo` varchar(2) NOT NULL,
  `Ciudad` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`idCiudades`, `Paises_Codigo`, `Ciudad`) VALUES
(1, 'AR', 'Buenos Aires'),
(2, 'AR', 'Santa Fe'),
(3, 'AR', 'Córdoba'),
(4, 'AR', 'Misiones'),
(5, 'AR', 'Entre Rios'),
(6, 'AR', 'Mendoza'),
(7, 'AR', 'San Juan'),
(8, 'AR', 'Tucumán'),
(9, 'AR', 'Tierra del Fuego'),
(10, 'AR', 'Chaco'),
(11, 'AR', 'La Pampa'),
(12, 'AR', 'Jujuy'),
(13, 'AR', 'Rio Negro'),
(14, 'AR', 'Chubut'),
(15, 'AR', 'Corrientes'),
(16, 'AR', 'Santa Cruz'),
(17, 'AR', 'Salta'),
(18, 'AR', 'San Luis'),
(19, 'AR', 'Neuquen'),
(20, 'AR', 'Catamarca'),
(21, 'AR', 'Santiago del Estero'),
(22, 'AR', 'La Rioja'),
(23, 'AR', 'Formosa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `clinteid` int(11) NOT NULL,
  `clientrazonsocial` varchar(255) DEFAULT NULL,
  `clientdireccion` varchar(255) DEFAULT NULL,
  `clientmail` varchar(255) DEFAULT NULL,
  `clienttelefono` int(11) DEFAULT NULL,
  `clientetelefono1` varchar(255) DEFAULT NULL,
  `localidadid` varchar(50) DEFAULT NULL,
  `paisid` varchar(2) DEFAULT NULL,
  `provinciaid` int(11) DEFAULT NULL,
  `cuenta_cuentaid` int(11) NOT NULL,
  `plant_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`clinteid`, `clientrazonsocial`, `clientdireccion`, `clientmail`, `clienttelefono`, `clientetelefono1`, `localidadid`, `paisid`, `provinciaid`, `cuenta_cuentaid`, `plant_id`) VALUES
(1, 'TRazalog', 'av libertado 3890 oeste', 'ventas@trazalog.com', 2147483647, NULL, 'San Juan', '1', 1, 1, 1),
(2, 'MRS SERVICE SRL', '-', '-', NULL, NULL, NULL, 'AR', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componenteequipo`
--

CREATE TABLE `componenteequipo` (
  `idcomponenteequipo` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_componente` int(11) NOT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `codigo` varchar(40) DEFAULT NULL,
  `estado` varchar(4) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `sistemaid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `componenteequipo`
--

INSERT INTO `componenteequipo` (`idcomponenteequipo`, `id_equipo`, `id_componente`, `observacion`, `codigo`, `estado`, `id_empresa`, `sistemaid`) VALUES
(1, 1, 31, NULL, 'mt666-cucharon-electrico', 'AC', 6, 1),
(2, 1, 26, NULL, 'mt666-corredera-mecanico', 'AC', 6, 3),
(3, 9, 25, NULL, 'bateria mt666', 'P', 6, 4),
(4, 1, 1, NULL, 'codigo003', 'AC', 6, 1),
(5, 9, 57, NULL, 'codigo666', 'AC', 6, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componentes`
--

CREATE TABLE `componentes` (
  `id_componente` int(11) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  `fechahora` datetime DEFAULT NULL,
  `informacion` text COLLATE utf8_spanish_ci,
  `marcaid` int(11) DEFAULT NULL,
  `pdf` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `componentes`
--

INSERT INTO `componentes` (`id_componente`, `descripcion`, `id_equipo`, `fechahora`, `informacion`, `marcaid`, `pdf`, `estado`, `id_empresa`) VALUES
(1, 'MOTOR DIESEL', 1, '2018-07-03 10:55:57', '', 1, 'comp1.pdf', 'AC', 6),
(2, 'VALVULA DE PURGA', 1, '2018-07-03 10:57:26', '', 1, 'assets/filesequipos/2.pdf', 'AC', 6),
(3, 'FILTRO DE COMBUSTIBLE ', 1, '2018-07-03 10:57:44', '', 1, 'assets/filesequipos/3.pdf', 'AC', 6),
(4, 'RESPIRADOR DE TANQUE', 1, '2018-07-03 10:57:56', '', 1, 'assets/filesequipos/4.pdf', 'AC', 6),
(5, 'RADIADOR', 1, '2018-07-03 10:58:04', '', 1, 'assets/filesequipos/5.pdf', 'AC', 6),
(6, 'CORREA DE DISTRIBUCION DEL MOTOR', 2, '2018-07-03 11:06:02', '', 7, 'assets/filesequipos/6.pdf', 'AC', 6),
(7, 'VALVULA MOTOR', 2, '2018-07-03 11:06:23', '', 7, 'assets/filesequipos/7.pdf', 'AC', 6),
(8, 'FRENOS', 2, '2018-07-03 11:06:28', '', 7, 'assets/filesequipos/8.pdf', 'AC', 6),
(9, 'CINTURON DE SEGURIDAD', 2, '2018-07-03 11:06:41', '', 7, 'assets/filesequipos/9.pdf', 'AC', 6),
(10, 'DEPOSITO LIMPIAPARABRISAS', 2, '2018-07-03 11:06:59', '', 7, 'assets/filesequipos/10.pdf', 'AC', 6),
(11, 'VALVULA DE ESCAPE', 3, '2018-07-03 11:18:54', '', 8, 'assets/filesequipos/11.pdf', 'AC', 6),
(12, 'CARTER DEL MOTOR', 3, '2018-07-03 11:19:06', '', 5, 'comp12.pdf', 'AC', 6),
(13, 'VALVULA DE ALIVIO', 3, '2018-07-03 11:19:19', '', 5, 'comp13.pdf', 'AC', 6),
(14, 'REJILLA DE ACEITE DE DIRECCION ', 3, '2018-07-03 11:19:48', '', 5, 'comp14.pdf', 'AC', 6),
(15, 'CILINDRO DE DIRECCIÓN', 3, '2018-07-03 11:20:00', '', 5, 'comp15.pdf', 'AC', 6),
(16, 'LUCES', 4, '2018-07-03 11:27:31', '', 6, 'comp13.pdf', 'AC', 6),
(17, 'MOTOR', 4, '2018-07-03 11:28:05', '', 6, 'comp13.pdf', 'AN', 6),
(18, 'SOPORTE MOTOR', 4, '2018-07-03 11:28:40', '', 6, 'comp13.pdf', 'AN', 6),
(19, 'CADENA', 4, '2018-07-03 11:28:50', '', 6, 'assets/filesequipos/19.pdf', 'AN', 6),
(20, 'NEUMATICOS', 4, '2018-07-03 11:28:59', '', 6, 'assets/filesequipos/20.pdf', 'AN', 6),
(21, 'MOTOR DIESEL', 5, '2018-07-03 11:37:13', '', 1, 'assets/filesequipos/21.pdf', 'AN', 6),
(22, 'CORREDERA', 5, '2018-07-03 11:37:40', '', 1, 'assets/filesequipos/22.pdf', 'AN', 6),
(23, 'BRAZO', 5, '2018-07-03 11:37:54', '', 1, 'assets/filesequipos/23.pdf', 'AN', 6),
(24, 'SENSOR DE TEMPERATURA', 5, '2018-07-03 11:39:00', '', 1, 'comp13.pdf', 'AC', 6),
(25, 'BATERIA', 5, '2018-07-03 11:39:11', '', 1, 'comp13.pdf', 'AC', 6),
(26, 'CORREDERA', 1, '2018-07-03 16:08:09', '', 1, 'comp13.pdf', 'AC', 6),
(27, 'BRAZO', 1, '2018-07-03 16:50:47', '', 1, 'comp14.pdf', 'AC', 6),
(28, 'MARTILLO', 1, '2018-07-03 21:50:00', '', 1, 'comp14.pdf', 'AC', 6),
(29, 'BASTIDOR', 1, '2018-07-03 22:14:02', '', 1, 'comp14.pdf', 'AC', 6),
(30, 'BATERIA ', 1, '2018-07-03 22:20:52', '', 1, 'comp14.pdf', 'AC', 6),
(31, 'CUCHARON', 2, '2018-07-04 09:28:53', '', 7, 'comp14.pdf', 'AC', 6),
(32, 'TRANSMISION ', 2, '2018-07-04 09:55:19', '', 7, 'comp14.pdf', 'AC', 6),
(33, 'TANQUE HIDRAULICO ', 2, '2018-07-04 10:09:52', '', 7, 'comp15.pdf', 'AC', 6),
(34, 'COLUMNA DE DIRECCION', 2, '2018-07-04 10:21:36', '', 7, 'comp15.pdf', 'AC', 6),
(35, 'BATERIA', 2, '2018-07-04 10:32:04', '', 7, 'comp15.pdf', 'AC', 6),
(36, 'COJINETE', 2, '2018-07-04 10:32:23', '', 7, 'comp15.pdf', 'AC', 6),
(37, 'CARROCERIA', 2, '2018-07-04 10:32:54', '', 7, 'comp15.pdf', 'AC', 6),
(38, 'FILTRO DE ACEITE MOTOR', 2, '2018-07-04 10:33:14', '', 7, 'comp15.pdf', 'AC', 6),
(39, 'MOTOR', 2, '2018-07-04 10:33:25', '', 7, 'comp15.pdf', 'AC', 6),
(40, 'TANQUE DE COMBUSTIBLE', 2, '2018-07-04 10:41:43', '', 7, 'comp15.pdf', 'AC', 6),
(41, 'CORREA DE DISTRIBUCIÓN DEL MOTOR', 2, '2018-07-04 10:42:02', '', 7, 'assets/filesequipos/41.pdf', 'AC', 6),
(42, 'FILTRO DE AIRE PRIMARIO DEL MOTOR', 2, '2018-07-04 10:42:26', '', 7, 'assets/filesequipos/42.pdf', 'AC', 6),
(43, 'FILTRO DE AIRE SECUNDARIO DEL MOTOR', 2, '2018-07-04 10:42:47', '', 7, 'assets/filesequipos/43.pdf', 'AC', 6),
(44, 'FILTRO DE COMBUSTIBLE PRIMARIO DEL MOTOR', 2, '2018-07-04 10:43:13', '', 7, 'assets/filesequipos/44.pdf', 'AC', 6),
(45, 'VÁLVULAS DE ADMISIÓN', 3, '2018-07-04 11:40:18', '', 5, 'comp45.pdf', 'AC', 6),
(46, 'VÁLVULAS DE ADMISIÓN', 3, '2018-07-04 11:47:26', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/46.pdf', 'AC', 6),
(47, 'FILTRO DE ACEITE DE TRANSMISIÓN', 3, '2018-07-04 11:48:49', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/47.pdf', 'AC', 6),
(48, 'RESPIRADERO DE LA CAJA DE TRANSMISIÓN', 3, '2018-07-04 11:49:05', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/48.pdf', 'AC', 6),
(49, 'EJE DELANTERO', 3, '2018-07-04 11:49:21', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/49.pdf', 'AC', 6),
(50, 'EJE TRASERO', 3, '2018-07-04 11:49:40', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/50.pdf', 'AC', 6),
(51, 'DIFERENCIAL', 3, '2018-07-04 11:49:53', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/51.pdf', 'AC', 6),
(52, 'FILTRO DE ACONDICIONADOR DE AIRE DE CABINA', 3, '2018-07-04 11:50:08', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/52.pdf', 'AC', 6),
(53, 'TANQUE HIDRÁULICO ', 3, '2018-07-04 11:50:25', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/53.pdf', 'AC', 6),
(54, 'NEUMÁTICOS', 3, '2018-07-04 11:50:47', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/54.pdf', 'AC', 6),
(55, 'MANDO FINAL', 3, '2018-07-04 11:50:59', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/55.pdf', 'AC', 6),
(56, 'CHASIS', 3, '2018-07-04 11:51:12', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/56.pdf', 'AC', 6),
(57, 'ALARMA DE RETROCESO', 3, '2018-07-04 11:51:27', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/57.pdf', 'AC', 6),
(58, 'JAULA ANTIVUELCO', 3, '2018-07-04 11:51:41', '', 5, 'assets/filesequipos/58.pdf', 'AC', 6),
(59, 'CAJA DE TRANSMISION', 3, '2018-07-04 12:45:47', '', 5, 'assets/filesequipos/59.pdf', 'AC', 6),
(60, 'FILTRO DE ACEITE MOTOR', 4, '2018-07-05 11:35:02', '', 6, 'assets/filesequipos/60.pdf', 'AC', 7),
(61, 'CORREA DE DISTRIBUCIÓN DEL MOTOR', 4, '2018-07-05 11:35:29', '', 6, 'assets/filesequipos/61.pdf', 'AC', 7),
(62, 'FILTRO DE AIRE  DEL MOTOR', 4, '2018-07-05 11:35:59', '', 6, 'assets/filesequipos/62.pdf', 'AC', 7),
(63, 'FILTRO DE COMBUSTIBLE  DEL MOTOR', 4, '2018-07-05 11:36:18', '', 6, 'assets/filesequipos/63.pdf', 'AC', 7),
(64, 'RADIADOR DE MOTOR', 4, '2018-07-05 11:36:36', '', 6, 'assets/filesequipos/64.pdf', 'AC', 7),
(65, 'FRENOS', 4, '2018-07-05 11:36:55', '', 6, 'assets/filesequipos/65.pdf', 'AC', 7),
(66, 'FILTRO DE AIRE CABINA', 4, '2018-07-05 11:37:10', '', 6, 'assets/filesequipos/66.pdf', 'AC', 7),
(67, 'BATERÍA', 4, '2018-07-05 11:37:26', '', 6, 'assets/filesequipos/67.pdf', 'AC', 7),
(68, 'BOCINA', 4, '2018-07-05 11:37:41', '', 6, 'assets/filesequipos/68.pdf', 'AC', 7),
(69, 'ARTICULACIONES DE LA TORRE ', 4, '2018-07-05 11:38:01', '', 6, 'assets/filesequipos/69.pdf', 'AC', 7),
(70, 'CONVERTIDOR', 4, '2018-07-05 11:38:20', '', 6, 'assets/filesequipos/70.pdf', 'AC', 7),
(71, 'MANGUERAS', 4, '2018-07-05 11:38:40', '', 6, 'assets/filesequipos/71.pdf', 'AC', 7),
(72, 'AUTOELEVADOR TOYOTA', 4, '2018-07-05 11:39:01', '', 6, 'assets/filesequipos/72.pdf', 'AC', 7),
(73, 'CHASIS', 4, '2018-07-05 11:39:17', '', 6, 'assets/filesequipos/73.pdf', 'AC', 7),
(74, 'Motor Disel', 11, '2018-09-16 23:46:30', '-', 1, 'assets/filesequipos/74.pdf', 'AC', 7),
(75, 'Motor Diesel C32', 12, '2018-09-18 09:57:46', '', 5, 'assets/filesequipos/75.pdf', 'AC', 7),
(76, 'Motor Diesel C18', 13, '2018-09-18 10:05:16', '', 4, 'assets/filesequipos/76.pdf', 'AC', 7),
(77, 'Cabezal', 13, '2018-09-22 09:27:50', 'Cabezal de rotacion', 11, 'assets/filesequipos/77.pdf', 'AC', 7),
(78, 'Cabezal', 13, '2018-09-22 09:29:02', 'Cabezal de rotacion', 11, 'assets/filesequipos/78.pdf', 'AC', 7),
(79, 'compresor', 13, '2018-09-22 09:42:25', 'compresor  de aire de barrido 1070 HR2.5', 11, 'assets/filesequipos/79.pdf', 'AC', 7),
(80, 'Filtros de aire ', 13, '2018-09-22 10:25:39', 'Aire primario  52252061', 12, 'assets/filesequipos/80.pdf', 'AC', 7),
(81, 'Filtros de aire ', 13, '2018-09-22 10:28:32', 'Filtors primarios: 52252061\nFiltros de seguridad: 52146966', 11, 'assets/filesequipos/81.pdf', 'AC', 7),
(82, 'Filtro de aceite de motor ', 13, '2018-09-22 10:39:41', '', 11, 'assets/filesequipos/82.pdf', 'AC', 7),
(83, 'Filtros de combustible ', 13, '2018-09-22 11:03:20', '57294829 filtro secundario \n57886301 filtro primario ', 12, 'assets/filesequipos/83.pdf', 'AC', 7),
(84, 'Filtros de aceite de compresor ', 13, '2018-09-22 11:06:53', '', 12, 'assets/filesequipos/84.pdf', 'AC', 7),
(85, 'Filtro interior de cabina ', 13, '2018-09-22 11:10:20', '', 12, 'assets/filesequipos/85.pdf', 'AC', 7),
(86, 'Filtro respiradero de tanque de combustible ', 13, '2018-09-22 11:12:50', '', 12, 'assets/filesequipos/86.pdf', 'AC', 7),
(87, 'Filtro respiradero tanque de combustible ', 13, '2018-09-22 11:15:43', '', 12, 'assets/filesequipos/87.pdf', 'AC', 7),
(88, 'Filtro respiradero de tanque hidráulico ', 13, '2018-09-22 11:17:54', '', 12, 'assets/filesequipos/88.pdf', 'AC', 7),
(89, 'Filtro separador ', 13, '2018-09-22 11:28:47', '57569758 ', 11, 'assets/filesequipos/89.pdf', 'AC', 7),
(90, 'Regulador UL-88', 13, '2018-09-22 11:35:43', '', 11, 'assets/filesequipos/90.pdf', 'AC', 7),
(91, 'Kit de reparacion UL-88', 13, '2018-09-22 11:41:33', '36037471 KIT DE REPARACIÓN ', 11, 'assets/filesequipos/91.pdf', 'AC', 7),
(92, 'FILTRO DE ACEITE MOTOR - CAT', 16, '2018-09-22 12:01:39', '', 11, 'assets/filesequipos/92.pdf', 'AC', 7),
(93, 'Filtros colector de polvo ', 13, '2018-09-22 12:02:01', '', 11, 'assets/filesequipos/93.pdf', 'AC', 7),
(94, 'Filtro de cabina exterior ', 13, '2018-09-22 12:06:45', 'Items 11. ', 11, 'assets/filesequipos/94.pdf', 'AC', 7),
(95, 'Filtro de Combustible Primario', 16, '2018-09-22 12:07:54', 'Trampa de agua', 11, 'assets/filesequipos/95.pdf', 'AC', 7),
(96, 'Filtro de cabina ', 13, '2018-09-22 12:10:10', '', 11, 'assets/filesequipos/96.pdf', 'AC', 7),
(97, 'Filtro separador de compresor', 13, '2018-09-22 12:16:13', '', 11, 'assets/filesequipos/97.pdf', 'AC', 7),
(98, 'Filtro hidraulico ', 13, '2018-09-22 12:34:52', '', 11, 'assets/filesequipos/98.pdf', 'AC', 7),
(99, 'Filtros de retorno hidraulico', 13, '2018-09-22 12:38:31', '', 11, 'assets/filesequipos/99.pdf', 'AC', 7),
(100, 'Filtro de compresor alta presion ', 13, '2018-09-22 12:42:31', '', 12, 'assets/filesequipos/100.pdf', 'AC', 7),
(101, 'Filtro de refrigerante ', 13, '2018-09-22 13:11:58', 'sin adjunto', 12, 'assets/filesequipos/101.pdf', 'AC', 7),
(102, 'Separador de combustible CAT', 13, '2018-09-22 13:15:40', 'sin adjunto ', 11, 'assets/filesequipos/102.pdf', 'AC', 7),
(103, 'Bomba Principal', 16, '2018-09-22 13:24:30', 'Caudal Variable', 11, 'assets/filesequipos/103.pdf', 'AC', 7),
(104, 'Bomba Secundaria', 16, '2018-09-22 13:25:46', 'Bomba Engranaje', 11, 'assets/filesequipos/104.pdf', 'AC', 7),
(105, 'Motor Hidraulico de Traslacion', 16, '2018-09-22 13:27:09', 'Motor variable', 11, 'assets/filesequipos/105.pdf', 'AC', 7),
(106, 'Acople de goma', 16, '2018-09-22 13:28:03', '', 12, 'assets/filesequipos/106.pdf', 'AC', 7),
(107, 'Guia de teflon cabezal', 16, '2018-09-22 13:29:01', '', 12, 'assets/filesequipos/107.pdf', 'AC', 7),
(108, 'Cilindro Hidraulico', 16, '2018-09-22 13:30:00', '', 12, 'assets/filesequipos/108.pdf', 'AC', 7),
(109, 'Filtro de aire secundario ', 13, '2018-09-22 13:30:06', '', 11, 'assets/filesequipos/109.pdf', 'AC', 7),
(110, 'Motor HyD de colector de polvo', 16, '2018-09-22 13:32:31', '', 11, 'assets/filesequipos/110.pdf', 'AC', 7),
(111, 'Cable de Avance', 16, '2018-09-22 13:33:37', '', 12, 'assets/filesequipos/111.pdf', 'AC', 7),
(112, 'Cable de carro', 16, '2018-09-22 13:34:30', '', 12, 'assets/filesequipos/112.pdf', 'AC', 7),
(113, 'Filtro de aire primario Cat', 13, '2018-09-22 13:36:15', '', 11, 'assets/filesequipos/113.pdf', 'AC', 7),
(114, 'Filtro de aceite ', 13, '2018-09-22 13:38:38', '', 4, 'assets/filesequipos/114.pdf', 'AC', 7),
(115, 'Cardan', 13, '2018-09-22 16:12:22', '', 12, 'assets/filesequipos/115.pdf', 'AC', 7),
(116, 'Kit para reparacion de PTO', 13, '2018-09-22 16:44:59', 'BEARING \n', 11, 'assets/filesequipos/116.pdf', 'AC', 7),
(117, 'Bearing', 13, '2018-09-22 17:07:18', 'item 10', 11, 'assets/filesequipos/117.pdf', 'AC', 7),
(118, 'GEAR ', 13, '2018-09-22 17:14:44', 'ITEMS 9 ', 11, 'assets/filesequipos/118.pdf', 'AC', 7),
(119, 'Gear ', 13, '2018-09-22 17:15:16', 'ITEMS 9 ', 11, 'assets/filesequipos/119.pdf', 'AC', 7),
(120, 'Ring snap', 13, '2018-09-22 17:20:11', 'items 17 para reparción de pto', 11, 'assets/filesequipos/120.pdf', 'AC', 7),
(121, 'Ring retaining', 14, '2018-09-22 17:23:07', 'items 18 ', 11, 'assets/filesequipos/121.pdf', 'AC', 7),
(122, 'Shaft, imput ', 13, '2018-09-22 17:29:04', 'items 7 para reparacion de pto ', 12, 'assets/filesequipos/122.pdf', 'AC', 7),
(123, 'Adapter ', 13, '2018-09-22 17:33:08', 'items 6 para reparacion de pto', 11, 'assets/filesequipos/123.pdf', 'AC', 7),
(124, 'O´ring ', 13, '2018-09-22 17:44:17', 'items 12 para reparacion de pto ', 11, 'assets/filesequipos/124.pdf', 'AC', 7),
(125, 'Seal Oil ', 13, '2018-09-22 17:50:43', 'items 16 para reparación de pto ', 11, 'assets/filesequipos/125.pdf', 'AC', 7),
(126, 'PTO grupo completo ', 13, '2018-09-22 17:52:41', 'PTO Completa ', 11, 'assets/filesequipos/126.pdf', 'AC', 7),
(127, 'Bomba Principal ', 13, '2018-09-22 18:03:14', 'Bomba principal Completa ', 11, 'assets/filesequipos/127.pdf', 'AC', 7),
(128, 'Bomba doble', 13, '2018-09-22 18:15:36', 'Sin adjunto, Bomba doble ', 11, 'assets/filesequipos/128.pdf', 'AC', 7),
(129, 'Sello espejo eje de bomba principal ', 13, '2018-09-22 18:21:15', 'Sello espejo. sin adjunto ', 11, 'assets/filesequipos/129.pdf', 'AC', 7),
(130, 'Sello de  eje bomba principal ', 13, '2018-09-22 18:26:08', 'items 5 ', 11, 'assets/filesequipos/130.pdf', 'AC', 7),
(131, 'Cilindro Hidráulico de pull down ', 13, '2018-09-22 18:34:12', 'Cilindro Hidráulico ', 11, 'assets/filesequipos/131.pdf', 'AC', 7),
(132, 'Cilindro hidráulico capota de polvo ', 13, '2018-09-22 18:46:59', '', 12, 'assets/filesequipos/132.pdf', 'AC', 7),
(133, 'Valvula Diverter ', 13, '2018-09-22 18:54:40', 'sin adjunto ', 12, 'assets/filesequipos/133.pdf', 'AC', 7),
(134, 'Motor Hidráulico bomba de agua ', 13, '2018-09-22 19:12:15', '', 11, 'assets/filesequipos/134.pdf', 'AC', 7),
(135, 'Motor HCO Carrucel ', 13, '2018-09-25 11:24:34', 'Item 36 ', 11, 'assets/filesequipos/135.pdf', 'AC', 7),
(136, 'Motor HCO Fan Radiador ', 13, '2018-09-25 11:39:41', 'Item 36 ', 11, 'assets/filesequipos/136.pdf', 'AC', 7),
(137, 'Motor HCO Traslación ', 13, '2018-09-25 11:57:56', '', 12, 'assets/filesequipos/137.pdf', 'AC', 7),
(138, 'Motor HCO Rotación ', 13, '2018-09-25 12:02:03', 'Item 28 ', 12, 'assets/filesequipos/138.pdf', 'AC', 7),
(139, 'Motor HCO Cable Winch ', 13, '2018-09-25 12:06:09', 'Item 49 ', 12, 'assets/filesequipos/139.pdf', 'AC', 7),
(140, 'Cables de Pull Down ', 13, '2018-09-25 12:21:13', '', 12, 'assets/filesequipos/140.pdf', 'AC', 7),
(141, 'Cadenas De Holback ', 13, '2018-09-25 12:26:54', 'Items 26 ', 12, 'assets/filesequipos/141.pdf', 'AC', 7),
(142, 'Poleas de Cable de Pull Down  ', 13, '2018-09-25 12:33:08', 'Item 5 ', 11, 'assets/filesequipos/142.pdf', 'AC', 7),
(143, 'Sprocket deHoldback', 13, '2018-09-25 12:37:08', 'Items 27 ', 12, 'assets/filesequipos/143.pdf', 'AC', 7),
(144, 'Placa Porta Barras ', 13, '2018-09-25 12:43:36', 'Items 6 ', 12, 'assets/filesequipos/144.pdf', 'AC', 7),
(145, 'Guia de Barras ', 13, '2018-09-25 12:50:59', 'Items 2 ', 11, 'assets/filesequipos/145.pdf', 'AC', 7),
(146, 'Limit Switch ', 13, '2018-09-25 12:55:23', 'Items 1 ', 11, 'assets/filesequipos/146.pdf', 'AC', 7),
(147, 'Joystick Traslacion ', 13, '2018-09-25 13:00:50', 'Items 26 ', 12, 'assets/filesequipos/147.pdf', 'AC', 7),
(148, 'Joystick Rotación ', 13, '2018-09-25 13:04:52', 'Item 25 ', 12, 'assets/filesequipos/148.pdf', 'AC', 7),
(149, 'Joystick de Avance ', 13, '2018-09-25 13:13:52', 'Item 66 ', 12, 'assets/filesequipos/149.pdf', 'AC', 7),
(150, 'Burlete de Puerta Cabina ', 13, '2018-09-25 13:18:37', '', 12, 'assets/filesequipos/150.pdf', 'AC', 7),
(151, 'Butaca de Operador ', 13, '2018-09-25 13:23:45', 'Items 103 ', 12, 'assets/filesequipos/151.pdf', 'AC', 7),
(152, 'Bocina', 13, '2018-09-25 13:27:33', 'Items 1', 12, 'assets/filesequipos/152.pdf', 'AC', 7),
(153, 'Motor Limpia Parabrisas ', 13, '2018-09-25 13:32:50', 'Items 147 ', 11, 'assets/filesequipos/153.pdf', 'AC', 7),
(154, 'Escobillas 20'''' ', 13, '2018-09-25 13:37:16', 'items 152 ', 12, 'assets/filesequipos/154.pdf', 'AC', 7),
(155, 'Escobillas 28'''' ', 13, '2018-09-25 13:40:26', 'Items 153 ', 12, 'assets/filesequipos/155.pdf', 'AC', 7),
(156, 'Switch 2 Posiciones DR/PR ', 13, '2018-09-25 13:47:57', 'Items 27 ', 12, 'assets/filesequipos/156.pdf', 'AC', 7),
(157, 'Acelerador de Motor ', 13, '2018-09-25 16:39:00', 'Items 06 ', 12, 'assets/filesequipos/157.pdf', 'AC', 7),
(158, 'Botón Pulsador (Arranque) ', 13, '2018-09-25 16:42:58', 'Items 15 ', 12, 'assets/filesequipos/158.pdf', 'AC', 7),
(159, 'Compresor Completo ', 13, '2018-09-25 16:45:45', '', 11, 'assets/filesequipos/159.pdf', 'AC', 7),
(160, 'Valvula de Mínima ', 13, '2018-09-25 16:51:08', 'Items 6', 12, 'assets/filesequipos/160.pdf', 'AC', 7),
(161, 'Válvula de Alivio de Seguridad Tanque ', 13, '2018-09-25 16:56:41', 'Items 31 ', 11, 'assets/filesequipos/161.pdf', 'AC', 7),
(162, 'Mangon ', 13, '2018-09-25 17:00:14', 'Items 3', 12, 'assets/filesequipos/162.pdf', 'AC', 7),
(163, 'Cable de Seguridad ', 13, '2018-09-25 17:05:19', 'Items 8 ', 12, 'assets/filesequipos/163.pdf', 'AC', 7),
(164, 'Mangon de Descarga ', 13, '2018-09-25 17:08:44', 'Items 8 ', 11, 'assets/filesequipos/164.pdf', 'AC', 7),
(165, 'Bomba de Lubrican Compresor ', 13, '2018-09-25 17:13:01', 'Items 2 ', 11, 'assets/filesequipos/165.pdf', 'AC', 7),
(166, 'Cable Positivo ', 13, '2018-09-25 17:18:04', 'Items 3 ', 11, 'assets/filesequipos/166.pdf', 'AC', 7),
(167, 'Cable de Batería ', 13, '2018-09-25 17:21:50', 'Items 2 ', 11, 'assets/filesequipos/167.pdf', 'AC', 7),
(168, 'Cable negativo  ', 13, '2018-09-25 17:25:04', 'Items 05 ', 12, 'assets/filesequipos/168.pdf', 'AC', 7),
(169, 'Cable Switch Arranque ', 13, '2018-09-25 17:32:06', 'Items 11 ', 12, 'assets/filesequipos/169.pdf', 'AC', 7),
(170, 'kit Filtros de Aire Primarios ', 16, '2018-09-25 17:48:33', 'Items 2 ', 11, 'assets/filesequipos/170.pdf', 'AC', 7),
(171, 'kit Filtros de Aire Primarios ', 16, '2018-09-25 17:49:11', 'Items 2 ', 11, 'assets/filesequipos/171.pdf', 'AC', 7),
(172, 'Filtro Respiradero ', 16, '2018-09-25 17:56:58', 'sin adjunto ', 12, 'assets/filesequipos/172.pdf', 'AC', 7),
(173, 'Acople de Goma Bombas ', 16, '2018-09-25 19:31:27', 'Items 1 ', 11, 'assets/filesequipos/173.pdf', 'AC', 7),
(174, 'Guias de Teflon Cabezal ', 16, '2018-09-25 19:40:06', 'Items 2 ', 12, 'assets/filesequipos/174.pdf', 'AC', 7),
(175, 'Motor HCO Colector de Polvo ', 16, '2018-09-25 19:58:28', '', 12, 'assets/filesequipos/175.pdf', 'AC', 7),
(176, 'Bomba de Agua Dynaset ', 16, '2018-09-25 20:14:30', '', 12, 'assets/filesequipos/176.pdf', 'AC', 7),
(177, 'Bulon de Zapata ', 16, '2018-09-25 20:17:23', 'items 13', 12, 'assets/filesequipos/177.pdf', 'AC', 7),
(178, 'Tuerca de Zapata', 16, '2018-09-25 20:19:03', 'Items 14 ', 12, 'assets/filesequipos/178.pdf', 'AC', 7),
(179, 'Acople de Goma Copresor ', 16, '2018-09-25 20:22:44', 'Items 1 ', 12, 'assets/filesequipos/179.pdf', 'AC', 7),
(180, 'Válvula Control de Presión de Aire ', 16, '2018-09-25 20:31:58', 'Oil Stop: kit de reparacion:2911 0118 00', 11, 'assets/filesequipos/180.pdf', 'AC', 7),
(181, 'Luces de Trabajo ', 16, '2018-09-25 20:35:23', 'Items 30', 11, 'assets/filesequipos/181.pdf', 'AC', 7),
(182, 'Escobillas ', 16, '2018-09-25 20:45:15', '', 12, 'assets/filesequipos/182.pdf', 'AC', 7),
(183, 'Espejo', 16, '2018-09-25 21:28:01', '', 12, 'assets/filesequipos/183.pdf', 'AC', 7),
(184, 'Forzador F.C', 16, '2018-09-25 21:31:40', 'Items 3 ', 11, 'assets/filesequipos/184.pdf', 'AC', 7),
(185, 'Sensor Indutivo  ', 16, '2018-09-25 21:35:40', 'B118, B178', 11, 'assets/filesequipos/185.pdf', 'AC', 7),
(186, 'Cabezal SH', 16, '2018-09-25 21:37:32', 'Sin adjunto', 12, 'assets/filesequipos/186.pdf', 'AC', 7),
(187, 'Bomba de Lubricacion  ', 16, '2018-09-25 21:40:35', '', 12, 'assets/filesequipos/187.pdf', 'AC', 7),
(188, 'Bomba de Grasa de Barras ', 16, '2018-09-25 21:42:18', '', 11, 'assets/filesequipos/188.pdf', 'AC', 7),
(189, 'Rele K11 ', 16, '2018-09-25 21:44:48', '', 12, 'assets/filesequipos/189.pdf', 'AC', 7),
(190, 'Relee K5 ', 16, '2018-09-25 21:46:06', '', 11, 'assets/filesequipos/190.pdf', 'AC', 7),
(191, 'Sensores B336A-B336B-B147', 16, '2018-09-25 21:49:40', '', 11, 'assets/filesequipos/191.pdf', 'AC', 7),
(192, 'Sensor B360', 16, '2018-09-25 21:55:43', '', 12, 'assets/filesequipos/192.pdf', 'AC', 7),
(193, 'Sensor B336', 16, '2018-09-25 21:57:28', '', 11, 'assets/filesequipos/193.pdf', 'AC', 7),
(194, 'Sensor B337', 16, '2018-09-25 21:58:42', '', 12, 'assets/filesequipos/194.pdf', 'AC', 7),
(195, 'Sensor B134 ', 16, '2018-09-25 22:03:34', '', 12, 'assets/filesequipos/195.pdf', 'AC', 7),
(196, 'Sensor B262', 16, '2018-09-25 22:05:49', '', 12, 'assets/filesequipos/196.pdf', 'AC', 7),
(197, 'Sensor B361', 16, '2018-09-25 22:07:11', '', 12, 'assets/filesequipos/197.pdf', 'AC', 7),
(198, 'Sensor B143 ', 16, '2018-09-25 22:09:29', '', 12, 'assets/filesequipos/198.pdf', 'AC', 7),
(199, 'Valvulas Y115 e Y116', 16, '2018-09-25 22:13:04', '', 12, 'assets/filesequipos/199.pdf', 'AC', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conffamily`
--

CREATE TABLE `conffamily` (
  `famId` int(11) NOT NULL,
  `famName` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `conffamily`
--

INSERT INTO `conffamily` (`famId`, `famName`, `estado`, `id_empresa`) VALUES
(1, 'Bulones', 'AC', 6),
(2, 'Bujes', 'AC', 6),
(3, 'Filtros', 'AC', 6),
(4, 'Diafragmas', 'AC', 6),
(5, 'Ejes', 'AC', 6),
(6, 'Valvulas', 'AC', 6),
(7, 'Sellos', 'AC', 6),
(8, 'Retenes', 'AC', 6),
(9, 'Tuercas', 'AC', 6),
(10, 'Trampas de Agua', 'AC', 6),
(11, 'Arandelas', 'AC', 6),
(12, 'Guias', 'AC', 6),
(13, 'Pernos', 'AC', 6),
(14, 'Cojinetes', 'AC', 6),
(15, 'Juntas', 'AC', 6),
(16, 'Cables', 'AC', 6),
(17, 'Termostatos', 'AC', 6),
(19, 'Compresores', 'AC', 6),
(20, 'Corta Corriente', 'AC', 6),
(21, 'Correas', 'AC', 6),
(22, 'Cubiertas', 'AC', 6),
(23, 'Radiadores', 'AC', 6),
(24, 'Motor', 'AC', 6),
(25, 'Crucetas', 'AC', 6),
(26, 'Espejos', 'AC', 6),
(28, 'Pasador', 'AC', 0),
(29, 'Platos', 'AC', 0),
(30, 'Seguros', 'AC', 0),
(31, 'Tapas', 'AC', 0),
(32, 'Alternadores', 'AC', 0),
(33, 'Faros', 'AC', 0),
(34, 'Bombines', 'AC', 0),
(35, 'Llantas', 'AC', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `confsubfamily`
--

CREATE TABLE `confsubfamily` (
  `sfamId` int(11) NOT NULL,
  `sfamName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `famId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `confsubfamily`
--

INSERT INTO `confsubfamily` (`sfamId`, `sfamName`, `famId`) VALUES
(8, 'Cocina', 5),
(9, 'Heladera', 5),
(10, 'Microondas', 5),
(11, 'Futón', 6),
(12, 'Alacena', 6),
(13, 'Sillas', 6),
(14, 'Taladro', 7),
(15, 'Amoladora', 7),
(16, 'LLaves', 7),
(17, 'Afeitadora', 8),
(18, 'Secador de Cabello', 8),
(19, 'Masajeador', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `confzone`
--

CREATE TABLE `confzone` (
  `zonaId` int(11) NOT NULL,
  `zonaName` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `confzone`
--

INSERT INTO `confzone` (`zonaId`, `zonaName`) VALUES
(10, 'Caucete'),
(11, 'Zonda'),
(12, 'Rivadavia'),
(13, 'Sarmiento'),
(14, 'Los Berros'),
(15, 'El Encón');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratistaquipo`
--

CREATE TABLE `contratistaquipo` (
  `id_equipo` int(1) NOT NULL,
  `id_contratista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `contratistaquipo`
--

INSERT INTO `contratistaquipo` (`id_equipo`, `id_contratista`) VALUES
(2, 17),
(4, 17),
(10, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratistas`
--

CREATE TABLE `contratistas` (
  `id_contratista` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET latin1 NOT NULL,
  `contradireccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `contramail` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contramail1` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contracelular1` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contracelular2` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contratelefono` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contracontacto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `estado` char(4) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `contratistas`
--

INSERT INTO `contratistas` (`id_contratista`, `nombre`, `contradireccion`, `contramail`, `contramail1`, `contracelular1`, `contracelular2`, `contratelefono`, `contracontacto`, `estado`, `id_empresa`) VALUES
(17, 'Clorox', 'Clorox', 'Clorox', 'Clorox', '156565665', '156565665', '156565665', '156565665', 'AC', 6),
(19, 'Trazalog', 'Lib. Gral. S. Martin 1890', 'soporte@tazalog.com', 'soporte@tazalog.com', '155555555', '155555555', '155555555', 'Soporte', 'AC', 6),
(20, 'contratista emp 6', 'calle sin numero', 'contratista@gmail.com', '', '1555555', '16666666', '42555555', 'hugo', 'AC', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `criticidad`
--

CREATE TABLE `criticidad` (
  `id_criti` int(10) NOT NULL,
  `descripcion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `estado` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `criticidad`
--

INSERT INTO `criticidad` (`id_criti`, `descripcion`, `id_empresa`, `estado`) VALUES
(1, 'Alta', 6, 'AC'),
(2, 'Media', 6, 'AC'),
(3, 'Baja', 6, 'AC'),
(9, 'muy alta', 6, 'AC'),
(10, '666', 6, 'AN'),
(11, 'Alta', 7, 'AC'),
(12, 'Media', 7, 'AC'),
(13, 'Baja', 7, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deta_ordeninsumos`
--

CREATE TABLE `deta_ordeninsumos` (
  `id_detaordeninsumo` int(11) NOT NULL,
  `id_ordeninsumo` int(11) DEFAULT NULL,
  `loteid` int(10) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double DEFAULT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `deta_ordeninsumos`
--

INSERT INTO `deta_ordeninsumos` (`id_detaordeninsumo`, `id_ordeninsumo`, `loteid`, `cantidad`, `precio`, `id_empresa`) VALUES
(1, 2, 2, 22, NULL, 6),
(2, 5, 1, 1, NULL, 6),
(3, 6, 1, 1, NULL, 6),
(4, 6, 2, 6, NULL, 6),
(5, 7, 1, 4, NULL, 6),
(6, 7, 1, 5, NULL, 6),
(7, 8, 2, 5, NULL, 6),
(8, 8, 4, 10, NULL, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deta_ordenservicio`
--

CREATE TABLE `deta_ordenservicio` (
  `id_detasercicio` int(11) NOT NULL,
  `id_ordenservicio` int(11) NOT NULL,
  `id_tarea` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `tiempo` varchar(100) CHARACTER SET latin1 NOT NULL,
  `observacion` text CHARACTER SET latin1,
  `monto` double NOT NULL,
  `id_componente` int(11) NOT NULL,
  `rh` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `deta_ordenservicio`
--

INSERT INTO `deta_ordenservicio` (`id_detasercicio`, `id_ordenservicio`, `id_tarea`, `tiempo`, `observacion`, `monto`, `id_componente`, `rh`) VALUES
(1, 1, 'tarea test 02', '', NULL, 0, 0, NULL),
(2, 1, 'tarea test 02 b', '', NULL, 0, 0, NULL),
(3, 1, 'tarea test 02 c', '', NULL, 0, 0, NULL),
(4, 2, 'TAREA REAIZADA TEST HUGO', '', NULL, 0, 0, NULL),
(5, 2, 'TAREA REALIZADA TEST 2 HUGO', '', NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deta_remito`
--

CREATE TABLE `deta_remito` (
  `detaremitoid` int(11) NOT NULL,
  `id_remito` int(11) NOT NULL,
  `loteid` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `deta_remito`
--

INSERT INTO `deta_remito` (`detaremitoid`, `id_remito`, `loteid`, `cantidad`, `precio`, `id_empresa`) VALUES
(1, 1, 1, 100, 0, 6),
(2, 2, 7, 50, 0, 6),
(3, 2, 8, 25, 0, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id_empresa` int(50) NOT NULL,
  `descripcion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `empcuit` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `empdir` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `emptelefono` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `empemail` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliImagePath` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `localidadid` int(11) DEFAULT NULL,
  `provinciaid` int(11) DEFAULT NULL,
  `paisid` int(11) DEFAULT NULL,
  `gps` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `empcelular` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `zonaId` int(11) DEFAULT NULL,
  `emlogo` blob,
  `clienteid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id_empresa`, `descripcion`, `empcuit`, `empdir`, `emptelefono`, `empemail`, `cliImagePath`, `localidadid`, `provinciaid`, `paisid`, `gps`, `empcelular`, `zonaId`, `emlogo`, `clienteid`) VALUES
(6, 'DEMO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(7, 'MINA CHINCHILLAS', '20000000', '2000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0xffd8ffe000104a46494600010101006000600000ffdb0043000201010201010202020202020202030503030303030604040305070607070706070708090b0908080a0807070a0d0a0a0b0c0c0c0c07090e0f0d0c0e0b0c0c0cffdb004301020202030303060303060c0807080c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0cffc0001108008e014603012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00fdfcaf35d77f6ccf83fe17d6ef34cd4fe2b7c36d3b52d3a77b5bbb4baf1359433daca8c55e37469032bab020a900820835e955fcdb7edd1ff27b5f18bfec78d6bff4be7af7787b25866352709c9c7955f43c1cf7379e029c6708a7776d4fdf6ff86e8f825ff458be15ff00e15961ff00c768ff0086e8f825ff00458be15ffe15961ffc76bf9b6a2beb3fd44a1ff3f5fdc8f99ff5d2bffcfb5f7b3fa49ff86e8f825ff458be15ff00e15961ff00c7696dff006e1f82d753a4517c5ff85d24b2304444f155833331e0003cde4935fcdad26297fa8943fe7ebfb90ffd75adff003e97decfea74515e03ff0004c7fda47fe1a93f62df06f886e2e3ed1acd8db7f63eae4b6e7fb5db623676ff006a4411cbff006d457bf57e7389a12a1565467bc5b5f71f7d46b46ad38d586d249af9851451589a8c96658636776544404b331c0007726bcbff00e1ba3e097fd162f857ff00856587ff001daf35ff0082bcfed263f66bfd87fc53736b71e46b7e2a5ff84774cda70e1ee1584ae3b82902ccc0f660bd322bf002bebb87f8656614655eac9c55ecadd7b9f2f9ef10bc0d58d1a71526d5ddff0003fa49ff0086e8f825ff00458be15ffe15961ffc768ff86e8f825ff458be15ff00e15961ff00c76bf9b6a2bdff00f51287fcfd7f723c3ff5d2bffcfb5f7b3fa49ff86e8f825ff458be15ff00e15961ff00c76af7863f6bef84be37f105a693a2fc51f875abeab7f2086d6cacbc4967717172e7a2a469216663e8066bf9a8af77ff0082620ff8d80fc27ffb1820feb58627826852a33aaaabf7537b2e88e8c2f17d6ab5a149d34b99a5bbeaec7f44b5cafc4cf8e9e09f82df62ff0084cbc63e15f09ff69799f63fed9d5adec3ed5e5eddfe5f9aebbf6ef4ce338deb9ea2baaafcb1ff008397867fe14aff00dc73ff0071d5f199360238dc6430d27652bebe89bfd0fabcdb1b2c26167888abb56d3d5a5fa9f7dffc3747c12ffa2c5f0aff00f0acb0ff00e3b47fc3747c12ff00a2c5f0afff000acb0ffe3b5fcdb515f75fea250ff9fafee47c67fae95ffe7dafbd9fd24ffc3747c12ffa2c5f0aff00f0acb0ff00e3b47fc3747c12ff00a2c5f0afff000acb0ffe3b5fcdb5147fa8943fe7ebfb907fae95ff00e7dafbd9fd24ff00c3747c12ff00a2c5f0afff000acb0ffe3b47fc3747c12ffa2c5f0aff00f0acb0ff00e3b5fcdb5147fa8943fe7ebfb907fae95ffe7dafbd9fd24ffc3747c12ffa2c5f0aff00f0acb0ff00e3b56ec3f6c7f845aa4424b6f8a7f0e2e6363b4345e25b2704fa64495fcd5d26293e03a1d2abfb9151e35ab7d692fbd9fd45f86bc61a4f8cec7ed5a3ea9a76ad6c0edf3acee5278f3c8c6e4247507f2ad1cd7f2e7e19f15ea9e0bd5e2d4346d4b50d26fe1398ee6cae1e09a33ea1d0823f3afb8ff621ff0082ea7c40f82dae58e8df136e6ebc7be117758a4bb9b0dabd8267975978f3f19c9594963d9c743e5e3b823114e2e7869a9dba5acfe5ab4ff03d3c171861eac942bc5c2fd6f75f3dac7ed551585f0d7e25687f183c05a4f89fc35a8c1ab687addbadd59dd424ed950fb1e410410548054820804115bb5f1128b8b7192b347d7269aba0aa9ae6bd65e19d26e2ff0052bcb5d3ec6d53cc9ae6e6558a2857fbcccc4003dcd787fedfbfb7ff0085bf60af85f1eabab27f6af88b56df1e8ba2c726c92f9d71b9d9b07644991b9b07a800126bf0ebf6aefdb93e247ed97e2a7bff001a6bd3cd629217b4d1ed59a1d36c07611c39c671fc6db9cf763c57d1e4bc3588c7af6adf2c3bf7f45faec7859bf1050c0be4f8a7d974f57d3f33f63fe347fc16bbf67df83b712db47e2ab9f17dec248783c3b66d78bf513b148181ff006643fcabe7df17ff00c1c9fe1ab2b971a07c2bd7352841f91b50d662b1661c750914c077ee7a57e4b628afb9c3f06e5d4d7be9cbd5dbf2b1f1b5f8bb1d37ee5a3e8aff009dcfd369ff00e0e51d7da6731fc27d1d232c762b6bb23301d813e48c9f7c0fa549a77fc1ca9acc5788d77f0934c9edc677a43e2092273c718630301ce3f84ff5afcc4c52818aecff0055b2bff9f5f8cbfcce4ff59b32ff009fbf847fc8fd6af0cffc1c9fe1aba75fedaf857aed82e3e6365acc5784707a078a2ef8fccfa73ed3f0c3fe0bbbfb3efc44ba586fb57f10f84247e17fb6b4a60a4fa16b769957eac40e3ad7e15818a5c57256e0dcb66bdd4e3e8ffcee7551e2dc7c1fbcd4bd57f958fe9f7e1d7c55f0cfc5ff000f2eade14f1068be24d31cedfb5699791dd441b19da590901b04707915bd9e6bf993f825f1f7c65fb3978d61f10f827c45a9787755848cc96b2e1275073b258ce5244ff65c11ed5fb59ff04beff82a9693fb72686fe1df104569a0fc48d321f367b488916dab443199edf7124104fcd1924ae41048cedf8ccef856b60a2eb527cf05bf75ebe5e67d6e51c4947192f6535cb3edd1fa3fd3f33ec1a28a2be50fa40afe6dbf6e8ff93daf8c5ff63c6b5ffa5f3d7f4935fcdb7edd1ff27b5f18bfec78d6bff4be7afbce04fe3d5f45f99f15c69fc0a7eaff0023cb28a28afd30fcf028a28a00fd1cff0083773f693ff844fe33789be185f4e059f8b6d7fb574d563f76f2dd4f988a3d5e0258ff00d7b8afd80afe647e00fc60d43f67ef8d9e16f1ae99f35ef8675286fd5338132a302f19ff0065d3721f6635fd2cf81bc69a77c46f05e91e20d227175a56b9670dfd9cc0604b0ca81d1bf15615f95f1b603d962a3898ad26b5f55ff02df89fa6708e37dae15d096f07f83ff837fc0d5a28ae73e2f7c4fd37e0b7c2bf1178bb58709a6786b4e9f51b8f982975890bec5cf059b1b40ee481debe361172928c7767d5c9a4aef63f20bfe0e0afda4bfe164fed3ba57c3fb29f7e9bf0fecb75caab02ad7d72a923f4ebb62108e7a1320c0e73f01d6f7c55f88fa97c60f899aff8af5893cdd53c47a84fa95d30271e64ae5c81e8a33803b000560d7ef1966096130b0c3afb2b5f5ebf89f8b6658c78ac54ebbeaf4f4e9f80514515dc70857bbffc1313fe5203f09ffec6083fad78457bbffc1313fe5203f09ffec6083fad71e63feeb57fc32fc99db96ffbdd2ff147f347f44b5f963ff072effcd15ffb8e7fee3abf53abf2c7fe0e5dff009a2bff0071cffdc757e4bc27ff00235a5ff6f7fe92cfd3789ffe45957feddffd291f963451457ecc7e4a1499a5afda0ff8279ffc1323e05fc64fd8bbe1ef89fc4bf0fec755d7b59d33cfbcbb7bebb469dfcd7192a92851c01d00e95e566d9bd2cbe9aab59369bb696f5ead1ea65594d4c7ce54e9b4acafa9f8bf457f40ff00f0e7cfd9bbfe897e9bff00831beffe3d47fc39f3f66eff00a25fa6ff00e0c6fbff008f57cfff00af382fe49fdcbfccf77fd4cc57f3c7f1ff0023f9f8068afde9f887ff00044afd9dbc71e1b9acacfc1b71e1abb704457fa66a9722780fa8595de36fa321fc2bf18ff6c4fd99354fd8fbf688f11780754b84be7d22556b5bc44d8b7b6d22878a5db93b49461b97276b061938cd7b194f10e173093851ba92d6cfb7959b3c9cd321c4e062aa5469c5e975fa9e65498e6968af74f10fd1bff837f3f6c9bbf067c5bbcf83dabdd17d13c5492dfe8c24627ec97d1a6f9235ec165891891fde8971cb9cfebcea7aa5be8ba6dc5e5dcd1dbdada44d34d2c8709122825989f40013f857f33ffb367c40b8f851fb42f81fc4b6ae639b43d76caf4119f9824e8594e3b100823d09afe813fe0a13ad5c787ff619f8b5756afe5cebe15bf8c3f750f032123df0c707b1afcc38bb2d8acc29ca1a7b5d1fadd2bfe28fd2b85b1f29606719ebecf6f4b5edf99f847fb71fed55aafed8ff00b497887c69a84928b19e636da45ab312b616284886203b1c7ccd8c65ddce06715e478a31cd15fa5d1a30a54d52a6ac92b23f3aaf5a756a3ab51ddb77615afe03f87daf7c52f145be89e1ad1b54d7f58bb244365a7dabdccf2639242202700724f403935915fae1ff0006e29f067fc2a6f1d883ec5ff0b00eaabf6c0fb7ed3fd9be545e4ecefe5f9de76ec7f16dcff0d79f9c662f038596214799ab69ebdfc8eeca32f58dc4aa12972a7fa763e3ff00077fc112ff0068df17d84772de0ab5d222957720d4757b58a4c7ba0919d4fb30078fa66af8f7fe08c1fb46780b4e9aedbc04757b787963a5ea56d752118ed1093cc6ff0080a93c57efa93cd1b6bf3e5c718ee6bf2c6ddacffccfbb7c1d81e5b5e5eb75fe47f2e3e23f0dea5e0ed76ef4bd5f4fbdd2b53b190c573677903c13dbb8eaae8c032b7b119aa55fbb1ff055cff8262c9fb76f86f43d4bc24de1dd1fc79a3dc885f50d49a4862bcb12adba1778a376255f6b265481971c6eaf8cb49ff83723e2bcc23fb778dbe1edb673e67912de4db7d31ba04cf6f4afafc0f15e06b50552b4d425d51f2b8ce18c653ace9d18f3c7a3d17ebb9f9e95d27c1df8b3ad7c09f8a7a0f8c3c3b72d69acf876f23bcb593b12a79461dd1972ac3a15620f5afd0bd1ff00e0db3f14ceabfda1f14b40b525f0c2df489a7c271c8dd2264f5e38fad75161ff0006d3d9468df6af8c5753367e531785d62007be6e9b3fa569578a32969c2752e9f949fe8452e1bcd1494a34ecd6b7bc7fccfd1cf829f15ac3e38fc21f0cf8c74b18b0f136996fa9449bc31884b18731923f89492a7dd4d1581fb257ecf10feca7fb3df87be1fdbeaf75af5b7871668e2bdb888452cab24f24a0150481b7ccda31d94515f8fe21535564a93bc6eede97d0fd528b93845d4569595fd7a9e915fcdb7edd1ff27b5f18bfec78d6bff4be7afe926bf9b6fdba3fe4f6be317fd8f1ad7fe97cf5f6dc09fc7abe8bf33e378d3f814fd5fe4796514515fa61f9e17747f0ede6bf05fc9690b4cba6db1bcb80bd5220ea85b1df05d73e8327a0354abeabff008236fc3bd3be2f7ed893785756432699e23f0beafa6dd003e6f2e6b5646233dc06c83d8815f397c56f873a8fc1ef89be20f0a6af1f97a9f873519f4db91820192290a123d8e320f7041ae4862a32c44b0fd524fe4eebf4fc4eca98471c34312b6936be6bfcff00430715fb69ff00040dfda4bfe16efec893f83af67f3357f8717bf6300fde6b19f74b6ec4e79c309d071c2c4b5f8975f59ffc116ff692ff00867bfdb8f41b4ba9fcad17c76bff0008e5e027e559256536cf8e9913ac6b93d1647af2f89b01f5ac04e297bd1f797cbfe05cf4b8731df56c746ef497bafe7b7e363f7a6bf3e3fe0e12fda4ff00e15e7ece1a2fc3bb1b809a8f8f2f3cfbc557f996c6d595c823a8df318707b88dc73ce3f41b3cd7f3edff000567fda4c7ed35fb7078b350b6b9171a27875c787f4a28db90c16ecc1dd48eaaf334ce0fa38afcfb84701f58c7aa925eec3def9f4fc75f91f73c4f8dfabe0a515bcf4ff3fc3f33e6cc519a5af43fd92fe045d7ed37fb497837c096a2403c43a94705cbc632d05b2fcf71281fec42b237fc06bf5dab5234e0ea4f64aefd11f9652a72a9354e1bb765f3388d7fc3d7be16d416d6fe07b6b86821b908e307cb9a249a36ff008123a9fc6a9d7d09ff000556d1ad7c3dff000501f88fa7d8c11dad9585ddbdbdbc318c2431a59c0aaa07a000015f3dd6785adeda842adadcc93fbd5cd3174551af3a4becb6bee760af77ff0082627fca407e13ff00d8c107f5af08af77ff0082627fca407e13ff00d8c107f5acb31ff75abfe197e4cd72dff7ba5fe28fe68fe896bf2c7fe0e5dff9a2bff71cff00dc757ea757e58ffc1cbbff003457fee39ffb8eafc9784ffe46b4bfedeffd259fa6f13ffc8b2aff00dbbffa523f2c68a28afd98fc942bfa18ff0082531ff8d78fc2affb03ff00ed692bf9e7abd6de26d4aca058a1d46fa28d06151277555fa006bc3cfb26798d18d253e5b3bed7e8d7747b791e6eb0152551c79aeadbd8fea3a8afe5d3fe131d5ffe82ba97fe04bff8d1ff00098eafff00415d4bff00025ffc6be57fd4297fcfff00fc97ff00b63e97fd7587fcfa7f7ffc03fa6ef881f133c3bf0a3c3b36afe26d734ad034bb756692eafee92de2000c9e588c9c761cd7e01ffc150ff6a6d2bf6bdfdb1bc43e2ad00b3f876da2874bd2e678cc6f73042b8f38820101dcbb2860085650402303c0aff51b8d526125d5c4f73201b434b217603d327b727f3a836e6bdfc8b8669e5d51d673e69356dac97e2cf1339e239e3a9aa31872c6f7deedfe085a28a2be9cf9a3a3f837e17b9f1c7c5ef0a689648d25e6b1ac5a5940a8bb999e59d11401dce58715fd257c7ef8649f1a7e0678c7c20e621ff093e8b79a5abc832b1b4d0bc6afdfeeb3039ea0806bf1cffe0851fb235dfc6ffda9e1f1e5fdabff00c22ff0e48bbf3597e4b9d41948b7881ee5326638ce3cb407ef8afdbac57e63c6b8e4f174e9537ad357f46ecff45f79fa4708e0dc7093a935a4dfe0b4ff0033f970f11f87ef7c25e21bfd2752b696cf51d32e64b4bab79576bc12c6c51d18762181047b553afd6bff0082c5ff00c125755f8afe24bcf8aff0bb4d6bfd6ee5436bfa15bafefaf99463ed502ff1498003c6397c6e1962c0fe4c5e5a4da75e4b6f710cb04f0398e48a452af1b0382ac0f20820820d7dde539a51c7d05569bd7aaea9ff005b773e2b34cb2ae0ab3a735a747dd7f9f723ad3f06f8d759f877e23b5d6340d5b52d1356b26df6f7b6172f6f3c27d55d0861f81acca2bd269356679b1938bba7667d99f053fe0bb9f1e3e145b416baadfe87e38b28404035ab2c5c05ff00aed098d99bfda9379e79cd7d3ff0b3fe0e46f0cdff0095178d7e1beb7a5903125c68b7f15f063ea239442547b6f6fa9afc94a315e1e2786b2dafaca924fcb4fcb43dac3f11661474552ebcf5fc5ebf89fbe7f0c3fe0b3ffb3c7c4d8e353e373e1dba7207d9f5ab19ad4afd64dad17fe3f5f447807e2cf857e2ad935cf85fc4be1ff125b2804cba56a30de2007a65a36615fcc262ac695abdde85a84577637571657509dd1cd048639233ea18104578588e05c3cb5a151c7d6cff00c8f6a871a565fc6a69fa36bfccfea4fa9a5c57e02fecf9ff00058bf8f1f006e608ff00e12e9bc61a4c4c0bd878901bf0e318c09c913af1d0093038e0f4afd53ff827dffc156bc0ff00b74c6345113785bc796f09966d16e650e974aa3e77b69703cc51d4a901c0c9c100b57ca669c318cc145d4694a0baae9eab7fd0fa6cbb887098c92a717cb2ecff004e9fa9f53818a2933e9cd15f387bc2d7f36dfb747fc9ed7c62ff00b1e35aff00d2f9ebfa49afe6dbf6e8ff0093daf8c5ff0063c6b5ff00a5f3d7de7027f1eafa2fccf89e34fe053f57f91e59451457e987e787d95ff041b1ff001b0fd17fec0fa87fe89aeb3fe0e06fd9c4fc32fdaa34df1d595b88f4cf885621a66550156fad82472f4e9ba230364f2c4b9e706b94ff00820dff00ca43b45ffb03ea1ffa26bf48bfe0b37fb388fda13f618f114d6b6e26d6bc10c3c4762554172b0ab0b84ce3383034a703ab227a57c2e638efaaf105393da51517f36ff5b1f7180c17d67229c12d536d7aaff35747e0954967772e9f7915c4123c33c0e248e446dad1b0390411d083ce6a2cf34b5f747c3a67eecf8fff00e0a336f1ff00c125ff00e1725b5d471788b58d1069b6eb130568b59726d9f681d3cb94492e38ca4791d457e13bb191cb312ccc72493924d75d77f1cfc4577f026d3e1c3deb1f0b596b72ebe96dc9cdd3c290e7e8154e00ef239ef5c8578b9364f0c02a8a3f6a4dfcba2f91ed6739b4b1ce9b7f662afebd5857e987fc1ba1fb390d6bc7be31f8a57d6dba0d0e01a1694ecb91f6897125c3a9ecc9108d7e970d5f99f9afe89ffe09b5fb381fd967f634f05f85ee2dfecfac4b68353d5c15c3fdb2e3f7b22373d630562fa442bcde31c77b0c0fb28bd6a3b7cb77fe5f33bb84f05edb19ed5ed057f9bd17eafe47e32ffc15bffe5233f14bfec230ff00e92c35f3957d1bff00056fff00948cfc52ff00b08c3ffa4b0d7ce55ef657fee547fc31fc91e2e69fefb5bfc52fcd857bbffc1313fe5203f09ffec6083fad78457bbffc1313fe5203f09ffec6083fad5663feeb57fc32fc98b2dff7ba5fe28fe68fe896bf2c7fe0e5dff9a2bff71cff00dc757ea757e58ffc1cbbff003457fee39ffb8eafc9784ffe46b4bfedeffd259fa6f13ffc8b2aff00dbbffa523f2c68a28afd98fc9428cd15fabbfb0fff00c114fe107ed13fb27f823c6daf5ef8d62d63c45a7fda6e96d351863803f98ebf2ab42c40c28ea4d79b99e6b43014d54af7b376d15cf472dcaeb63a6e146d74afa9f945499e6bf6d3fe21ebf811ff00410f885ff83583ff0091ebf2cff6fcfd90efff00629fda5f5af06cc6e27d209fb6e8979301baf6c6427cb624000ba90d1be001be36c0c115cd96f10e0f1d51d2a0df3257d558e9cc721c560a9aab56cd5eda3fccf18a28a2bdb3c52de85a05ff008a3548ac74cb2bbd46f67388eded6169a590fa2aa824fe15f647ec77ff000442f8abfb416b76d7be33b0bbf86fe14560d3cba9c3b353b85ee915ab61d5bfda942819c80d8db5f2f7ecf3f1d75dfd9a3e33681e37f0dcfe4eaba05d2ce8acc447729d24864c104a48859187a31ef5fd1a7ecedf1eb41fda6fe0c681e38f0dcfe6e97af5b09950b0325b483e59217c747470ca7dd78e315f25c539be330308fd5e2b965a736f67e9b7a6fd4faae1acab098c949d66dca3f67a35f9fafc85fd9f7f67df0afecc3f0ab4cf06f83b4d4d3b46d3178c9dd35cc87efcd2bf1be473c963ec0000003b5a2b3b54f18693a1dc882f754d3ace62a1bcb9ee523620f7c139c57e51394ea4dca4eedee7e9908c631518ab2468e2bc43f69cff008274fc20fdae1a5b9f187846d1b5a9170358b06367a80c700b4898f330380250e07615e8137ed03e03b795e37f1b78451e325595b58b70548ea08dfc1aa57ffb52fc32d2a611dd7c45f025b48c3705975fb44623d7064e9c1adf0ff5aa3353a3cd17dd5d19568d1a91e4aa935d9d8fcebf8cff00f06dd9f3a69fe1e7c47511927cab1f1159f2a3b6eb883afe108fe95f32fc4eff008225fed11f0dda6787c2367e26b5849cdc68ba943387f758dca4c7fefdd7ed31fdaefe13892243f13fe1e6f9a458a35ff848ecf323b1c2a81e67249e00ea6bd0f22be8e8f16e6987b2ab697f895bf2b1e0d6e18cbab36e0b97fc2ffcee7f32df11ff00675f881f07a465f157827c57e1d0a0b6ed474a9ed9180ee1994023dc1c5719babfa9dc0af2ef897fb137c21f8c30489e23f86de0dd49e43937074b8a2b919eb89902c833ecdcd7b187e3c5b57a3f73fd1ff99e457e0aeb46afdebf55fe47f3679a5afd4eff008297ff00c111bc23f0efe0e6bff10fe143ea1a4b786ada4d4751d06e2e1ae6da4b58c6e95e091c99119103390ece1829c6d2067f2c6bec72ccd30f8fa5ed683f269ee8f93cc72cad82a9eceb75d9ad989b6b4fc1de30d53e1f78af4fd7344bfb9d2f57d26e12eaceeeddca4b6f2a1cab29f506b368af41a4d599c0a4d3badcfe8dbf603fda9a1fdb13f658f0c78d8ac516ab7109b4d5e18c6161bd88ec9703b2b102451ce164519ce68af91ffe0dbff125cdd7ecff00f10b4a7626d2c7c4115d44a4fdd796dd55ff0048528afc333ac2470d8eab461b27a7a3d7f53f68cab112c46129d69eed6bea7e8f57f36dfb747fc9ed7c62ff00b1e35aff00d2f9ebfa49afe6dbf6e8ff0093daf8c5ff0063c6b5ff00a5f3d7d47027f1eafa2fccf99e34fe053f57f91e59451457e987e787d97ff041bff948768bff00607d43ff0044d7ee5dfd841aa58cf6d731473dbdcc6d14b1c8a196446182a477041c62bf0d3fe0837ff290ed17fec0fa87fe89afdd1afc9f8dbfe460bfc2bf367ea1c23fee1ff6f3fd0fe6bff6ccf8013fecbdfb5078d3c0d2ab88743d49d6cd9facb692625b77ea7930ba13cf0723b5799d7e9eff00c1c69fb390b1f10f827e2ad8dbe23bf46f0eeaceaa0012a6e9ad98fab3219d49ec22419e95f9855fa264b8efade0a9d77bb5afaad19f059ce0beab8c9d25b5eebd1eabfc831451457a87987d03ff0004b9fd9cc7ed39fb6df83342b9b7fb468fa6dcff006d6aca4653ecb6c44851bfd9924f2e23ff005d6bfa1ada2bf377fe0dd6fd9ccf863e1178b3e275f5bedbaf14dd0d274c760411696e732b2f62af336d3ef6df9fe91d7e45c618ff00ac63dd38ed056f9f5ff2f91faaf0b60bd86094def3d7e5d3f0d7e67f3e1ff056ff00f948cfc52ffb08c3ff00a4b0d7ce55f46ffc15bffe5233f14bfec230ff00e92c35f3957e9f95ff00b951ff000c7f247e719a7fbed6ff0014bf3615eeff00f04c4ff9480fc27ffb1820feb5e115eeff00f04c4ff9480fc27ffb1820feb5598ffbad5ff0cbf262cb7fdee97f8a3f9a3fa25afcb1ff0083977fe68aff00dc73ff0071d5fa9d5f963ff072effcd15ffb8e7fee3abf25e13ff91ad2ff00b7bff4967e9bc4ff00f22cabff006eff00e948fcb1a28a2bf663f250afe867fe094dff0028f1f855ff00607ffdad257f3cd5fd0cff00c129bfe51e3f0abfec0fff00b5a4af89e3aff73a7fe2fd19f65c17fef153fc3fa9f41d7c7bff000599fd89bfe1abbf6639f5ad1acfcef1a780564d4b4f11ae64bdb6c03716c31c925543a8e4978d546379afb0a9315f9be0b17530b5e35e9ef17fd2f99f7d8ac3431146546a6d2563f963cf14b5f5cffc1647f626ff00864afda7ee354d1ed160f0578eda4d4f4b11ae23b39f20dc5a8038011d83280301254033b4e3e46afdd7078ba789a11af4b692bffc0f96c7e318cc2cf0d5a542a6f17fd3f989b6befbff0082147eddbff0a33e323fc30f11de14f0af8eee1469d24ae7669da991b531d82ce02c67fdb58ba0dc6be05a7432bdb4c9246ed1c9190caca70548e4107b1a8cc3034f1987961ea6cff07d1fc8bcbf1b3c2578d7a7d3f15d51fd4d039afc7dff00838e7e13cfa37c7ef0378d121db63af688fa53c839067b5999ce7b8252e500f50871d0d7db3ff0494fdba13f6d0fd9ba04d5ae964f1cf83c47a7eb8ac7e7ba1b7f7379ff006d555b77fd344938036d75bff0521fd8de1fdb6bf660d5bc2d07910f88ac586a5a0dc4b8022bb8c1c231ec922968c9e83786c1da057e4d955596559aa8e234b3e57e8fafa6cfd0fd4332a51ccb2e6e86bccaebd574fd0fe77b14b8ad0f17784b54f00f8a2ff44d6ac2eb4bd5b4b9dedaeed2e6331cd6f229c32329e4106b3ebf644d35747e4928b4ecf716276824574664743b9594e083ea2bf66bfe09f7ff0005c1f047c55f06697e1bf8afa9c1e10f19594296efaadd9d9a6eb054002532fdd824382583ed4cf2adcec5fc64a315e5e6d93d0cc29a856dd6cd6e8f4f2bcdabe066e74b54f74f667f511e14f1b68de3bd2d6fb43d5b4cd66c9c656e2c6e92e226fa32122ad6afacda681a6cd797f756d65696e374b3cf22c71c6338c9663803eb5fcb8da5dcd6170b3412cb0ca99daf1b1565c8c7047b1a9350d5eef56d9f6abab9b9f2f3b7cd90bedcf5c67a741f957c8be025cda57d3fc3ff00db1f52b8d95b5a3aff008bfe01fb0bff00056cff0082b07817c3bf03bc49f0dbc01ad69fe2cf1378aed25d2afaeb4f956e2c74bb595764f99572924ac85902a13b4b12c4150adf8e5498a5afafca729a397d1f654b5beadbeacf95cd735ab8eabed6a2b5b449740a28af66fd857f631f10fedc1f1dac7c2ba42496da54056e75bd4f6e534cb40c033f3c191b9545fe263d94311df5ebc28d3756a3b456ad9c34284eb5454a9abb7b1faa7ff0403f8433fc3cfd8825d76ee0314fe35d6ee35184b705ada354b74e3d37c5291ea1876c515f677817c13a67c35f05e93e1ed16d52c748d0ece2b0b2b74fbb0c31a0445fc140e68afc2731c5bc56267887f69dfe5d3f03f69c0e1961f0f0a0beca48d5afe6dbf6e83ff19b7f18bfec78d6bff4be7afe926b035cf09f862ca0bad4752d33418624dd35c5cdcdbc4aabdd9ddd871ea4935e9f0fe74b2ea939b873732b6f6fd19e7e7593ff00684230e7e5e577daff00aa3f982a2bfa1cf17fed93fb34f816668f51f1cfc2b1227de4b6b8b5bb75e7182b10620fb75159da27ede9fb2ef882e3ca83c75f0d236c819b958ed97938fbd2228faf3c77c57d92e2dc435ccb092b7cff00f913e51f0a504ecf12bee5ff00c91f97dff041b38ff828768bff00607d43ff0044d7ee95711f0b3c67f0e7c7b335d782755f04eb52449b9a6d12e6d6e5910f192d0938078aedb35f119fe66f1d89f6ce1c964959fcfc9773ec326cbd60f0fec54b9b56ef6b6ff3678bff00c142ff006761fb527ec7de36f08c3079da9cf626f74b0abb9bed901f36155f42ec9b0fb39afe731d4c6e55815653820f507d2bfa9bce6b1dbe1c7879d893a0e8c493924d94473ff8ed77643c4af2ea72a5287326eeb5b5bbf47e471677c3f1c7ce3514f95a56daf7edd56da9fcbe55cf0de8179e2ef10d8695a740f737fa9dcc7696d0a0cb4b2c8c11147b962057f4edff000adfc3bff400d17ff0062ffe269f6df0ff0041b2b98e68744d2629a260e8e9671ab23039041032083debdd7c7b1b6947ff0026ff008078ab8275d6b7fe4bff00db1ce7ecd1f04ecbf671f805e11f035808da1f0d699159bc88302e2603334bdb9794bb9e3abd775462909afcf2a5494e6e73776f567dd420a31518ec8fe7c3fe0ade7fe3631f14ff00ec230ffe92c35f39d7f50f7fe07d1354bb7b8bad1f4bb99e5e5e496d237773ee48c9ff00eb545ff0adfc3bff00400d17ff000062ff00e26bef30bc6d1a342147d8df9525f17656ec7c662b83fdb569d6f6d6e66dfc3dddfb9fcbed7bb7fc1310ff00c6c07e13ff00d8c10ff5afe833fe15bf877fe801a2ff00e00c5ffc4d4b67e04d0f4eba8e7b7d1b4ab79e23b9248ed234743ea081915589e388d5a52a5ec6dcc9af8bbaf4161b83fd956855f6d7e569fc3d9dff0098d5afcb0ff83974f3f057fee39ffb8eafd4e2706a96afe1cd3bc4262fb7d8595f7939f2fed102cbb338ce37038ce07e55f219463d60b170c4b8f372df4db74d7ea7d3e6781fae61a587bdb9adadafb34fcbb1fcb8d15fd40ffc2b8f0eff00d00345ff00c018bff89a5ff856fe1dff00a0068bff0080317ff135f6bfebec7fe7c7fe4dff0000f92ff525ff00cfeffc97ff00b63f97dafe863fe094c7fe35e3f0abfec0ff00fb5a4af69ff8571e1dcffc80345ffc018bff0089ad6b2b0834db5482de18ade0886d48e3508883d001c0af0b3ee25598d18d254f96cefbdfa35d91ece4bc3ffd9f52551d4e6bab6d6fd592d1484e296be54fa33c37fe0a1dfb20d9fedadfb316b7e122b0a6bb6ebfda1a0dd4831f66be8c1d809ecb202d1b1e70b2138240afe77b5cd16f3c35adde69ba85b4d677fa7cef6d736f2a959209518aba30ec430208f515fd4975acabbf016857f7524f3e8ba4cd34ac59e492d2366727a9248c935f5390f134f2ea72a328f345eab5b59f5e8f73e773ae1e863e71a8a5cb25a3d2f75f7a3f979a2bfa82ff008571e1d3ff00300d17ff000062ff00e268ff00856fe1dffa0068bff80317ff00135ef7fafb1ff9f1ff00937fc03c5ff525ff00cfeffc97ff00b63f9e2fd82bf6bed4ff00627fda3f46f18d989ae34b27ec7add8a37fc7f58b91e62e3a6f5c074cf1bd173c120ff00449e0df17e99f10fc25a66bda2dec3a8e91acdac77b657511263b886450c8e3d8a9079e6abff00c2b7f0e939fec1d17ff00a2ffe26b9cf1d7ed1df0cbe07466cfc43e37f05785becc302d2f355b6b59178ced588b0627d80cd7cde779a4334a919d2a4e335a3b3bdd7ddd0fa1ca32d965d4e509d5e68eeaead6fc5ee785ffc144ffe093fe10fdb96d8eb965345e14f8816f16c8f568a00d0ea2a06163ba4182f81c0901dea31f79405afc82fda63fe09ddf17bf64ebcb83e2bf085fb6930310bace9c86f34d907386f3507c99c1c0902371d2bf6beeffe0a9ffb3d58dc3c4ff15bc2e5a338263792453f465420fe06baef04fedb9f077e23ceb0e89f143c077f70edb12dd35bb759d8f1d23660e472390319c8aedcb33acd32f8284e9b9417469ab7a3b7f99c998e4f97e3a7cf19a8cdf54d6beabafe0cfe6d73499afe907e27fec21f063e354b25c788be1a783f50b9b8cb49791e9e96f732e7b99a20b21ffbeabc83c4ff00f0435fd9c7c42eed6fe11d53472e31fe85ae5d900e49dc04b23807b63a6070057d151e39c1b5fbc8493f93fd57e47cf55e0cc4a7fbb9c5af3bafd19f83d499afdc5ff8704fecff00ff003ede30ff00c1cfff00615674dff820a7ecf5633334ba5789ef548c049b5a9005f71b029fccd747faeb977697dcbfccc7fd4ec77f347ef7fe47e18e715a1e17f09eabe37d6a1d3745d3350d6351b8388ad6caddee2794fa2a202c7f015fbfde12ff0082467ece7e0b9924b4f85da3dc321cff00a7dd5d5fa93eeb3cae0fe55ee3e02f857e17f857a7359f85fc39a0f86ed1b19834bd3e2b38ce3a7cb1aa8e2b86bf1dd04bf7349b7e6d2fcae75d0e0baadfefaa25e89bfcec7e337ec8bff0425f8a3f1bafad351f1e21f873e1a621dd6e9449aadc27754833fba2791994a95ebb1ba57ebb7ecd3fb2ef82ff00649f8696fe15f046929a6e9f11124f2b9df737f2e00334d2757738f60070a140007a0e293757c6e6b9f62f1eed55da3d96dff07e67d6e5b9361b04bf72bdeeef7ff81f2168a28af14f54f32fdaff00f6a2d13f63bf801aef8ef5c53711e98823b3b3570926a374ff002c5029e71b9b92d83b5559b076e2bf023f6a9fdb6be22fed89e30b8d4fc67e20bbb9b3694bdae91048d169da7ae4ed58e1076e40e37b65db1cb1afd3dff838cac750b8fd92bc1f34093369f078ae3375b0fc88c6d2e446587fdf601e809c7719fc69c57ea3c1797d0585fadb579b6d5fb25d11f9d71763eb7d616153b4524fd6fdc96cac66d4ae920b7864b89a43858e342ecddf803935675df0bea7e179d62d4f4ebfd3a57e552ea0785987b06033d47e75f737fc11a3fe0a0ff0abf635b3f12695e3cd2eeb4ed475dbc49a1f125b599ba31c0102fd9e455cc8a818171b15b71739fbab5fa4fa8fed27fb3afedbbf0e6f7c2d73e38f01f8934cd6e2685ac2f2f6282e94952a248e19f6c8922e72ae172a7915df997106230988707879382fb5fd2b7caff71c9976414317414e35d29bfb3dbc9eb7f9dbef3f9f1f0f788b50f08eb56da96957f7ba66a366e25b7bab49da19e071d191d486523d41afd7ff00f8230ffc151f5afda435097e17fc44bbfb7f8aac6d1aeb48d5df025d5618f1be19bfbd322fcc1faba862df3292f6343ff8373fe107925ef3c69f11af16401a26b6b9b28571ebcdbbe73c74c7e35eadfb387fc11a7e127ecb9f18746f1cf86ef7c692ebba1348d6a6f3538da205e3789b72a4484828ec08ce39e95e2e799ee538dc3ca9bbb95bdd76d9ff009773d6c9726ccf078853ba51eaafbaff0035d0f94ffe0e40d6af349f885f0ad6d6eeead83e9da816114ac9bbf7b075c1afcd3ff84c757ffa0aea5ff812ff00e35fa47ff0727ffc944f853ff60ed43ff46c15f9975f45c2f15fd974b4efff00a533c1e25a925995449f6ffd251a3ff098eaff00f415d47ff025ff00c68ff84c757ffa0aea5ff812ff00e35fa93ff047ff00d91be067c66fd8ee0d6be207867c2baa7881b58bb80cf7f726398c4a5360c6f1c0c9c715f52ffc3bbff656ff00a127c03ff81c7ff8ed7162f8af0d87ad2a12a526e2eda25fe677e17863155e8c6b46aa4a493ebd4fc11ff84c757ffa0aea5ff812ff00e35ee9ff0004ccf146a777fb7d7c298a5d46fa589f5f8432bdc3b2b0e7a826bf5ebfe1ddff00b2b7fd093e01ff00c0e3ff00c76ba2f855fb06fecfbe0df1c586bfe10f05784e0d7744945cdadcd95c34b2dab8e8e079840fc4579f8be30c2d4a13a6a9495d35b2eabd4eec2f0b62a9568549554d45a7d7a33f3d3fe0e2ad72f74afdaa7c1496b79756c8de1442562959013f6cb9e7835f9f5ff098eaff00f415d4bff025ff00c6befbff00838e7fe4eb7c13ff00629a7fe965cd7e79d7d0f0e457f66d1d3a7eacf9fe21a93598d549f55f92347fe132d5ff00e82ba8ff00e04bff008d07c65ab8ff0098a6a3ff00812ffe35fb01ff0004a6ff00827efc1af8ddfb03f80fc51e2bf87fa26b7afea7fda1f6abdb8327993f97a8dd4499c301c222af4e8b5f415dff00c1273f675bdb7689fe15e80aadd4c72dc46dd7b32c808fcebcac4f1860e8569d195395e2da7b7476ee7a787e17c5d6a31ad1aabde49f5eaae7e03693f12fc47e1fbe5b9b0f106b7657098db2dbdf4b1bae082305581ea01fc057dc3ff04deff82d0f8d3e157c47d2bc2df1535fbaf14781f54992d5b52d45ccd7da2331004c6639796204fceae5881ca9182adf397fc1477e08f84ff673fdb37c6be0ef04dc3cde1dd22784411bce676b377823924b7321e5bcb7665e492000189604d78857bd5b0985cc30c9d48692575a6aaebf067874f198ac0625a8cf58bb3d74767f91f78ffc1767f67fd57e04fed549e30d2ae750b7f0e7c4684de0114ceb15bdfc6156e63183fc59497b64cae070bc7c41ff00098eafff00415d4bff00025ffc6bf6d3f683fd9a2e3f6d7ff823d7832d8c4d7be30d3fc17a4788f4b7da5a69af23b08dde21dc9991a48c0cfde7527a57e1c839af3b86718abe17d8cf59537cafe5b3fbbf23d0e23c3ca8e27db41b51a8b997af55fafccfdf0ff8235fed3cdfb49fec4da1477d7027f107829bfe11fd40b365dd62506de539e4ee80c60b1fbce8fef8fab335f88bff000415fda63fe14d7ed7afe10be9fcad1be245afd8305b0897d16e92d98fd4196203b9997d2bf5b3f6cafda1ed7f655fd997c61e3a9da133e8b60c6c6297eedc5e3feeede323a906564ce3f8771ed5f9ff00106552a3993a34969369c7e7d3efb9f7191e631ad8055aa3d62ad2f975fbb53f223fe0b79fb5ade7c62fdb36fbc3ba46a7731e87f0ee23a346b04cc8925de775db9c1fbc24c447feb80af8ebfe131d5ffe82ba8ffe04bff8d56d5f55b9d7b55b9bebc9a4b9bbbd95e79e673969646259989f52493f8d7d1bff00049cfd9447ed65fb64f87f4fbeb633f86fc347fb7759cae51e18594a42dea2494c68475dace474afd469d3a197605297c34e3af9dbf56ff33f389d6af8fc6fbadde6f4f25ff011f68fc42fd9db50fd967fe0815e288f509af23f157890699aeea923ccc658249f52b1f2e1ddd576422352b9c07f308eb5f955ff00098eafff00415d4bff00025ffc6bf793fe0b583fe3595f12ff00ee17ff00a75b3afc0aaf1b846bcb1186ab5ea6f2a8dfe113d5e2a87b0c453a54db49412fc59fa2dff06eaeb97baafed53e354babcbab945f0a390b2cace01fb65b73c9afd5af8e1f1bbc35fb3afc30d57c61e2ed4a2d2f42d1e2f32695b96724e16345eacecc42aa8e4935f937ff0006e37fc9d6f8dbfec537ff00d2cb6a9ffe0e16fda7af7c5ff1df47f85967712268be11b58f51d42156c09efa75dc8587711c0536fa199fd457859ae57f5ecf7eafb2b26fd12fe91ede5b997d4f2555deaeed2f5b9e51fb6dff00c1643e27fed51acdee9da06a37be04f041729069da6ce62bbba8f3c35cceb876247545223ed86c6e3f21c92b4f233bb33bb9dcccc72493dc9a4c57e977fc119bfe094fe1af8dde034f8abf1334e3abe937570f1681a3cac56dee962628f73301cbaf98acaa84e0ec62c1815afb1af5705946179d47962b4b2ddbfd5fa9f25429e3336c4f2b95def77b25fa7c8fcd1cf1477afea23c37e05d13c1ba08d2b48d1f4ad2b4b0bb059d9da470401718c6c501718e318af917fe0a45ff000490f077ed3df0df51d63c0de1ed23c39f126ca3f3ace6b18d2ce0d5c839305c28010b30c8590e195b6e5b6e457cfe138e2854aaa9d6a6e09f5bdfefd169f79ede27836ac2939d2a9ccd74b5beed59f945fb277fc1447e2a7ec75ad5b3785bc477571a1452033683a83b5c69b70b9c951193fba27fbf1156f7c715fb9dfb13fed8de1cfdb7be07d9f8c7c3ead67307fb2ea9a6cae1e6d32e9402d1923ef290432b606e560700e547e58fc3bff837a3e3578a1125d7356f04f86233f7a29afa5bab85ff0080c51943ff007f2bef5ff82687fc1312fbfe09f1aa7886ee4f883378a22f12db451dc69f1e97f63b68a58d89494132b966019d7385c87e9c570714d6ca71149d4a335ed5765bf7bb4adf33d0e1ba59a509f2578bf66fbb5a7a2bdfe47e327ed39e2cd561fda4fe21226a7a82a2f897510145c38007daa4e3ad70c7c63ab8ff0098aea3ff00812ffe35d4fed43ff272ff00113fec66d4bff4aa4ac0f865616daa7c48f0fdb5e4692da5c6a56d14e8ff007591a550c0fb104d7df50515462dae8bf23e26b4e72c44a2a4f593fccabff098eaff00f415d4bff025ff00c68ff84c757ffa0aea5ff812ff00e35fbda3fe09dffb2b63fe449f017fe071ff00e3b4bff0eeff00d95bfe849f00ff00e071ff00e3b5f27feba613fe7d4bee5fe67d4ffaa38bff009fcbf13f047fe131d5ff00e82ba97fe04bff008d7eb3ff00c1b89abdd6adf09fe2635d5d5c5c94d5ed0299642e57f72fd326be87ff008777fecadff424f807ff00038fff001daf5dfd9fbf673f879fb3d6857917c3bf0fe95a0e9fac48b7171f607678ee5941556c9639c024715e3e79c4d87c660e587a74e49bb6ad2e8efdcf4f27e1ec461312ab54a89a49e9a9e81451457c21f5e717fb42fc04f0efed37f07f5af04f8aad5ae746d721f2e4284096ddc1dc9346c41db22300c0e08c8e411907f18bf69fff00821e7c67f819acde4fe19d2c7c44f0da31682ef4923eda13276892d49f337e3a88bcc5f7ed5fa1ff00b7e7fc15cb4cfd82fe2e5af84751f026adafcf7fa545aadb5d43a8476f0ca8f24b1ede558821a26cf1dc71820d7821ff008394f483ff00348f52ff00c2893ff91ebed321867586a7ed3094f9a9cb5b36adebba6bfab9f299d4b29c44fd9e2a7cb38e9757baf2d9a3f2e7c6ff000dfc43f0d3557b1f11e81ad787efa36d8d6fa958cb692a91d8ac8a083f8562e6bfa32fd917f6b9f037edf5f046db59d3d74b9679e3dbabf87ae668eea7d324dc41495081b94e32ae54060463b8185fb41ffc1393f679f885e14d4eff00c53e03f09787ade0b7792e357b044d1ded14024ccd245b1495eb99030e06411c57b90e3454ea3a38ba0e324ececeff00869f99e3cf83f9e0aae1ab269eaaeadf8abfe47e117c27fda5be217c0abd59fc1fe34f137870ae331d8ea12c50c801ce1a307638cf660457ea77fc127bfe0b15ab7ed25e3ab6f86bf13c589f145ec6eda46b7046b6eba9ba2976825894045976862ac9b55b1b7686c6efc8bf185969fa678b754b6d22ee4d434ab7bc9a2b2ba74d8d7302b911c857b16500e3b66bd37fe09f96d7975fb747c205b012b4e3c61a63b08faf94b751b4bf87961f3ed9af7339cab0b8ac34e5522b9926d3b59ad2ff00f0e8f1b28ccf1386c4c21193716d26af74f5b69fa347dadff0727ffc944f853ff60ed43ff46c15f9975fa69ff0727ffc944f853ff60ed43ff46c15f99751c2ff00f22ba5e8ff00f4a63e26ff0091955f97fe9284ee296bf537fe0919f0dbf671f14fec8305d7c4fb6f8572f8a0eb1768cdafdd5a4779e48d9b3891836deb8ed5f507fc291fd8bbfe7cbe01ff00e07e9fff00c5d7262f8a6142b4a8ba337caed74b43b30dc2f3ad46355558ae649fde7e0957e8effc1b79ff0025fbe22ffd8bf0ff00e94ad7da1ff0a47f62eff9f2f807ff0081fa7fff00175db7c0987f66df83fe2a61f0ef50f849a2eb5aef9763b347d4ec96e2f8b38d910547dce4b91851c92462bc6cdb89638ac1cf0f1a334e4b76b4dd33d8cab872585c542bcaac5a57d3d5347e747fc1c73ff275be09ff00b14d3ff4b2e6bf3cebf433fe0e39ff0093adf04ffd8a69ff00a59735f9e75f51c39ff22da3e9fab3e6388bfe46357d57e48eabc37f1e3c73e0bd120d3347f19f8af49d3adb77956b67abdc41045b98b36d4470a32c49381c924f7ab93fed33f11eee078a5f881e36962914a3a3ebb74caca782082f8208ed5fa83ff04beff825efc0bfda2bf618f03f8cbc65e07fed8f126b1f6ffb65e7f6cea16fe7795a85cc29f2453aa0c471a2f0a338c9c924d7c87ff0580ff827fd9fec51f1c2caf7c2b6335afc3ef1643e66988d3493fd82e23004d6c647258f50ea5892439193b4d6385ceb0388c6cb04a369a6d6a959b4f5b6adf99b57ca71d43071c5f3de0d2764ddd27b5f4b791f234d2bdc4cd248ef248e4b3331c96279249ee6bdcbf614fd823c65fb70fc51b3d3748b0bbb5f0bdb4ebfdb5ae3c656dac21c82caac787988e16319249c9c28661e175fbbff00f046bfdb4ecff6a8fd982d344bc36b6fe2ff000147169ba95bc6a23fb4c38220ba5500001c2b2b01fc68c780cb57c4598e2305847570f1bf4bff002dfadbaffc311c3f80a18bc4fb3af2b5b5b7f37757feb4b9f57f863c3765e0ef0de9fa469d08b6d3f4bb68eced6104911451a844519e7850057e097fc15ebf652ff8658fdb2f5c8ec6d7ecfe1af1793aee91b102c51acac7ce8571c011cbbc05ec8538c115fbf75f1a7fc16fbf651ff8688fd8feebc41a75af9de24f872edac5b144dd24b684017710f6d8165f5cdb81dcd7e75c2f99bc2e3973bf767a3f57b3fbff0006cfbde22cbfeb382972af7a3aaf96ebeefd0fc3cf0bf88ef7c19e26d3b58d36e1ed751d2aea2bcb59d0e1a196370e8e3dc3007f0afbe7fe0b1bff000510b1fda87e08fc24f0f787e745b6d6b4d8fc55aec1136560ba21a08ed89f58dc5ce41ce7319f4afcf83498afd571197d2ad5e9e227f153bdbe6bfa68fccf0f9855a342a61e3b4ed7f97f9ec19afdc7ff008218feca07e00fec91178a752b530788be24489aa49bd36c9158a822d13e8cacd30f69c7a57e4cfec13fb31cff00b5e7ed55e14f05047fecdbab9fb5ead2ae7f73630fcf31c8fba5946c53fdf912bfa35d334cb7d174eb7b3b4822b6b4b4896186189422448a0055503800000003d2be438e332e4a71c141eb2d5fa2dbf1d7e47d570765f794b1935b68bd7afe1a7cd9f2ff00fc16b3fe5195f12ffee17ffa75b3afc0aafdf5ff0082d67fca32be25ff00dc2fff004eb675f8155d5c0dfee13ff1bffd262727197fbec3fc2bf391fa19ff0006e37fc9d6f8dbfec537ff00d2cb6af9e7fe0ac577797dff000512f8a8f7c3132eaab1a8ddbbf74b044b1773ff002cc27d3a6074afa1bfe0dc6ff93adf1b7fd8a6ff00fa596d589ff0700fecef79f0e7f6b9b7f1dc56ee746f881611319c0f952f2da358648cfa662581c13d4b37f74d6b46b461c43384b794125eba3fc9055a329e410947eccaefef6bf53e0eafe8e7fe09ed6163a77ec2df0823d3c44b6ede11d3656119e3cd7b64797f1f319f3ef9afe71abf59bfe0875ff0522f0e45f0c2cfe0d78d754b3d1b55d1e571e1dbcbb94450ea1048e5cdb176e04a8ecdb41237ab2a8195e5719e0aad7c1c67495f91ddaf2b6ff21708e2e9d2c54a151db99597adf6f99fa6d484d2e6be59ff0082917fc14b3c27fb19fc2ed62c34fd62caff00e255f5b3c1a4e956ee934b632b2e16e6e179091a643057199080a060b15fcbb0984ab89aaa8d1576ff00afb8fd1b1188a7429bab55d923ea53d68c66bf0afc35ff0005defda27420bf6ad7bc3faced1826f3438137718c9f2447f5e3bfb715f6d7fc129bfe0a75f15ff6f1f8bbab691e21f0b783ecfc39a0e9c6eafb52d320b985e399d82c110f3269172f890e38e2363c6307ddc770ae370b4a55aa38f2c77b3ff348f1f05c4983c4d45469df99f75fe573f263f6a1ff009397f889ff006336a5ff00a55257095ddfed43ff00272ff113fec66d4bff004aa4ae7be1b436971f117404bf101b19352b75b91360466332aeedd9e36e339cf6afd7283b518bf25f91f97578f362251ef27f998d457ef60f823fb1763fe3cbe027fe07e9ff00fc5d2ffc291fd8bbfe7cbe01ff00e07e9fff00c5d7ca7fae34ff00e7c4fee3e9ff00d50a9ff3fa27e0957f42ff00f04a5e7fe09e3f0aff00ec11ff00b5a4ae57fe148fec5dff003e5f00ff00f03f4fff00e2ebde3e05f88be1dcfe144d0be1c6abe12bbd1bc3d1a442cf41bd82e21d3d1cb1452b131d818abe338ce1bd0d7cf712678b1f878d38d2946cef76b4dadfa9ef64192cb035a5395452bab69f79dbd14515f147d51f21ff00c15c3fe09d537edc9f09ec351f0db41078f7c2025934e494848f5485c0325a339fbac4aab2313b436e0701cb2fe1c7c41f871e20f84de2bb9d0bc4fa2ea5a06b16676cd677f6ef04c9e876b00707b11c11c82457f5078ae5fe26fc12f077c69d305978bfc2be1ef13daa82123d534f8aec479eebbd4953eeb822beb323e2aa981a7ec2ac79a1d3baff0033e6b39e1ba78d9fb684b967d7aa7ebfe67f327a4eb377a0df25d58dd5cd95cc7f72682568e45fa30208ad7f167c59f1578f6d960d77c4be20d6a18f1b23bfd466b945c67180ec40c64fe75fbcdae7fc11e3f66df10cacf71f0bf4f8cb30622db53beb519031c08a75007b74a6e8ff00f0474fd9b34320c3f0c2c5f0dbff00d2354bfb8e7feda4edc7b74afa67c6f807ef3a72bfa47ff923e7d7086357baaa4797d5fe563f01745d12f7c49ab5bd869d67757f7d74e2382dada26965998f4555504927d00afd6fff0082347fc129b5af815e244f8adf12f4f3a778896068f40d1a520cda70914abdcce07dd94a16454eaa1d8b00d80bf77fc2afd9c3c01f0363dbe0ef05f863c32c54ab49a769b15bcb203d773aa866fc49aed6bc0ce78bea62a93a1423cb17bbead76f2f3dcf6b29e16a785a8abd6973496dd12ff33f25bfe0e4f3ff001713e14ffd83b50ffd1b057e6657f4f1e3bf837e11f8a33db4be26f0b7873c45259ab2dbb6a7a6c376d006c160a6453b41c0ce3ae0560ffc3247c29ffa263f0f7ff09cb3ff00e375be53c5d4b0784861a54db71beb7f36ccb34e17962f152c42a96e6b696ec92efe47f34b8a2bfa5aff008648f853ff0044c7e1effe13967ffc6e8ff8648f853ff44c7e1eff00e13967ff00c6ebd1ff005f28ff00cfa7f7a3cfff0052a7ff003f57ddff0004fe696bd4bf617ff93dbf83a7fea78d17ff004be0afe823fe1923e14ffd131f87bff84e59ff00f1bab1a47ecbdf0cfc3fab5adfd87c3bf02d8df58ca9716f716fa0dac52dbc88c195d196305594804107208e2b2adc714674e50f64f54d6e8d28f06ce138cfdaad1a7b7fc13f2a3fe0e393ff00195be09ffb14d3ff004b2e6bf3d2bfa74f1c7c10f05fc4ed4a2bcf12f843c2fe21bb823f2629f53d2a0bb9234c93b15a45242e49381c649ac5ff008648f853ff0044c7e1effe13967ffc6eb972be30a585c2c30f2a6db8ab5ee8eaccb85678ac4cf10aa25cdd2de56ee78cff00c114c9ff008765fc34ff00b8a7fe9d6f2bd0ff006f3fd9374ffdb43f668d7bc1774208b53913ed9a35dc83fe3cafa304c4f9ecad968dbfd891f1ce2bd53c2be11d27c0ba041a5687a5e9da36976bbbc9b3b1b64b7b78773166da88028cb331381c924f7ad1af91ad8e93c64b194b46e4e4bcaeee7d351c2463858e16a6a94545f9d958fe5c7c53e1ad43c15e26d4346d5ad26b0d5349b992cef2da51892de68d8a3a30f50c083f4af4efd873f6b3d5bf62dfda3344f1b69c25b8b385becbab59236dfed0b2723cd8bd37701949e8e8a7a6457f415e21fd9abe1cf8bb5ab9d4b56f00782753d46f1f7cf7577a1dacf3cedd3733b21663ee4d531fb23fc281ff0034c7e1effe13967ffc6ebedea71b61ead274ab516d3567a9f234b842ad2aaaad2ad669dd69ff0004eafc07e3ad2be26f82b49f116857b16a3a36b7691ded95cc79db345228656c1e4707a1e41e0e0d695ed8c3a959cd6f73145716f708639629103248a460ab03c1047041eb553c2fe13d2fc11a15be97a2e9b61a4699680882cecadd2de084162c76a200a32c49e07524d6857e7926b99f26dd0fb98dedef6e7f395ff0504fd9767fd907f6aff157838452a692971f6ed1647ff96d63312d0907f88af3193fde89abc62bfa74f1c7c0ff00057c4ed4e2bdf12f843c2fe21bc82210473ea7a541772c71825820691490b9627038c93eb58bff000c91f0a7fe898fc3dffc272cff00f8dd7e8586e398c69463569b724b5775af99f0d88e0de7ab29d3a964de8adb796e7c5fff0006f87eca63e1f7c11d63e296a76db754f1bc86cb4c67521a2d3e1721987fd75994e7da08c8eb5fa2555744d0acbc35a45b69fa759dae9f61651ac36f6d6d12c50c08a30a888a0055038000c0ab55f1599e3a58cc4cf113eafee5d17dc7d7e03071c2e1e1421d17defabf9b3e57ff0082d613ff000ecbf897ff0070bffd3ad9d7e05d7f517e2af08e93e3ad027d2b5cd2f4ed674bbadbe759df5b25c5bcdb5832ee47054e19548c8e0807b571dff0c91f0a7fe898fc3dff00c272cfff008dd7d0641c4b4f2ec3ca84e0e57937bf925fa1e1677c3d2c7d75594f96cadb5fab7dfccfcb0ff83718ff00c656f8dbfec537ff00d2cb6afd46fdacff00658f0c7ed8df05352f0578a617fb2dde26b5bb880fb469b72b9f2e7889e8c32411d195994f04d747e07f821e0bf863a94b79e1af08785fc3d773c7e4cb3e99a54169248990763346a095c807078c815d3e2bcacdb3778ac6fd728a716ad6ee9a3d3cb32c586c27d52a3e65adf4dee7f3c9fb677fc1363e26fec53afdc9d73489b57f0b09316be22d3a1692c6653f77ccea6093b14931c83b4b81b8fcfd5fd4d4f6e9750bc7222c91c8a55d1865581e0820f515e1df127fe099bf017e2cde4973acfc2ef0b7da25fbf2d842da73b9f526dda324fb9e6beab03c7568a8e2e9ddf78f5f93ff0033e6b19c189c9cb0b3b2ecff00cffe01fcff00e9df1c3c6ba468674cb4f1878a6d74d2bb7ec90eab3a418f4d81b6e3f0ae5e491a6919dd99ddce5989c9627b9afdf5ff008729feccbff44d3ff2e1d57ff926ba8f00ff00c12c3f67bf86d791dc69bf0afc352cb17dd3a90975303df172f20cfbf5aed7c6f808a6e9d395fd22bf53917086366d2ab5236f56ff00447e1e7ecadfb10fc48fdb1bc55169fe0bf0fdcdc5909425deaf708d169b603b99262319032762ee73838535fbb3fb09fec55e1dfd863e075af8574765bed4ae1fed5aceaaf1ec9753b92305b1ced8d47ca899f940c9cb3331f62d374bb6d174f86d2cede0b4b5b75091430c6238e251d02a8e00f6153e2be473be24af982f676e5876efeacfa8ca320a181f7d3e69bebfe4ba1fcce7ed427fe325fe227fd8cda97fe95495c2e2bfa60d43f657f861ab5fcf7575f0e3c07757575234b34d2f87ed1e495d8e59998c7924924927926a2ff8648f853ff44c7e1eff00e13967ff00c6ebe969f1cd18c147d93d177478157836739b9fb55abbedff0004fe6968afe96bfe1923e14ffd131f87bff84e59ff00f1ba3fe1923e14ff00d131f87bff0084e59fff001babff005f28ff00cfa7f7a33ff52a7ff3f57ddff04fe696bf537fe0da2fbdf1abfee07ffb91afd0dff8648f853ff44c7e1eff00e13967ff00c6eba1f01fc23f0a7c2cfb57fc231e18f0f7873eddb3ed3fd97a74367f68d9bb66ff002d5776ddcd8cf4dc71d4d7999c716d3c6e0e7868d369cadadfb34ff43d0caf85e784c54710ea5f96fa5bba6bbf99d0d14515f0e7d81fffd9, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

CREATE TABLE `envios` (
  `id_envio` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `ultimo_envio` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `envios`
--

INSERT INTO `envios` (`id_envio`, `fecha`, `ultimo_envio`) VALUES
(1, '2014-08-20', '2010-06-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id_equipo` int(11) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_baja` date NOT NULL,
  `fecha_garantia` date NOT NULL,
  `marca` varchar(255) CHARACTER SET latin1 NOT NULL,
  `codigo` varchar(255) CHARACTER SET latin1 NOT NULL,
  `ubicacion` varchar(100) CHARACTER SET latin1 NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_sector` int(11) NOT NULL,
  `id_hubicacion` double NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `id_criticidad` int(11) NOT NULL,
  `estado` varchar(2) CHARACTER SET latin1 NOT NULL,
  `fecha_ultimalectura` datetime NOT NULL,
  `ultima_lectura` double NOT NULL,
  `tipo_horas` varchar(10) CHARACTER SET latin1 NOT NULL,
  `id-centrodecosto` double NOT NULL,
  `valor_reposicion` double NOT NULL,
  `fecha_reposicion` date NOT NULL,
  `id_proveedor` double NOT NULL,
  `valor` double NOT NULL,
  `comprobante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `descrip_tecnica` text COLLATE utf8_spanish_ci NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `id_area` int(11) DEFAULT NULL,
  `id_proceso` int(11) DEFAULT NULL,
  `numero_serie` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_equipo`, `descripcion`, `fecha_ingreso`, `fecha_baja`, `fecha_garantia`, `marca`, `codigo`, `ubicacion`, `id_empresa`, `id_sector`, `id_hubicacion`, `id_grupo`, `id_customer`, `id_criticidad`, `estado`, `fecha_ultimalectura`, `ultima_lectura`, `tipo_horas`, `id-centrodecosto`, `valor_reposicion`, `fecha_reposicion`, `id_proveedor`, `valor`, `comprobante`, `descrip_tecnica`, `id_unidad`, `id_area`, `id_proceso`, `numero_serie`) VALUES
(1, 'Perforadora Ranger 500', '0000-00-00', '0000-00-00', '0000-00-00', 'TamRock', 'EMPER001', 'La Laja', 6, 10, 0, 2, 13, 1, 'AC', '0000-00-00 00:00:00', 1000, '', 0, 0, '0000-00-00', 0, 0, '', '', 11, 3, 8, 11111),
(3, 'Cargadora WA250', '2018-09-02', '0000-00-00', '2018-09-29', 'Komatsu', 'EMCAR003', '0', 6, 12, 0, 1, 14, 1, 'AC', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 1, 3, 8, 11111),
(4, 'Autoelevador 01', '2018-09-02', '0000-00-00', '2018-09-29', 'Toyota', 'EMAUT001', 'La Laja', 6, 10, 0, 3, 15, 2, 'AC', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 1, 3, 8, 11111),
(5, 'Perforadora 680', '0000-00-00', '0000-00-00', '0000-00-00', 'TamRock', 'EMPER002', 'La Laja', 6, 11, 0, 2, 16, 1, 'RE', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 11, 3, 8, 11111),
(7, 'este equipo es una pruba', '2018-08-11', '0000-00-00', '2018-08-10', 'Black & Decker', 'AIR000507', '4444', 6, 11, 0, 3, 17, 9, 'AC', '2018-08-17 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', 'dasdsadsadsa', 2, 10, 9, 2234444),
(8, 'este equipo es una pruebaaaaa', '2018-08-11', '0000-00-00', '2018-08-10', 'Black & Decker', 'AIR000507', '4444', 6, 13, 0, 1, 18, 9, 'AC', '2018-08-17 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', 'dasdsadsadsa', 11, 10, 9, 2234444),
(9, 'PERFONADORA TOYOTA', '2018-09-16', '0000-00-00', '2018-09-22', 'Toyota', 'MT666', '0', 6, 12, 0, 2, 18, 10, 'AC', '2018-09-14 00:00:00', 1540, '', 0, 0, '0000-00-00', 0, 0, '', 'sdfgdfdfg', 6, 10, 9, 123),
(10, 'Descrip', '2018-09-08', '0000-00-00', '2018-09-29', 'Toyota', 'Cod12-2018', '13456,46123', 6, 12, 0, 2, 15, 3, 'AN', '2018-09-07 00:00:00', 20, '', 0, 0, '0000-00-00', 0, 0, '', 'gfhfdgdhhfh', 6, 3, 7, 123),
(12, 'Perforadora Drilltech Tamrock 500', '2018-09-17', '0000-00-00', '2018-09-17', 'DRILLTECH', 'EMPER11', '0', 6, 14, 0, 5, 20, 11, 'AN', '2018-09-17 00:00:00', 5, '', 0, 0, '0000-00-00', 0, 0, '', '', 7, 12, 11, 23344),
(13, 'Perforadora DM45', '2018-01-01', '0000-00-00', '2018-09-22', 'Atlas Copco', '901', '0', 7, 15, 0, 7, 20, 11, 'AC', '2018-09-18 00:00:00', 1150, '', 0, 0, '0000-00-00', 0, 0, '', '', 7, 14, 13, 8614),
(14, 'Perforadora DM 45', '0000-00-00', '0000-00-00', '0000-00-00', 'Atlas Copco', '903', '0', 7, 15, 0, 7, 20, 11, 'AC', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 7, 14, 13, 6052),
(15, 'Pantera DP 1500', '0000-00-00', '0000-00-00', '0000-00-00', 'Sandvik', '905', '0', 7, 15, 0, 8, 20, 11, 'AC', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 7, 14, 11, 12),
(16, 'Roc L8-30', '0000-00-00', '0000-00-00', '0000-00-00', 'DRILLTECH', '906', '0', 7, 15, 0, 9, 20, 11, 'AC', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 7, 14, 11, 10),
(17, 'descrip', '0000-00-00', '0000-00-00', '0000-00-00', 'Bahco', '123456789', 'La Laja', 6, 10, 0, 1, 13, 10, 'AN', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 6, 3, 4, 2222222222),
(18, 'Equipo de prueba', '2018-10-19', '0000-00-00', '2018-10-30', 'Toyota', '123456789', '0', 6, 16, 0, 11, 19, 9, 'AN', '2018-10-25 00:00:00', 22, '', 0, 0, '0000-00-00', 0, 0, '', '', 6, 10, 4, 123456789),
(19, 'descripcion equipo test 1', '2018-01-03', '0000-00-00', '2018-12-08', 'Caterpillar', 'equipo test 1', 'predio', 6, 10, 0, 1, 13, 1, 'AC', '2018-11-14 00:00:00', 100, '', 0, 0, '0000-00-00', 0, 0, '', '', 6, 1, 7, 0),
(20, 'descripcion equipo test 2', '2018-11-06', '0000-00-00', '2018-11-21', 'Black & Decker', 'equipo test 2', '464654', 6, 11, 0, 2, 14, 2, 'AC', '2018-11-07 00:00:00', 50, '', 0, 0, '0000-00-00', 0, 0, '', '', 6, 3, 7, 4656464),
(21, 'descripcion test 3', '2018-11-05', '0000-00-00', '2018-11-21', 'Toyota', 'equipo test 3', '234', 6, 13, 0, 2, 16, 3, 'AC', '2018-11-06 00:00:00', 50, '', 0, 0, '0000-00-00', 0, 0, '', '', 6, 9, 9, 45321);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fallas`
--

CREATE TABLE `fallas` (
  `id_reparacion` int(100) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fallas`
--

INSERT INTO `fallas` (`id_reparacion`, `descripcion`) VALUES
(1, 'Reparación por falla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha_equipo`
--

CREATE TABLE `ficha_equipo` (
  `id_fichaequip` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `marca` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `numero_motor` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `numero_serie` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `dominio` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `fabricacion` int(11) NOT NULL,
  `peso` float NOT NULL,
  `bateria` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `hora_lectura` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ficha_equipo`
--

INSERT INTO `ficha_equipo` (`id_fichaequip`, `id_equipo`, `marca`, `modelo`, `numero_motor`, `numero_serie`, `fecha_ingreso`, `dominio`, `fabricacion`, `peso`, `bateria`, `hora_lectura`) VALUES
(1, 4, '1011', '1012', '1013', '1010', '2017-07-09', 'nose1010', 0, 10, '10', 1),
(2, 242, 'marca12', '12m', '120', '1212', '2017-07-10', 'fefe', 1980, 10, '10', 1),
(3, 0, 'nuevo modelo 5051', '5051ng', '5051', '5051', '2017-07-10', '5051', 1950, 51, '510', 1),
(4, 0, 'marca pepe 14145', 'nuevo pepe 14145', '14150', '14145', '2017-07-10', '14', 1914, 14, '14', 1),
(5, 242, 'nuevo gm 6061', '6061 mgpepe', '60610', '6061', '2017-07-10', '6061', 1960, 61, '60', 1),
(6, 242, '8081p', '80812', '80813', '8081', '2017-07-10', '80814', 1983, 80, '81', 0),
(7, 339, '5252 marca', '5252 marca', '1212', '5252', '2017-07-12', ' gemma', 1989, 12, '20', 0),
(8, 11, 'cat', '3512', '123345', '0001', '2018-01-30', 'lwo070', 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frm_categorias`
--

CREATE TABLE `frm_categorias` (
  `CATE_ID` int(11) NOT NULL,
  `NOMBRE` varchar(1000) CHARACTER SET latin1 NOT NULL,
  `PISTA` varchar(2000) CHARACTER SET latin1 DEFAULT NULL,
  `FEC_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FORM_ID` int(11) NOT NULL,
  `ORDEN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `frm_categorias`
--

INSERT INTO `frm_categorias` (`CATE_ID`, `NOMBRE`, `PISTA`, `FEC_CREACION`, `FORM_ID`, `ORDEN`) VALUES
(1, 'Condiciones Generales:', NULL, '2018-07-28 15:51:53', 1, 1),
(2, 'Eje, Cuerpo, Placa Trasera, Aros', NULL, '2018-07-28 16:09:49', 1, 2),
(3, 'Tilde las acciones a Realizar:', NULL, '2018-07-28 17:02:54', 2, 1),
(4, 'PIEZAS O COMPONENTES A DIAGNOSTICAR', NULL, '2018-07-28 17:15:23', 3, 1),
(5, 'A-TAPAS', NULL, '2018-07-28 17:17:25', 3, 2),
(6, 'B-PIEZAS EN REVOLUCION', NULL, '2018-07-28 17:33:29', 3, 3),
(7, 'C-LUBRICACION', NULL, '2018-07-28 18:00:05', 3, 4),
(8, 'D-REFRIGERACION', NULL, '2018-07-28 18:21:47', 3, 5),
(9, 'E - SISTEMA DE COMBUSTIBLE', NULL, '2018-07-28 18:39:18', 3, 6),
(10, '14-Motores Nafteros:', NULL, '2018-07-28 19:06:57', 3, 7),
(11, '1-Ingreso de Pieza, Identificada y Limpia', NULL, '2018-07-28 23:03:59', 4, 1),
(12, '2-Control y Medicion de Apoyo y Altura de Levas', NULL, '2018-07-28 23:06:43', 4, 2),
(13, 'Observaciones:', NULL, '2018-07-28 23:12:14', 4, 3),
(14, '3-Deteccion de Fisuras Magnaflux', NULL, '2018-07-28 23:12:56', 4, 4),
(15, '4-Control de Dureza Rc o Brinell', NULL, '2018-07-28 23:15:48', 4, 5),
(16, '5-Controlar y Verificar Los Item 1, 2, 3, 4', NULL, '2018-07-28 23:21:49', 4, 6),
(17, '6-Controlar engranaje Bba. de Aceite y su Alineacion', NULL, '2018-07-28 23:22:47', 4, 7),
(18, '7-Controlar Pernos:', NULL, '2018-07-28 23:23:02', 4, 8),
(19, '1-Identificacion y Limpieza Compresor', NULL, '2018-07-28 23:29:33', 5, 1),
(20, '2-Control Visual, Estado General del Conjunto Bielas', NULL, '2018-07-28 23:30:48', 5, 2),
(21, '3-Deteccion de Fisuras Magna Flux', NULL, '2018-07-28 23:44:33', 5, 3),
(22, '4-Medicion de Diametros,4 Muñon y Ojo de Biela', NULL, '2018-07-28 23:47:56', 5, 4),
(23, '5-Medicion Longitud de Biela', NULL, '2018-07-29 00:15:03', 5, 5),
(24, '6-Control de Linealidad de Centros Muñon/Ojo de Biela', NULL, '2018-07-29 04:22:22', 5, 6),
(25, '7-Control de Pesos:', NULL, '2018-07-29 04:28:14', 5, 7),
(26, '8-Control de Planos Alaveo, Torceduras, Deformaciones', NULL, '2018-07-29 04:32:47', 5, 8),
(27, '9-Control de Encastre Tapas / Cuerpos', NULL, '2018-07-29 04:35:34', 5, 9),
(28, '10-Control de Tornillos Longitud y Filetes', NULL, '2018-07-29 04:49:55', 5, 10),
(29, '11-Bielas Perforadas, Control Conductos de Lubricacio?n', NULL, '2018-07-29 04:51:39', 5, 11),
(30, '1-Identificacion y Limpieza', NULL, '2018-07-29 14:22:13', 6, 1),
(31, '2-Diametro de Cilindros', NULL, '2018-07-29 14:22:22', 6, 2),
(32, '3-Extraccion de Camisas', NULL, '2018-07-29 14:22:33', 6, 3),
(33, '4-Busqueda de Fisuras e Incrustaciones', NULL, '2018-07-29 14:22:48', 6, 4),
(34, '5-Control Planos en 4 Costados', NULL, '2018-07-29 14:23:00', 6, 5),
(35, '6-Control de Roscas Internas y Prisioneros', NULL, '2018-07-29 14:23:08', 6, 6),
(36, '7-Control Circuitos de Agua y Aceite – Incrustaciones y/o Comunicacio?n', NULL, '2018-07-29 14:23:21', 6, 7),
(37, '8-Control de Alojamiento, Tapones y Bomba de Agua, y Bases de Conectores', NULL, '2018-07-29 14:49:39', 6, 8),
(38, '9-Control y Medicion de Cilindros (Rectificacion)', NULL, '2018-07-29 14:49:50', 6, 9),
(39, '10-Control Tornillos, Bancadas: Longitud, Perfil Rosca, Estado de Cabeza', NULL, '2018-07-29 14:50:00', 6, 10),
(40, '11-Control Tapas de Bancadas y Guias', NULL, '2018-07-29 14:50:12', 6, 11),
(41, '12-Medida de Alojamiento Arbol de Levas Sin Cojinetes', NULL, '2018-07-29 14:50:21', 6, 12),
(42, '13-Medida y Estado Reten de Bancada', NULL, '2018-07-29 14:50:36', 6, 13),
(43, '1-Ingreso de Pieza, Identificada, Limpia y Desarmada c/componentes', NULL, '2018-07-29 15:07:09', 7, 1),
(44, '2-Control y Evaluacion de Los Items 1,2,3', NULL, '2018-07-29 15:07:50', 7, 2),
(45, '3-Prueba Hidraulica (Area de Produccion)', NULL, '2018-07-29 15:19:45', 7, 3),
(46, '4-Control de Superficies de Elementos Anexos', NULL, '2018-07-29 15:28:07', 7, 4),
(47, '5-Control de Conductos', NULL, '2018-07-29 15:30:16', 7, 5),
(48, '6-Control de Superficie de Camaras de Combustion', NULL, '2018-07-29 15:35:31', 7, 6),
(49, '7-Control de Prisioneros Roscas internas y Agujeros', NULL, '2018-07-29 15:39:42', 7, 7),
(50, '8-Control y Medicion de Guias de Valvulas', NULL, '2018-07-29 15:40:55', 7, 8),
(51, '9-Alojamientos de Botadores', NULL, '2018-07-29 15:43:15', 7, 9),
(52, '10-Control Alojamiento Arbol de Levas (Tunel)', NULL, '2018-07-29 15:45:49', 7, 10),
(53, '11-Control Alojamiento Precamaras', NULL, '2018-07-29 15:49:28', 7, 11),
(54, '12-Control de Resortes Valvula', NULL, '2018-07-29 15:50:16', 7, 12),
(55, '13-Seguros y Platillos de Valvulas y Roto valvulas', NULL, '2018-07-29 15:54:06', 7, 13),
(56, '14-Asiento de Resortes Con y Sin Arandelas', NULL, '2018-07-29 16:05:25', 7, 14),
(57, '15-Bujias de Pre Calentamiento', NULL, '2018-07-29 16:06:44', 7, 15),
(58, 'A – Planilla de Control de VOLANTE', NULL, '2018-07-29 16:09:53', 8, 1),
(59, '1-Identificacion y Limpieza de la pieza', NULL, '2018-07-29 16:10:52', 8, 2),
(60, '2-Control de Fisuras y/o Deformaciones', NULL, '2018-07-29 16:11:25', 8, 3),
(61, '3-Medicion de Durezas en Espejo', NULL, '2018-07-29 16:12:04', 8, 4),
(62, '4-Control de Espesor', NULL, '2018-07-29 16:17:25', 8, 5),
(63, '5-Control Brida Acople', NULL, '2018-07-29 16:20:47', 8, 6),
(64, '6-Control Corona de Arranque Exterior-Interior', NULL, '2018-07-29 16:22:14', 8, 7),
(65, '7-Control de Roscas y Guias', NULL, '2018-07-29 17:27:59', 8, 8),
(66, 'B – Planilla de Control de PLACA DE EMBRAGUE', NULL, '2018-07-29 17:28:43', 8, 9),
(67, '1-Identificacion y Limpieza de la pieza', NULL, '2018-07-29 17:29:57', 8, 10),
(68, '2-Control de Elementos de Accionamiento', NULL, '2018-07-29 17:30:36', 8, 11),
(69, '3-Control de espejo de presion', NULL, '2018-07-29 17:35:51', 8, 12),
(70, '4-Control de Dureza', NULL, '2018-07-29 17:36:55', 8, 13),
(71, 'C – Planilla de Control de POLEA', NULL, '2018-07-29 17:38:37', 8, 14),
(72, '1-Identificacion y Limpieza de la pieza', NULL, '2018-07-29 17:39:09', 8, 15),
(73, '2-Control Alojamiento de Cigueñal', NULL, '2018-07-29 17:39:50', 8, 16),
(74, '3-Control Chavetero', NULL, '2018-07-29 17:40:58', 8, 17),
(75, '4-Control Canal de Correas', NULL, '2018-07-29 17:42:05', 8, 18),
(76, '1-Identificacion y Limpieza', NULL, '2018-07-29 17:52:00', 9, 1),
(77, '2-Control y Medida de Bancadas y Muñones.', NULL, '2018-07-29 18:00:45', 9, 2),
(78, '3-Medicion de Dureza de Bancada y Muñon', NULL, '2018-07-29 21:14:16', 9, 3),
(79, '4-Medicion de Radios de Bancadas y Muñon', NULL, '2018-07-29 21:41:00', 9, 4),
(80, '5-Control de MAGNAFLUX', NULL, '2018-07-29 23:14:50', 9, 5),
(81, '6-Control y Medicion de los Items A, B, C, D, E, F', NULL, '2018-07-29 23:21:07', 9, 6),
(83, '7-Control de Alineacion (Pandeo)', NULL, '2018-07-29 23:38:13', 9, 7),
(84, '8-Estado de Roscas y Alojamientos Tapones', NULL, '2018-07-29 23:39:13', 9, 8),
(85, '9-Control de Alojamiento Axial', NULL, '2018-07-29 23:43:44', 9, 9),
(1000, '', NULL, '2018-07-30 00:36:02', 1000, 1),
(1200, 'Registro de Control de Calidad', NULL, '2018-07-31 12:51:37', 1200, 1),
(1202, 'Bancada', NULL, '2018-07-31 14:30:45', 1200, 2),
(1203, 'Bielas', NULL, '2018-07-31 14:38:42', 1200, 3),
(1204, 'Cilindros', NULL, '2018-07-31 14:46:57', 1200, 4),
(1205, 'Levas', NULL, '2018-07-31 14:55:15', 1200, 5),
(1211, 'Cigueñal:', NULL, '2018-07-31 15:47:06', 1200, 6),
(1212, 'Balanceo de Biela:', NULL, '2018-07-31 16:05:21', 1200, 7),
(1213, 'Otros:', NULL, '2018-07-31 16:13:22', 1200, 8),
(1214, 'CONTROLAR', NULL, '2018-07-31 17:28:38', 1200, 9),
(1215, 'Control de Calidad', NULL, '2018-07-31 18:06:22', 1201, 1),
(1217, 'Block Cigueñal', NULL, '2018-07-31 18:07:59', 1201, 2),
(1218, 'Paro de armado:', NULL, '2018-07-31 18:35:10', 1201, 3),
(1219, 'Control de Calidad', NULL, '2018-07-31 18:42:35', 1202, 1),
(1220, 'Bielas y Pistones', NULL, '2018-07-31 18:45:47', 1202, 2),
(1221, 'Paro el armado', NULL, '2018-07-31 19:18:22', 1202, 3),
(1222, 'Control de Calidad', NULL, '2018-07-31 19:21:56', 1203, 1),
(1223, 'Tapa de Cilindro', NULL, '2018-07-31 19:22:11', 1203, 2),
(1224, 'Paro el armado', NULL, '2018-07-31 19:55:00', 1203, 3),
(1225, 'Control de Calidad', NULL, '2018-07-31 19:59:54', 1204, 1),
(1226, 'Inyeccion Complemento', NULL, '2018-07-31 20:01:01', 1204, 2),
(1227, 'Paro el armado', NULL, '2018-07-31 20:05:13', 1204, 3),
(1228, 'Observaciones en General:', NULL, '2018-08-03 20:19:56', 7, 16),
(2000, '1er Etapa:', NULL, '2018-08-07 14:39:44', 2000, 1),
(2001, '2da Etapa:', NULL, '2018-08-07 14:47:54', 2000, 2),
(2002, '3ra etapa: Solo para motor armado.', NULL, '2018-08-07 14:58:39', 2000, 3),
(2003, '4ta Etapa:', NULL, '2018-08-07 15:01:25', 2000, 4),
(2004, '5ta Etapa:', NULL, '2018-08-07 15:02:26', 2000, 5),
(2005, 'Comentario final:', NULL, '2018-08-07 15:03:20', 2000, 6),
(2006, 'TAPA DE CILINDRO', NULL, '2018-08-07 15:08:30', 2001, 1),
(2007, '1ra Etapa - Controles Previos A Cada Puesta En Marcha', NULL, '2018-08-07 16:26:38', 2003, 1),
(2008, 'IMPORTANTE (conexiones y/o cambios extraordinarios)', NULL, '2018-08-07 20:08:31', 2003, 2),
(2009, '2da Etapa - Prueba del motor', NULL, '2018-08-07 20:15:47', 2003, 3),
(2010, 'Tipo de ensayo: Vacio/ Duracion: 2hs', NULL, '2018-08-08 15:05:11', 2003, 4),
(2011, 'Tipo de ensayo: 25% / Duracion: 2hs', NULL, '2018-08-08 15:23:56', 2003, 5),
(2012, 'Tipo de ensayo: 50% a 70% / Duracion: 6hs', NULL, '2018-08-08 15:38:31', 2003, 6),
(2013, 'DESCARGA Y DETENCION DEL MOTOR', NULL, '2018-08-08 15:50:59', 2003, 7),
(2014, 'Tipo de ensayo: 25% / Duracion: 10min', NULL, '2018-08-08 15:58:52', 2003, 8),
(2015, 'Tipo de ensayo: vacio / Duracion: 10min', NULL, '2018-08-08 16:15:12', 2003, 9),
(2016, 'Apagado', NULL, '2018-08-08 17:08:10', 2003, 10),
(2017, 'Tipo de ensayo: vacio/ Duracion: 30min', NULL, '2018-08-08 17:34:29', 2003, 11),
(2018, 'Tipo de ensayo: 25% / Duracion: 15min', NULL, '2018-08-08 18:02:48', 2003, 12),
(2019, 'Tipo de ensayo: 50% a 70% / Duracion: 15min', NULL, '2018-08-08 18:35:08', 2003, 13),
(2020, 'Tipo de ensayo: 100% / 1er / Duracion: 5min', NULL, '2018-08-08 19:19:47', 2003, 14),
(2021, 'Tipo de ensayo: 100% / 2do / Duracion: 5min', NULL, '2018-08-08 19:32:50', 2003, 15),
(2022, 'Tipo de ensayo: 100% / 3er / Duracion: 5 min', NULL, '2018-08-11 23:32:00', 2003, 16),
(2023, '3ra Etapa - Finalizacion de Blanqueo y Realizacion de Informe', NULL, '2018-08-11 23:50:39', 2003, 17),
(2024, 'DESCARGA Y DETENCION DEL MOTOR', NULL, '2018-08-13 03:05:55', 2003, 18),
(2025, 'Tipo de ensayo: 25% / Duracion: 10min', NULL, '2018-08-13 03:07:40', 2003, 19),
(2026, 'Tipo de ensayo: vacio / Duracion: 10min', NULL, '2018-08-13 03:16:55', 2003, 20),
(2027, 'Apagado Motor: DESMONTAJE', NULL, '2018-08-13 03:23:45', 2003, 21),
(2028, 'INFORME:', NULL, '2018-08-13 03:25:37', 2003, 22),
(2500, 'DETALLE DE TRABAJOS A REALIZAR', NULL, '2018-08-23 14:39:32', 2500, 1),
(5000, 'Cotizacion ', NULL, '2018-08-27 15:52:46', 5000, 1),
(6000, 'Presupuesto', NULL, '2018-08-30 13:54:10', 6000, 1),
(7000, 'Informe Tecnico', NULL, '2018-09-12 23:19:01', 7000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frm_formularios`
--

CREATE TABLE `frm_formularios` (
  `form_id` int(11) NOT NULL,
  `nombre` varchar(1000) NOT NULL,
  `descripcion` varchar(3000) DEFAULT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '1',
  `fec_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fec_deprecado` timestamp NULL DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `frm_formularios`
--

INSERT INTO `frm_formularios` (`form_id`, `nombre`, `descripcion`, `habilitado`, `fec_creacion`, `fec_deprecado`, `usuario`, `id_empresa`) VALUES
(1, 'Registro de Diagnostico y Reparacion de turbo RE-TAL-031', NULL, 1, '2018-07-28 15:50:08', NULL, NULL, 6),
(2, 'Registro de diagnostico de bombas inyectoras RE-TAL-030', NULL, 1, '2018-07-28 17:02:02', NULL, NULL, 6),
(3, 'Registro diagnostico piezas no mecanizadas RE-TAL-008', NULL, 1, '2018-07-28 17:12:16', NULL, NULL, 6),
(4, 'Registro diagnostico arbol de levas RE-TAL-007', NULL, 1, '2018-07-28 23:03:00', NULL, NULL, 6),
(5, 'Registro diagnostico compresor RE-TAL-006', NULL, 1, '2018-07-28 23:29:06', NULL, NULL, 6),
(6, 'Registro diagnostico block de motor RE-TAL-005', NULL, 1, '2018-07-29 14:21:34', NULL, NULL, 6),
(7, 'Registro diagnostico tapa de cilindro RE-TAL-004', NULL, 1, '2018-07-29 15:04:59', NULL, NULL, 6),
(8, 'Registro diagnostico Volante Placa y Polea RE-TAL-003', NULL, 1, '2018-07-29 16:08:45', NULL, NULL, 6),
(9, 'Registro diagnostico cigueñal RE-TAL-001', NULL, 1, '2018-07-29 17:50:14', NULL, NULL, 6),
(1000, 'Registro Recepcion de componente RE-TAL-009', NULL, 1, '2018-07-30 00:35:27', NULL, NULL, 6),
(1200, 'Registro de control de calidad RE-TAL-016', NULL, 1, '2018-07-31 12:50:43', NULL, NULL, 6),
(1201, 'Registro de control de calidad block RE-TAL-017', NULL, 1, '2018-07-31 18:06:09', NULL, NULL, 6),
(1202, 'Registro de control de calidad bielas y pistones RE-TAL-018', NULL, 1, '2018-07-31 18:42:08', NULL, NULL, 6),
(1203, 'Registro de control de calidad tapa de cilindro RE-TAL-019', NULL, 1, '2018-07-31 19:21:33', NULL, NULL, 6),
(1204, 'Registro de control de calidad inyeccion complemento RE-TAL-020', NULL, 1, '2018-07-31 19:59:21', NULL, NULL, 6),
(2000, 'Registro check list de despacho RE-TAL-034', NULL, 1, '2018-08-07 14:38:15', NULL, NULL, 6),
(2001, 'Registro de Armado de Tapa Cilindro RE-TAL-035', NULL, 1, '2018-08-07 15:08:09', NULL, NULL, 6),
(2003, 'Registro check list de banco de prueba RE-TAL-037', NULL, 1, '2018-08-07 16:24:50', NULL, NULL, 6),
(2500, 'Registro Trabajos a realizar RE-TAL-010', NULL, 1, '2018-08-23 14:39:11', NULL, NULL, 6),
(5000, 'Adjunto de Cotizacion', NULL, 1, '2018-08-27 15:52:03', NULL, NULL, 6),
(6000, 'Presupuesto', NULL, 1, '2018-08-30 13:48:40', NULL, NULL, 6),
(7000, 'Informe Tecnico', NULL, 1, '2018-09-12 23:06:23', NULL, NULL, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frm_formularios_completados`
--

CREATE TABLE `frm_formularios_completados` (
  `FOCO_ID` int(11) NOT NULL,
  `FORM_NOMBRE` varchar(1000) NOT NULL,
  `CATE_NOMBRE` varchar(1000) NOT NULL,
  `GRUP_NOMBRE` varchar(1000) NOT NULL,
  `VALO_NOMBRE` varchar(2000) NOT NULL,
  `TIDA_NOMBRE` varchar(100) NOT NULL,
  `VALOR` longtext NOT NULL,
  `FORM_ID` int(11) NOT NULL,
  `REFERENCIA` text,
  `FEC_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `USUARIO` varchar(100) NOT NULL,
  `ORDEN` int(11) DEFAULT NULL,
  `INFO_ID` int(11) NOT NULL,
  `NOM_VAR` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `LITA_ID` int(11) NOT NULL,
  `TIDA_ID` int(11) NOT NULL,
  `VALO_ID` int(11) NOT NULL,
  `OBLIGATORIO` tinyint(1) NOT NULL,
  `VALIDADO` tinyint(1) NOT NULL,
  `ID_EMPRESA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `frm_formularios_completados`
--

INSERT INTO `frm_formularios_completados` (`FOCO_ID`, `FORM_NOMBRE`, `CATE_NOMBRE`, `GRUP_NOMBRE`, `VALO_NOMBRE`, `TIDA_NOMBRE`, `VALOR`, `FORM_ID`, `REFERENCIA`, `FEC_CREACION`, `USUARIO`, `ORDEN`, `INFO_ID`, `NOM_VAR`, `LITA_ID`, `TIDA_ID`, `VALO_ID`, `OBLIGATORIO`, `VALIDADO`, `ID_EMPRESA`) VALUES
(1, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Arnes', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 1, 11, '', 2, 0, 0, 0, 0, 6),
(2, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Biela de compresor', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 2, 11, '', 2, 0, 0, 0, 0, 6),
(3, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Caño col.de adm.de turb.(alu.)', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 3, 11, '', 2, 0, 0, 0, 0, 6),
(4, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Cigueñal del compresor', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 4, 11, '', 2, 0, 0, 0, 0, 6),
(5, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Gancho de motor delantero', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 5, 11, '', 2, 0, 0, 0, 0, 6),
(6, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Brida de arbol de levas', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 6, 11, '', 2, 0, 0, 0, 0, 6),
(7, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Carburador', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 7, 11, '', 2, 0, 0, 0, 0, 6),
(8, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Disco de embrague', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 8, 11, '', 2, 0, 0, 0, 0, 6),
(9, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Mecanismo de aceleracion', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 9, 11, '', 2, 0, 0, 0, 0, 6),
(10, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Prisioneros soporte balancin', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 10, 11, '', 2, 0, 0, 0, 0, 6),
(11, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Tapa de compresor M/V M/N', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 11, 11, '', 2, 0, 0, 0, 0, 6),
(12, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Varilla alza valvulas', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 12, 11, '', 2, 0, 0, 0, 0, 6),
(13, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Piston de compresor', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 13, 11, '', 2, 0, 0, 0, 0, 6),
(14, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Separador de bomba de agua', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 14, 11, '', 2, 0, 0, 0, 0, 6),
(15, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Tapa de inspeccion con respirador', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 15, 11, '', 2, 0, 0, 0, 0, 6),
(16, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Volante con bulones', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 16, 11, '', 2, 0, 0, 0, 0, 6),
(17, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Bielas', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 17, 11, '', 2, 0, 0, 0, 0, 6),
(18, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Caño colec.de escape', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 18, 11, '', 2, 0, 0, 0, 0, 6),
(19, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Cigueñal', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 19, 11, '', 2, 0, 0, 0, 0, 6),
(20, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Gancho de motor trasero', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 20, 11, '', 2, 0, 0, 0, 0, 6),
(21, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Bujias', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 21, 11, '', 2, 0, 0, 0, 0, 6),
(22, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Carcaza cubre volante', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 22, 11, '', 2, 0, 0, 0, 0, 6),
(23, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Distribuidor', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 23, 11, '', 2, 0, 0, 0, 0, 6),
(24, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Multiple de admision', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 24, 11, '', 2, 0, 0, 0, 0, 6),
(25, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', ' Radiadores de aceite con tornillos', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 25, 11, '', 2, 0, 0, 0, 0, 6),
(26, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Tapa de distribucion', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 26, 11, '', 2, 0, 0, 0, 0, 6),
(27, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Torre de balancines', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 27, 11, '', 2, 0, 0, 0, 0, 6),
(28, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Pistones', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 28, 11, '', 2, 0, 0, 0, 0, 6),
(29, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Separador de motor de arranque', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 29, 11, '', 2, 0, 0, 0, 0, 6),
(30, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Tapa lateral', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 30, 11, '', 2, 0, 0, 0, 0, 6),
(31, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Turbo', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 31, 11, '', 2, 0, 0, 0, 0, 6),
(32, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Bulbo de aceite de vigia', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 32, 11, '', 2, 0, 0, 0, 0, 6),
(33, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Carcaza de distribucion', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 33, 11, '', 2, 0, 0, 0, 0, 6),
(34, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Eje de balancines', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 34, 11, '', 2, 0, 0, 0, 0, 6),
(35, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Multiple de escape', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 35, 11, '', 2, 0, 0, 0, 0, 6),
(36, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Block de motor', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 36, 11, '', 2, 0, 0, 0, 0, 6),
(37, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Caño de alim.aceite de turbo', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 37, 11, '', 2, 0, 0, 0, 0, 6),
(38, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Chupador de bomba de aceite', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 38, 11, '', 2, 0, 0, 0, 0, 6),
(39, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Indicador de puestas a punto', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 39, 11, '', 2, 0, 0, 0, 0, 6),
(40, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Reguladores de balancines', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 40, 11, '', 2, 0, 0, 0, 0, 6),
(41, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Tapa de inspeccion', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 41, 11, '', 2, 0, 0, 0, 0, 6),
(42, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Tuercas de inyectores', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 42, 11, '', 2, 0, 0, 0, 0, 6),
(43, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Placa de embrague', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 43, 11, '', 2, 0, 0, 0, 0, 6),
(44, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Soporte de alternador', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 44, 11, '', 2, 0, 0, 0, 0, 6),
(45, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Tapa balancines M/N - M/V', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 45, 11, '', 2, 0, 0, 0, 0, 6),
(46, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Abrazadera caño de gases', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 46, 11, '', 2, 0, 0, 0, 0, 6),
(47, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Bulbo temperatura de vigia', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 47, 11, '', 2, 0, 0, 0, 0, 6),
(48, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Carters c/bulones', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 48, 11, '', 2, 0, 0, 0, 0, 6),
(49, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Engranaje de arbol de levas', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 49, 11, '', 2, 0, 0, 0, 0, 6),
(50, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Bomba de aceite', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 50, 11, '', 2, 0, 0, 0, 0, 6),
(51, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Caño de combustible', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 51, 11, '', 2, 0, 0, 0, 0, 6),
(52, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Rompe olas', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 52, 11, '', 2, 0, 0, 0, 0, 6),
(53, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Inyectores', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 53, 11, '', 2, 0, 0, 0, 0, 6),
(54, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Resorte de valvulas', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 54, 11, '', 2, 0, 0, 0, 0, 6),
(55, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Tapa de inspeccion con respirador', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 55, 11, '', 2, 0, 0, 0, 0, 6),
(56, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Tuercas de tapas de cilindros', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 56, 11, '', 2, 0, 0, 0, 0, 6),
(57, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Platillos de valvulas', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 57, 11, '', 2, 0, 0, 0, 0, 6),
(58, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Soporte de motor', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 58, 11, '', 2, 0, 0, 0, 0, 6),
(59, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Vaina varilla de aceite', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 59, 11, '', 2, 0, 0, 0, 0, 6),
(60, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'ECM o ECU', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 60, 11, '', 2, 0, 0, 0, 0, 6),
(61, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Alternador', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 61, 11, '', 2, 0, 0, 0, 0, 6),
(62, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Bulon punta de cigueñal', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 62, 11, '', 2, 0, 0, 0, 0, 6),
(63, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Chapa cubre volante chica', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 63, 11, '', 2, 0, 0, 0, 0, 6),
(64, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Engranaje de cigueñal', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 64, 11, '', 2, 0, 0, 0, 0, 6),
(65, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Bomba de agua', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 65, 11, '', 2, 0, 0, 0, 0, 6),
(66, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Caño de entrada de aceite', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 66, 11, '', 2, 0, 0, 0, 0, 6),
(67, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Cilindro de compresor', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 67, 11, '', 2, 0, 0, 0, 0, 6),
(68, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Leva de embrague', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 68, 11, '', 2, 0, 0, 0, 0, 6),
(69, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Pernos de presion', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 69, 11, '', 2, 0, 0, 0, 0, 6),
(70, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Resortes de balancines', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 70, 11, '', 2, 0, 0, 0, 0, 6),
(71, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Tapa lateral', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 71, 11, '', 2, 0, 0, 0, 0, 6),
(72, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Union ejes de balancines', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 72, 11, '', 2, 0, 0, 0, 0, 6),
(73, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Polea balanceadora D/3', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 73, 11, '', 2, 0, 0, 0, 0, 6),
(74, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Soporte de multiple de escape', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 74, 11, '', 2, 0, 0, 0, 0, 6),
(75, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Tapas de bancada', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 75, 11, '', 2, 0, 0, 0, 0, 6),
(76, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Sensor', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 76, 11, '', 2, 0, 0, 0, 0, 6),
(77, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Arbol auxiliar', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 77, 11, '', 2, 0, 0, 0, 0, 6),
(78, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Bulones de retorno', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 78, 11, '', 2, 0, 0, 0, 0, 6),
(79, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Chapa cubre volante grande', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 79, 11, '', 2, 0, 0, 0, 0, 6),
(80, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Esparragos de tapa de cilindros', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 80, 11, '', 2, 0, 0, 0, 0, 6),
(81, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Bomba de nafta', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 81, 11, '', 2, 0, 0, 0, 0, 6),
(82, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Caño de retorno', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 82, 11, '', 2, 0, 0, 0, 0, 6),
(83, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Contrapesos', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 83, 11, '', 2, 0, 0, 0, 0, 6),
(84, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Montantes de motor', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 84, 11, '', 2, 0, 0, 0, 0, 6),
(85, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Porta filtro aceite inferior', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 85, 11, '', 2, 0, 0, 0, 0, 6),
(86, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Seguro de valvulas', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 86, 11, '', 2, 0, 0, 0, 0, 6),
(87, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Tapa balancines M/N - M/V', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 87, 11, '', 2, 0, 0, 0, 0, 6),
(88, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Valvula corte de gas-oil vigia', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 88, 11, '', 2, 0, 0, 0, 0, 6),
(89, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Polea bomba de agua', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 89, 11, '', 2, 0, 0, 0, 0, 6),
(90, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Soporte filtro de gasoil DH', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 90, 11, '', 2, 0, 0, 0, 0, 6),
(91, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Tapon de block', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 91, 11, '', 2, 0, 0, 0, 0, 6),
(92, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Arbol de levas', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 92, 11, '', 2, 0, 0, 0, 0, 6),
(93, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Bulones de tapa de bancada ', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 93, 11, '', 2, 0, 0, 0, 0, 6),
(94, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Chaveta de arbol de levas', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 94, 11, '', 2, 0, 0, 0, 0, 6),
(95, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Filtro de aire', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 95, 11, '', 2, 0, 0, 0, 0, 6),
(96, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Bomba Inyectora No', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 96, 11, '', 2, 0, 0, 0, 0, 6),
(97, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Caño inferior retorno de tubo', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 97, 11, '', 2, 0, 0, 0, 0, 6),
(98, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Corona de arranque', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 98, 11, '', 2, 0, 0, 0, 0, 6),
(99, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Motor de arranque', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 99, 11, '', 2, 0, 0, 0, 0, 6),
(100, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Porta filtro aceite superior', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 100, 11, '', 2, 0, 0, 0, 0, 6),
(101, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Sensor de presion de aceite', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 101, 11, '', 2, 0, 0, 0, 0, 6),
(102, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Tapa de distribucion', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 102, 11, '', 2, 0, 0, 0, 0, 6),
(103, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Valvulas', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 103, 11, '', 2, 0, 0, 0, 0, 6),
(104, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Porta termostato inferior', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 104, 11, '', 2, 0, 0, 0, 0, 6),
(105, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Tapa de carcaza cubre volante', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 105, 11, '', 2, 0, 0, 0, 0, 6),
(106, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Tensor de alternador', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 106, 11, '', 2, 0, 0, 0, 0, 6),
(107, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Balancines', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 107, 11, '', 2, 0, 0, 0, 0, 6),
(108, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Bulones de tapa de cilindros', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 108, 11, '', 2, 0, 0, 0, 0, 6),
(109, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Chaveta de cigueñal', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 109, 11, '', 2, 0, 0, 0, 0, 6),
(110, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Filtro de combustible', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 110, 11, '', 2, 0, 0, 0, 0, 6),
(111, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Botadores', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 111, 11, '', 2, 0, 0, 0, 0, 6),
(112, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Caños de inyector', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 112, 11, '', 2, 0, 0, 0, 0, 6),
(113, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Depresor', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 113, 11, '', 2, 0, 0, 0, 0, 6),
(114, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Caño superior retorno de tubo', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 114, 11, '', 2, 0, 0, 0, 0, 6),
(115, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Varilla nivel de aceite', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 115, 11, '', 2, 0, 0, 0, 0, 6),
(116, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Pista reten', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 116, 11, '', 2, 0, 0, 0, 0, 6),
(117, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Sensor de temperatura', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 117, 11, '', 2, 0, 0, 0, 0, 6),
(118, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Tapa de inspeccion', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 118, 11, '', 2, 0, 0, 0, 0, 6),
(119, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Ventilador con tornillos', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 119, 11, '', 2, 0, 0, 0, 0, 6),
(120, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Porta termostato superior', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 120, 11, '', 2, 0, 0, 0, 0, 6),
(121, 'Registro Recepcion de componente RE-TAL-009', '', 'PARTES RECIBIDAS', 'Tapa de cilindros', 'checkbox', '', 1000, NULL, '2018-07-30 00:35:27', '3', 121, 11, '', 2, 0, 0, 0, 0, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frm_grupos`
--

CREATE TABLE `frm_grupos` (
  `GRUP_ID` int(11) NOT NULL,
  `NOMBRE` varchar(1000) NOT NULL,
  `PISTA` varchar(1000) DEFAULT NULL,
  `FEC_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CATE_ID` int(11) DEFAULT NULL,
  `ORDEN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `frm_grupos`
--

INSERT INTO `frm_grupos` (`GRUP_ID`, `NOMBRE`, `PISTA`, `FEC_CREACION`, `CATE_ID`, `ORDEN`) VALUES
(1, 'A-Turbina', NULL, '2018-07-28 15:53:39', 1, 1),
(2, 'B-Rueda Compresora', NULL, '2018-07-28 16:01:40', 1, 2),
(3, 'C-Carcaza de Admision', NULL, '2018-07-28 16:03:06', 1, 3),
(4, 'D-Carcaza de Escape', NULL, '2018-07-28 16:04:05', 1, 4),
(5, 'E-Valvula WG', NULL, '2018-07-28 16:05:18', 1, 5),
(6, 'F-Valvula Electronica Geo Variable', NULL, '2018-07-28 16:06:03', 1, 6),
(7, 'G-Valvula Comandada por WG', NULL, '2018-07-28 16:07:51', 1, 7),
(8, 'H-Mecanismo de Geo Variable', NULL, '2018-07-28 16:08:38', 1, 8),
(9, '1-Eje:', NULL, '2018-07-28 16:16:25', 2, 1),
(10, '2-Cuerpo', NULL, '2018-07-28 16:20:01', 2, 2),
(11, '3-Placa Trasera ', NULL, '2018-07-28 16:21:47', 2, 3),
(12, '4-Sistema Axial', NULL, '2018-07-28 16:23:15', 2, 4),
(13, '5-Aros', NULL, '2018-07-28 16:24:22', 2, 5),
(14, '6-Bujes', NULL, '2018-07-28 16:24:28', 2, 6),
(15, 'Descripcion De Bomba:', NULL, '2018-07-28 17:04:30', 3, 1),
(16, 'Descripcio de Inyectores:', NULL, '2018-07-28 17:06:55', 3, 2),
(17, '', NULL, '2018-07-28 17:15:26', 4, 1),
(18, '1-Tapa Valvula', NULL, '2018-07-28 17:18:20', 5, 1),
(19, '2-Tapa Distribucion', NULL, '2018-07-28 17:21:38', 5, 2),
(20, '3-Carter', NULL, '2018-07-28 17:23:19', 5, 3),
(21, '4-Carcaza Cubre Volante', NULL, '2018-07-28 17:24:48', 5, 4),
(22, '5-Laterales de Block (inspeccion)', NULL, '2018-07-28 17:26:34', 5, 5),
(23, '1-Volante', NULL, '2018-07-28 17:33:40', 6, 1),
(24, '2-Corona de Arranque', NULL, '2018-07-28 17:33:56', 6, 2),
(25, '3-Polea de Cigueñal', NULL, '2018-07-28 17:34:10', 6, 3),
(26, '4-Engranaje de Distribucion', NULL, '2018-07-28 17:35:12', 6, 4),
(27, '5-Cadena de Distribucion ', NULL, '2018-07-28 17:35:32', 6, 5),
(28, '6-Tensor y Patin de Cadena', NULL, '2018-07-28 17:42:47', 6, 6),
(29, '7-Placa y Disco Embrague', NULL, '2018-07-28 17:43:53', 6, 7),
(30, '8-Paleta de Ventilador', NULL, '2018-07-28 17:45:59', 6, 8),
(31, '9-Poleas de Accesorios (Bomba de Agua)', NULL, '2018-07-28 17:51:54', 6, 9),
(32, '10-Polea Multicanal', NULL, '2018-07-28 17:56:28', 6, 10),
(33, '11-Tensores Multicanal', NULL, '2018-07-28 17:56:38', 6, 11),
(34, '1-Bomba de Aceite', NULL, '2018-07-28 18:00:26', 7, 1),
(35, '2-Bulbo Presion de Aceite', NULL, '2018-07-28 18:01:13', 7, 2),
(36, '3-Tubo Carga de Aceite', NULL, '2018-07-28 18:01:24', 7, 3),
(37, '4-Tubo de Alimentacion de Turbo', NULL, '2018-07-28 18:01:33', 7, 4),
(38, '5-Tubo Retorno de Turbo', NULL, '2018-07-28 18:01:45', 7, 5),
(39, '6-Tubo Porta Varilla de Aceite', NULL, '2018-07-28 18:01:53', 7, 6),
(40, '7- Varilla de Aceite', NULL, '2018-07-28 18:02:25', 7, 7),
(41, '8-Porta Filtro de Aceite Inferior', NULL, '2018-07-28 18:07:04', 7, 8),
(42, '9-Porta Filtro de Aceite Superior', NULL, '2018-07-28 18:07:16', 7, 9),
(43, '10-Respiradero de Motor', NULL, '2018-07-28 18:07:27', 7, 10),
(44, '11-Tubos de Lubricacion de Accesorios', NULL, '2018-07-28 18:07:44', 7, 11),
(45, '12-Chupador de Bomba de Aceite', NULL, '2018-07-28 18:08:04', 7, 12),
(46, '13-Radiador de Aceite', NULL, '2018-07-28 18:08:18', 7, 13),
(47, '1-Bomba de Agua', NULL, '2018-07-28 18:22:31', 8, 1),
(48, '2-Bulbo de Temperatura', NULL, '2018-07-28 18:22:47', 8, 2),
(49, '3-Termostato', NULL, '2018-07-28 18:22:54', 8, 3),
(50, '4-Porta Termostato Inferior', NULL, '2018-07-28 18:23:03', 8, 4),
(51, '5-Porta Termostato Superior', NULL, '2018-07-28 18:23:13', 8, 5),
(52, '6-Inter Cooler', NULL, '2018-07-28 18:23:24', 8, 6),
(53, '7-Polea de Ventilador', NULL, '2018-07-28 18:23:35', 8, 7),
(54, '8-Tuberia de Accesorios de Agua', NULL, '2018-07-28 18:23:44', 8, 8),
(55, '9-Tuberia de Agua Turbo', NULL, '2018-07-28 18:23:55', 8, 9),
(56, '10- Mangueras de Agua', NULL, '2018-07-28 18:24:11', 8, 10),
(57, '1-Bomba Inyectora', NULL, '2018-07-28 18:39:54', 9, 1),
(58, '2-Bomba de Presion Principal', NULL, '2018-07-28 18:41:44', 9, 2),
(59, '3-Inyectores', NULL, '2018-07-28 18:43:54', 9, 3),
(60, '4-Bujias de Precalentamiento', NULL, '2018-07-28 18:45:06', 9, 4),
(61, '5-Tubos de Inyectores', NULL, '2018-07-28 18:46:51', 9, 5),
(62, '6-Tubo Alimentador Comb.', NULL, '2018-07-28 18:48:20', 9, 6),
(63, '7-Tubo Retorno Comb.', NULL, '2018-07-28 18:51:39', 9, 7),
(64, '8-Porta Filtro de Aire', NULL, '2018-07-28 18:53:49', 9, 8),
(65, '9-Sistema de Aceleracion', NULL, '2018-07-28 18:54:46', 9, 9),
(66, '10-Sistema de Arranque y Parada', NULL, '2018-07-28 18:56:05', 9, 10),
(67, '11-Sistema de Purgado', NULL, '2018-07-28 18:57:53', 9, 11),
(68, '12-Porta Filtro de Combustible', NULL, '2018-07-28 18:59:52', 9, 12),
(69, '13-Multiple de Admision', NULL, '2018-07-28 19:01:33', 9, 13),
(70, 'a)Inyectores', NULL, '2018-07-28 19:07:18', 10, 1),
(71, 'b)Motores PAP', NULL, '2018-07-28 19:07:33', 10, 2),
(72, 'c)Bomba Alimentador', NULL, '2018-07-28 19:07:52', 10, 3),
(73, 'd)Tubos Distribucion', NULL, '2018-07-28 19:08:06', 10, 4),
(74, 'e)Porta Filtros', NULL, '2018-07-28 19:08:24', 10, 5),
(75, 'f)Tubos de Retorno', NULL, '2018-07-28 19:08:38', 10, 6),
(77, '15-Bomba Alimentadora', NULL, '2018-07-28 22:42:55', 10, 8),
(78, '16-Cañerias de Combustible en General', NULL, '2018-07-28 22:43:15', 10, 9),
(79, '17-Valvulas de Sobre Presion de Combustible', NULL, '2018-07-28 22:43:28', 10, 10),
(80, '', NULL, '2018-07-28 23:04:07', 11, 1),
(81, 'Levas Admision', NULL, '2018-07-28 23:07:10', 12, 1),
(82, 'Levas Escape', NULL, '2018-07-28 23:07:17', 12, 2),
(83, 'Apoyo de Levas', NULL, '2018-07-28 23:07:25', 12, 3),
(85, '', NULL, '2018-07-28 23:12:17', 13, 1),
(86, '', NULL, '2018-07-28 23:13:47', 14, 1),
(87, 'Levas Admision', NULL, '2018-07-28 23:17:10', 15, 1),
(88, 'Levas Escape:', NULL, '2018-07-28 23:17:57', 15, 2),
(89, 'Apoyo de Leva:', NULL, '2018-07-28 23:18:49', 15, 3),
(90, '1 – Roscas Internas', NULL, '2018-07-28 23:21:58', 16, 1),
(91, '2 – Chavetero', NULL, '2018-07-28 23:22:04', 16, 2),
(92, ' 3 – Brida', NULL, '2018-07-28 23:22:10', 16, 3),
(93, '4 – Otros', NULL, '2018-07-28 23:22:17', 16, 4),
(94, '', NULL, '2018-07-28 23:23:05', 17, 1),
(95, '', NULL, '2018-07-28 23:23:11', 18, 1),
(96, '', NULL, '2018-07-28 23:29:50', 19, 1),
(97, '01', NULL, '2018-07-28 23:30:59', 20, 1),
(98, '02', NULL, '2018-07-28 23:31:01', 20, 2),
(99, '03', NULL, '2018-07-28 23:31:04', 20, 3),
(101, '04', NULL, '2018-07-28 23:33:30', 20, 4),
(102, '05', NULL, '2018-07-28 23:33:32', 20, 5),
(103, '06', NULL, '2018-07-28 23:33:35', 20, 6),
(104, '07', NULL, '2018-07-28 23:33:40', 20, 7),
(105, '08', NULL, '2018-07-28 23:33:47', 20, 8),
(106, '09', NULL, '2018-07-28 23:33:51', 20, 9),
(107, '10', NULL, '2018-07-28 23:33:54', 20, 10),
(108, '11', NULL, '2018-07-28 23:33:56', 20, 11),
(109, '12', NULL, '2018-07-28 23:33:58', 20, 12),
(110, '13', NULL, '2018-07-28 23:34:00', 20, 13),
(111, '14', NULL, '2018-07-28 23:34:03', 20, 14),
(112, '15', NULL, '2018-07-28 23:34:06', 20, 15),
(113, '16', NULL, '2018-07-28 23:34:09', 20, 16),
(114, 'n', NULL, '2018-07-28 23:34:12', 20, 17),
(122, '01', NULL, '2018-07-28 23:45:30', 21, 1),
(123, '02', NULL, '2018-07-28 23:45:32', 21, 2),
(124, '03', NULL, '2018-07-28 23:45:35', 21, 3),
(125, '04', NULL, '2018-07-28 23:45:37', 21, 4),
(126, '05', NULL, '2018-07-28 23:45:39', 21, 5),
(127, '06', NULL, '2018-07-28 23:45:41', 21, 6),
(128, '07', NULL, '2018-07-28 23:45:45', 21, 7),
(129, '08', NULL, '2018-07-28 23:45:48', 21, 8),
(130, '09', NULL, '2018-07-28 23:45:51', 21, 9),
(131, '10', NULL, '2018-07-28 23:45:53', 21, 10),
(132, '11', NULL, '2018-07-28 23:45:55', 21, 11),
(133, '12', NULL, '2018-07-28 23:45:57', 21, 12),
(134, '13', NULL, '2018-07-28 23:46:00', 21, 13),
(135, '14', NULL, '2018-07-28 23:46:03', 21, 14),
(136, '15', NULL, '2018-07-28 23:46:06', 21, 15),
(137, '16', NULL, '2018-07-28 23:46:09', 21, 16),
(138, 'n', NULL, '2018-07-28 23:46:11', 21, 17),
(140, '', NULL, '2018-07-28 23:50:10', 22, 1),
(141, '01', NULL, '2018-07-28 23:51:32', 22, 2),
(142, '02', NULL, '2018-07-28 23:51:34', 22, 3),
(143, '03', NULL, '2018-07-29 00:01:37', 22, 4),
(144, '04', NULL, '2018-07-29 00:01:42', 22, 5),
(145, '05', NULL, '2018-07-29 00:01:45', 22, 6),
(146, '06', NULL, '2018-07-29 00:01:48', 22, 7),
(147, '07', NULL, '2018-07-29 00:02:04', 22, 8),
(148, '08', NULL, '2018-07-29 00:02:07', 22, 9),
(149, '09', NULL, '2018-07-29 00:02:11', 22, 10),
(150, '10', NULL, '2018-07-29 00:02:15', 22, 11),
(151, '11', NULL, '2018-07-29 00:02:17', 22, 12),
(152, '12', NULL, '2018-07-29 00:02:19', 22, 13),
(153, '13', NULL, '2018-07-29 00:02:22', 22, 14),
(154, '14', NULL, '2018-07-29 00:02:25', 22, 15),
(155, '15', NULL, '2018-07-29 00:02:28', 22, 16),
(156, '16', NULL, '2018-07-29 00:02:32', 22, 17),
(157, 'N', NULL, '2018-07-29 00:02:35', 22, 18),
(158, '', NULL, '2018-07-29 00:15:10', 23, 1),
(159, '01', NULL, '2018-07-29 00:15:44', 23, 2),
(160, '02', NULL, '2018-07-29 00:15:48', 23, 3),
(161, '03', NULL, '2018-07-29 00:15:52', 23, 4),
(162, '04', NULL, '2018-07-29 00:15:56', 23, 5),
(163, '05', NULL, '2018-07-29 00:15:59', 23, 6),
(164, '06', NULL, '2018-07-29 00:16:05', 23, 7),
(165, '07', NULL, '2018-07-29 00:16:08', 23, 8),
(166, '08', NULL, '2018-07-29 00:16:10', 23, 9),
(167, '09', NULL, '2018-07-29 00:16:13', 23, 10),
(168, '10', NULL, '2018-07-29 00:16:16', 23, 11),
(169, '11', NULL, '2018-07-29 00:16:18', 23, 12),
(170, '12', NULL, '2018-07-29 00:16:20', 23, 13),
(171, '13', NULL, '2018-07-29 00:16:22', 23, 14),
(172, '14', NULL, '2018-07-29 00:16:24', 23, 15),
(173, '15', NULL, '2018-07-29 00:16:27', 23, 16),
(174, '16', NULL, '2018-07-29 00:16:30', 23, 17),
(175, 'n', NULL, '2018-07-29 00:16:32', 23, 18),
(176, '01', NULL, '2018-07-29 04:22:29', 24, 1),
(177, '02', NULL, '2018-07-29 04:22:46', 24, 2),
(178, '03', NULL, '2018-07-29 04:22:54', 24, 3),
(179, '04', NULL, '2018-07-29 04:23:05', 24, 4),
(180, '05', NULL, '2018-07-29 04:23:13', 24, 5),
(181, '06', NULL, '2018-07-29 04:25:22', 24, 6),
(182, '07', NULL, '2018-07-29 04:25:30', 24, 7),
(183, '08', NULL, '2018-07-29 04:25:38', 24, 8),
(184, '09', NULL, '2018-07-29 04:25:49', 24, 9),
(185, '10', NULL, '2018-07-29 04:25:59', 24, 10),
(186, '11', NULL, '2018-07-29 04:26:05', 24, 11),
(187, '12', NULL, '2018-07-29 04:26:12', 24, 12),
(188, '13', NULL, '2018-07-29 04:26:20', 24, 13),
(189, '14', NULL, '2018-07-29 04:26:30', 24, 14),
(190, '15', NULL, '2018-07-29 04:26:39', 24, 15),
(191, '16', NULL, '2018-07-29 04:26:48', 24, 16),
(192, 'n', NULL, '2018-07-29 04:26:57', 24, 17),
(193, '', NULL, '2018-07-29 04:28:23', 25, 1),
(194, '01', NULL, '2018-07-29 04:29:28', 25, 2),
(195, '02', NULL, '2018-07-29 04:29:34', 25, 3),
(196, '03', NULL, '2018-07-29 04:30:06', 25, 4),
(197, '04', NULL, '2018-07-29 04:30:13', 25, 5),
(198, '05', NULL, '2018-07-29 04:30:24', 25, 6),
(199, '06', NULL, '2018-07-29 04:30:33', 25, 7),
(200, '07', NULL, '2018-07-29 04:30:38', 25, 8),
(201, '08', NULL, '2018-07-29 04:30:43', 25, 9),
(202, '09', NULL, '2018-07-29 04:30:47', 25, 10),
(203, '10', NULL, '2018-07-29 04:30:50', 25, 11),
(204, '11', NULL, '2018-07-29 04:30:52', 25, 12),
(205, '12', NULL, '2018-07-29 04:30:54', 25, 13),
(206, '13', NULL, '2018-07-29 04:30:57', 25, 14),
(207, '14', NULL, '2018-07-29 04:31:00', 25, 15),
(208, '15', NULL, '2018-07-29 04:31:04', 25, 16),
(209, '16', NULL, '2018-07-29 04:31:07', 25, 17),
(210, 'n', NULL, '2018-07-29 04:31:10', 25, 18),
(211, '01', NULL, '2018-07-29 04:32:56', 26, 1),
(212, '02', NULL, '2018-07-29 04:32:59', 26, 2),
(213, '03', NULL, '2018-07-29 04:33:02', 26, 3),
(214, '04', NULL, '2018-07-29 04:33:04', 26, 4),
(215, '05', NULL, '2018-07-29 04:33:07', 26, 5),
(216, '06', NULL, '2018-07-29 04:33:10', 26, 6),
(217, '07', NULL, '2018-07-29 04:33:13', 26, 7),
(218, '08', NULL, '2018-07-29 04:33:17', 26, 8),
(219, '09', NULL, '2018-07-29 04:33:20', 26, 9),
(220, '10', NULL, '2018-07-29 04:33:25', 26, 10),
(221, '11', NULL, '2018-07-29 04:33:26', 26, 11),
(222, '12', NULL, '2018-07-29 04:33:28', 26, 12),
(223, '13', NULL, '2018-07-29 04:33:31', 26, 13),
(224, '14', NULL, '2018-07-29 04:33:34', 26, 14),
(225, '15', NULL, '2018-07-29 04:33:36', 26, 15),
(226, '16', NULL, '2018-07-29 04:33:43', 26, 16),
(227, 'n', NULL, '2018-07-29 04:33:46', 26, 17),
(228, '01', NULL, '2018-07-29 04:35:48', 27, 1),
(229, '02', NULL, '2018-07-29 04:35:51', 27, 2),
(230, '03', NULL, '2018-07-29 04:35:56', 27, 3),
(231, '04', NULL, '2018-07-29 04:35:59', 27, 4),
(232, '05', NULL, '2018-07-29 04:36:03', 27, 5),
(233, '06', NULL, '2018-07-29 04:36:06', 27, 6),
(234, '07', NULL, '2018-07-29 04:36:13', 27, 7),
(235, '08', NULL, '2018-07-29 04:36:16', 27, 8),
(236, '09', NULL, '2018-07-29 04:36:20', 27, 9),
(237, '10', NULL, '2018-07-29 04:36:23', 27, 10),
(238, '11', NULL, '2018-07-29 04:36:25', 27, 11),
(239, '12', NULL, '2018-07-29 04:36:27', 27, 12),
(240, '13', NULL, '2018-07-29 04:36:29', 27, 13),
(241, '14', NULL, '2018-07-29 04:36:32', 27, 14),
(242, '15', NULL, '2018-07-29 04:36:35', 27, 15),
(243, '16', NULL, '2018-07-29 04:36:38', 27, 16),
(244, 'n', NULL, '2018-07-29 04:36:41', 27, 17),
(245, '01', NULL, '2018-07-29 04:50:09', 28, 1),
(246, '02', NULL, '2018-07-29 04:50:12', 28, 2),
(247, '03', NULL, '2018-07-29 04:50:15', 28, 3),
(248, '04', NULL, '2018-07-29 04:50:18', 28, 4),
(249, '05', NULL, '2018-07-29 04:50:20', 28, 5),
(250, '06', NULL, '2018-07-29 04:50:22', 28, 6),
(251, '07', NULL, '2018-07-29 04:50:25', 28, 7),
(252, '08', NULL, '2018-07-29 04:50:27', 28, 8),
(253, '09', NULL, '2018-07-29 04:50:30', 28, 9),
(254, '10', NULL, '2018-07-29 04:50:32', 28, 10),
(255, '11', NULL, '2018-07-29 04:50:34', 28, 11),
(256, '12', NULL, '2018-07-29 04:50:36', 28, 12),
(257, '13', NULL, '2018-07-29 04:50:38', 28, 13),
(258, '14', NULL, '2018-07-29 04:50:40', 28, 14),
(259, '15', NULL, '2018-07-29 04:50:42', 28, 15),
(260, '16', NULL, '2018-07-29 04:50:44', 28, 16),
(261, 'n', NULL, '2018-07-29 04:50:46', 28, 17),
(262, '01', NULL, '2018-07-29 04:52:05', 29, 1),
(263, '02', NULL, '2018-07-29 04:52:09', 29, 2),
(264, '03', NULL, '2018-07-29 04:52:16', 29, 3),
(265, '04', NULL, '2018-07-29 04:52:22', 29, 4),
(266, '05', NULL, '2018-07-29 04:52:27', 29, 5),
(267, '06', NULL, '2018-07-29 04:52:33', 29, 6),
(268, '07', NULL, '2018-07-29 04:52:39', 29, 7),
(269, '08', NULL, '2018-07-29 04:52:45', 29, 8),
(270, '09', NULL, '2018-07-29 04:52:53', 29, 9),
(271, '10', NULL, '2018-07-29 04:52:59', 29, 10),
(272, '11', NULL, '2018-07-29 04:53:04', 29, 11),
(273, '12', NULL, '2018-07-29 04:53:09', 29, 12),
(274, '13', NULL, '2018-07-29 04:53:15', 29, 13),
(275, '14', NULL, '2018-07-29 04:53:23', 29, 14),
(276, '15', NULL, '2018-07-29 04:53:30', 29, 15),
(277, '16', NULL, '2018-07-29 04:53:38', 29, 16),
(278, 'n', NULL, '2018-07-29 04:53:43', 29, 17),
(279, '', NULL, '2018-07-29 14:23:41', 30, 1),
(292, 'Medida:', NULL, '2018-07-29 14:27:00', 31, 1),
(293, 'Medida:', NULL, '2018-07-29 14:27:02', 31, 2),
(294, 'Medida:', NULL, '2018-07-29 14:27:09', 31, 3),
(295, 'Medida:', NULL, '2018-07-29 14:27:11', 31, 4),
(296, 'Medida:', NULL, '2018-07-29 14:27:13', 31, 5),
(297, 'Medida:', NULL, '2018-07-29 14:27:15', 31, 6),
(298, 'Medida:', NULL, '2018-07-29 14:27:16', 31, 7),
(299, 'Medida:', NULL, '2018-07-29 14:27:19', 31, 8),
(300, 'Medida:', NULL, '2018-07-29 14:27:22', 31, 9),
(301, 'Medida:', NULL, '2018-07-29 14:27:24', 31, 10),
(302, '', NULL, '2018-07-29 14:28:41', 31, 11),
(303, 'Medida:', NULL, '2018-07-29 14:31:50', 32, 1),
(304, 'Medida:', NULL, '2018-07-29 14:31:52', 32, 2),
(305, 'Medida:', NULL, '2018-07-29 14:31:54', 32, 3),
(306, 'Medida:', NULL, '2018-07-29 14:31:55', 32, 4),
(307, 'Medida:', NULL, '2018-07-29 14:31:57', 32, 5),
(308, 'Medida:', NULL, '2018-07-29 14:31:59', 32, 6),
(309, 'Medida:', NULL, '2018-07-29 14:32:01', 32, 7),
(310, 'Medida:', NULL, '2018-07-29 14:32:02', 32, 8),
(311, 'Medida:', NULL, '2018-07-29 14:32:04', 32, 9),
(312, 'Medida:', NULL, '2018-07-29 14:32:06', 32, 10),
(313, '', NULL, '2018-07-29 14:34:13', 32, 11),
(314, '', NULL, '2018-07-29 14:43:33', 33, 1),
(327, 'Superior:', NULL, '2018-07-29 14:47:14', 34, 1),
(328, 'Inferior:', NULL, '2018-07-29 14:47:19', 34, 2),
(329, 'Frontal:', NULL, '2018-07-29 14:47:24', 34, 3),
(330, 'Trasero:', NULL, '2018-07-29 14:47:30', 34, 4),
(331, 'Planos Multiples:', NULL, '2018-07-29 14:47:39', 34, 5),
(332, 'Roscas Internas:', NULL, '2018-07-29 14:48:16', 35, 1),
(333, 'Prisioneros:', NULL, '2018-07-29 14:48:25', 35, 2),
(334, 'Agua:', NULL, '2018-07-29 14:48:55', 36, 1),
(335, 'Aceite:', NULL, '2018-07-29 14:49:01', 36, 2),
(336, 'Alojamiento:', NULL, '2018-07-29 14:50:55', 37, 1),
(337, 'Bases:', NULL, '2018-07-29 14:50:59', 37, 2),
(338, 'Medida:', NULL, '2018-07-29 14:51:52', 38, 1),
(339, 'Medida:', NULL, '2018-07-29 14:52:14', 38, 2),
(340, 'Medida:', NULL, '2018-07-29 14:52:16', 38, 3),
(341, 'Medida:', NULL, '2018-07-29 14:52:18', 38, 4),
(342, 'Medida:', NULL, '2018-07-29 14:52:20', 38, 5),
(343, 'Medida:', NULL, '2018-07-29 14:52:22', 38, 6),
(344, 'Medida:', NULL, '2018-07-29 14:52:25', 38, 7),
(345, 'Medida:', NULL, '2018-07-29 14:52:27', 38, 8),
(346, 'Medida:', NULL, '2018-07-29 14:52:30', 38, 9),
(349, 'Banc 1', NULL, '2018-07-29 14:55:11', 39, 1),
(350, 'Banc 2', NULL, '2018-07-29 14:55:14', 39, 2),
(351, 'Banc 3', NULL, '2018-07-29 14:55:19', 39, 3),
(352, 'Banc 4', NULL, '2018-07-29 14:55:22', 39, 4),
(353, 'Banc 5', NULL, '2018-07-29 14:55:25', 39, 5),
(354, 'Banc 6', NULL, '2018-07-29 14:55:28', 39, 6),
(355, 'Banc 7', NULL, '2018-07-29 14:55:34', 39, 7),
(356, 'Banc n', NULL, '2018-07-29 14:55:39', 39, 8),
(357, 'Banc 1', NULL, '2018-07-29 14:58:27', 40, 1),
(358, 'Banc 2', NULL, '2018-07-29 14:58:30', 40, 2),
(359, 'Banc 3', NULL, '2018-07-29 14:58:34', 40, 3),
(360, 'Banc 4 ', NULL, '2018-07-29 14:58:37', 40, 4),
(361, 'Banc 5', NULL, '2018-07-29 14:58:40', 40, 5),
(362, 'Banc 6', NULL, '2018-07-29 14:58:44', 40, 6),
(363, 'Banc n', NULL, '2018-07-29 14:58:48', 40, 7),
(364, 'Indique Estado de Guias:', NULL, '2018-07-29 14:59:58', 40, 8),
(365, 'Medida:', NULL, '2018-07-29 15:01:12', 41, 1),
(366, 'Medida:', NULL, '2018-07-29 15:01:14', 41, 2),
(367, 'Medida:', NULL, '2018-07-29 15:01:16', 41, 3),
(368, 'Medida:', NULL, '2018-07-29 15:01:18', 41, 4),
(369, 'Medida:', NULL, '2018-07-29 15:01:21', 41, 5),
(370, '', NULL, '2018-07-29 15:02:51', 42, 1),
(371, '', NULL, '2018-07-29 15:07:16', 43, 1),
(372, '1 - Altura de Tapa', NULL, '2018-07-29 15:08:07', 44, 1),
(373, '2 - Control de Planos', NULL, '2018-07-29 15:08:28', 44, 2),
(374, '3 – Fisuras Expuestas', NULL, '2018-07-29 15:08:41', 44, 3),
(375, '', NULL, '2018-07-29 15:22:46', 45, 1),
(376, 'Sup. Base Bomba de Agua', NULL, '2018-07-29 15:28:19', 46, 1),
(377, 'Sup. Base Admision – Escape', NULL, '2018-07-29 15:28:26', 46, 2),
(378, 'Sup. Base Taba Valvulas', NULL, '2018-07-29 15:28:34', 46, 3),
(379, 'Otros', NULL, '2018-07-29 15:28:42', 46, 4),
(380, 'Conductos de Lubricacion:', NULL, '2018-07-29 15:30:58', 47, 1),
(381, 'Conductos de Refrigeracion:', NULL, '2018-07-29 15:31:13', 47, 2),
(382, 'Comunicados', NULL, '2018-07-29 15:31:24', 47, 3),
(383, '', NULL, '2018-07-29 15:35:40', 48, 1),
(384, 'Observaciones:', NULL, '2018-07-29 15:35:52', 48, 2),
(385, 'Prisioneros:', NULL, '2018-07-29 15:39:57', 49, 1),
(386, 'Roscas Internas:', NULL, '2018-07-29 15:40:06', 49, 2),
(387, 'Agujeros:', NULL, '2018-07-29 15:40:14', 49, 3),
(388, '', NULL, '2018-07-29 15:41:59', 50, 1),
(389, 'Observaciones:', NULL, '2018-07-29 15:42:46', 50, 2),
(390, '', NULL, '2018-07-29 15:43:36', 51, 1),
(391, '', NULL, '2018-07-29 15:46:02', 52, 1),
(392, '', NULL, '2018-07-29 15:49:36', 53, 1),
(393, 'Tension de Precamara:', NULL, '2018-07-29 15:50:45', 54, 1),
(394, 'Tension de Carga:', NULL, '2018-07-29 15:50:52', 54, 2),
(395, 'Cambiar:', NULL, '2018-07-29 15:50:59', 54, 3),
(396, 'Observaciones:', NULL, '2018-07-29 15:51:06', 54, 4),
(397, 'Seguros:', NULL, '2018-07-29 15:54:21', 55, 1),
(398, 'Platillos:', NULL, '2018-07-29 15:54:29', 55, 2),
(399, '', NULL, '2018-07-29 16:05:50', 56, 1),
(400, '', NULL, '2018-07-29 16:06:50', 57, 1),
(401, '', NULL, '2018-07-29 16:11:04', 59, 1),
(402, '', NULL, '2018-07-29 16:11:30', 60, 1),
(403, 'Medir dureza en cuatro puntos del espejo, a 90o c/u', NULL, '2018-07-29 16:12:20', 61, 1),
(410, 'Valor Obtenido:', NULL, '2018-07-29 16:15:46', 61, 2),
(411, 'Observaciones:', NULL, '2018-07-29 16:16:44', 61, 3),
(412, '', NULL, '2018-07-29 16:17:38', 62, 1),
(414, 'Pista:', NULL, '2018-07-29 16:20:57', 63, 1),
(415, 'Respaldo:', NULL, '2018-07-29 16:21:08', 63, 2),
(416, 'Agujeros:', NULL, '2018-07-29 16:21:38', 63, 3),
(417, 'Altura de Dientes:', NULL, '2018-07-29 16:22:31', 64, 1),
(418, 'Angulo de Entrada:', NULL, '2018-07-29 16:22:39', 64, 2),
(420, 'Fisura:', NULL, '2018-07-29 16:24:10', 64, 3),
(421, 'Linealidad:', NULL, '2018-07-29 16:24:21', 64, 4),
(422, 'Roscas:', NULL, '2018-07-29 17:28:13', 65, 1),
(423, 'Guias:', NULL, '2018-07-29 17:28:17', 65, 2),
(424, 'Observaciones:', NULL, '2018-07-29 17:28:26', 65, 3),
(425, '', NULL, '2018-07-29 17:30:03', 67, 1),
(426, '', NULL, '2018-07-29 17:33:57', 68, 1),
(427, '', NULL, '2018-07-29 17:36:02', 69, 1),
(428, 'Medir dureza en cuatro puntos del espejo a 90o c/u', NULL, '2018-07-29 17:37:10', 70, 1),
(429, 'Valor Obtenido:', NULL, '2018-07-29 17:37:44', 70, 2),
(430, '', NULL, '2018-07-29 17:39:16', 72, 1),
(431, '', NULL, '2018-07-29 17:39:56', 73, 1),
(432, '', NULL, '2018-07-29 17:41:03', 74, 1),
(433, '', NULL, '2018-07-29 17:42:08', 75, 1),
(434, '', NULL, '2018-07-29 17:52:05', 76, 1),
(435, 'B1', NULL, '2018-07-29 18:05:18', 77, 1),
(436, 'B2', NULL, '2018-07-29 18:05:29', 77, 2),
(437, 'B3', NULL, '2018-07-29 18:05:32', 77, 3),
(438, 'B4', NULL, '2018-07-29 18:05:35', 77, 4),
(439, 'B5', NULL, '2018-07-29 18:05:38', 77, 5),
(440, 'B6', NULL, '2018-07-29 18:05:42', 77, 6),
(441, 'B7', NULL, '2018-07-29 18:05:46', 77, 7),
(442, 'B8', NULL, '2018-07-29 18:05:50', 77, 8),
(443, 'B9', NULL, '2018-07-29 18:06:00', 77, 9),
(444, 'B10', NULL, '2018-07-29 18:06:05', 77, 10),
(445, 'Bn', NULL, '2018-07-29 18:06:13', 77, 11),
(446, 'M1', NULL, '2018-07-29 19:17:56', 77, 12),
(447, 'M2', NULL, '2018-07-29 19:17:59', 77, 13),
(448, 'M3', NULL, '2018-07-29 19:18:02', 77, 14),
(449, 'M4', NULL, '2018-07-29 19:18:05', 77, 15),
(450, 'M5', NULL, '2018-07-29 19:18:07', 77, 16),
(451, 'M6', NULL, '2018-07-29 19:18:10', 77, 17),
(452, 'M7', NULL, '2018-07-29 19:18:12', 77, 18),
(453, 'M8', NULL, '2018-07-29 19:18:14', 77, 19),
(454, 'M9', NULL, '2018-07-29 19:18:18', 77, 20),
(455, 'M10', NULL, '2018-07-29 19:18:23', 77, 21),
(456, 'M11', NULL, '2018-07-29 19:18:31', 77, 22),
(457, 'M12', NULL, '2018-07-29 19:18:45', 77, 23),
(458, 'M13', NULL, '2018-07-29 19:18:49', 77, 24),
(459, 'M14', NULL, '2018-07-29 19:18:53', 77, 25),
(460, 'M15', NULL, '2018-07-29 19:18:57', 77, 26),
(461, 'M16', NULL, '2018-07-29 19:19:01', 77, 27),
(462, 'Mn', NULL, '2018-07-29 19:19:06', 77, 28),
(463, 'B1', NULL, '2018-07-29 21:24:12', 78, 1),
(464, 'B2', NULL, '2018-07-29 21:24:16', 78, 2),
(465, 'B3', NULL, '2018-07-29 21:24:20', 78, 3),
(466, 'B4', NULL, '2018-07-29 21:24:24', 78, 4),
(467, 'B5', NULL, '2018-07-29 21:24:27', 78, 5),
(468, 'B6', NULL, '2018-07-29 21:24:37', 78, 6),
(469, 'B7', NULL, '2018-07-29 21:24:41', 78, 7),
(470, 'B8', NULL, '2018-07-29 21:24:45', 78, 8),
(471, 'B9', NULL, '2018-07-29 21:24:51', 78, 9),
(472, 'B10', NULL, '2018-07-29 21:24:55', 78, 10),
(473, 'M1', NULL, '2018-07-29 21:29:01', 78, 11),
(474, 'M2', NULL, '2018-07-29 21:29:04', 78, 12),
(475, 'M3', NULL, '2018-07-29 21:29:09', 78, 13),
(476, 'M4', NULL, '2018-07-29 21:29:12', 78, 14),
(477, 'M5', NULL, '2018-07-29 21:29:14', 78, 15),
(478, 'M6', NULL, '2018-07-29 21:29:16', 78, 16),
(479, 'M7', NULL, '2018-07-29 21:30:12', 78, 17),
(480, 'M8', NULL, '2018-07-29 21:30:16', 78, 18),
(481, 'M9', NULL, '2018-07-29 21:30:22', 78, 19),
(482, 'M10', NULL, '2018-07-29 21:31:04', 78, 20),
(483, 'M11', NULL, '2018-07-29 21:31:07', 78, 21),
(484, 'M12', NULL, '2018-07-29 21:31:11', 78, 22),
(485, 'M13', NULL, '2018-07-29 21:31:13', 78, 23),
(486, 'M14', NULL, '2018-07-29 21:31:19', 78, 24),
(487, 'M15', NULL, '2018-07-29 21:31:24', 78, 25),
(488, 'M16', NULL, '2018-07-29 21:31:27', 78, 26),
(489, 'Mn', NULL, '2018-07-29 21:31:31', 78, 27),
(490, 'B1', NULL, '2018-07-29 21:41:52', 79, 1),
(491, 'B2', NULL, '2018-07-29 21:41:56', 79, 2),
(492, 'B3', NULL, '2018-07-29 21:42:25', 79, 3),
(493, 'B4', NULL, '2018-07-29 21:42:27', 79, 4),
(494, 'B5', NULL, '2018-07-29 21:42:31', 79, 5),
(495, 'B6', NULL, '2018-07-29 21:42:33', 79, 6),
(496, 'B7', NULL, '2018-07-29 21:42:38', 79, 7),
(497, 'B8', NULL, '2018-07-29 21:42:42', 79, 8),
(498, 'B9', NULL, '2018-07-29 21:42:46', 79, 9),
(499, 'B10', NULL, '2018-07-29 21:42:48', 79, 10),
(500, 'Bn', NULL, '2018-07-29 21:42:52', 79, 11),
(501, 'M1', NULL, '2018-07-29 21:46:36', 79, 12),
(502, 'M2', NULL, '2018-07-29 21:46:41', 79, 13),
(503, 'M3', NULL, '2018-07-29 21:46:43', 79, 14),
(504, 'M4', NULL, '2018-07-29 21:46:45', 79, 15),
(505, 'M5', NULL, '2018-07-29 21:46:47', 79, 16),
(506, 'M6', NULL, '2018-07-29 21:46:51', 79, 17),
(507, 'M7', NULL, '2018-07-29 21:46:55', 79, 18),
(508, 'M8', NULL, '2018-07-29 21:46:58', 79, 19),
(509, 'M9', NULL, '2018-07-29 21:47:00', 79, 20),
(510, 'M10', NULL, '2018-07-29 21:47:04', 79, 21),
(511, 'M11', NULL, '2018-07-29 21:47:08', 79, 22),
(512, 'M12', NULL, '2018-07-29 21:47:10', 79, 23),
(513, 'M13', NULL, '2018-07-29 21:47:13', 79, 24),
(514, 'M14', NULL, '2018-07-29 21:47:16', 79, 25),
(515, 'M15', NULL, '2018-07-29 21:47:19', 79, 26),
(516, 'M16', NULL, '2018-07-29 21:47:25', 79, 27),
(517, 'Mn', NULL, '2018-07-29 21:47:29', 79, 28),
(518, 'Bancada', NULL, '2018-07-29 23:15:00', 80, 1),
(519, 'Muñon', NULL, '2018-07-29 23:15:04', 80, 2),
(520, 'A: Rosca Interna Punta de Cigueñal', NULL, '2018-07-29 23:21:34', 81, 1),
(521, 'B: Chavetero', NULL, '2018-07-29 23:21:41', 81, 2),
(522, 'C: Cono Interferencia Polea Reconstruir a:', NULL, '2018-07-29 23:21:52', 81, 3),
(523, 'D: Pista de Reten', NULL, '2018-07-29 23:31:34', 81, 4),
(524, 'E: Alojamiento Ruleman Directa', NULL, '2018-07-29 23:31:42', 81, 5),
(525, 'Observaciones:', NULL, '2018-07-29 23:32:06', 81, 6),
(526, 'F: Marcado de Contrapesos y Estado de Tornillos', NULL, '2018-07-29 23:33:47', 81, 7),
(527, '01', NULL, '2018-07-29 23:34:07', 81, 8),
(528, '02', NULL, '2018-07-29 23:34:09', 81, 9),
(529, '03', NULL, '2018-07-29 23:34:13', 81, 10),
(530, '04', NULL, '2018-07-29 23:34:15', 81, 11),
(531, '05', NULL, '2018-07-29 23:34:17', 81, 12),
(532, '06', NULL, '2018-07-29 23:34:20', 81, 13),
(533, '07', NULL, '2018-07-29 23:34:24', 81, 14),
(534, '08', NULL, '2018-07-29 23:34:26', 81, 15),
(535, '09', NULL, '2018-07-29 23:34:30', 81, 16),
(536, '10', NULL, '2018-07-29 23:34:33', 81, 17),
(537, 'n', NULL, '2018-07-29 23:34:35', 81, 18),
(538, 'Observaciones:', NULL, '2018-07-29 23:37:33', 81, 19),
(539, '', NULL, '2018-07-29 23:38:25', 83, 1),
(540, '', NULL, '2018-07-29 23:43:13', 84, 1),
(541, '', NULL, '2018-07-29 23:43:48', 85, 1),
(1000, 'PARTES RECIBIDAS', NULL, '2018-07-30 00:36:15', 1000, 1),
(1201, 'Caracteristicas:', NULL, '2018-07-31 12:52:02', 1200, 1),
(1210, 'Luz de Aceite', NULL, '2018-07-31 14:30:54', 1202, 1),
(1212, 'Luz de aceite', NULL, '2018-07-31 14:41:04', 1203, 1),
(1213, '', NULL, '2018-07-31 14:50:20', 1204, 1),
(1215, 'Luz de aceite:', NULL, '2018-07-31 15:17:28', 1205, 1),
(1216, 'Medidas del Ap. Levas:', NULL, '2018-07-31 15:21:06', 1205, 2),
(1217, 'Eje de mando:', NULL, '2018-07-31 15:21:56', 1205, 3),
(1218, 'Fabrica pide maxima y minima', NULL, '2018-07-31 15:23:02', 1205, 4),
(1226, 'Reten:', NULL, '2018-07-31 15:47:22', 1211, 1),
(1229, 'Axial:', NULL, '2018-07-31 15:51:01', 1211, 2),
(1230, 'Biela de Compresor:', NULL, '2018-07-31 15:53:16', 1211, 3),
(1231, 'Cilindro de Compresor:', NULL, '2018-07-31 15:54:43', 1211, 4),
(1233, 'Otros:', NULL, '2018-07-31 15:59:17', 1211, 5),
(1234, 'Control de peso:', NULL, '2018-07-31 16:05:33', 1212, 1),
(1235, 'Control de Bomba de Aceite con Arbol de Levas:', NULL, '2018-07-31 16:13:58', 1213, 1),
(1236, 'Luz de Axial:', NULL, '2018-07-31 16:17:38', 1213, 2),
(1237, 'Block:', NULL, '2018-07-31 16:18:00', 1213, 3),
(1238, 'Botadores:', NULL, '2018-07-31 16:20:28', 1213, 4),
(1239, 'Engranajes:', NULL, '2018-07-31 16:21:10', 1213, 5),
(1240, 'Conductos de agua:', NULL, '2018-07-31 16:22:15', 1213, 6),
(1241, 'Controlar:', NULL, '2018-07-31 16:22:51', 1213, 7),
(1242, 'Luz de Canaletas de Aros:', NULL, '2018-07-31 16:23:56', 1213, 8),
(1243, 'Balanceo de:', NULL, '2018-07-31 16:24:14', 1213, 9),
(1244, 'Escuadra de:', NULL, '2018-07-31 16:25:21', 1213, 10),
(1245, 'Altura de:', NULL, '2018-07-31 16:25:48', 1213, 11),
(1246, 'Repasar rosca de tapa distribucion de:', NULL, '2018-07-31 16:26:56', 1213, 12),
(1247, '', NULL, '2018-07-31 17:28:41', 1214, 1),
(1248, 'Caracteristicas:', NULL, '2018-07-31 18:06:50', 1215, 1),
(1249, 'Operacion:', NULL, '2018-07-31 18:09:10', 1217, 1),
(1250, '1-Lavado de Block', NULL, '2018-07-31 18:16:48', 1217, 2),
(1251, 'Control de Limpieza de Conductor de Aceite', NULL, '2018-07-31 18:18:04', 1217, 3),
(1252, 'Colocar tapones de Lubricacion y refrigeracion (Pegamento)', NULL, '2018-07-31 18:19:30', 1217, 4),
(1253, '2-Hacer limpieza fina de cojinetes', NULL, '2018-07-31 18:21:02', 1217, 5),
(1254, 'Friccionar con lubricante Molykote Limpiar y lubricar con Bardhal', NULL, '2018-07-31 18:22:04', 1217, 6),
(1255, 'Colocar cojinetes en sus alojamientos', NULL, '2018-07-31 18:23:01', 1217, 7),
(1256, '3. Limpieza de Cigueñal. Verificar limpieza de conductos de aceite', NULL, '2018-07-31 18:24:16', 1217, 8),
(1257, 'Montar el cigueñal. Verificar el chavetero y trinquero', NULL, '2018-07-31 18:25:41', 1217, 9),
(1258, 'Ajustar tapas de bancadas.', NULL, '2018-07-31 18:26:59', 1217, 10),
(1259, 'Controlar el giro liviano de cigueñal', NULL, '2018-07-31 18:27:57', 1217, 11),
(1260, 'Ajustar contrapesos correspondientes', NULL, '2018-07-31 18:29:21', 1217, 12),
(1261, 'Controlar Alojamiento de O''ring de camisas', NULL, '2018-07-31 18:30:20', 1217, 13),
(1262, '* Colocar Camisas Humedas', NULL, '2018-07-31 18:32:02', 1217, 14),
(1263, 'Controlar su ubicacion y altura', NULL, '2018-07-31 18:32:51', 1217, 15),
(1264, 'Marcar si lleva juntas de camisas (laminas)', NULL, '2018-07-31 18:33:51', 1217, 16),
(1265, 'Descripcion:', NULL, '2018-07-31 18:35:26', 1218, 1),
(1266, 'Descripcion 2:', NULL, '2018-07-31 18:36:08', 1218, 2),
(1267, 'Descripcion 3:', NULL, '2018-07-31 18:36:31', 1218, 3),
(1268, 'Caracteristicas:', NULL, '2018-07-31 18:44:54', 1219, 1),
(1269, '1. Hacer limpieza fina de bielas y pistones', NULL, '2018-07-31 18:46:01', 1220, 1),
(1270, 'Verificar seguros de pernos de piston', NULL, '2018-07-31 18:48:22', 1220, 2),
(1271, 'Colocar aros correspondientes en pistones', NULL, '2018-07-31 18:50:05', 1220, 3),
(1272, 'Lubricar cilindros', NULL, '2018-07-31 18:52:34', 1220, 4),
(1273, 'Colocar conjunto biela piston', NULL, '2018-07-31 18:53:47', 1220, 5),
(1274, '2. Lubricar muñones de bielas', NULL, '2018-07-31 18:54:52', 1220, 6),
(1275, 'Colocar tapas de bielas', NULL, '2018-07-31 18:55:48', 1220, 7),
(1276, 'Ajustar tapa de bielas segun normas', NULL, '2018-07-31 18:57:13', 1220, 8),
(1277, 'Controlar altura de pistones', NULL, '2018-07-31 18:58:36', 1220, 9),
(1278, 'Reapretar los tornillos de avance de la bomba en la distribucion y Controlar el seguro', NULL, '2018-07-31 18:59:25', 1220, 10),
(1279, '3. Lavado de bomba de aceite', NULL, '2018-07-31 19:00:12', 1220, 11),
(1280, 'Colocacion y control de luz de engranajes.', NULL, '2018-07-31 19:01:12', 1220, 12),
(1281, 'Ajustes de tornillos sobre el block', NULL, '2018-07-31 19:03:56', 1220, 13),
(1282, 'Control estado del chupon', NULL, '2018-07-31 19:12:05', 1220, 14),
(1283, 'Colocar chupon, verificar ajuste de tornillos', NULL, '2018-07-31 19:12:55', 1220, 15),
(1284, 'Controlar si lleva chapa rompe ola en block o carter', NULL, '2018-07-31 19:14:18', 1220, 16),
(1285, 'Colocar carter con junta y cemento', NULL, '2018-07-31 19:15:27', 1220, 17),
(1286, 'Controlar ajuste de tornillos de carter y tapon', NULL, '2018-07-31 19:16:43', 1220, 18),
(1287, 'Descripcion:', NULL, '2018-07-31 19:18:30', 1221, 1),
(1289, 'Descripcion 2:', NULL, '2018-07-31 19:19:01', 1221, 2),
(1290, 'Descripcion 3:', NULL, '2018-07-31 19:19:06', 1221, 3),
(1291, 'Caracteristicas:', NULL, '2018-07-31 19:22:29', 1222, 1),
(1292, '1. Lavado de caja de distribucion y elementos correspondientes.', NULL, '2018-07-31 19:23:16', 1223, 1),
(1293, 'Colocar caja de distribucion', NULL, '2018-07-31 19:24:11', 1223, 2),
(1294, 'Ajustar tornillos.', NULL, '2018-07-31 19:25:44', 1223, 3),
(1295, 'Lavado de arbol de levas.', NULL, '2018-07-31 19:28:29', 1223, 4),
(1296, 'Lavado de engranajes de distribucion', NULL, '2018-07-31 19:29:44', 1223, 5),
(1297, 'Armado de conjunto y puesta a punto', NULL, '2018-07-31 19:30:33', 1223, 6),
(1298, 'Verificar la puesta a punto final x 2', NULL, '2018-07-31 19:31:23', 1223, 7),
(1299, 'Colocar el motor, ajustar tornillos de bridas', NULL, '2018-07-31 19:32:34', 1223, 8),
(1300, 'Colocar reten en tapa de distribucion', NULL, '2018-07-31 19:33:36', 1223, 9),
(1301, 'Colocar tapa de distribucion y ajustar tornillos', NULL, '2018-07-31 19:34:31', 1223, 10),
(1302, '2. Colocar botadores.', NULL, '2018-07-31 19:36:05', 1223, 11),
(1303, 'Colocar juntas tapa de cilindros , verificar posicio?n y colocar marca de juntas', NULL, '2018-07-31 19:37:07', 1223, 12),
(1304, 'Armar tapa de cilindro', NULL, '2018-07-31 19:39:08', 1223, 13),
(1305, 'Colocar tapa, ajustar tornillos, reapretar,etc', NULL, '2018-07-31 19:40:29', 1223, 14),
(1306, 'Verifique operaciones anteriores', NULL, '2018-07-31 19:41:55', 1223, 15),
(1307, '3. Limpieza y prueba de estanqueidad de radiador de aceite, si se probo coloque si', NULL, '2018-07-31 19:42:51', 1223, 16),
(1308, 'Colocar radiador, ajustar tonillos.', NULL, '2018-07-31 19:43:52', 1223, 17),
(1309, '4. Limpieza de volante, verificar corona y superficie de trabajo', NULL, '2018-07-31 19:45:23', 1223, 18),
(1310, 'Colocar volante, ajustar tornillos', NULL, '2018-07-31 19:46:19', 1223, 19),
(1311, 'Colocar placa y disco de embrague', NULL, '2018-07-31 19:47:24', 1223, 20),
(1312, 'Controlar con una directa', NULL, '2018-07-31 19:48:35', 1223, 21),
(1313, 'Controlar cojinetes guia de directa', NULL, '2018-07-31 19:49:35', 1223, 22),
(1314, 'Ajustar tornillos de placa', NULL, '2018-07-31 19:50:35', 1223, 23),
(1315, '5. Colocar polea, ajustar trinquete.', NULL, '2018-07-31 19:51:22', 1223, 24),
(1316, 'Colocar cubre volante, ajustar tornillos', NULL, '2018-07-31 19:52:18', 1223, 25),
(1317, '6. Colocar compresor', NULL, '2018-07-31 19:53:35', 1223, 26),
(1318, 'Descripcion:', NULL, '2018-07-31 19:55:09', 1224, 1),
(1319, 'Descripcion 2:', NULL, '2018-07-31 19:55:12', 1224, 2),
(1320, 'Descripcion 3:', NULL, '2018-07-31 19:55:15', 1224, 3),
(1321, 'Caracteristica:', NULL, '2018-07-31 20:00:06', 1225, 1),
(1322, '1. Verificar limpieza de bomba inyectora', NULL, '2018-07-31 20:01:09', 1226, 1),
(1323, 'Verificar todos los elementos exteriores y sellos', NULL, '2018-07-31 20:01:15', 1226, 2),
(1324, 'Colocar bomba, ajustar tornillos.', NULL, '2018-07-31 20:01:20', 1226, 3),
(1325, 'Verificar punto final', NULL, '2018-07-31 20:01:26', 1226, 4),
(1326, 'Verificar juego de engranajes, conductor y conducido', NULL, '2018-07-31 20:01:32', 1226, 5),
(1327, 'Colocar caños de inyectores (verificar ajuste), caños de descarga', NULL, '2018-07-31 20:01:39', 1226, 6),
(1328, '2. Colocar multiple de escape.', NULL, '2018-07-31 20:01:44', 1226, 7),
(1329, 'Colocar multiple', NULL, '2018-07-31 20:01:51', 1226, 8),
(1330, 'Controlar estado de bomba de agua', NULL, '2018-07-31 20:01:57', 1226, 9),
(1331, 'Colocar bomba, ajustar tornillos.', NULL, '2018-07-31 20:02:03', 1226, 10),
(1332, 'Colocar polea y paleta de ventilador', NULL, '2018-07-31 20:02:08', 1226, 11),
(1333, 'Colocar alternador', NULL, '2018-07-31 20:02:13', 1226, 12),
(1334, 'Colocar motor de arranque', NULL, '2018-07-31 20:02:19', 1226, 3),
(1335, 'Colocar patas de motor', NULL, '2018-07-31 20:02:26', 1226, 4),
(1336, 'Verificacion de todas las operaciones anteriores', NULL, '2018-07-31 20:02:36', 1226, 5),
(1337, '3. Verificar corte de combustible de la bomba', NULL, '2018-07-31 20:02:42', 1226, 6),
(1338, 'Lavar soportes de filtros', NULL, '2018-07-31 20:03:11', 1226, 7),
(1339, 'Colocar soportes de filtros', NULL, '2018-07-31 20:03:15', 1226, 8),
(1340, 'Verificar valvulas de alivio de filtro de aceite', NULL, '2018-07-31 20:03:21', 1226, 9),
(1341, 'Colocar filtros en general.', NULL, '2018-07-31 20:03:27', 1226, 10),
(1342, '4. Colocar varillas levanta valvulas', NULL, '2018-07-31 20:03:34', 1226, 11),
(1343, 'Colocar balancines y eje de balancines', NULL, '2018-07-31 20:03:38', 1226, 12),
(1344, 'Regular luz de valvulas', NULL, '2018-07-31 20:03:43', 1226, 13),
(1345, 'Colocar tapa de valvulas', NULL, '2018-07-31 20:03:53', 1226, 14),
(1346, '5. Puesta a punto inyeccion o ignicion', NULL, '2018-07-31 20:04:03', 1226, 15),
(1347, 'Colocar aceite segun caracteristicas', NULL, '2018-07-31 20:04:10', 1226, 16),
(1348, 'Colocar medidas de aceite a la bomba', NULL, '2018-07-31 20:04:15', 1226, 17),
(1349, 'Verificacion de las operaciones anteriores', NULL, '2018-07-31 20:04:21', 1226, 18),
(1350, 'Emision a sala de banco de prueba', NULL, '2018-07-31 20:04:27', 1226, 19),
(1351, 'Verificar Asiento al inyector electronico', NULL, '2018-07-31 20:04:36', 1226, 20),
(1352, 'Colocar Inyector y apretar segun manual', NULL, '2018-07-31 20:04:41', 1226, 21),
(1353, 'Regular altura de Inyectores', NULL, '2018-07-31 20:04:46', 1226, 22),
(1354, 'Colocar Harnes de inyectores: corroborar que este bien', NULL, '2018-07-31 20:04:52', 1226, 23),
(1355, 'Se Pre lubrico', NULL, '2018-07-31 20:05:00', 1226, 24),
(1356, 'Se hizo prueba hidraulica de agua', NULL, '2018-07-31 20:05:07', 1226, 25),
(1357, 'Descripcion:', NULL, '2018-07-31 20:05:34', 1227, 1),
(1359, 'Descripcion 2:', NULL, '2018-07-31 20:05:50', 1227, 2),
(1360, 'Descripcion 3:', NULL, '2018-07-31 20:05:54', 1227, 3),
(1362, '', NULL, '2018-08-03 20:20:10', 1228, 1),
(1363, '1) Estado de casquillos y alojamientos de válvulas de admision y escape (Altura)    2) Control de estado de válvulas de admisión y escape                         3) Estado de precamaras (Alturas)', NULL, '2018-08-03 20:20:46', 1228, 2),
(2000, 'Documemntacion necesaria para el despacho:', NULL, '2018-08-07 14:44:39', 2000, 1),
(2002, 'a) Controle el motor o componente con la planilla de “Registro de recepcion de componente”', NULL, '2018-08-07 14:52:03', 2001, 2),
(2003, 'b) Si el legajo tiene anexado un Remito del cliente, entonces comparar con este:', NULL, '2018-08-07 14:55:31', 2001, 3),
(2004, 'c) Controle el motor con la planilla de “Registro de pedido de materiales interior y exterior”', NULL, '2018-08-07 14:56:28', 2001, 4),
(2005, 'd) Compare con las fotos', NULL, '2018-08-07 14:56:53', 2001, 5),
(2006, 'e) Consultar en almacen si ha quedado algun repuesto, insumo, componente, etc.', NULL, '2018-08-07 14:57:25', 2001, 6),
(2007, 'a) Controle visualmente si encuentra alguna anomalia, a saber:', NULL, '2018-08-07 14:58:49', 2002, 1),
(2008, 'Tomar Fotos:', NULL, '2018-08-07 15:01:36', 2003, 1),
(2009, 'Confeccionar remito de salida:', NULL, '2018-08-07 15:02:36', 2004, 1),
(2010, '', NULL, '2018-08-07 15:03:24', 2005, 1),
(2013, '1. Verificar y controlar limpieza total. Exterior e Interior. Libre de polvillo, aceites, manchas en general.', NULL, '2018-08-07 15:23:34', 2006, 1),
(2014, '2. Verificar superficie', NULL, '2018-08-07 15:24:14', 2006, 2),
(2016, '3. Verificar roscas', NULL, '2018-08-07 15:25:03', 2006, 3),
(2017, '4. Verificar tapones', NULL, '2018-08-07 15:32:21', 2006, 4),
(2018, '5. Verificar precamaras y asientos de inyector', NULL, '2018-08-07 15:35:13', 2006, 5),
(2019, '6. Controlar guias', NULL, '2018-08-07 15:36:04', 2006, 6),
(2020, '7. Controlar alineacion de valvula', NULL, '2018-08-07 15:36:50', 2006, 7),
(2021, '8. Medir presion de resortes', NULL, '2018-08-07 15:37:46', 2006, 8),
(2022, '9. Arandelas - Asientos Resortes', NULL, '2018-08-07 15:39:28', 2006, 9),
(2023, '10. Retenes', NULL, '2018-08-07 15:41:40', 2006, 10),
(2024, '11. Armar resortes', NULL, '2018-08-07 15:43:40', 2006, 11),
(2025, '12. Controlar si giran los platillos', NULL, '2018-08-07 15:45:55', 2006, 12),
(2026, '13. Platillos', NULL, '2018-08-07 15:46:49', 2006, 13),
(2027, '14. Seguros', NULL, '2018-08-07 15:47:52', 2006, 14),
(2028, '15. Regular valvulas', NULL, '2018-08-07 15:49:03', 2006, 15),
(2029, 'Realizar descarga de datos del ECM y/o chequeo de codigos de falla', NULL, '2018-08-07 16:26:52', 2007, 1),
(2030, 'Cargar codigos E-trim, solo para motores CAT', NULL, '2018-08-07 16:28:20', 2007, 2),
(2031, 'Disponer de los datos del motor (en caso de no tenerlos pedirlo a Coordinador y/o Jefe Tecnico) Estos datos son necesarios para banquear el motor.', NULL, '2018-08-07 16:29:31', 2007, 3),
(2032, 'Acoplar motor a banco (Conectar cardan y verificar el acoplamiento (buloneria, aprietes, estado de cardan, etc.), chequear juego axial y niveles del mismo)', NULL, '2018-08-07 16:31:30', 2007, 4),
(2033, 'Realizar y/o chequear conexiones de circuito de aceite', NULL, '2018-08-07 16:32:05', 2007, 5),
(2034, 'Chequear circuito de aceite externo (mangueras, caños, conexiones varias), inspeccionar que no tenga perdidas y/o tapones que puedan obstruir la lubricacion.', NULL, '2018-08-07 16:33:12', 2007, 6),
(2035, 'Rellenar aceite al motor y controlar nivel (dejar a medida)', NULL, '2018-08-07 16:34:23', 2007, 7),
(2036, 'Realizar y/o chequear conexiones de circuito de refrigeracion (bridas, can?os, uniones)', NULL, '2018-08-07 16:35:07', 2007, 8),
(2037, 'Armar intercooler', NULL, '2018-08-07 16:36:03', 2007, 9),
(2038, 'Rellenar y/o chequear niveles de refrigerante (dejar en rango adecuado)', NULL, '2018-08-07 18:28:20', 2007, 10),
(2039, 'Chequear presion de agua', NULL, '2018-08-07 18:31:31', 2007, 11),
(2040, 'Conectar sensor presion de combustible', NULL, '2018-08-07 18:34:32', 2007, 12),
(2041, 'Conectar sensor de temperatura de agua', NULL, '2018-08-07 18:38:12', 2007, 13),
(2042, 'Conectar sensor de temperatura de escape', NULL, '2018-08-07 19:11:19', 2007, 14),
(2043, 'Conectar sensor de temperatura de aceite', NULL, '2018-08-07 19:13:48', 2007, 15),
(2044, 'Conectar sensor de presion de aceite', NULL, '2018-08-07 19:15:29', 2007, 16),
(2045, 'Conectar sensor de presion de turbo', NULL, '2018-08-07 19:23:28', 2007, 17),
(2046, 'Controlar informacion del diagrama electrico', NULL, '2018-08-07 19:48:48', 2007, 5),
(2047, 'Realizar y Chequear Conexiones electricas (bateria, ECM, Intercomunicador, PC, etc.)', NULL, '2018-08-07 19:49:42', 2007, 6),
(2048, 'Verificar y chequear arnes de motor y sus conexiones', NULL, '2018-08-07 19:51:26', 2007, 7),
(2049, 'Realizar y/o chequear conexiones de circuito de combustible (caños, mangueras, porta filtros, filtros, etc.)', NULL, '2018-08-07 19:52:44', 2007, 8),
(2050, 'Chequear Nivel de combustible', NULL, '2018-08-07 19:55:15', 2007, 9),
(2051, 'Chequear presion de combustible', NULL, '2018-08-07 19:55:52', 2007, 10),
(2052, 'Chequear conexion y estado de carga de bateria', NULL, '2018-08-07 19:57:27', 2007, 11),
(2053, 'Chequear que el motor no tenga bloqueos mecanicos y/o hidraulicos', NULL, '2018-08-07 20:00:14', 2007, 12),
(2054, 'Despejar area en general (retirar herramienta, trapos, tachos, carros, etc.)', NULL, '2018-08-07 20:02:51', 2007, 13),
(2055, 'Chequear presencia de perdidas de fluido en Gral.', NULL, '2018-08-07 20:03:31', 2007, 14),
(2056, 'Controlar solenoide de inyectores (solo para linea CAT)', NULL, '2018-08-07 20:04:22', 2007, 15),
(2057, 'Verificar que no existan partes sueltas.', NULL, '2018-08-07 20:05:00', 2007, 16),
(2058, 'Conexiones o cambios extraordinarios (informar sobre cualquier conexion, by-pass, tapones, bloqueo de mangueras, cambio de piezas, etc.) que se realicen antes del arranque. En caso de existir observaciones informar a coordinador / Jefe tecnico antes del arranque. Se debera firmar su conformidad', NULL, '2018-08-07 20:13:04', 2008, 1),
(2060, 'Control de Fugas:', NULL, '2018-08-08 15:05:30', 2010, 1),
(2061, 'Control de Temperatura de admision:', NULL, '2018-08-08 15:06:53', 2010, 2),
(2062, 'Control de Temperatura de aceite:', NULL, '2018-08-08 15:07:48', 2010, 3),
(2063, 'Controlar Temperatura de escape:', NULL, '2018-08-08 15:13:21', 2010, 4),
(2064, 'Control de Presion de turbo:', NULL, '2018-08-08 15:14:50', 2010, 5),
(2065, 'Controlar Cardan de acoplamiento:', NULL, '2018-08-08 15:15:41', 2010, 6),
(2066, 'Control de Fugas:', NULL, '2018-08-08 15:24:16', 2011, 1),
(2067, 'Control de Temperatura de admision:', NULL, '2018-08-08 15:25:41', 2011, 2),
(2068, 'Control de Temperatura de aceite:', NULL, '2018-08-08 15:26:26', 2011, 3),
(2069, 'Control de Temperatura de escape:', NULL, '2018-08-08 15:27:59', 2011, 4),
(2070, 'Control de Presion de Turbo:', NULL, '2018-08-08 15:31:32', 2011, 5),
(2071, 'Control de Potencia:', NULL, '2018-08-08 15:32:17', 2011, 6),
(2072, 'Control de Torque:', NULL, '2018-08-08 15:33:38', 2011, 7),
(2073, 'Control de Fugas:', NULL, '2018-08-08 15:38:50', 2012, 1),
(2074, 'Control de Temperatura de admision:', NULL, '2018-08-08 15:42:26', 2012, 2),
(2075, 'Control de Temperatura de aceite:', NULL, '2018-08-08 15:45:29', 2012, 3),
(2076, 'Control de Temperatura de escape:', NULL, '2018-08-08 15:46:19', 2012, 4),
(2077, 'Controlar Presion de Turbo:', NULL, '2018-08-08 15:47:26', 2012, 5),
(2078, 'Control de Potencia:', NULL, '2018-08-08 15:49:00', 2012, 6),
(2079, 'Control de Torque:', NULL, '2018-08-08 15:49:43', 2012, 7),
(2082, 'Control de Fugas:', NULL, '2018-08-08 15:59:13', 2014, 1),
(2083, 'Control de Temperatura de admision:', NULL, '2018-08-08 16:05:38', 2014, 2),
(2084, 'Control de Temperatura de aceite:', NULL, '2018-08-08 16:06:19', 2014, 3),
(2085, 'Control de Temperatura de escape:', NULL, '2018-08-08 16:07:12', 2014, 4),
(2086, 'Control de Presion de Turbo:', NULL, '2018-08-08 16:08:01', 2014, 5),
(2087, 'Control de Potencia:', NULL, '2018-08-08 16:09:01', 2014, 6),
(2088, 'Control de Torque:', NULL, '2018-08-08 16:09:48', 2014, 7),
(2089, 'Control de Fugas:', NULL, '2018-08-08 16:15:25', 2015, 1),
(2090, 'Control de Temperatura de Admision:', NULL, '2018-08-08 16:18:01', 2015, 2),
(2091, 'Control de Temperatura de aceite:', NULL, '2018-08-08 16:21:52', 2015, 3),
(2092, 'Control de Temperatura de escape:', NULL, '2018-08-08 16:59:42', 2015, 4),
(2093, 'Control de Presion de turbo:', NULL, '2018-08-08 17:00:32', 2015, 5),
(2094, 'Control de Cardan de acoplamiento:', NULL, '2018-08-08 17:07:31', 2015, 6),
(2095, 'Regular Valvulas:', NULL, '2018-08-08 17:08:26', 2016, 1),
(2096, 'Re torqueo:', NULL, '2018-08-08 17:08:33', 2016, 2),
(2097, 'Prueba de inyectores:', NULL, '2018-08-08 17:08:39', 2016, 3),
(2098, 'Chequeo de fugas y niveles:', NULL, '2018-08-08 17:08:47', 2016, 4),
(2099, 'Control de Fugas:', NULL, '2018-08-08 17:41:55', 2017, 1),
(2100, 'Control de Temperatura de admision:', NULL, '2018-08-08 17:45:21', 2017, 2),
(2101, 'Control de Temperatura de aceite:', NULL, '2018-08-08 17:46:20', 2017, 3),
(2102, 'Control de Temperatura de escape:', NULL, '2018-08-08 17:48:01', 2017, 4),
(2103, 'Control de Presion de turbo:', NULL, '2018-08-08 17:59:51', 2017, 5),
(2104, 'Control de Cardan de acoplamiento:', NULL, '2018-08-08 18:01:03', 2017, 6),
(2105, 'Control de Fugas:', NULL, '2018-08-08 18:03:02', 2018, 1),
(2106, 'Control de Temperatura de admision:', NULL, '2018-08-08 18:19:18', 2018, 2),
(2107, 'Control de Temperatura de aceite:', NULL, '2018-08-08 18:20:04', 2018, 3),
(2108, 'Contorl de Temperatura de escape:', NULL, '2018-08-08 18:20:40', 2018, 4),
(2109, 'Control de Presion de turbo:', NULL, '2018-08-08 18:21:23', 2018, 5),
(2110, 'Control de Potencia:', NULL, '2018-08-08 18:23:20', 2018, 6),
(2111, 'Control de Torque:', NULL, '2018-08-08 18:24:40', 2018, 7),
(2112, 'Control de Fugas:', NULL, '2018-08-08 18:56:54', 2019, 1),
(2113, 'Control de Temperaturas de admision:', NULL, '2018-08-08 18:58:28', 2019, 2),
(2114, 'Control de Temperatura de aceite:', NULL, '2018-08-08 18:59:23', 2019, 3),
(2115, 'Control de Temperatura de escape:', NULL, '2018-08-08 19:00:56', 2019, 4),
(2116, 'Control de Presion de turbo:', NULL, '2018-08-08 19:04:52', 2019, 5),
(2117, 'Control de Potencia:', NULL, '2018-08-08 19:06:18', 2019, 6),
(2118, 'Control de Torque:', NULL, '2018-08-08 19:07:47', 2019, 7),
(2119, 'Control de Fugas:', NULL, '2018-08-08 19:20:20', 2020, 1),
(2120, 'Control de Temperatura de admision:', NULL, '2018-08-08 19:22:15', 2020, 2),
(2121, 'Control de Temperatura de aceite:', NULL, '2018-08-08 19:23:05', 2020, 3),
(2122, 'Control de Temperatura de escape:', NULL, '2018-08-08 19:23:42', 2020, 4),
(2124, 'Control de Presion de Turbo:', NULL, '2018-08-08 19:26:24', 2020, 5),
(2125, 'Control de Potencia:', NULL, '2018-08-08 19:27:08', 2020, 6),
(2126, 'Control de Torque:', NULL, '2018-08-08 19:28:33', 2020, 7),
(2127, 'Control de Fugas:', NULL, '2018-08-08 19:33:31', 2021, 1),
(2128, 'Control de Temperatura de admision:', NULL, '2018-08-08 19:36:38', 2021, 2),
(2129, 'Control de Temperatura de aceite:', NULL, '2018-08-08 19:38:13', 2021, 3),
(2131, 'Control de Temperatura de escape:', NULL, '2018-08-08 19:39:53', 2021, 4),
(2132, 'Control de Presion de turbo:', NULL, '2018-08-08 19:41:40', 2021, 5),
(2133, 'Control de Potencia:', NULL, '2018-08-08 19:43:20', 2021, 6),
(2134, 'Control de Torque:', NULL, '2018-08-08 19:44:59', 2021, 7),
(2135, 'Control de Fugas:', NULL, '2018-08-11 23:33:44', 2022, 1),
(2136, 'Control de Temperaturas de admision:', NULL, '2018-08-11 23:34:06', 2022, 2),
(2137, 'Control de Temperatura de Aceite:', NULL, '2018-08-11 23:34:33', 2022, 3),
(2138, 'Control de Temperatura de escape:', NULL, '2018-08-11 23:34:46', 2022, 4),
(2139, 'Control de Presion de Turbo:', NULL, '2018-08-11 23:35:00', 2022, 5),
(2140, 'Control de Potencia:', NULL, '2018-08-11 23:37:12', 2022, 6),
(2141, 'Control de Torque:', NULL, '2018-08-11 23:37:20', 2022, 7),
(2143, 'Datos:', NULL, '2018-08-13 03:00:47', 2023, 1),
(2144, 'Control de Fugas:', NULL, '2018-08-13 03:08:59', 2025, 1),
(2145, 'Control de Temperatura de admision:', NULL, '2018-08-13 03:09:14', 2025, 2),
(2146, 'Control de Temperatura de aceite:', NULL, '2018-08-13 03:09:30', 2025, 3),
(2147, 'Control de Temperatura de escape:', NULL, '2018-08-13 03:09:42', 2025, 4),
(2148, 'Control de Presion de turbo:', NULL, '2018-08-13 03:09:53', 2025, 5),
(2149, 'Control de Potencia:', NULL, '2018-08-13 03:10:02', 2025, 6),
(2150, 'Control de Torque:', NULL, '2018-08-13 03:10:09', 2025, 7),
(2151, 'Control de Fugas:', NULL, '2018-08-13 03:17:43', 2026, 1),
(2152, 'Control de Temperatura de admision:', NULL, '2018-08-13 03:18:04', 2026, 2),
(2153, 'Control de Temperatura de aceite:', NULL, '2018-08-13 03:18:16', 2026, 3),
(2154, 'Control de Temperatura de escape:', NULL, '2018-08-13 03:18:32', 2026, 4),
(2155, 'Control de Presion de turbo:', NULL, '2018-08-13 03:18:43', 2026, 5),
(2156, 'Control de Cardan de acoplamiento:', NULL, '2018-08-13 03:18:57', 2026, 6),
(2157, 'Desconectar motor mecanica y electronicamente:', NULL, '2018-08-13 03:24:31', 2027, 1),
(2158, 'Desconectar cardan:', NULL, '2018-08-13 03:24:40', 2027, 2);
INSERT INTO `frm_grupos` (`GRUP_ID`, `NOMBRE`, `PISTA`, `FEC_CREACION`, `CATE_ID`, `ORDEN`) VALUES
(2159, 'Drenar aceite; solo si corresponde:', NULL, '2018-08-13 03:24:50', 2027, 3),
(2160, 'Drenar agua:', NULL, '2018-08-13 03:24:59', 2027, 4),
(2161, 'Dializar con refrigerante:', NULL, '2018-08-13 03:25:07', 2027, 5),
(2162, 'Desmontar motor de banco:', NULL, '2018-08-13 03:25:18', 2027, 6),
(2163, 'Compilar y realizar infrome de banqueo:', NULL, '2018-08-13 03:25:51', 2028, 1),
(2164, 'Grabar CD:', NULL, '2018-08-13 03:25:58', 2028, 2),
(2165, 'Imprimir Informe:', NULL, '2018-08-13 03:26:06', 2028, 3),
(2166, 'Datos:', NULL, '2018-08-13 03:33:43', 2009, 2),
(2167, 'Datos:', NULL, '2018-08-13 03:34:24', 2024, 1),
(2500, 'LAVADO', NULL, '2018-08-23 14:41:53', 2500, 1),
(2501, 'CILINDRO', NULL, '2018-08-23 14:45:44', 2500, 2),
(2502, 'COMPRESOR', NULL, '2018-08-23 15:04:43', 2500, 3),
(2503, 'BOMBA ACEITE BOTAD. Y BALANCINES', NULL, '2018-08-23 15:10:26', 2500, 4),
(2504, 'SOLDADURAS', NULL, '2018-08-23 15:26:17', 2500, 5),
(2505, 'TAPA DE CILINDRO', NULL, '2018-08-23 15:33:20', 2500, 6),
(2506, 'BANCADA', NULL, '2018-08-23 16:06:32', 2500, 7),
(2507, 'BIELAS', NULL, '2018-08-26 23:11:32', 2500, 8),
(2508, 'PRUEBAS HIDRAULICAS', NULL, '2018-08-26 23:19:22', 2500, 9),
(2509, 'CIGUEÑAL', NULL, '2018-08-27 00:59:09', 2500, 10),
(2510, 'SUPERFICIES', NULL, '2018-08-27 01:03:44', 2500, 11),
(2511, 'CIGUEÑAL', NULL, '2018-08-27 04:15:40', 2500, 12),
(2512, 'TORNERIA', NULL, '2018-08-27 04:23:11', 2500, 13),
(2513, 'BALANCEO', NULL, '2018-08-27 04:30:58', 2500, 14),
(2514, 'ARBOL DE LEVAS', NULL, '2018-08-27 04:39:18', 2500, 15),
(2516, 'SEMI-ARMADO DE MOTOR', NULL, '2018-08-27 04:42:41', 2500, 16),
(2517, 'ARMADO PUESTA EN MARCHA', NULL, '2018-08-27 04:47:08', 2500, 17),
(2518, 'ARMADO DE MOTOR', NULL, '2018-08-27 04:53:08', 2500, 18),
(2519, 'BOMBA INYEC. E INYECTORES', NULL, '2018-08-27 05:02:08', 2500, 19),
(2520, 'DIFERENCIAL', NULL, '2018-08-27 05:03:40', 2500, 20),
(2521, 'SERVICIOS EN CAMPO', NULL, '2018-08-27 05:04:30', 2500, 21),
(2522, 'TURBOS', NULL, '2018-08-27 05:06:52', 2500, 22),
(2523, 'CARDAN', NULL, '2018-08-27 05:08:12', 2500, 23),
(2524, 'VARIOS', NULL, '2018-08-27 05:09:17', 2500, 24),
(5000, '', NULL, '2018-08-27 15:53:35', 5000, 1),
(6000, '', NULL, '2018-08-30 13:49:54', 6000, 1),
(7000, '', NULL, '2018-09-12 23:24:56', 7000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frm_instancias_formulario`
--

CREATE TABLE `frm_instancias_formulario` (
  `info_id` int(11) NOT NULL,
  `ortra_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `frm_instancias_formulario`
--

INSERT INTO `frm_instancias_formulario` (`info_id`, `ortra_id`) VALUES
(1, 22),
(2, 22),
(3, 22),
(4, 22),
(5, 22),
(6, 22),
(7, 22),
(8, 22),
(9, 22),
(10, 22),
(11, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frm_tipos_dato`
--

CREATE TABLE `frm_tipos_dato` (
  `TIDA_ID` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `FEC_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `frm_tipos_dato`
--

INSERT INTO `frm_tipos_dato` (`TIDA_ID`, `NOMBRE`, `FEC_CREACION`) VALUES
(1, 'input', '2018-07-05 14:41:04'),
(2, 'select', '2018-07-05 15:06:02'),
(3, 'checkbox', '2018-07-08 22:45:17'),
(4, 'textarea', '2018-07-13 13:16:26'),
(5, 'input_numerico', '2018-08-28 02:40:51'),
(6, 'input_fecha', '2018-08-28 02:40:51'),
(7, 'input_archivo', '2018-08-28 02:41:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frm_valores`
--

CREATE TABLE `frm_valores` (
  `VALO_ID` int(11) NOT NULL,
  `NOMBRE` varchar(2000) CHARACTER SET latin1 NOT NULL,
  `PISTA` varchar(2000) CHARACTER SET latin1 DEFAULT NULL,
  `LONGITUD` int(11) DEFAULT NULL,
  `VALOR_DEFECTO` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `OBLIGATORIO` tinyint(1) NOT NULL DEFAULT '0',
  `FEC_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TIDA_ID` int(11) NOT NULL,
  `GRUP_ID` int(11) NOT NULL,
  `ORDEN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `frm_valores`
--

INSERT INTO `frm_valores` (`VALO_ID`, `NOMBRE`, `PISTA`, `LONGITUD`, `VALOR_DEFECTO`, `OBLIGATORIO`, `FEC_CREACION`, `TIDA_ID`, `GRUP_ID`, `ORDEN`) VALUES
(1, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 15:53:54', 2, 1, 1),
(2, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 16:02:21', 2, 2, 1),
(3, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 16:03:23', 2, 3, 1),
(4, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 16:04:23', 2, 4, 1),
(5, 'Estado', NULL, NULL, NULL, 0, '2018-07-28 16:05:27', 2, 5, 1),
(6, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 16:06:14', 2, 6, 1),
(7, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 16:08:00', 2, 7, 1),
(8, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 16:08:49', 2, 8, 1),
(9, 'Pieza:', NULL, NULL, NULL, 0, '2018-07-28 16:18:21', 2, 9, 1),
(10, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 16:18:29', 2, 9, 2),
(11, 'Comentario:', NULL, NULL, NULL, 0, '2018-07-28 16:18:39', 4, 9, 3),
(12, 'Pieza:', NULL, NULL, NULL, 0, '2018-07-28 16:20:10', 2, 10, 1),
(13, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 16:20:19', 2, 10, 2),
(14, 'Comentario:', NULL, NULL, NULL, 0, '2018-07-28 16:20:32', 4, 10, 3),
(15, 'Pieza', NULL, NULL, NULL, 0, '2018-07-28 16:22:06', 2, 11, 1),
(16, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 16:22:14', 2, 11, 2),
(17, 'Comentario:', NULL, NULL, NULL, 0, '2018-07-28 16:22:22', 4, 11, 3),
(18, 'Pieza:', NULL, NULL, NULL, 0, '2018-07-28 16:23:27', 2, 12, 1),
(19, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 16:23:35', 2, 12, 2),
(20, 'Comentario:', NULL, NULL, NULL, 0, '2018-07-28 16:23:46', 4, 12, 3),
(21, 'Pieza:', NULL, NULL, NULL, 0, '2018-07-28 16:24:37', 2, 13, 1),
(22, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 16:24:47', 2, 13, 2),
(23, 'Comentario:', NULL, NULL, NULL, 0, '2018-07-28 16:24:56', 4, 13, 3),
(24, 'Pieza:', NULL, NULL, NULL, 0, '2018-07-28 16:25:04', 2, 14, 1),
(25, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 16:25:10', 2, 14, 2),
(26, 'Comentario:', NULL, NULL, NULL, 0, '2018-07-28 16:25:17', 4, 14, 3),
(27, 'Cod:2065 Desarmar y Armar', NULL, NULL, NULL, 0, '2018-07-28 17:05:59', 3, 15, 1),
(28, 'Cod:3066 Controlar y Calibrar', NULL, NULL, NULL, 0, '2018-07-28 17:06:34', 3, 15, 2),
(29, 'Cod:2068 Desarmar y Armar', NULL, NULL, NULL, 0, '2018-07-28 17:07:33', 3, 16, 1),
(30, 'Cod:2069 Controlar y Calibrar', NULL, NULL, NULL, 0, '2018-07-28 17:08:07', 3, 16, 2),
(31, 'Cod.2070 Asentar Toberas', NULL, NULL, NULL, 0, '2018-07-28 17:08:27', 3, 16, 3),
(32, 'Motor:', NULL, NULL, NULL, 0, '2018-07-28 17:15:28', 4, 17, 1),
(33, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 17:18:38', 2, 18, 1),
(34, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 17:18:45', 2, 18, 2),
(35, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 17:20:38', 4, 18, 3),
(36, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 17:21:47', 2, 19, 1),
(37, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 17:21:54', 2, 19, 2),
(38, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 17:21:59', 4, 19, 3),
(39, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 17:23:29', 2, 20, 1),
(40, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 17:23:37', 2, 20, 2),
(41, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 17:23:46', 4, 20, 3),
(42, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 17:24:58', 2, 21, 1),
(43, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 17:25:06', 2, 21, 2),
(44, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 17:25:15', 4, 21, 3),
(45, 'Caracteristicas:', NULL, NULL, NULL, 0, '2018-07-28 17:26:51', 2, 22, 1),
(46, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 17:26:57', 2, 22, 2),
(47, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 17:27:01', 4, 22, 3),
(48, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 17:35:55', 2, 23, 1),
(49, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 17:36:23', 2, 23, 2),
(50, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 17:37:28', 4, 23, 3),
(51, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 17:37:44', 2, 24, 1),
(52, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 17:37:56', 2, 24, 2),
(53, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 17:38:00', 4, 24, 3),
(54, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 17:38:52', 2, 25, 1),
(55, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 17:39:01', 2, 25, 2),
(56, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 17:39:05', 4, 25, 3),
(57, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 17:39:54', 2, 26, 1),
(58, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 17:39:59', 2, 26, 2),
(59, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 17:40:05', 4, 26, 3),
(60, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 17:41:28', 2, 27, 1),
(61, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 17:41:41', 2, 27, 2),
(62, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 17:41:45', 4, 27, 3),
(63, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 17:43:02', 2, 28, 1),
(64, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 17:43:17', 4, 28, 2),
(65, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 17:44:07', 2, 29, 1),
(66, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 17:44:11', 4, 29, 2),
(67, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 17:46:27', 2, 30, 1),
(68, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 17:46:37', 2, 30, 2),
(69, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 17:46:40', 4, 30, 3),
(70, 'Caracteristicas:', NULL, NULL, NULL, 0, '2018-07-28 17:52:08', 2, 31, 1),
(71, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 17:52:15', 2, 31, 2),
(72, '(*) Indique en Orden de Reparacion Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 17:54:19', 4, 31, 3),
(73, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 17:57:29', 2, 32, 1),
(74, '(*) Indique en Orden de Reparacion Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 17:57:33', 4, 32, 2),
(75, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 17:57:40', 2, 33, 1),
(76, '(*) Indique en Orden de Reparacion Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 17:57:44', 4, 33, 2),
(77, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:02:44', 2, 34, 1),
(78, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:02:51', 2, 34, 2),
(79, '(*) Indique en Orden de Reparacion Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:03:03', 4, 34, 3),
(80, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:03:42', 2, 35, 1),
(81, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:03:49', 2, 35, 2),
(82, '(*) Indique en Orden de Reparacion Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:03:53', 4, 35, 3),
(83, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:04:18', 2, 36, 1),
(84, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:04:34', 2, 36, 2),
(85, '(*) Indique en Orden de Reparacion Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:04:38', 4, 36, 3),
(86, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:05:27', 2, 37, 1),
(87, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:05:34', 2, 37, 2),
(88, '(*) Indique en Orden de Reparacion Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:05:38', 4, 37, 3),
(89, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:05:49', 2, 38, 1),
(90, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:05:56', 2, 38, 2),
(91, '(*) Indique en Orden de Reparacion Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:05:59', 4, 38, 3),
(92, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:06:12', 2, 39, 1),
(93, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:06:20', 2, 39, 2),
(94, '(*) Indique en Orden de Reparacion Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:06:24', 4, 39, 3),
(95, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:06:36', 2, 40, 1),
(96, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:06:44', 2, 40, 2),
(97, '(*) Indique en Orden de Reparacion Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:06:47', 4, 40, 3),
(98, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:08:36', 2, 41, 1),
(99, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:08:44', 2, 41, 2),
(100, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:08:47', 4, 41, 3),
(101, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:08:59', 2, 42, 1),
(102, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:09:08', 2, 42, 2),
(103, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:09:13', 4, 42, 3),
(104, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:09:38', 2, 43, 1),
(105, 'Estados', NULL, NULL, NULL, 0, '2018-07-28 18:09:44', 2, 43, 2),
(106, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:09:49', 4, 43, 3),
(107, 'Caracteristicas:', NULL, NULL, NULL, 0, '2018-07-28 18:10:01', 2, 44, 1),
(108, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:10:09', 2, 44, 2),
(109, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:10:13', 4, 44, 3),
(110, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:10:26', 2, 45, 1),
(111, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:10:36', 2, 45, 2),
(112, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:10:40', 4, 45, 3),
(113, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:10:51', 2, 46, 1),
(114, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:10:56', 2, 46, 2),
(115, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:10:59', 4, 46, 3),
(116, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:24:33', 2, 47, 1),
(117, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:24:42', 2, 47, 2),
(118, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:24:58', 4, 47, 3),
(119, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:25:06', 2, 48, 1),
(120, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:25:14', 2, 48, 2),
(121, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:25:18', 4, 48, 3),
(122, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:25:26', 2, 49, 1),
(123, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:25:33', 2, 49, 2),
(124, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:25:37', 2, 49, 3),
(125, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:25:47', 2, 50, 1),
(126, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:25:54', 2, 50, 2),
(127, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:25:58', 4, 50, 3),
(128, 'Caractreristica:', NULL, NULL, NULL, 0, '2018-07-28 18:26:07', 2, 51, 1),
(129, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:26:16', 2, 51, 2),
(130, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:26:20', 4, 51, 3),
(131, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:26:30', 2, 52, 1),
(132, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:26:36', 2, 52, 2),
(133, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:26:39', 4, 52, 3),
(134, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:26:48', 2, 53, 1),
(135, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:26:54', 2, 53, 2),
(136, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:26:59', 4, 53, 3),
(137, 'Caracterisitica:', NULL, NULL, NULL, 0, '2018-07-28 18:27:40', 2, 54, 1),
(138, 'Estados:', NULL, NULL, NULL, 0, '2018-07-28 18:27:51', 2, 54, 2),
(139, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:27:55', 4, 54, 3),
(141, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:28:24', 2, 55, 2),
(142, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:28:28', 4, 55, 3),
(144, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:28:43', 2, 56, 2),
(145, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:28:46', 4, 56, 3),
(146, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:40:07', 2, 57, 1),
(147, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:40:16', 2, 57, 2),
(148, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:40:31', 4, 57, 3),
(149, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:42:00', 2, 58, 1),
(150, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:43:05', 2, 58, 2),
(151, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:43:09', 4, 58, 3),
(152, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:44:06', 2, 59, 1),
(153, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:44:12', 2, 59, 2),
(154, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:44:15', 4, 59, 3),
(155, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:45:28', 2, 60, 1),
(156, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:45:35', 2, 60, 2),
(157, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:45:54', 4, 60, 3),
(158, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:47:03', 2, 61, 1),
(159, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:47:16', 4, 61, 2),
(160, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:48:28', 2, 62, 1),
(161, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:48:36', 4, 62, 2),
(163, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:52:20', 2, 63, 2),
(164, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:52:25', 4, 63, 3),
(165, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:53:57', 2, 64, 1),
(166, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:54:02', 4, 64, 2),
(167, 'Caracterisitica:', NULL, NULL, NULL, 0, '2018-07-28 18:54:55', 2, 65, 1),
(168, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:55:01', 2, 65, 2),
(169, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:55:04', 4, 65, 3),
(170, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:56:14', 2, 66, 1),
(171, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:56:19', 2, 66, 2),
(172, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:56:23', 4, 66, 3),
(173, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 18:58:06', 2, 67, 1),
(174, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 18:58:14', 2, 67, 2),
(175, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 18:58:18', 4, 67, 3),
(176, 'Caracterisitica:', NULL, NULL, NULL, 0, '2018-07-28 19:00:00', 2, 68, 1),
(177, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 19:00:07', 2, 68, 2),
(178, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 19:00:16', 4, 68, 3),
(179, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 19:01:48', 2, 69, 1),
(180, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 19:01:55', 2, 69, 2),
(181, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 19:01:58', 4, 69, 3),
(182, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 22:23:48', 5, 70, 1),
(183, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 22:24:44', 2, 70, 2),
(184, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 22:26:19', 5, 71, 1),
(185, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 22:26:32', 2, 71, 2),
(186, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 22:27:44', 5, 72, 1),
(187, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 22:27:52', 2, 72, 2),
(188, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 22:29:23', 5, 73, 1),
(189, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 22:29:29', 2, 73, 2),
(190, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 22:30:31', 5, 74, 1),
(191, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 22:30:38', 2, 74, 2),
(192, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 22:33:02', 5, 75, 1),
(193, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 22:37:51', 2, 75, 2),
(194, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 22:43:44', 5, 77, 1),
(195, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 22:43:52', 2, 77, 2),
(196, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 22:44:10', 5, 78, 1),
(197, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 22:44:26', 4, 70, 3),
(198, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 22:44:32', 4, 71, 3),
(199, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 22:44:37', 4, 72, 3),
(200, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 22:44:42', 4, 73, 3),
(201, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 22:44:47', 4, 74, 3),
(202, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 22:44:52', 4, 75, 3),
(203, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 22:44:57', 4, 77, 3),
(205, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 22:45:35', 2, 78, 2),
(206, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 22:45:38', 4, 78, 3),
(207, 'Caracteristica:', NULL, NULL, NULL, 0, '2018-07-28 22:46:01', 5, 79, 1),
(208, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 22:46:07', 2, 79, 2),
(209, '(*) Indicar en Orden de Reparacion, Trabajos a Realizar:', NULL, NULL, NULL, 0, '2018-07-28 22:46:11', 4, 79, 3),
(210, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:04:16', 2, 80, 1),
(211, 'Indique Motivo de Rechazo:', NULL, NULL, NULL, 0, '2018-07-28 23:04:31', 4, 80, 2),
(214, 'Medida Requerida:', NULL, NULL, NULL, 0, '2018-07-28 23:10:03', 5, 81, 1),
(215, 'Medida Obtenida:', NULL, NULL, NULL, 0, '2018-07-28 23:10:15', 5, 81, 2),
(216, 'Medida Requerida:', NULL, NULL, NULL, 0, '2018-07-28 23:10:24', 5, 82, 1),
(217, 'Medida Obtenida:', NULL, NULL, NULL, 0, '2018-07-28 23:10:34', 5, 82, 2),
(218, 'Medida Requerida:', NULL, NULL, NULL, 0, '2018-07-28 23:10:48', 5, 83, 1),
(219, 'Medida Obtenida:', NULL, NULL, NULL, 0, '2018-07-28 23:11:00', 5, 83, 2),
(221, '', NULL, NULL, NULL, 0, '2018-07-28 23:12:23', 4, 85, 1),
(222, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:13:50', 2, 86, 1),
(223, 'Indique Motivo del Rechazo', NULL, NULL, NULL, 0, '2018-07-28 23:14:08', 4, 86, 2),
(224, 'Dureza Requerida:', NULL, NULL, NULL, 0, '2018-07-28 23:17:28', 5, 87, 1),
(225, 'Dureza Obtenida:', NULL, NULL, NULL, 0, '2018-07-28 23:17:37', 5, 87, 2),
(226, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:17:41', 2, 87, 3),
(227, 'Dureza Obtenida:', NULL, NULL, NULL, 0, '2018-07-28 23:18:09', 5, 88, 1),
(228, 'Duraza Requerida:', NULL, NULL, NULL, 0, '2018-07-28 23:18:27', 5, 88, 2),
(229, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:18:28', 2, 88, 3),
(230, 'Dureza Reuqerida:', NULL, NULL, NULL, 0, '2018-07-28 23:19:01', 5, 89, 1),
(231, 'Dureza Obtenida:', NULL, NULL, NULL, 0, '2018-07-28 23:19:10', 5, 89, 2),
(232, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:19:14', 2, 89, 3),
(233, 'Metodo:', NULL, NULL, NULL, 0, '2018-07-28 23:19:45', 2, 87, 4),
(234, 'Metodo:', NULL, NULL, NULL, 0, '2018-07-28 23:20:38', 2, 88, 4),
(235, 'Metodo:', NULL, NULL, NULL, 0, '2018-07-28 23:21:00', 2, 89, 4),
(236, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:22:21', 2, 90, 1),
(237, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:22:23', 2, 91, 1),
(238, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:22:25', 2, 92, 1),
(239, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:22:27', 2, 93, 1),
(240, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:23:07', 2, 94, 1),
(241, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:23:12', 2, 95, 1),
(242, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:29:54', 2, 96, 1),
(243, 'Indique Motivo de Rechazo:', NULL, NULL, NULL, 0, '2018-07-28 23:30:08', 4, 96, 2),
(244, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:31:28', 2, 97, 1),
(245, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:32:09', 2, 98, 1),
(246, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:32:43', 2, 99, 1),
(247, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:34:24', 2, 101, 1),
(248, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:34:31', 2, 102, 1),
(249, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:34:38', 2, 103, 1),
(250, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:36:38', 2, 104, 1),
(251, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:37:01', 2, 105, 1),
(252, 'Estado', NULL, NULL, NULL, 0, '2018-07-28 23:37:24', 2, 106, 1),
(253, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:37:50', 2, 107, 1),
(254, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:38:24', 2, 108, 1),
(255, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:38:47', 2, 109, 1),
(256, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:39:14', 2, 110, 1),
(257, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:39:39', 2, 111, 1),
(258, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:40:06', 2, 112, 1),
(259, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:40:35', 2, 113, 1),
(260, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:40:57', 2, 114, 1),
(261, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:46:15', 2, 122, 1),
(262, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:46:17', 2, 123, 1),
(263, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:46:19', 2, 124, 1),
(264, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:46:21', 2, 125, 1),
(265, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:46:23', 2, 126, 1),
(266, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:46:25', 2, 127, 1),
(267, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:46:27', 2, 128, 1),
(268, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:46:30', 2, 129, 1),
(269, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:46:33', 2, 130, 1),
(270, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:46:39', 2, 131, 1),
(271, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:46:41', 2, 132, 1),
(272, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:46:50', 2, 133, 1),
(273, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:46:53', 2, 134, 1),
(274, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:46:54', 2, 135, 1),
(275, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:46:57', 2, 136, 1),
(276, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:46:59', 2, 137, 1),
(277, 'Estado:', NULL, NULL, NULL, 0, '2018-07-28 23:47:02', 2, 138, 1),
(279, 'Referencia STD Muñon:', NULL, NULL, NULL, 0, '2018-07-28 23:50:45', 5, 140, 1),
(280, 'Referencia de Ojo:', NULL, NULL, NULL, 0, '2018-07-28 23:51:09', 5, 140, 2),
(281, 'Medida Muñon:', NULL, NULL, NULL, 0, '2018-07-29 00:03:58', 5, 141, 1),
(282, 'Medida Ojo:', NULL, NULL, NULL, 0, '2018-07-29 00:04:10', 5, 141, 2),
(283, 'Medida Muñon:', NULL, NULL, NULL, 0, '2018-07-29 00:05:04', 5, 142, 1),
(284, 'Medida Ojo:', NULL, NULL, NULL, 0, '2018-07-29 00:05:16', 5, 142, 2),
(285, 'Medida Muñon:', NULL, NULL, NULL, 0, '2018-07-29 00:06:37', 5, 143, 1),
(286, 'Medida Ojo:', NULL, NULL, NULL, 0, '2018-07-29 00:06:47', 5, 143, 2),
(287, 'Medida Muñon:', NULL, NULL, NULL, 0, '2018-07-29 00:06:52', 5, 144, 1),
(288, 'Medida Ojo:', NULL, NULL, NULL, 0, '2018-07-29 00:06:59', 5, 144, 2),
(289, 'Medida Muñon:', NULL, NULL, NULL, 0, '2018-07-29 00:07:03', 5, 145, 1),
(290, 'Medida Ojo:', NULL, NULL, NULL, 0, '2018-07-29 00:07:10', 5, 145, 2),
(291, 'Medida Muñon:', NULL, NULL, NULL, 0, '2018-07-29 00:07:15', 5, 146, 1),
(292, 'Medida Ojo:', NULL, NULL, NULL, 0, '2018-07-29 00:07:21', 5, 146, 2),
(293, 'Medida Muñon:', NULL, NULL, NULL, 0, '2018-07-29 00:07:33', 5, 147, 1),
(294, 'Medida Ojo:', NULL, NULL, NULL, 0, '2018-07-29 00:07:41', 5, 147, 2),
(295, 'Medida Muñon:', NULL, NULL, NULL, 0, '2018-07-29 00:07:46', 5, 148, 1),
(296, 'Medida Ojo:', NULL, NULL, NULL, 0, '2018-07-29 00:07:53', 5, 148, 2),
(297, 'Medida Muñon:', NULL, NULL, NULL, 0, '2018-07-29 00:07:59', 5, 149, 1),
(298, 'Medida Ojo:', NULL, NULL, NULL, 0, '2018-07-29 00:08:05', 5, 149, 2),
(299, 'Medida Muñon:', NULL, NULL, NULL, 0, '2018-07-29 00:08:10', 5, 150, 1),
(300, 'Medida Ojo:', NULL, NULL, NULL, 0, '2018-07-29 00:08:16', 5, 150, 2),
(301, 'Medida Muñon:', NULL, NULL, NULL, 0, '2018-07-29 00:08:22', 5, 151, 1),
(302, 'Medida Ojo:', NULL, NULL, NULL, 0, '2018-07-29 00:08:28', 5, 151, 2),
(303, 'Medida Muñon:', NULL, NULL, NULL, 0, '2018-07-29 00:08:32', 5, 152, 1),
(304, 'Medida Ojo:', NULL, NULL, NULL, 0, '2018-07-29 00:08:39', 5, 152, 2),
(305, 'Medida Muñon:', NULL, NULL, NULL, 0, '2018-07-29 00:08:44', 5, 153, 1),
(306, 'Medida Ojo:', NULL, NULL, NULL, 0, '2018-07-29 00:08:51', 5, 153, 2),
(307, 'Medida Muñon:', NULL, NULL, NULL, 0, '2018-07-29 00:09:20', 5, 154, 1),
(308, 'Medida Ojo:', NULL, NULL, NULL, 0, '2018-07-29 00:09:28', 5, 154, 2),
(309, 'Medida Muñon:', NULL, NULL, NULL, 0, '2018-07-29 00:11:09', 5, 155, 1),
(310, 'Medida Ojo:', NULL, NULL, NULL, 0, '2018-07-29 00:11:16', 5, 155, 2),
(311, 'Medida Muñon:', NULL, NULL, NULL, 0, '2018-07-29 00:11:22', 5, 156, 1),
(312, 'Medida Ojo:', NULL, NULL, NULL, 0, '2018-07-29 00:11:33', 5, 156, 2),
(313, 'Medida Muñon:', NULL, NULL, NULL, 0, '2018-07-29 00:11:37', 5, 157, 1),
(314, 'Medida Ojo:', NULL, NULL, NULL, 0, '2018-07-29 00:11:44', 5, 157, 2),
(315, 'Medida de Referencia STD:', NULL, NULL, NULL, 0, '2018-07-29 00:15:33', 5, 158, 1),
(316, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 00:26:20', 5, 159, 1),
(317, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 00:26:25', 5, 160, 1),
(318, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 00:26:30', 5, 161, 1),
(319, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 00:26:36', 5, 162, 1),
(320, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 00:26:59', 5, 163, 1),
(321, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 00:27:12', 5, 164, 1),
(322, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 00:27:19', 5, 165, 1),
(323, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 00:27:24', 5, 166, 1),
(324, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 00:27:35', 5, 167, 1),
(325, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 00:27:40', 5, 168, 1),
(326, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 00:27:46', 5, 169, 1),
(327, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 00:27:57', 5, 170, 1),
(328, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 00:28:02', 5, 171, 1),
(329, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 00:28:07', 5, 172, 1),
(330, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 00:28:12', 5, 173, 1),
(331, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 00:28:18', 5, 174, 1),
(332, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 00:28:23', 5, 175, 1),
(333, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:22:41', 2, 176, 1),
(334, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:22:49', 2, 177, 1),
(335, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:22:58', 2, 178, 1),
(336, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:23:08', 2, 179, 1),
(337, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:23:16', 2, 180, 1),
(338, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:25:25', 2, 181, 1),
(339, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:25:33', 2, 182, 1),
(340, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:25:40', 2, 183, 1),
(341, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:25:54', 2, 184, 1),
(342, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:26:02', 2, 185, 1),
(343, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:26:08', 2, 186, 1),
(344, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:26:15', 2, 187, 1),
(345, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:26:25', 2, 188, 1),
(346, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:26:33', 2, 189, 1),
(347, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:26:43', 2, 190, 1),
(348, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:26:52', 2, 191, 1),
(349, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:27:00', 2, 192, 1),
(350, 'Referencia Rotativo:', NULL, NULL, NULL, 0, '2018-07-29 04:28:46', 5, 193, 1),
(351, 'Referencia Alternativo:', NULL, NULL, NULL, 0, '2018-07-29 04:29:12', 5, 193, 2),
(352, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:29:30', 2, 194, 1),
(353, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:29:36', 2, 195, 1),
(354, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:30:08', 2, 196, 1),
(355, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:30:16', 2, 197, 1),
(356, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:30:27', 2, 198, 1),
(357, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:31:17', 2, 199, 1),
(358, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:31:20', 2, 200, 1),
(359, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:31:23', 2, 201, 1),
(360, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:31:26', 2, 202, 1),
(361, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:31:28', 2, 203, 1),
(362, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:31:31', 2, 204, 1),
(363, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:31:34', 2, 205, 1),
(364, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:31:37', 2, 206, 1),
(365, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:31:39', 2, 207, 1),
(366, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:31:42', 2, 208, 1),
(367, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:31:45', 2, 209, 1),
(368, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:31:47', 2, 210, 1),
(369, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:34:25', 2, 211, 1),
(370, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:34:27', 2, 212, 1),
(371, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:34:29', 2, 213, 1),
(372, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:34:32', 2, 214, 1),
(373, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:34:34', 2, 215, 1),
(374, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:34:36', 2, 216, 1),
(375, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:34:39', 2, 217, 1),
(376, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:34:41', 2, 218, 1),
(377, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:34:44', 2, 219, 1),
(378, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:34:47', 2, 220, 1),
(379, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:34:50', 2, 221, 1),
(380, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:34:54', 2, 222, 1),
(381, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:34:56', 2, 223, 1),
(382, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:34:59', 2, 224, 1),
(383, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:35:02', 2, 225, 1),
(384, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:35:04', 2, 226, 1),
(385, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:35:07', 2, 227, 1),
(386, 'Tipo:', NULL, NULL, NULL, 0, '2018-07-29 04:37:00', 2, 228, 1),
(387, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:37:05', 2, 228, 2),
(388, 'Tipo:', NULL, NULL, NULL, 0, '2018-07-29 04:37:58', 2, 229, 1),
(389, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:37:59', 2, 229, 2),
(390, 'Tipo:', NULL, NULL, NULL, 0, '2018-07-29 04:38:54', 2, 230, 1),
(391, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:38:55', 2, 230, 2),
(392, 'Tipo:', NULL, NULL, NULL, 0, '2018-07-29 04:40:27', 2, 231, 1),
(393, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:40:28', 2, 231, 2),
(394, 'Tipo:', NULL, NULL, NULL, 0, '2018-07-29 04:41:16', 2, 232, 1),
(395, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:41:17', 2, 232, 2),
(396, 'Tipo:', NULL, NULL, NULL, 0, '2018-07-29 04:42:26', 2, 233, 1),
(397, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:42:26', 2, 233, 2),
(398, 'Tipo:', NULL, NULL, NULL, 0, '2018-07-29 04:43:28', 2, 234, 1),
(399, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:43:29', 2, 234, 2),
(400, 'Tipo:', NULL, NULL, NULL, 0, '2018-07-29 04:43:52', 2, 235, 1),
(401, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:43:53', 2, 235, 2),
(402, 'Tipo:', NULL, NULL, NULL, 0, '2018-07-29 04:44:18', 2, 236, 1),
(403, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:44:20', 2, 236, 2),
(404, 'Tipo:', NULL, NULL, NULL, 0, '2018-07-29 04:45:20', 2, 237, 1),
(405, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:45:21', 2, 237, 2),
(406, 'Tipo:', NULL, NULL, NULL, 0, '2018-07-29 04:46:10', 2, 238, 1),
(407, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:46:11', 2, 238, 2),
(408, 'Tipo:', NULL, NULL, NULL, 0, '2018-07-29 04:46:53', 2, 239, 1),
(409, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:46:54', 2, 239, 2),
(410, 'Tipo:', NULL, NULL, NULL, 0, '2018-07-29 04:47:19', 2, 240, 1),
(411, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:47:19', 2, 240, 2),
(412, 'Tipo:', NULL, NULL, NULL, 0, '2018-07-29 04:47:48', 2, 241, 1),
(413, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:47:48', 2, 241, 2),
(414, 'Tipo:', NULL, NULL, NULL, 0, '2018-07-29 04:48:09', 2, 242, 1),
(415, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:48:10', 2, 242, 2),
(416, 'Tipo:', NULL, NULL, NULL, 0, '2018-07-29 04:48:51', 2, 243, 1),
(417, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:48:52', 2, 243, 2),
(418, 'Tipo:', NULL, NULL, NULL, 0, '2018-07-29 04:49:19', 2, 244, 1),
(419, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:49:20', 2, 244, 2),
(420, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:50:49', 2, 245, 1),
(421, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:50:51', 2, 246, 1),
(422, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:50:53', 2, 247, 1),
(423, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:50:55', 2, 248, 1),
(424, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:50:58', 2, 249, 1),
(425, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:51:00', 2, 250, 1),
(426, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:51:02', 2, 251, 1),
(427, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:51:04', 2, 252, 1),
(428, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:51:07', 2, 253, 1),
(429, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:51:09', 2, 254, 1),
(430, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:51:11', 2, 255, 1),
(431, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:51:14', 2, 256, 1),
(432, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:51:18', 2, 257, 1),
(433, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:51:20', 2, 258, 1),
(434, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:51:23', 2, 259, 1),
(435, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:51:26', 2, 260, 1),
(436, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:51:29', 2, 261, 1),
(437, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:52:07', 2, 262, 1),
(438, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:52:12', 2, 263, 1),
(439, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:52:18', 2, 264, 1),
(440, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:52:24', 2, 265, 1),
(441, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:52:30', 2, 266, 1),
(442, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:52:35', 2, 267, 1),
(443, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:52:42', 2, 268, 1),
(444, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:52:49', 2, 269, 1),
(445, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:52:55', 2, 270, 1),
(446, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:53:01', 2, 271, 1),
(447, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:53:07', 2, 272, 1),
(448, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:53:12', 2, 273, 1),
(449, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:53:19', 2, 274, 1),
(450, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:53:26', 2, 275, 1),
(451, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:53:33', 2, 276, 1),
(452, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:53:41', 2, 277, 1),
(453, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 04:53:46', 2, 278, 1),
(454, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:23:47', 2, 279, 1),
(455, 'Indicar Motivo del Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 14:24:04', 4, 279, 2),
(456, '01', NULL, NULL, NULL, 0, '2018-07-29 14:27:34', 5, 292, 1),
(457, '02', NULL, NULL, NULL, 0, '2018-07-29 14:27:39', 5, 293, 1),
(458, '03', NULL, NULL, NULL, 0, '2018-07-29 14:27:46', 5, 294, 1),
(459, '04', NULL, NULL, NULL, 0, '2018-07-29 14:27:53', 5, 295, 1),
(460, '05', NULL, NULL, NULL, 0, '2018-07-29 14:28:02', 5, 296, 1),
(461, '06', NULL, NULL, NULL, 0, '2018-07-29 14:28:08', 5, 297, 1),
(462, '08', NULL, NULL, NULL, 0, '2018-07-29 14:28:14', 5, 298, 1),
(463, '12', NULL, NULL, NULL, 0, '2018-07-29 14:28:21', 5, 299, 1),
(464, '16', NULL, NULL, NULL, 0, '2018-07-29 14:28:28', 5, 300, 1),
(465, 'n', NULL, NULL, NULL, 0, '2018-07-29 14:28:36', 5, 301, 1),
(466, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-29 14:28:52', 4, 302, 1),
(467, '01', NULL, NULL, NULL, 0, '2018-07-29 14:32:24', 3, 303, 1),
(468, '02', NULL, NULL, NULL, 0, '2018-07-29 14:32:30', 3, 304, 1),
(469, '03:', NULL, NULL, NULL, 0, '2018-07-29 14:32:39', 3, 305, 1),
(470, '04', NULL, NULL, NULL, 0, '2018-07-29 14:32:48', 3, 306, 1),
(471, '05', NULL, NULL, NULL, 0, '2018-07-29 14:32:53', 3, 307, 1),
(472, '06', NULL, NULL, NULL, 0, '2018-07-29 14:33:02', 3, 308, 1),
(473, '08', NULL, NULL, NULL, 0, '2018-07-29 14:33:30', 3, 309, 1),
(474, '12', NULL, NULL, NULL, 0, '2018-07-29 14:33:34', 3, 310, 1),
(475, '16', NULL, NULL, NULL, 0, '2018-07-29 14:34:03', 3, 311, 1),
(476, 'n', NULL, NULL, NULL, 0, '2018-07-29 14:34:09', 3, 312, 1),
(477, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-29 14:34:26', 4, 313, 1),
(488, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:44:14', 2, 314, 11),
(489, 'Indicar Motivo de Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 14:44:18', 4, 314, 12),
(509, '', NULL, NULL, NULL, 0, '2018-07-29 14:46:48', 4, 326, 1),
(510, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:47:43', 2, 327, 1),
(511, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:47:45', 2, 328, 1),
(512, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:47:47', 2, 329, 1),
(513, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:47:49', 2, 330, 1),
(514, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:47:52', 2, 331, 1),
(515, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:48:27', 2, 332, 1),
(516, 'Indique cantidad de elementos con defectos:', NULL, NULL, NULL, 0, '2018-07-29 14:48:31', 4, 332, 2),
(517, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:48:33', 2, 333, 1),
(518, 'Indique cantidad de elementos con defectos:', NULL, NULL, NULL, 0, '2018-07-29 14:48:37', 4, 333, 2),
(519, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:49:05', 2, 334, 1),
(520, 'Indique Anomalias y/o Comunicacion de los circuitos (Perforaciones):', NULL, NULL, NULL, 0, '2018-07-29 14:49:09', 4, 334, 2),
(521, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:49:11', 2, 335, 1),
(522, 'Indique Anomalias y/o Comunicacion de los circuitos (Perforaciones):', NULL, NULL, NULL, 0, '2018-07-29 14:49:15', 4, 335, 2),
(523, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:51:08', 2, 336, 1),
(524, 'Indique Anomalias (Corrosion, Falta Mat.):', NULL, NULL, NULL, 0, '2018-07-29 14:51:12', 4, 336, 2),
(525, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:51:14', 2, 337, 1),
(526, 'Indique Anomalias (Corrosion, Falta Mat.):', NULL, NULL, NULL, 0, '2018-07-29 14:51:18', 4, 337, 2),
(527, '01:', NULL, NULL, NULL, 0, '2018-07-29 14:52:40', 5, 338, 1),
(528, '02:', NULL, NULL, NULL, 0, '2018-07-29 14:52:46', 5, 339, 1),
(529, '03:', NULL, NULL, NULL, 0, '2018-07-29 14:52:55', 5, 340, 1),
(530, '04:', NULL, NULL, NULL, 0, '2018-07-29 14:53:16', 5, 341, 1),
(531, '05:', NULL, NULL, NULL, 0, '2018-07-29 14:53:26', 5, 342, 1),
(532, '06:', NULL, NULL, NULL, 0, '2018-07-29 14:53:34', 5, 343, 1),
(533, '08:', NULL, NULL, NULL, 0, '2018-07-29 14:53:42', 5, 344, 1),
(534, '12', NULL, NULL, NULL, 0, '2018-07-29 14:54:13', 5, 345, 1),
(535, 'n:', NULL, NULL, NULL, 0, '2018-07-29 14:54:21', 5, 346, 1),
(537, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:55:48', 2, 349, 1),
(538, 'Indique Motivo Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 14:55:53', 4, 349, 2),
(539, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:55:55', 2, 350, 1),
(540, 'Indique Motivo Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 14:55:59', 4, 350, 2),
(541, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:56:05', 2, 351, 1),
(542, 'Indique Motivo Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 14:56:09', 4, 351, 2),
(543, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:56:14', 2, 352, 1),
(544, 'Indique Motivo Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 14:56:19', 4, 352, 2),
(545, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:56:21', 2, 353, 1),
(546, 'Indique Motivo Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 14:56:25', 4, 353, 2),
(547, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:56:29', 2, 354, 1),
(548, 'Indique Motivo Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 14:56:36', 4, 354, 2),
(549, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:56:40', 2, 355, 1),
(550, 'Indique Motivo Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 14:56:45', 4, 355, 2),
(551, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 14:56:49', 2, 356, 1),
(552, 'Indique Motivo Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 14:56:54', 4, 356, 2),
(553, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 14:58:59', 5, 357, 1),
(554, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 14:59:45', 5, 358, 1),
(555, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 14:59:47', 5, 359, 1),
(556, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 14:59:49', 5, 360, 1),
(557, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 14:59:51', 5, 361, 1),
(558, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 14:59:53', 5, 362, 1),
(559, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 14:59:55', 5, 363, 1),
(560, '', NULL, NULL, NULL, 0, '2018-07-29 15:00:03', 4, 364, 1),
(561, '01', NULL, NULL, NULL, 0, '2018-07-29 15:01:29', 5, 365, 1),
(562, '02:', NULL, NULL, NULL, 0, '2018-07-29 15:01:36', 5, 366, 1),
(563, '03:', NULL, NULL, NULL, 0, '2018-07-29 15:01:43', 5, 367, 1),
(564, '04:', NULL, NULL, NULL, 0, '2018-07-29 15:01:52', 5, 368, 1),
(565, '05:', NULL, NULL, NULL, 0, '2018-07-29 15:01:59', 5, 369, 1),
(566, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 15:02:58', 5, 370, 1),
(567, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 15:02:59', 2, 370, 2),
(568, 'Indicar Motivo de Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 15:03:11', 4, 370, 3),
(569, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 15:07:19', 2, 371, 1),
(570, 'Indique Motivo de Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 15:07:27', 4, 371, 2),
(571, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 15:08:58', 2, 372, 1),
(572, 'Medida STD:', NULL, NULL, NULL, 0, '2018-07-29 15:09:09', 5, 372, 2),
(573, 'Medida Real:', NULL, NULL, NULL, 0, '2018-07-29 15:09:18', 5, 372, 3),
(574, 'a-Tapas Rectas:', NULL, NULL, NULL, 0, '2018-07-29 15:18:05', 2, 373, 1),
(575, 'b-Tapas Convexas', NULL, NULL, NULL, 0, '2018-07-29 15:18:28', 2, 373, 2),
(576, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 15:19:08', 2, 374, 1),
(577, 'Indique Lugar:', NULL, NULL, NULL, 0, '2018-07-29 15:19:28', 4, 374, 2),
(578, 'Tiempo de Prueba:', NULL, NULL, NULL, 0, '2018-07-29 15:22:51', 5, 375, 1),
(579, 'Temperatura de Agua:', NULL, NULL, NULL, 0, '2018-07-29 15:23:00', 5, 375, 2),
(580, 'Presion de Prueba:', NULL, NULL, NULL, 0, '2018-07-29 15:23:10', 5, 375, 3),
(581, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 15:23:12', 2, 375, 4),
(582, 'Indique Motivo de Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 15:23:28', 4, 375, 5),
(583, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 15:28:44', 2, 376, 1),
(584, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 15:28:46', 2, 377, 1),
(585, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 15:28:48', 2, 378, 1),
(586, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 15:28:50', 2, 379, 1),
(587, 'Indique Motivo de Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 15:29:09', 4, 376, 2),
(588, 'Indique Motivo de Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 15:29:13', 4, 377, 2),
(589, 'Indique Motivo de Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 15:29:18', 4, 378, 2),
(590, 'Indique Motivo de Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 15:29:23', 4, 379, 2),
(591, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 15:31:37', 2, 380, 1),
(592, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 15:32:02', 2, 381, 1),
(593, '', NULL, NULL, NULL, 0, '2018-07-29 15:32:16', 2, 382, 1),
(594, 'Normales:', NULL, NULL, NULL, 0, '2018-07-29 15:36:03', 5, 383, 1),
(595, 'Picadas:', NULL, NULL, NULL, 0, '2018-07-29 15:36:10', 5, 383, 2),
(596, 'Quemadas:', NULL, NULL, NULL, 0, '2018-07-29 15:36:19', 5, 383, 3),
(597, 'Inscrustaciones:', NULL, NULL, NULL, 0, '2018-07-29 15:36:33', 5, 383, 4),
(598, '', NULL, NULL, NULL, 0, '2018-07-29 15:36:40', 4, 384, 1),
(599, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 15:40:28', 2, 385, 1),
(600, 'Indique Motivos de Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 15:40:31', 4, 385, 2),
(601, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 15:40:33', 2, 386, 1),
(602, 'Indique Motivos de Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 15:40:37', 4, 386, 2),
(603, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 15:40:39', 2, 387, 1),
(604, 'Indique Motivos de Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 15:40:42', 4, 387, 2),
(605, 'Medida Actual:', NULL, NULL, NULL, 0, '2018-07-29 15:42:15', 5, 388, 1),
(606, 'ALesar:', NULL, NULL, NULL, 0, '2018-07-29 15:42:22', 5, 388, 2),
(607, 'Cambiar:', NULL, NULL, NULL, 0, '2018-07-29 15:42:30', 5, 388, 3),
(608, 'No Cambiar:', NULL, NULL, NULL, 0, '2018-07-29 15:42:36', 5, 388, 4),
(609, '', NULL, NULL, NULL, 0, '2018-07-29 15:42:50', 4, 389, 1),
(610, 'Tipo:', NULL, NULL, NULL, 0, '2018-07-29 15:43:38', 2, 390, 1),
(611, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 15:44:44', 2, 390, 2),
(612, 'Indique Defecto Encontrado:', NULL, NULL, NULL, 0, '2018-07-29 15:45:20', 4, 390, 3),
(613, 'Bancada 1:', NULL, NULL, NULL, 0, '2018-07-29 15:46:15', 5, 391, 1),
(614, 'Bancada 2:', NULL, NULL, NULL, 0, '2018-07-29 15:46:19', 5, 391, 2),
(615, 'Bancada 3:', NULL, NULL, NULL, 0, '2018-07-29 15:46:24', 5, 391, 3),
(616, 'Bancada n:', NULL, NULL, NULL, 0, '2018-07-29 15:46:28', 5, 391, 4),
(617, 'Alesar:', NULL, NULL, NULL, 0, '2018-07-29 15:46:40', 5, 391, 5),
(618, 'Cambiar Bujes:', NULL, NULL, NULL, 0, '2018-07-29 15:46:51', 5, 391, 6),
(619, 'Otros:', NULL, NULL, NULL, 0, '2018-07-29 15:46:58', 5, 391, 7),
(620, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 15:49:39', 2, 392, 1),
(621, 'Indique Motivo de Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 15:49:52', 4, 392, 2),
(622, 'Requerida:', NULL, NULL, NULL, 0, '2018-07-29 15:51:52', 5, 393, 1),
(623, 'Requerida:', NULL, NULL, NULL, 0, '2018-07-29 15:52:02', 5, 394, 1),
(624, 'Obtenida:', NULL, NULL, NULL, 0, '2018-07-29 15:52:12', 5, 393, 2),
(625, 'Obtenida:', NULL, NULL, NULL, 0, '2018-07-29 15:52:16', 5, 394, 2),
(626, 'Admision:', NULL, NULL, NULL, 0, '2018-07-29 15:52:39', 5, 395, 1),
(627, 'Escape:', NULL, NULL, NULL, 0, '2018-07-29 15:52:51', 5, 395, 2),
(628, '', NULL, NULL, NULL, 0, '2018-07-29 15:52:55', 4, 396, 1),
(634, 'Marcados:', NULL, NULL, NULL, 0, '2018-07-29 16:00:51', 3, 397, 1),
(635, 'Abollados:', NULL, NULL, NULL, 0, '2018-07-29 16:01:00', 3, 397, 2),
(636, 'Fisurados:', NULL, NULL, NULL, 0, '2018-07-29 16:01:08', 3, 397, 3),
(637, 'Gastados:', NULL, NULL, NULL, 0, '2018-07-29 16:01:16', 3, 397, 4),
(638, 'Accion:', NULL, NULL, NULL, 0, '2018-07-29 16:01:23', 2, 397, 5),
(639, 'Marcados:', NULL, NULL, NULL, 0, '2018-07-29 16:02:19', 3, 398, 1),
(640, 'Abollados:', NULL, NULL, NULL, 0, '2018-07-29 16:02:26', 3, 398, 2),
(641, 'Fisurados:', NULL, NULL, NULL, 0, '2018-07-29 16:02:37', 3, 398, 3),
(642, 'Gastados:', NULL, NULL, NULL, 0, '2018-07-29 16:02:45', 3, 398, 4),
(643, 'Accion:', NULL, NULL, NULL, 0, '2018-07-29 16:03:01', 2, 398, 5),
(644, 'Marcado:', NULL, NULL, NULL, 0, '2018-07-29 16:06:07', 3, 399, 1),
(645, 'Gastado:', NULL, NULL, NULL, 0, '2018-07-29 16:06:18', 3, 399, 2),
(646, 'Indique Reparacion a Realizar:', NULL, NULL, NULL, 0, '2018-07-29 16:06:30', 4, 399, 3),
(647, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 16:06:54', 2, 400, 1),
(648, 'Proceso de Extraccion:', NULL, NULL, NULL, 0, '2018-07-29 16:07:03', 4, 400, 2),
(649, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 16:11:07', 2, 401, 1),
(650, 'Indique Motivo de Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 16:11:14', 4, 401, 2),
(651, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 16:11:32', 2, 402, 1),
(653, 'Indique Motivo de Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 16:11:49', 4, 402, 2),
(660, '1:', NULL, NULL, NULL, 0, '2018-07-29 16:15:56', 5, 410, 1),
(661, '2:', NULL, NULL, NULL, 0, '2018-07-29 16:16:00', 5, 410, 2),
(662, '3:', NULL, NULL, NULL, 0, '2018-07-29 16:16:04', 5, 410, 3),
(663, '4:', NULL, NULL, NULL, 0, '2018-07-29 16:16:09', 5, 410, 4),
(664, '', NULL, NULL, NULL, 0, '2018-07-29 16:16:49', 4, 411, 1),
(665, 'Medida STD:', NULL, NULL, NULL, 0, '2018-07-29 16:17:53', 5, 412, 1),
(666, 'Medida Actual:', NULL, NULL, NULL, 0, '2018-07-29 16:18:06', 5, 412, 2),
(667, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 16:18:10', 2, 412, 3),
(670, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-29 16:19:49', 4, 412, 4),
(671, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 16:20:59', 2, 414, 1),
(672, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 16:21:11', 2, 415, 1),
(673, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 16:21:40', 2, 416, 1),
(674, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 16:22:33', 2, 417, 1),
(675, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 16:22:41', 2, 418, 1),
(678, '', NULL, NULL, NULL, 0, '2018-07-29 16:24:24', 5, 420, 1),
(679, '', NULL, NULL, NULL, 0, '2018-07-29 16:24:28', 5, 421, 1),
(680, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 17:28:31', 2, 422, 1),
(681, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 17:28:33', 2, 423, 1),
(682, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 17:30:06', 2, 425, 1),
(683, 'Indique Motivo de Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 17:30:19', 4, 425, 2),
(684, 'Patas:', NULL, NULL, NULL, 0, '2018-07-29 17:34:18', 5, 426, 1),
(685, 'Gastadas:', NULL, NULL, NULL, 0, '2018-07-29 17:34:25', 5, 426, 2),
(686, 'Altura:', NULL, NULL, NULL, 0, '2018-07-29 17:34:37', 2, 426, 3),
(687, 'Diafragma:', NULL, NULL, NULL, 0, '2018-07-29 17:35:05', 2, 426, 4),
(688, 'Fisurado:', NULL, NULL, NULL, 0, '2018-07-29 17:36:19', 3, 427, 1),
(689, 'Rayado:', NULL, NULL, NULL, 0, '2018-07-29 17:36:29', 3, 427, 2),
(690, 'Deformado:', NULL, NULL, NULL, 0, '2018-07-29 17:36:35', 3, 427, 3),
(691, 'Otro:', NULL, NULL, NULL, 0, '2018-07-29 17:36:41', 3, 427, 4),
(692, '1:', NULL, NULL, NULL, 0, '2018-07-29 17:37:55', 5, 429, 1),
(693, '2:', NULL, NULL, NULL, 0, '2018-07-29 17:37:59', 5, 429, 2),
(694, '3:', NULL, NULL, NULL, 0, '2018-07-29 17:38:03', 5, 429, 3),
(695, '4:', NULL, NULL, NULL, 0, '2018-07-29 17:38:07', 5, 429, 4),
(696, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-29 17:38:17', 4, 429, 5);
INSERT INTO `frm_valores` (`VALO_ID`, `NOMBRE`, `PISTA`, `LONGITUD`, `VALOR_DEFECTO`, `OBLIGATORIO`, `FEC_CREACION`, `TIDA_ID`, `GRUP_ID`, `ORDEN`) VALUES
(697, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 17:39:18', 2, 430, 1),
(698, 'Indique Motivo del Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 17:39:28', 4, 430, 2),
(699, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 17:40:05', 2, 431, 1),
(700, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-29 17:40:43', 4, 431, 2),
(701, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 17:41:11', 2, 432, 1),
(702, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-29 17:41:22', 4, 432, 2),
(703, 'Picado:', NULL, NULL, NULL, 0, '2018-07-29 17:42:21', 3, 433, 1),
(704, 'Gastado:', NULL, NULL, NULL, 0, '2018-07-29 17:42:30', 3, 433, 2),
(705, 'Fisurado:', NULL, NULL, NULL, 0, '2018-07-29 17:42:37', 3, 433, 3),
(706, 'Cambiar:', NULL, NULL, NULL, 0, '2018-07-29 17:42:44', 3, 433, 4),
(707, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-29 17:43:22', 4, 433, 5),
(708, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 17:52:08', 2, 434, 1),
(709, 'Indicar Motivo de Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 17:52:20', 4, 434, 2),
(710, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 18:11:14', 2, 435, 1),
(711, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 18:11:32', 2, 435, 2),
(712, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 19:02:49', 2, 436, 1),
(713, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 19:02:53', 2, 437, 1),
(714, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 19:02:58', 2, 438, 1),
(715, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 19:03:04', 2, 439, 1),
(716, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 19:03:10', 2, 440, 1),
(717, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 19:03:17', 2, 441, 1),
(718, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 19:03:23', 2, 442, 1),
(719, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 19:03:31', 2, 443, 1),
(720, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 19:03:39', 2, 444, 1),
(721, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 19:03:46', 2, 445, 1),
(722, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 19:06:12', 2, 436, 2),
(723, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 19:06:17', 2, 437, 2),
(724, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 19:06:36', 2, 438, 2),
(725, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 19:06:41', 2, 439, 2),
(726, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 19:06:46', 2, 440, 2),
(727, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 19:06:51', 2, 441, 2),
(728, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 19:06:56', 2, 442, 2),
(729, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 19:07:04', 2, 443, 2),
(730, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 19:07:10', 2, 444, 2),
(731, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 19:07:28', 2, 445, 2),
(732, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 20:42:03', 2, 446, 1),
(733, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 20:42:08', 2, 447, 1),
(734, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 20:42:13', 2, 448, 1),
(735, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 20:42:19', 2, 449, 1),
(736, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 20:43:37', 2, 450, 1),
(737, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 20:43:43', 2, 451, 1),
(738, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 20:43:48', 2, 452, 1),
(739, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 20:43:53', 2, 453, 1),
(740, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 20:43:59', 2, 454, 1),
(741, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 20:44:05', 2, 455, 1),
(742, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 20:44:11', 2, 456, 1),
(743, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 20:45:29', 2, 457, 1),
(744, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 20:45:35', 2, 458, 1),
(745, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 20:45:41', 2, 459, 1),
(746, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 20:45:48', 2, 460, 1),
(747, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 20:45:55', 2, 461, 1),
(748, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 20:46:01', 2, 462, 1),
(749, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 20:47:11', 2, 446, 2),
(750, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 20:47:15', 2, 447, 2),
(751, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 20:47:51', 2, 448, 2),
(752, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 20:47:57', 2, 449, 2),
(753, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 20:48:02', 2, 450, 2),
(754, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 20:48:07', 2, 451, 2),
(755, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 20:48:38', 2, 452, 2),
(756, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 20:48:44', 2, 453, 2),
(757, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 20:48:50', 2, 454, 2),
(758, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 20:48:55', 2, 455, 2),
(759, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 20:49:00', 2, 456, 2),
(760, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 20:49:04', 2, 457, 2),
(761, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 20:49:11', 2, 458, 2),
(762, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 20:49:20', 2, 459, 2),
(763, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 20:49:53', 2, 460, 2),
(764, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 20:50:58', 2, 461, 2),
(765, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 20:52:51', 2, 462, 2),
(766, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:25:07', 2, 463, 1),
(767, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:25:11', 2, 464, 1),
(768, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:25:16', 2, 465, 1),
(769, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:25:21', 2, 466, 1),
(770, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:25:25', 2, 467, 1),
(771, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:25:30', 2, 468, 1),
(772, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:25:41', 2, 469, 1),
(773, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:25:46', 2, 470, 1),
(774, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:25:50', 2, 471, 1),
(775, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:25:55', 2, 472, 1),
(776, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:31:52', 2, 473, 1),
(777, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:31:57', 2, 474, 1),
(778, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:32:02', 2, 475, 1),
(779, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:32:07', 2, 476, 1),
(780, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:32:54', 2, 477, 1),
(781, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:32:59', 2, 478, 1),
(782, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:33:07', 2, 479, 1),
(783, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:33:12', 2, 480, 1),
(784, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:33:19', 2, 481, 1),
(785, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:33:29', 2, 482, 1),
(786, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:33:34', 2, 483, 1),
(787, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:33:47', 2, 484, 1),
(788, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:33:52', 2, 485, 1),
(789, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:33:57', 2, 486, 1),
(790, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:34:01', 2, 487, 1),
(791, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:34:06', 2, 488, 1),
(792, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 21:34:11', 2, 489, 1),
(793, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 21:43:05', 2, 490, 1),
(794, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 21:43:12', 2, 491, 1),
(795, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 21:43:16', 2, 492, 1),
(796, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 21:43:21', 2, 493, 1),
(797, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 21:43:26', 2, 494, 1),
(798, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 21:43:31', 2, 495, 1),
(799, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 21:43:37', 2, 496, 1),
(800, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 21:43:45', 2, 497, 1),
(801, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 21:43:49', 2, 498, 1),
(802, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 21:43:55', 2, 499, 1),
(803, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 21:44:00', 2, 500, 1),
(804, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 23:08:43', 2, 501, 1),
(805, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 23:08:47', 2, 502, 1),
(806, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 23:08:52', 2, 503, 1),
(807, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 23:09:00', 2, 504, 1),
(808, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 23:09:07', 2, 505, 1),
(809, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 23:09:12', 2, 506, 1),
(810, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 23:09:32', 2, 507, 1),
(811, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 23:09:42', 2, 508, 1),
(812, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 23:09:48', 2, 509, 1),
(813, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 23:10:06', 2, 510, 1),
(814, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 23:10:11', 2, 511, 1),
(815, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 23:10:22', 2, 512, 1),
(816, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 23:10:26', 2, 513, 1),
(817, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 23:10:30', 2, 514, 1),
(818, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 23:10:35', 2, 515, 1),
(819, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 23:10:41', 2, 516, 1),
(820, 'Radio:', NULL, NULL, NULL, 0, '2018-07-29 23:10:46', 2, 517, 1),
(822, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 23:15:29', 2, 518, 1),
(823, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 23:15:32', 2, 519, 1),
(824, 'Indique Lugar de Fisura y Orientacion:', NULL, NULL, NULL, 0, '2018-07-29 23:15:51', 4, 518, 2),
(825, 'Indique Lugar de Fisura y Orientacion:', NULL, NULL, NULL, 0, '2018-07-29 23:15:55', 4, 519, 2),
(826, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 23:24:54', 2, 520, 1),
(827, 'Reconstruir:', NULL, NULL, NULL, 0, '2018-07-29 23:25:08', 5, 520, 2),
(828, 'Inserto:', NULL, NULL, NULL, 0, '2018-07-29 23:25:20', 5, 520, 3),
(829, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 23:25:25', 2, 521, 1),
(830, 'Reconstruir:', NULL, NULL, NULL, 0, '2018-07-29 23:25:37', 5, 521, 2),
(831, 'Medida Mayor:', NULL, NULL, NULL, 0, '2018-07-29 23:27:03', 5, 522, 1),
(832, 'Medida Menor:', NULL, NULL, NULL, 0, '2018-07-29 23:27:10', 5, 522, 2),
(833, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 23:27:35', 5, 522, 3),
(834, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 23:32:13', 2, 523, 1),
(835, 'Dureza:', NULL, NULL, NULL, 0, '2018-07-29 23:32:25', 5, 523, 2),
(836, 'Reconstruir:', NULL, NULL, NULL, 0, '2018-07-29 23:32:34', 5, 523, 3),
(837, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 23:32:40', 2, 524, 1),
(838, 'Encamisar:', NULL, NULL, NULL, 0, '2018-07-29 23:32:50', 5, 524, 2),
(839, 'Marcado:', NULL, NULL, NULL, 0, '2018-07-29 23:34:58', 5, 527, 1),
(840, 'Marcado:', NULL, NULL, NULL, 0, '2018-07-29 23:35:02', 5, 528, 1),
(841, 'Marcado:', NULL, NULL, NULL, 0, '2018-07-29 23:35:08', 5, 529, 1),
(842, 'Marcado:', NULL, NULL, NULL, 0, '2018-07-29 23:35:13', 5, 530, 1),
(843, 'Marcado:', NULL, NULL, NULL, 0, '2018-07-29 23:35:18', 5, 531, 1),
(844, 'Marcado:', NULL, NULL, NULL, 0, '2018-07-29 23:35:23', 5, 532, 1),
(845, 'Marcado:', NULL, NULL, NULL, 0, '2018-07-29 23:35:29', 5, 533, 1),
(846, 'Marcado:', NULL, NULL, NULL, 0, '2018-07-29 23:35:33', 5, 534, 1),
(847, 'Marcado:', NULL, NULL, NULL, 0, '2018-07-29 23:35:38', 5, 535, 1),
(848, 'Marcado:', NULL, NULL, NULL, 0, '2018-07-29 23:35:43', 5, 536, 1),
(849, 'Marcado:', NULL, NULL, NULL, 0, '2018-07-29 23:35:47', 5, 537, 1),
(850, 'Estado Tornillos', NULL, NULL, NULL, 0, '2018-07-29 23:35:58', 2, 527, 2),
(851, 'Estado Tornillos', NULL, NULL, NULL, 0, '2018-07-29 23:36:02', 2, 528, 2),
(852, 'Estado Tornillos', NULL, NULL, NULL, 0, '2018-07-29 23:36:07', 2, 529, 2),
(853, 'Estado Tornillos', NULL, NULL, NULL, 0, '2018-07-29 23:36:11', 2, 530, 2),
(854, 'Estado Tornillos', NULL, NULL, NULL, 0, '2018-07-29 23:36:16', 2, 531, 2),
(855, ' Estado Tornillos', NULL, NULL, NULL, 0, '2018-07-29 23:36:24', 2, 532, 2),
(856, 'Estado Tornillos', NULL, NULL, NULL, 0, '2018-07-29 23:36:30', 2, 533, 2),
(857, 'Estado Tornillos', NULL, NULL, NULL, 0, '2018-07-29 23:36:52', 2, 534, 2),
(858, 'Estado Tornillos:', NULL, NULL, NULL, 0, '2018-07-29 23:36:59', 2, 535, 2),
(859, 'Estado Tornillos', NULL, NULL, NULL, 0, '2018-07-29 23:37:09', 2, 536, 2),
(860, 'Estado Tornillos', NULL, NULL, NULL, 0, '2018-07-29 23:37:13', 2, 537, 2),
(861, '', NULL, NULL, NULL, 0, '2018-07-29 23:37:29', 4, 525, 1),
(862, '', NULL, NULL, NULL, 0, '2018-07-29 23:37:37', 4, 538, 1),
(863, 'Medida:', NULL, NULL, NULL, 0, '2018-07-29 23:38:31', 5, 539, 1),
(864, 'Correccion:', NULL, NULL, NULL, 0, '2018-07-29 23:38:38', 5, 539, 2),
(865, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 23:38:42', 2, 539, 3),
(866, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-29 23:38:51', 4, 539, 4),
(867, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 23:43:17', 2, 540, 1),
(868, 'Indicar Motivo de Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 23:43:27', 4, 540, 2),
(869, 'Accion Correctiva:', NULL, NULL, NULL, 0, '2018-07-29 23:43:34', 4, 540, 3),
(870, 'Estado:', NULL, NULL, NULL, 0, '2018-07-29 23:43:50', 2, 541, 1),
(871, 'Motivo de Rechazo:', NULL, NULL, NULL, 0, '2018-07-29 23:44:00', 4, 541, 2),
(872, 'Correcciones:', NULL, NULL, NULL, 0, '2018-07-29 23:44:07', 4, 541, 3),
(1000, 'Abrazadera caño de gases', NULL, NULL, NULL, 0, '2018-07-30 00:45:40', 3, 1000, 1),
(1001, 'Alternador', NULL, NULL, NULL, 0, '2018-07-30 00:45:47', 3, 1000, 2),
(1002, 'Arbol auxiliar', NULL, NULL, NULL, 0, '2018-07-30 00:46:01', 3, 1000, 3),
(1003, 'Arbol de levas', NULL, NULL, NULL, 0, '2018-07-30 00:46:05', 3, 1000, 4),
(1004, 'Balancines', NULL, NULL, NULL, 0, '2018-07-30 00:48:40', 3, 1000, 5),
(1005, 'Biela de compresor', NULL, NULL, NULL, 0, '2018-07-30 00:48:47', 3, 1000, 6),
(1006, 'Bielas', NULL, NULL, NULL, 0, '2018-07-30 00:49:24', 3, 1000, 7),
(1007, 'Block de motor', NULL, NULL, NULL, 0, '2018-07-30 00:49:31', 3, 1000, 8),
(1008, 'Bomba de aceite', NULL, NULL, NULL, 0, '2018-07-30 00:49:53', 3, 1000, 9),
(1009, 'Bomba de agua', NULL, NULL, NULL, 0, '2018-07-30 00:50:00', 3, 1000, 10),
(1010, 'Bomba de nafta', NULL, NULL, NULL, 0, '2018-07-30 00:50:07', 3, 1000, 11),
(1011, 'Bomba Inyectora No', NULL, NULL, NULL, 0, '2018-07-30 00:50:14', 3, 1000, 12),
(1012, 'Botadores', NULL, NULL, NULL, 0, '2018-07-30 00:50:21', 3, 1000, 13),
(1013, 'Brida de arbol de levas', NULL, NULL, NULL, 0, '2018-07-30 00:50:29', 3, 1000, 14),
(1014, 'Bujias', NULL, NULL, NULL, 0, '2018-07-30 00:50:44', 3, 1000, 15),
(1015, 'Bulbo de aceite de vigia', NULL, NULL, NULL, 0, '2018-07-30 00:50:55', 3, 1000, 16),
(1016, 'Bulbo temperatura de vigia', NULL, NULL, NULL, 0, '2018-07-30 00:51:03', 3, 1000, 17),
(1017, 'Bulon punta de cigueñal', NULL, NULL, NULL, 0, '2018-07-30 00:51:14', 3, 1000, 18),
(1018, 'Bulones de retorno', NULL, NULL, NULL, 0, '2018-07-30 00:51:22', 3, 1000, 19),
(1019, 'Bulones de tapa de bancada ', NULL, NULL, NULL, 0, '2018-07-30 00:51:28', 3, 1000, 20),
(1020, 'Bulones de tapa de cilindros', NULL, NULL, NULL, 0, '2018-07-30 00:51:36', 3, 1000, 21),
(1021, 'Caño col.de adm.de turb.(alu.)', NULL, NULL, NULL, 0, '2018-07-30 00:57:48', 3, 1000, 22),
(1022, 'Caño colec.de escape', NULL, NULL, NULL, 0, '2018-07-30 00:58:50', 3, 1000, 23),
(1023, 'Caño de alim.aceite de turbo', NULL, NULL, NULL, 0, '2018-07-30 00:58:57', 3, 1000, 24),
(1024, 'Caño de combustible', NULL, NULL, NULL, 0, '2018-07-30 00:59:07', 3, 1000, 25),
(1025, 'Caño de entrada de aceite', NULL, NULL, NULL, 0, '2018-07-30 00:59:16', 3, 1000, 26),
(1026, 'Caño de retorno', NULL, NULL, NULL, 0, '2018-07-30 00:59:23', 3, 1000, 27),
(1027, 'Caño inferior retorno de tubo', NULL, NULL, NULL, 0, '2018-07-30 00:59:31', 3, 1000, 28),
(1028, 'Caños de inyector', NULL, NULL, NULL, 0, '2018-07-30 00:59:39', 3, 1000, 29),
(1029, 'Carburador', NULL, NULL, NULL, 0, '2018-07-30 00:59:45', 3, 1000, 30),
(1030, 'Carcaza cubre volante', NULL, NULL, NULL, 0, '2018-07-30 00:59:56', 3, 1000, 31),
(1031, 'Carcaza de distribucion', NULL, NULL, NULL, 0, '2018-07-30 01:00:03', 3, 1000, 32),
(1032, 'Carters c/bulones', NULL, NULL, NULL, 0, '2018-07-30 01:00:12', 3, 1000, 33),
(1033, 'Chapa cubre volante chica', NULL, NULL, NULL, 0, '2018-07-30 01:00:28', 3, 1000, 35),
(1034, 'Chapa cubre volante grande', NULL, NULL, NULL, 0, '2018-07-30 01:00:41', 3, 1000, 36),
(1035, 'Chaveta de arbol de levas', NULL, NULL, NULL, 0, '2018-07-30 01:00:48', 3, 1000, 37),
(1036, 'Chaveta de cigueñal', NULL, NULL, NULL, 0, '2018-07-30 01:00:56', 3, 1000, 38),
(1037, 'Cigueñal del compresor', NULL, NULL, NULL, 0, '2018-07-30 01:01:03', 3, 1000, 39),
(1038, 'Cigueñal', NULL, NULL, NULL, 0, '2018-07-30 01:01:10', 3, 1000, 40),
(1039, 'Chupador de bomba de aceite', NULL, NULL, NULL, 0, '2018-07-30 01:01:37', 3, 1000, 41),
(1040, 'Rompe olas', NULL, NULL, NULL, 0, '2018-07-30 01:01:43', 3, 1000, 82),
(1041, 'Cilindro de compresor', NULL, NULL, NULL, 0, '2018-07-30 01:01:50', 3, 1000, 42),
(1042, 'Contrapesos', NULL, NULL, NULL, 0, '2018-07-30 01:01:58', 3, 1000, 43),
(1043, 'Corona de arranque', NULL, NULL, NULL, 0, '2018-07-30 01:02:05', 3, 1000, 44),
(1044, 'Depresor', NULL, NULL, NULL, 0, '2018-07-30 01:02:24', 3, 1000, 45),
(1045, 'Disco de embrague', NULL, NULL, NULL, 0, '2018-07-30 01:02:31', 3, 1000, 46),
(1046, 'Distribuidor', NULL, NULL, NULL, 0, '2018-07-30 01:02:37', 3, 1000, 47),
(1047, 'Eje de balancines', NULL, NULL, NULL, 0, '2018-07-30 01:02:43', 3, 1000, 48),
(1048, 'Engranaje de arbol de levas', NULL, NULL, NULL, 0, '2018-07-30 01:02:51', 3, 1000, 49),
(1049, 'Engranaje de cigueñal', NULL, NULL, NULL, 0, '2018-07-30 01:02:57', 3, 1000, 50),
(1050, 'Esparragos de tapa de cilindros', NULL, NULL, NULL, 0, '2018-07-30 01:03:10', 3, 1000, 51),
(1051, 'Filtro de aire', NULL, NULL, NULL, 0, '2018-07-30 01:03:21', 3, 1000, 52),
(1052, 'Filtro de combustible', NULL, NULL, NULL, 0, '2018-07-30 01:03:44', 3, 1000, 53),
(1053, 'Gancho de motor delantero', NULL, NULL, NULL, 0, '2018-07-30 01:03:51', 3, 1000, 54),
(1054, 'Gancho de motor trasero', NULL, NULL, NULL, 0, '2018-07-30 01:03:59', 3, 1000, 55),
(1055, 'Indicador de puestas a punto', NULL, NULL, NULL, 0, '2018-07-30 01:04:08', 3, 1000, 56),
(1056, 'Inyectores', NULL, NULL, NULL, 0, '2018-07-30 01:04:15', 3, 1000, 57),
(1057, 'Leva de embrague', NULL, NULL, NULL, 0, '2018-07-30 01:04:21', 3, 1000, 58),
(1058, 'Montantes de motor', NULL, NULL, NULL, 0, '2018-07-30 01:04:28', 3, 1000, 59),
(1059, 'Motor de arranque', NULL, NULL, NULL, 0, '2018-07-30 01:04:34', 3, 1000, 60),
(1060, 'Caño superior retorno de tubo', NULL, NULL, NULL, 0, '2018-07-30 01:05:06', 3, 1000, 28),
(1061, 'Mecanismo de aceleracion', NULL, NULL, NULL, 0, '2018-07-30 01:05:34', 3, 1000, 62),
(1062, 'Multiple de admision', NULL, NULL, NULL, 0, '2018-07-30 01:06:17', 3, 1000, 63),
(1063, 'Multiple de escape', NULL, NULL, NULL, 0, '2018-07-30 01:06:23', 3, 1000, 64),
(1064, 'Pernos de presion', NULL, NULL, NULL, 0, '2018-07-30 01:06:34', 3, 1000, 65),
(1065, 'Porta filtro aceite inferior', NULL, NULL, NULL, 0, '2018-07-30 01:06:42', 3, 1000, 66),
(1066, 'Porta filtro aceite superior', NULL, NULL, NULL, 0, '2018-07-30 01:06:48', 3, 1000, 67),
(1067, 'Pista reten', NULL, NULL, NULL, 0, '2018-07-30 01:06:55', 3, 1000, 68),
(1068, 'Piston de compresor', NULL, NULL, NULL, 0, '2018-07-30 01:07:02', 3, 1000, 69),
(1069, 'Pistones', NULL, NULL, NULL, 0, '2018-07-30 01:12:44', 3, 1000, 70),
(1070, 'Placa de embrague', NULL, NULL, NULL, 0, '2018-07-30 01:12:51', 3, 1000, 71),
(1071, 'Platillos de valvulas', NULL, NULL, NULL, 0, '2018-07-30 01:13:01', 3, 1000, 72),
(1072, 'Polea balanceadora D/3', NULL, NULL, NULL, 0, '2018-07-30 01:13:08', 3, 1000, 73),
(1073, 'Polea bomba de agua', NULL, NULL, NULL, 0, '2018-07-30 02:09:22', 3, 1000, 74),
(1074, 'Porta termostato inferior', NULL, NULL, NULL, 0, '2018-07-30 02:09:29', 3, 1000, 75),
(1075, 'Porta termostato superior', NULL, NULL, NULL, 0, '2018-07-30 02:09:36', 3, 1000, 76),
(1076, 'Prisioneros soporte balancin', NULL, NULL, NULL, 0, '2018-07-30 02:09:43', 3, 1000, 77),
(1077, ' Radiadores de aceite con tornillos', NULL, NULL, NULL, 0, '2018-07-30 02:10:19', 3, 1000, 78),
(1078, 'Reguladores de balancines', NULL, NULL, NULL, 0, '2018-07-30 02:10:31', 3, 1000, 79),
(1079, 'Resorte de valvulas', NULL, NULL, NULL, 0, '2018-07-30 02:10:40', 3, 1000, 80),
(1080, 'Resortes de balancines', NULL, NULL, NULL, 0, '2018-07-30 02:10:50', 3, 1000, 81),
(1081, 'Seguro de valvulas', NULL, NULL, NULL, 0, '2018-07-30 02:12:35', 3, 1000, 83),
(1082, 'Sensor de presion de aceite', NULL, NULL, NULL, 0, '2018-07-30 02:12:49', 3, 1000, 84),
(1083, 'Sensor de temperatura', NULL, NULL, NULL, 0, '2018-07-30 02:12:59', 3, 1000, 85),
(1084, 'Separador de bomba de agua', NULL, NULL, NULL, 0, '2018-07-30 02:13:09', 3, 1000, 86),
(1085, 'Separador de motor de arranque', NULL, NULL, NULL, 0, '2018-07-30 02:13:20', 3, 1000, 87),
(1086, 'Soporte de alternador', NULL, NULL, NULL, 0, '2018-07-30 02:13:54', 3, 1000, 88),
(1087, 'Soporte de motor', NULL, NULL, NULL, 0, '2018-07-30 02:14:04', 3, 1000, 89),
(1088, 'Soporte de multiple de escape', NULL, NULL, NULL, 0, '2018-07-30 02:14:26', 3, 1000, 90),
(1089, 'Soporte filtro de gasoil DH', NULL, NULL, NULL, 0, '2018-07-30 02:14:44', 3, 1000, 91),
(1090, 'Tapa de carcaza cubre volante', NULL, NULL, NULL, 0, '2018-07-30 02:15:48', 3, 1000, 92),
(1091, 'Tapa de cilindros', NULL, NULL, NULL, 0, '2018-07-30 02:16:00', 3, 1000, 93),
(1092, 'Tapa de compresor M/V M/N', NULL, NULL, NULL, 0, '2018-07-30 02:16:26', 3, 1000, 94),
(1093, 'Tapa de distribucion', NULL, NULL, NULL, 0, '2018-07-30 02:16:36', 3, 1000, 95),
(1094, 'Tapa de inspeccion', NULL, NULL, NULL, 0, '2018-07-30 02:16:43', 3, 1000, 96),
(1095, 'Tapa de inspeccion con respirador', NULL, NULL, NULL, 0, '2018-07-30 02:16:54', 3, 1000, 97),
(1096, 'Tapa lateral', NULL, NULL, NULL, 0, '2018-07-30 02:17:05', 3, 1000, 98),
(1097, 'Tapa balancines M/N - M/V', NULL, NULL, NULL, 0, '2018-07-30 02:17:39', 3, 1000, 99),
(1098, 'Tapa de distribucion', NULL, NULL, NULL, 0, '2018-07-30 02:17:55', 3, 1000, 100),
(1099, 'Tapa de inspeccion', NULL, NULL, NULL, 0, '2018-07-30 02:18:07', 3, 1000, 101),
(1100, 'Tapa de inspeccion con respirador', NULL, NULL, NULL, 0, '2018-07-30 02:18:16', 3, 1000, 102),
(1101, 'Tapa lateral', NULL, NULL, NULL, 0, '2018-07-30 02:18:56', 3, 1000, 103),
(1102, 'Tapa balancines M/N - M/V', NULL, NULL, NULL, 0, '2018-07-30 02:19:06', 3, 1000, 104),
(1103, 'Vaina varilla de aceite', NULL, NULL, NULL, 0, '2018-07-30 02:19:45', 3, 1000, 108),
(1104, 'Tapas de bancada', NULL, NULL, NULL, 0, '2018-07-30 02:19:56', 3, 1000, 105),
(1105, 'Tapon de block', NULL, NULL, NULL, 0, '2018-07-30 02:20:07', 3, 1000, 106),
(1106, 'Tensor de alternador', NULL, NULL, NULL, 0, '2018-07-30 02:20:22', 3, 1000, 107),
(1107, 'Varilla nivel de aceite', NULL, NULL, NULL, 0, '2018-07-30 02:20:31', 3, 1000, 109),
(1108, 'Varilla alza valvulas', NULL, NULL, NULL, 0, '2018-07-30 02:20:40', 3, 1000, 110),
(1109, 'Torre de balancines', NULL, NULL, NULL, 0, '2018-07-30 02:20:48', 3, 1000, 111),
(1110, 'Tuercas de inyectores', NULL, NULL, NULL, 0, '2018-07-30 02:21:06', 3, 1000, 106),
(1111, 'Tuercas de tapas de cilindros', NULL, NULL, NULL, 0, '2018-07-30 02:21:22', 3, 1000, 106),
(1112, 'Union ejes de balancines', NULL, NULL, NULL, 0, '2018-07-30 02:21:33', 3, 1000, 107),
(1113, 'Valvula corte de gas-oil vigia', NULL, NULL, NULL, 0, '2018-07-30 02:22:11', 3, 1000, 115),
(1114, 'Valvulas', NULL, NULL, NULL, 0, '2018-07-30 02:22:25', 3, 1000, 116),
(1115, 'Ventilador con tornillos', NULL, NULL, NULL, 0, '2018-07-30 02:23:08', 3, 1000, 117),
(1116, 'Volante con bulones', NULL, NULL, NULL, 0, '2018-07-30 02:23:18', 3, 1000, 118),
(1117, 'Turbo', NULL, NULL, NULL, 0, '2018-07-30 02:23:25', 3, 1000, 107),
(1118, 'Arnes', NULL, NULL, NULL, 0, '2018-07-30 02:23:35', 3, 1000, 0),
(1119, 'ECM o ECU', NULL, NULL, NULL, 0, '2018-07-30 02:23:46', 3, 1000, 120),
(1120, 'Sensor', NULL, NULL, NULL, 0, '2018-07-30 02:23:54', 3, 1000, 84),
(1200, 'Armado', NULL, NULL, NULL, 0, '2018-07-31 12:52:15', 3, 1201, 1),
(1201, 'Semi-Armado', NULL, NULL, NULL, 0, '2018-07-31 12:52:27', 3, 1201, 2),
(1202, 'Desarmado', NULL, NULL, NULL, 0, '2018-07-31 12:52:37', 3, 1201, 3),
(1203, '1', NULL, NULL, NULL, 0, '2018-07-31 14:31:05', 5, 1210, 1),
(1204, '2', NULL, NULL, NULL, 0, '2018-07-31 14:31:08', 5, 1210, 2),
(1205, '3', NULL, NULL, NULL, 0, '2018-07-31 14:31:12', 5, 1210, 3),
(1206, '4', NULL, NULL, NULL, 0, '2018-07-31 14:31:15', 5, 1210, 4),
(1207, '5', NULL, NULL, NULL, 0, '2018-07-31 14:31:19', 5, 1210, 5),
(1208, '6', NULL, NULL, NULL, 0, '2018-07-31 14:31:24', 5, 1210, 6),
(1209, '7', NULL, NULL, NULL, 0, '2018-07-31 14:31:28', 5, 1210, 7),
(1210, 'Marca de los Metales', NULL, NULL, NULL, 0, '2018-07-31 14:31:42', 2, 1210, 8),
(1211, 'Medidas:', NULL, NULL, NULL, 0, '2018-07-31 14:32:16', 5, 1210, 9),
(1212, 'Fabrica pide maxima y minima:', NULL, NULL, NULL, 0, '2018-07-31 14:37:33', 4, 1210, 10),
(1223, 'Marca del Cigueñal:', NULL, NULL, NULL, 0, '2018-07-31 14:41:13', 5, 1212, 1),
(1224, '1', NULL, NULL, NULL, 0, '2018-07-31 14:41:16', 5, 1212, 2),
(1225, '2', NULL, NULL, NULL, 0, '2018-07-31 14:41:19', 5, 1212, 3),
(1226, '3', NULL, NULL, NULL, 0, '2018-07-31 14:41:21', 5, 1212, 4),
(1227, '4', NULL, NULL, NULL, 0, '2018-07-31 14:41:25', 5, 1212, 5),
(1228, '5', NULL, NULL, NULL, 0, '2018-07-31 14:41:28', 5, 1212, 6),
(1229, '6', NULL, NULL, NULL, 0, '2018-07-31 14:41:38', 5, 1212, 7),
(1230, '7', NULL, NULL, NULL, 0, '2018-07-31 14:41:42', 5, 1212, 8),
(1231, '8', NULL, NULL, NULL, 0, '2018-07-31 14:41:44', 5, 1212, 9),
(1232, '9', NULL, NULL, NULL, 0, '2018-07-31 14:41:49', 5, 1212, 10),
(1233, '10', NULL, NULL, NULL, 0, '2018-07-31 14:41:53', 5, 1212, 11),
(1234, 'Marca de los Metales:', NULL, NULL, NULL, 0, '2018-07-31 14:42:14', 2, 1212, 12),
(1235, 'Medida:', NULL, NULL, NULL, 0, '2018-07-31 14:42:20', 5, 1212, 13),
(1236, 'Fabrica pide maxima y minima:', NULL, NULL, NULL, 0, '2018-07-31 14:46:26', 4, 1212, 14),
(1237, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 14:50:28', 2, 1213, 1),
(1238, 'Medidas de camisa:', NULL, NULL, NULL, 0, '2018-07-31 14:51:08', 5, 1213, 2),
(1239, '1', NULL, NULL, NULL, 0, '2018-07-31 14:51:24', 5, 1213, 3),
(1240, '2', NULL, NULL, NULL, 0, '2018-07-31 14:51:26', 5, 1213, 4),
(1241, '3', NULL, NULL, NULL, 0, '2018-07-31 14:51:29', 5, 1213, 5),
(1242, '4', NULL, NULL, NULL, 0, '2018-07-31 14:51:32', 5, 1213, 6),
(1243, '4', NULL, NULL, NULL, 0, '2018-07-31 14:51:36', 5, 1213, 7),
(1244, '5', NULL, NULL, NULL, 0, '2018-07-31 14:51:39', 5, 1213, 8),
(1245, '6', NULL, NULL, NULL, 0, '2018-07-31 14:51:45', 5, 1213, 9),
(1246, '7', NULL, NULL, NULL, 0, '2018-07-31 14:54:34', 5, 1213, 10),
(1247, '8', NULL, NULL, NULL, 0, '2018-07-31 14:54:38', 5, 1213, 11),
(1248, 'Marca de Piston:', NULL, NULL, NULL, 0, '2018-07-31 14:54:50', 5, 1213, 12),
(1252, '1', NULL, NULL, NULL, 0, '2018-07-31 15:20:19', 5, 1215, 1),
(1253, '2', NULL, NULL, NULL, 0, '2018-07-31 15:20:21', 5, 1215, 2),
(1254, '3', NULL, NULL, NULL, 0, '2018-07-31 15:20:27', 5, 1215, 3),
(1255, '4', NULL, NULL, NULL, 0, '2018-07-31 15:20:31', 5, 1215, 2),
(1256, 'Otros:', NULL, NULL, NULL, 0, '2018-07-31 15:20:47', 4, 1215, 3),
(1257, '1', NULL, NULL, NULL, 0, '2018-07-31 15:21:14', 5, 1216, 1),
(1258, '2', NULL, NULL, NULL, 0, '2018-07-31 15:21:17', 5, 1216, 2),
(1259, '3', NULL, NULL, NULL, 0, '2018-07-31 15:21:20', 5, 1216, 3),
(1260, '4', NULL, NULL, NULL, 0, '2018-07-31 15:21:23', 5, 1216, 4),
(1261, 'Otros:', NULL, NULL, NULL, 0, '2018-07-31 15:21:41', 4, 1216, 5),
(1262, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 15:22:10', 4, 1217, 1),
(1263, '', NULL, NULL, NULL, 0, '2018-07-31 15:23:04', 4, 1218, 1),
(1282, 'Amianto:', NULL, NULL, NULL, 0, '2018-07-31 15:47:33', 5, 1226, 1),
(1283, 'Rosca:', NULL, NULL, NULL, 0, '2018-07-31 15:47:40', 5, 1226, 2),
(1284, 'Luz:', NULL, NULL, NULL, 0, '2018-07-31 15:47:55', 5, 1226, 3),
(1285, 'Estado de Leva:', NULL, NULL, NULL, 0, '2018-07-31 15:48:19', 2, 1226, 4),
(1287, 'De cigueñal:', NULL, NULL, NULL, 0, '2018-07-31 15:51:18', 4, 1229, 1),
(1288, 'Luz de Aceite:', NULL, NULL, NULL, 0, '2018-07-31 15:54:16', 5, 1230, 1),
(1289, 'Medida:', NULL, NULL, NULL, 0, '2018-07-31 15:54:28', 5, 1230, 2),
(1290, 'Luz:', NULL, NULL, NULL, 0, '2018-07-31 15:54:49', 5, 1231, 1),
(1291, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 15:54:58', 2, 1231, 2),
(1292, 'Medida:', NULL, NULL, NULL, 0, '2018-07-31 15:55:15', 5, 1231, 3),
(1295, 'Radio de Biela de Cigueñal:', NULL, NULL, NULL, 0, '2018-07-31 15:59:59', 5, 1233, 1),
(1296, 'Cigueñal Biela:', NULL, NULL, NULL, 0, '2018-07-31 16:00:31', 5, 1233, 2),
(1297, 'Radio de Bancada de Cigueñal:', NULL, NULL, NULL, 0, '2018-07-31 16:01:13', 5, 1233, 3),
(1298, 'Bancadas:', NULL, NULL, NULL, 0, '2018-07-31 16:01:56', 5, 1233, 4),
(1299, 'Radio Biela Compresor:', NULL, NULL, NULL, 0, '2018-07-31 16:02:17', 5, 1233, 5),
(1300, 'Alojamiento Bielas:', NULL, NULL, NULL, 0, '2018-07-31 16:02:30', 5, 1233, 6),
(1301, 'Luz de Pernos:', NULL, NULL, NULL, 0, '2018-07-31 16:02:47', 5, 1233, 7),
(1302, 'Bancadas:', NULL, NULL, NULL, 0, '2018-07-31 16:02:54', 5, 1233, 8),
(1303, '1', NULL, NULL, NULL, 0, '2018-07-31 16:05:41', 5, 1234, 1),
(1304, '2', NULL, NULL, NULL, 0, '2018-07-31 16:05:44', 5, 1234, 2),
(1305, '3', NULL, NULL, NULL, 0, '2018-07-31 16:05:49', 5, 1234, 3),
(1306, '4', NULL, NULL, NULL, 0, '2018-07-31 16:06:01', 5, 1234, 4),
(1307, '5', NULL, NULL, NULL, 0, '2018-07-31 16:06:04', 5, 1234, 5),
(1308, '6', NULL, NULL, NULL, 0, '2018-07-31 16:06:11', 5, 1234, 6),
(1309, '7', NULL, NULL, NULL, 0, '2018-07-31 16:06:15', 5, 1234, 7),
(1310, '8', NULL, NULL, NULL, 0, '2018-07-31 16:06:20', 5, 1234, 8),
(1311, '9', NULL, NULL, NULL, 0, '2018-07-31 16:06:24', 5, 1234, 9),
(1312, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 16:08:17', 4, 1234, 10),
(1314, 'Medida:', NULL, NULL, NULL, 0, '2018-07-31 16:16:33', 5, 1235, 1),
(1315, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 16:16:40', 2, 1235, 2),
(1316, 'Presion Alta:', NULL, NULL, NULL, 0, '2018-07-31 16:17:10', 5, 1235, 3),
(1317, 'Presion Baja:', NULL, NULL, NULL, 0, '2018-07-31 16:17:21', 5, 1235, 4),
(1318, 'De Bielas:', NULL, NULL, NULL, 0, '2018-07-31 16:17:52', 5, 1236, 1),
(1319, 'Tiene rosca:', NULL, NULL, NULL, 0, '2018-07-31 16:18:25', 5, 1237, 1),
(1320, 'Tapa de distribucion:', NULL, NULL, NULL, 0, '2018-07-31 16:20:07', 5, 1237, 2),
(1321, 'Tapa de Cilindros:', NULL, NULL, NULL, 0, '2018-07-31 16:20:18', 5, 1237, 3),
(1322, 'Luz entre aloj. y botador:', NULL, NULL, NULL, 0, '2018-07-31 16:20:46', 5, 1238, 1),
(1323, 'En que estado estan:', NULL, NULL, NULL, 0, '2018-07-31 16:21:23', 5, 1239, 1),
(1324, 'Repasar:', NULL, NULL, NULL, 0, '2018-07-31 16:22:34', 4, 1240, 1),
(1325, 'Conductos de aceite de leva:', NULL, NULL, NULL, 0, '2018-07-31 16:23:03', 4, 1241, 1),
(1326, 'Block:', NULL, NULL, NULL, 0, '2018-07-31 16:23:10', 4, 1241, 2),
(1327, 'En el Piston:', NULL, NULL, NULL, 0, '2018-07-31 16:24:07', 4, 1242, 1),
(1328, 'Cigueñal:', NULL, NULL, NULL, 0, '2018-07-31 16:24:26', 5, 1243, 1),
(1329, 'Volante:', NULL, NULL, NULL, 0, '2018-07-31 16:24:33', 5, 1243, 2),
(1330, 'Polea:', NULL, NULL, NULL, 0, '2018-07-31 16:24:39', 5, 1243, 3),
(1331, 'Pistones:', NULL, NULL, NULL, 0, '2018-07-31 16:25:33', 5, 1244, 1),
(1332, 'Bielas:', NULL, NULL, NULL, 0, '2018-07-31 16:25:39', 5, 1244, 2),
(1333, 'Camisas:', NULL, NULL, NULL, 0, '2018-07-31 16:26:06', 5, 1245, 1),
(1334, 'Polea:', NULL, NULL, NULL, 0, '2018-07-31 16:26:14', 5, 1245, 2),
(1335, 'Aluminio:', NULL, NULL, NULL, 0, '2018-07-31 16:27:05', 5, 1246, 1),
(1336, 'Placa:', NULL, NULL, NULL, 0, '2018-07-31 16:27:11', 5, 1246, 2),
(1337, 'Caño de Bancada Central-Aceite', NULL, NULL, NULL, 0, '2018-07-31 17:28:52', 4, 1247, 1),
(1338, 'Angulo de Brunido', NULL, NULL, NULL, 0, '2018-07-31 17:29:03', 4, 1247, 2),
(1339, 'Largo de Tornillos de Bancadas y Bielas', NULL, NULL, NULL, 0, '2018-07-31 17:29:11', 4, 1247, 3),
(1340, 'Tapones Varios y Medidas', NULL, NULL, NULL, 0, '2018-07-31 17:29:25', 4, 1247, 4),
(1341, 'Taponar Cigueñal', NULL, NULL, NULL, 0, '2018-07-31 17:30:46', 4, 1247, 5),
(1342, 'Escuadra de Pistones', NULL, NULL, NULL, 0, '2018-07-31 17:30:57', 4, 1247, 6),
(1343, 'Medir Centros de Agujeros, Pistones', NULL, NULL, NULL, 0, '2018-07-31 17:31:12', 4, 1247, 7),
(1344, 'Excentricos 1518 y 1114', NULL, NULL, NULL, 0, '2018-07-31 17:31:21', 4, 1247, 8),
(1345, 'Medir Reten de Bancada.', NULL, NULL, NULL, 0, '2018-07-31 17:31:29', 4, 1247, 9),
(1346, 'Controlar Rosca, Cigueñal varios y Reten', NULL, NULL, NULL, 0, '2018-07-31 17:31:36', 4, 1247, 10),
(1347, 'Altura Pistones', NULL, NULL, NULL, 0, '2018-07-31 17:31:44', 4, 1247, 11),
(1348, 'Engranaje Bomba de Aceite, varios', NULL, NULL, NULL, 0, '2018-07-31 17:31:55', 4, 1247, 12),
(1349, 'Piezas de alumino, varios', NULL, NULL, NULL, 0, '2018-07-31 17:32:29', 4, 1247, 5),
(1350, 'Seguro de Pistones, varios', NULL, NULL, NULL, 0, '2018-07-31 17:32:37', 4, 1247, 12),
(1351, 'Botadores si pasan por el Block y da, medidas varias', NULL, NULL, NULL, 0, '2018-07-31 17:32:47', 4, 1247, 13),
(1352, 'Medidas eje, Mando Perkins 6354', NULL, NULL, NULL, 0, '2018-07-31 17:32:56', 4, 1247, 14),
(1353, 'Tapones Lubricacion de Eje, Mando Perkins 6354', NULL, NULL, NULL, 0, '2018-07-31 17:33:04', 4, 1247, 5),
(1354, 'Controlar engranaje de Arbol de Levas y Bomba de', NULL, NULL, NULL, 0, '2018-07-31 17:33:14', 4, 1247, 12),
(1355, 'Aceite, si estan hermanadas', NULL, NULL, NULL, 0, '2018-07-31 17:33:22', 4, 1247, 13),
(1356, 'Luz entre Dientes de engranajes de Distribucion', NULL, NULL, NULL, 0, '2018-07-31 17:33:34', 4, 1247, 14),
(1357, 'Carcaza de Distribucion, Leva y Bomba Inyectora', NULL, NULL, NULL, 0, '2018-07-31 17:34:55', 4, 1247, 5),
(1358, 'Conducto Aceite - Muñon de Leva y de Compresor', NULL, NULL, NULL, 0, '2018-07-31 17:35:06', 4, 1247, 6),
(1359, 'Ruleman de cola de Cigueñal', NULL, NULL, NULL, 0, '2018-07-31 17:35:15', 4, 1247, 14),
(1360, 'Biselado de conductos de aceites del Cigueñal', NULL, NULL, NULL, 0, '2018-07-31 17:35:24', 4, 1247, 15),
(1361, 'Block Rellenado:', NULL, NULL, NULL, 0, '2018-07-31 17:38:08', 5, 1247, 16),
(1362, 'Soldado:', NULL, NULL, NULL, 0, '2018-07-31 17:38:21', 5, 1247, 17),
(1363, 'Lugar:', NULL, NULL, NULL, 0, '2018-07-31 17:41:07', 5, 1247, 18),
(1364, 'Torsion de Cigueñal', NULL, NULL, NULL, 0, '2018-07-31 17:41:47', 4, 1247, 19),
(1365, 'Chapa de Identificacion', NULL, NULL, NULL, 0, '2018-07-31 17:42:00', 4, 1247, 20),
(1366, 'Desplazamiento de Carcaza, Distribucion', NULL, NULL, NULL, 0, '2018-07-31 17:42:11', 4, 1247, 20),
(1367, 'Controlar Tornillos de Contrapesos y apretar', NULL, NULL, NULL, 0, '2018-07-31 17:42:21', 4, 1247, 14),
(1368, 'Apretar con Kilos o Grados', NULL, NULL, NULL, 0, '2018-07-31 17:42:36', 4, 1247, 15),
(1369, 'Indique apriete de Biela', NULL, NULL, NULL, 0, '2018-07-31 17:42:50', 4, 1247, 20),
(1370, 'Indique apriete de Bancada', NULL, NULL, NULL, 0, '2018-07-31 17:42:59', 4, 1247, 14),
(1371, 'Semi-Armado', NULL, NULL, NULL, 0, '2018-07-31 18:07:04', 3, 1248, 1),
(1372, 'Armado Completo', NULL, NULL, NULL, 0, '2018-07-31 18:07:18', 3, 1248, 2),
(1373, 'Motor:', NULL, NULL, NULL, 0, '2018-07-31 18:07:32', 5, 1248, 3),
(1379, 'Realizar', NULL, NULL, NULL, 0, '2018-07-31 18:17:02', 2, 1250, 1),
(1380, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:17:30', 4, 1250, 2),
(1381, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:17:39', 2, 1250, 3),
(1382, 'Realizar', NULL, NULL, NULL, 0, '2018-07-31 18:18:16', 2, 1251, 1),
(1383, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:18:23', 4, 1251, 2),
(1384, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:18:30', 2, 1251, 3),
(1385, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:19:38', 2, 1252, 1),
(1386, 'Observacion:', NULL, NULL, NULL, 0, '2018-07-31 18:19:51', 4, 1252, 2),
(1387, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:19:56', 2, 1252, 3),
(1388, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:21:12', 2, 1253, 1),
(1389, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:21:21', 4, 1253, 2),
(1390, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:21:34', 2, 1253, 3),
(1391, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:22:15', 2, 1254, 1),
(1392, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:22:32', 4, 1254, 2),
(1393, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:22:38', 2, 1254, 3),
(1394, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:23:12', 2, 1255, 1),
(1395, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:23:33', 4, 1255, 2),
(1396, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:23:45', 2, 1255, 3),
(1397, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:24:28', 2, 1256, 1),
(1398, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:24:41', 4, 1256, 2),
(1399, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:24:46', 2, 1256, 3),
(1400, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:25:55', 2, 1257, 1),
(1401, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:26:11', 4, 1257, 2),
(1402, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:26:17', 2, 1257, 3),
(1403, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:27:08', 2, 1258, 1),
(1404, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:27:19', 4, 1258, 2),
(1405, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:27:26', 2, 1258, 3),
(1406, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:28:07', 2, 1259, 1),
(1407, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:28:23', 4, 1259, 2),
(1408, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:28:30', 2, 1259, 3),
(1409, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:29:36', 2, 1260, 1),
(1410, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:29:45', 4, 1260, 2),
(1411, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:29:50', 2, 1260, 3),
(1412, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:30:32', 2, 1261, 1),
(1413, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:30:48', 4, 1261, 2),
(1414, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:30:53', 2, 1261, 3),
(1415, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:32:14', 2, 1262, 1),
(1416, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:32:27', 4, 1262, 2),
(1417, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:32:33', 2, 1262, 3),
(1418, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:33:03', 2, 1263, 1),
(1419, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:33:11', 4, 1263, 2),
(1420, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:33:20', 2, 1263, 3),
(1421, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:33:59', 2, 1264, 1),
(1422, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:34:05', 4, 1264, 2),
(1423, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:34:10', 2, 1264, 3),
(1424, 'Motivo:', NULL, NULL, NULL, 0, '2018-07-31 18:35:53', 4, 1265, 1),
(1425, 'Fecha:', NULL, NULL, NULL, 0, '2018-07-31 18:35:59', 5, 1265, 2),
(1426, 'Motivo:', NULL, NULL, NULL, 0, '2018-07-31 18:36:17', 4, 1266, 1),
(1427, 'Fecha:', NULL, NULL, NULL, 0, '2018-07-31 18:36:23', 5, 1266, 2),
(1428, 'Motivo:', NULL, NULL, NULL, 0, '2018-07-31 18:36:48', 4, 1267, 1),
(1429, 'Fecha:', NULL, NULL, NULL, 0, '2018-07-31 18:36:54', 5, 1267, 2),
(1430, 'Semi-Armado', NULL, NULL, NULL, 0, '2018-07-31 18:45:06', 3, 1268, 1),
(1431, 'Armado Completo', NULL, NULL, NULL, 0, '2018-07-31 18:45:16', 3, 1268, 2),
(1432, 'Motor:', NULL, NULL, NULL, 0, '2018-07-31 18:45:22', 5, 1268, 3),
(1433, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:47:01', 2, 1269, 1),
(1434, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:47:08', 4, 1269, 2),
(1435, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:47:25', 2, 1269, 3),
(1436, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:48:34', 2, 1270, 1),
(1437, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:48:42', 4, 1270, 2),
(1438, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:49:32', 2, 1270, 3),
(1439, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:50:20', 2, 1271, 1),
(1440, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:50:34', 4, 1271, 2),
(1441, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:50:48', 2, 1271, 3),
(1442, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:52:47', 2, 1272, 1),
(1443, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:52:58', 4, 1272, 2),
(1444, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:53:11', 2, 1272, 3),
(1445, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:53:58', 2, 1273, 1),
(1446, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:54:13', 4, 1273, 2),
(1447, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:54:21', 2, 1273, 3),
(1448, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:55:03', 2, 1274, 1),
(1449, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:55:08', 4, 1274, 2),
(1450, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:55:14', 2, 1274, 3),
(1451, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:55:57', 2, 1275, 1),
(1452, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:56:05', 4, 1275, 2),
(1453, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:56:11', 2, 1275, 3),
(1454, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:57:24', 2, 1276, 1),
(1455, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:57:31', 4, 1276, 2),
(1456, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:57:41', 2, 1276, 3),
(1457, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:58:44', 2, 1277, 1),
(1458, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:58:51', 4, 1277, 2),
(1459, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:58:57', 2, 1277, 3),
(1460, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 18:59:33', 2, 1278, 1),
(1461, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 18:59:42', 4, 1278, 2),
(1462, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 18:59:48', 2, 1278, 3),
(1463, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:00:20', 2, 1279, 1),
(1464, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:00:40', 4, 1279, 2),
(1465, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:00:47', 2, 1279, 3),
(1466, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:01:31', 2, 1280, 1),
(1467, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:01:55', 4, 1280, 2),
(1468, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:02:02', 2, 1280, 3),
(1469, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:11:13', 2, 1281, 1),
(1470, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:11:20', 4, 1281, 2),
(1471, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:11:26', 2, 1281, 3),
(1472, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:12:13', 2, 1282, 1),
(1473, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:12:18', 4, 1282, 2),
(1474, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:12:34', 2, 1282, 3),
(1475, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:13:06', 2, 1283, 1),
(1476, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:13:15', 4, 1283, 2),
(1477, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:13:23', 2, 1283, 3),
(1478, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:14:26', 2, 1284, 1),
(1479, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:14:34', 4, 1284, 2),
(1480, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:14:44', 2, 1284, 3),
(1481, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:15:35', 2, 1285, 1),
(1482, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:15:53', 4, 1285, 2),
(1483, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:16:02', 2, 1285, 3),
(1484, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:16:50', 2, 1286, 1),
(1485, 'Observaciones:(Tapon...kg  Tornillos...kg)', NULL, NULL, NULL, 0, '2018-07-31 19:17:29', 4, 1286, 2),
(1486, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:17:36', 2, 1286, 3),
(1487, 'Motivo:', NULL, NULL, NULL, 0, '2018-07-31 19:19:26', 4, 1287, 1),
(1488, 'Fecha:', NULL, NULL, NULL, 0, '2018-07-31 19:19:32', 5, 1287, 2),
(1489, 'Motivo:', NULL, NULL, NULL, 0, '2018-07-31 19:19:39', 4, 1289, 1),
(1490, 'Fecha:', NULL, NULL, NULL, 0, '2018-07-31 19:19:45', 5, 1289, 2),
(1491, 'Motivo:', NULL, NULL, NULL, 0, '2018-07-31 19:19:51', 4, 1290, 1),
(1492, 'Fecha:', NULL, NULL, NULL, 0, '2018-07-31 19:19:56', 5, 1290, 2),
(1493, 'Semi-Armado', NULL, NULL, NULL, 0, '2018-07-31 19:22:41', 3, 1291, 1),
(1494, 'Armado Completo', NULL, NULL, NULL, 0, '2018-07-31 19:22:51', 3, 1291, 2),
(1495, 'Motor:', NULL, NULL, NULL, 0, '2018-07-31 19:22:57', 5, 1291, 3),
(1496, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:23:28', 2, 1292, 1),
(1497, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:23:35', 4, 1292, 2),
(1498, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:23:40', 2, 1292, 3),
(1499, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:24:19', 2, 1293, 1),
(1500, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:24:31', 4, 1293, 2),
(1501, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:24:56', 2, 1293, 3),
(1502, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:25:51', 2, 1294, 1),
(1504, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:26:04', 2, 1294, 3),
(1505, 'Kg:', NULL, NULL, NULL, 0, '2018-07-31 19:28:08', 5, 1294, 4),
(1506, 'Grados:', NULL, NULL, NULL, 0, '2018-07-31 19:28:20', 5, 1294, 5),
(1507, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:28:46', 2, 1295, 1),
(1508, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:28:57', 4, 1295, 2),
(1509, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:29:02', 2, 1295, 3),
(1510, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:29:51', 2, 1296, 1),
(1511, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:29:59', 4, 1296, 2),
(1512, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:30:08', 2, 1296, 3),
(1513, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:30:41', 2, 1297, 1),
(1514, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:30:49', 4, 1297, 2),
(1515, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:30:56', 2, 1297, 3),
(1516, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:31:51', 2, 1298, 1),
(1517, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:31:59', 4, 1298, 2),
(1518, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:32:05', 2, 1298, 3),
(1519, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:32:42', 2, 1299, 1),
(1520, 'Kg:', NULL, NULL, NULL, 0, '2018-07-31 19:33:01', 5, 1299, 2),
(1521, 'Grados:', NULL, NULL, NULL, 0, '2018-07-31 19:33:07', 5, 1299, 3),
(1522, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:33:14', 2, 1299, 4),
(1523, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:33:47', 2, 1300, 1),
(1524, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:34:05', 4, 1300, 2),
(1525, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:34:09', 2, 1300, 3),
(1526, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:34:39', 2, 1301, 1),
(1528, 'Kg:', NULL, NULL, NULL, 0, '2018-07-31 19:35:13', 5, 1301, 2),
(1529, 'Grados:', NULL, NULL, NULL, 0, '2018-07-31 19:35:29', 5, 1301, 3),
(1530, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:35:43', 2, 1301, 4),
(1531, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:36:15', 2, 1302, 1),
(1532, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:36:33', 4, 1302, 2),
(1533, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:36:43', 2, 1302, 3),
(1534, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:37:17', 2, 1303, 1),
(1535, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:37:54', 4, 1303, 2),
(1536, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:38:00', 2, 1303, 3),
(1537, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:39:25', 2, 1304, 1),
(1538, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:39:59', 4, 1304, 2),
(1539, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:40:06', 2, 1304, 3),
(1540, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:40:47', 2, 1305, 1),
(1542, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:41:08', 2, 1305, 3),
(1543, 'Kg:', NULL, NULL, NULL, 0, '2018-07-31 19:41:41', 5, 1305, 4),
(1544, 'Grados:', NULL, NULL, NULL, 0, '2018-07-31 19:41:47', 5, 1305, 5),
(1545, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:42:11', 2, 1306, 1),
(1546, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:42:25', 4, 1306, 2),
(1547, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:42:30', 2, 1306, 3),
(1548, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:43:01', 2, 1307, 1),
(1549, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:43:10', 4, 1307, 2),
(1550, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:43:16', 2, 1307, 3),
(1551, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:44:04', 2, 1308, 1),
(1552, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:44:10', 4, 1308, 2),
(1553, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:44:18', 2, 1308, 3),
(1554, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:45:36', 2, 1309, 1),
(1555, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:45:43', 4, 1309, 2),
(1556, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:45:50', 2, 1309, 3),
(1557, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:46:27', 2, 1310, 1),
(1558, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:46:42', 4, 1310, 2),
(1559, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:46:58', 2, 1310, 3),
(1560, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:47:39', 2, 1311, 1),
(1561, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:47:48', 4, 1311, 2),
(1562, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:48:03', 2, 1311, 3),
(1563, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:48:55', 2, 1312, 1),
(1564, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:49:04', 4, 1312, 2),
(1565, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:49:11', 2, 1312, 3),
(1566, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:49:54', 2, 1313, 1),
(1567, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:50:00', 4, 1313, 2),
(1568, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:50:06', 2, 1313, 3),
(1569, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:50:44', 2, 1314, 1),
(1570, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:50:59', 4, 1314, 2),
(1571, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:51:07', 2, 1314, 3),
(1572, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:51:33', 2, 1315, 1),
(1573, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:51:51', 4, 1315, 2),
(1574, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:51:57', 2, 1315, 3),
(1575, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:52:27', 2, 1316, 1),
(1576, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:52:45', 4, 1316, 2),
(1577, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 19:52:51', 2, 1316, 3),
(1578, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 19:53:51', 2, 1317, 1),
(1579, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 19:54:24', 4, 1317, 2),
(1580, 'Estados:', NULL, NULL, NULL, 0, '2018-07-31 19:54:38', 2, 1317, 3),
(1581, 'Motivo:', NULL, NULL, NULL, 0, '2018-07-31 19:55:24', 4, 1318, 1),
(1582, 'Motivo:', NULL, NULL, NULL, 0, '2018-07-31 19:55:27', 4, 1319, 1),
(1583, 'Motivo:', NULL, NULL, NULL, 0, '2018-07-31 19:55:32', 4, 1320, 1),
(1584, 'Fecha:', NULL, NULL, NULL, 0, '2018-07-31 19:55:42', 5, 1318, 2),
(1585, 'Fecha:', NULL, NULL, NULL, 0, '2018-07-31 19:55:46', 5, 1319, 2),
(1586, 'Fecha:', NULL, NULL, NULL, 0, '2018-07-31 19:55:53', 5, 1320, 2),
(1587, 'Semi-Armado:', NULL, NULL, NULL, 0, '2018-07-31 20:00:26', 3, 1321, 1);
INSERT INTO `frm_valores` (`VALO_ID`, `NOMBRE`, `PISTA`, `LONGITUD`, `VALOR_DEFECTO`, `OBLIGATORIO`, `FEC_CREACION`, `TIDA_ID`, `GRUP_ID`, `ORDEN`) VALUES
(1588, 'Armado Completo:', NULL, NULL, NULL, 0, '2018-07-31 20:00:36', 3, 1321, 2),
(1589, 'Motor:', NULL, NULL, NULL, 0, '2018-07-31 20:00:43', 5, 1321, 3),
(1590, 'Motivo:', NULL, NULL, NULL, 0, '2018-07-31 20:06:06', 4, 1357, 1),
(1591, 'Motivo:', NULL, NULL, NULL, 0, '2018-07-31 20:06:10', 4, 1359, 1),
(1592, 'Motivo:', NULL, NULL, NULL, 0, '2018-07-31 20:06:15', 4, 1360, 1),
(1593, 'Fecha:', NULL, NULL, NULL, 0, '2018-07-31 20:06:26', 5, 1357, 2),
(1594, 'Fecha:', NULL, NULL, NULL, 0, '2018-07-31 20:06:30', 5, 1359, 2),
(1595, 'Fecha:', NULL, NULL, NULL, 0, '2018-07-31 20:06:34', 5, 1360, 2),
(1596, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:06:51', 2, 1322, 1),
(1597, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:06:56', 2, 1323, 1),
(1598, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:07:00', 2, 1324, 1),
(1599, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:07:05', 2, 1325, 1),
(1600, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:07:09', 2, 1326, 1),
(1601, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:07:13', 2, 1327, 1),
(1602, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:07:17', 2, 1328, 1),
(1603, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:07:22', 2, 1329, 1),
(1604, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:07:27', 2, 1330, 1),
(1605, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:07:32', 2, 1331, 1),
(1606, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:07:39', 2, 1332, 1),
(1607, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:07:47', 2, 1333, 1),
(1608, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:07:51', 2, 1334, 1),
(1609, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:07:56', 2, 1335, 1),
(1610, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:08:01', 2, 1336, 1),
(1611, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:08:07', 2, 1337, 1),
(1612, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:08:18', 2, 1338, 1),
(1613, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:08:25', 2, 1339, 1),
(1614, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:08:30', 2, 1340, 1),
(1615, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:08:36', 2, 1341, 1),
(1616, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:08:41', 2, 1342, 1),
(1617, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:08:45', 2, 1343, 1),
(1618, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:08:49', 2, 1344, 1),
(1619, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:08:54', 2, 1345, 1),
(1620, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:08:59', 2, 1346, 1),
(1621, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:09:04', 2, 1347, 1),
(1622, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:09:08', 2, 1348, 1),
(1623, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:09:14', 2, 1349, 1),
(1624, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:09:19', 2, 1350, 1),
(1625, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:09:23', 2, 1351, 1),
(1626, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:09:27', 2, 1352, 1),
(1627, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:09:36', 2, 1353, 1),
(1628, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:09:42', 2, 1354, 1),
(1629, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:09:47', 2, 1355, 1),
(1630, 'Realizar:', NULL, NULL, NULL, 0, '2018-07-31 20:09:56', 2, 1356, 1),
(1631, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:15:51', 4, 1322, 2),
(1632, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:15:58', 4, 1323, 2),
(1633, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:16:03', 4, 1324, 2),
(1634, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:16:08', 4, 1325, 2),
(1635, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:16:12', 4, 1326, 2),
(1636, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:16:17', 4, 1327, 2),
(1637, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:16:22', 4, 1328, 2),
(1638, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:16:27', 4, 1329, 2),
(1639, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:16:31', 4, 1330, 2),
(1640, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:16:35', 4, 1331, 2),
(1641, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:16:41', 4, 1332, 2),
(1642, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:16:46', 4, 1333, 2),
(1643, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:16:53', 4, 1334, 2),
(1644, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:17:00', 4, 1335, 2),
(1645, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:17:04', 4, 1336, 2),
(1646, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:17:09', 4, 1337, 2),
(1647, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:17:21', 4, 1338, 2),
(1648, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:17:26', 4, 1339, 2),
(1649, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:17:31', 4, 1340, 2),
(1650, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:17:35', 4, 1341, 2),
(1651, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:17:43', 4, 1342, 2),
(1652, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:17:47', 4, 1343, 2),
(1653, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:17:52', 4, 1344, 2),
(1654, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:17:56', 4, 1345, 2),
(1655, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:18:01', 4, 1346, 2),
(1656, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:18:08', 4, 1347, 2),
(1657, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:18:11', 4, 1348, 2),
(1658, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:18:16', 4, 1349, 2),
(1659, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:18:20', 4, 1350, 2),
(1660, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:18:25', 4, 1351, 2),
(1661, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:18:30', 4, 1352, 2),
(1662, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:18:34', 4, 1353, 2),
(1663, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:18:39', 4, 1354, 2),
(1664, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:18:43', 4, 1355, 2),
(1665, 'Observaciones:', NULL, NULL, NULL, 0, '2018-07-31 20:18:50', 4, 1356, 2),
(1666, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:19:06', 2, 1322, 3),
(1667, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:19:10', 2, 1323, 3),
(1668, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:19:14', 2, 1324, 3),
(1669, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:19:18', 2, 1325, 3),
(1670, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:19:22', 2, 1326, 3),
(1671, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:19:26', 2, 1327, 3),
(1672, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:19:30', 2, 1328, 3),
(1673, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:19:37', 2, 1329, 3),
(1674, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:19:41', 2, 1330, 3),
(1675, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:19:47', 2, 1331, 3),
(1676, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:19:52', 2, 1332, 3),
(1677, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:19:56', 2, 1333, 3),
(1678, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:20:00', 2, 1334, 3),
(1679, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:20:05', 2, 1335, 3),
(1680, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:20:12', 2, 1336, 3),
(1681, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:20:17', 2, 1337, 3),
(1682, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:20:21', 2, 1338, 3),
(1683, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:20:25', 2, 1339, 3),
(1684, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:20:29', 2, 1340, 3),
(1685, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:20:33', 2, 1341, 3),
(1686, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:20:38', 2, 1342, 3),
(1687, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:20:44', 2, 1343, 3),
(1688, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:20:50', 2, 1344, 3),
(1689, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:20:58', 2, 1345, 3),
(1690, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:21:02', 2, 1346, 3),
(1691, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:21:06', 2, 1347, 3),
(1692, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:21:10', 2, 1348, 3),
(1693, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:21:15', 2, 1349, 3),
(1694, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:21:20', 2, 1350, 3),
(1695, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:21:25', 2, 1351, 3),
(1696, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:21:29', 2, 1352, 3),
(1697, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:21:34', 2, 1353, 3),
(1698, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:21:39', 2, 1354, 3),
(1699, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:21:44', 2, 1355, 3),
(1700, 'Estado:', NULL, NULL, NULL, 0, '2018-07-31 20:21:49', 2, 1356, 3),
(1701, '01:', NULL, NULL, NULL, 0, '2018-08-03 15:50:43', 3, 314, 1),
(1702, '02:', NULL, NULL, NULL, 0, '2018-08-03 15:50:50', 3, 314, 2),
(1703, '03:', NULL, NULL, NULL, 0, '2018-08-03 15:50:54', 3, 314, 3),
(1704, '04:', NULL, NULL, NULL, 0, '2018-08-03 15:50:59', 3, 314, 4),
(1705, '05:', NULL, NULL, NULL, 0, '2018-08-03 15:51:10', 3, 314, 5),
(1706, '06:', NULL, NULL, NULL, 0, '2018-08-03 15:51:16', 3, 314, 6),
(1707, '08:', NULL, NULL, NULL, 0, '2018-08-03 15:51:33', 3, 314, 7),
(1708, '12', NULL, NULL, NULL, 0, '2018-08-03 15:52:56', 3, 314, 8),
(1709, '16', NULL, NULL, NULL, 0, '2018-08-03 15:53:00', 3, 314, 9),
(1710, 'n', NULL, NULL, NULL, 0, '2018-08-03 15:53:05', 3, 314, 10),
(1711, 'Obsevaciones:', NULL, NULL, NULL, 0, '2018-08-03 16:15:01', 4, 314, 13),
(1712, 'Indique: Ovalos / Conicidad y Altura:', NULL, NULL, NULL, 0, '2018-08-03 18:26:50', 4, 338, 2),
(1713, 'Indique: Ovalos / Conicidad y Altura:', NULL, NULL, NULL, 0, '2018-08-03 18:27:00', 4, 339, 2),
(1714, 'Indique: Ovalos / Conicidad y Altura:', NULL, NULL, NULL, 0, '2018-08-03 18:27:05', 4, 340, 2),
(1715, 'Indique: Ovalos / Conicidad y Altura:', NULL, NULL, NULL, 0, '2018-08-03 18:27:11', 4, 341, 2),
(1716, 'Indique: Ovalos / Conicidad y Altura:', NULL, NULL, NULL, 0, '2018-08-03 18:27:18', 4, 342, 2),
(1717, 'Indique: Ovalos / Conicidad y Altura:', NULL, NULL, NULL, 0, '2018-08-03 18:27:23', 4, 343, 2),
(1718, 'Indique: Ovalos / Conicidad y Altura:', NULL, NULL, NULL, 0, '2018-08-03 18:27:28', 4, 344, 2),
(1719, 'Indique: Ovalos / Conicidad y Altura:', NULL, NULL, NULL, 0, '2018-08-03 18:27:34', 4, 345, 2),
(1720, 'Indique: Ovalos / Conicidad y Altura:', NULL, NULL, NULL, 0, '2018-08-03 18:27:40', 4, 346, 2),
(1724, '(*)Indique valor', NULL, NULL, NULL, 0, '2018-08-03 19:48:17', 5, 97, 2),
(1725, '(*)Indique valor', NULL, NULL, NULL, 0, '2018-08-03 19:48:25', 5, 98, 2),
(1726, '(*)Indique valor', NULL, NULL, NULL, 0, '2018-08-03 19:48:31', 5, 99, 2),
(1727, '(*)Indique valor', NULL, NULL, NULL, 0, '2018-08-03 19:48:38', 5, 101, 2),
(1728, '(*)Indique valor', NULL, NULL, NULL, 0, '2018-08-03 19:48:44', 5, 102, 2),
(1729, '(*)Indique valor', NULL, NULL, NULL, 0, '2018-08-03 19:48:49', 5, 103, 2),
(1730, '(*)Indique valor', NULL, NULL, NULL, 0, '2018-08-03 19:48:58', 5, 104, 2),
(1731, '(*)Indique valor', NULL, NULL, NULL, 0, '2018-08-03 19:49:02', 5, 105, 2),
(1732, '(*)Indique valor', NULL, NULL, NULL, 0, '2018-08-03 19:49:07', 5, 106, 2),
(1733, '(*)Indique valor', NULL, NULL, NULL, 0, '2018-08-03 19:49:12', 5, 107, 2),
(1734, '(*)Indique valor', NULL, NULL, NULL, 0, '2018-08-03 19:49:50', 5, 108, 2),
(1735, '(*)Indique valor', NULL, NULL, NULL, 0, '2018-08-03 19:49:56', 5, 109, 2),
(1736, '(*)Indique valor', NULL, NULL, NULL, 0, '2018-08-03 19:50:03', 5, 110, 2),
(1737, '(*)Indique valor', NULL, NULL, NULL, 0, '2018-08-03 19:50:09', 5, 111, 2),
(1738, '(*)Indique valor', NULL, NULL, NULL, 0, '2018-08-03 19:50:21', 5, 112, 2),
(1739, '(*)Indique valor', NULL, NULL, NULL, 0, '2018-08-03 19:50:27', 5, 113, 2),
(1740, '(*)Indique valor', NULL, NULL, NULL, 0, '2018-08-03 19:50:33', 5, 114, 2),
(1742, '', NULL, NULL, NULL, 0, '2018-08-03 20:20:55', 4, 1363, 1),
(2000, 'Legajo en Mano', NULL, NULL, NULL, 0, '2018-08-07 14:44:43', 3, 2000, 1),
(2001, 'Planilla de “Registro de recepcio?n de componente”, se encuentra en el Legajo.', NULL, NULL, NULL, 0, '2018-08-07 14:44:59', 3, 2000, 2),
(2002, '“Remito del cliente”, aplica solo si a trai?do. Se encuentra en el Legajo.', NULL, NULL, NULL, 0, '2018-08-07 14:45:10', 3, 2000, 3),
(2003, 'Planilla de “Registro de pedido de materiales interior y exterior”, se encuentra en el Legajo.', NULL, NULL, NULL, 0, '2018-08-07 14:45:42', 3, 2000, 4),
(2004, 'Fotos del componente, impreso o con acceso en pantalla.', NULL, NULL, NULL, 0, '2018-08-07 14:45:52', 3, 2000, 5),
(2005, 'Ca?mara de Fotos, sera? necesario para registrar que se esta? despachando.', NULL, NULL, NULL, 0, '2018-08-07 14:46:49', 3, 2000, 6),
(2006, 'Planilla de “Remito de despacho de componente”, se encuentra en el Legajo.', NULL, NULL, NULL, 0, '2018-08-07 14:47:32', 3, 2000, 7),
(2008, 'Se encuentran todos los i?tems nombrados en ella', NULL, NULL, NULL, 0, '2018-08-07 14:52:14', 3, 2002, 1),
(2009, 'Esta todo lo descripto en el remito del cliente.', NULL, NULL, NULL, 0, '2018-08-07 14:55:43', 3, 2003, 1),
(2010, 'Se encuentran todos los i?tems nombrados en ella', NULL, NULL, NULL, 0, '2018-08-07 14:56:38', 3, 2004, 1),
(2011, 'Se encuentran todos los componentes tal cual muestran las fotos', NULL, NULL, NULL, 0, '2018-08-07 14:57:15', 3, 2005, 1),
(2012, 'No ha quedado ningu?n repuesto, insumo, componente, etc. de este interno en almace?n', NULL, NULL, NULL, 0, '2018-08-07 14:57:47', 3, 2006, 1),
(2013, 'Arne?s ele?ctrico SIN cables cortados', NULL, NULL, NULL, 0, '2018-08-07 14:59:04', 3, 2007, 1),
(2014, 'Arne?s ele?ctrico SIN cables sueltos', NULL, NULL, NULL, 0, '2018-08-07 14:59:32', 3, 2007, 2),
(2015, 'Arne?s ele?ctrico SIN cables pelados', NULL, NULL, NULL, 0, '2018-08-07 14:59:46', 3, 2007, 3),
(2016, 'Arne?s ele?ctrico SIN cintas y/o corrugado protector roto o suelto', NULL, NULL, NULL, 0, '2018-08-07 14:59:55', 3, 2007, 4),
(2017, 'Arne?s ele?ctrico SIN sujetadores, precintos, agarres varios suelto', NULL, NULL, NULL, 0, '2018-08-07 15:00:05', 3, 2007, 5),
(2018, 'Arne?s ele?ctrico SIN fichas y/o conectores rotos', NULL, NULL, NULL, 0, '2018-08-07 15:00:19', 3, 2007, 6),
(2019, 'Carter y protecciones varias sin abolladuras', NULL, NULL, NULL, 0, '2018-08-07 15:00:28', 3, 2007, 7),
(2020, 'Sin traspiraciones y/o pe?rdida de aceites', NULL, NULL, NULL, 0, '2018-08-07 15:00:37', 3, 2007, 8),
(2021, 'Sin pe?rdida de refrigerante y/o algu?n fluido', NULL, NULL, NULL, 0, '2018-08-07 15:00:47', 3, 2007, 9),
(2022, 'Controlar que la boca de admisio?n, escape, can?eri?as varias de ingreso y/o egreso de algu?n fluido este?n con sus tapones correspondiente. En caso de no tener tapo?n se debe tapar con algu?n insumo.', NULL, NULL, NULL, 0, '2018-08-07 15:00:58', 3, 2007, 10),
(2023, 'Cuna o soporte adecuado (ante la duda consultar a coordinador)', NULL, NULL, NULL, 0, '2018-08-07 15:01:08', 3, 2007, 11),
(2024, 'Tomar fotos del estado del componente a despachar', NULL, NULL, NULL, 0, '2018-08-07 15:01:48', 3, 2008, 1),
(2025, 'Realizar remito de salida, marcar todo los componentes incluyendo repuestos nuevos y/o usados.', NULL, NULL, NULL, 0, '2018-08-07 15:02:53', 3, 2009, 1),
(2026, 'Observacion:', NULL, NULL, NULL, 0, '2018-08-07 15:03:33', 4, 2010, 1),
(2047, 'Realizar:', NULL, NULL, NULL, 0, '2018-08-07 15:23:43', 2, 2013, 1),
(2048, 'Observacion:', NULL, NULL, NULL, 0, '2018-08-07 15:24:01', 4, 2013, 2),
(2049, 'Realizar:', NULL, NULL, NULL, 0, '2018-08-07 15:24:22', 2, 2014, 1),
(2050, 'Observacion:', NULL, NULL, NULL, 0, '2018-08-07 15:24:52', 4, 2014, 2),
(2051, 'Realizar:', NULL, NULL, NULL, 0, '2018-08-07 15:25:17', 2, 2016, 1),
(2052, 'Observacion:', NULL, NULL, NULL, 0, '2018-08-07 15:25:37', 4, 2016, 2),
(2053, 'Realizar:', NULL, NULL, NULL, 0, '2018-08-07 15:32:58', 2, 2017, 1),
(2054, 'Observacion:', NULL, NULL, NULL, 0, '2018-08-07 15:33:38', 4, 2017, 2),
(2055, 'Estado:', NULL, NULL, NULL, 0, '2018-08-07 15:33:51', 2, 2017, 3),
(2056, 'Realizar:', NULL, NULL, NULL, 0, '2018-08-07 15:35:21', 2, 2018, 1),
(2057, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 15:35:41', 4, 2018, 2),
(2059, 'Realizar:', NULL, NULL, NULL, 0, '2018-08-07 15:36:11', 2, 2019, 1),
(2060, 'Observacion:', NULL, NULL, NULL, 0, '2018-08-07 15:36:27', 4, 2019, 2),
(2061, 'Realizar:', NULL, NULL, NULL, 0, '2018-08-07 15:36:58', 2, 2020, 1),
(2062, 'Observacion:', NULL, NULL, NULL, 0, '2018-08-07 15:37:21', 4, 2020, 2),
(2063, 'Realizar:', NULL, NULL, NULL, 0, '2018-08-07 15:37:57', 2, 2021, 1),
(2064, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 15:39:03', 4, 2021, 2),
(2065, 'Realizar:', NULL, NULL, NULL, 0, '2018-08-07 15:39:37', 2, 2022, 1),
(2066, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 15:39:54', 4, 2022, 2),
(2067, 'Estado:', NULL, NULL, NULL, 0, '2018-08-07 15:40:00', 2, 2022, 3),
(2068, 'Realizar:', NULL, NULL, NULL, 0, '2018-08-07 15:41:55', 2, 2023, 1),
(2069, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 15:42:09', 4, 2023, 2),
(2070, 'Estado:', NULL, NULL, NULL, 0, '2018-08-07 15:42:16', 2, 2023, 3),
(2071, 'Realizar:', NULL, NULL, NULL, 0, '2018-08-07 15:43:48', 2, 2024, 1),
(2072, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 15:45:11', 2, 2024, 2),
(2073, 'Realizar:', NULL, NULL, NULL, 0, '2018-08-07 15:46:16', 2, 2025, 1),
(2074, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 15:46:31', 4, 2025, 2),
(2075, 'Realizar:', NULL, NULL, NULL, 0, '2018-08-07 15:47:07', 2, 2026, 1),
(2076, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 15:47:25', 4, 2026, 2),
(2077, 'Estado:', NULL, NULL, NULL, 0, '2018-08-07 15:47:32', 2, 2026, 3),
(2078, 'Realizar:', NULL, NULL, NULL, 0, '2018-08-07 15:48:01', 2, 2027, 1),
(2079, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 15:48:28', 4, 2027, 2),
(2080, 'Estado:', NULL, NULL, NULL, 0, '2018-08-07 15:48:44', 2, 2027, 3),
(2081, 'Realizar:', NULL, NULL, NULL, 0, '2018-08-07 15:49:11', 2, 2028, 1),
(2083, 'Luz de Valvula:', NULL, NULL, NULL, 0, '2018-08-07 15:49:47', 4, 2028, 2),
(2084, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 16:27:14', 2, 2029, 1),
(2085, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 16:27:50', 4, 2029, 2),
(2086, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 16:28:31', 2, 2030, 1),
(2087, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 16:29:18', 4, 2030, 2),
(2088, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 16:29:45', 2, 2031, 1),
(2089, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 16:30:14', 4, 2031, 2),
(2090, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 16:31:41', 2, 2032, 1),
(2091, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 16:31:47', 4, 2032, 2),
(2093, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 16:32:26', 2, 2033, 1),
(2094, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 16:32:53', 4, 2033, 2),
(2095, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 16:33:27', 2, 2034, 1),
(2096, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 16:33:38', 4, 2034, 2),
(2097, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 16:34:35', 2, 2035, 1),
(2098, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 16:34:42', 4, 2035, 2),
(2099, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 16:35:17', 2, 2036, 1),
(2100, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 16:35:26', 4, 2036, 2),
(2102, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 16:36:24', 2, 2037, 1),
(2103, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 16:36:31', 4, 2037, 2),
(2104, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 18:28:34', 2, 2038, 1),
(2105, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 18:29:44', 4, 2038, 2),
(2106, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 18:31:45', 2, 2039, 1),
(2107, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 18:34:22', 4, 2039, 2),
(2108, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 18:34:45', 2, 2040, 1),
(2109, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 18:38:03', 4, 2040, 2),
(2110, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 18:44:57', 2, 2041, 1),
(2111, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 18:58:11', 4, 2041, 2),
(2112, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 19:11:36', 2, 2042, 1),
(2113, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 19:13:41', 4, 2042, 2),
(2114, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 19:14:01', 2, 2043, 1),
(2115, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 19:14:26', 4, 2043, 2),
(2117, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 19:16:10', 2, 2044, 1),
(2118, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 19:20:52', 4, 2044, 2),
(2119, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 19:47:25', 2, 2045, 1),
(2120, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 19:47:31', 4, 2045, 2),
(2121, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 19:49:02', 2, 2046, 1),
(2122, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 19:49:31', 4, 2046, 2),
(2123, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 19:50:43', 2, 2047, 1),
(2124, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 19:50:49', 4, 2047, 2),
(2125, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 19:51:38', 2, 2048, 1),
(2126, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 19:52:31', 4, 2048, 2),
(2127, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 19:53:28', 2, 2049, 1),
(2128, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 19:53:50', 4, 2049, 2),
(2129, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 19:55:24', 2, 2050, 1),
(2130, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 19:55:41', 4, 2050, 2),
(2131, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 19:56:00', 2, 2051, 1),
(2132, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 19:56:21', 4, 2051, 2),
(2133, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 19:57:37', 2, 2052, 1),
(2134, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 19:58:56', 4, 2052, 2),
(2135, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 20:00:41', 2, 2053, 1),
(2136, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 20:02:17', 4, 2053, 2),
(2137, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 20:03:00', 2, 2054, 1),
(2138, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 20:03:19', 4, 2054, 2),
(2139, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 20:03:48', 2, 2055, 1),
(2140, 'Observaciones', NULL, NULL, NULL, 0, '2018-08-07 20:04:06', 4, 2055, 2),
(2141, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 20:04:29', 2, 2056, 1),
(2142, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 20:04:49', 4, 2056, 2),
(2143, 'Completar:', NULL, NULL, NULL, 0, '2018-08-07 20:05:12', 2, 2057, 1),
(2144, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 20:05:34', 4, 2057, 2),
(2145, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-07 20:13:39', 4, 2058, 1),
(2148, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:05:38', 2, 2060, 1),
(2149, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 15:05:47', 4, 2060, 2),
(2150, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:07:01', 2, 2061, 1),
(2151, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 15:07:08', 4, 2061, 2),
(2152, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:07:55', 2, 2062, 1),
(2153, 'Observaiones:', NULL, NULL, NULL, 0, '2018-08-08 15:12:52', 4, 2062, 2),
(2154, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:13:28', 2, 2063, 1),
(2155, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 15:13:35', 4, 2063, 2),
(2156, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:14:57', 2, 2064, 1),
(2157, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 15:15:05', 4, 2064, 2),
(2158, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:15:52', 2, 2065, 1),
(2159, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 15:16:00', 4, 2065, 2),
(2160, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:24:24', 2, 2066, 1),
(2161, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 15:25:05', 4, 2066, 2),
(2162, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:25:48', 2, 2067, 1),
(2163, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 15:25:55', 4, 2067, 2),
(2164, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:26:38', 2, 2068, 1),
(2165, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 15:26:44', 4, 2068, 2),
(2166, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:28:06', 2, 2069, 1),
(2168, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 15:28:38', 4, 2069, 2),
(2169, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:31:39', 2, 2070, 1),
(2170, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 15:31:50', 4, 2070, 2),
(2171, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:32:24', 2, 2071, 1),
(2172, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 15:32:36', 4, 2071, 2),
(2173, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:33:45', 2, 2072, 1),
(2174, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 15:33:52', 4, 2072, 2),
(2175, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:38:59', 2, 2073, 1),
(2176, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 15:39:06', 4, 2073, 2),
(2177, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:42:34', 2, 2074, 1),
(2178, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 15:42:42', 4, 2074, 2),
(2179, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:45:39', 2, 2075, 1),
(2180, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 15:45:53', 4, 2075, 2),
(2181, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:46:27', 2, 2076, 1),
(2182, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 15:46:35', 4, 2076, 2),
(2183, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:47:38', 2, 2077, 1),
(2184, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 15:47:58', 4, 2077, 2),
(2185, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:49:07', 2, 2078, 1),
(2186, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 15:49:14', 4, 2078, 2),
(2187, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:50:23', 2, 2079, 1),
(2188, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 15:50:36', 4, 2079, 2),
(2189, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 15:59:20', 2, 2082, 1),
(2190, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 15:59:27', 4, 2082, 2),
(2191, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 16:05:49', 2, 2083, 1),
(2192, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 16:05:57', 4, 2083, 2),
(2193, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 16:06:25', 2, 2084, 1),
(2194, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 16:06:32', 4, 2084, 2),
(2195, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 16:07:19', 2, 2085, 1),
(2196, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 16:07:28', 4, 2085, 2),
(2197, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 16:08:08', 2, 2086, 1),
(2198, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 16:08:14', 4, 2086, 2),
(2199, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 16:09:08', 2, 2087, 1),
(2200, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 16:09:18', 4, 2087, 2),
(2201, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 16:09:54', 2, 2088, 1),
(2202, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 16:10:02', 4, 2088, 2),
(2203, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 16:15:34', 2, 2089, 1),
(2204, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 16:15:40', 4, 2089, 2),
(2205, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 16:18:07', 2, 2090, 1),
(2206, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 16:18:13', 4, 2090, 2),
(2207, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 16:22:37', 2, 2091, 1),
(2208, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 16:22:45', 4, 2091, 2),
(2209, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 16:59:53', 2, 2092, 1),
(2210, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 17:00:00', 4, 2092, 2),
(2211, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 17:00:40', 2, 2093, 1),
(2212, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 17:00:51', 4, 2093, 2),
(2213, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 17:07:39', 2, 2094, 1),
(2214, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 17:07:47', 4, 2094, 2),
(2215, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 17:09:00', 2, 2095, 1),
(2216, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 17:09:04', 2, 2096, 1),
(2217, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 17:09:10', 2, 2097, 1),
(2218, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 17:09:15', 2, 2098, 1),
(2219, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 17:09:27', 4, 2095, 2),
(2220, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 17:09:32', 4, 2096, 2),
(2221, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 17:09:37', 4, 2097, 2),
(2222, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 17:09:42', 4, 2098, 2),
(2223, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 17:42:02', 2, 2099, 1),
(2224, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 17:42:10', 4, 2099, 2),
(2225, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 17:45:29', 2, 2100, 1),
(2226, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 17:46:05', 4, 2100, 2),
(2227, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 17:46:32', 2, 2101, 1),
(2228, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 17:47:44', 4, 2101, 2),
(2229, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 17:48:10', 2, 2102, 1),
(2230, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 17:48:16', 4, 2102, 2),
(2231, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 18:00:10', 2, 2103, 1),
(2232, 'Observacion:', NULL, NULL, NULL, 0, '2018-08-08 18:00:22', 4, 2103, 2),
(2233, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 18:01:30', 2, 2104, 1),
(2234, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 18:01:43', 4, 2104, 2),
(2235, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 18:03:33', 2, 2105, 1),
(2236, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 18:03:49', 4, 2105, 2),
(2237, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 18:19:26', 2, 2106, 1),
(2238, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 18:19:39', 4, 2106, 2),
(2239, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 18:20:11', 2, 2107, 1),
(2240, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 18:20:19', 4, 2107, 2),
(2241, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 18:20:47', 2, 2108, 1),
(2242, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 18:20:58', 4, 2108, 2),
(2243, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 18:21:29', 2, 2109, 1),
(2244, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 18:21:36', 4, 2109, 2),
(2245, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 18:23:26', 2, 2110, 1),
(2246, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 18:23:32', 4, 2110, 2),
(2247, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 18:33:06', 2, 2111, 1),
(2248, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 18:33:24', 4, 2111, 2),
(2249, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 18:57:14', 2, 2112, 1),
(2250, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 18:57:29', 4, 2112, 2),
(2251, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 18:58:47', 2, 2113, 1),
(2252, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 18:59:07', 4, 2113, 2),
(2253, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 18:59:31', 2, 2114, 1),
(2254, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 18:59:37', 4, 2114, 2),
(2255, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 19:01:08', 2, 2115, 1),
(2256, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 19:01:18', 4, 2115, 2),
(2257, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 19:04:59', 2, 2116, 1),
(2258, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 19:05:06', 4, 2116, 2),
(2259, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 19:06:28', 2, 2117, 1),
(2260, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 19:06:35', 4, 2117, 2),
(2261, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 19:07:56', 2, 2118, 1),
(2262, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 19:10:14', 4, 2118, 2),
(2263, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 19:21:26', 2, 2119, 1),
(2264, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 19:21:46', 4, 2119, 2),
(2265, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 19:22:25', 2, 2120, 1),
(2266, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 19:22:41', 4, 2120, 2),
(2267, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 19:23:12', 2, 2121, 1),
(2268, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 19:23:18', 4, 2121, 2),
(2269, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 19:23:49', 2, 2122, 1),
(2270, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 19:24:03', 4, 2122, 2),
(2271, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 19:26:34', 2, 2124, 1),
(2272, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 19:26:41', 4, 2124, 2),
(2273, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 19:27:20', 2, 2125, 1),
(2274, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 19:27:29', 4, 2125, 2),
(2275, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 19:28:44', 2, 2126, 1),
(2276, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 19:28:53', 4, 2126, 2),
(2277, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 19:33:52', 2, 2127, 1),
(2278, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 19:34:13', 4, 2127, 2),
(2279, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 19:36:46', 2, 2128, 1),
(2280, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 19:37:10', 4, 2128, 2),
(2281, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 19:38:38', 2, 2129, 1),
(2282, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 19:38:50', 4, 2129, 2),
(2283, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 19:40:31', 2, 2131, 1),
(2284, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 19:40:40', 4, 2131, 2),
(2285, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 19:41:47', 2, 2132, 1),
(2286, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 19:41:56', 4, 2132, 2),
(2287, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 19:43:39', 2, 2133, 1),
(2288, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 19:43:53', 4, 2133, 2),
(2289, 'Estado:', NULL, NULL, NULL, 0, '2018-08-08 19:45:16', 2, 2134, 1),
(2290, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-08 19:45:33', 4, 2134, 2),
(2291, 'Estado:', NULL, NULL, NULL, 0, '2018-08-11 23:37:50', 2, 2135, 1),
(2292, 'Estado:', NULL, NULL, NULL, 0, '2018-08-11 23:37:54', 2, 2136, 1),
(2293, 'Estado:', NULL, NULL, NULL, 0, '2018-08-11 23:37:58', 2, 2137, 1),
(2294, 'Estado:', NULL, NULL, NULL, 0, '2018-08-11 23:38:03', 2, 2138, 1),
(2295, 'Estado:', NULL, NULL, NULL, 0, '2018-08-11 23:38:09', 2, 2139, 1),
(2296, 'Estado:', NULL, NULL, NULL, 0, '2018-08-11 23:38:14', 2, 2140, 1),
(2297, 'Estado:', NULL, NULL, NULL, 0, '2018-08-11 23:38:18', 2, 2141, 1),
(2298, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-11 23:39:46', 4, 2135, 2),
(2299, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-11 23:39:51', 4, 2136, 2),
(2300, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-11 23:39:56', 4, 2137, 2),
(2301, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-11 23:40:00', 4, 2138, 2),
(2302, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-11 23:40:06', 4, 2139, 2),
(2303, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-11 23:40:19', 4, 2140, 2),
(2304, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-11 23:40:23', 4, 2141, 2),
(2306, 'Print de pantalla al 100%:', NULL, NULL, NULL, 0, '2018-08-13 03:02:12', 4, 2143, 1),
(2308, 'Filmar una prueba desde arranque hasta apagado:', NULL, NULL, NULL, 0, '2018-08-13 03:04:43', 4, 2143, 2),
(2309, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:10:56', 2, 2144, 1),
(2310, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:11:01', 2, 2145, 1),
(2311, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:11:05', 2, 2146, 1),
(2313, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:11:18', 2, 2147, 1),
(2314, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:11:23', 2, 2148, 1),
(2315, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:11:48', 2, 2149, 1),
(2316, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:11:53', 2, 2150, 1),
(2317, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:12:09', 4, 2144, 2),
(2318, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:12:15', 4, 2145, 2),
(2319, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:12:21', 4, 2146, 2),
(2320, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:12:26', 4, 2147, 2),
(2321, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:12:31', 4, 2148, 2),
(2322, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:12:36', 4, 2149, 2),
(2323, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:12:41', 4, 2150, 2),
(2324, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:19:46', 2, 2151, 1),
(2325, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:19:50', 2, 2152, 1),
(2326, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:19:56', 2, 2153, 1),
(2327, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:20:01', 2, 2154, 1),
(2328, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:20:05', 2, 2155, 1),
(2329, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:20:10', 2, 2156, 1),
(2330, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:22:15', 4, 2151, 2),
(2331, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:22:22', 4, 2152, 2),
(2332, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:22:30', 4, 2153, 2),
(2333, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:22:37', 4, 2154, 2),
(2334, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:22:45', 4, 2155, 2),
(2335, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:22:51', 4, 2156, 2),
(2336, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:26:51', 2, 2157, 1),
(2337, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:26:56', 2, 2158, 1),
(2338, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:27:00', 2, 2159, 1),
(2339, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:27:07', 2, 2160, 1),
(2340, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:27:13', 2, 2161, 1),
(2341, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:27:18', 2, 2162, 1),
(2342, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:27:26', 2, 2163, 1),
(2343, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:27:31', 2, 2164, 1),
(2344, 'Estado:', NULL, NULL, NULL, 0, '2018-08-13 03:27:36', 2, 2165, 1),
(2345, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:31:52', 4, 2157, 2),
(2346, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:31:57', 4, 2158, 2),
(2347, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:32:03', 4, 2159, 2),
(2348, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:32:08', 4, 2160, 2),
(2349, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:32:12', 4, 2161, 2),
(2350, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:32:16', 4, 2162, 2),
(2351, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:32:23', 4, 2163, 2),
(2352, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:32:27', 4, 2164, 2),
(2353, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:32:31', 4, 2165, 2),
(2354, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:33:57', 4, 2166, 1),
(2355, 'Observaciones:', NULL, NULL, NULL, 0, '2018-08-13 03:34:27', 4, 2167, 1),
(2500, '850-LAVADO DE MOTOR DE 4 CILINDRO', NULL, NULL, NULL, 0, '2018-08-23 14:42:19', 3, 2500, 1),
(2501, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 14:42:30', 5, 2500, 2),
(2502, '860-LAVADO DE MOTOR DE 5 CILINDRO', NULL, NULL, NULL, 0, '2018-08-23 14:42:59', 3, 2500, 3),
(2503, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 14:43:11', 5, 2500, 4),
(2504, '870-LAVADO DE MOTOR DE 6 CILINDRO', NULL, NULL, NULL, 0, '2018-08-23 14:44:03', 3, 2500, 5),
(2505, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 14:44:21', 5, 2500, 6),
(2506, '880-LAVADO DE MOTOR DE 8 CILINDRO', NULL, NULL, NULL, 0, '2018-08-23 14:44:40', 3, 2500, 7),
(2507, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 14:44:45', 5, 2500, 8),
(2508, '881-LAVADO DE MOTOR DE 12 CILINDRO', NULL, NULL, NULL, 0, '2018-08-23 14:45:22', 3, 2500, 9),
(2509, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 14:45:33', 5, 2500, 10),
(2510, '10-RECTIFICAR Y BRUÑIR CILINDROS', NULL, NULL, NULL, 0, '2018-08-23 14:46:04', 3, 2501, 1),
(2511, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 14:46:10', 5, 2501, 2),
(2512, '20-BRUÑIR CILINDROS', NULL, NULL, NULL, 0, '2018-08-23 14:46:32', 3, 2501, 3),
(2513, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 14:46:41', 5, 2501, 4),
(2514, '30-ENCAMISAR RECT. Y BRUÑIR CILINDROS', NULL, NULL, NULL, 0, '2018-08-23 14:49:36', 3, 2501, 5),
(2515, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 14:49:46', 5, 2501, 6),
(2516, '100-SACAR, COLOCAR Y CONTROLAR CAMISAS', NULL, NULL, NULL, 0, '2018-08-23 14:50:03', 3, 2501, 7),
(2517, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 14:50:22', 5, 2501, 8),
(2518, '108-BRUÑIR ALOJAMIENTO DE CAMISAS', NULL, NULL, NULL, 0, '2018-08-23 14:50:59', 3, 2501, 9),
(2519, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 14:51:05', 5, 2501, 10),
(2520, '110-CONTROLAR Y/O DAR ALTURA A CAMISA', NULL, NULL, NULL, 0, '2018-08-23 14:51:29', 3, 2501, 11),
(2521, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 14:51:35', 5, 2501, 12),
(2522, '112-DAR ALTURA A CAMISAS (P/ESP. NOCIVO)', NULL, NULL, NULL, 0, '2018-08-23 14:51:58', 3, 2501, 13),
(2523, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 14:52:09', 5, 2501, 14),
(2524, '120-CONTROLAR Y/O DAR ALTURA A PISTONES', NULL, NULL, NULL, 0, '2018-08-23 14:52:33', 3, 2501, 15),
(2525, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 14:52:39', 5, 2501, 16),
(2526, '130-ENCAMISAR CILINDROS ?SIN RECTIFICAR?', NULL, NULL, NULL, 0, '2018-08-23 14:52:53', 3, 2501, 17),
(2527, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 14:52:59', 5, 2501, 18),
(2528, '140-REACONDICIONA ALOJAMIENTO DE CAMISAS', NULL, NULL, NULL, 0, '2018-08-23 14:53:12', 3, 2501, 19),
(2529, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 14:53:16', 5, 2501, 20),
(2530, '142-REACONDICIONAR ALOJ. RELLENADO DE CAMISAS', NULL, NULL, NULL, 0, '2018-08-23 14:53:30', 3, 2501, 21),
(2531, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 14:53:37', 5, 2501, 22),
(2532, '1300-RECONSTRUIR MUÑON DE LA BIELA', NULL, NULL, NULL, 0, '2018-08-23 15:05:40', 3, 2502, 1),
(2533, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:05:45', 5, 2502, 2),
(2534, '1310-RECONSTRUIR INTERIOR DE BIELA', NULL, NULL, NULL, 0, '2018-08-23 15:06:10', 3, 2502, 3),
(2535, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:06:15', 5, 2502, 4),
(2536, '1320-CAMBIAR Y ALESAR BUJES DE BIELA', NULL, NULL, NULL, 0, '2018-08-23 15:07:37', 3, 2502, 5),
(2537, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:07:44', 5, 2502, 6),
(2538, '1330-AJUSTAR PERNO DE BIELA', NULL, NULL, NULL, 0, '2018-08-23 15:08:02', 3, 2502, 7),
(2539, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:08:08', 5, 2502, 8),
(2540, '1340-ENCAMISAR CILINDRO', NULL, NULL, NULL, 0, '2018-08-23 15:08:44', 3, 2502, 9),
(2541, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:08:51', 5, 2502, 10),
(2542, '1350-BRUÑIR CILINDRO', NULL, NULL, NULL, 0, '2018-08-23 15:09:17', 3, 2502, 11),
(2543, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:09:22', 5, 2502, 12),
(2544, '1360-AJUSTAR COJINETE DE BIELA', NULL, NULL, NULL, 0, '2018-08-23 15:09:33', 3, 2502, 13),
(2545, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:09:43', 5, 2502, 14),
(2546, '2041-REPARACION BASE DE COMPRESOR', NULL, NULL, NULL, 0, '2018-08-23 15:10:03', 3, 2502, 15),
(2547, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:10:12', 5, 2502, 16),
(2548, '970-CONTROLAR BOMBA DE ACEITE', NULL, NULL, NULL, 0, '2018-08-23 15:10:42', 3, 2503, 1),
(2549, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:10:50', 5, 2503, 2),
(2550, '980-REPARAR BOMBA DE ACEITE', NULL, NULL, NULL, 0, '2018-08-23 15:11:23', 3, 2503, 3),
(2551, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:11:28', 5, 2503, 4),
(2552, '990-RECTIFICAR BALANCINES', NULL, NULL, NULL, 0, '2018-08-23 15:11:41', 3, 2503, 5),
(2553, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:11:52', 5, 2503, 6),
(2554, '991-RECTIFICAR BOTADORES', NULL, NULL, NULL, 0, '2018-08-23 15:12:05', 3, 2503, 7),
(2555, 'CANTIDAD', NULL, NULL, NULL, 0, '2018-08-23 15:12:13', 5, 2503, 8),
(2556, '992-CAMBIAR BUJES DE BALANCINES Y ALESAR', NULL, NULL, NULL, 0, '2018-08-23 15:12:25', 3, 2503, 9),
(2557, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:12:31', 5, 2503, 10),
(2558, '2033-SOLDAR BLOCK', NULL, NULL, NULL, 0, '2018-08-23 15:26:53', 3, 2504, 1),
(2559, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:27:03', 5, 2504, 2),
(2560, '2034-SOLDAR TAPA DE CILINDRO', NULL, NULL, NULL, 0, '2018-08-23 15:27:50', 3, 2504, 3),
(2561, 'CANTIDAD', NULL, NULL, NULL, 0, '2018-08-23 15:27:55', 5, 2504, 4),
(2562, '2035-SOLDAR Y RELLENAR TAPA CON ALUMINIO', NULL, NULL, NULL, 0, '2018-08-23 15:32:20', 3, 2504, 5),
(2563, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:32:29', 5, 2504, 6),
(2564, '2036-RELLENAR BANCADA DE BLOCK', NULL, NULL, NULL, 0, '2018-08-23 15:32:45', 3, 2504, 7),
(2565, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:32:50', 5, 2504, 8),
(2566, '2037-SOLDAR BLOCK C/SOLDADURA ELECTRICA', NULL, NULL, NULL, 0, '2018-08-23 15:33:06', 3, 2504, 9),
(2567, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:33:12', 5, 2504, 10),
(2568, '748-LAVADO DE TAPA DE CILINDRO', NULL, NULL, NULL, 0, '2018-08-23 15:35:51', 3, 2505, 1),
(2569, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:35:58', 5, 2505, 2),
(2570, '750-GRANALLADO DE TAPA DE CILINDRO', NULL, NULL, NULL, 0, '2018-08-23 15:36:12', 3, 2505, 3),
(2571, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:36:20', 5, 2505, 4),
(2572, '600-RECTIFICAR VALVULAS', NULL, NULL, NULL, 0, '2018-08-23 15:36:31', 3, 2505, 5),
(2573, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:36:38', 5, 2505, 6),
(2574, '610-RECTIFICAR ASIENTOS DE VALVULAS', NULL, NULL, NULL, 0, '2018-08-23 15:36:56', 3, 2505, 7),
(2575, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:37:04', 5, 2505, 8),
(2576, '620-ENCASQUILLAR Y RECTIF. ASIENTOS DE VALV.', NULL, NULL, NULL, 0, '2018-08-23 15:37:17', 3, 2505, 9),
(2577, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:37:23', 5, 2505, 10),
(2578, '630-ENCASQUILLAR ASIENTOS DE VALV. (S/RECTIF)', NULL, NULL, NULL, 0, '2018-08-23 15:37:48', 3, 2505, 11),
(2579, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:37:53', 5, 2505, 12),
(2580, '640-REPOSICION DE GUIAS DE VALVULAS', NULL, NULL, NULL, 0, '2018-08-23 15:38:06', 3, 2505, 13),
(2581, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:38:14', 5, 2505, 14),
(2582, '650-ENTUBAR GUIAS DE VALVULAS', NULL, NULL, NULL, 0, '2018-08-23 15:38:25', 3, 2505, 15),
(2583, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:38:31', 5, 2505, 16),
(2584, '660-AJUSTAR VASTAGOS DE VALVULAS A GUIAS', NULL, NULL, NULL, 0, '2018-08-23 15:38:44', 3, 2505, 17),
(2585, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:38:49', 5, 2505, 18),
(2586, '670-ADAPTAR GUIAS DE VALVULAS', NULL, NULL, NULL, 0, '2018-08-23 15:40:48', 3, 2505, 19),
(2587, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:40:53', 5, 2505, 20),
(2588, '680-MAQUINAR GUIAS PARA ADAPTAR RETENES', NULL, NULL, NULL, 0, '2018-08-23 15:55:10', 3, 2505, 21),
(2589, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:55:20', 5, 2505, 22),
(2590, '681-SACAR CONTROLAR Y COLOCAR PRECAMARAS', NULL, NULL, NULL, 0, '2018-08-23 15:55:38', 3, 2505, 23),
(2591, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:55:44', 5, 2505, 24),
(2592, '682-RECONSTRUIR ASIENTOS DE PRECAMARAS', NULL, NULL, NULL, 0, '2018-08-23 15:56:19', 3, 2505, 25),
(2593, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 15:56:43', 5, 2505, 26),
(2594, '683-SACAR CONTROLAR Y COLO, CAMISAS INYEC', NULL, NULL, NULL, 0, '2018-08-23 16:01:50', 3, 2505, 27),
(2595, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 16:02:00', 5, 2505, 28),
(2596, '684-RECTIFICAR VALVULAS TOP BRAKE', NULL, NULL, NULL, 0, '2018-08-23 16:02:24', 3, 2505, 29),
(2597, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 16:02:31', 5, 2505, 30),
(2598, '685-RECTIFICAR ASIENTOS DE TOP BRAKE', NULL, NULL, NULL, 0, '2018-08-23 16:02:52', 3, 2505, 31),
(2599, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 16:02:58', 5, 2505, 32),
(2600, '745-HACER RANURAS DE PARALLAMAS', NULL, NULL, NULL, 0, '2018-08-23 16:03:16', 3, 2505, 33),
(2601, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 16:03:23', 5, 2505, 34),
(2602, '780-ARMAR/REGULAR TAPA C/PLATILLOS 2 CIL.', NULL, NULL, NULL, 0, '2018-08-23 16:03:36', 3, 2505, 35),
(2603, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 16:03:40', 5, 2505, 36),
(2604, '782-ARMAR/REGULAR TAPA C/PLATILLOS 3 CIL.', NULL, NULL, NULL, 0, '2018-08-23 16:03:53', 3, 2505, 37),
(2605, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 16:04:00', 5, 2505, 38),
(2606, '784-ARMAR/REGULAR TAPA C/PLATILLOS 4 CIL.', NULL, NULL, NULL, 0, '2018-08-23 16:04:22', 3, 2505, 39),
(2607, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 16:04:28', 5, 2505, 40),
(2608, '790-ARMAR/REGULAR TAPA C/PLATILLOS 5 CIL.', NULL, NULL, NULL, 0, '2018-08-23 16:04:40', 3, 2505, 41),
(2609, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 16:04:47', 5, 2505, 42),
(2610, '792-ARMAR/REGULAR TAPA C/PLATILLOS 6 CIL', NULL, NULL, NULL, 0, '2018-08-23 16:05:02', 3, 2505, 43),
(2611, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 16:05:08', 5, 2505, 44),
(2612, '794-ARMAR/REGULAR TAPA C/BOTADORES HIDRAU.', NULL, NULL, NULL, 0, '2018-08-23 16:05:33', 3, 2505, 45),
(2613, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 16:05:39', 5, 2505, 46),
(2614, '190-PRESENTAR COJINETES DE BANCADA', NULL, NULL, NULL, 0, '2018-08-23 16:06:46', 3, 2506, 1),
(2615, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 16:06:52', 5, 2506, 2),
(2616, '210-ALESAR Y PRESENTAR COJ. DE BANCADA', NULL, NULL, NULL, 0, '2018-08-23 16:07:09', 3, 2506, 3),
(2617, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-23 16:07:17', 5, 2506, 4),
(2618, '220-REACONDICIONA ALOJ. DE COJ.DE BANCADA', NULL, NULL, NULL, 0, '2018-08-26 22:39:12', 3, 2506, 5),
(2619, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-26 22:39:19', 5, 2506, 6),
(2620, '480-ALESAR BANCADA RETEN DE BLOCK', NULL, NULL, NULL, 0, '2018-08-26 22:39:36', 3, 2506, 7),
(2621, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-26 22:39:45', 5, 2506, 8),
(2622, '500-ALESAR Y AJUSTAR COJ.ARBOL LEVAS', NULL, NULL, NULL, 0, '2018-08-26 22:40:31', 3, 2506, 9),
(2623, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-26 22:40:40', 5, 2506, 10),
(2624, '501-ALESAR ALOJ. P/ADAPTAR ARBOL LEVAS', NULL, NULL, NULL, 0, '2018-08-26 22:40:54', 3, 2506, 11),
(2625, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-26 22:41:02', 5, 2506, 12),
(2626, '510-ALESAR ALOJ. ARBOL LEVA P/ADAPTAR COJINETES', NULL, NULL, NULL, 0, '2018-08-26 22:43:04', 3, 2506, 13),
(2627, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-26 22:43:10', 5, 2506, 14),
(2628, '560-RECTIFICAR APOYOS DE EJE DE MANO/BALAN.', NULL, NULL, NULL, 0, '2018-08-26 22:44:55', 3, 2506, 15),
(2629, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-26 22:45:01', 5, 2506, 16),
(2630, '570-ALESAR Y AJUSTAR COJ.EJE MAND/BALANC.', NULL, NULL, NULL, 0, '2018-08-26 22:46:50', 3, 2506, 17),
(2631, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-26 22:46:56', 5, 2506, 18),
(2632, '580-ALESAR ALOJ. EJE MAN/BALANC.P/ADAP COJ', NULL, NULL, NULL, 0, '2018-08-26 22:51:34', 3, 2506, 19),
(2633, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-26 22:51:46', 5, 2506, 20);
INSERT INTO `frm_valores` (`VALO_ID`, `NOMBRE`, `PISTA`, `LONGITUD`, `VALOR_DEFECTO`, `OBLIGATORIO`, `FEC_CREACION`, `TIDA_ID`, `GRUP_ID`, `ORDEN`) VALUES
(2634, '40-AJUSTAR PERNO Y ARMAR BIELA', NULL, NULL, NULL, 0, '2018-08-26 23:11:47', 3, 2507, 1),
(2635, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-26 23:11:54', 5, 2507, 2),
(2636, '50-CAMBIAR BUJAS DE BIELA Y ALESAR', NULL, NULL, NULL, 0, '2018-08-26 23:14:02', 3, 2507, 3),
(2637, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-26 23:14:08', 5, 2507, 4),
(2638, '60-ARMAR BIELAS CON PERNOS A PRESION', NULL, NULL, NULL, 0, '2018-08-26 23:14:26', 3, 2507, 5),
(2639, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-26 23:14:31', 5, 2507, 6),
(2641, '70-BRUÑIR ALOJAMIENTO DE PISTON', NULL, NULL, NULL, 0, '2018-08-26 23:15:08', 3, 2507, 7),
(2642, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-26 23:15:15', 5, 2507, 8),
(2643, '80-REACONDICIONAR OJO DE BIELA', NULL, NULL, NULL, 0, '2018-08-26 23:15:28', 3, 2507, 9),
(2644, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-26 23:15:35', 5, 2507, 10),
(2645, '160-RECTIFICAR INTERIOR DE BIELA DE MOTOR', NULL, NULL, NULL, 0, '2018-08-26 23:17:20', 3, 2507, 11),
(2646, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-26 23:17:25', 5, 2507, 12),
(2647, '170-RECTIFICAR INTERIOR DE BIELA DENTADA', NULL, NULL, NULL, 0, '2018-08-26 23:17:39', 3, 2507, 13),
(2648, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-26 23:17:46', 5, 2507, 14),
(2649, '180-PRESENTAR Y AJUSTAR COJINETES DE BIELAS', NULL, NULL, NULL, 0, '2018-08-26 23:17:59', 3, 2507, 15),
(2650, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-26 23:18:09', 5, 2507, 16),
(2651, '200-ALESAR Y PRESENTAR COJINETES DE BIELAS', NULL, NULL, NULL, 0, '2018-08-26 23:18:20', 3, 2507, 17),
(2652, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-26 23:18:25', 5, 2507, 18),
(2653, '800-PRUEBA HIDRAULICA A TAPA DE 1 CIL.', NULL, NULL, NULL, 0, '2018-08-27 00:41:09', 3, 2508, 1),
(2654, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 00:41:37', 5, 2508, 2),
(2655, '802-PRUEBA HIDRAULICA A TAPA DE 2 CIL.', NULL, NULL, NULL, 0, '2018-08-27 00:55:06', 3, 2508, 3),
(2656, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 00:55:12', 5, 2508, 4),
(2657, '804-PRUEBA HIDRAULICA A TAPA DE 3 CIL.', NULL, NULL, NULL, 0, '2018-08-27 00:55:30', 3, 2508, 5),
(2658, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 00:55:41', 5, 2508, 6),
(2659, '806-PRUEBA HIDRAULICA A TAPA DE 4 CIL.', NULL, NULL, NULL, 0, '2018-08-27 00:55:57', 3, 2508, 7),
(2660, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 00:56:03', 5, 2508, 8),
(2661, '810-PRUEBA HIDRAULICA A TAPA DE 5 CIL', NULL, NULL, NULL, 0, '2018-08-27 00:56:18', 3, 2508, 9),
(2662, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 00:56:27', 5, 2508, 10),
(2663, '812-PRUEBA HIDRAULICA A TAPA DE 6 CIL.', NULL, NULL, NULL, 0, '2018-08-27 00:57:52', 3, 2508, 11),
(2664, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 00:57:59', 5, 2508, 12),
(2665, '2100-REALIZAR PRUEBA AFTERCOOLER', NULL, NULL, NULL, 0, '2018-08-27 00:58:21', 3, 2508, 13),
(2666, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 00:58:26', 5, 2508, 14),
(2667, '2101-REALIZAR PRUEBA TUBO ENFRIADORES', NULL, NULL, NULL, 0, '2018-08-27 00:58:44', 3, 2508, 15),
(2668, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 00:58:57', 5, 2508, 16),
(2669, '150-RECTIFICAR CUELLO DE CIGUEÑAL', NULL, NULL, NULL, 0, '2018-08-27 00:59:31', 3, 2509, 1),
(2670, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:00:17', 5, 2509, 2),
(2671, '152-PULIR CUELLO DE CIGUEÑAL', NULL, NULL, NULL, 0, '2018-08-27 01:01:01', 3, 2509, 3),
(2672, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:01:06', 5, 2509, 4),
(2673, '230-CONTROL DE DETECTOR DE FISURA 2 CIL', NULL, NULL, NULL, 0, '2018-08-27 01:01:17', 3, 2509, 5),
(2674, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:01:23', 5, 2509, 6),
(2675, '240-CONTROL DE DETECTOR DE FISURA 3 CIL', NULL, NULL, NULL, 0, '2018-08-27 01:01:39', 3, 2509, 7),
(2676, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:01:50', 5, 2509, 8),
(2679, '250-CONTROL DE DETECTOR DE FISURA 4 CIL', NULL, NULL, NULL, 0, '2018-08-27 01:02:25', 3, 2509, 9),
(2680, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:02:31', 5, 2509, 10),
(2681, '260-CONTROL DE DETECTOR DE FISURA 5 CIL', NULL, NULL, NULL, 0, '2018-08-27 01:02:42', 3, 2509, 11),
(2682, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:02:46', 5, 2509, 12),
(2683, '270-CONTROL DE DETECTOR DE FISURA 6 CIL', NULL, NULL, NULL, 0, '2018-08-27 01:03:01', 3, 2509, 13),
(2684, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:03:07', 5, 2509, 14),
(2685, '280-CONTROL DE DETECTOR DE FISURA 8 CIL', NULL, NULL, NULL, 0, '2018-08-27 01:03:27', 3, 2509, 15),
(2686, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:03:32', 5, 2509, 16),
(2687, '689-RECONST SUPERFICIE DE TAPA DE VALVULA', NULL, NULL, NULL, 0, '2018-08-27 01:03:59', 3, 2510, 1),
(2688, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:04:03', 5, 2510, 2),
(2689, '690-RECTIFICAR SUPERFICIE DE TAPA 1 CIL.', NULL, NULL, NULL, 0, '2018-08-27 01:04:15', 3, 2510, 3),
(2690, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:04:20', 5, 2510, 4),
(2691, '700-RECTIFICAR SUPERFICIE DE TAPA 2 CIL.', NULL, NULL, NULL, 0, '2018-08-27 01:05:18', 3, 2510, 5),
(2692, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:05:24', 5, 2510, 6),
(2693, '710-RECTIFICAR SUPERFICIE DE TAPA 3 CIL.', NULL, NULL, NULL, 0, '2018-08-27 01:05:48', 3, 2510, 7),
(2694, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:05:52', 5, 2510, 8),
(2695, '720-RECTIFICAR SUPERFICIE DE TAPA 4 CIL.', NULL, NULL, NULL, 0, '2018-08-27 01:06:05', 3, 2510, 9),
(2696, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:06:09', 5, 2510, 10),
(2697, '730-RECTIFICAR SUPERFICIE DE TAPA 5 CIL.', NULL, NULL, NULL, 0, '2018-08-27 01:06:24', 3, 2505, 47),
(2698, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:06:29', 5, 2505, 48),
(2699, '730-RECTIFICAR SUPERFICIE DE TAPA 5 CIL.', NULL, NULL, NULL, 0, '2018-08-27 01:08:22', 3, 2510, 11),
(2700, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:08:27', 5, 2510, 12),
(2701, '740-RECTIFICAR SUPERFICIE DE TAPA 6 CIL.', NULL, NULL, NULL, 0, '2018-08-27 01:08:40', 3, 2510, 13),
(2702, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:08:46', 5, 2510, 14),
(2703, '910-RECTIFICAR SUP. DE BLOCK 2 CILINDROS', NULL, NULL, NULL, 0, '2018-08-27 01:09:04', 3, 2510, 15),
(2704, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:09:12', 5, 2510, 16),
(2705, '920-RECTIFICAR SUP. DE BLOCK 3 CILINDROS', NULL, NULL, NULL, 0, '2018-08-27 01:10:09', 3, 2510, 17),
(2706, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:10:15', 5, 2510, 18),
(2707, '930-RECTIFICAR SUP. DE BLOCK 4 CILINDROS', NULL, NULL, NULL, 0, '2018-08-27 01:10:32', 3, 2510, 19),
(2708, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:10:36', 5, 2510, 20),
(2709, '940-RECTIFICAR SUP. DE BLOCK 5 CILINDROS', NULL, NULL, NULL, 0, '2018-08-27 01:10:50', 3, 2510, 21),
(2710, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:10:59', 5, 2510, 22),
(2711, '950-RECTIFICAR SUP. DE BLOCK 6 CILINDROS', NULL, NULL, NULL, 0, '2018-08-27 01:11:17', 3, 2510, 23),
(2712, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:11:23', 5, 2510, 24),
(2713, '960-RECTIFICAR BASE DE CARTER', NULL, NULL, NULL, 0, '2018-08-27 01:11:32', 3, 2510, 25),
(2714, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:11:37', 5, 2510, 26),
(2715, '965-RECTIFICAR BASE DE BANCADA A BLOCK', NULL, NULL, NULL, 0, '2018-08-27 01:11:48', 3, 2510, 27),
(2716, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:11:54', 5, 2510, 28),
(2717, '1225-RECTIF.BASE MULTIPLE DE ESCAPE 1 o 2 CIL.', NULL, NULL, NULL, 0, '2018-08-27 01:12:10', 3, 2510, 29),
(2718, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:12:15', 5, 2510, 30),
(2719, '1226-RECTIF.BASE MULTIPLE DE ESCAPE 3 o 4 CIL.', NULL, NULL, NULL, 0, '2018-08-27 01:12:26', 3, 2510, 31),
(2720, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:12:31', 5, 2510, 32),
(2721, '1227-RECTIF.BASE MULTIPLE DE ESCAPE 5 o 6 CIL.', NULL, NULL, NULL, 0, '2018-08-27 01:12:41', 3, 2510, 33),
(2722, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 01:12:47', 5, 2510, 34),
(2723, '410-ENDEREZAR CIGUEÑAL', NULL, NULL, NULL, 0, '2018-08-27 04:17:37', 3, 2511, 1),
(2724, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:17:51', 5, 2511, 2),
(2725, '420-CONTROLAR DUREZA DE CIGUEÑAL', NULL, NULL, NULL, 0, '2018-08-27 04:18:35', 3, 2511, 3),
(2726, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:18:44', 5, 2511, 4),
(2727, '430-SAC. Y COL. TAP.CIGUEÑAL C/LIMP-S/MAT', NULL, NULL, NULL, 0, '2018-08-27 04:19:56', 3, 2511, 5),
(2728, 'CANTIDAD', NULL, NULL, NULL, 0, '2018-08-27 04:20:02', 5, 2511, 6),
(2729, '440-SAC. Y COL. TAP.ROSC.CIGUEÑAL C/LIMP - S/MAT', NULL, NULL, NULL, 0, '2018-08-27 04:21:07', 3, 2511, 7),
(2730, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:21:21', 5, 2511, 8),
(2731, '450-SACAR/COLOCAR Y MANDRILAR TUBOS CIG.', NULL, NULL, NULL, 0, '2018-08-27 04:22:02', 3, 2511, 9),
(2732, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:22:08', 5, 2511, 10),
(2733, '460-SACAR/COLOCAR CONTRAPESOS A PRESION CIG.', NULL, NULL, NULL, 0, '2018-08-27 04:22:29', 3, 2511, 11),
(2734, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:22:40', 5, 2511, 12),
(2735, '35-RECTIFICAR PISTONES', NULL, NULL, NULL, 0, '2018-08-27 04:23:31', 3, 2512, 1),
(2736, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:23:36', 5, 2512, 2),
(2737, '90-HACER Y/O AMPLIAR RANURA DE AROS', NULL, NULL, NULL, 0, '2018-08-27 04:24:26', 3, 2512, 3),
(2738, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:24:31', 5, 2512, 4),
(2739, '95-CAMBIAR INYECTORES DE PISTON', NULL, NULL, NULL, 0, '2018-08-27 04:24:57', 3, 2512, 5),
(2740, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:25:07', 5, 2512, 6),
(2741, '1200-FRESAR CABEZA DE PISTON', NULL, NULL, NULL, 0, '2018-08-27 04:25:21', 3, 2512, 7),
(2742, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:25:27', 5, 2512, 8),
(2743, '470-ROSCA CIGUEÑAL Y MODIFICAR RETEN', NULL, NULL, NULL, 0, '2018-08-27 04:26:14', 3, 2512, 9),
(2744, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:26:20', 5, 2512, 10),
(2745, '1220-REACONDICIONAR ENGRANAJE', NULL, NULL, NULL, 0, '2018-08-27 04:27:37', 3, 2512, 11),
(2746, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:27:45', 5, 2512, 12),
(2747, '1400-RECTIFICAR VOLANTE', NULL, NULL, NULL, 0, '2018-08-27 04:28:37', 3, 2512, 13),
(2748, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:28:47', 5, 2512, 14),
(2749, '1410-ENCAMISAR POLEA', NULL, NULL, NULL, 0, '2018-08-27 04:29:06', 3, 2512, 15),
(2750, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:29:12', 5, 2512, 16),
(2751, '1420-CAMBIAR CORONA DE ARRANQUE', NULL, NULL, NULL, 0, '2018-08-27 04:29:27', 3, 2512, 17),
(2752, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:29:32', 5, 2512, 18),
(2753, '1430-COLOCAR INSERTOS PARA ROSCA', NULL, NULL, NULL, 0, '2018-08-27 04:29:48', 3, 2512, 19),
(2754, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:29:54', 5, 2512, 20),
(2755, '290-BALANCEO SUELTO 2 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:31:42', 3, 2513, 1),
(2756, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:31:48', 5, 2513, 2),
(2757, '300-BALANCEO COMPLETO 2 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:32:32', 3, 2513, 3),
(2758, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:32:38', 5, 2513, 4),
(2759, '310-BALANCEO SUELTO 3 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:33:13', 3, 2513, 5),
(2760, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:33:19', 5, 2513, 6),
(2761, '320-BALANCEO COMPLETO 3 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:33:32', 3, 2513, 7),
(2762, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:33:38', 5, 2513, 2),
(2763, '330-BALANCEO SUELTO 4 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:34:33', 3, 2513, 3),
(2764, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:34:39', 5, 2513, 4),
(2765, '340-BALANCEO COMPLETO 4 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:35:26', 3, 2513, 5),
(2766, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:35:31', 5, 2513, 6),
(2767, '350-BALANCEO SUELTO 5 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:36:03', 3, 2513, 7),
(2768, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:36:09', 5, 2513, 8),
(2769, '360-BALANCEO COMPLETO 5 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:36:38', 3, 2513, 9),
(2770, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:36:43', 5, 2513, 10),
(2771, '370-BALANCEO SUELTO 6 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:36:57', 3, 2513, 11),
(2772, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:37:03', 5, 2513, 12),
(2773, '380-BALANCEO COMPLETO 6 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:37:16', 3, 2513, 13),
(2774, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:37:21', 5, 2513, 14),
(2775, '390-BALANCEO SUELTO 8 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:37:33', 3, 2513, 15),
(2776, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:37:40', 5, 2513, 16),
(2777, '392-BALANCEAR VOLANTE, PLACA Y POLEA', NULL, NULL, NULL, 0, '2018-08-27 04:37:54', 3, 2513, 17),
(2778, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:38:00', 5, 2513, 18),
(2779, '393-BALANCEAR POLEA', NULL, NULL, NULL, 0, '2018-08-27 04:38:25', 3, 2513, 19),
(2780, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:38:30', 5, 2513, 20),
(2781, '400-BALANCEO COMPLETO 8CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:38:53', 3, 2513, 21),
(2782, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:38:58', 5, 2513, 22),
(2783, '490-RECTIFICAR APOYO ARBOL DE LEVAS', NULL, NULL, NULL, 0, '2018-08-27 04:39:36', 3, 2514, 1),
(2784, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:39:44', 5, 2514, 2),
(2785, '491-PULIR ARBOL DE LEVAS', NULL, NULL, NULL, 0, '2018-08-27 04:40:20', 3, 2514, 3),
(2786, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:40:26', 5, 2514, 4),
(2787, '520-RECTIFICAR ARBOL DE LEVA', NULL, NULL, NULL, 0, '2018-08-27 04:40:38', 3, 2514, 5),
(2788, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:40:44', 5, 2514, 6),
(2789, '540-RECTIFICAR EXENTRICO ARBOL LEVAS', NULL, NULL, NULL, 0, '2018-08-27 04:40:57', 3, 2514, 7),
(2790, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:41:05', 5, 2514, 8),
(2791, '550-CONTROLAR ARBOL LEVAS C/DETEC FISURAS', NULL, NULL, NULL, 0, '2018-08-27 04:41:17', 3, 2514, 9),
(2792, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:41:23', 5, 2514, 10),
(2793, '590-RECTIFICAR EXENTRICO EJE MANDO/BALANC', NULL, NULL, NULL, 0, '2018-08-27 04:41:36', 3, 2514, 11),
(2794, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:41:42', 5, 2514, 12),
(2795, '1000-REPARAR ARBOL DE BALNCINES', NULL, NULL, NULL, 0, '2018-08-27 04:41:55', 3, 2514, 13),
(2796, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:42:05', 5, 2514, 14),
(2798, '1014-SEMI-ARMADO MOTOR NAFTERO 4 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:43:23', 3, 2516, 1),
(2799, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:43:32', 5, 2516, 2),
(2800, '1020-SEMI-ARMADO MOTOR NAFTERO 5 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:43:53', 3, 2516, 3),
(2801, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:43:59', 5, 2516, 4),
(2802, '1022-SEMI-ARMADO MOTOR NAFTERO 6 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:45:28', 3, 2516, 5),
(2803, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:45:33', 5, 2516, 6),
(2804, '1024-SEMI-ARMADO MOTOR NAFTERO 8 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:45:46', 3, 2516, 7),
(2805, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:45:51', 5, 2516, 8),
(2806, '1062-SEMI-ARMADO MOTOR GASOLERO GR. 6 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:46:06', 3, 2516, 9),
(2807, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:46:12', 5, 2516, 10),
(2808, '1064-SEMI-ARMADO MOTOR GASOLERO GR. 8 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:46:31', 3, 2516, 11),
(2809, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:46:36', 5, 2516, 12),
(2810, '1065-SEMI-ARMADO MOTOR GASOLERO GR.12 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:46:50', 3, 2516, 13),
(2811, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:46:58', 5, 2516, 14),
(2812, '1154-ARM./PUESTO/MARCHA GASOLERO CH.4 CIL', NULL, NULL, NULL, 0, '2018-08-27 04:49:05', 3, 2517, 1),
(2813, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:49:12', 5, 2517, 2),
(2814, '1160-ARM./PUESTO/MARCHA GASOLERO CH.5 CIL', NULL, NULL, NULL, 0, '2018-08-27 04:49:26', 3, 2517, 3),
(2815, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:49:36', 5, 2517, 4),
(2816, '1162-ARM./PUESTO/MARCHA GASOLERO CH.6 CIL', NULL, NULL, NULL, 0, '2018-08-27 04:49:58', 3, 2517, 5),
(2817, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:50:03', 5, 2517, 6),
(2818, '1182-ARM./PUESTO/MARCHA GASOLERO GR.6 CIL', NULL, NULL, NULL, 0, '2018-08-27 04:50:18', 3, 2517, 7),
(2819, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:50:24', 5, 2517, 8),
(2820, '1184-ARM./PUESTO/MARCHA GASOLERO GR.8 CIL', NULL, NULL, NULL, 0, '2018-08-27 04:50:40', 3, 2517, 9),
(2821, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:50:46', 5, 2517, 10),
(2822, '1189-ARM./PUESTO/MARCHA GASOLERO GR.12 CIL', NULL, NULL, NULL, 0, '2018-08-27 04:51:05', 3, 2517, 11),
(2823, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:51:14', 5, 2517, 12),
(2824, '1192-ARM./PUESTO/MARCHA GASOLERO GR.16 CIL', NULL, NULL, NULL, 0, '2018-08-27 04:51:27', 3, 2517, 13),
(2825, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:51:36', 5, 2517, 14),
(2826, '1188-COLOCAR Y PROBAR MOTOR EN BANCO PRUEBA', NULL, NULL, NULL, 0, '2018-08-27 04:52:07', 3, 2517, 15),
(2827, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:52:13', 5, 2517, 16),
(2828, '1191-MANO DE OBRA DESARME & EVALUACION', NULL, NULL, NULL, 0, '2018-08-27 04:52:46', 3, 2517, 17),
(2829, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:52:55', 5, 2517, 18),
(2830, '1074-ARMADO DE MOTOR NAFTERO 4 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:53:32', 3, 2518, 1),
(2831, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:53:44', 5, 2518, 2),
(2832, '1080-ARMADO DE MOTOR NAFTERO 5 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:54:12', 3, 2518, 3),
(2833, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:54:21', 5, 2518, 4),
(2834, '1082-ARMADO DE MOTOR NAFTERO 6 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:54:44', 3, 2518, 5),
(2835, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:54:50', 5, 2518, 6),
(2836, '1084-ARMADO DE MOTOR NAFTERO 8 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:55:10', 3, 2518, 7),
(2837, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:55:17', 5, 2518, 8),
(2838, '1094-ARMADO DE MOTOR GASOLERO CH. 4 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:55:58', 3, 2518, 9),
(2839, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:56:04', 5, 2518, 10),
(2840, '1100-ARMADO DE MOTOR GASOLERO CH. 5 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:56:35', 3, 2518, 11),
(2841, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:56:41', 5, 2518, 12),
(2842, '1102-ARMADO DE MOTOR GASOLERO CH. 6 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:56:55', 3, 2518, 13),
(2843, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:57:01', 5, 2518, 14),
(2844, '1104-ARMADO DE MOTOR GASOLERO CH. 8 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:57:19', 3, 2518, 15),
(2845, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:57:35', 5, 2518, 16),
(2846, '1114-ARMADO DE MOTOR GASOLERO GR. 4 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:57:56', 3, 2518, 17),
(2847, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:58:03', 5, 2518, 18),
(2848, '1120-ARMADO DE MOTOR GASOLERO GR. 5 CIL.', NULL, NULL, NULL, 0, '2018-08-27 04:58:35', 3, 2518, 19),
(2849, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 04:58:50', 5, 2518, 20),
(2850, '1122-ARMADO DE MOTOR GASOLERO GR. 6 CIL.', NULL, NULL, NULL, 0, '2018-08-27 05:00:15', 3, 2518, 21),
(2851, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 05:00:26', 5, 2518, 22),
(2852, '1124-ARMADO DE MOTOR GASOLERO GR. 8 CIL.', NULL, NULL, NULL, 0, '2018-08-27 05:01:37', 3, 2518, 23),
(2853, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 05:01:45', 5, 2518, 24),
(2854, '2066-CONTROLAR Y CALIBRAR BOMBA INYECTORA', NULL, NULL, NULL, 0, '2018-08-27 05:02:49', 3, 2519, 1),
(2855, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 05:02:55', 5, 2519, 2),
(2856, '2069-CONTROLAR Y CALIBRAR INYECTORES', NULL, NULL, NULL, 0, '2018-08-27 05:03:24', 3, 2519, 3),
(2857, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 05:03:30', 5, 2519, 4),
(2858, '2075-CAMBIO DE PUNTA DE MANGA DIFERENCIAL', NULL, NULL, NULL, 0, '2018-08-27 05:03:56', 3, 2520, 1),
(2859, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 05:04:01', 5, 2520, 2),
(2860, '2080-DESVASTAR ALOJAMIENTO RULEMAN PILOTO,HACERCAMISA DE FUNDICION DEJAR TERMINADO A MEDIDA DE RULEMAN', NULL, NULL, NULL, 0, '2018-08-27 05:04:16', 3, 2520, 3),
(2861, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 05:04:24', 5, 2520, 4),
(2862, '2110-MANO DE OBRA DE SERVICIO EN CAMPO', NULL, NULL, NULL, 0, '2018-08-27 05:05:44', 3, 2521, 1),
(2863, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 05:05:51', 5, 2521, 2),
(2864, '2110-TRASLADO PARA SERVICIO EN CAMPO', NULL, NULL, NULL, 0, '2018-08-27 05:06:08', 3, 2521, 3),
(2865, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 05:06:13', 5, 2521, 4),
(2866, '2102-COLOCAR ESCANER PARA EXTRAER DATOS', NULL, NULL, NULL, 0, '2018-08-27 05:06:39', 3, 2521, 5),
(2867, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 05:06:45', 5, 2521, 6),
(2868, '2045-REPARAR TURBO CAMION', NULL, NULL, NULL, 0, '2018-08-27 05:07:06', 3, 2522, 1),
(2869, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 05:07:15', 5, 2522, 2),
(2870, '2050-REPARAR TURBO AUTOMOVIL', NULL, NULL, NULL, 0, '2018-08-27 05:07:28', 3, 2522, 3),
(2871, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 05:07:37', 5, 2522, 4),
(2872, '2060-REPARAR TURBO MAQUINA INDUSTRIAL', NULL, NULL, NULL, 0, '2018-08-27 05:07:58', 3, 2522, 5),
(2873, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 05:08:04', 5, 2522, 6),
(2874, '2038-BALANCEO CARDAN 1 TRAMO', NULL, NULL, NULL, 0, '2018-08-27 05:08:28', 3, 2523, 1),
(2875, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 05:08:33', 5, 2523, 2),
(2876, '2039-BALANCEO CARDAN 2 TRAMOS', NULL, NULL, NULL, 0, '2018-08-27 05:08:46', 3, 2523, 3),
(2877, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 05:08:51', 5, 2523, 4),
(2878, '2040-BALANCEO CARDAN 3 TRAMOS', NULL, NULL, NULL, 0, '2018-08-27 05:09:04', 3, 2523, 5),
(2879, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 05:09:09', 5, 2523, 6),
(2880, '2043-MANO DE OBRA POR HACER ENCAMISADO A 6 (SEIS) ALOJAMIENTOS DE SUPLEMENTOS DE CAMISAS', NULL, NULL, NULL, 0, '2018-08-27 05:09:30', 3, 2524, 1),
(2881, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 05:09:36', 5, 2524, 2),
(2882, '2044-ABRIR ALOJAMIENTO DE BOTADOR Y FABRICAR AL TORNO DOS CAMISAS Y COLOCAR EN BLOCK', NULL, NULL, NULL, 0, '2018-08-27 05:09:47', 3, 2524, 3),
(2883, 'CANTIDAD:', NULL, NULL, NULL, 0, '2018-08-27 05:09:53', 5, 2524, 4),
(5000, '', NULL, NULL, NULL, 0, '2018-08-27 15:54:07', 7, 5000, 1),
(6000, '', NULL, NULL, NULL, 0, '2018-08-30 13:50:47', 7, 6000, 1),
(7000, '', NULL, NULL, NULL, 0, '2018-09-12 23:33:54', 7, 7000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frm_valores_validos`
--

CREATE TABLE `frm_valores_validos` (
  `VAPO_ID` int(11) NOT NULL,
  `VALOR` varchar(100) NOT NULL,
  `FEC_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `VALO_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `frm_valores_validos`
--

INSERT INTO `frm_valores_validos` (`VAPO_ID`, `VALOR`, `FEC_CREACION`, `VALO_ID`) VALUES
(1, 'Aprobado', '2018-07-28 15:54:05', 1),
(2, 'Rechazado', '2018-07-28 15:54:10', 1),
(3, 'Aprobado', '2018-07-28 16:02:39', 2),
(4, 'Rechazado', '2018-07-28 16:02:45', 2),
(5, 'Aprobado', '2018-07-28 16:03:42', 3),
(6, 'Rechazado', '2018-07-28 16:03:46', 3),
(7, 'Aprobado', '2018-07-28 16:04:31', 4),
(8, 'Rechazado', '2018-07-28 16:04:42', 4),
(9, 'Aprobado', '2018-07-28 16:05:33', 5),
(10, 'Rechazado', '2018-07-28 16:05:38', 5),
(11, 'Aprobado', '2018-07-28 16:06:22', 6),
(12, 'Rechazado', '2018-07-28 16:06:29', 6),
(13, 'Aprobado', '2018-07-28 16:08:07', 7),
(14, 'Rechazado', '2018-07-28 16:08:15', 7),
(15, 'Aprobado', '2018-07-28 16:08:55', 8),
(16, 'Rechazado', '2018-07-28 16:09:02', 8),
(17, 'Normal', '2018-07-28 16:18:51', 9),
(18, 'Desgastada', '2018-07-28 16:19:00', 9),
(19, 'Aprobado', '2018-07-28 16:19:06', 10),
(20, 'Rechazado', '2018-07-28 16:19:11', 10),
(21, 'Normal', '2018-07-28 16:21:04', 12),
(22, 'Desgastada', '2018-07-28 16:21:10', 12),
(23, 'Aprobado', '2018-07-28 16:21:14', 13),
(24, 'Rechazado', '2018-07-28 16:21:19', 13),
(25, 'Normal', '2018-07-28 16:22:35', 15),
(26, 'Desgastado', '2018-07-28 16:22:41', 15),
(27, 'Aprobado', '2018-07-28 16:22:45', 16),
(28, 'Rechazada', '2018-07-28 16:23:00', 16),
(29, 'Normal', '2018-07-28 16:23:52', 18),
(30, 'Desgastada', '2018-07-28 16:23:59', 18),
(31, 'Aprobado', '2018-07-28 16:24:03', 19),
(32, 'Rechazada', '2018-07-28 16:24:08', 19),
(33, 'Normal', '2018-07-28 16:25:25', 24),
(34, 'Desgastada', '2018-07-28 16:25:31', 24),
(35, 'Aprobado', '2018-07-28 16:25:35', 25),
(36, 'Rechazado', '2018-07-28 16:25:40', 25),
(37, 'Normal', '2018-07-28 16:26:16', 21),
(38, 'Desgastada', '2018-07-28 16:26:20', 21),
(39, 'Aprobado', '2018-07-28 16:26:24', 22),
(40, 'Rechazado', '2018-07-28 16:26:28', 22),
(41, 'Chapa', '2018-07-28 17:19:00', 33),
(42, 'Aluminio', '2018-07-28 17:19:07', 33),
(43, 'Otro', '2018-07-28 17:19:12', 33),
(44, 'Aprobado', '2018-07-28 17:19:25', 34),
(45, 'Rechazado:', '2018-07-28 17:19:40', 34),
(46, 'Aprobado_Reparar(*)', '2018-07-28 17:20:05', 34),
(47, 'Chapa', '2018-07-28 17:22:13', 36),
(48, 'Aluminio', '2018-07-28 17:22:19', 36),
(49, 'Otro', '2018-07-28 17:22:22', 36),
(50, 'Aprobado', '2018-07-28 17:22:42', 37),
(51, 'Rechazado', '2018-07-28 17:22:48', 37),
(52, 'Aprobado-Reparar(*)', '2018-07-28 17:23:00', 37),
(53, 'Chapa', '2018-07-28 17:23:56', 39),
(54, 'Aluminio', '2018-07-28 17:24:00', 39),
(55, 'Aprobado', '2018-07-28 17:24:11', 40),
(56, 'Rechazado', '2018-07-28 17:24:17', 40),
(57, 'Aprobado-Reparar(*)', '2018-07-28 17:24:26', 40),
(58, 'Fundicion', '2018-07-28 17:25:31', 42),
(59, 'Aluminio', '2018-07-28 17:25:35', 42),
(60, 'Aprobado', '2018-07-28 17:25:42', 43),
(61, 'Rechazado', '2018-07-28 17:25:47', 43),
(62, 'Probado-Reparar(*)', '2018-07-28 17:26:04', 43),
(63, 'Fundicion', '2018-07-28 17:27:15', 45),
(64, 'Aluminio', '2018-07-28 17:27:19', 45),
(65, 'Aprobado', '2018-07-28 17:27:29', 46),
(66, 'Rechazado', '2018-07-28 17:27:32', 46),
(67, 'Aprobado-Reparar(*)', '2018-07-28 17:27:49', 46),
(68, 'Embrague', '2018-07-28 17:36:06', 48),
(69, 'Convertidor', '2018-07-28 17:36:11', 48),
(70, 'Aprobado', '2018-07-28 17:36:45', 49),
(71, 'Rechazado', '2018-07-28 17:36:50', 49),
(72, 'Aprobado-Reparar(*)', '2018-07-28 17:37:01', 49),
(73, 'Abulonada', '2018-07-28 17:38:12', 51),
(74, 'Clavada', '2018-07-28 17:38:18', 51),
(75, 'Aprobado', '2018-07-28 17:38:23', 52),
(76, 'Rechazado', '2018-07-28 17:38:29', 52),
(77, 'Aprobado-Reparar(*)', '2018-07-28 17:38:38', 52),
(78, 'Armonica', '2018-07-28 17:39:14', 54),
(79, 'Fija', '2018-07-28 17:39:18', 54),
(80, 'Vias', '2018-07-28 17:39:21', 54),
(81, 'Aprobado', '2018-07-28 17:39:29', 55),
(82, 'Rechazado', '2018-07-28 17:39:35', 55),
(83, 'Aprobado-Reparar(*)', '2018-07-28 17:39:45', 55),
(84, 'Rectos', '2018-07-28 17:40:18', 57),
(85, 'Helicoidales', '2018-07-28 17:40:26', 57),
(86, 'Aprobado', '2018-07-28 17:40:32', 58),
(87, 'Rechazado', '2018-07-28 17:40:36', 58),
(88, 'Aprobado-Reparar(*)', '2018-07-28 17:40:48', 58),
(89, 'Cerrada', '2018-07-28 17:41:51', 60),
(90, 'Fija', '2018-07-28 17:41:55', 60),
(91, 'Aprobada', '2018-07-28 17:42:05', 61),
(92, 'Rechazada', '2018-07-28 17:42:13', 61),
(93, 'Aprobada-Reparar(*)', '2018-07-28 17:42:26', 61),
(94, 'Aprobado', '2018-07-28 17:43:11', 63),
(95, 'Rechazado', '2018-07-28 17:43:29', 63),
(96, 'Aprobado-Reparar(*)', '2018-07-28 17:43:38', 63),
(97, 'Aprobado', '2018-07-28 17:45:17', 65),
(98, 'Rechazado', '2018-07-28 17:45:23', 65),
(99, 'Aprobado-Reparar(*)', '2018-07-28 17:45:32', 65),
(100, 'Chapa', '2018-07-28 17:51:09', 67),
(101, 'Plastica', '2018-07-28 17:51:13', 67),
(102, 'Aprobado', '2018-07-28 17:51:20', 68),
(103, 'Rechazado', '2018-07-28 17:51:25', 68),
(104, 'Aprobado-Reparar(*)', '2018-07-28 17:51:40', 68),
(105, 'Fundicion ', '2018-07-28 17:53:34', 70),
(106, 'Aluminio', '2018-07-28 17:53:39', 70),
(107, 'Vias', '2018-07-28 17:53:43', 70),
(108, 'Aprobado', '2018-07-28 17:53:52', 71),
(109, 'Rechazado', '2018-07-28 17:53:56', 71),
(110, 'Aprobado-Reparar(*)', '2018-07-28 17:54:06', 71),
(111, 'Aprobado', '2018-07-28 17:58:24', 73),
(112, 'Rechazado', '2018-07-28 17:58:30', 73),
(113, 'Aprobado-Reparar(*)', '2018-07-28 17:58:47', 73),
(114, 'Aprobado', '2018-07-28 17:59:00', 75),
(115, 'Rechazado', '2018-07-28 17:59:04', 75),
(116, 'Aprobado-Reparar(*)', '2018-07-28 17:59:16', 75),
(117, 'Engranaje', '2018-07-28 18:12:17', 77),
(118, 'Lobulo', '2018-07-28 18:12:22', 77),
(119, 'Aprobado', '2018-07-28 18:12:28', 78),
(120, 'Rechazado', '2018-07-28 18:12:33', 78),
(121, 'Aprobado-Reparar(*)', '2018-07-28 18:12:52', 78),
(122, 'Mecanico', '2018-07-28 18:13:03', 80),
(123, 'Electrico', '2018-07-28 18:13:07', 80),
(124, 'Aprobado', '2018-07-28 18:13:12', 81),
(125, 'Rechazado', '2018-07-28 18:13:17', 81),
(126, 'Aprobado-Reparar(*)', '2018-07-28 18:13:31', 81),
(127, 'Chapa', '2018-07-28 18:13:44', 83),
(128, 'Aluminio', '2018-07-28 18:13:47', 83),
(129, 'Aprobado', '2018-07-28 18:13:52', 84),
(130, 'Rechazado', '2018-07-28 18:13:56', 84),
(131, 'Aprobado-Reparar(*)', '2018-07-28 18:14:11', 84),
(132, 'Chapa', '2018-07-28 18:14:21', 86),
(133, 'Aluminio', '2018-07-28 18:14:25', 86),
(134, 'Aprobado', '2018-07-28 18:14:31', 87),
(135, 'Rechazado', '2018-07-28 18:14:36', 87),
(136, 'Aprobado-Reparar(*)', '2018-07-28 18:14:46', 87),
(137, 'Chapa', '2018-07-28 18:14:54', 89),
(138, 'Aluminio', '2018-07-28 18:15:03', 89),
(139, 'Aprobado', '2018-07-28 18:15:10', 90),
(140, 'Rechazado', '2018-07-28 18:15:14', 90),
(141, 'Aprobado-Reparar(*)', '2018-07-28 18:15:24', 90),
(142, 'Chapa', '2018-07-28 18:15:42', 92),
(143, 'Aluminio', '2018-07-28 18:15:45', 92),
(144, 'Aprobado', '2018-07-28 18:15:51', 93),
(145, 'Rechazado', '2018-07-28 18:15:54', 93),
(146, 'Aprobado-Reparar(*)', '2018-07-28 18:16:04', 93),
(147, 'STD', '2018-07-28 18:16:18', 95),
(148, 'Modificada', '2018-07-28 18:16:51', 95),
(149, 'Aprobada', '2018-07-28 18:16:59', 96),
(150, 'Rechazada', '2018-07-28 18:17:06', 96),
(151, 'Fundicion', '2018-07-28 18:17:19', 98),
(152, 'Aluminio', '2018-07-28 18:17:23', 98),
(153, 'Aprobado', '2018-07-28 18:17:29', 99),
(154, 'Rechazado', '2018-07-28 18:17:33', 99),
(155, 'Aprobado-Reparar(*)', '2018-07-28 18:17:44', 99),
(156, 'Fundicion', '2018-07-28 18:18:08', 101),
(157, 'Aluminio', '2018-07-28 18:18:14', 101),
(158, 'Aprobado', '2018-07-28 18:18:20', 102),
(159, 'Rechazado', '2018-07-28 18:18:24', 102),
(160, 'Aprobado-Reparar(*)', '2018-07-28 18:18:38', 102),
(161, 'Chapa', '2018-07-28 18:18:46', 104),
(162, 'Aluminio', '2018-07-28 18:18:50', 104),
(163, 'Aprobado', '2018-07-28 18:19:00', 105),
(164, 'Rechazado', '2018-07-28 18:19:07', 105),
(165, 'Aprobado-Reparar(*)', '2018-07-28 18:19:19', 105),
(166, 'Chapa', '2018-07-28 18:19:34', 107),
(167, 'Flexibles', '2018-07-28 18:19:39', 107),
(168, 'Aprobado ', '2018-07-28 18:19:52', 108),
(169, 'Rechazado', '2018-07-28 18:19:55', 108),
(170, 'Aprobado-Reparar(*)', '2018-07-28 18:20:06', 108),
(171, 'Chapa', '2018-07-28 18:20:18', 110),
(172, 'Aluminio', '2018-07-28 18:20:23', 110),
(173, 'Aprobado', '2018-07-28 18:20:28', 111),
(174, 'Rechazado', '2018-07-28 18:20:33', 111),
(175, 'Aprobado-Reparar(*)', '2018-07-28 18:20:45', 111),
(176, 'Chapa', '2018-07-28 18:20:57', 113),
(177, 'Aluminio', '2018-07-28 18:21:02', 113),
(178, 'Aprobado', '2018-07-28 18:21:08', 114),
(179, 'Rechazado', '2018-07-28 18:21:13', 114),
(180, 'Aprobado-Reparar(*)', '2018-07-28 18:21:22', 114),
(181, 'Turbina Fundicion', '2018-07-28 18:29:29', 116),
(182, 'Turbina Aluminio', '2018-07-28 18:29:37', 116),
(183, 'Turbina Plastico', '2018-07-28 18:29:53', 116),
(184, 'Turbina Bronce', '2018-07-28 18:30:00', 116),
(185, 'Aprobado', '2018-07-28 18:30:29', 117),
(186, 'Rechazado', '2018-07-28 18:30:35', 117),
(187, 'Aprobado-Reparar(*)', '2018-07-28 18:30:47', 117),
(188, 'Agua', '2018-07-28 18:31:03', 119),
(189, 'Metal', '2018-07-28 18:31:07', 119),
(190, 'Aprobado', '2018-07-28 18:31:14', 120),
(191, 'Rechazado', '2018-07-28 18:31:20', 120),
(192, 'Aprobado-Reparar(*)', '2018-07-28 18:31:30', 120),
(193, 'Apertura', '2018-07-28 18:31:40', 122),
(194, 'Aprobado', '2018-07-28 18:31:49', 123),
(195, 'Rechazado', '2018-07-28 18:32:07', 123),
(196, 'Aprobado-Reparar(*)', '2018-07-28 18:32:16', 123),
(197, 'Fundicion', '2018-07-28 18:33:03', 125),
(198, 'Aluminio', '2018-07-28 18:33:07', 125),
(199, 'Aprobado', '2018-07-28 18:33:12', 126),
(200, 'Rechazado', '2018-07-28 18:33:16', 126),
(201, 'Aprobado-Reparar(*)', '2018-07-28 18:33:31', 126),
(202, 'Fundicion', '2018-07-28 18:33:44', 128),
(203, 'Aluminio', '2018-07-28 18:33:51', 128),
(204, 'Aprobado', '2018-07-28 18:33:58', 129),
(205, 'Rechazado', '2018-07-28 18:34:02', 129),
(206, 'Aprobado-Reparar(*)', '2018-07-28 18:34:16', 129),
(207, 'Fundicion', '2018-07-28 18:34:55', 131),
(208, 'Aluminio', '2018-07-28 18:35:03', 131),
(209, 'Aprobado', '2018-07-28 18:35:08', 132),
(210, 'Rechazado', '2018-07-28 18:35:12', 132),
(211, 'Aprobado-Reparar(*)', '2018-07-28 18:35:21', 132),
(212, 'Chapa', '2018-07-28 18:35:31', 134),
(213, 'Plastico', '2018-07-28 18:35:37', 134),
(214, 'Aprobado', '2018-07-28 18:35:42', 135),
(215, 'Rechazado', '2018-07-28 18:35:49', 135),
(216, 'Aprobado-Reparar(*)', '2018-07-28 18:36:01', 135),
(217, 'Chapa', '2018-07-28 18:36:10', 137),
(218, 'Aluminio', '2018-07-28 18:36:14', 137),
(219, 'Aprobado', '2018-07-28 18:37:19', 138),
(220, 'Rechazado', '2018-07-28 18:37:23', 138),
(221, 'Aprobado-Reparar(*)', '2018-07-28 18:37:33', 138),
(222, 'Aprobado', '2018-07-28 18:38:06', 141),
(223, 'Rechazado', '2018-07-28 18:38:10', 141),
(224, 'Aprobado-Reparar(*)', '2018-07-28 18:38:21', 141),
(225, 'Aprobado', '2018-07-28 18:38:36', 144),
(226, 'Rechazado', '2018-07-28 18:38:41', 144),
(227, 'Aprobado-Reparar(*)', '2018-07-28 18:38:52', 144),
(228, 'Lineal', '2018-07-28 18:41:15', 146),
(229, 'Rotativa', '2018-07-28 18:41:21', 146),
(230, 'Aprobado', '2018-07-28 18:41:26', 147),
(231, 'Rechazado', '2018-07-28 18:41:29', 147),
(232, 'Aprobado-Reparar(*)', '2018-07-28 18:41:40', 147),
(233, 'Comman Rail', '2018-07-28 18:43:01', 149),
(234, 'Aprobado', '2018-07-28 18:43:18', 150),
(235, 'Rechazado', '2018-07-28 18:43:23', 150),
(236, 'Aprobado-Reparar(*)', '2018-07-28 18:43:33', 150),
(237, 'Mecanico', '2018-07-28 18:44:23', 152),
(238, 'Electrico', '2018-07-28 18:44:26', 152),
(239, 'Aprobado', '2018-07-28 18:44:31', 153),
(240, 'Rechazado', '2018-07-28 18:44:35', 153),
(241, 'Aprobado-Reparar(*)', '2018-07-28 18:44:46', 153),
(242, 'Directa', '2018-07-28 18:46:11', 155),
(243, 'Indirecta', '2018-07-28 18:46:15', 155),
(244, 'Aprobado', '2018-07-28 18:46:20', 156),
(245, 'Rechazado', '2018-07-28 18:46:24', 156),
(246, 'Aprobado-Reparar(*)', '2018-07-28 18:46:39', 156),
(247, 'Aprobado', '2018-07-28 18:47:31', 158),
(248, 'Rechazado', '2018-07-28 18:47:36', 158),
(249, 'Aprobado-Reparar(*)', '2018-07-28 18:47:48', 158),
(250, 'Aprobado', '2018-07-28 18:50:22', 160),
(251, 'Rechazado', '2018-07-28 18:50:27', 160),
(252, 'Aprobado-Reparar(*)', '2018-07-28 18:50:49', 160),
(253, 'Aprobado', '2018-07-28 18:53:01', 163),
(254, 'Rechazado', '2018-07-28 18:53:09', 163),
(255, 'Aprobado-Reparar(*)', '2018-07-28 18:53:22', 163),
(256, 'Aprobado', '2018-07-28 18:54:07', 165),
(257, 'Rechazado', '2018-07-28 18:54:13', 165),
(258, 'Aprobado-Reparar(*)', '2018-07-28 18:54:23', 165),
(259, 'Mecanico', '2018-07-28 18:55:13', 167),
(260, 'Electrico', '2018-07-28 18:55:17', 167),
(261, 'Aprobado', '2018-07-28 18:55:26', 168),
(262, 'Rechazado', '2018-07-28 18:55:30', 168),
(263, 'Aprobado-Reparar(*)', '2018-07-28 18:55:40', 168),
(264, 'Mecanico', '2018-07-28 18:56:31', 170),
(265, 'Electrico', '2018-07-28 18:56:39', 170),
(266, 'Aprobado', '2018-07-28 18:56:46', 171),
(267, 'Rechazado', '2018-07-28 18:57:20', 171),
(268, 'Aprobado-Reparar(*)', '2018-07-28 18:57:38', 171),
(269, 'Manual', '2018-07-28 18:58:23', 173),
(270, 'Electrico', '2018-07-28 18:58:31', 173),
(271, 'Aprobado', '2018-07-28 18:58:42', 174),
(272, 'Rechazado', '2018-07-28 18:58:46', 174),
(273, 'Aprobado-Reparar(*)', '2018-07-28 18:59:00', 174),
(274, 'Fundicion', '2018-07-28 19:00:35', 176),
(275, 'Aluminio', '2018-07-28 19:00:41', 176),
(276, 'Aprobado', '2018-07-28 19:00:50', 177),
(277, 'Rechazado', '2018-07-28 19:00:56', 177),
(278, 'Aprobado-Reparar(*)', '2018-07-28 19:01:09', 177),
(279, 'Simples', '2018-07-28 19:02:04', 179),
(280, 'Combinados', '2018-07-28 19:02:10', 179),
(281, 'Aprobado', '2018-07-28 19:02:16', 180),
(282, 'Rechazar', '2018-07-28 19:02:22', 180),
(283, 'Aprobado-Reparar(*)', '2018-07-28 19:02:31', 180),
(284, 'Aprobado', '2018-07-28 22:25:22', 183),
(285, 'Rechazado', '2018-07-28 22:25:27', 183),
(286, 'Aprobado-Reparar(*)', '2018-07-28 22:25:38', 183),
(287, 'Aprobado', '2018-07-28 22:26:43', 185),
(288, 'Rechazado', '2018-07-28 22:26:53', 185),
(289, 'Aprobado-Reparar(*)', '2018-07-28 22:27:30', 185),
(290, 'Aprobado', '2018-07-28 22:27:57', 187),
(291, 'Rechazado', '2018-07-28 22:28:05', 187),
(292, 'Aprobado-Reparar(*)', '2018-07-28 22:28:18', 187),
(293, 'Aprobado', '2018-07-28 22:29:36', 189),
(294, 'Rechazado', '2018-07-28 22:29:41', 189),
(295, 'Aprobado-Reparar(*)', '2018-07-28 22:29:58', 189),
(296, 'Aprobado', '2018-07-28 22:32:15', 191),
(297, 'Rechazado', '2018-07-28 22:32:20', 191),
(298, 'Aprobado-Reparar(*)', '2018-07-28 22:32:33', 191),
(299, 'Aprobado', '2018-07-28 22:38:01', 193),
(300, 'Rechazado', '2018-07-28 22:38:10', 193),
(301, 'Aprobado-Reparar(*)', '2018-07-28 22:38:44', 193),
(302, 'Aprobado', '2018-07-28 22:46:31', 208),
(303, 'Rechazado', '2018-07-28 22:46:35', 208),
(304, 'Aprobado-Reparar(*)', '2018-07-28 22:46:49', 208),
(305, 'Aprobado', '2018-07-28 22:46:59', 205),
(306, 'Rechazado', '2018-07-28 22:47:04', 205),
(307, 'Aprobado-Reparar(*)', '2018-07-28 22:47:18', 205),
(308, 'Aprobado', '2018-07-28 22:47:26', 195),
(309, 'Rechazado', '2018-07-28 22:48:08', 195),
(310, 'Aprobado-Reparar(*)', '2018-07-28 22:48:18', 195),
(311, 'Aprobado', '2018-07-28 23:04:16', 210),
(312, 'Rechazado', '2018-07-28 23:04:16', 210),
(316, 'Aprobado', '2018-07-28 23:13:50', 222),
(317, 'Rechazado', '2018-07-28 23:13:50', 222),
(318, 'Aprobado', '2018-07-28 23:17:41', 226),
(319, 'Rechazado', '2018-07-28 23:17:41', 226),
(320, 'Aprobado', '2018-07-28 23:18:28', 229),
(321, 'Rechazado', '2018-07-28 23:18:28', 229),
(322, 'Aprobado', '2018-07-28 23:19:14', 232),
(323, 'Rechazado', '2018-07-28 23:19:14', 232),
(324, 'Brinell', '2018-07-28 23:20:06', 233),
(325, 'Rc', '2018-07-28 23:20:09', 233),
(326, 'Brinell', '2018-07-28 23:20:44', 234),
(327, 'Rc', '2018-07-28 23:20:47', 234),
(328, 'Brinell', '2018-07-28 23:21:10', 235),
(329, 'Rc', '2018-07-28 23:21:13', 235),
(330, 'Aprobado', '2018-07-28 23:22:21', 236),
(331, 'Rechazado', '2018-07-28 23:22:21', 236),
(332, 'Aprobado', '2018-07-28 23:22:23', 237),
(333, 'Rechazado', '2018-07-28 23:22:23', 237),
(334, 'Aprobado', '2018-07-28 23:22:25', 238),
(335, 'Rechazado', '2018-07-28 23:22:25', 238),
(336, 'Aprobado', '2018-07-28 23:22:27', 239),
(337, 'Rechazado', '2018-07-28 23:22:27', 239),
(338, 'Aprobado', '2018-07-28 23:23:07', 240),
(339, 'Rechazado', '2018-07-28 23:23:07', 240),
(340, 'Aprobado', '2018-07-28 23:23:12', 241),
(341, 'Rechazado', '2018-07-28 23:23:12', 241),
(342, 'Aprobado', '2018-07-28 23:29:54', 242),
(343, 'Rechazado', '2018-07-28 23:29:54', 242),
(344, 'Fundido', '2018-07-28 23:31:46', 244),
(345, '(*)Desgaste Axial', '2018-07-28 23:31:52', 244),
(346, 'Reemplazar', '2018-07-28 23:31:57', 244),
(347, 'Fundido', '2018-07-28 23:32:19', 245),
(348, '(*)Desgaste Axial', '2018-07-28 23:32:30', 245),
(349, 'Reemplazar', '2018-07-28 23:32:36', 245),
(350, 'Fundido', '2018-07-28 23:33:04', 246),
(351, '(*)Desgaste Axial', '2018-07-28 23:33:12', 246),
(352, 'Reemplazar', '2018-07-28 23:33:21', 246),
(353, 'Fundida', '2018-07-28 23:35:08', 247),
(354, '(*)Desgaste Axial', '2018-07-28 23:35:15', 247),
(355, 'Reemplazar', '2018-07-28 23:35:23', 247),
(356, 'Fundido ', '2018-07-28 23:35:30', 248),
(357, '(*)Desgaste Axial', '2018-07-28 23:35:41', 248),
(358, 'Reemplazar', '2018-07-28 23:35:48', 248),
(359, 'Fundida', '2018-07-28 23:35:57', 249),
(360, '(*)Desgaste Axial', '2018-07-28 23:35:59', 249),
(361, 'Reemplazar', '2018-07-28 23:36:11', 249),
(362, 'Fundida', '2018-07-28 23:36:41', 250),
(363, '(*)Desgaste Axial', '2018-07-28 23:36:43', 250),
(364, 'Reemplazar', '2018-07-28 23:36:49', 250),
(365, 'Fundida', '2018-07-28 23:37:09', 251),
(366, '(*)Desgaste Axial', '2018-07-28 23:37:11', 251),
(367, 'Reemplazar', '2018-07-28 23:37:16', 251),
(368, 'Fundida', '2018-07-28 23:37:30', 252),
(369, '(*)Desgaste Axial', '2018-07-28 23:37:33', 252),
(370, 'Reemplazar', '2018-07-28 23:37:38', 252),
(371, 'Fundido', '2018-07-28 23:38:00', 253),
(372, '(*)Desgaste Axial', '2018-07-28 23:38:02', 253),
(373, 'Reemplazar', '2018-07-28 23:38:14', 253),
(374, 'Fundido', '2018-07-28 23:38:32', 254),
(375, '(*)Desgaste Axial', '2018-07-28 23:38:34', 254),
(376, 'Reemplazar', '2018-07-28 23:38:39', 254),
(377, 'Fundido', '2018-07-28 23:38:54', 255),
(378, '(*)Desgaste Axial', '2018-07-28 23:38:58', 255),
(379, 'Reemplazar', '2018-07-28 23:39:02', 255),
(380, 'Fundido', '2018-07-28 23:39:21', 256),
(381, '(*)Desgaste Axial', '2018-07-28 23:39:23', 256),
(382, 'Reemplazar', '2018-07-28 23:39:30', 256),
(383, 'Fundido', '2018-07-28 23:39:49', 257),
(384, '(*)Desgaste Axial', '2018-07-28 23:39:51', 257),
(385, 'Reemplazar', '2018-07-28 23:39:57', 257),
(386, 'Fundido', '2018-07-28 23:40:11', 258),
(387, '(*)Desgaste Axial', '2018-07-28 23:40:13', 258),
(388, 'Reemplazar', '2018-07-28 23:40:17', 258),
(389, 'Fundido', '2018-07-28 23:40:39', 259),
(390, '(*)Desgaste Axial', '2018-07-28 23:40:41', 259),
(391, 'Reemplazar', '2018-07-28 23:40:47', 259),
(392, 'Fundido', '2018-07-28 23:41:02', 260),
(393, '(*)Desgaste Axial', '2018-07-28 23:41:05', 260),
(394, 'Reemplazar', '2018-07-28 23:41:11', 260),
(395, 'Aprobado', '2018-07-28 23:46:15', 261),
(396, 'Rechazado', '2018-07-28 23:46:15', 261),
(397, 'Aprobado', '2018-07-28 23:46:17', 262),
(398, 'Rechazado', '2018-07-28 23:46:17', 262),
(399, 'Aprobado', '2018-07-28 23:46:19', 263),
(400, 'Rechazado', '2018-07-28 23:46:19', 263),
(401, 'Aprobado', '2018-07-28 23:46:21', 264),
(402, 'Rechazado', '2018-07-28 23:46:21', 264),
(403, 'Aprobado', '2018-07-28 23:46:23', 265),
(404, 'Rechazado', '2018-07-28 23:46:23', 265),
(405, 'Aprobado', '2018-07-28 23:46:25', 266),
(406, 'Rechazado', '2018-07-28 23:46:25', 266),
(407, 'Aprobado', '2018-07-28 23:46:27', 267),
(408, 'Rechazado', '2018-07-28 23:46:27', 267),
(409, 'Aprobado', '2018-07-28 23:46:30', 268),
(410, 'Rechazado', '2018-07-28 23:46:30', 268),
(411, 'Aprobado', '2018-07-28 23:46:33', 269),
(412, 'Rechazado', '2018-07-28 23:46:33', 269),
(413, 'Aprobado', '2018-07-28 23:46:39', 270),
(414, 'Rechazado', '2018-07-28 23:46:39', 270),
(415, 'Aprobado', '2018-07-28 23:46:41', 271),
(416, 'Rechazado', '2018-07-28 23:46:41', 271),
(417, 'Aprobado', '2018-07-28 23:46:50', 272),
(418, 'Rechazado', '2018-07-28 23:46:50', 272),
(419, 'Aprobado', '2018-07-28 23:46:53', 273),
(420, 'Rechazado', '2018-07-28 23:46:53', 273),
(421, 'Aprobado', '2018-07-28 23:46:54', 274),
(422, 'Rechazado', '2018-07-28 23:46:54', 274),
(423, 'Aprobado', '2018-07-28 23:46:57', 275),
(424, 'Rechazado', '2018-07-28 23:46:57', 275),
(425, 'Aprobado', '2018-07-28 23:46:59', 276),
(426, 'Rechazado', '2018-07-28 23:46:59', 276),
(427, 'Aprobado', '2018-07-28 23:47:02', 277),
(428, 'Rechazado', '2018-07-28 23:47:02', 277),
(429, 'Aprobado', '2018-07-29 04:22:41', 333),
(430, 'Rechazado', '2018-07-29 04:22:41', 333),
(431, 'Aprobado', '2018-07-29 04:22:49', 334),
(432, 'Rechazado', '2018-07-29 04:22:49', 334),
(433, 'Aprobado', '2018-07-29 04:22:58', 335),
(434, 'Rechazado', '2018-07-29 04:22:58', 335),
(435, 'Aprobado', '2018-07-29 04:23:08', 336),
(436, 'Rechazado', '2018-07-29 04:23:08', 336),
(437, 'Aprobado', '2018-07-29 04:23:16', 337),
(438, 'Rechazado', '2018-07-29 04:23:16', 337),
(439, 'Aprobado', '2018-07-29 04:25:25', 338),
(440, 'Rechazado', '2018-07-29 04:25:25', 338),
(441, 'Aprobado', '2018-07-29 04:25:33', 339),
(442, 'Rechazado', '2018-07-29 04:25:33', 339),
(443, 'Aprobado', '2018-07-29 04:25:40', 340),
(444, 'Rechazado', '2018-07-29 04:25:40', 340),
(445, 'Aprobado', '2018-07-29 04:25:54', 341),
(446, 'Rechazado', '2018-07-29 04:25:54', 341),
(447, 'Aprobado', '2018-07-29 04:26:02', 342),
(448, 'Rechazado', '2018-07-29 04:26:02', 342),
(449, 'Aprobado', '2018-07-29 04:26:08', 343),
(450, 'Rechazado', '2018-07-29 04:26:08', 343),
(451, 'Aprobado', '2018-07-29 04:26:15', 344),
(452, 'Rechazado', '2018-07-29 04:26:15', 344),
(453, 'Aprobado', '2018-07-29 04:26:25', 345),
(454, 'Rechazado', '2018-07-29 04:26:25', 345),
(455, 'Aprobado', '2018-07-29 04:26:33', 346),
(456, 'Rechazado', '2018-07-29 04:26:33', 346),
(457, 'Aprobado', '2018-07-29 04:26:43', 347),
(458, 'Rechazado', '2018-07-29 04:26:44', 347),
(459, 'Aprobado', '2018-07-29 04:26:52', 348),
(460, 'Rechazado', '2018-07-29 04:26:52', 348),
(461, 'Aprobado', '2018-07-29 04:27:01', 349),
(462, 'Rechazado', '2018-07-29 04:27:01', 349),
(463, 'Aprobado', '2018-07-29 04:29:30', 352),
(464, 'Rechazado', '2018-07-29 04:29:30', 352),
(465, 'Aprobado', '2018-07-29 04:29:36', 353),
(466, 'Rechazado', '2018-07-29 04:29:36', 353),
(467, 'Aprobado', '2018-07-29 04:30:08', 354),
(468, 'Rechazado', '2018-07-29 04:30:08', 354),
(469, 'Aprobado', '2018-07-29 04:30:16', 355),
(470, 'Rechazado', '2018-07-29 04:30:16', 355),
(471, 'Aprobado', '2018-07-29 04:30:27', 356),
(472, 'Rechazado', '2018-07-29 04:30:27', 356),
(473, 'Aprobado', '2018-07-29 04:31:17', 357),
(474, 'Rechazado', '2018-07-29 04:31:17', 357),
(475, 'Aprobado', '2018-07-29 04:31:20', 358),
(476, 'Rechazado', '2018-07-29 04:31:20', 358),
(477, 'Aprobado', '2018-07-29 04:31:23', 359),
(478, 'Rechazado', '2018-07-29 04:31:23', 359),
(479, 'Aprobado', '2018-07-29 04:31:26', 360),
(480, 'Rechazado', '2018-07-29 04:31:26', 360),
(481, 'Aprobado', '2018-07-29 04:31:28', 361),
(482, 'Rechazado', '2018-07-29 04:31:28', 361),
(483, 'Aprobado', '2018-07-29 04:31:31', 362),
(484, 'Rechazado', '2018-07-29 04:31:31', 362),
(485, 'Aprobado', '2018-07-29 04:31:34', 363),
(486, 'Rechazado', '2018-07-29 04:31:34', 363),
(487, 'Aprobado', '2018-07-29 04:31:37', 364),
(488, 'Rechazado', '2018-07-29 04:31:37', 364),
(489, 'Aprobado', '2018-07-29 04:31:39', 365),
(490, 'Rechazado', '2018-07-29 04:31:39', 365),
(491, 'Aprobado', '2018-07-29 04:31:42', 366),
(492, 'Rechazado', '2018-07-29 04:31:42', 366),
(493, 'Aprobado', '2018-07-29 04:31:45', 367),
(494, 'Rechazado', '2018-07-29 04:31:45', 367),
(495, 'Aprobado', '2018-07-29 04:31:47', 368),
(496, 'Rechazado', '2018-07-29 04:31:47', 368),
(497, 'Aprobado', '2018-07-29 04:34:25', 369),
(498, 'Rechazado', '2018-07-29 04:34:25', 369),
(499, 'Aprobado', '2018-07-29 04:34:27', 370),
(500, 'Rechazado', '2018-07-29 04:34:27', 370),
(501, 'Aprobado', '2018-07-29 04:34:29', 371),
(502, 'Rechazado', '2018-07-29 04:34:29', 371),
(503, 'Aprobado', '2018-07-29 04:34:32', 372),
(504, 'Rechazado', '2018-07-29 04:34:32', 372),
(505, 'Aprobado', '2018-07-29 04:34:34', 373),
(506, 'Rechazado', '2018-07-29 04:34:34', 373),
(507, 'Aprobado', '2018-07-29 04:34:36', 374),
(508, 'Rechazado', '2018-07-29 04:34:36', 374),
(509, 'Aprobado', '2018-07-29 04:34:39', 375),
(510, 'Rechazado', '2018-07-29 04:34:39', 375),
(511, 'Aprobado', '2018-07-29 04:34:41', 376),
(512, 'Rechazado', '2018-07-29 04:34:41', 376),
(513, 'Aprobado', '2018-07-29 04:34:44', 377),
(514, 'Rechazado', '2018-07-29 04:34:44', 377),
(515, 'Aprobado', '2018-07-29 04:34:47', 378),
(516, 'Rechazado', '2018-07-29 04:34:47', 378),
(517, 'Aprobado', '2018-07-29 04:34:51', 379),
(518, 'Rechazado', '2018-07-29 04:34:51', 379),
(519, 'Aprobado', '2018-07-29 04:34:54', 380),
(520, 'Rechazado', '2018-07-29 04:34:54', 380),
(521, 'Aprobado', '2018-07-29 04:34:56', 381),
(522, 'Rechazado', '2018-07-29 04:34:56', 381),
(523, 'Aprobado', '2018-07-29 04:34:59', 382),
(524, 'Rechazado', '2018-07-29 04:34:59', 382),
(525, 'Aprobado', '2018-07-29 04:35:02', 383),
(526, 'Rechazado', '2018-07-29 04:35:02', 383),
(527, 'Aprobado', '2018-07-29 04:35:04', 384),
(528, 'Rechazado', '2018-07-29 04:35:04', 384),
(529, 'Aprobado', '2018-07-29 04:35:07', 385),
(530, 'Rechazado', '2018-07-29 04:35:07', 385),
(531, 'Aprobado', '2018-07-29 04:37:05', 387),
(532, 'Rechazado', '2018-07-29 04:37:05', 387),
(533, 'Guias', '2018-07-29 04:37:18', 386),
(534, 'Dentadas', '2018-07-29 04:37:28', 386),
(535, 'Fracturadas', '2018-07-29 04:37:37', 386),
(536, 'Aprobado', '2018-07-29 04:37:59', 389),
(537, 'Rechazado', '2018-07-29 04:37:59', 389),
(538, 'Guias', '2018-07-29 04:38:05', 388),
(539, 'Dentadas', '2018-07-29 04:38:10', 388),
(540, 'Fracturadas', '2018-07-29 04:38:18', 388),
(541, 'Aprobado', '2018-07-29 04:38:55', 391),
(542, 'Rechazado', '2018-07-29 04:38:55', 391),
(543, 'Guias', '2018-07-29 04:39:03', 390),
(544, 'Dentadas', '2018-07-29 04:39:11', 390),
(545, 'Fracturadas', '2018-07-29 04:39:22', 390),
(546, 'Aprobado', '2018-07-29 04:40:28', 393),
(547, 'Rechazado', '2018-07-29 04:40:28', 393),
(548, 'Guias', '2018-07-29 04:40:34', 392),
(549, 'Dentadas', '2018-07-29 04:40:43', 392),
(550, 'Fracturadas', '2018-07-29 04:41:04', 392),
(551, 'Aprobado', '2018-07-29 04:41:17', 395),
(552, 'Rechazado', '2018-07-29 04:41:17', 395),
(553, 'Guias', '2018-07-29 04:42:05', 394),
(554, 'Dentadas', '2018-07-29 04:42:12', 394),
(555, 'Fracturadas', '2018-07-29 04:42:19', 394),
(556, 'Aprobado', '2018-07-29 04:42:26', 397),
(557, 'Rechazado', '2018-07-29 04:42:26', 397),
(558, 'Guias', '2018-07-29 04:42:31', 396),
(559, 'Dentadas', '2018-07-29 04:42:36', 396),
(560, 'Fracturadas', '2018-07-29 04:42:42', 396),
(561, 'Aprobado', '2018-07-29 04:43:29', 399),
(562, 'Rechazado', '2018-07-29 04:43:29', 399),
(563, 'Guias', '2018-07-29 04:43:34', 398),
(564, 'Dentadas', '2018-07-29 04:43:39', 398),
(565, 'Fracturadas', '2018-07-29 04:43:44', 398),
(566, 'Aprobado', '2018-07-29 04:43:53', 401),
(567, 'Rechazado', '2018-07-29 04:43:53', 401),
(568, 'Guias', '2018-07-29 04:43:58', 400),
(569, 'Dentadas', '2018-07-29 04:44:03', 400),
(570, 'Fracturadas', '2018-07-29 04:44:08', 400),
(571, 'Aprobado', '2018-07-29 04:44:20', 403),
(572, 'Rechazado', '2018-07-29 04:44:20', 403),
(573, 'Guias', '2018-07-29 04:44:43', 402),
(574, 'Dentadas', '2018-07-29 04:44:47', 402),
(575, 'Fracturadas', '2018-07-29 04:44:54', 402),
(576, 'Aprobado', '2018-07-29 04:45:21', 405),
(577, 'Rechazado', '2018-07-29 04:45:21', 405),
(578, 'Guias', '2018-07-29 04:45:32', 404),
(579, 'Dentada', '2018-07-29 04:45:40', 404),
(580, 'Fracturada', '2018-07-29 04:45:46', 404),
(581, 'Aprobado', '2018-07-29 04:46:11', 407),
(582, 'Rechazado', '2018-07-29 04:46:11', 407),
(583, 'Guias', '2018-07-29 04:46:18', 406),
(584, 'Dentadas', '2018-07-29 04:46:22', 406),
(585, 'Fracturada', '2018-07-29 04:46:27', 406),
(586, 'Aprobado', '2018-07-29 04:46:54', 409),
(587, 'Rechazado', '2018-07-29 04:46:54', 409),
(588, 'Guias', '2018-07-29 04:46:59', 408),
(589, 'Dentadas', '2018-07-29 04:47:04', 408),
(590, 'Fracturada', '2018-07-29 04:47:09', 408),
(591, 'Aprobado', '2018-07-29 04:47:20', 411),
(592, 'Rechazado', '2018-07-29 04:47:20', 411),
(593, 'Guias', '2018-07-29 04:47:25', 410),
(594, 'Dentadas', '2018-07-29 04:47:33', 410),
(595, 'Fracturadas', '2018-07-29 04:47:39', 410),
(596, 'Aprobado', '2018-07-29 04:47:48', 413),
(597, 'Rechazado', '2018-07-29 04:47:48', 413),
(598, 'Guias', '2018-07-29 04:47:52', 412),
(599, 'Dentadas', '2018-07-29 04:47:56', 412),
(600, 'Fracturadas', '2018-07-29 04:48:01', 412),
(601, 'Aprobado', '2018-07-29 04:48:10', 415),
(602, 'Rechazado', '2018-07-29 04:48:10', 415),
(603, 'Guias', '2018-07-29 04:48:24', 414),
(604, 'Dentadas', '2018-07-29 04:48:30', 414),
(605, 'Fracturadas', '2018-07-29 04:48:36', 414),
(606, 'Aprobado', '2018-07-29 04:48:52', 417),
(607, 'Rechazado', '2018-07-29 04:48:52', 417),
(608, 'Guias', '2018-07-29 04:48:57', 416),
(609, 'Dentadas', '2018-07-29 04:49:03', 416),
(610, 'Fracturadas', '2018-07-29 04:49:11', 416),
(611, 'Aprobado', '2018-07-29 04:49:20', 419),
(612, 'Rechazado', '2018-07-29 04:49:20', 419),
(613, 'Guias', '2018-07-29 04:49:26', 418),
(614, 'Dentadas', '2018-07-29 04:49:32', 418),
(615, 'Fracturada', '2018-07-29 04:49:37', 418),
(616, 'Aprobado', '2018-07-29 04:50:49', 420),
(617, 'Rechazado', '2018-07-29 04:50:49', 420),
(618, 'Aprobado', '2018-07-29 04:50:51', 421),
(619, 'Rechazado', '2018-07-29 04:50:51', 421),
(620, 'Aprobado', '2018-07-29 04:50:53', 422),
(621, 'Rechazado', '2018-07-29 04:50:53', 422),
(622, 'Aprobado', '2018-07-29 04:50:55', 423),
(623, 'Rechazado', '2018-07-29 04:50:55', 423),
(624, 'Aprobado', '2018-07-29 04:50:58', 424),
(625, 'Rechazado', '2018-07-29 04:50:58', 424),
(626, 'Aprobado', '2018-07-29 04:51:00', 425),
(627, 'Rechazado', '2018-07-29 04:51:00', 425),
(628, 'Aprobado', '2018-07-29 04:51:02', 426),
(629, 'Rechazado', '2018-07-29 04:51:02', 426),
(630, 'Aprobado', '2018-07-29 04:51:04', 427),
(631, 'Rechazado', '2018-07-29 04:51:04', 427),
(632, 'Aprobado', '2018-07-29 04:51:07', 428),
(633, 'Rechazado', '2018-07-29 04:51:07', 428),
(634, 'Aprobado', '2018-07-29 04:51:09', 429),
(635, 'Rechazado', '2018-07-29 04:51:09', 429),
(636, 'Aprobado', '2018-07-29 04:51:11', 430),
(637, 'Rechazado', '2018-07-29 04:51:11', 430),
(638, 'Aprobado', '2018-07-29 04:51:14', 431),
(639, 'Rechazado', '2018-07-29 04:51:14', 431),
(640, 'Aprobado', '2018-07-29 04:51:18', 432),
(641, 'Rechazado', '2018-07-29 04:51:18', 432),
(642, 'Aprobado', '2018-07-29 04:51:21', 433),
(643, 'Rechazado', '2018-07-29 04:51:21', 433),
(644, 'Aprobado', '2018-07-29 04:51:23', 434),
(645, 'Rechazado', '2018-07-29 04:51:23', 434),
(646, 'Aprobado', '2018-07-29 04:51:26', 435),
(647, 'Rechazado', '2018-07-29 04:51:26', 435),
(648, 'Aprobado', '2018-07-29 04:51:29', 436),
(649, 'Rechazado', '2018-07-29 04:51:29', 436),
(650, 'Aprobado', '2018-07-29 04:52:07', 437),
(651, 'Rechazado', '2018-07-29 04:52:07', 437),
(652, 'Aprobado', '2018-07-29 04:52:12', 438),
(653, 'Rechazado', '2018-07-29 04:52:12', 438),
(654, 'Aprobado', '2018-07-29 04:52:18', 439),
(655, 'Rechazado', '2018-07-29 04:52:18', 439),
(656, 'Aprobado', '2018-07-29 04:52:24', 440),
(657, 'Rechazado', '2018-07-29 04:52:24', 440),
(658, 'Aprobado', '2018-07-29 04:52:30', 441),
(659, 'Rechazado', '2018-07-29 04:52:30', 441),
(660, 'Aprobado', '2018-07-29 04:52:35', 442),
(661, 'Rechazado', '2018-07-29 04:52:35', 442),
(662, 'Aprobado', '2018-07-29 04:52:42', 443),
(663, 'Rechazado', '2018-07-29 04:52:42', 443),
(664, 'Aprobado', '2018-07-29 04:52:49', 444),
(665, 'Rechazado', '2018-07-29 04:52:49', 444),
(666, 'Aprobado', '2018-07-29 04:52:55', 445),
(667, 'Rechazado', '2018-07-29 04:52:55', 445),
(668, 'Aprobado', '2018-07-29 04:53:01', 446),
(669, 'Rechazado', '2018-07-29 04:53:01', 446),
(670, 'Aprobado', '2018-07-29 04:53:07', 447),
(671, 'Rechazado', '2018-07-29 04:53:07', 447),
(672, 'Aprobado', '2018-07-29 04:53:12', 448),
(673, 'Rechazado', '2018-07-29 04:53:12', 448),
(674, 'Aprobado', '2018-07-29 04:53:19', 449),
(675, 'Rechazado', '2018-07-29 04:53:19', 449),
(676, 'Aprobado', '2018-07-29 04:53:26', 450),
(677, 'Rechazado', '2018-07-29 04:53:26', 450),
(678, 'Aprobado', '2018-07-29 04:53:33', 451),
(679, 'Rechazado', '2018-07-29 04:53:33', 451),
(680, 'Aprobado', '2018-07-29 04:53:41', 452),
(681, 'Rechazado', '2018-07-29 04:53:41', 452),
(682, 'Aprobado', '2018-07-29 04:53:46', 453),
(683, 'Rechazado', '2018-07-29 04:53:46', 453),
(684, 'Aprobado', '2018-07-29 14:23:47', 454),
(685, 'Rechazado', '2018-07-29 14:23:47', 454),
(706, 'Aprobado', '2018-07-29 14:44:14', 488),
(707, 'Rechazado', '2018-07-29 14:44:14', 488),
(726, 'Aprobado', '2018-07-29 14:47:43', 510),
(727, 'Rechazado', '2018-07-29 14:47:43', 510),
(728, 'Aprobado', '2018-07-29 14:47:45', 511),
(729, 'Rechazado', '2018-07-29 14:47:45', 511),
(730, 'Aprobado', '2018-07-29 14:47:47', 512),
(731, 'Rechazado', '2018-07-29 14:47:47', 512),
(732, 'Aprobado', '2018-07-29 14:47:49', 513),
(733, 'Rechazado', '2018-07-29 14:47:49', 513),
(734, 'Aprobado', '2018-07-29 14:47:52', 514),
(735, 'Rechazado', '2018-07-29 14:47:52', 514),
(736, 'Aprobado', '2018-07-29 14:48:27', 515),
(737, 'Rechazado', '2018-07-29 14:48:27', 515),
(738, 'Aprobado', '2018-07-29 14:48:33', 517),
(739, 'Rechazado', '2018-07-29 14:48:33', 517),
(740, 'Aprobado', '2018-07-29 14:49:05', 519),
(741, 'Rechazado', '2018-07-29 14:49:05', 519),
(742, 'Aprobado', '2018-07-29 14:49:11', 521),
(743, 'Rechazado', '2018-07-29 14:49:11', 521),
(744, 'Aprobado', '2018-07-29 14:51:08', 523),
(745, 'Rechazado', '2018-07-29 14:51:08', 523),
(746, 'Aprobado', '2018-07-29 14:51:14', 525),
(747, 'Rechazado', '2018-07-29 14:51:14', 525),
(748, 'Aprobado', '2018-07-29 14:55:48', 537),
(749, 'Rechazado', '2018-07-29 14:55:48', 537),
(750, 'Aprobado', '2018-07-29 14:55:55', 539),
(751, 'Rechazado', '2018-07-29 14:55:55', 539),
(752, 'Aprobado', '2018-07-29 14:56:05', 541),
(753, 'Rechazado', '2018-07-29 14:56:05', 541),
(754, 'Aprobado', '2018-07-29 14:56:14', 543),
(755, 'Rechazado', '2018-07-29 14:56:14', 543),
(756, 'Aprobado', '2018-07-29 14:56:21', 545),
(757, 'Rechazado', '2018-07-29 14:56:21', 545),
(758, 'Aprobado', '2018-07-29 14:56:29', 547),
(759, 'Rechazado', '2018-07-29 14:56:29', 547),
(760, 'Aprobado', '2018-07-29 14:56:40', 549),
(761, 'Rechazado', '2018-07-29 14:56:40', 549),
(762, 'Aprobado', '2018-07-29 14:56:49', 551),
(763, 'Rechazado', '2018-07-29 14:56:49', 551),
(778, 'Aprobado', '2018-07-29 15:02:59', 567),
(779, 'Rechazado', '2018-07-29 15:02:59', 567),
(780, 'Aprobado', '2018-07-29 15:07:19', 569),
(781, 'Rechazado', '2018-07-29 15:07:19', 569),
(782, 'Aprobado', '2018-07-29 15:08:58', 571),
(783, 'Rechazado', '2018-07-29 15:08:58', 571),
(784, 'Aprobado', '2018-07-29 15:18:40', 574),
(785, 'Rechazado', '2018-07-29 15:18:44', 574),
(786, 'Aprobado', '2018-07-29 15:18:50', 575),
(787, 'Rechazado', '2018-07-29 15:18:56', 575),
(788, 'Aprobado', '2018-07-29 15:19:08', 576),
(789, 'Rechazado', '2018-07-29 15:19:08', 576),
(790, 'Aprobado', '2018-07-29 15:23:12', 581),
(791, 'Rechazado', '2018-07-29 15:23:12', 581),
(792, 'Aprobado', '2018-07-29 15:28:44', 583),
(793, 'Rechazado', '2018-07-29 15:28:44', 583),
(794, 'Aprobado', '2018-07-29 15:28:46', 584),
(795, 'Rechazado', '2018-07-29 15:28:46', 584),
(796, 'Aprobado', '2018-07-29 15:28:48', 585),
(797, 'Rechazado', '2018-07-29 15:28:48', 585),
(798, 'Aprobado', '2018-07-29 15:28:50', 586),
(799, 'Rechazado', '2018-07-29 15:28:50', 586),
(800, 'Obstruidos', '2018-07-29 15:31:51', 591),
(801, 'Normales', '2018-07-29 15:31:55', 591),
(802, 'Obstruidos', '2018-07-29 15:32:07', 592),
(803, 'Normales', '2018-07-29 15:32:11', 592),
(804, 'SI', '2018-07-29 15:32:25', 593),
(805, 'NO', '2018-07-29 15:32:27', 593),
(806, 'Aprobado', '2018-07-29 15:40:28', 599),
(807, 'Rechazado', '2018-07-29 15:40:28', 599),
(808, 'Aprobado', '2018-07-29 15:40:33', 601),
(809, 'Rechazado', '2018-07-29 15:40:33', 601),
(810, 'Aprobado', '2018-07-29 15:40:39', 603),
(811, 'Rechazado', '2018-07-29 15:40:39', 603),
(812, 'A-Fijos', '2018-07-29 15:43:51', 610),
(813, 'B-Hidraulicos', '2018-07-29 15:44:00', 610),
(814, 'Normales:', '2018-07-29 15:44:50', 611),
(815, 'Fisurados', '2018-07-29 15:44:57', 611),
(816, 'Deformados', '2018-07-29 15:45:06', 611),
(817, 'Aprobado', '2018-07-29 15:49:39', 620),
(818, 'Rechazado', '2018-07-29 15:49:39', 620),
(831, 'Cambiar', '2018-07-29 16:01:29', 638),
(832, 'No Cambiar', '2018-07-29 16:01:33', 638),
(833, 'Cambiar', '2018-07-29 16:03:09', 643),
(834, 'No Cambiar', '2018-07-29 16:03:16', 643),
(835, 'Aprobado', '2018-07-29 16:06:54', 647),
(836, 'Rechazado', '2018-07-29 16:06:54', 647),
(837, 'Aprobado', '2018-07-29 16:11:07', 649),
(838, 'Rechazado', '2018-07-29 16:11:07', 649),
(839, 'Aprobado', '2018-07-29 16:11:32', 651),
(840, 'Rechazado', '2018-07-29 16:11:32', 651),
(841, 'Aprobado', '2018-07-29 16:18:10', 667),
(842, 'Rechazado', '2018-07-29 16:18:10', 667),
(843, 'Aprobado', '2018-07-29 16:20:59', 671),
(844, 'Rechazado', '2018-07-29 16:20:59', 671),
(845, 'Aprobado', '2018-07-29 16:21:11', 672),
(846, 'Rechazado', '2018-07-29 16:21:11', 672),
(847, 'Aprobado', '2018-07-29 16:21:40', 673),
(848, 'Rechazado', '2018-07-29 16:21:40', 673),
(849, 'Aprobado', '2018-07-29 16:22:33', 674),
(850, 'Rechazado', '2018-07-29 16:22:33', 674),
(851, 'Aprobado', '2018-07-29 16:22:41', 675),
(852, 'Rechazado', '2018-07-29 16:22:41', 675),
(853, 'Aprobado', '2018-07-29 17:28:31', 680),
(854, 'Rechazado', '2018-07-29 17:28:31', 680),
(855, 'Aprobado', '2018-07-29 17:28:33', 681),
(856, 'Rechazado', '2018-07-29 17:28:33', 681),
(857, 'Aprobado', '2018-07-29 17:30:06', 682),
(858, 'Rechazado', '2018-07-29 17:30:06', 682),
(859, 'Bajas', '2018-07-29 17:34:50', 686),
(860, 'Desparejas', '2018-07-29 17:34:54', 686),
(861, 'Gastado', '2018-07-29 17:35:12', 687),
(862, 'Desparejo', '2018-07-29 17:35:17', 687),
(863, 'Aprobado', '2018-07-29 17:39:18', 697),
(864, 'Rechazado', '2018-07-29 17:39:18', 697),
(865, 'Aprobado', '2018-07-29 17:40:17', 699),
(866, 'Reprobado', '2018-07-29 17:40:23', 699),
(867, 'Encamisar', '2018-07-29 17:40:31', 699),
(868, 'Aprobado', '2018-07-29 17:41:33', 701),
(869, 'Rechazado:', '2018-07-29 17:41:39', 701),
(870, 'Reconstruir', '2018-07-29 17:41:46', 701),
(871, 'Aprobado', '2018-07-29 17:52:08', 708),
(872, 'Rechazado', '2018-07-29 17:52:08', 708),
(873, 'STD', '2018-07-29 18:47:39', 710),
(874, 'Otra Medida', '2018-07-29 18:47:53', 710),
(875, 'Fundida', '2018-07-29 19:02:00', 711),
(876, 'Fuera de Medida', '2018-07-29 19:02:09', 711),
(877, 'STD', '2018-07-29 19:04:02', 712),
(878, 'Otra Medida', '2018-07-29 19:04:19', 712),
(879, 'STD', '2018-07-29 19:04:28', 713),
(880, 'Otra Medida', '2018-07-29 19:04:34', 713),
(881, 'STD', '2018-07-29 19:04:41', 714),
(882, 'Otra Medida', '2018-07-29 19:04:45', 714),
(883, 'STD', '2018-07-29 19:04:52', 715),
(884, 'Otra Medida', '2018-07-29 19:04:55', 715),
(885, 'STD', '2018-07-29 19:05:02', 716),
(886, 'Otra Medida', '2018-07-29 19:05:04', 716),
(887, 'STD', '2018-07-29 19:05:10', 717),
(888, 'Otra Medida', '2018-07-29 19:05:12', 717),
(889, 'STD', '2018-07-29 19:05:19', 718),
(890, 'Otra Medida', '2018-07-29 19:05:22', 718),
(891, 'STD', '2018-07-29 19:05:30', 719),
(892, 'Otra Medida', '2018-07-29 19:05:33', 719),
(893, 'STD', '2018-07-29 19:05:41', 720),
(894, 'Otra Medida', '2018-07-29 19:05:43', 720),
(895, 'STD', '2018-07-29 19:05:50', 721),
(896, 'Otra Medida', '2018-07-29 19:05:52', 721),
(899, 'Fundida', '2018-07-29 19:07:56', 722),
(900, 'Fuera de Medida', '2018-07-29 19:08:11', 722),
(901, 'Fundida', '2018-07-29 19:08:18', 723),
(902, 'Fuera de Medida', '2018-07-29 19:08:32', 723),
(903, 'Fundida', '2018-07-29 19:08:41', 724),
(904, 'Fuera de Medida', '2018-07-29 19:08:44', 724),
(905, 'Fundida', '2018-07-29 19:08:51', 725),
(906, 'Fuera de Medida', '2018-07-29 19:08:54', 725),
(907, 'Fundida', '2018-07-29 19:09:01', 726),
(908, 'Fuera de Medida', '2018-07-29 19:09:05', 726),
(909, 'Fundida', '2018-07-29 19:09:14', 727),
(910, 'Fuera de Medida', '2018-07-29 19:09:16', 727),
(911, 'Fundida', '2018-07-29 19:09:24', 728),
(912, 'Fuera de Medida', '2018-07-29 19:09:26', 728),
(913, 'Fundida', '2018-07-29 19:09:34', 729),
(914, 'Fuera de Medida', '2018-07-29 19:09:36', 729),
(915, 'Fundida', '2018-07-29 19:09:43', 730),
(916, 'Fuera de Medida', '2018-07-29 19:09:48', 730),
(917, 'Fundida', '2018-07-29 19:09:57', 731),
(918, 'Fuera de Medida', '2018-07-29 19:10:05', 731),
(919, 'STD', '2018-07-29 20:53:45', 732),
(920, 'Otra Medida', '2018-07-29 20:53:51', 732),
(921, 'STD', '2018-07-29 20:54:03', 733),
(922, '', '2018-07-29 20:54:08', 733),
(923, 'Otra Medida', '2018-07-29 20:54:25', 733),
(924, 'STD', '2018-07-29 20:54:32', 734),
(925, 'Otra Medida', '2018-07-29 20:55:42', 734),
(926, 'STD', '2018-07-29 20:55:56', 735),
(927, 'Otra Medida', '2018-07-29 20:56:03', 735),
(928, 'STD', '2018-07-29 20:56:10', 736),
(929, 'Otra Medida', '2018-07-29 20:56:23', 736),
(930, 'STD', '2018-07-29 20:56:30', 737),
(931, 'Otra Medida', '2018-07-29 20:56:39', 737),
(932, 'STD', '2018-07-29 20:57:12', 738),
(933, 'Otra Medida', '2018-07-29 20:59:01', 738),
(934, 'STD', '2018-07-29 20:59:12', 739),
(935, 'Otra Medida', '2018-07-29 20:59:23', 739),
(936, 'STD', '2018-07-29 20:59:38', 740),
(937, 'Otra Medida', '2018-07-29 20:59:44', 740),
(938, 'STD', '2018-07-29 20:59:51', 741),
(939, 'Otra Medida', '2018-07-29 20:59:57', 741),
(940, 'STD', '2018-07-29 21:00:18', 742),
(941, 'Otra Medida', '2018-07-29 21:00:24', 742),
(942, 'STD', '2018-07-29 21:00:30', 743),
(943, 'Otra Medida', '2018-07-29 21:00:37', 743),
(944, 'STD', '2018-07-29 21:00:43', 744),
(945, 'Otra Medida', '2018-07-29 21:00:49', 744),
(946, 'STD', '2018-07-29 21:00:58', 745),
(947, 'Otra Medida', '2018-07-29 21:01:04', 745),
(948, 'STD', '2018-07-29 21:01:12', 746),
(949, 'Otra Medida', '2018-07-29 21:01:29', 746),
(950, 'STD', '2018-07-29 21:01:38', 747),
(951, 'Otra Medida', '2018-07-29 21:01:44', 747),
(952, 'STD', '2018-07-29 21:01:52', 748),
(953, 'Otra Medida', '2018-07-29 21:02:02', 748),
(954, 'Fundida', '2018-07-29 21:02:19', 749),
(955, 'Fundida', '2018-07-29 21:02:23', 750),
(956, 'Fundida', '2018-07-29 21:02:27', 751),
(957, 'Fundida', '2018-07-29 21:02:32', 752),
(958, 'Fundida', '2018-07-29 21:02:37', 753),
(959, 'Fundida', '2018-07-29 21:02:41', 754),
(960, '', '2018-07-29 21:03:34', 754),
(961, 'Fundida', '2018-07-29 21:04:24', 755),
(962, 'Fundida', '2018-07-29 21:04:30', 756),
(963, 'Fundida', '2018-07-29 21:04:34', 757),
(964, 'Fundida', '2018-07-29 21:04:39', 758),
(965, 'Fundida', '2018-07-29 21:05:35', 759),
(966, 'Fundida', '2018-07-29 21:05:40', 760),
(967, 'Fundida', '2018-07-29 21:05:45', 761),
(968, 'Fundida', '2018-07-29 21:05:50', 762),
(969, 'Fundida', '2018-07-29 21:05:54', 763),
(970, 'Fundida', '2018-07-29 21:05:59', 764),
(971, 'Fundida', '2018-07-29 21:06:04', 765),
(972, 'Fuera de Medida', '2018-07-29 21:08:05', 749),
(973, 'Fuera de Medida', '2018-07-29 21:08:14', 750),
(974, 'Fuera de Medida', '2018-07-29 21:08:21', 751),
(975, 'Fuera de Medida', '2018-07-29 21:08:26', 752),
(976, 'Fuera de Medida', '2018-07-29 21:08:30', 753),
(977, 'Fuera de Medida', '2018-07-29 21:08:37', 754),
(978, 'Fuera de Medida', '2018-07-29 21:08:42', 755),
(979, 'Fuera de Medida', '2018-07-29 21:08:46', 756),
(980, 'Fuera de Medida', '2018-07-29 21:08:51', 757),
(981, 'Fuera de Medida', '2018-07-29 21:08:56', 758),
(982, 'Fuera de Medida', '2018-07-29 21:11:26', 759),
(983, 'Fuera de Medida', '2018-07-29 21:11:30', 760),
(984, 'Fuera de Medida', '2018-07-29 21:11:36', 761),
(985, 'Fuera de Medida', '2018-07-29 21:11:45', 762),
(986, 'Fuera de Medida', '2018-07-29 21:11:49', 763),
(987, 'Fuera de Medida', '2018-07-29 21:11:55', 764),
(988, 'Fuera de Medida', '2018-07-29 21:12:00', 765),
(989, 'Normal', '2018-07-29 21:26:22', 766),
(990, 'Falta de Dureza', '2018-07-29 21:26:24', 766),
(991, 'Normal', '2018-07-29 21:26:32', 767),
(992, 'Falta de Dureza', '2018-07-29 21:26:34', 767),
(993, 'Normal', '2018-07-29 21:26:41', 768),
(994, 'Falta de Dureza', '2018-07-29 21:26:42', 768),
(995, 'Normal', '2018-07-29 21:26:55', 769),
(996, 'Falta de Dureza', '2018-07-29 21:26:57', 769),
(997, 'Normal', '2018-07-29 21:27:04', 770),
(998, 'Falta de Dureza', '2018-07-29 21:27:07', 770),
(999, 'Normal', '2018-07-29 21:27:17', 771),
(1000, 'Falta de Dureza', '2018-07-29 21:27:19', 771),
(1001, 'Normal', '2018-07-29 21:27:26', 772),
(1002, 'Falta de Dureza', '2018-07-29 21:27:28', 772),
(1003, 'Normal', '2018-07-29 21:27:34', 773),
(1004, 'Falta de Dureza', '2018-07-29 21:27:36', 773),
(1005, 'Normal', '2018-07-29 21:27:42', 774),
(1006, 'Falta de Dureza', '2018-07-29 21:27:44', 774),
(1007, 'Normal', '2018-07-29 21:27:50', 775),
(1008, 'Falta de Dureza', '2018-07-29 21:27:52', 775),
(1009, 'Normal', '2018-07-29 21:35:07', 776),
(1010, 'Falta Dureza', '2018-07-29 21:35:16', 776),
(1011, 'Normal', '2018-07-29 21:35:26', 777),
(1012, 'Falta Dureza', '2018-07-29 21:35:28', 777),
(1013, 'Normal', '2018-07-29 21:35:35', 778),
(1014, 'Falta Dureza', '2018-07-29 21:35:37', 778),
(1015, 'Normal', '2018-07-29 21:35:43', 779),
(1016, 'Falta Dureza', '2018-07-29 21:35:49', 779),
(1017, 'Normal', '2018-07-29 21:35:58', 780),
(1018, 'Falta Dureza', '2018-07-29 21:36:00', 780),
(1019, 'Normal', '2018-07-29 21:36:08', 781),
(1020, 'Falta Dureza', '2018-07-29 21:36:09', 781),
(1021, 'Normal', '2018-07-29 21:36:33', 782),
(1022, 'Falta Dureza', '2018-07-29 21:36:35', 782),
(1023, 'Normal', '2018-07-29 21:36:46', 783),
(1024, 'Falta Dureza', '2018-07-29 21:36:48', 783),
(1025, 'Normal', '2018-07-29 21:37:00', 784),
(1026, 'Falta Dureza', '2018-07-29 21:37:02', 784),
(1027, 'Normal', '2018-07-29 21:37:07', 785),
(1028, 'Falta Dureza', '2018-07-29 21:37:09', 785),
(1029, 'Normal', '2018-07-29 21:37:17', 786),
(1030, 'Falta Dureza', '2018-07-29 21:37:18', 786),
(1031, 'Normal', '2018-07-29 21:37:27', 787),
(1032, 'Falta Dureza', '2018-07-29 21:37:29', 787),
(1033, 'Normal', '2018-07-29 21:38:41', 788),
(1034, 'Falta Dureza', '2018-07-29 21:38:43', 788),
(1035, 'Normal', '2018-07-29 21:38:49', 789),
(1036, 'Falta Dureza', '2018-07-29 21:38:52', 789),
(1037, 'Normal', '2018-07-29 21:39:17', 790),
(1038, 'Falta Dureza', '2018-07-29 21:39:19', 790),
(1039, 'Normal', '2018-07-29 21:39:27', 791),
(1040, 'Falta Dureza', '2018-07-29 21:39:28', 791),
(1041, 'Normal', '2018-07-29 21:39:33', 792),
(1042, 'Falta Dureza', '2018-07-29 21:39:35', 792),
(1043, 'Normal', '2018-07-29 21:44:16', 793),
(1044, 'Falta de Radio', '2018-07-29 21:44:24', 793),
(1045, 'Normal', '2018-07-29 21:44:30', 794),
(1046, 'Falta de Radio', '2018-07-29 21:44:32', 794),
(1047, 'Normal', '2018-07-29 21:45:05', 795),
(1048, 'Falta de Radio', '2018-07-29 21:45:07', 795),
(1049, 'Normal', '2018-07-29 21:45:16', 796),
(1050, 'Falta de Radio', '2018-07-29 21:45:18', 796),
(1051, 'Normal', '2018-07-29 21:45:23', 797),
(1052, 'Falta de Radio', '2018-07-29 21:45:24', 797),
(1053, 'Normal', '2018-07-29 21:45:29', 798),
(1054, 'Falta de Radio', '2018-07-29 21:45:31', 798),
(1055, 'Normal', '2018-07-29 21:45:36', 799),
(1056, 'Falta de Radio', '2018-07-29 21:45:38', 799),
(1057, 'Normal', '2018-07-29 21:45:52', 800),
(1058, 'Falta de Radio', '2018-07-29 21:45:53', 800),
(1059, 'Normal', '2018-07-29 21:45:58', 801),
(1060, 'Falta de Radio', '2018-07-29 21:46:01', 801),
(1061, 'Normal', '2018-07-29 21:46:10', 802),
(1062, 'Falta de Radio', '2018-07-29 21:46:13', 802),
(1063, 'Normal', '2018-07-29 21:46:19', 803),
(1064, 'Falta de Radio', '2018-07-29 21:46:21', 803),
(1065, 'Normal', '2018-07-29 23:11:04', 804),
(1066, 'Normal', '2018-07-29 23:11:09', 805),
(1067, 'Normal', '2018-07-29 23:11:13', 806),
(1068, 'Normal', '2018-07-29 23:11:18', 807),
(1069, 'Normal', '2018-07-29 23:11:24', 808),
(1070, 'Normal', '2018-07-29 23:11:52', 809),
(1071, 'Normal', '2018-07-29 23:11:56', 810),
(1072, 'Normal', '2018-07-29 23:12:08', 811),
(1073, 'Normal', '2018-07-29 23:12:15', 812),
(1074, 'Normal', '2018-07-29 23:12:20', 813),
(1075, 'Normal', '2018-07-29 23:12:24', 814),
(1076, 'Normal', '2018-07-29 23:12:29', 815),
(1077, 'Normal', '2018-07-29 23:12:33', 816),
(1078, 'Normal', '2018-07-29 23:12:38', 817),
(1079, 'Normal', '2018-07-29 23:12:42', 818),
(1080, 'Normal', '2018-07-29 23:12:46', 819),
(1081, 'Normal', '2018-07-29 23:12:55', 820),
(1082, 'Falta de Radio', '2018-07-29 23:13:17', 804),
(1083, 'Falta de Radio', '2018-07-29 23:13:22', 805),
(1084, 'Falta de Radio', '2018-07-29 23:13:26', 806),
(1085, 'Falta de Radio', '2018-07-29 23:13:30', 807),
(1086, 'Falta de Radio', '2018-07-29 23:13:34', 808),
(1087, 'Falta de Radio', '2018-07-29 23:13:38', 809),
(1088, 'Falta de Radio', '2018-07-29 23:13:42', 810),
(1089, 'Falta de Radio', '2018-07-29 23:13:46', 811),
(1090, 'Falta de Radio', '2018-07-29 23:13:52', 812),
(1091, 'Falta de Radio', '2018-07-29 23:13:57', 813),
(1092, 'Falta de Radio', '2018-07-29 23:14:01', 814),
(1093, 'Falta de Radio', '2018-07-29 23:14:05', 815),
(1094, 'Falta de Radio', '2018-07-29 23:14:09', 816),
(1095, 'Falta de Radio', '2018-07-29 23:14:13', 817),
(1096, 'Falta de Radio', '2018-07-29 23:14:17', 818),
(1097, 'Falta de Radio', '2018-07-29 23:14:22', 819),
(1098, 'Falta de Radio', '2018-07-29 23:14:25', 820),
(1099, 'Aprobado', '2018-07-29 23:15:29', 822),
(1100, 'Rechazado', '2018-07-29 23:15:29', 822),
(1101, 'Aprobado', '2018-07-29 23:15:32', 823),
(1102, 'Rechazado', '2018-07-29 23:15:32', 823),
(1103, 'Aprobado', '2018-07-29 23:24:54', 826),
(1104, 'Rechazado', '2018-07-29 23:24:54', 826),
(1105, 'Aprobado', '2018-07-29 23:25:25', 829),
(1106, 'Rechazado', '2018-07-29 23:25:25', 829),
(1107, 'Aprobado', '2018-07-29 23:32:14', 834),
(1108, 'Rechazado', '2018-07-29 23:32:14', 834),
(1109, 'Aprobado', '2018-07-29 23:32:40', 837),
(1110, 'Rechazado', '2018-07-29 23:32:40', 837),
(1111, 'Aprobado', '2018-07-29 23:38:42', 865),
(1112, 'Rechazado', '2018-07-29 23:38:42', 865),
(1113, 'Aprobado', '2018-07-29 23:43:17', 867),
(1114, 'Rechazado', '2018-07-29 23:43:17', 867),
(1115, 'Aprobado', '2018-07-29 23:43:50', 870),
(1116, 'Rechazado', '2018-07-29 23:43:50', 870),
(1200, 'Importado', '2018-07-31 14:31:56', 1210),
(1201, 'Nacional', '2018-07-31 14:32:02', 1210),
(1202, 'Importado', '2018-07-31 14:42:35', 1234),
(1203, 'Nacional', '2018-07-31 14:42:39', 1234),
(1204, 'Rectificado', '2018-07-31 14:50:44', 1237),
(1205, 'Encamisado (*)', '2018-07-31 14:50:55', 1237),
(1208, 'Nuevo ', '2018-07-31 15:31:39', 1275),
(1209, 'Usado', '2018-07-31 15:31:50', 1275),
(1212, '', '2018-07-31 15:45:00', 1281),
(1213, 'Nueva', '2018-07-31 15:48:27', 1285),
(1214, 'Usada', '2018-07-31 15:48:30', 1285),
(1215, 'Nuevo ', '2018-07-31 15:55:03', 1291),
(1216, 'Usado:', '2018-07-31 15:55:07', 1291),
(1219, 'Nueva:', '2018-07-31 16:16:47', 1315),
(1220, 'Usada', '2018-07-31 16:16:54', 1315),
(1229, 'Si', '2018-07-31 18:17:06', 1379),
(1230, 'No', '2018-07-31 18:17:08', 1379),
(1231, 'Bueno', '2018-07-31 18:17:45', 1381),
(1232, 'Malo', '2018-07-31 18:17:49', 1381),
(1233, 'Nuevo', '2018-07-31 18:17:55', 1381),
(1234, 'Si ', '2018-07-31 18:18:36', 1382),
(1235, 'No', '2018-07-31 18:18:38', 1382),
(1236, 'Bueno', '2018-07-31 18:18:44', 1384),
(1237, 'Malo', '2018-07-31 18:18:46', 1384),
(1238, 'Nuevo', '2018-07-31 18:18:53', 1384),
(1239, 'Si', '2018-07-31 18:19:41', 1385),
(1240, 'No', '2018-07-31 18:19:44', 1385),
(1241, 'Bueno', '2018-07-31 18:20:07', 1387),
(1242, 'Malo', '2018-07-31 18:20:12', 1387),
(1243, 'Nuevo', '2018-07-31 18:20:16', 1387),
(1244, 'Si', '2018-07-31 18:21:39', 1388),
(1245, 'No', '2018-07-31 18:21:42', 1388),
(1246, 'Bueno', '2018-07-31 18:21:48', 1390),
(1247, 'Malo', '2018-07-31 18:21:51', 1390),
(1248, 'Nuevo', '2018-07-31 18:21:56', 1390),
(1249, 'Si', '2018-07-31 18:22:19', 1391);
INSERT INTO `frm_valores_validos` (`VAPO_ID`, `VALOR`, `FEC_CREACION`, `VALO_ID`) VALUES
(1250, 'No', '2018-07-31 18:22:21', 1391),
(1251, 'Bueno', '2018-07-31 18:22:43', 1393),
(1252, 'Malo', '2018-07-31 18:22:48', 1393),
(1253, 'Nuevo', '2018-07-31 18:22:53', 1393),
(1254, 'Si', '2018-07-31 18:23:16', 1394),
(1255, 'No', '2018-07-31 18:23:19', 1394),
(1256, 'Bueno', '2018-07-31 18:23:52', 1396),
(1257, 'Malo', '2018-07-31 18:23:56', 1396),
(1258, 'Nuevo', '2018-07-31 18:24:01', 1396),
(1259, 'Si', '2018-07-31 18:25:19', 1397),
(1260, 'No', '2018-07-31 18:25:21', 1397),
(1261, 'Bueno', '2018-07-31 18:25:25', 1399),
(1262, 'Malo', '2018-07-31 18:25:29', 1399),
(1263, 'Normal', '2018-07-31 18:25:33', 1399),
(1264, 'Si', '2018-07-31 18:26:00', 1400),
(1265, 'No', '2018-07-31 18:26:02', 1400),
(1267, 'Bueno', '2018-07-31 18:26:28', 1402),
(1268, 'Malo', '2018-07-31 18:26:32', 1402),
(1269, 'Nuevo', '2018-07-31 18:26:44', 1402),
(1270, 'Si', '2018-07-31 18:27:30', 1403),
(1271, 'No', '2018-07-31 18:27:35', 1403),
(1272, 'Bueno', '2018-07-31 18:27:40', 1405),
(1273, 'Malo', '2018-07-31 18:27:43', 1405),
(1274, 'Normal', '2018-07-31 18:27:46', 1405),
(1275, 'Si', '2018-07-31 18:28:12', 1406),
(1276, 'No', '2018-07-31 18:28:14', 1406),
(1277, 'Bueno', '2018-07-31 18:28:34', 1408),
(1278, 'Malo', '2018-07-31 18:28:36', 1408),
(1279, 'Nuevo', '2018-07-31 18:28:39', 1408),
(1280, 'Si', '2018-07-31 18:29:54', 1409),
(1281, 'No', '2018-07-31 18:29:56', 1409),
(1282, 'Bueno', '2018-07-31 18:30:03', 1411),
(1283, 'Malo', '2018-07-31 18:30:06', 1411),
(1284, 'Nuevo', '2018-07-31 18:30:10', 1411),
(1285, 'Si', '2018-07-31 18:30:38', 1412),
(1286, 'No', '2018-07-31 18:30:41', 1412),
(1287, 'Bueno ', '2018-07-31 18:30:58', 1414),
(1288, 'Malo', '2018-07-31 18:31:01', 1414),
(1289, 'Nuevo', '2018-07-31 18:31:05', 1414),
(1290, 'Si', '2018-07-31 18:32:18', 1415),
(1291, 'No', '2018-07-31 18:32:20', 1415),
(1292, 'Bueno', '2018-07-31 18:32:38', 1417),
(1293, 'Malo', '2018-07-31 18:32:41', 1417),
(1294, 'Nuevo', '2018-07-31 18:32:44', 1417),
(1295, 'Si', '2018-07-31 18:33:25', 1418),
(1296, 'No', '2018-07-31 18:33:28', 1418),
(1297, 'Bueno', '2018-07-31 18:33:32', 1420),
(1298, 'Malo', '2018-07-31 18:33:35', 1420),
(1299, 'Nuevo', '2018-07-31 18:33:40', 1420),
(1300, 'Si', '2018-07-31 18:34:15', 1421),
(1301, 'No', '2018-07-31 18:34:18', 1421),
(1302, 'Bueno', '2018-07-31 18:34:22', 1423),
(1303, 'Malo', '2018-07-31 18:34:25', 1423),
(1304, 'Nuevo', '2018-07-31 18:34:33', 1423),
(1305, 'Si', '2018-07-31 18:47:30', 1433),
(1306, 'No', '2018-07-31 18:47:33', 1433),
(1307, 'Bueno', '2018-07-31 18:47:43', 1435),
(1308, 'Malo', '2018-07-31 18:47:48', 1435),
(1309, 'Nuevo', '2018-07-31 18:47:52', 1435),
(1310, 'Si', '2018-07-31 18:49:39', 1436),
(1311, 'No', '2018-07-31 18:49:41', 1436),
(1312, 'Bueno', '2018-07-31 18:49:46', 1438),
(1313, 'Malo', '2018-07-31 18:49:50', 1438),
(1314, 'Nuevo', '2018-07-31 18:49:55', 1438),
(1315, 'Si', '2018-07-31 18:50:25', 1439),
(1316, 'No', '2018-07-31 18:50:27', 1439),
(1317, 'Bueno', '2018-07-31 18:50:56', 1441),
(1318, 'Malo', '2018-07-31 18:50:59', 1441),
(1319, 'Nuevo', '2018-07-31 18:51:02', 1441),
(1320, 'Si', '2018-07-31 18:53:16', 1442),
(1321, 'No', '2018-07-31 18:53:18', 1442),
(1322, 'Bueno', '2018-07-31 18:53:29', 1444),
(1323, 'Malo', '2018-07-31 18:53:32', 1444),
(1324, 'Nuevo', '2018-07-31 18:53:35', 1444),
(1325, 'Si', '2018-07-31 18:54:02', 1445),
(1326, 'No', '2018-07-31 18:54:05', 1445),
(1327, 'Bueno', '2018-07-31 18:54:26', 1447),
(1328, 'Malo', '2018-07-31 18:54:29', 1447),
(1329, 'Nuevo', '2018-07-31 18:54:32', 1447),
(1330, 'Si', '2018-07-31 18:55:20', 1448),
(1331, 'No', '2018-07-31 18:55:23', 1448),
(1332, 'Bueno', '2018-07-31 18:55:27', 1450),
(1333, 'Malo', '2018-07-31 18:55:33', 1450),
(1334, 'Nuevo', '2018-07-31 18:55:38', 1450),
(1335, 'Si', '2018-07-31 18:56:18', 1451),
(1336, 'No', '2018-07-31 18:56:21', 1451),
(1337, 'Bueno', '2018-07-31 18:56:50', 1453),
(1338, 'Malo', '2018-07-31 18:56:53', 1453),
(1339, 'Normal', '2018-07-31 18:56:56', 1453),
(1340, 'Si', '2018-07-31 18:57:45', 1454),
(1341, 'No', '2018-07-31 18:57:47', 1454),
(1342, 'Bueno', '2018-07-31 18:57:53', 1456),
(1343, 'Malo', '2018-07-31 18:57:56', 1456),
(1344, 'Nuevo', '2018-07-31 18:58:00', 1456),
(1345, 'Si', '2018-07-31 18:59:01', 1457),
(1346, 'No', '2018-07-31 18:59:03', 1457),
(1347, 'Bueno', '2018-07-31 18:59:10', 1459),
(1348, 'Malo', '2018-07-31 18:59:13', 1459),
(1349, 'Normal', '2018-07-31 18:59:16', 1459),
(1350, 'Si', '2018-07-31 18:59:52', 1460),
(1351, 'No', '2018-07-31 18:59:54', 1460),
(1352, 'Bueno', '2018-07-31 18:59:58', 1462),
(1353, 'Malo', '2018-07-31 19:00:00', 1462),
(1354, 'Normal', '2018-07-31 19:00:04', 1462),
(1355, 'Si', '2018-07-31 19:00:25', 1463),
(1356, 'No', '2018-07-31 19:00:29', 1463),
(1357, 'Bueno', '2018-07-31 19:00:53', 1465),
(1358, 'Malo', '2018-07-31 19:00:56', 1465),
(1359, 'Normal', '2018-07-31 19:00:59', 1465),
(1360, 'Si', '2018-07-31 19:01:38', 1466),
(1361, 'No', '2018-07-31 19:01:40', 1466),
(1362, 'Bueno', '2018-07-31 19:02:09', 1468),
(1363, 'Malo', '2018-07-31 19:02:13', 1468),
(1364, 'Normal', '2018-07-31 19:02:17', 1468),
(1365, 'Si', '2018-07-31 19:11:32', 1469),
(1366, 'No', '2018-07-31 19:11:38', 1469),
(1367, 'Bueno', '2018-07-31 19:11:42', 1471),
(1368, 'Malo', '2018-07-31 19:11:44', 1471),
(1369, 'Nuevo', '2018-07-31 19:11:52', 1471),
(1370, 'Bueno', '2018-07-31 19:12:43', 1474),
(1371, 'Malo', '2018-07-31 19:12:45', 1474),
(1372, 'Nuevo', '2018-07-31 19:12:48', 1474),
(1373, 'Si', '2018-07-31 19:13:28', 1475),
(1374, 'No', '2018-07-31 19:13:31', 1475),
(1375, 'Bueno', '2018-07-31 19:13:39', 1477),
(1376, 'Malo', '2018-07-31 19:13:42', 1477),
(1377, 'Nuevo', '2018-07-31 19:13:47', 1477),
(1378, 'Si', '2018-07-31 19:14:50', 1478),
(1379, 'No', '2018-07-31 19:14:52', 1478),
(1380, 'Bueno', '2018-07-31 19:14:57', 1480),
(1381, 'Malo', '2018-07-31 19:15:00', 1480),
(1382, 'Nuevo', '2018-07-31 19:15:04', 1480),
(1383, 'Si', '2018-07-31 19:15:39', 1481),
(1384, 'No', '2018-07-31 19:15:41', 1481),
(1385, 'Bueno', '2018-07-31 19:16:09', 1483),
(1386, 'Malo', '2018-07-31 19:16:11', 1483),
(1387, 'Nuevo', '2018-07-31 19:16:14', 1483),
(1388, 'Si', '2018-07-31 19:17:40', 1484),
(1389, 'No', '2018-07-31 19:17:42', 1484),
(1390, 'Bueno', '2018-07-31 19:17:46', 1486),
(1391, 'Malo', '2018-07-31 19:17:48', 1486),
(1392, 'Nuevo', '2018-07-31 19:17:54', 1486),
(1393, 'Si', '2018-07-31 19:23:46', 1496),
(1394, 'No', '2018-07-31 19:23:48', 1496),
(1395, 'Bueno', '2018-07-31 19:23:54', 1498),
(1396, 'Malo', '2018-07-31 19:23:56', 1498),
(1397, 'Nuevo', '2018-07-31 19:23:59', 1498),
(1398, 'Si', '2018-07-31 19:25:15', 1499),
(1399, 'No', '2018-07-31 19:25:17', 1499),
(1400, 'Bueno', '2018-07-31 19:25:21', 1501),
(1401, 'Malo', '2018-07-31 19:25:23', 1501),
(1402, 'Nuevo', '2018-07-31 19:25:27', 1501),
(1403, 'Si', '2018-07-31 19:26:11', 1502),
(1404, 'No', '2018-07-31 19:26:13', 1502),
(1405, 'Bueno', '2018-07-31 19:26:18', 1504),
(1406, 'Malo', '2018-07-31 19:26:21', 1504),
(1407, 'Nuevo', '2018-07-31 19:26:24', 1504),
(1408, 'Si ', '2018-07-31 19:29:11', 1507),
(1409, 'No', '2018-07-31 19:29:13', 1507),
(1410, 'Bueno', '2018-07-31 19:29:25', 1509),
(1411, 'Malo', '2018-07-31 19:29:31', 1509),
(1412, 'Normal', '2018-07-31 19:29:34', 1509),
(1413, 'Si', '2018-07-31 19:30:12', 1510),
(1414, 'No', '2018-07-31 19:30:14', 1510),
(1415, 'Bueno', '2018-07-31 19:30:19', 1512),
(1416, 'Malo', '2018-07-31 19:30:22', 1512),
(1417, 'Normal', '2018-07-31 19:30:25', 1512),
(1418, 'Si', '2018-07-31 19:31:00', 1513),
(1419, 'No', '2018-07-31 19:31:03', 1513),
(1420, 'Bueno', '2018-07-31 19:31:07', 1515),
(1421, 'Malo', '2018-07-31 19:31:12', 1515),
(1422, 'Normal', '2018-07-31 19:31:15', 1515),
(1423, 'Si', '2018-07-31 19:32:09', 1516),
(1424, 'No', '2018-07-31 19:32:12', 1516),
(1425, 'Bueno', '2018-07-31 19:32:17', 1518),
(1426, 'Malo', '2018-07-31 19:32:20', 1518),
(1427, 'Nuevo', '2018-07-31 19:32:27', 1518),
(1428, 'Si', '2018-07-31 19:32:47', 1519),
(1429, 'No', '2018-07-31 19:32:50', 1519),
(1430, 'Bueno', '2018-07-31 19:33:20', 1522),
(1431, 'Malo', '2018-07-31 19:33:23', 1522),
(1432, 'Nuevo', '2018-07-31 19:33:27', 1522),
(1433, 'Si', '2018-07-31 19:33:56', 1523),
(1434, 'No', '2018-07-31 19:33:58', 1523),
(1435, 'Bueno', '2018-07-31 19:34:14', 1525),
(1436, 'Malo', '2018-07-31 19:34:16', 1525),
(1438, 'Nuevo', '2018-07-31 19:34:19', 1525),
(1441, 'Si', '2018-07-31 19:34:59', 1526),
(1442, 'No', '2018-07-31 19:35:02', 1526),
(1443, 'Bueno', '2018-07-31 19:35:47', 1530),
(1444, 'Malo', '2018-07-31 19:35:50', 1530),
(1445, 'Nuevo', '2018-07-31 19:35:53', 1530),
(1446, 'Si', '2018-07-31 19:36:21', 1531),
(1447, 'No', '2018-07-31 19:36:23', 1531),
(1448, 'Bueno', '2018-07-31 19:36:50', 1533),
(1449, 'Malo', '2018-07-31 19:36:53', 1533),
(1450, 'Nuevo', '2018-07-31 19:36:58', 1533),
(1451, 'Si', '2018-07-31 19:37:21', 1534),
(1452, 'No', '2018-07-31 19:37:22', 1534),
(1453, 'Bueno', '2018-07-31 19:38:05', 1536),
(1454, 'Malo', '2018-07-31 19:38:08', 1536),
(1455, 'Nuevo', '2018-07-31 19:38:17', 1536),
(1456, 'Si', '2018-07-31 19:39:46', 1537),
(1457, 'No', '2018-07-31 19:39:48', 1537),
(1458, 'Bueno', '2018-07-31 19:40:13', 1539),
(1459, 'Malo', '2018-07-31 19:40:17', 1539),
(1460, 'Nuevo', '2018-07-31 19:40:21', 1539),
(1461, 'Si', '2018-07-31 19:41:13', 1540),
(1462, 'No', '2018-07-31 19:41:17', 1540),
(1463, 'Bueno', '2018-07-31 19:41:22', 1542),
(1464, 'Malo', '2018-07-31 19:41:25', 1542),
(1465, 'Nuevo', '2018-07-31 19:41:28', 1542),
(1466, 'Si', '2018-07-31 19:42:15', 1545),
(1467, 'No', '2018-07-31 19:42:17', 1545),
(1468, 'Bueno', '2018-07-31 19:42:33', 1547),
(1469, 'Malo', '2018-07-31 19:42:36', 1547),
(1470, 'Nuevo', '2018-07-31 19:42:43', 1547),
(1471, 'Si', '2018-07-31 19:43:20', 1548),
(1472, 'No', '2018-07-31 19:43:23', 1548),
(1473, 'Bueno', '2018-07-31 19:43:27', 1550),
(1474, 'Malo', '2018-07-31 19:43:30', 1550),
(1475, 'Nuevo', '2018-07-31 19:43:41', 1550),
(1476, 'Si', '2018-07-31 19:44:22', 1551),
(1477, 'No', '2018-07-31 19:44:24', 1551),
(1478, 'Bueno', '2018-07-31 19:44:28', 1553),
(1479, 'Malo', '2018-07-31 19:44:31', 1553),
(1480, 'Nuevo', '2018-07-31 19:44:34', 1553),
(1481, 'Si', '2018-07-31 19:45:56', 1554),
(1482, 'No', '2018-07-31 19:45:59', 1554),
(1483, 'Bueno', '2018-07-31 19:46:04', 1556),
(1484, 'Malo', '2018-07-31 19:46:07', 1556),
(1485, 'Nuevo', '2018-07-31 19:46:10', 1556),
(1486, 'Si', '2018-07-31 19:46:30', 1557),
(1487, 'No', '2018-07-31 19:46:33', 1557),
(1488, 'Bueno ', '2018-07-31 19:47:03', 1559),
(1489, 'Malo', '2018-07-31 19:47:05', 1559),
(1490, 'Nuevo', '2018-07-31 19:47:16', 1559),
(1491, 'Si', '2018-07-31 19:48:09', 1560),
(1492, 'No', '2018-07-31 19:48:12', 1560),
(1493, 'Bueno', '2018-07-31 19:48:17', 1562),
(1494, 'Malo', '2018-07-31 19:48:22', 1562),
(1495, 'Nuevo', '2018-07-31 19:48:27', 1562),
(1496, 'Si', '2018-07-31 19:49:15', 1563),
(1497, 'No', '2018-07-31 19:49:17', 1563),
(1498, 'Bueno', '2018-07-31 19:49:21', 1565),
(1499, 'Malo', '2018-07-31 19:49:24', 1565),
(1500, 'Nuevo', '2018-07-31 19:49:28', 1565),
(1501, 'Si', '2018-07-31 19:50:10', 1566),
(1502, 'No', '2018-07-31 19:50:12', 1566),
(1503, 'Bueno', '2018-07-31 19:50:16', 1568),
(1504, 'Malo', '2018-07-31 19:50:19', 1568),
(1506, 'Nuevo', '2018-07-31 19:50:25', 1568),
(1507, 'Si', '2018-07-31 19:50:48', 1569),
(1508, 'No', '2018-07-31 19:50:49', 1569),
(1509, 'Bueno', '2018-07-31 19:51:10', 1571),
(1510, 'Malo', '2018-07-31 19:51:12', 1571),
(1511, 'Nuevo', '2018-07-31 19:51:15', 1571),
(1512, 'Si ', '2018-07-31 19:51:38', 1572),
(1513, 'No', '2018-07-31 19:51:41', 1572),
(1514, 'Bueno', '2018-07-31 19:52:06', 1574),
(1515, 'Malo', '2018-07-31 19:52:09', 1574),
(1516, 'Nuevo', '2018-07-31 19:52:12', 1574),
(1517, 'Si', '2018-07-31 19:52:31', 1575),
(1518, 'No', '2018-07-31 19:52:38', 1575),
(1519, 'Bueno', '2018-07-31 19:52:55', 1577),
(1520, 'Malo', '2018-07-31 19:52:57', 1577),
(1521, 'Nuevo', '2018-07-31 19:53:01', 1577),
(1522, 'Si ', '2018-07-31 19:54:05', 1578),
(1523, 'No', '2018-07-31 19:54:09', 1578),
(1524, 'Bueno', '2018-07-31 19:54:42', 1580),
(1525, 'Malo', '2018-07-31 19:54:44', 1580),
(1526, 'Nuevo', '2018-07-31 19:54:48', 1580),
(1527, 'Si', '2018-07-31 20:10:22', 1630),
(1528, 'No', '2018-07-31 20:10:26', 1630),
(1529, 'Si', '2018-07-31 20:10:33', 1629),
(1530, 'No', '2018-07-31 20:10:36', 1629),
(1531, 'Si', '2018-07-31 20:10:43', 1628),
(1532, 'No', '2018-07-31 20:10:46', 1628),
(1533, 'Si', '2018-07-31 20:10:51', 1627),
(1534, 'No', '2018-07-31 20:10:55', 1627),
(1535, 'Si', '2018-07-31 20:11:05', 1626),
(1536, 'No', '2018-07-31 20:11:07', 1626),
(1537, 'Si', '2018-07-31 20:11:11', 1625),
(1538, 'No', '2018-07-31 20:11:17', 1625),
(1539, 'Si', '2018-07-31 20:11:22', 1624),
(1540, 'No', '2018-07-31 20:11:25', 1624),
(1541, 'Si', '2018-07-31 20:11:37', 1623),
(1542, 'No', '2018-07-31 20:11:40', 1623),
(1543, 'Si', '2018-07-31 20:11:45', 1622),
(1544, 'No', '2018-07-31 20:11:47', 1622),
(1545, 'Si', '2018-07-31 20:11:51', 1621),
(1546, 'No', '2018-07-31 20:11:54', 1621),
(1547, 'Si', '2018-07-31 20:12:03', 1620),
(1548, 'No', '2018-07-31 20:12:05', 1620),
(1549, 'Si', '2018-07-31 20:12:12', 1619),
(1550, 'No', '2018-07-31 20:12:17', 1619),
(1551, 'Si', '2018-07-31 20:12:24', 1618),
(1552, 'No', '2018-07-31 20:12:27', 1618),
(1553, 'Si', '2018-07-31 20:12:34', 1617),
(1554, 'No', '2018-07-31 20:12:38', 1617),
(1555, 'Si', '2018-07-31 20:12:45', 1616),
(1556, 'No', '2018-07-31 20:12:47', 1616),
(1557, 'Si', '2018-07-31 20:12:57', 1615),
(1558, 'No', '2018-07-31 20:12:59', 1615),
(1559, 'Si', '2018-07-31 20:13:04', 1614),
(1560, 'No', '2018-07-31 20:13:07', 1614),
(1561, 'Si', '2018-07-31 20:13:12', 1613),
(1562, 'No', '2018-07-31 20:13:16', 1613),
(1563, 'Si', '2018-07-31 20:13:23', 1612),
(1564, 'No', '2018-07-31 20:13:26', 1612),
(1565, 'Si', '2018-07-31 20:13:33', 1611),
(1566, 'No', '2018-07-31 20:13:37', 1611),
(1567, 'Si', '2018-07-31 20:13:46', 1610),
(1568, 'No', '2018-07-31 20:13:48', 1610),
(1569, 'Si', '2018-07-31 20:13:52', 1609),
(1570, 'No', '2018-07-31 20:13:57', 1609),
(1571, 'Si', '2018-07-31 20:14:02', 1608),
(1572, 'No', '2018-07-31 20:14:04', 1608),
(1573, 'Si', '2018-07-31 20:14:08', 1607),
(1574, 'No', '2018-07-31 20:14:09', 1607),
(1575, 'Si', '2018-07-31 20:14:15', 1606),
(1576, 'No', '2018-07-31 20:14:18', 1606),
(1577, 'Si', '2018-07-31 20:14:24', 1605),
(1578, 'No', '2018-07-31 20:14:28', 1605),
(1579, 'Si', '2018-07-31 20:14:32', 1604),
(1580, 'No', '2018-07-31 20:14:36', 1604),
(1581, 'Si', '2018-07-31 20:14:43', 1603),
(1582, 'No', '2018-07-31 20:14:45', 1603),
(1583, 'Si', '2018-07-31 20:14:51', 1602),
(1584, 'No', '2018-07-31 20:14:53', 1602),
(1585, 'Si', '2018-07-31 20:15:00', 1601),
(1586, 'No', '2018-07-31 20:15:02', 1601),
(1587, 'Si', '2018-07-31 20:15:08', 1600),
(1588, 'No', '2018-07-31 20:15:10', 1600),
(1589, 'Si', '2018-07-31 20:15:14', 1599),
(1590, 'No', '2018-07-31 20:15:17', 1599),
(1591, 'Si', '2018-07-31 20:15:22', 1598),
(1592, 'No', '2018-07-31 20:15:24', 1598),
(1593, 'Si', '2018-07-31 20:15:27', 1597),
(1594, 'No', '2018-07-31 20:15:30', 1597),
(1595, 'Si', '2018-07-31 20:15:33', 1596),
(1596, 'No', '2018-07-31 20:15:38', 1596),
(1598, 'Bueno', '2018-08-03 17:48:10', 1666),
(1599, 'Malo', '2018-08-03 17:48:13', 1666),
(1600, 'Nuevo', '2018-08-03 17:48:17', 1666),
(1601, 'Bueno', '2018-08-03 17:48:57', 1667),
(1602, 'Malo', '2018-08-03 17:49:00', 1667),
(1603, 'Nuevo', '2018-08-03 17:49:04', 1667),
(1604, 'Bueno', '2018-08-03 17:49:12', 1668),
(1605, 'Malo', '2018-08-03 17:49:14', 1668),
(1606, 'Nuevo', '2018-08-03 17:49:18', 1668),
(1607, 'Bueno', '2018-08-03 17:49:42', 1669),
(1608, 'Malo', '2018-08-03 17:49:46', 1669),
(1609, 'Nuevo', '2018-08-03 17:49:51', 1669),
(1610, 'Bueno', '2018-08-03 17:49:57', 1670),
(1611, 'Malo', '2018-08-03 17:50:03', 1670),
(1612, 'Nuevo', '2018-08-03 17:50:07', 1670),
(1613, 'Bueno', '2018-08-03 17:50:16', 1671),
(1614, 'Malo', '2018-08-03 17:50:20', 1671),
(1615, 'Nuevo', '2018-08-03 17:50:24', 1671),
(1616, 'Bueno ', '2018-08-03 17:50:31', 1672),
(1617, 'Malo', '2018-08-03 17:50:34', 1672),
(1618, 'Nuevo', '2018-08-03 17:50:40', 1672),
(1619, 'Bueno', '2018-08-03 17:50:46', 1673),
(1620, 'Malo', '2018-08-03 17:50:49', 1673),
(1621, 'Nuevo', '2018-08-03 17:50:53', 1673),
(1622, 'Bueno', '2018-08-03 17:51:04', 1674),
(1623, 'Malo', '2018-08-03 17:51:07', 1674),
(1624, 'Nuevo', '2018-08-03 17:51:09', 1674),
(1625, 'Bueno', '2018-08-03 17:51:15', 1675),
(1626, 'Malo', '2018-08-03 17:51:18', 1675),
(1627, 'Nuevo', '2018-08-03 17:51:22', 1675),
(1628, 'Bueno', '2018-08-03 17:51:27', 1676),
(1629, 'Malo', '2018-08-03 17:51:30', 1676),
(1630, 'Nuevo', '2018-08-03 17:51:34', 1676),
(1631, 'Bueno', '2018-08-03 17:51:48', 1677),
(1632, 'Malo', '2018-08-03 17:51:50', 1677),
(1633, 'Nuevo', '2018-08-03 17:51:55', 1677),
(1634, 'Bueno', '2018-08-03 17:52:04', 1678),
(1635, 'Malo', '2018-08-03 17:52:06', 1678),
(1636, 'Nuevo', '2018-08-03 17:52:09', 1678),
(1637, 'Bueno', '2018-08-03 17:52:14', 1679),
(1638, 'Malo', '2018-08-03 17:52:18', 1679),
(1639, 'Nuevo', '2018-08-03 17:52:21', 1679),
(1640, 'Bueno', '2018-08-03 17:52:26', 1680),
(1641, 'Malo', '2018-08-03 17:52:30', 1680),
(1642, 'Nuevo', '2018-08-03 17:52:33', 1680),
(1643, 'Bueno', '2018-08-03 17:52:38', 1681),
(1644, 'Malo', '2018-08-03 17:52:43', 1681),
(1645, 'Nuevo', '2018-08-03 17:52:46', 1681),
(1646, 'Bueno', '2018-08-03 17:52:58', 1682),
(1647, 'Malo', '2018-08-03 17:53:01', 1682),
(1648, 'Nuevo', '2018-08-03 17:53:04', 1682),
(1649, 'Bueno', '2018-08-03 17:53:13', 1683),
(1650, 'Malo', '2018-08-03 17:53:19', 1683),
(1651, 'Nuevo', '2018-08-03 17:53:24', 1683),
(1652, 'Bueno ', '2018-08-03 17:53:55', 1684),
(1653, 'Malo', '2018-08-03 17:53:58', 1684),
(1654, 'Nuevo', '2018-08-03 17:54:02', 1684),
(1655, 'Bueno', '2018-08-03 17:55:06', 1685),
(1656, 'Malo', '2018-08-03 17:55:09', 1685),
(1657, 'Nuevo', '2018-08-03 17:55:13', 1685),
(1658, 'Bueno', '2018-08-03 17:55:21', 1686),
(1659, 'Malo', '2018-08-03 17:55:25', 1686),
(1660, 'Nuevo', '2018-08-03 17:55:30', 1686),
(1661, 'Bueno', '2018-08-03 17:55:38', 1687),
(1662, 'Malo', '2018-08-03 17:55:45', 1687),
(1663, 'Nuevo', '2018-08-03 17:55:49', 1687),
(1664, 'Bueno', '2018-08-03 17:56:05', 1688),
(1665, 'Malo', '2018-08-03 17:56:07', 1688),
(1666, 'Nuevo', '2018-08-03 17:56:11', 1688),
(1667, 'Bueno ', '2018-08-03 17:56:18', 1689),
(1668, 'Malo', '2018-08-03 17:56:21', 1689),
(1669, 'Nuevo', '2018-08-03 17:56:26', 1689),
(1670, 'Bueno', '2018-08-03 17:56:34', 1690),
(1671, 'Malo', '2018-08-03 17:56:37', 1690),
(1672, 'Nuevo', '2018-08-03 17:56:42', 1690),
(1673, 'Bueno', '2018-08-03 17:56:47', 1691),
(1674, 'Malo', '2018-08-03 17:56:50', 1691),
(1675, 'Nuevo', '2018-08-03 17:56:53', 1691),
(1676, 'Bueno', '2018-08-03 17:56:59', 1692),
(1677, 'Malo', '2018-08-03 17:57:03', 1692),
(1678, 'Nuevo', '2018-08-03 17:57:06', 1692),
(1679, 'Bueno', '2018-08-03 17:57:11', 1693),
(1680, 'Malo', '2018-08-03 17:57:14', 1693),
(1681, 'Nuevo', '2018-08-03 17:57:18', 1693),
(1682, 'Bueno', '2018-08-03 17:57:25', 1694),
(1683, 'Malo', '2018-08-03 17:57:29', 1694),
(1684, 'Nuevo', '2018-08-03 17:57:31', 1694),
(1685, 'Bueno', '2018-08-03 17:57:56', 1695),
(1686, 'Malo', '2018-08-03 17:57:59', 1695),
(1687, 'Nuevo', '2018-08-03 17:58:08', 1695),
(1688, 'Bueno', '2018-08-03 17:58:12', 1696),
(1689, 'Malo', '2018-08-03 17:58:16', 1696),
(1690, 'Nuevo', '2018-08-03 17:58:24', 1696),
(1691, 'Bueno', '2018-08-03 17:58:29', 1697),
(1692, 'Malo', '2018-08-03 17:58:32', 1697),
(1693, 'Nuevo', '2018-08-03 17:58:35', 1697),
(1694, 'Bueno', '2018-08-03 17:58:42', 1698),
(1695, 'Malo', '2018-08-03 17:58:46', 1698),
(1696, 'Nuevo', '2018-08-03 17:58:56', 1698),
(1697, 'Bueno', '2018-08-03 17:59:04', 1699),
(1698, 'Malo', '2018-08-03 17:59:08', 1699),
(1699, 'Nuevo', '2018-08-03 17:59:11', 1699),
(1700, 'Bueno', '2018-08-03 17:59:17', 1700),
(1701, 'Malo', '2018-08-03 17:59:23', 1700),
(1702, 'Nuevo', '2018-08-03 17:59:26', 1700),
(1703, 'Aprobado', '2018-08-03 19:40:00', 850),
(1704, 'Rechazado', '2018-08-03 19:40:04', 850),
(1705, 'Aprobado', '2018-08-03 19:40:23', 851),
(1706, 'Rechazado', '2018-08-03 19:40:30', 851),
(1707, 'Aprobado', '2018-08-03 19:40:42', 852),
(1708, 'Rechazado', '2018-08-03 19:40:48', 852),
(1709, 'Aprobado', '2018-08-03 19:40:58', 853),
(1710, 'Rechazado', '2018-08-03 19:41:04', 853),
(1711, 'Aprobado', '2018-08-03 19:41:11', 854),
(1712, 'Rechazado', '2018-08-03 19:41:17', 854),
(1713, 'Aprobado', '2018-08-03 19:41:26', 855),
(1714, 'Rechazado', '2018-08-03 19:41:30', 855),
(1715, 'Aprobado', '2018-08-03 19:41:38', 856),
(1716, 'Rechazado', '2018-08-03 19:41:43', 856),
(1717, 'Aprobado', '2018-08-03 19:41:50', 857),
(1718, 'Rechazado', '2018-08-03 19:41:56', 857),
(1719, 'Aprobado', '2018-08-03 19:42:02', 858),
(1720, 'Rechazado', '2018-08-03 19:42:06', 858),
(1721, 'Aprobado', '2018-08-03 19:42:12', 859),
(1722, 'Rechazado', '2018-08-03 19:42:16', 859),
(1723, 'Aprobado', '2018-08-03 19:42:22', 860),
(1724, 'Rechazado', '2018-08-03 19:42:27', 860),
(2023, 'Si', '2018-08-07 15:23:48', 2047),
(2024, 'No', '2018-08-07 15:23:50', 2047),
(2025, 'Si', '2018-08-07 15:24:26', 2049),
(2026, 'No', '2018-08-07 15:24:28', 2049),
(2027, 'Si', '2018-08-07 15:25:22', 2051),
(2028, 'No', '2018-08-07 15:25:26', 2051),
(2029, 'Si', '2018-08-07 15:33:26', 2053),
(2030, 'No', '2018-08-07 15:33:29', 2053),
(2031, 'Nuevo', '2018-08-07 15:33:59', 2055),
(2032, 'Usado', '2018-08-07 15:34:03', 2055),
(2033, 'Si', '2018-08-07 15:35:25', 2056),
(2034, 'No', '2018-08-07 15:35:27', 2056),
(2035, 'Si', '2018-08-07 15:36:19', 2059),
(2036, 'No', '2018-08-07 15:36:21', 2059),
(2037, 'Si', '2018-08-07 15:37:05', 2061),
(2038, 'No', '2018-08-07 15:37:07', 2061),
(2039, 'Si', '2018-08-07 15:38:05', 2063),
(2040, 'No', '2018-08-07 15:38:07', 2063),
(2041, 'Si', '2018-08-07 15:39:44', 2065),
(2042, 'No', '2018-08-07 15:39:46', 2065),
(2043, 'Nuevo ', '2018-08-07 15:40:07', 2067),
(2044, 'Usado', '2018-08-07 15:40:10', 2067),
(2045, 'Si', '2018-08-07 15:41:59', 2068),
(2046, 'No', '2018-08-07 15:42:01', 2068),
(2047, 'Nuevo', '2018-08-07 15:42:20', 2070),
(2048, 'Usado', '2018-08-07 15:42:23', 2070),
(2049, 'Si', '2018-08-07 15:43:55', 2071),
(2050, 'No', '2018-08-07 15:43:57', 2071),
(2051, 'Si', '2018-08-07 15:46:21', 2073),
(2052, 'No', '2018-08-07 15:46:23', 2073),
(2053, 'Si', '2018-08-07 15:47:11', 2075),
(2054, 'No', '2018-08-07 15:47:13', 2075),
(2055, 'Nuevo', '2018-08-07 15:47:41', 2077),
(2056, 'Usado', '2018-08-07 15:47:44', 2077),
(2057, 'Si', '2018-08-07 15:48:05', 2078),
(2058, 'No', '2018-08-07 15:48:09', 2078),
(2059, 'Nuevo', '2018-08-07 15:48:48', 2080),
(2060, 'Usado', '2018-08-07 15:48:51', 2080),
(2061, 'Si', '2018-08-07 15:49:15', 2081),
(2062, 'No', '2018-08-07 15:49:17', 2081),
(2063, 'Ok', '2018-08-07 16:27:30', 2084),
(2064, 'No corresponde', '2018-08-07 16:27:37', 2084),
(2065, 'Ok', '2018-08-07 16:28:40', 2086),
(2067, 'No corresponde', '2018-08-07 16:29:04', 2086),
(2068, 'Ok', '2018-08-07 16:29:55', 2088),
(2069, 'No corresponde', '2018-08-07 16:30:01', 2088),
(2070, 'Ok', '2018-08-07 16:31:51', 2090),
(2071, 'No corresponde', '2018-08-07 16:31:55', 2090),
(2072, 'Ok', '2018-08-07 16:32:29', 2093),
(2073, 'No corresponde', '2018-08-07 16:32:35', 2093),
(2074, 'Ok', '2018-08-07 16:33:43', 2095),
(2075, 'No corresponde', '2018-08-07 16:33:48', 2095),
(2076, 'Ok', '2018-08-07 16:34:48', 2097),
(2077, 'No corresponde', '2018-08-07 16:34:56', 2097),
(2078, 'Ok', '2018-08-07 16:35:44', 2099),
(2079, 'No corresponde', '2018-08-07 16:35:52', 2099),
(2080, 'Ok', '2018-08-07 16:36:36', 2102),
(2081, 'No corresponde', '2018-08-07 16:36:44', 2102),
(2082, 'Ok', '2018-08-07 18:31:10', 2104),
(2083, 'No corresponde', '2018-08-07 18:31:17', 2104),
(2084, 'Ok', '2018-08-07 18:31:52', 2106),
(2085, 'No corresponde', '2018-08-07 18:32:08', 2106),
(2086, 'Ok', '2018-08-07 18:36:04', 2108),
(2087, 'No corresponde', '2018-08-07 18:36:11', 2108),
(2088, 'Ok', '2018-08-07 18:45:02', 2110),
(2089, 'No corresponde', '2018-08-07 18:57:55', 2110),
(2090, 'Ok', '2018-08-07 19:13:26', 2112),
(2091, 'No corresponde', '2018-08-07 19:13:32', 2112),
(2092, 'Ok', '2018-08-07 19:14:05', 2114),
(2093, 'No corresponde', '2018-08-07 19:14:17', 2114),
(2094, 'Ok', '2018-08-07 19:17:21', 2117),
(2095, 'No corresponde', '2018-08-07 19:17:27', 2117),
(2096, 'Ok', '2018-08-07 19:47:35', 2119),
(2097, 'No corresponde', '2018-08-07 19:47:50', 2119),
(2098, 'Ok', '2018-08-07 19:49:14', 2121),
(2099, 'No corresponde', '2018-08-07 19:49:21', 2121),
(2100, 'Ok', '2018-08-07 19:51:00', 2123),
(2101, 'No corresponde', '2018-08-07 19:51:17', 2123),
(2102, 'Ok', '2018-08-07 19:51:45', 2125),
(2103, 'No corresponde', '2018-08-07 19:51:50', 2125),
(2104, 'Ok', '2018-08-07 19:53:32', 2127),
(2105, 'No corresponde', '2018-08-07 19:53:40', 2127),
(2106, 'Ok', '2018-08-07 19:55:27', 2129),
(2107, 'No corresponde', '2018-08-07 19:55:33', 2129),
(2108, 'Ok', '2018-08-07 19:56:04', 2131),
(2109, 'No corresponde', '2018-08-07 19:56:14', 2131),
(2110, 'Ok', '2018-08-07 19:57:40', 2133),
(2111, 'No corresponde', '2018-08-07 19:57:50', 2133),
(2112, 'Ok', '2018-08-07 20:00:47', 2135),
(2113, 'No corresponde', '2018-08-07 20:02:07', 2135),
(2114, 'Ok', '2018-08-07 20:03:05', 2137),
(2115, 'No corresponde', '2018-08-07 20:03:12', 2137),
(2116, 'Ok', '2018-08-07 20:03:52', 2139),
(2117, 'No corresponde', '2018-08-07 20:03:58', 2139),
(2118, 'Ok', '2018-08-07 20:04:34', 2141),
(2119, 'No corresponde', '2018-08-07 20:04:39', 2141),
(2120, 'Ok', '2018-08-07 20:05:19', 2143),
(2121, 'No corresponde', '2018-08-07 20:05:24', 2143),
(2124, 'Ok', '2018-08-08 15:06:03', 2148),
(2125, 'No Ok', '2018-08-08 15:06:08', 2148),
(2126, 'Ok', '2018-08-08 15:07:14', 2150),
(2127, 'No Ok', '2018-08-08 15:07:18', 2150),
(2128, 'Ok', '2018-08-08 15:12:35', 2152),
(2129, 'No Ok', '2018-08-08 15:12:38', 2152),
(2130, 'Ok', '2018-08-08 15:13:54', 2154),
(2131, 'No Ok', '2018-08-08 15:14:00', 2154),
(2132, 'Ok', '2018-08-08 15:15:09', 2156),
(2133, 'No Ok', '2018-08-08 15:15:14', 2156),
(2134, 'Ok', '2018-08-08 15:16:12', 2158),
(2135, 'No Ok', '2018-08-08 15:16:18', 2158),
(2136, 'Ok', '2018-08-08 15:25:12', 2160),
(2137, 'No Ok', '2018-08-08 15:25:15', 2160),
(2138, 'Ok', '2018-08-08 15:25:59', 2162),
(2139, 'No Ok', '2018-08-08 15:26:02', 2162),
(2140, 'Ok', '2018-08-08 15:26:52', 2164),
(2141, 'No Ok', '2018-08-08 15:26:56', 2164),
(2142, 'Ok', '2018-08-08 15:28:45', 2166),
(2143, 'No Ok', '2018-08-08 15:28:50', 2166),
(2144, 'Ok', '2018-08-08 15:31:54', 2169),
(2145, 'No Ok', '2018-08-08 15:31:58', 2169),
(2146, 'Ok', '2018-08-08 15:32:47', 2171),
(2147, 'No Ok', '2018-08-08 15:32:56', 2171),
(2148, 'Ok', '2018-08-08 15:33:56', 2173),
(2149, 'No Ok', '2018-08-08 15:34:06', 2173),
(2150, 'Ok', '2018-08-08 15:39:11', 2175),
(2151, 'No Ok', '2018-08-08 15:39:14', 2175),
(2152, 'Ok', '2018-08-08 15:42:49', 2177),
(2153, 'No Ok:', '2018-08-08 15:42:54', 2177),
(2154, 'Ok', '2018-08-08 15:45:57', 2179),
(2155, 'No Ok', '2018-08-08 15:46:04', 2179),
(2156, 'Ok', '2018-08-08 15:46:48', 2181),
(2157, 'No Ok', '2018-08-08 15:46:52', 2181),
(2158, 'Ok', '2018-08-08 15:48:04', 2183),
(2160, 'No Ok', '2018-08-08 15:48:13', 2183),
(2161, 'Ok', '2018-08-08 15:49:18', 2185),
(2162, 'No Ok', '2018-08-08 15:49:23', 2185),
(2163, 'Ok', '2018-08-08 15:50:39', 2187),
(2164, 'No Ok', '2018-08-08 15:50:42', 2187),
(2165, 'Ok', '2018-08-08 15:59:32', 2189),
(2166, 'No Ok', '2018-08-08 15:59:38', 2189),
(2167, 'Ok', '2018-08-08 16:06:02', 2191),
(2168, 'No Ok', '2018-08-08 16:06:08', 2191),
(2169, 'Ok', '2018-08-08 16:06:57', 2193),
(2170, 'No Ok', '2018-08-08 16:07:00', 2193),
(2171, 'Ok', '2018-08-08 16:07:31', 2195),
(2172, 'No Ok', '2018-08-08 16:07:36', 2195),
(2173, 'Ok', '2018-08-08 16:08:21', 2197),
(2174, 'No Ok', '2018-08-08 16:08:26', 2197),
(2175, 'Ok', '2018-08-08 16:09:25', 2199),
(2176, '', '2018-08-08 16:09:25', 2199),
(2177, 'No Ok', '2018-08-08 16:09:32', 2199),
(2178, 'Ok', '2018-08-08 16:10:11', 2201),
(2179, 'No Ok', '2018-08-08 16:10:16', 2201),
(2180, 'Ok', '2018-08-08 16:15:47', 2203),
(2181, 'No Ok', '2018-08-08 16:15:52', 2203),
(2182, 'Ok', '2018-08-08 16:23:16', 2207),
(2183, 'No Ok', '2018-08-08 16:23:28', 2207),
(2184, 'Ok', '2018-08-08 17:00:05', 2209),
(2185, 'No Ok', '2018-08-08 17:00:11', 2209),
(2186, 'Ok', '2018-08-08 17:03:10', 2211),
(2187, 'No Ok', '2018-08-08 17:03:16', 2211),
(2188, 'Ok', '2018-08-08 17:07:52', 2213),
(2189, 'No Ok', '2018-08-08 17:07:59', 2213),
(2190, 'Ok ', '2018-08-08 17:09:53', 2215),
(2191, 'No Ok', '2018-08-08 17:09:58', 2215),
(2192, 'Ok', '2018-08-08 17:10:05', 2216),
(2193, 'No Ok', '2018-08-08 17:10:10', 2216),
(2194, 'Ok', '2018-08-08 17:10:16', 2217),
(2195, 'No Ok', '2018-08-08 17:10:22', 2217),
(2196, 'Ok', '2018-08-08 17:10:29', 2218),
(2197, 'No Ok', '2018-08-08 17:10:35', 2218),
(2198, 'Ok', '2018-08-08 17:42:15', 2223),
(2199, 'No Ok', '2018-08-08 17:42:21', 2223),
(2200, 'Ok', '2018-08-08 17:45:34', 2225),
(2201, 'No Ok', '2018-08-08 17:45:38', 2225),
(2202, 'Ok', '2018-08-08 17:47:28', 2227),
(2203, 'No Ok', '2018-08-08 17:47:33', 2227),
(2204, 'Ok', '2018-08-08 17:50:11', 2229),
(2205, 'No Ok', '2018-08-08 17:50:16', 2229),
(2206, 'Ok', '2018-08-08 18:00:28', 2231),
(2207, 'No Ok', '2018-08-08 18:00:44', 2231),
(2208, 'Ok', '2018-08-08 18:01:58', 2233),
(2209, 'No Ok', '2018-08-08 18:02:02', 2233),
(2210, 'Ok', '2018-08-08 18:04:47', 2235),
(2211, 'No Ok', '2018-08-08 18:04:51', 2235),
(2212, 'Ok', '2018-08-08 18:19:44', 2237),
(2213, 'No Ok', '2018-08-08 18:19:48', 2237),
(2214, 'Ok', '2018-08-08 18:20:23', 2239),
(2215, 'No Ok', '2018-08-08 18:20:26', 2239),
(2216, 'Ok', '2018-08-08 18:21:03', 2241),
(2217, 'No Ok', '2018-08-08 18:21:06', 2241),
(2218, 'Ok', '2018-08-08 18:21:42', 2243),
(2219, 'No Ok', '2018-08-08 18:21:46', 2243),
(2220, 'Ok', '2018-08-08 18:24:20', 2245),
(2221, 'No Ok', '2018-08-08 18:24:27', 2245),
(2222, 'Ok', '2018-08-08 18:34:14', 2247),
(2223, 'No Ok', '2018-08-08 18:34:21', 2247),
(2224, 'Ok', '2018-08-08 18:57:19', 2249),
(2225, 'No Ok', '2018-08-08 18:57:22', 2249),
(2226, 'Ok', '2018-08-08 18:58:52', 2251),
(2227, 'No Ok', '2018-08-08 18:58:56', 2251),
(2228, 'Ok', '2018-08-08 18:59:47', 2253),
(2230, 'No Ok', '2018-08-08 18:59:52', 2253),
(2231, 'Ok', '2018-08-08 19:01:26', 2255),
(2232, 'No Ok', '2018-08-08 19:01:30', 2255),
(2233, 'Ok', '2018-08-08 19:05:11', 2257),
(2234, 'No Ok', '2018-08-08 19:05:16', 2257),
(2235, 'Ok', '2018-08-08 19:07:06', 2259),
(2236, 'No Ok', '2018-08-08 19:07:13', 2259),
(2237, 'Ok', '2018-08-08 19:10:18', 2261),
(2238, 'No Ok', '2018-08-08 19:10:23', 2261),
(2239, 'Ok', '2018-08-08 19:21:31', 2263),
(2240, 'No Ok', '2018-08-08 19:21:35', 2263),
(2241, 'Ok', '2018-08-08 19:22:29', 2265),
(2242, 'No Ok', '2018-08-08 19:22:33', 2265),
(2243, 'Ok', '2018-08-08 19:23:23', 2267),
(2244, 'No Ok', '2018-08-08 19:23:26', 2267),
(2245, 'Ok', '2018-08-08 19:24:09', 2269),
(2246, 'No Ok', '2018-08-08 19:24:13', 2269),
(2247, 'Ok', '2018-08-08 19:26:45', 2271),
(2248, 'No Ok', '2018-08-08 19:26:48', 2271),
(2249, 'Ok', '2018-08-08 19:27:32', 2273),
(2250, 'No Ok', '2018-08-08 19:27:36', 2273),
(2251, 'Ok', '2018-08-08 19:28:59', 2275),
(2252, 'No Ok', '2018-08-08 19:29:03', 2275),
(2253, 'Ok', '2018-08-08 19:34:53', 2277),
(2254, 'No Ok', '2018-08-08 19:35:00', 2277),
(2255, 'Ok', '2018-08-08 19:37:17', 2279),
(2256, 'No Ok', '2018-08-08 19:37:25', 2279),
(2257, 'Ok', '2018-08-08 19:38:55', 2281),
(2258, 'No Ok', '2018-08-08 19:39:09', 2281),
(2259, 'Ok', '2018-08-08 19:40:44', 2283),
(2262, 'No Ok', '2018-08-08 19:40:51', 2283),
(2263, 'Ok', '2018-08-08 19:42:42', 2285),
(2264, 'No Ok', '2018-08-08 19:42:47', 2285),
(2265, 'Ok', '2018-08-08 19:44:21', 2287),
(2266, 'No Ok', '2018-08-08 19:44:23', 2287),
(2267, 'Ok', '2018-08-08 19:45:36', 2289),
(2268, 'No Ok', '2018-08-08 19:45:41', 2289),
(2269, 'Ok', '2018-08-11 23:38:26', 2297),
(2270, 'No Ok', '2018-08-11 23:38:31', 2297),
(2271, 'Ok ', '2018-08-11 23:38:37', 2296),
(2272, 'No Ok', '2018-08-11 23:38:42', 2296),
(2273, 'Ok', '2018-08-11 23:38:48', 2295),
(2274, 'No Ok', '2018-08-11 23:38:52', 2295),
(2275, 'Ok', '2018-08-11 23:38:58', 2294),
(2276, 'No Ok', '2018-08-11 23:39:03', 2294),
(2277, 'Ok', '2018-08-11 23:39:09', 2293),
(2278, 'No Ok', '2018-08-11 23:39:13', 2293),
(2279, 'Ok', '2018-08-11 23:39:18', 2292),
(2280, 'No Ok', '2018-08-11 23:39:23', 2292),
(2281, 'Ok', '2018-08-11 23:39:29', 2291),
(2282, 'No Ok', '2018-08-11 23:39:35', 2291),
(2283, 'Ok', '2018-08-13 03:12:57', 2309),
(2284, 'No Ok', '2018-08-13 03:13:01', 2309),
(2286, 'Ok', '2018-08-13 03:13:43', 2310),
(2287, 'No Ok', '2018-08-13 03:13:49', 2310),
(2288, 'Ok', '2018-08-13 03:13:59', 2311),
(2289, 'No Ok', '2018-08-13 03:14:06', 2311),
(2290, 'Ok', '2018-08-13 03:14:14', 2313),
(2291, 'No Ok', '2018-08-13 03:14:23', 2313),
(2292, 'Ok', '2018-08-13 03:14:29', 2314),
(2293, 'No Ok', '2018-08-13 03:14:35', 2314),
(2294, 'Ok', '2018-08-13 03:15:33', 2315),
(2295, 'No Ok', '2018-08-13 03:15:38', 2315),
(2296, 'Ok', '2018-08-13 03:15:45', 2316),
(2297, 'No Ok', '2018-08-13 03:15:53', 2316),
(2298, 'Ok', '2018-08-13 03:20:17', 2324),
(2299, 'No Ok', '2018-08-13 03:20:21', 2324),
(2300, 'Ok ', '2018-08-13 03:20:28', 2325),
(2301, 'No Ok', '2018-08-13 03:20:35', 2325),
(2302, 'Ok', '2018-08-13 03:21:07', 2326),
(2303, 'No Ok', '2018-08-13 03:21:11', 2326),
(2304, 'Ok', '2018-08-13 03:21:17', 2327),
(2305, 'No Ok', '2018-08-13 03:21:24', 2327),
(2306, 'Ok ', '2018-08-13 03:21:30', 2328),
(2307, 'No Ok', '2018-08-13 03:21:36', 2328),
(2308, 'Ok', '2018-08-13 03:21:43', 2329),
(2309, 'No Ok', '2018-08-13 03:21:49', 2329),
(2310, 'Ok', '2018-08-13 03:28:43', 2336),
(2311, 'No Ok', '2018-08-13 03:28:50', 2336),
(2312, 'Ok ', '2018-08-13 03:28:59', 2337),
(2313, 'No Ok ', '2018-08-13 03:29:04', 2337),
(2314, 'Ok ', '2018-08-13 03:29:11', 2338),
(2315, 'No Ok ', '2018-08-13 03:29:17', 2338),
(2316, 'Ok ', '2018-08-13 03:29:22', 2339),
(2317, 'No Ok ', '2018-08-13 03:29:30', 2339),
(2318, 'Ok ', '2018-08-13 03:30:17', 2340),
(2319, 'No Ok ', '2018-08-13 03:30:23', 2340),
(2320, 'Ok ', '2018-08-13 03:30:30', 2341),
(2321, 'No Ok ', '2018-08-13 03:30:36', 2341),
(2322, 'Ok ', '2018-08-13 03:30:44', 2342),
(2323, 'No Ok ', '2018-08-13 03:30:49', 2342),
(2324, 'Ok ', '2018-08-13 03:30:55', 2343),
(2325, 'No Ok ', '2018-08-13 03:30:58', 2343),
(2326, 'Ok ', '2018-08-13 03:31:22', 2344),
(2327, 'No Ok ', '2018-08-13 03:31:27', 2344);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id_grupo` int(10) NOT NULL,
  `descripcion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id_grupo`, `descripcion`, `estado`, `id_empresa`) VALUES
(1, 'Carguio', 'AC', 6),
(2, 'Perforación ', 'AC', 6),
(3, 'Auxiliares', 'AC', 6),
(4, 'grupo test02', 'AN', 6),
(5, 'Perforadoras', 'AC', 7),
(6, 'Perforadora Rotary', 'AC', 6),
(7, 'Perforadora Rotary', 'AC', 7),
(8, 'Perforadora Top Hammer', 'AC', 7),
(9, 'Perforadora DTH', 'AC', 7),
(10, 'grupo test 2018/09', 'AN', 6),
(11, 'NUEVO', 'AN', 6),
(12, 'grupo test 003', 'AN', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramientas`
--

CREATE TABLE `herramientas` (
  `herrId` int(11) NOT NULL,
  `herrcodigo` varchar(255) NOT NULL DEFAULT '',
  `herrmarca` varchar(255) DEFAULT NULL,
  `modid` int(10) DEFAULT NULL,
  `tipoid` int(10) DEFAULT NULL,
  `equip_estad` varchar(4) DEFAULT NULL,
  `herrdescrip` varchar(255) DEFAULT NULL,
  `depositoId` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `herramientas`
--

INSERT INTO `herramientas` (`herrId`, `herrcodigo`, `herrmarca`, `modid`, `tipoid`, `equip_estad`, `herrdescrip`, `depositoId`, `id_empresa`) VALUES
(1, 'HR-OFA-Linterna', 'Linterna', 1, NULL, 'AC', 'HR-OFA-Linterna', 1, 6),
(2, 'SW80', 'Robust', 1, NULL, 'AC', 'Taladro', 1, 6),
(4, 'HR-TT-Organizador Tornillos', 'Organizador tornillos - Stanley', 1, NULL, 'AC', 'HR-TT-Organizador Tornillos', 1, 6),
(5, 'HR-TT-Escalera 7 peldaños', 'Escalera 7 peldaño - Ayinco', 1, NULL, 'AC', 'HR-TT-Escalera 7 peldaños', 1, 6),
(6, 'HR-TT-Mascara facial', 'Mascara facial', 2, NULL, 'AC', 'HR-TT-Mascara facial', 1, 6),
(7, 'HR-TT-Prot Audit-Vincha', 'Protector auditivo copa tipo vincha', 1, NULL, 'AC', 'HR-TT-Prot Audit-Vincha', 1, 6),
(8, 'HR-TT-Llave combinada 10mm', 'Llave combinada 10mm', 3, NULL, 'TR', 'HR-TT-Llave combinada 10mm', 1, 6),
(9, 'HR-TT-Llave combinada 13mm', 'Llave combinada 13mm', 1, NULL, 'AC', 'HR-TT-Llave combinada 13mm', 1, 6),
(10, 'HR-TT-Llave combinada 15mm', 'Llave combinada 13mm', 1, NULL, 'AC', 'HR-TT-Llave combinada 15mm', 1, 6),
(11, 'HR-TT-Llave combinada 17mm', 'Llave combinada 17mm', 1, NULL, 'AC', 'HR-TT-Llave combinada 17mm', 1, 6),
(12, 'HR-TT-Llave combinada 7/16"', 'Llave combinada 7/16"', 1, NULL, 'AC', 'HR-TT-Llave combinada 7/16"', 1, 6),
(13, 'HR-TT-Llave combinada 9/16"', 'Llave combinada 9/16"', 1, NULL, 'AC', 'HR-TT-Llave combinada 9/16"', 1, 6),
(14, 'HR-TT-Destornillador de puño philips', 'Destornillador de puño philips - Bulit', 1, NULL, 'AC', 'HR-TT-Destornillador de puño philips', 1, 6),
(15, 'HR-TT-Llave Francesa 30mm', 'Llave Francesa 30mm', 1, NULL, 'AC', 'HR-TT-Llave Francesa 30mm', 1, 6),
(16, 'HR-TT-Cinta métrica de 5 m ', 'Cinta métrica de 5 m ', 1, NULL, 'AC', 'HR-TT-Cinta métrica de 5 m ', 1, 6),
(18, 'HR-OFA-Arco de sierra', 'Arco de sierra', 1, NULL, 'AC', 'HR-OFA-Arco de sierra', 1, 6),
(19, 'HR-OFA-Extractor de poleas 150 mm', 'Extractor de poleas 150 mm', 1, NULL, 'AC', 'HR-OFA-Extractor de poleas 150 mm', 1, 6),
(20, 'HR-OFA-Alargues', 'Alargues', 1, NULL, 'AC', 'HR-OFA-Alargues', 1, 6),
(21, 'HR-OFE-Espatula chica', 'Espatula chica', 1, NULL, 'AC', 'HR-OFE-Espatula chica', 1, 6),
(22, 'HR-OFE-Espatulas medianas', 'Espatulas medianas', 1, NULL, 'AC', 'HR-OFE-Espatulas medianas', 1, 6),
(23, 'HR-OFE-Barretines de 0,80 y 0,90 negro, naranja', 'barretines de 0,80 y 0,90 negro, naranja', 1, NULL, 'AC', 'HR-OFE-Barretines de 0,80 y 0,90 negro, naranja', 1, 6),
(24, 'HR-OFE-Arnés', 'Arnés', 1, NULL, 'AC', 'HR-OFE-Arnés', 1, 6),
(25, 'HR-OFE-Llanas', 'Llanas', 1, NULL, 'AC', 'HR-OFE-Llanas', 1, 6),
(26, 'HR-OFE-Llana dentada', 'Llana dentada', 1, NULL, 'AC', 'HR-OFE-Llana dentada', 1, 6),
(27, 'HR-OFE-Balde de Albañil', 'Balde de Albañil', 1, NULL, 'AC', 'HR-OFE-Balde de Albañil', 1, 6),
(28, 'HR-OFE-Anchada', 'Anchada', 1, NULL, 'AC', 'HR-OFE-Anchada', 1, 6),
(29, 'HR-OFE-Bota de goma', 'Bota de goma', 1, NULL, 'AC', 'HR-OFE-Bota de goma', 1, 6),
(30, 'HR-ODE-Boquilla para termofusión 1"', 'Boquilla para termofusión 1"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 1"', 1, 6),
(31, 'HR-ODE-Boquilla para termofusión 4"', 'Boquilla para termofusión 4"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 4"', 1, 6),
(32, 'HR-ODE-Boquilla para termofusión 2,5"', 'Boquilla para termofusión 2,5"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 2,5"', 1, 6),
(33, 'HR-ODE-Boquilla para termofusión 80mm', 'Boquilla para termofusión 80mm', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 80mm', 1, 6),
(34, 'HR-ODE-Boquilla para termofusión 2"', 'Boquilla para termofusión 2"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 2"', 1, 6),
(36, 'HR-ODE-Boquilla para termofusión 1 1/4"', 'Boquilla para termofusión 1 1/4"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 1 1/4"', 1, 6),
(37, 'HR-ODE-Boquilla para termofusión 3/4"', 'Boquilla para termofusión 3/4"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 3/4"', 1, 6),
(38, 'HR-ODE-Boquilla para termofusión 1/2"', 'Boquilla para termofusión 1/2"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 1/2"', 1, 6),
(39, 'HR-ODE-Termofusora 1', 'Termofusora 1', 1, NULL, 'AC', 'HR-ODE-Termofusora 1', 1, 6),
(40, 'HR-ODE-Termofusora 1600w', 'Termofusora 1600w', 1, NULL, 'AC', 'HR-ODE-Termofusora 1600w', 1, 6),
(41, 'HR-ODE-Boquilla para termofusión 75mm', 'Boquilla para termofusión 75mm', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 75mm', 1, 6),
(42, 'HR-ODE-Boquilla para termofusión 90mm', 'Boquilla para termofusión 90mm', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 90mm', 1, 6),
(43, 'HR-ODE-Boquilla para termofusión 110mm', 'Boquilla para termofusión 110mm', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 110mm', 1, 6),
(44, 'HR-OVI-TermoAnemómetro ', 'TermoAnemómetro ', 1, NULL, 'AC', 'HR-OVI-TermoAnemómetro ', 1, 6),
(45, 'HR-OVI-Termometro infrarojo', 'Termometro infrarojo', 1, NULL, 'AC', 'HR-OVI-Termometro infrarojo', 1, 6),
(46, 'HR-OVI-Pinza extractora de fusible NH', 'Pinza extractora de fusible NH', 1, NULL, 'AC', 'HR-OVI-Pinza extractora de fusible NH', 1, 6),
(47, 'HR-OVI-Pinza amperometrica con puntas', 'Pinza amperometrica con puntas', 1, NULL, 'AC', 'HR-OVI-Pinza amperometrica con puntas', 1, 6),
(48, 'HR-OVI- Soldador Cautín 30w', 'Soldador Cautín 30w', 1, NULL, 'AC', 'HR-OVI- Soldador Cautín 30w', 1, 6),
(49, 'HR-OFE-Multimetro con puntas', 'Multimetro con puntas', 1, NULL, 'AC', 'HR-OFE-Multimetro con puntas', 1, 6),
(50, 'HR-TTA-Pértiga DPA 3 KV', 'Pértiga DPA 3 KV', 1, NULL, 'AC', 'HR-TTA-Pértiga DPA 3 KV', 1, 6),
(51, 'HR-OVI-Detector de metál ', 'Detector de metál ', 1, NULL, 'AC', 'HR-OVI-Detector de metál ', 1, 6),
(52, 'HR-OVI-Programador de variador vel.', 'Programador de variador vel.', 1, NULL, 'AC', 'HR-OVI-Programador de variador vel.', 1, 6),
(53, 'HR-OVI-Pinza amp con puntas', 'Pinza amp con puntas', 1, NULL, 'AC', 'HR-OVI-Pinza amp con puntas', 1, 6),
(54, 'HR-OFA-Caja de llaves tubos medidas chicas(completa)', 'Caja de llaves tubos medidas chicas(completa)', 1, NULL, 'AC', 'HR-OFA-Caja de llaves tubos medidas chicas(completa)', 1, 6),
(55, 'HR-OFA-Caja de llaves tubos medidas grandes(completa)', 'Caja de llaves tubos medidas grandes(completa)', 1, NULL, 'AC', 'HR-OFA-Caja de llaves tubos medidas grandes(completa)', 1, 6),
(56, 'HR-OFA-Caja de mechas(12,16,20mm y 1/2")', 'Caja de mechas(12,16,20mm y 1/2")', 1, NULL, 'AC', 'HR-OFA-Caja de mechas(12,16,20mm y 1/2")', 1, 6),
(57, 'HR-OFA-Amoladora 4,5" 840w 9557 HP', 'Amoladora 4,5" 840w 9557 HP', 1, NULL, 'TR', 'HR-OFA-Amoladora 4,5" 840w 9557 HP', 1, 6),
(58, 'HR-OFA-Llave Stillson 36"', 'Llave Stillson 36"', 1, NULL, 'AC', 'HR-OFA-Llave Stillson 36"', 1, 6),
(59, 'HR-OFA-Pistola de calor', 'Pistola de calor', 1, NULL, 'AC', 'HR-OFA-Pistola de calor', 1, 6),
(60, 'HR-OFA-Serrucho 24"', 'Serrucho 24"', 1, NULL, 'AC', 'HR-OFA-Serrucho 24"', 1, 6),
(61, 'HR-OFA-Atornillador ? 13 con bateria ', 'Atornillador ? 13 con bateria ', 1, NULL, 'AC', 'HR-OFA-Atornillador ? 13 con bateria ', 1, 6),
(65, 'HR-OFA-Rotomartillo con mandril y llave', 'Rotomartillo con mandril y llave', 1, NULL, 'AC', 'HR-OFA-Rotomartillo con mandril y llave', 1, 6),
(66, 'HR-ODE-Extractor de poleas 400 mm', 'Extractor de poleas 400 mm', 1, NULL, 'AC', 'HR-ODE-Extractor de poleas 400 mm', 1, 6),
(67, 'HR-OFE-Espatulas grandes', 'Espatulas grandes', 1, NULL, 'AC', 'HR-OFE-Espatulas grandes', 1, 6),
(68, 'HR-OFE-Soplete para colocar membrana', 'Soplete para colocar membrana', 1, NULL, 'AC', 'HR-OFE-Soplete para colocar membrana', 1, 6),
(69, 'HR-OFE-Cola de vida ', 'Cola de vida ', 1, NULL, 'AC', 'HR-OFE-Cola de vida ', 1, 6),
(73, 'HR-OFE-Serrucho para corte en durlock', 'Serrucho para corte en durlock', 1, NULL, 'AC', 'HR-OFE-Serrucho para corte en durlock', 1, 6),
(74, 'HR-OFE-Llana de durlock', 'Llana de durlock', 1, NULL, 'AC', 'HR-OFE-Llana de durlock', 1, 6),
(75, 'HR-OFE-Fratacho', 'Fratacho', 1, NULL, 'TR', 'HR-OFE-Fratacho', 1, 6),
(76, 'HR-OFE-Cortafierro', 'Cortafierro', 1, NULL, 'AC', 'HR-OFE-Cortafierro', 1, 6),
(78, 'HR-OFE-Cuchara mediana de albañil', 'Cuchara mediana de albañil', 1, NULL, 'AC', 'HR-OFE-Cuchara mediana de albañil', 1, 6),
(79, 'HR-OFE-Cuchara grande de albañil', 'Cuchara grande de albañil', 1, NULL, 'AC', 'HR-OFE-Cuchara grande de albañil', 1, 6),
(80, 'HR-OFE-Chocla', 'Chocla', 1, NULL, 'AC', 'HR-OFE-Chocla', 1, 6),
(81, 'HR-OFE-Martelina', 'Martelina', 1, NULL, 'AC', 'HR-OFE-Martelina', 1, 6),
(82, 'HR-OFE-Bomba de combustible', 'Bomba de combustible', 1, NULL, 'AC', 'HR-OFE-Bomba de combustible', 1, 6),
(83, 'HR-OFE-Grasera', 'Grasera', 1, NULL, 'AC', 'HR-OFE-Grasera', 1, 6),
(86, 'A-Hormigonera', 'azul', 1, NULL, 'AC', 'A-Hormigonera', NULL, 6),
(87, 'w80', '989', 1, NULL, 'AC', 'w80', NULL, 6),
(89, 'HVLL-TT-MANIFOLD', '', 1, NULL, 'AC', 'MANOMETRO DE GASES REFRIGERANTE', 2, 6),
(90, 'HVLL-TT', 'SSP', 1, NULL, 'AC', 'Agujereadora de mano eléctrica 13 mm con percutor', 3, 6),
(91, '2334343242', 'ssss', 0, NULL, 'AC', 'Taladro', 1, 6),
(93, '1001', 'IRIMO', -1, NULL, 'AC', 'Caja de tubos 3/4´', 0, 7),
(94, '', '', -1, NULL, 'AC', '', -1, 6),
(95, 'CJ 01 ', 'METALICA ', 19, NULL, 'AC', 'CAJA DE HERRAMIENTAS ', 4, 7),
(96, 'CJ 02 ', 'COMPLETA ', 23, NULL, 'AC', 'CAJA DE HERRAMIENTAS ', 4, 7),
(97, 'CJ 03', 'ENCASTRE 3/4 ', 24, NULL, 'AC', 'CAJA DE TUBOS ', 4, 7),
(98, 'CJ O4 ', 'PLASTICA CHICA ', 33, NULL, 'AC', 'CAJA DE HERRAMIENTAS ', 4, 7),
(99, 'CJ 05 ', 'ALTA Y BAJA ', 32, NULL, 'AC', 'CAJA CON MANOMETROS DE CARGA DE A/C', 4, 7),
(100, 'LLVF 01', '450MM', 35, NULL, 'AC', 'LLAVE FRANCESA', 4, 7),
(101, 'LLST 01', 'PINZA ', 35, NULL, 'AC', ' STILSON ', 4, 7),
(102, 'PNZ 01', 'PINNZA', 30, NULL, 'AC', 'PINZA PICO DE LORO ', 4, 7),
(103, 'LLIN 01', 'REGULABLE', 20, NULL, 'AC', 'LLAVE INGLESA', 4, 7),
(105, 'LLCO 01', 'COMBINADA 36MM', 20, NULL, 'AC', 'LLAVE ', 4, 7),
(106, 'MF 01 ', 'ENCASTRE 1/2 ', 35, NULL, 'AC', 'MANGO DE FUERZA ', 1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_lecturas`
--

CREATE TABLE `historial_lecturas` (
  `id_lectura` int(10) NOT NULL,
  `id_equipo` int(10) NOT NULL,
  `lectura` int(10) NOT NULL,
  `fecha` datetime NOT NULL,
  `usrId` int(11) NOT NULL,
  `observacion` text,
  `operario_nom` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `turno` varchar(11) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historial_lecturas`
--

INSERT INTO `historial_lecturas` (`id_lectura`, `id_equipo`, `lectura`, `fecha`, `usrId`, `observacion`, `operario_nom`, `turno`, `estado`) VALUES
(1, 1, 150, '2017-11-27 04:24:41', 3, 'too ok', 'pepe', 'tarde', 'AC'),
(2, 1, 56, '2017-11-27 04:29:15', 3, 'todo normal', 'ruben', 'noche', 'AC'),
(3, 1, 20, '2017-11-28 10:48:21', 3, 'normal', 'juan', 'mañana', 'AC'),
(7, 1, 4545, '2017-11-30 06:08:35', 3, 'todo ok', 'pedrito', 'manana', 'RE'),
(6, 1, 333, '2017-11-30 08:28:29', 3, 'bateria baja', 'roberto', 'manana', 'AC'),
(8, 1, 999999, '2017-11-30 10:09:43', 3, 'rotura llanta', 'roberto', 'tarde', 'RE'),
(9, 1, 454545, '2017-11-30 11:11:09', 3, 'reparado', 'juan', 'mañana', 'RE'),
(10, 1, 23333, '2017-12-06 08:27:03', 1, 'dadasd', 'dsadad', '333', 'AC'),
(11, 1, 1000, '2017-12-18 07:41:04', 1, 'sdfdsfs', 'fsdf', 'fdsfds', 'RE'),
(12, 0, 333, '2017-12-18 07:41:54', 1, 'dsfdsf', '333', 'erwrw', 'AC'),
(13, 0, 0, '2017-12-18 08:00:03', 1, '', '', '', 'AC'),
(14, 1, 0, '2017-12-26 02:05:21', 1, '', '', '', 'AC'),
(15, 1, 0, '2017-12-26 02:05:31', 1, '', '', '', 'RE'),
(16, 0, 0, '2017-12-26 02:05:39', 1, '', '', '', 'AC'),
(17, 1, 0, '2018-01-12 16:09:58', 1, '', '', '', 'AC'),
(18, 2, 200, '2018-01-15 16:12:57', 3, 'cambio estado test', 'juan perez', 'mañana', 'RE'),
(19, 2, 300, '2018-01-15 16:13:35', 3, 'reparado', 'jose de los palotes', 'tarde', 'RE'),
(20, 2, 400, '2018-01-15 16:14:15', 3, 'activado nuevamente', 'pepe ponce', 'noche', 'AC'),
(21, 5, 0, '2018-01-17 12:01:37', 1, '', '', '', 'RE'),
(22, 9, 344, '2018-01-17 12:07:12', 1, 'weqeqwe', 'wewqe', 'qweqe', 'RE'),
(23, 11, 2000, '2018-01-26 17:14:48', 1, 'no operativo', 'rs', 'mañana', 'AC'),
(24, 11, 2010, '2018-01-26 17:19:56', 1, 'operarico', 'rs', 'mañana', 'AC'),
(60, 7, 0, '2018-09-03 04:55:43', 1, '', '', '', 'AC'),
(59, 7, 0, '2018-09-03 04:46:40', 1, '', '', '', 'RE'),
(58, 7, 0, '2018-09-03 04:31:54', 1, '', '', '', 'RE'),
(57, 2, 666, '2018-09-01 08:57:16', 1, '666', '666', '666', 'AC'),
(56, 8, 555, '2018-09-01 08:54:45', 1, '555', '555', '555', 'AC'),
(33, 10, 0, '2018-03-06 13:10:52', 1, '', '', '', 'RE'),
(34, 10, 0, '2018-03-06 13:11:44', 1, '', '', '', 'AC'),
(35, 10, 0, '2018-03-09 12:57:53', 1, '', '', '', 'RE'),
(36, 9, 122, '2018-03-21 13:23:05', 3, 'se rompio', 'juan', 'mañana', 'RE'),
(37, 10, 34, '2018-03-21 13:24:21', 3, 'agfgadf', 'ya', 'a', 'RE'),
(38, 4, 0, '2018-03-22 11:04:05', 3, '', '', '', 'RE'),
(39, 4, 0, '2018-03-22 11:04:43', 3, '', '', '', 'RE'),
(40, 4, 150, '2018-05-24 12:58:46', 3, 'sarasa', 'Hugo', 'mañana', 'AC'),
(41, 4, 500, '2018-06-19 15:42:25', 3, 'se rompio', 'yop', 'mañana', 'RE'),
(42, 4, 486, '2018-06-19 15:55:46', 3, 'todo ok', 'hugo g', 'tarde', 'AC'),
(43, 4, 0, '2018-07-03 15:38:49', 1, '', '', '', 'RE'),
(44, 3, 0, '2018-07-03 15:39:24', 1, '', '', '', 'RE'),
(45, 2, 0, '2018-07-03 21:15:48', 1, '', '', '', 'RE'),
(46, 3, 0, '2018-07-03 21:16:03', 1, '', '', '', 'RE'),
(47, 4, 0, '2018-07-05 09:47:32', 1, '', '', '', 'AC'),
(48, 1, 0, '2018-07-06 09:34:40', 1, '', '', '', 'RE'),
(49, 1, 23, '2018-07-27 03:05:45', 1, 'saddad', 'sadadsa', 'dsad', 'RE'),
(50, 1, 234, '2018-08-11 05:50:38', 1, 'dsadas', '445', '444', 'RE'),
(51, 1, 0, '2018-08-21 23:46:15', 1, '', '', '', 'RE'),
(52, 1, 0, '2018-09-01 03:29:28', 1, 'asdadas', 'sdaddasds', 'dddd', 'RE'),
(53, 1, 3333, '2018-09-01 03:29:51', 1, 'dsadsa', '33', '333', 'RE'),
(54, 8, 123, '2018-09-01 08:34:17', 1, '123', '123', '123', 'RE'),
(55, 4, 234, '2018-09-01 08:35:56', 1, '234', '234', '234', 'RE'),
(61, 2, 34, '2018-09-13 04:05:12', 1, 'wqeqwe', 'weqe', '34', 'RE'),
(62, 10, 12, '2018-09-16 04:40:29', 1, 'lalala', 'perez', 'noche', ''),
(63, 13, 5000, '2018-09-24 18:22:13', 16, 'rompio la maquina ese hdp', 'javier molina', 'dia', ''),
(64, 3, 2, '2018-09-24 18:55:36', 1, '2', '2', '2', 'RE'),
(65, 3, 3, '2018-09-24 18:56:42', 1, '3', '3', '3', 'AC'),
(66, 3, 12, '2018-09-24 19:03:49', 1, '12', '12', '12', 'RE'),
(67, 3, 32, '2018-09-24 19:06:54', 1, '32', '32', '32', 'RE'),
(68, 3, 12, '2018-09-24 19:10:02', 1, '12', '12', '12', 'AC'),
(69, 3, 23, '2018-09-24 19:10:13', 1, '23', '23', '23', 'RE'),
(70, 3, 0, '2018-09-24 19:10:17', 1, '', '', '', 'RE'),
(71, 3, 0, '2018-09-24 19:14:55', 1, '', '', '', 'AC'),
(72, 3, 0, '2018-09-24 19:15:02', 1, '', '', '', 'RE'),
(73, 13, 0, '2018-09-24 19:15:46', 19, '', '', '', 'RE'),
(74, 3, 0, '2018-09-25 09:43:34', 1, '', '', '', 'AC'),
(75, 3, 0, '2018-09-25 09:45:45', 1, '', '', '', 'AC'),
(76, 3, 0, '2018-09-25 09:45:52', 1, '', '', '', 'AC'),
(77, 3, 0, '2018-09-25 09:46:13', 1, 'nuevaaaaaaa', '', '', 'AC'),
(78, 3, 122, '2018-09-25 09:53:57', 1, '', 'Pablo Paz', '', 'AC'),
(79, 3, 0, '2018-09-25 17:43:04', 1, '', '', '', 'AC'),
(80, 3, 0, '2018-09-25 17:43:13', 17, '', '', '', 'AC'),
(81, 9, 2, '2018-10-01 09:26:48', 1, '2', '2', '2', 'RE'),
(82, 9, 3, '2018-10-01 09:32:32', 1, '3', '3', '3', 'AC'),
(83, 18, 3, '2018-10-03 23:09:32', 1, '3', '3', '3', 'RE'),
(84, 5, 1111111, '2018-10-05 10:46:36', 1, 'wwwwwwwwww', 'Pablo Paz', 'Mañana', 'AC'),
(85, 5, 5670, '2018-10-05 16:12:14', 19, 'Fuga de aceite', 'R. Sánchez', 'Mañana', 'RE'),
(86, 15, 11, '2018-10-08 08:59:36', 18, 'falta agua', 'dede', 'd', 'RE'),
(87, 15, 0, '2018-10-08 09:01:27', 18, 'gg', 'll', 'd', 'AC'),
(88, 5, 11, '2018-10-08 11:44:54', 1, 'nueva lectura', 'Pablo Paz', 'Mañana', 'RE'),
(89, 5, 45, '2018-10-08 11:47:04', 1, 'sdakdhka', 'juan perez', '34', 'RE'),
(90, 5, 12, '2018-10-08 11:48:11', 1, 'nuevo ', 'Pablo Paez', 'Tarde', 'RE'),
(91, 13, 0, '2018-10-09 12:17:37', 18, 'Cambio de válvula de pilotaje, falta conector ', 'admin', 'b', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infocomponentes`
--

CREATE TABLE `infocomponentes` (
  `infocompid` int(11) NOT NULL,
  `infocompdescrip` varchar(255) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_equipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infoequipos`
--

CREATE TABLE `infoequipos` (
  `infoid` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `id_equipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacionequipo`
--

CREATE TABLE `informacionequipo` (
  `id_informacion` int(11) NOT NULL,
  `titulo` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_empresa` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `informacionequipo`
--

INSERT INTO `informacionequipo` (`id_informacion`, `titulo`, `descripcion`, `id_equipo`, `id_empresa`) VALUES
(1081, 'titulo 1', 'descr 1', 51, 6),
(1082, 'titulo 2', 'desc 2', 51, 6),
(1083, 'titulo3', 'desc3', 52, 6),
(1084, '0101', '0101', 12, 6),
(1085, '666', '666', 13, 6),
(1086, 'aaaa', 'aaaa aaaa', 10, 6),
(1087, 'bbbb', 'bbbb bbbb', 10, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcasequipos`
--

CREATE TABLE `marcasequipos` (
  `marcaid` int(11) NOT NULL,
  `marcadescrip` varchar(255) DEFAULT NULL,
  `estado` varchar(3) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marcasequipos`
--

INSERT INTO `marcasequipos` (`marcaid`, `marcadescrip`, `estado`, `id_empresa`) VALUES
(1, 'TamRock', 'AC', 6),
(2, 'Black & Decker', 'AC', 6),
(3, 'Bahco', 'AC', 6),
(4, 'Caterpillar', 'AC', 6),
(5, 'Komatsu', 'AC', 6),
(6, 'Toyota', 'AC', 6),
(7, 'Cathh', 'AN', 7),
(8, 'test', 'AN', 7),
(9, '666', 'AN', 7),
(10, 'DRILLTECH', 'AN', 7),
(11, 'Atlas Copco', 'AC', 7),
(12, 'Atlas Copco', 'AC', 7),
(13, 'Sandvik', 'AC', 7),
(14, 'Soosan', 'AC', 7),
(15, 'Caterpillar', 'AC', 7),
(16, 'Parquer', 'AC', 7),
(17, 'Deninson', 'AC', 7),
(18, 'Rexvrock', 'AC', 7),
(19, 'SNAP ON', 'AC', 7),
(20, 'WILLIAMS ', 'AC', 7),
(21, 'GEDORE ', 'AC', 7),
(22, 'MOTOROLA ', 'AC', 7),
(23, 'REDLINE', 'AC', 7),
(24, 'IRIMO ', 'AC', 7),
(25, 'FLUKE ', 'AC', 7),
(26, 'ANDES SAM ', 'AC', 7),
(27, 'STANLEY ', 'AC', 7),
(28, 'CROSS MASTER ', 'AC', 7),
(29, 'BULIT ', 'AC', 7),
(30, 'TRUPER', 'AC', 7),
(31, 'HP ', 'AC', 7),
(32, 'S-M ', 'AC', 7),
(33, 'TACTIX ', 'AC', 7),
(34, 'UTUSTOOLS', 'AC', 7),
(35, 'BAHCO', 'AC', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_año`
--

CREATE TABLE `modelo_año` (
  `id_año` int(100) NOT NULL,
  `descripcion` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `modelo_año`
--

INSERT INTO `modelo_año` (`id_año`, `descripcion`) VALUES
(1, 'wqeqewqeqw');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_insumos`
--

CREATE TABLE `orden_insumos` (
  `id_orden` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `solicitante` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `destino` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `comprobante` int(255) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_ot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `orden_insumos`
--

INSERT INTO `orden_insumos` (`id_orden`, `fecha`, `solicitante`, `destino`, `comprobante`, `id_empresa`, `id_ot`) VALUES
(1, '2018-10-01', '111', '', 1, 6, 11),
(2, '2018-10-02', '222', '', 2, 6, 22),
(3, '2018-10-03', '333', '', 3, 6, 33),
(4, '2018-10-05', '555', '', 5, 6, 5),
(5, '2018-10-04', '444', '', 4, 6, 144),
(6, '2018-10-06', '666', '', 6, 6, 66),
(7, '2018-10-22', '4444', '', 4, 6, 5),
(8, '2018-10-25', 'huggo', '', 123456, 6, 55);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_pedido`
--

CREATE TABLE `orden_pedido` (
  `id_orden` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `nro_trabajo` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` datetime NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  `fecha_entregada` datetime NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_trabajo` int(11) NOT NULL,
  `observacion` text NOT NULL,
  `numero_remito` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orden_pedido`
--

INSERT INTO `orden_pedido` (`id_orden`, `id_proveedor`, `nro_trabajo`, `descripcion`, `fecha`, `fecha_entrega`, `fecha_entregada`, `estado`, `id_trabajo`, `observacion`, `numero_remito`, `id_empresa`) VALUES
(1, 1, 501, 'pedido prueba', '2017-05-10 00:00:00', '2017-05-11 00:00:00', '2017-11-27 10:09:09', 'E', 1, '', 3344, 6),
(2, 3, 5011, 'prueba', '2017-05-10 00:00:00', '2017-05-10 00:00:00', '0000-00-00 00:00:00', 'P', 16, '', NULL, 6),
(3, 4, 5011, 'ahorasi ', '2017-05-10 00:00:00', '2017-05-10 00:00:00', '0000-00-00 00:00:00', 'P', 16, '', NULL, 6),
(4, 5, 301, 'cargando pedido gemma', '2017-05-10 00:00:00', '2017-05-11 00:00:00', '0000-00-00 00:00:00', 'P', 18, '', NULL, 6),
(5, 9, 602, 'pedido de prueba 3', '2017-05-10 00:00:00', '2017-05-10 00:00:00', '2017-08-14 19:35:47', 'E', 18, '', 123456, 6),
(6, 3, 91, 'ORDEN DE PEDIDO NUMERO 91 ASOCIADA A LA 90', '2017-07-20 00:00:00', '2017-07-21 00:00:00', '0000-00-00 00:00:00', 'P', 16, '', NULL, 6),
(7, 5, 902, 'asociada a la orden numero 902', '2017-07-20 00:00:00', '2017-07-20 00:00:00', '0000-00-00 00:00:00', 'P', 20, '', NULL, 6),
(8, 7, 9020, 'orden de pedido asociada a la orden de trabajo  numero 90 op 9020', '2017-07-20 00:00:00', '2017-07-27 00:00:00', '0000-00-00 00:00:00', 'P', 20, '', NULL, 6),
(9, 7, 950, 'OT numero de pedido 950', '2017-07-20 00:00:00', '2017-07-27 00:00:00', '0000-00-00 00:00:00', 'P', 21, '', NULL, 6),
(10, 8, 9090, 'op 9090', '2017-07-20 00:00:00', '2017-07-27 00:00:00', '0000-00-00 00:00:00', 'P', 20, '', NULL, 6),
(11, 8, 9670, 'OP nro 9697120', '2017-07-20 00:00:00', '2017-07-27 00:00:00', '0000-00-00 00:00:00', 'P', 23, '', NULL, 6),
(12, 9, 96969, 'OP nro 96969', '2017-07-20 00:00:00', '2017-07-27 00:00:00', '0000-00-00 00:00:00', 'P', 22, '', NULL, 6),
(13, 6, 96969, 'OT NRO 96969', '2017-07-20 00:00:00', '2017-07-27 00:00:00', '0000-00-00 00:00:00', 'P', 22, '', NULL, 6),
(14, 4, 14140, 'OP nuevo', '2017-08-11 00:00:00', '2017-08-18 00:00:00', '0000-00-00 00:00:00', 'P', 17, '', NULL, 6),
(15, 12, 78998797, '4 cañños largos', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2017-08-14 19:37:38', 'E', 18, '', 79456, 6),
(16, 13, 987987, '6 caños ciuadrados', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2017-08-14 20:28:31', 'E', 18, '', 16, 6),
(17, 13, 7898798, '4 docenas de bolunes', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'P', 18, '', NULL, 6),
(18, 4, 99, 'aceite\narrancador', '2017-08-15 00:00:00', '2017-08-17 00:00:00', '2017-08-15 11:05:19', 'E', 31, '', 798987, 6),
(19, 4, 14, 'pedido de ppriieba 123456', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'P', 20, '', NULL, 6),
(20, 4, 1514, 'OT DE PEDIDO', '2017-08-16 00:00:00', '2017-08-23 00:00:00', '0000-00-00 00:00:00', 'P', 19, '', NULL, 6),
(21, 4, 16, 'dadadada pedidonuevo ', '0000-00-00 00:00:00', '2017-09-01 00:00:00', '2017-09-01 14:19:26', 'E', 34, '', 1666, 6),
(22, 4, 45646, 'comprar mas memoria', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2017-09-19 10:31:06', 'E', 38, '', 123, 6),
(23, 2, 23, 'sadadsad', '0000-00-00 00:00:00', '2017-11-04 00:00:00', '2017-12-11 11:18:59', 'E', 8, '', 22323, 6),
(24, 1, 1414, '141414', '0000-00-00 00:00:00', '2017-12-01 00:00:00', '0000-00-00 00:00:00', 'P', 23, '', NULL, 6),
(25, 1, 22222, 'aSAsaSAsaS', '2017-12-11 11:13:18', '2017-12-11 00:00:00', '0000-00-00 00:00:00', 'P', 16, '', NULL, 6),
(26, 2, 55, 'p', '2017-12-12 18:46:56', '2017-12-14 00:00:00', '0000-00-00 00:00:00', 'P', 17, '', NULL, 6),
(27, 1, 5454, 'detallle', '2018-06-22 11:04:24', '2018-06-22 00:00:00', '0000-00-00 00:00:00', 'P', 532, '', NULL, 6),
(28, 1, 0, 'pedido test 1', '2018-06-25 12:40:44', '2018-07-02 00:00:00', '0000-00-00 00:00:00', 'P', 536, '', NULL, 6),
(29, 2, 0, 'pedido test 2 ', '2018-06-25 13:48:11', '2018-07-03 00:00:00', '0000-00-00 00:00:00', 'P', 536, '', NULL, 6),
(30, 2, 11111, 'orden de  pedido de prueba administracion', '2018-06-28 16:01:19', '2018-06-29 00:00:00', '0000-00-00 00:00:00', 'P', 538, '', NULL, 6),
(31, 2, 1111, 'pedido test asociado a ot con id 538', '2018-06-29 11:11:06', '2018-07-06 00:00:00', '0000-00-00 00:00:00', 'P', 538, '', NULL, 0),
(32, 0, 48956, 'Nueva nota de pedido', '2018-09-19 10:15:18', '2018-09-26 00:00:00', '0000-00-00 00:00:00', 'P', 510, '', NULL, 0),
(33, 1, 11223344, 'eli probando', '2018-10-05 12:14:01', '2018-10-25 00:00:00', '0000-00-00 00:00:00', 'P', 510, '', NULL, 0),
(34, 2, 112233, 'eliiiiii', '2018-10-05 12:14:34', '2018-10-23 00:00:00', '0000-00-00 00:00:00', 'P', 510, '', NULL, 0),
(35, 2, 123, 'eli 2', '2018-10-05 12:16:12', '2018-10-19 00:00:00', '0000-00-00 00:00:00', 'P', 510, '', NULL, 0),
(36, 1, 1357, 'eli 99', '2018-10-05 12:17:02', '2018-11-22 00:00:00', '0000-00-00 00:00:00', 'P', 510, '', NULL, 0),
(37, 1, 222222, 'no guarda', '2018-10-05 12:17:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'P', 510, '', NULL, 0),
(38, 1, 9900, 'no anda', '2018-10-05 12:18:12', '2018-10-17 00:00:00', '0000-00-00 00:00:00', 'P', 510, '', NULL, 0),
(39, -1, 0, '', '2018-10-05 12:23:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'P', 510, '', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_servicio`
--

CREATE TABLE `orden_servicio` (
  `id_orden` int(11) NOT NULL,
  `lectura` double DEFAULT NULL,
  `fecha` date NOT NULL,
  `comprobante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_contratista` int(11) NOT NULL,
  `id_solicitudreparacion` int(11) NOT NULL,
  `valesid` int(11) DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_ordenherraminetas` int(11) DEFAULT NULL,
  `id_orden_insumo` int(11) DEFAULT NULL,
  `id_ot` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `fechahorainicio` datetime NOT NULL,
  `fechahorafin` datetime NOT NULL,
  `horometroinicio` double NOT NULL,
  `horometrofin` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `orden_servicio`
--

INSERT INTO `orden_servicio` (`id_orden`, `lectura`, `fecha`, `comprobante`, `id_equipo`, `id_contratista`, `id_solicitudreparacion`, `valesid`, `estado`, `id_ordenherraminetas`, `id_orden_insumo`, `id_ot`, `id_empresa`, `fechahorainicio`, `fechahorafin`, `horometroinicio`, `horometrofin`) VALUES
(1, NULL, '2018-10-23', '', 4, 0, 12, 27, 'T', NULL, NULL, 160, 6, '2018-10-02 19:37:04', '2018-10-06 19:37:08', 221, 218),
(2, NULL, '2018-11-12', '', 19, 0, 0, 1, 'C', NULL, NULL, 616, 6, '2018-11-13 15:45:07', '2018-11-14 15:45:15', 100, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_trabajo`
--

CREATE TABLE `orden_trabajo` (
  `id_orden` int(11) NOT NULL,
  `id_tarea` int(11) DEFAULT NULL,
  `nro` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `fecha_program` datetime NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  `fecha_terminada` datetime NOT NULL,
  `fecha_aviso` datetime NOT NULL,
  `fecha_entregada` datetime NOT NULL,
  `descripcion` text NOT NULL,
  `cliId` int(11) NOT NULL DEFAULT '1',
  `estado` varchar(2) NOT NULL,
  `id_usuario` int(11) NOT NULL DEFAULT '1',
  `id_usuario_a` int(11) NOT NULL,
  `id_usuario_e` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL DEFAULT '1',
  `id_proveedor` int(11) NOT NULL,
  `id_solicitud` int(11) NOT NULL,
  `tipo` varchar(2) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `duracion` double NOT NULL,
  `id_tareapadre` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `lectura_programada` double NOT NULL,
  `lectura_ejecutada` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orden_trabajo`
--

INSERT INTO `orden_trabajo` (`id_orden`, `id_tarea`, `nro`, `fecha`, `fecha_program`, `fecha_inicio`, `fecha_entrega`, `fecha_terminada`, `fecha_aviso`, `fecha_entregada`, `descripcion`, `cliId`, `estado`, `id_usuario`, `id_usuario_a`, `id_usuario_e`, `id_sucursal`, `id_proveedor`, `id_solicitud`, `tipo`, `id_equipo`, `duracion`, `id_tareapadre`, `id_empresa`, `lectura_programada`, `lectura_ejecutada`) VALUES
(1, 0, '1', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 10:44:25', '2017-11-08 10:47:45', '2017-11-08 10:47:45', '2017-11-08 10:47:45', '2017-11-08 10:47:45', 'rotura de rueda', 13, 'C', 1, 1, 1, 1, 0, 1, '1', 0, 60, NULL, 6, 0, 0),
(2, 0, '4', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 00:00:00', '2017-11-29 00:00:00', '2017-11-23 08:39:37', '2017-11-08 10:48:19', '2017-12-10 00:00:00', 'sadasdas', 13, 'E', 1, 1, 1, 1, 0, 4, '1', 0, 60, NULL, 6, 0, 0),
(3, 0, '4', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 10:47:21', '2017-11-08 10:58:41', '2017-11-08 10:58:41', '2017-11-08 10:58:41', '2017-11-08 10:58:41', 'sadasdas', 1, 'C', 1, 1, 1, 1, 0, 4, '2', 0, 60, NULL, 6, 0, 0),
(4, 4, '4', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 10:47:21', '2017-11-08 12:52:35', '2017-11-08 12:52:35', '2017-11-08 12:52:35', '2017-11-08 12:52:35', 'sadasdas', 1, 'C', 1, 1, 1, 1, 0, 4, '2', 0, 60, NULL, 6, 0, 0),
(5, 0, '1', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 10:44:25', '2017-11-09 16:09:14', '2017-11-09 16:09:14', '2017-11-09 16:09:14', '2017-11-09 16:09:14', 'rotura de rueda', 13, 'C', 1, 1, 1, 1, 0, 1, '3', 0, 60, NULL, 6, 0, 0),
(6, 0, '5', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 12:53:19', '2017-12-09 16:09:34', '2017-11-09 16:09:34', '2017-11-09 16:09:34', '2017-11-09 16:09:34', 'observc test2', 1, 'C', 1, 1, 1, 1, 1, 5, '3', 0, 60, NULL, 6, 0, 0),
(7, 0, '5', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 12:53:19', '2017-12-07 10:38:07', '2017-11-13 10:38:07', '2017-11-13 10:38:07', '2017-11-13 10:38:07', 'observc test2', 1, 'C', 1, 1, 1, 1, 1, 5, '3', 0, 60, NULL, 6, 0, 0),
(8, 0, '1', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 00:00:00', '0000-00-00 00:00:00', '2017-11-14 14:39:59', '2017-11-14 14:39:59', '2017-11-14 14:39:59', 'rotura de rueda', 13, 'P', 1, 1, 1, 1, 1, 1, '2', 0, 60, NULL, 6, 0, 0),
(9, 0, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-11-14 15:23:31', '2017-11-14 15:38:02', '2017-11-14 15:38:02', '2017-11-14 15:38:02', '2017-11-14 15:38:02', 'Rotura de llanta', 13, 'C', 5, 5, 5, 1, 0, 6, '3', 0, 60, NULL, 6, 0, 0),
(10, 0, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-11-14 15:23:31', '2017-11-14 15:42:27', '2017-11-14 15:42:27', '2017-11-14 15:42:27', '2017-11-14 15:42:27', 'Rotura de llanta', 13, 'C', 5, 5, 5, 1, 0, 6, '1', 0, 60, NULL, 6, 0, 0),
(11, 0, '1', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 10:44:25', '2017-11-23 08:26:01', '2017-11-23 08:26:01', '2017-11-23 08:26:01', '2017-11-23 08:26:01', 'rotura de rueda', 1, 'C', 1, 1, 1, 1, 0, 1, '3', 0, 60, NULL, 6, 0, 0),
(12, 0, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-11-14 15:23:31', '2017-11-17 08:25:52', '2017-11-28 08:25:52', '2017-11-28 08:25:52', '2017-11-28 08:25:52', 'Rotura de llanta', 1, 'C', 3, 3, 3, 1, 0, 6, '', 0, 60, NULL, 6, 0, 0),
(13, 0, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-11-14 15:23:31', '2017-12-22 08:26:22', '2017-11-28 08:26:22', '2017-11-28 08:26:22', '2017-11-28 08:26:22', 'Rotura de llanta', 1, 'C', 3, 3, 3, 1, 0, 6, '', 0, 60, NULL, 6, 0, 0),
(14, 0, '5', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 12:53:19', '2017-12-12 10:58:50', '2017-11-28 10:58:50', '2017-11-28 10:58:50', '2017-11-28 10:58:50', 'observc test2', 13, 'C', 3, 3, 3, 1, 0, 5, '1', 0, 60, NULL, 6, 0, 0),
(15, NULL, '1', '0000-00-00', '0000-00-00 00:00:00', '2017-12-07 10:44:25', '2017-12-06 12:04:24', '2017-11-28 12:04:24', '2017-11-28 12:04:24', '2017-11-28 12:04:24', 'rotura de rueda', 1, 'C', 3, 3, 3, 1, 0, 1, '2', 0, 60, NULL, 6, 0, 0),
(16, 1, '3', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2018-07-30 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'T', 3, 1, 0, 1, 0, 0, '5', 1, 60, NULL, 6, 0, 0),
(17, 1, '3', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2018-09-07 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 3, 3, 0, 1, 0, 0, '5', 1, 60, NULL, 6, 0, 0),
(18, 1, '1', '0000-00-00', '0000-00-00 00:00:00', '2017-12-14 10:44:25', '0000-00-00 00:00:00', '2017-11-28 13:16:25', '2017-11-28 13:16:25', '2017-11-28 13:16:25', 'rotura de rueda', 1, 'As', 3, 0, 3, 1, 2, 1, '2', 2, 60, NULL, 6, 0, 0),
(19, 1, '4', '0000-00-00', '0000-00-00 00:00:00', '2017-12-30 00:00:00', '2017-12-09 00:00:00', '2017-12-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Backlog', 1, 'T', 3, 1, 0, 1, 0, 0, '4', 1, 60, NULL, 6, 0, 0),
(20, 1, '4', '0000-00-00', '0000-00-00 00:00:00', '0002-01-08 20:00:00', '2017-12-20 00:00:00', '2017-12-18 00:00:00', '0000-00-00 00:00:00', '2017-12-27 00:00:00', 'Predictivo', 1, 'E', 3, 1, 0, 1, 0, 0, '5', 1, 60, NULL, 6, 0, 0),
(21, 1, '4', '0000-00-00', '0000-00-00 00:00:00', '2017-12-21 00:00:00', '2017-12-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 3, 4, 0, 1, 0, 0, '5', 1, 60, NULL, 6, 0, 0),
(22, NULL, '7', '0000-00-00', '0000-00-00 00:00:00', '2017-12-01 05:35:25', '2017-12-13 00:00:00', '2017-12-01 05:35:44', '2017-12-01 05:35:44', '2017-12-01 05:35:44', 'Falla test sobre RS-0001 (01-12)', 1, 'As', 3, 6, 3, 1, 0, 7, '2', 2, 60, NULL, 6, 0, 0),
(23, 1, '3', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 1, 1, 0, 1, 0, 0, '5', 1, 60, NULL, 6, 0, 0),
(25, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2017-02-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Preventivo', 1, 'C', 1, 0, 0, 1, 0, 0, '2', 1, 60, NULL, 6, 0, 0),
(26, 1, '', '0000-00-00', '0000-00-00 00:00:00', '2017-02-01 00:00:00', '2017-12-29 00:00:00', '2017-12-27 00:00:00', '0000-00-00 00:00:00', '2018-06-27 00:00:00', 'Preventivo', 1, 'E', 1, 1, 1, 1, 0, 1, '2', 1, 60, NULL, 6, 0, 0),
(27, 1, '', '0000-00-00', '0000-00-00 00:00:00', '2017-02-01 00:00:00', '2017-12-28 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Preventivo', 1, 'As', 1, 6, 1, 1, 0, 0, '2', 1, 60, NULL, 6, 0, 0),
(28, 1, '', '0000-00-00', '0000-00-00 00:00:00', '2017-02-01 00:00:00', '2017-12-11 00:00:00', '2017-12-18 00:00:00', '0000-00-00 00:00:00', '2018-09-20 00:00:00', 'Preventivo', 1, 'E', 1, 1, 1, 1, 0, 0, '2', 3, 60, NULL, 6, 0, 0),
(29, 1, '8', '0000-00-00', '0000-00-00 00:00:00', '2017-12-07 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Backlog', 1, 'As', 1, 0, 0, 1, 0, 0, '4', 3, 60, NULL, 6, 0, 0),
(30, 1, '', '0000-00-00', '0000-00-00 00:00:00', '2017-02-01 00:00:00', '0000-00-00 00:00:00', '2017-12-12 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Preventivo', 1, 'As', 1, 1, 1, 1, 0, 0, '2', 3, 60, NULL, 6, 0, 0),
(31, 1, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-12-11 00:00:00', '2017-12-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 1, 1, 0, 1, 0, 0, '5', 2, 60, NULL, 6, 0, 0),
(32, 1, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-12-11 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 1, 1, 1, 1, 0, 0, '5', 2, 60, NULL, 6, 0, 0),
(33, 1, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-12-11 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 1, 1, 1, 1, 0, 0, '5', 2, 60, NULL, 6, 0, 0),
(34, 1, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-12-11 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 1, 1, 1, 1, 0, 0, '5', 2, 60, NULL, 6, 0, 0),
(35, 2, '9', '0000-00-00', '0000-00-00 00:00:00', '2017-12-12 00:00:00', '2017-12-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Backlog', 1, 'As', 1, 1, 1, 1, 0, 0, '4', 2, 60, NULL, 6, 0, 0),
(36, NULL, '100', '0000-00-00', '0000-00-00 00:00:00', '2017-12-12 21:22:00', '2017-12-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'prueba', 1, 'As', 3, 1, 1, 1, 2, 0, '1', 2, 60, NULL, 6, 0, 0),
(37, 2, '9', '0000-00-00', '0000-00-00 00:00:00', '2017-12-12 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Backlog', 1, 'As', 1, 1, 1, 1, 0, 0, '4', 2, 60, NULL, 6, 0, 0),
(38, 1, '10', '0000-00-00', '0000-00-00 00:00:00', '2018-01-10 00:00:00', '0000-00-00 00:00:00', '2018-01-12 00:00:00', '0000-00-00 00:00:00', '2018-01-12 00:00:00', 'Backlog', 1, 'E', 1, 1, 1, 1, 0, 0, '4', 1, 60, NULL, 6, 0, 0),
(39, 1, '11', '0000-00-00', '0000-00-00 00:00:00', '2018-01-20 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Backlog', 1, 'As', 1, 0, 0, 1, 0, 0, '4', 2, 60, NULL, 6, 0, 0),
(40, 1, '2', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 10:45:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'assdas', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(41, 1, '9', '0000-00-00', '0000-00-00 00:00:00', '2018-01-17 13:38:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'mancha de aceite abajo del equipo ', 1, 'C', 1, 1, 1, 1, 0, 0, '', 10, 60, NULL, 6, 0, 0),
(42, NULL, '11', '0000-00-00', '0000-00-00 00:00:00', '2018-01-18 18:07:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'mancha de aceite debajo del equipo', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(43, NULL, '11', '0000-00-00', '0000-00-00 00:00:00', '2018-01-18 18:07:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'mancha de aceite debajo del equipo', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(46, 1, '1', '2018-01-29', '2018-01-31 00:00:00', '2017-11-14 15:23:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rotura de llanta', 1, 'C', 3, 1, 1, 1, 0, 6, '2', 2, 60, NULL, 6, 0, 0),
(47, 16, '1', '2018-01-29', '2018-01-30 00:00:00', '2018-02-10 00:00:00', '2018-03-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 3, 5, 1, 1, 0, 8, '5', 4, 60, NULL, 6, 0, 0),
(48, 1, '1', '2018-01-29', '2018-01-29 00:00:00', '2017-12-01 05:35:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Falla test sobre RS-0001 (01-12)', 1, 'C', 3, 1, 1, 1, 0, 7, '2', 2, 60, NULL, 6, 0, 0),
(49, 16, '1', '2018-01-29', '2018-01-29 00:00:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 1, 1, 1, 1, 0, 8, '5', 4, 60, NULL, 6, 0, 0),
(50, NULL, '11', '0000-00-00', '0000-00-00 00:00:00', '2018-01-18 18:07:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'mancha de aceite debajo del equipo', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(51, NULL, '11', '0000-00-00', '0000-00-00 00:00:00', '2018-01-18 18:07:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'mancha de aceite debajo del equipo', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(52, NULL, '11', '0000-00-00', '0000-00-00 00:00:00', '2018-01-18 18:07:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'mancha de aceite debajo del equipo', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(53, NULL, '12', '0000-00-00', '0000-00-00 00:00:00', '2018-01-30 14:06:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No tiene fuerza para levantar la carga', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(54, NULL, '12', '0000-00-00', '0000-00-00 00:00:00', '2018-01-30 14:06:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No tiene fuerza para levantar la carga', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(55, NULL, '12', '0000-00-00', '0000-00-00 00:00:00', '2018-01-30 14:06:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No tiene fuerza para levantar la carga', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(56, NULL, '7', '0000-00-00', '0000-00-00 00:00:00', '2017-12-01 05:35:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Falla test sobre RS-0001 (01-12)', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(57, 1, '1', '2018-02-08', '2018-02-08 00:00:00', '2017-11-08 10:44:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'rotura de rueda', 1, 'AN', 1, 1, 1, 1, 0, 1, '2', 1, 60, NULL, 6, 0, 0),
(58, NULL, '13', '0000-00-00', '0000-00-00 00:00:00', '2018-02-05 19:01:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'bateria descargada\n\n', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(59, NULL, '15', '0000-00-00', '0000-00-00 00:00:00', '2018-02-05 19:46:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ggggjffufjffg', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(60, 8, '1', '2018-02-08', '2018-01-08 15:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CAMBIE EL ACEITE DE MOTOR. ACEITE 15W40', 1, 'C', 1, 1, 1, 1, 0, 16, '3', 4, 60, NULL, 6, 0, 0),
(61, 4, '1', '2018-02-08', '2018-01-12 15:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, NULL, 6, 0, 0),
(62, 4, '1', '2018-02-17', '2018-02-17 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(63, 4, '1', '2018-02-17', '2018-03-04 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(64, 4, '1', '2018-02-17', '2018-03-19 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(65, 4, '1', '2018-02-17', '2018-04-03 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(66, 4, '1', '2018-02-17', '2018-04-18 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(67, 4, '1', '2018-02-17', '2018-05-03 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(68, 4, '1', '2018-02-17', '2018-05-18 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(69, 4, '1', '2018-02-17', '2018-06-02 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 8, '3', 6, 60, 11, 6, 0, 0),
(70, 4, '1', '2018-02-17', '2018-06-17 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 9, '3', 6, 60, 11, 6, 0, 0),
(71, 4, '1', '2018-02-17', '2018-07-02 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(72, 16, '1', '2018-02-17', '2018-02-17 20:00:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(73, 16, '1', '2018-02-17', '2018-02-19 15:20:00', '2018-02-10 00:00:00', '2018-03-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(74, 4, '1', '2018-02-18', '2018-02-18 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(75, 4, '1', '2018-02-18', '2018-03-05 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(76, 4, '1', '2018-02-18', '2018-03-20 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(77, 4, '1', '2018-02-18', '2018-04-04 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(78, 4, '1', '2018-02-18', '2018-04-19 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(79, 4, '1', '2018-02-18', '2018-05-04 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(80, 4, '1', '2018-02-18', '2018-05-19 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(81, 4, '1', '2018-02-18', '2018-06-03 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(82, 4, '1', '2018-02-18', '2018-06-18 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(83, 4, '1', '2018-02-18', '2018-07-03 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(84, 4, '1', '2018-02-18', '2018-07-18 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(85, 4, '1', '2018-02-18', '2018-08-02 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(86, 4, '1', '2018-02-18', '2018-08-17 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(87, 4, '1', '2018-02-18', '2018-09-01 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(88, 4, '1', '2018-02-18', '2018-09-16 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(89, 4, '1', '2018-02-18', '2018-10-01 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(90, 4, '1', '2018-02-18', '2018-10-16 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(91, 4, '1', '2018-02-18', '2018-10-31 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(92, 4, '1', '2018-02-18', '2018-11-15 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(93, 4, '1', '2018-02-18', '2018-11-30 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(94, 4, '1', '2018-02-18', '2018-12-15 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(95, 4, '1', '2018-02-18', '2018-12-30 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(96, 4, '1', '2018-02-18', '2019-01-14 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(97, 4, '1', '2018-02-18', '2019-01-29 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(98, 4, '1', '2018-02-18', '2019-02-13 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(99, 4, '1', '2018-02-18', '2019-02-28 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(100, 4, '1', '2018-02-18', '2019-03-15 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(101, 4, '1', '2018-02-18', '2019-03-30 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(102, 4, '1', '2018-02-18', '2019-04-14 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(103, 4, '1', '2018-02-18', '2019-04-29 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(104, 4, '1', '2018-02-18', '2019-05-14 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(105, 4, '1', '2018-02-18', '2019-05-29 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(106, 4, '1', '2018-02-18', '2019-06-13 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(107, 4, '1', '2018-02-18', '2019-06-28 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(108, 4, '1', '2018-02-18', '2019-07-13 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(109, 4, '1', '2018-02-18', '2019-07-28 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(110, 4, '1', '2018-02-18', '2019-08-12 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(111, 4, '1', '2018-02-18', '2019-08-27 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(112, 4, '1', '2018-02-18', '2019-09-11 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(113, 4, '1', '2018-02-18', '2019-09-26 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(114, 4, '1', '2018-02-18', '2019-10-11 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(115, 4, '1', '2018-02-18', '2019-10-26 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(116, 4, '1', '2018-02-18', '2019-11-10 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(117, 4, '1', '2018-02-18', '2019-11-25 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(118, 4, '1', '2018-02-18', '2019-12-10 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(119, 4, '1', '2018-02-18', '2019-12-25 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(120, 4, '1', '2018-02-18', '2020-01-09 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(121, 4, '1', '2018-02-18', '2020-01-24 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(122, 4, '1', '2018-02-18', '2020-02-08 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(123, 4, '1', '2018-02-18', '2020-02-23 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(124, 4, '1', '2018-02-18', '2020-03-09 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(125, 4, '1', '2018-02-18', '2020-03-24 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(126, 4, '1', '2018-02-18', '2020-04-08 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(127, 4, '1', '2018-02-18', '2020-04-23 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(128, 4, '1', '2018-02-18', '2020-05-08 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(129, 4, '1', '2018-02-18', '2020-05-23 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(130, 4, '1', '2018-02-18', '2020-06-07 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(131, 4, '1', '2018-02-18', '2020-06-22 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(132, 4, '1', '2018-02-18', '2020-07-07 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(133, 4, '1', '2018-02-18', '2020-07-22 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(134, 4, '1', '2018-02-18', '2020-08-06 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(135, 4, '1', '2018-02-18', '2020-08-21 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(136, 4, '1', '2018-02-18', '2020-09-05 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(137, 4, '1', '2018-02-18', '2020-09-20 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(138, 4, '1', '2018-02-18', '2020-10-05 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(139, 4, '1', '2018-02-18', '2020-10-20 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(140, 4, '1', '2018-02-18', '2020-11-04 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(141, 4, '1', '2018-02-18', '2020-11-19 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(142, 4, '1', '2018-02-18', '2020-12-04 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(143, 4, '1', '2018-02-18', '2020-12-19 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(144, 5, '1', '2018-02-18', '2018-02-18 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(145, 5, '1', '2018-02-18', '2018-03-20 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(146, 5, '1', '2018-02-18', '2018-04-19 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(147, 5, '1', '2018-02-18', '2018-05-19 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(148, 5, '1', '2018-02-18', '2018-06-18 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(149, 5, '1', '2018-02-18', '2018-07-18 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(150, 5, '1', '2018-02-18', '2018-08-17 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(151, 5, '1', '2018-02-18', '2018-09-16 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(152, 5, '1', '2018-02-18', '2018-10-16 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(153, 5, '1', '2018-02-18', '2018-11-15 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(154, 5, '1', '2018-02-18', '2018-12-15 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(155, 5, '1', '2018-02-18', '2019-01-14 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(156, 5, '1', '2018-02-18', '2019-02-13 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(157, 5, '1', '2018-02-18', '2019-03-15 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(158, 5, '1', '2018-02-19', '2018-02-19 03:30:00', '2018-01-18 00:00:00', '2018-09-07 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'As', 1, 5, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(159, 5, '1', '2018-02-19', '2018-02-26 03:30:00', '2018-01-18 00:00:00', '2018-09-07 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'As', 1, 12, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(160, 5, '1', '2018-02-19', '2018-03-05 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 9, '3', 4, 60, 12, 6, 0, 0),
(161, 5, '1', '2018-02-19', '2018-03-12 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 8, '3', 4, 60, 12, 6, 0, 0),
(162, 5, '1', '2018-02-19', '2018-03-19 03:30:00', '2018-01-18 00:00:00', '2018-09-07 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'As', 1, 15, 1, 1, 0, 11, '3', 4, 60, 12, 6, 0, 0),
(163, 5, '1', '2018-02-19', '2018-03-26 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(164, 5, '1', '2018-02-19', '2018-04-02 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(165, 5, '1', '2018-02-19', '2018-04-09 03:30:00', '2018-01-18 00:00:00', '2018-09-07 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'As', 1, 4, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(166, 5, '1', '2018-02-19', '2018-04-16 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(167, 5, '1', '2018-02-19', '2018-04-23 03:30:00', '2018-01-18 00:00:00', '2018-08-30 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'As', 1, 2, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(168, 5, '1', '2018-02-19', '2018-04-30 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(169, 5, '1', '2018-02-19', '2018-05-07 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(170, 5, '1', '2018-02-19', '2018-05-14 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(171, 5, '1', '2018-02-19', '2018-05-21 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(172, 5, '1', '2018-02-19', '2018-05-28 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(173, 5, '1', '2018-02-19', '2018-06-04 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(174, 5, '1', '2018-02-19', '2018-06-11 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(175, 5, '1', '2018-02-19', '2018-06-18 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(176, 5, '1', '2018-02-19', '2018-06-25 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(177, 5, '1', '2018-02-19', '2018-07-02 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 120, 12, 6, 0, 0),
(178, 5, '1', '2018-02-19', '2018-07-09 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(179, 5, '1', '2018-02-19', '2018-07-16 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(180, 5, '1', '2018-02-19', '2018-07-23 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(181, 5, '1', '2018-02-19', '2018-07-30 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(182, 5, '1', '2018-02-19', '2018-08-06 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(183, 5, '1', '2018-02-19', '2018-08-13 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(184, 5, '1', '2018-02-19', '2018-08-20 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(185, 5, '1', '2018-02-19', '2018-08-29 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(186, 5, '1', '2018-02-19', '2018-09-03 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(187, 5, '1', '2018-02-19', '2018-09-04 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(188, 5, '1', '2018-02-19', '2018-09-17 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(189, 5, '1', '2018-02-19', '2018-09-24 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(190, 5, '1', '2018-02-19', '2018-10-01 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(191, 5, '1', '2018-02-19', '2018-10-08 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(192, 5, '1', '2018-02-19', '2018-10-15 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(193, 5, '1', '2018-02-19', '2018-10-22 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(194, 5, '1', '2018-02-19', '2018-10-29 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(195, 5, '1', '2018-02-19', '2018-11-05 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(196, 5, '1', '2018-02-19', '2018-11-12 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(197, 5, '1', '2018-02-19', '2018-11-19 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0);
INSERT INTO `orden_trabajo` (`id_orden`, `id_tarea`, `nro`, `fecha`, `fecha_program`, `fecha_inicio`, `fecha_entrega`, `fecha_terminada`, `fecha_aviso`, `fecha_entregada`, `descripcion`, `cliId`, `estado`, `id_usuario`, `id_usuario_a`, `id_usuario_e`, `id_sucursal`, `id_proveedor`, `id_solicitud`, `tipo`, `id_equipo`, `duracion`, `id_tareapadre`, `id_empresa`, `lectura_programada`, `lectura_ejecutada`) VALUES
(198, 5, '1', '2018-02-19', '2018-11-26 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(199, 5, '1', '2018-02-19', '2018-12-07 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(200, 5, '1', '2018-02-19', '2018-12-10 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(201, 5, '1', '2018-02-19', '2018-12-17 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(202, 5, '1', '2018-02-19', '2018-12-24 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(203, 5, '1', '2018-02-19', '2018-12-31 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(204, 5, '1', '2018-02-19', '2019-01-07 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(205, 5, '1', '2018-02-19', '2019-01-14 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(206, 5, '1', '2018-02-19', '2019-01-21 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(207, 5, '1', '2018-02-19', '2019-01-28 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(208, 5, '1', '2018-02-19', '2019-02-04 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(209, 5, '1', '2018-02-19', '2019-02-11 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(210, 5, '1', '2018-02-19', '2019-02-18 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(211, 5, '1', '2018-02-19', '2019-02-25 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(212, 5, '1', '2018-02-19', '2019-03-04 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(213, 5, '1', '2018-02-19', '2019-03-11 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(214, 5, '1', '2018-02-19', '2019-03-18 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(215, 5, '1', '2018-02-19', '2019-03-25 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(216, 5, '1', '2018-02-19', '2019-04-01 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(217, 5, '1', '2018-02-19', '2019-04-08 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(218, 5, '1', '2018-02-19', '2019-04-15 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(219, 5, '1', '2018-02-19', '2019-04-22 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(220, 5, '1', '2018-02-19', '2019-04-29 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(221, 5, '1', '2018-02-19', '2019-05-06 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(222, 5, '1', '2018-02-19', '2019-05-13 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(223, 5, '1', '2018-02-19', '2019-05-20 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(224, 5, '1', '2018-02-19', '2019-05-27 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(225, 5, '1', '2018-02-19', '2019-06-03 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(226, 5, '1', '2018-02-19', '2019-06-10 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(227, 5, '1', '2018-02-19', '2019-06-17 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(228, 5, '1', '2018-02-19', '2019-06-24 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(229, 5, '1', '2018-02-19', '2019-07-01 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(230, 5, '1', '2018-02-19', '2019-07-08 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(231, 5, '1', '2018-02-19', '2019-07-15 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(232, 5, '1', '2018-02-19', '2019-07-22 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(233, 5, '1', '2018-02-19', '2019-07-29 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(234, 5, '1', '2018-02-19', '2019-08-05 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(235, 5, '1', '2018-02-19', '2019-08-12 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(236, 5, '1', '2018-02-19', '2019-08-19 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(237, 5, '1', '2018-02-19', '2019-08-26 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(238, 5, '1', '2018-02-19', '2019-09-02 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(239, 5, '1', '2018-02-19', '2019-09-09 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(240, 5, '1', '2018-02-19', '2019-09-16 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(241, 5, '1', '2018-02-19', '2019-09-23 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(242, 5, '1', '2018-02-19', '2019-09-30 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(243, 5, '1', '2018-02-19', '2019-10-07 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(244, 5, '1', '2018-02-19', '2019-10-14 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(245, 5, '1', '2018-02-19', '2019-10-21 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(246, 5, '1', '2018-02-19', '2019-10-28 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(247, 5, '1', '2018-02-19', '2019-11-04 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(248, 5, '1', '2018-02-19', '2019-11-11 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(249, 5, '1', '2018-02-19', '2019-11-18 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(250, 5, '1', '2018-02-19', '2019-11-25 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(251, 5, '1', '2018-02-19', '2019-12-02 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(252, 5, '1', '2018-02-19', '2019-12-09 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(253, 5, '1', '2018-02-19', '2019-12-16 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(254, 5, '1', '2018-02-19', '2019-12-23 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(255, 5, '1', '2018-02-19', '2019-12-30 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(256, 5, '1', '2018-02-19', '2020-01-06 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(257, 5, '1', '2018-02-19', '2020-01-13 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(258, 5, '1', '2018-02-19', '2020-01-20 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(259, 5, '1', '2018-02-19', '2020-01-27 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(260, 5, '1', '2018-02-19', '2020-02-03 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(261, 5, '1', '2018-02-19', '2020-02-10 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(262, 5, '1', '2018-02-19', '2020-02-17 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(263, 5, '1', '2018-02-19', '2020-02-24 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(264, 5, '1', '2018-02-19', '2020-03-02 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(265, 5, '1', '2018-02-19', '2020-03-09 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(266, 5, '1', '2018-02-19', '2020-03-16 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(267, 5, '1', '2018-02-19', '2020-03-23 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(268, 5, '1', '2018-02-19', '2020-03-30 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(269, 5, '1', '2018-02-19', '2020-04-06 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(270, 5, '1', '2018-02-19', '2020-04-13 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(271, 5, '1', '2018-02-19', '2020-04-20 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(272, 5, '1', '2018-02-19', '2020-04-27 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(273, 5, '1', '2018-02-19', '2020-05-04 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(274, 5, '1', '2018-02-19', '2020-05-11 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(275, 5, '1', '2018-02-19', '2020-05-18 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(276, 5, '1', '2018-02-19', '2020-05-25 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(277, 5, '1', '2018-02-19', '2020-06-01 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(278, 5, '1', '2018-02-19', '2020-06-08 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(279, 5, '1', '2018-02-19', '2020-06-15 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(280, 5, '1', '2018-02-19', '2020-06-22 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(281, 5, '1', '2018-02-19', '2020-06-29 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(282, 5, '1', '2018-02-19', '2020-07-06 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(283, 5, '1', '2018-02-19', '2020-07-13 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(284, 5, '1', '2018-02-19', '2020-07-20 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(285, 5, '1', '2018-02-19', '2020-07-27 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(286, 5, '1', '2018-02-19', '2020-08-03 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(287, 5, '1', '2018-02-19', '2020-08-10 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(288, 5, '1', '2018-02-19', '2020-08-17 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(289, 5, '1', '2018-02-19', '2020-08-24 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(290, 5, '1', '2018-02-19', '2020-08-31 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(291, 5, '1', '2018-02-19', '2020-09-07 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(292, 5, '1', '2018-02-19', '2020-09-14 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(293, 5, '1', '2018-02-19', '2020-09-21 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(294, 5, '1', '2018-02-19', '2020-09-28 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(295, 5, '1', '2018-02-19', '2020-10-05 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(296, 5, '1', '2018-02-19', '2020-10-12 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(297, 5, '1', '2018-02-19', '2020-10-19 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(298, 5, '1', '2018-02-19', '2020-10-26 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(299, 5, '1', '2018-02-19', '2020-11-02 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(300, 5, '1', '2018-02-19', '2020-11-09 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(301, 5, '1', '2018-02-19', '2020-11-16 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(302, 5, '1', '2018-02-19', '2020-11-23 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(303, 5, '1', '2018-02-19', '2020-11-30 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(304, 5, '1', '2018-02-19', '2020-12-07 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(305, 5, '1', '2018-02-19', '2020-12-14 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(306, 5, '1', '2018-02-19', '2020-12-21 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(307, 5, '1', '2018-02-19', '2020-12-28 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(308, 5, '1', '2018-02-19', '2021-01-04 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(309, 5, '1', '2018-02-19', '2021-01-11 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(310, 5, '1', '2018-02-19', '2021-01-18 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(311, 5, '1', '2018-02-19', '2021-01-25 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(312, 5, '1', '2018-02-19', '2021-02-01 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(313, 5, '1', '2018-02-19', '2021-02-08 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(314, 5, '1', '2018-02-19', '2021-02-15 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(315, 5, '1', '2018-02-19', '2021-02-22 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(316, 5, '1', '2018-02-19', '2018-02-19 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(317, 5, '1', '2018-02-19', '2018-02-26 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(318, 5, '1', '2018-02-19', '2018-03-07 08:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(319, 5, '1', '2018-02-19', '2018-03-12 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 240, 12, 6, 0, 0),
(320, 5, '1', '2018-02-19', '2018-03-19 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(321, 5, '1', '2018-02-19', '2018-03-26 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(322, 5, '1', '2018-02-19', '2018-04-02 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(323, 5, '1', '2018-02-19', '2018-04-09 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(324, 5, '1', '2018-02-19', '2018-04-16 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(325, 5, '1', '2018-02-19', '2018-04-23 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(326, 5, '1', '2018-02-19', '2018-04-30 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(327, 5, '1', '2018-02-19', '2018-05-07 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(328, 5, '1', '2018-02-19', '2018-05-14 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(329, 5, '1', '2018-02-19', '2018-05-21 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(330, 5, '1', '2018-02-19', '2018-05-28 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(331, 5, '1', '2018-02-19', '2018-06-04 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(332, 5, '1', '2018-02-19', '2018-06-11 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(333, 5, '1', '2018-02-19', '2018-06-18 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(334, 5, '1', '2018-02-19', '2018-06-25 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(335, 5, '1', '2018-02-19', '2018-07-02 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(336, 5, '1', '2018-02-19', '2018-07-09 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(337, 5, '1', '2018-02-19', '2018-07-16 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(338, 5, '1', '2018-02-19', '2018-07-23 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(339, 5, '1', '2018-02-19', '2018-07-30 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(340, 5, '1', '2018-02-19', '2018-08-06 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(341, 5, '1', '2018-02-19', '2018-08-13 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(342, 5, '1', '2018-02-19', '2018-08-20 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(343, 5, '1', '2018-02-19', '2018-08-27 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(344, 5, '1', '2018-02-19', '2018-09-03 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(345, 5, '1', '2018-02-19', '2018-09-04 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 180, 12, 6, 0, 0),
(346, 5, '1', '2018-02-19', '2018-09-17 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(347, 5, '1', '2018-02-19', '2018-09-24 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(348, 5, '1', '2018-02-19', '2018-10-01 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(349, 5, '1', '2018-02-19', '2018-10-08 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(350, 5, '1', '2018-02-19', '2018-10-15 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(351, 5, '1', '2018-02-19', '2018-10-22 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(352, 5, '1', '2018-02-19', '2018-10-29 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(353, 5, '1', '2018-02-19', '2018-11-05 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(354, 5, '1', '2018-02-19', '2018-11-12 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(355, 5, '1', '2018-02-19', '2018-11-19 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(356, 5, '1', '2018-02-19', '2018-11-26 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(357, 5, '1', '2018-02-19', '2018-12-03 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(358, 5, '1', '2018-02-19', '2018-12-10 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(359, 5, '1', '2018-02-19', '2018-12-17 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(360, 5, '1', '2018-02-19', '2018-12-24 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(361, 5, '1', '2018-02-19', '2018-12-31 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(362, 5, '1', '2018-02-19', '2019-01-07 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(363, 5, '1', '2018-02-19', '2019-01-14 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(364, 5, '1', '2018-02-19', '2019-01-21 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(365, 5, '1', '2018-02-19', '2019-01-28 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(366, 5, '1', '2018-02-19', '2019-02-04 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(367, 5, '1', '2018-02-19', '2019-02-11 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(368, 5, '1', '2018-02-19', '2019-02-18 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(369, 5, '1', '2018-02-19', '2019-02-25 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(370, 5, '1', '2018-02-19', '2019-03-04 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(371, 5, '1', '2018-02-19', '2019-03-11 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(372, 5, '1', '2018-02-19', '2019-03-18 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(373, 5, '1', '2018-02-19', '2019-03-25 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(374, 5, '1', '2018-02-19', '2019-04-01 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(375, 5, '1', '2018-02-19', '2019-04-08 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(376, 5, '1', '2018-02-19', '2019-04-15 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(377, 5, '1', '2018-02-19', '2019-04-22 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(378, 5, '1', '2018-02-19', '2019-04-29 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(379, 5, '1', '2018-02-19', '2019-05-06 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(380, 5, '1', '2018-02-19', '2019-05-13 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(381, 5, '1', '2018-02-19', '2019-05-20 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(382, 5, '1', '2018-02-19', '2019-05-27 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(383, 5, '1', '2018-02-19', '2019-06-03 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(384, 5, '1', '2018-02-19', '2019-06-10 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(385, 5, '1', '2018-02-19', '2019-06-17 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(386, 5, '1', '2018-02-19', '2019-06-24 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(387, 5, '1', '2018-02-19', '2019-07-01 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(388, 5, '1', '2018-02-19', '2019-07-08 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(389, 5, '1', '2018-02-19', '2019-07-15 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(390, 5, '1', '2018-02-19', '2019-07-22 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(391, 5, '1', '2018-02-19', '2019-07-29 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(392, 5, '1', '2018-02-19', '2019-08-05 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(393, 5, '1', '2018-02-19', '2019-08-12 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(394, 5, '1', '2018-02-19', '2019-08-19 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(395, 5, '1', '2018-02-19', '2019-08-26 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(396, 5, '1', '2018-02-19', '2019-09-02 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(397, 5, '1', '2018-02-19', '2019-09-09 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(398, 5, '1', '2018-02-19', '2019-09-16 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(399, 5, '1', '2018-02-19', '2019-09-23 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(400, 5, '1', '2018-02-19', '2019-09-30 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0);
INSERT INTO `orden_trabajo` (`id_orden`, `id_tarea`, `nro`, `fecha`, `fecha_program`, `fecha_inicio`, `fecha_entrega`, `fecha_terminada`, `fecha_aviso`, `fecha_entregada`, `descripcion`, `cliId`, `estado`, `id_usuario`, `id_usuario_a`, `id_usuario_e`, `id_sucursal`, `id_proveedor`, `id_solicitud`, `tipo`, `id_equipo`, `duracion`, `id_tareapadre`, `id_empresa`, `lectura_programada`, `lectura_ejecutada`) VALUES
(401, 5, '1', '2018-02-19', '2019-10-07 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(402, 5, '1', '2018-02-19', '2019-10-14 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(403, 5, '1', '2018-02-19', '2019-10-21 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(404, 5, '1', '2018-02-19', '2019-10-28 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(405, 5, '1', '2018-02-19', '2019-11-04 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(406, 5, '1', '2018-02-19', '2019-11-11 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(407, 5, '1', '2018-02-19', '2019-11-18 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(408, 5, '1', '2018-02-19', '2019-11-25 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(409, 5, '1', '2018-02-19', '2019-12-02 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(410, 5, '1', '2018-02-19', '2019-12-09 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(411, 5, '1', '2018-02-19', '2019-12-16 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(412, 5, '1', '2018-02-19', '2019-12-23 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(413, 5, '1', '2018-02-19', '2019-12-30 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(414, 5, '1', '2018-02-19', '2020-01-06 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(415, 5, '1', '2018-02-19', '2020-01-13 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(416, 5, '1', '2018-02-19', '2020-01-20 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(417, 5, '1', '2018-02-19', '2020-01-27 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(418, 5, '1', '2018-02-19', '2020-02-03 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(419, 5, '1', '2018-02-19', '2020-02-10 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(420, 5, '1', '2018-02-19', '2020-02-17 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(421, 5, '1', '2018-02-19', '2020-02-24 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(422, 4, '1', '2018-02-19', '2018-02-20 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(423, 4, '1', '2018-02-19', '2018-03-05 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 150, 11, 6, 0, 0),
(424, 4, '1', '2018-02-19', '2018-03-22 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(425, 4, '1', '2018-02-19', '2018-04-06 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(426, 4, '1', '2018-02-19', '2018-04-27 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(427, 4, '1', '2018-02-19', '2018-05-06 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(428, 4, '1', '2018-02-19', '2018-05-21 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(429, 4, '1', '2018-02-19', '2018-06-05 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(430, 4, '1', '2018-02-19', '2018-06-20 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(431, 4, '1', '2018-02-19', '2018-07-05 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(432, 4, '1', '2018-02-19', '2018-07-20 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(433, 4, '1', '2018-02-19', '2018-08-04 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(434, 4, '1', '2018-02-19', '2018-08-19 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(435, 4, '1', '2018-02-19', '2018-09-03 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(436, 4, '1', '2018-02-19', '2018-09-18 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(437, 4, '1', '2018-02-19', '2018-10-03 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(438, 4, '1', '2018-02-19', '2018-10-18 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(439, 4, '1', '2018-02-19', '2018-11-02 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(440, 4, '1', '2018-02-19', '2018-11-17 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(441, 4, '1', '2018-02-19', '2018-12-02 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(442, 4, '1', '2018-02-19', '2018-12-17 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(443, 4, '1', '2018-02-19', '2019-01-01 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(444, 4, '1', '2018-02-19', '2019-01-16 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(445, 4, '1', '2018-02-19', '2019-01-31 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(446, 4, '1', '2018-02-19', '2019-02-15 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(447, 4, '1', '2018-02-19', '2019-03-02 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(448, 4, '1', '2018-02-19', '2019-03-17 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(449, 4, '1', '2018-02-19', '2019-04-01 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(450, 4, '1', '2018-02-19', '2019-04-16 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(451, 4, '1', '2018-02-19', '2019-05-01 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(452, 4, '1', '2018-02-19', '2019-05-16 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(453, 4, '1', '2018-02-19', '2019-05-31 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(454, 4, '1', '2018-02-19', '2019-06-15 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(455, 4, '1', '2018-02-19', '2019-06-30 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(456, 4, '1', '2018-02-19', '2019-07-15 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(457, 4, '1', '2018-02-19', '2019-07-30 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(458, 4, '1', '2018-02-19', '2019-08-14 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(459, 4, '1', '2018-02-19', '2019-08-29 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(460, 4, '1', '2018-02-19', '2019-09-13 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(461, 4, '1', '2018-02-19', '2019-09-28 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(462, 4, '1', '2018-02-19', '2019-10-13 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(463, 4, '1', '2018-02-19', '2019-10-28 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(464, 4, '1', '2018-02-19', '2019-11-12 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(465, 4, '1', '2018-02-19', '2019-11-27 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(466, 4, '1', '2018-02-19', '2019-12-12 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(467, 4, '1', '2018-02-19', '2019-12-27 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(468, 4, '1', '2018-02-19', '2020-01-11 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(469, 4, '1', '2018-02-19', '2020-01-26 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(470, 4, '1', '2018-02-19', '2020-02-10 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(471, 4, '1', '2018-02-19', '2020-02-25 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(472, 4, '1', '2018-02-19', '2020-03-11 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(473, 4, '1', '2018-02-19', '2020-03-26 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(474, 4, '1', '2018-02-19', '2020-04-10 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(475, 4, '1', '2018-02-19', '2020-04-25 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(476, 4, '1', '2018-02-19', '2020-05-10 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(477, 4, '1', '2018-02-19', '2020-05-25 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(478, 4, '1', '2018-02-19', '2020-06-09 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(479, 4, '1', '2018-02-19', '2020-06-24 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(480, 4, '1', '2018-02-19', '2020-07-09 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(481, 4, '1', '2018-02-19', '2020-07-24 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(482, 4, '1', '2018-02-19', '2020-08-08 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(483, 4, '1', '2018-02-19', '2020-08-23 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(484, 4, '1', '2018-02-19', '2020-09-07 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(485, 4, '1', '2018-02-19', '2020-09-22 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(486, 4, '1', '2018-02-19', '2020-10-07 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(487, 4, '1', '2018-02-19', '2020-10-22 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(488, 4, '1', '2018-02-19', '2020-11-06 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(489, 4, '1', '2018-02-19', '2020-11-21 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(490, 4, '1', '2018-02-19', '2020-12-06 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(491, 4, '1', '2018-02-19', '2020-12-21 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(492, 4, '1', '2018-02-19', '2021-01-05 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(493, 4, '1', '2018-02-19', '2021-01-20 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(494, 4, '1', '2018-02-19', '2021-02-04 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(495, 4, '1', '2018-02-19', '2021-02-19 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(496, 4, '1', '2018-02-19', '2021-03-06 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(497, 16, '1', '2018-02-19', '2018-02-19 12:02:00', '2018-02-10 00:00:00', '2018-03-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(498, 16, '1', '2018-02-19', '2018-02-28 12:02:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(499, 16, '1', '2018-02-19', '2018-03-30 12:02:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(500, 16, '1', '2018-02-19', '2018-04-29 12:02:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(501, 16, '1', '2018-02-19', '2018-05-29 12:02:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(502, 16, '1', '2018-02-19', '2018-02-21 11:23:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(503, 16, '1', '2018-02-19', '2018-03-23 11:23:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(504, 16, '1', '2018-02-19', '2018-04-22 11:23:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(505, 16, '1', '2018-02-19', '2018-02-22 12:22:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(506, 16, '1', '2018-02-19', '2018-03-24 12:22:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(507, 16, '1', '2018-02-19', '2018-04-23 12:22:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(508, 16, '1', '2018-02-19', '2018-05-23 12:22:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(509, 12, '1', '2018-02-26', '2018-02-16 11:00:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL DEPÓSITO DE COMBUSTIBLE.', 1, 'C', 1, 1, 1, 1, 0, 14, '4', 4, 120, 14, 6, 0, 0),
(510, 1, '510', '2018-02-26', '2018-02-07 15:00:00', '2018-10-11 18:32:10', '2018-10-11 18:13:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'bateria descargada 510', 1, 'P', 1, 19, 1, 1, 1, 13, '2', 9, 60, 13, 6, 0, 0),
(511, 1, '1', '2018-02-26', '2018-02-23 17:00:00', '2018-02-08 14:38:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ruido en cuerpo de bomba int 0057A', 1, 'C', 1, 1, 1, 1, 0, 17, '2', 10, 60, 17, 6, 0, 0),
(512, 1, '1', '2018-02-26', '2018-02-21 22:00:00', '2018-02-05 19:01:38', '2018-10-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'bateria descargada\n\n', 1, 'As', 1, 19, 1, 1, 0, 13, '2', 9, 60, 13, 6, 0, 0),
(513, 5, '1', '2018-02-26', '2018-02-23 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(514, 5, '1', '2018-02-26', '2018-03-25 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(515, 5, '1', '2018-02-26', '2018-04-24 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(516, 5, '1', '2018-02-26', '2018-05-24 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(517, 5, '1', '2018-02-26', '2018-06-23 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(518, 5, '1', '2018-02-26', '2018-07-23 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(519, 5, '1', '2018-02-26', '2018-08-22 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(520, 5, '1', '2018-02-26', '2018-09-21 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(521, 5, '1', '2018-02-26', '2018-10-21 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(522, 5, '1', '2018-02-26', '2018-11-20 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(523, 5, '1', '2018-02-26', '2018-12-20 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(524, 5, '1', '2018-02-26', '2019-01-19 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(525, 5, '1', '2018-02-26', '2019-02-18 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(526, 5, '1', '2018-02-26', '2019-03-20 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(527, 12, '1', '2018-02-26', '2018-02-22 19:00:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL DEPÓSITO DE COMBUSTIBLE.', 1, 'C', 1, 1, 1, 1, 0, 14, '4', 4, 60, 14, 6, 0, 0),
(528, 8, '1', '2018-03-09', '2018-03-22 02:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CAMBIE EL ACEITE DE MOTOR. ACEITE 15W40', 1, 'C', 1, 1, 1, 1, 0, 16, '3', 4, 30, 16, 6, 0, 0),
(529, 9, '1', '2018-03-10', '2018-03-14 00:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CAMBIE LOS FILTROS DE ACEITE.', 1, 'C', 1, 1, 1, 1, 0, 17, '3', 4, 0, 17, 6, 0, 0),
(530, 8, '1', '2018-03-12', '2018-03-12 01:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CAMBIE EL ACEITE DE MOTOR. ACEITE 15W40', 1, 'C', 1, 1, 1, 1, 0, 16, '3', 4, 0, 16, 6, 0, 0),
(531, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-03-12 05:28:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'weqeqwqweqweqwewqeqwe\neqweqweqwe\nqweqw', 1, 'C', 1, 1, 0, 1, 2, 0, '1', 4, 0, NULL, 6, 0, 0),
(532, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-03-12 14:17:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'editado', 1, 'P', 1, 1, 0, 1, 1, 0, '1', 8, 0, NULL, 6, 0, 0),
(533, 1, '1', '2018-06-19', '2018-06-19 05:00:00', '2018-06-19 11:09:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla test', 1, 'AN', 3, 1, 1, 1, 0, 27, '2', 4, 60, 27, 6, 0, 0),
(534, 1, '1', '2018-06-21', '2018-06-21 05:15:00', '2018-06-19 11:17:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla testing 1', 1, 'AN', 3, 1, 1, 1, 0, 29, '2', 4, 60, 29, 6, 0, 0),
(535, 1, '1', '2018-06-21', '2018-06-21 18:00:00', '2018-06-19 11:09:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla test', 1, 'C', 3, 1, 1, 1, 0, 27, '2', 4, 60, 27, 6, 0, 0),
(536, 1, '', '0000-00-00', '0000-00-00 00:00:00', '2018-06-22 10:33:00', '2018-06-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'orden de trabajos testing 11 editado', 1, 'C', 3, 3, 1, 1, 1, 0, '1', 11, 60, NULL, 6, 0, 0),
(537, 1, '1', '2018-06-25', '2018-06-26 15:00:00', '2018-06-25 09:29:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'fala ttesting 25-06', 1, 'C', 3, 1, 1, 1, 0, 31, '2', 4, 60, 31, 6, 0, 0),
(538, 1, '1', '2018-06-28', '2018-06-28 20:00:00', '2018-06-28 12:52:09', '2018-06-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla calendario ', 1, 'As', 3, 3, 1, 1, 1, 32, '2', 4, 60, 32, 6, 0, 0),
(539, 1, '1', '2018-06-28', '2018-06-28 15:00:00', '2018-06-28 12:52:09', '2018-06-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla calendario ', 1, 'As', 3, 3, 1, 1, 0, 32, '2', 4, 60, 32, 6, 0, 0),
(540, 1, '1', '2018-06-28', '2018-06-28 15:00:00', '2018-06-28 12:52:09', '2018-06-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla calendario ', 1, 'As', 3, 3, 1, 1, 0, 32, '2', 4, 60, 32, 6, 0, 0),
(541, 1, '1', '2018-06-28', '2018-06-28 15:00:00', '2018-06-28 12:52:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla calendario ', 1, 'C', 3, 1, 1, 1, 1, 32, '2', 4, 60, 32, 6, 0, 0),
(542, 15, '1', '2018-07-25', '2018-07-25 23:00:00', '2018-01-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cambie los Filtros del Motor', 1, 'C', 1, 1, 1, 1, 0, 4, '3', 1, 30, 4, 6, 0, 0),
(543, 36, '1', '2018-07-25', '2018-07-26 23:00:00', '2018-01-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cambiar Aceite de Transmisión (cada 1000hs según horometro, utilizar el aceite SAE10W). ', 1, 'C', 1, 1, 1, 1, 0, 32, '3', 2, 60, 32, 6, 0, 0),
(544, 36, '1', '2018-07-25', '2018-07-25 23:30:00', '2018-01-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cambiar Aceite de Transmisión (cada 1000hs según horometro, utilizar el aceite SAE10W). ', 1, 'C', 1, 1, 1, 1, 0, 32, '3', 2, 30, 32, 6, 0, 0),
(545, 3, '1', '2018-07-28', '2018-07-28 20:15:00', '2018-01-01 00:00:00', '2018-10-04 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cambie Liquido de Refrigerante de Motor (Revise la Mezcla Anticongelante antes de la Epoca Invernal).', 1, 'As', 1, 1, 1, 1, 0, 97, '3', 5, 20, 97, 6, 0, 0),
(546, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-09-24 18:09:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'hhhhh', 1, 'C', 19, 1, 0, 1, 0, 0, '1', 1, 0, NULL, 0, 0, 0),
(547, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-09-24 18:10:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'barrer la vereda', 1, 'C', 16, 1, 0, 1, 0, 0, '1', 13, 0, NULL, 0, 0, 0),
(548, NULL, '8000', '0000-00-00', '0000-00-00 00:00:00', '2018-09-24 18:15:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ver', 1, 'C', 16, 1, 0, 1, 0, 0, '1', 13, 0, NULL, 0, 0, 0),
(549, 113, '1', '2018-09-24', '0000-00-00 00:00:00', '2018-09-26 00:00:00', '2018-10-08 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cambio de Vidrios ', 1, 'AN', 19, 16, 1, 1, 0, 131, '3', 13, 1, 131, 7, 0, 0),
(550, 121, '1', '2018-09-24', '0000-00-00 00:00:00', '2018-09-24 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Regulación Eléctrica de Joysticks ', 1, 'AN', 16, 1, 1, 1, 0, 130, '3', 13, 2, 130, 7, 0, 0),
(551, 113, '1', '2018-09-24', '0000-00-00 00:00:00', '2018-09-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cambio de Vidrios ', 1, 'AN', 19, 1, 1, 1, 0, 131, '3', 13, 1, 131, 7, 0, 0),
(552, 1, '1', '2018-09-25', '0000-00-00 00:00:00', '2018-08-30 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 1, 1, 1, 1, 0, 122, '3', 1, 12, 122, 6, 0, 0),
(553, NULL, '1234', '0000-00-00', '0000-00-00 00:00:00', '2018-09-26 00:36:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '901', 1, 'C', 1, 1, 0, 1, 0, 0, '1', 13, 0, NULL, 0, 0, 0),
(554, NULL, '1111', '0000-00-00', '0000-00-00 00:00:00', '2018-09-26 00:38:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '11111111', 1, 'C', 1, 1, 0, 1, 0, 0, '1', 16, 0, NULL, 0, 0, 0),
(555, NULL, '11111111', '0000-00-00', '0000-00-00 00:00:00', '2018-09-26 00:38:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '12222222222222', 1, 'C', 1, 1, 0, 1, 0, 0, '1', 1, 0, NULL, 0, 0, 0),
(556, NULL, '1', '0000-00-00', '0000-00-00 00:00:00', '2018-09-26 00:39:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1111', 1, 'C', 1, 1, 0, 1, 0, 0, '1', 3, 0, NULL, 0, 0, 0),
(557, 9, '1', '2018-09-26', '0000-00-00 00:00:00', '2018-09-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo del Radiador.', 1, 'C', 1, 1, 1, 1, 0, 133, '3', 1, 2, 133, 6, 0, 0),
(558, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-09-28 21:32:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'C', 1, 1, 0, -1, 0, 0, '1', -1, 0, NULL, 0, 0, 0),
(559, 1, '1', '2018-10-02', '0000-00-00 00:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 1, 1, 1, 1, 0, 127, '3', 1, 23, 127, 6, 0, 0),
(560, 1, '1', '2018-10-03', '0000-00-00 00:00:00', '2018-09-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 1, 1, 1, 1, 0, 135, '3', 1, 33, 135, 6, 0, 0),
(561, 1, '1', '2018-10-03', '0000-00-00 00:00:00', '2018-09-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 1, 1, 1, 1, 0, 135, '3', 1, 33, 135, 6, 0, 0),
(562, 108, '1', '2018-10-03', '0000-00-00 00:00:00', '2018-10-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Revise el Sensor de Temperatura.', 1, 'C', 1, 1, 1, 1, 0, 110, '3', 5, 0, 110, 6, 0, 0),
(563, NULL, '0033', '0000-00-00', '0000-00-00 00:00:00', '2018-10-03 23:12:00', '2018-10-03 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0033 - 123456798 - suc capital - trazalog', 1, 'As', 1, 1, 0, 2, 2, 0, '1', 18, 0, NULL, 6, 0, 0),
(564, 64, '1', '2018-10-03', '2018-10-03 23:45:00', '2018-07-04 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lubricar Eje de Mando Trasero (cada 2000 hs según horómetro. utilizar aceite. ver tabla de aceites capacidad 16 litros).', 1, 'C', 1, 1, 1, 1, 0, 60, '3', 3, 15, 60, 6, 0, 0),
(565, 1, '1', '2018-10-03', '2018-10-05 10:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 1, 1, 1, 1, 0, 127, '3', 1, 23, 127, 6, 0, 0),
(566, 1, '1', '2018-10-03', '2018-10-14 00:00:00', '2018-09-25 10:23:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'equipo averiado ', 1, 'C', 1, 1, 1, 1, 0, 51, '2', 1, 60, 51, 6, 0, 0),
(567, 1, '1', '2018-10-03', '2018-09-14 00:00:00', '2018-09-25 10:23:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'equipo averiado ', 1, 'C', 1, 1, 1, 1, 0, 51, '2', 1, 60, 51, 6, 0, 0),
(568, NULL, '11223344', '0000-00-00', '0000-00-00 00:00:00', '2018-10-04 10:41:00', '2018-10-24 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'nueva ot 123456789', 1, 'As', 1, 1, 0, 1, 1, 0, '1', 18, 0, NULL, 6, 0, 0),
(569, 1, '1', '2018-10-04', '2018-10-10 12:56:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 1, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0),
(570, 64, '1', '2018-10-04', '2018-10-31 07:17:00', '2018-07-04 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lubricar Eje de Mando Trasero (cada 2000 hs según horómetro. utilizar aceite. ver tabla de aceites capacidad 16 litros).', 1, 'C', 1, 1, 1, 1, 0, 60, '3', 3, 15, 60, 6, 0, 0),
(571, 64, '1', '2018-10-04', '2019-02-20 07:17:00', '2018-07-04 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lubricar Eje de Mando Trasero (cada 2000 hs según horómetro. utilizar aceite. ver tabla de aceites capacidad 16 litros).', 1, 'C', 1, 1, 1, 1, 0, 60, '3', 3, 15, 60, 6, 0, 0),
(572, 64, '1', '2018-10-04', '2019-06-12 07:17:00', '2018-07-04 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lubricar Eje de Mando Trasero (cada 2000 hs según horómetro. utilizar aceite. ver tabla de aceites capacidad 16 litros).', 1, 'C', 1, 1, 1, 1, 0, 60, '3', 3, 15, 60, 6, 0, 0),
(573, 9, '1', '2018-10-04', '2018-10-25 00:00:00', '2018-09-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo del Radiador.', 1, 'C', 1, 1, 1, 1, 0, 133, '3', 1, 2, 133, 6, 0, 0),
(574, NULL, '11112222', '0000-00-00', '0000-00-00 00:00:00', '2018-10-04 12:03:00', '2018-10-04 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'eli', 1, 'AN', 1, 1, 0, 1, 1, 0, '1', 9, 0, NULL, 6, 0, 0),
(575, NULL, '333', '0000-00-00', '0000-00-00 00:00:00', '2018-10-04 12:05:00', '2018-10-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '666', 1, 'As', 1, 19, 0, 2, 2, 0, '1', 9, 0, NULL, 6, 0, 0),
(576, NULL, '9347923984734', '0000-00-00', '0000-00-00 00:00:00', '2018-10-04 12:08:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'jhgffgsdjfgsdhf', 1, 'C', 1, 1, 0, 1, 1, 0, '1', 18, 0, NULL, 6, 0, 0),
(577, NULL, '112233', '0000-00-00', '0000-00-00 00:00:00', '2018-10-04 12:13:00', '2018-10-31 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'nueva orden de trabajo', 1, 'As', 1, 1, 0, 1, 1, 0, '1', 18, 0, NULL, 6, 0, 0),
(578, NULL, '9996', '0000-00-00', '0000-00-00 00:00:00', '2018-10-04 13:41:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '999 ultimaxx', 1, 'C', 1, 1, 0, 2, 2, 0, '1', 9, 0, NULL, 6, 0, 0),
(579, NULL, '1122334455', '0000-00-00', '0000-00-00 00:00:00', '2018-10-05 10:36:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'nueva orden de tabajo ', 1, 'AN', 1, 1, 0, 1, 1, 0, '1', 9, 0, NULL, 6, 0, 0),
(580, NULL, '4536', '0000-00-00', '0000-00-00 00:00:00', '2018-10-05 10:36:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3456', 1, 'AN', 1, 1, 0, 1, 2, 0, '1', 9, 0, NULL, 6, 0, 0),
(581, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-05 10:36:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'C', 1, 1, 0, -1, -1, 0, '1', -1, 0, NULL, 6, 0, 0),
(582, NULL, '111', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'C', 1, 1, 0, 0, 0, 0, '1', 0, 0, NULL, 6, 0, 0),
(583, NULL, '1234', '0000-00-00', '0000-00-00 00:00:00', '2018-10-05 13:06:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1234', 1, 'C', 1, 1, 0, -1, -1, 0, '1', 9, 0, NULL, 6, 0, 0),
(584, NULL, '540', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '540', 1, 'AN', 1, 1, 0, 1, 1, 0, '1', 9, 0, NULL, 6, 0, 0),
(585, NULL, '222', '0000-00-00', '0000-00-00 00:00:00', '2018-10-05 13:07:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '222', 1, 'AN', 1, 1, 0, 1, 2, 0, '1', 5, 0, NULL, 6, 0, 0),
(586, 1, '1', '2018-10-05', '2018-10-05 12:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 19, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0),
(587, 1, '1', '2018-10-05', '2018-11-19 12:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 19, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0),
(588, 1, '1', '2018-10-05', '2019-01-03 12:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 19, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0),
(589, 1, '1', '2018-10-05', '2019-02-17 12:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 19, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0),
(590, 1, '1', '2018-10-05', '2019-04-03 12:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 19, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0);
INSERT INTO `orden_trabajo` (`id_orden`, `id_tarea`, `nro`, `fecha`, `fecha_program`, `fecha_inicio`, `fecha_entrega`, `fecha_terminada`, `fecha_aviso`, `fecha_entregada`, `descripcion`, `cliId`, `estado`, `id_usuario`, `id_usuario_a`, `id_usuario_e`, `id_sucursal`, `id_proveedor`, `id_solicitud`, `tipo`, `id_equipo`, `duracion`, `id_tareapadre`, `id_empresa`, `lectura_programada`, `lectura_ejecutada`) VALUES
(591, 1, '1', '2018-10-05', '2019-05-18 12:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 19, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0),
(592, 1, '1', '2018-10-05', '2019-07-02 12:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 19, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0),
(593, 1, '1', '2018-10-05', '2019-08-16 12:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 19, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0),
(594, 1, '1', '2018-10-05', '2019-09-30 12:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 19, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0),
(595, 1, '1', '2018-10-05', '2019-11-14 12:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 19, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0),
(596, NULL, '23', '0000-00-00', '0000-00-00 00:00:00', '2018-10-06 09:46:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'sdadasda', 1, 'AN', 1, 1, 0, 1, 1, 0, '1', 9, 0, NULL, 6, 0, 0),
(597, 129, '1', '2018-10-08', '2018-10-25 00:00:00', '2018-10-08 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'AN', 18, 1, 1, 1, 0, 25, '5', 13, 2, 25, 7, 0, 0),
(598, 1, '1', '2018-10-08', '2018-10-25 00:00:00', '2018-10-08 08:47:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Engrase de cardan ', 1, 'AN', 18, 1, 1, 1, 0, 73, '2', 16, 60, 73, 7, 0, 0),
(599, 1, '1', '2018-10-08', '2018-10-08 00:00:00', '2018-10-08 12:05:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ggg', 1, 'C', 1, 1, 1, 1, 0, 75, '2', 13, 60, 75, 6, 0, 0),
(600, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-02 13:00:00', '2018-10-09 17:30:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'eliana probando nueva', 1, 'C', 1, 1, 0, 2, 2, 0, '1', 9, 0, NULL, 6, 0, 0),
(601, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-08 12:37:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'C', 1, 1, 0, -1, -1, 0, '1', 9, 0, NULL, 6, 0, 0),
(602, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-08 12:38:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'C', 1, 1, 0, -1, -1, 0, '1', 9, 0, NULL, 6, 0, 0),
(603, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-11 11:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'C', 1, 1, 0, -1, -1, 0, '1', 9, 0, NULL, 6, 0, 0),
(604, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-11 13:12:00', '2018-10-11 13:05:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'C', 1, 1, 0, -1, -1, 0, '1', -1, 0, NULL, 6, 0, 0),
(605, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-11 16:45:00', '2018-10-11 16:45:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'C', 1, 1, 0, 1, 1, 0, '1', 9, 0, NULL, 6, 0, 0),
(606, NULL, '403', '0000-00-00', '0000-00-00 00:00:00', '2018-10-11 16:47:00', '2018-10-09 08:30:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ot nota', 1, 'C', 1, 1, 0, 2, 2, 0, '1', 9, 0, NULL, 6, 0, 0),
(607, 143, '1', '2018-10-19', '2018-10-19 10:00:00', '2019-06-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Compruebe los Soportes de los Cilindros ', 1, 'C', 1, 1, 1, 1, 0, 18, '3', 9, 10, 18, 6, 1250, 1540),
(608, 108, '1', '2018-11-06', '2018-11-08 10:00:00', '2018-10-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Revise el Sensor de Temperatura.', 1, 'C', 1, 1, 1, 1, 0, 110, '3', 5, 0, 110, 6, 0, 0),
(609, 108, '1', '2018-11-06', '2018-12-13 10:00:00', '2018-10-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Revise el Sensor de Temperatura.', 1, 'C', 1, 1, 1, 1, 0, 110, '3', 5, 0, 110, 6, 0, 0),
(610, 108, '1', '2018-11-06', '2019-01-17 10:00:00', '2018-10-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Revise el Sensor de Temperatura.', 1, 'C', 1, 1, 1, 1, 0, 110, '3', 5, 0, 110, 6, 0, 0),
(611, 108, '1', '2018-11-06', '2018-11-07 12:00:00', '2018-10-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Revise el Sensor de Temperatura.', 1, 'C', 1, 1, 1, 1, 0, 110, '3', 5, 0, 110, 6, 0, 0),
(612, 108, '1', '2018-11-06', '2018-12-12 12:00:00', '2018-10-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Revise el Sensor de Temperatura.', 1, 'C', 1, 1, 1, 1, 0, 110, '3', 5, 0, 110, 6, 0, 0),
(613, 108, '1', '2018-11-06', '2019-01-16 12:00:00', '2018-10-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Revise el Sensor de Temperatura.', 1, 'C', 1, 1, 1, 1, 0, 110, '3', 5, 0, 110, 6, 0, 0),
(614, 108, '1', '2018-11-06', '2019-02-20 12:00:00', '2018-10-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Revise el Sensor de Temperatura.', 1, 'C', 1, 1, 1, 1, 0, 110, '3', 5, 0, 110, 6, 0, 0),
(615, NULL, 'OT 12345', '0000-00-00', '0000-00-00 00:00:00', '2018-11-12 15:27:00', '2018-11-16 15:27:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ORDEN DE TRBAJO TEST VIEW_PRINT', 1, 'C', 1, 1, 0, 1, 2, 0, '1', 19, 0, NULL, 6, 0, 0),
(616, NULL, '789456', '0000-00-00', '0000-00-00 00:00:00', '2018-11-12 15:44:00', '2018-11-16 15:43:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ORDEN TRABAJO TEST HUGO EQUIPO', 1, 'C', 1, 1, 0, 1, 1, 0, '1', 19, 0, NULL, 6, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `Codigo` varchar(2) NOT NULL,
  `Pais` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`Codigo`, `Pais`) VALUES
('AR', 'Argentina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametroequipo`
--

CREATE TABLE `parametroequipo` (
  `id` int(11) NOT NULL,
  `paramId` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `fechahora` datetime NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parametroequipo`
--

INSERT INTO `parametroequipo` (`id`, `paramId`, `id_equipo`, `valor`, `fechahora`, `id_empresa`) VALUES
(3, 22, 19, '1', '2018-11-08 16:01:41', 6),
(4, 23, 19, '2', '2018-11-08 16:01:55', 6),
(5, 22, 19, '15', '2018-11-08 16:05:11', 6),
(6, 22, 19, '1234', '2018-11-09 12:00:00', 6),
(7, 22, 19, '2345', '2018-11-16 12:00:00', 6),
(8, 22, 19, '5665767', '2018-11-09 12:00:00', 6),
(10, 0, 0, '', '2018-11-12 12:00:00', 6),
(12, 0, 0, '', '2018-11-12 12:00:00', 6),
(13, 0, 0, '', '2018-11-08 12:00:00', 6),
(14, 0, 0, '', '2018-11-10 12:00:00', 6),
(16, 22, 19, '123456', '2018-11-13 12:00:00', 6),
(17, 23, 19, '544', '2018-11-13 12:00:00', 6),
(18, 23, 19, '155555', '2018-11-13 12:00:00', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `paramId` int(11) NOT NULL,
  `paramdescrip` varchar(255) DEFAULT NULL,
  `min` varchar(255) DEFAULT NULL,
  `estado` varchar(5) NOT NULL,
  `id_empresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`paramId`, `paramdescrip`, `min`, `estado`, `id_empresa`) VALUES
(22, 'parametro 1', NULL, 'AC', 6),
(23, 'parametro 2', NULL, 'AC', 6),
(24, 'parametro 3', NULL, 'AC', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

CREATE TABLE `periodo` (
  `idperiodo` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `estado` varchar(4) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `periodo`
--

INSERT INTO `periodo` (`idperiodo`, `descripcion`, `estado`, `id_empresa`) VALUES
(1, 'Diario', 'AC', 6),
(2, 'mensual', 'AC', 6),
(3, 'semestral', 'AC', 6),
(4, 'anual', 'AC', 6),
(5, 'horas', 'AC', 6),
(6, 'Ciclos', 'AC', 6),
(7, 'kilómetros', 'AC', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `predictivo`
--

CREATE TABLE `predictivo` (
  `predId` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `tarea_descrip` varchar(2000) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `periodo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `horash` int(11) DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `pred_duracion` int(11) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `pred_canth` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `predictivo`
--

INSERT INTO `predictivo` (`predId`, `id_equipo`, `tarea_descrip`, `fecha`, `periodo`, `cantidad`, `horash`, `estado`, `pred_duracion`, `id_unidad`, `pred_canth`, `id_empresa`) VALUES
(1, 1, '4', '2017-11-07', 'Diario', 30, NULL, 'C', 0, 0, 0, 0),
(2, 2, '5', '0000-00-00', 'Diario', 15, NULL, 'C', 0, 0, 0, 0),
(3, 1, '6', '0000-00-00', 'Periodos', 15, NULL, 'C', 0, 0, 0, 0),
(4, 1, '4', '2017-11-24', 'Diario', 15, NULL, 'AN', 0, 0, 0, 0),
(5, 1, '5', '2017-12-09', 'Diario', 23, NULL, 'C', 0, 0, 0, 0),
(6, 2, '6', '2017-12-11', 'Diario', 20, 5, 'C', 0, 0, 0, 0),
(7, 4, '15', '0002-07-08', 'Mensual', 51, 1, 'C', 0, 0, 0, 0),
(8, 4, '16', '0002-10-08', 'Diario', 30, 96, 'AN', 2, 3, 2, 6),
(9, 10, '6', '0000-00-00', 'Diario', 7, 4, 'C', 2, 2, 2, 6),
(10, 7, '4', '0000-00-00', 'Diario', 10, 24, 'C', 12, 2, 2, 6),
(11, 4, '10', '2018-05-29', 'Diario', 30, 25, 'C', 0, 0, 0, 0),
(12, 10, '7', '0000-00-00', 'Diario', 30, 1, 'AN', 60, 1, 1, 6),
(13, 5, '4', '0000-00-00', 'Diario', 30, 0, 'AN', 60, 1, 2, 6),
(14, -1, '-1', '2018-05-30', 'Diario', 0, NULL, 'C', 0, -1, 0, 6),
(15, -1, '-1', '2018-05-30', 'Diario', 0, NULL, 'C', 0, -1, 0, 6),
(16, -1, '-1', '2018-05-31', 'Diario', 0, NULL, 'C', 0, -1, 0, 6),
(17, 10, '9', '2018-05-23', 'Diario', 30, 384, 'AN', 8, 3, 2, 6),
(18, 11, '15', '2018-06-28', 'Diario', 21, 1, 'C', 60, 1, 1, 6),
(19, 1, '1', '2018-08-30', 'Diario', 12, 1, 'C', 12, 1, 5, 6),
(20, 1, '1', '2018-09-05', 'Diario', 6, 2, 'C', 23, 1, 5, 6),
(21, 1, '20', '2018-09-05', 'Diario', 4, 0, 'C', 3, 1, 5, 6),
(22, 9, '16', '0000-00-00', 'Diario', 2, 2, 'AN', 20, 1, 6, 6),
(23, 9, '1', '2018-10-24', 'Diario', 222, 99, 'AN', 33, 2, 3, 6),
(24, 9, '109', '2018-10-31', 'Diario', 33, NULL, 'AN', 0, 1, 0, 6),
(25, 13, '129', '2018-10-08', 'Diario', 1, NULL, 'AN', 2, 2, 1, 7),
(26, 9, '111', '2018-10-08', 'Diario', 2, 8, 'C', 100, 1, 5, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preventivo`
--

CREATE TABLE `preventivo` (
  `prevId` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_tarea` int(11) NOT NULL,
  `perido` varchar(50) NOT NULL,
  `cantidad` double NOT NULL,
  `ultimo` date NOT NULL,
  `id_componente` int(11) NOT NULL,
  `critico1` double NOT NULL,
  `fechaprobable` date DEFAULT NULL,
  `horash` int(11) NOT NULL,
  `estadoprev` char(255) DEFAULT NULL,
  `prev_duracion` double NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `prev_canth` double NOT NULL,
  `prev_adjunto` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `lectura_base` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `preventivo`
--

INSERT INTO `preventivo` (`prevId`, `id_equipo`, `id_tarea`, `perido`, `cantidad`, `ultimo`, `id_componente`, `critico1`, `fechaprobable`, `horash`, `estadoprev`, `prev_duracion`, `id_unidad`, `prev_canth`, `prev_adjunto`, `id_empresa`, `lectura_base`) VALUES
(1, 1, 4, '1', 14, '2018-01-01', 1, 0, NULL, 2, 'C', 60, 1, 2, NULL, 6, 0),
(2, 1, 1, '1', 7, '2018-01-03', 1, 0, NULL, 1, 'C', 20, 1, 2, NULL, 6, 0),
(3, 1, 3, '1', 14, '2018-01-01', 1, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(4, 1, 15, '1', 42, '2018-01-01', 1, 0, NULL, 0, 'C', 12, 1, 3, NULL, 6, 0),
(5, 1, 5, '1', 84, '2018-01-01', 1, 0, NULL, 1, 'C', 30, 1, 2, NULL, 6, 0),
(6, 1, 6, '1', 14, '2018-01-01', 2, 0, NULL, 0, 'C', 15, 1, 1, NULL, 6, 0),
(7, 1, 7, '1', 14, '2018-01-03', 3, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(8, 1, 8, '1', 35, '2018-01-03', 4, 0, NULL, 0, 'C', 20, 1, 1, NULL, 6, 0),
(9, 1, 9, '1', 140, '2018-01-03', 5, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(10, 1, 10, '1', 14, '2018-01-03', 26, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(11, 1, 11, '1', 105, '2018-01-01', 26, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(12, 1, 12, '1', 35, '2018-01-01', 26, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(13, 1, 13, '1', 35, '2018-01-01', 26, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(14, 1, 14, '1', 70, '2018-01-01', 26, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(15, 1, 22, '1', 14, '2018-01-01', 28, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(16, 1, 21, '1', 14, '2018-01-01', 28, 0, NULL, 0, 'C', 15, 1, 1, NULL, 6, 0),
(17, 1, 20, '1', 14, '2018-01-03', 28, 0, NULL, 1, 'C', 30, 1, 1, NULL, 6, 0),
(18, 1, 16, '1', 105, '2018-01-01', 27, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(19, 1, 17, '1', 105, '2018-01-03', 27, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(20, 1, 18, '1', 105, '2018-01-01', 27, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(21, 1, 19, '1', 140, '2018-01-03', 27, 0, NULL, 2, 'AN', 30, 1, 4, NULL, 6, 0),
(22, 1, 26, '1', 70, '2018-01-01', 30, 0, NULL, 0, 'C', 20, 1, 1, NULL, 6, 0),
(23, 2, 27, '1', 7, '2018-01-01', 6, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(24, 2, 28, '1', 84, '2018-01-03', 7, 0, NULL, 32, 'C', 480, 1, 4, NULL, 6, 0),
(25, 2, 29, '1', 14, '2018-01-03', 8, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(26, 2, 30, '1', 14, '2018-01-01', 9, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(27, 2, 31, '1', 14, '2018-01-01', 10, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(28, 2, 32, '1', 2, '2018-01-01', 31, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(29, 2, 33, '1', 14, '2018-01-01', 31, 0, NULL, 1, 'C', 20, 1, 2, NULL, 6, 0),
(31, 2, 35, '1', 56, '2018-01-01', 31, 0, NULL, 1, 'C', 20, 1, 2, NULL, 6, 0),
(32, 2, 36, '1', 56, '2018-01-01', 32, 0, NULL, 1, 'C', 20, 1, 2, NULL, 6, 0),
(33, 2, 37, '1', 56, '2018-01-01', 32, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(34, 2, 38, '1', 96, '2018-01-01', 33, 0, NULL, 6, 'C', 120, 1, 3, NULL, 6, 0),
(35, 2, 39, '1', 30, '2018-01-01', 33, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(36, 2, 40, '1', 2, '2018-01-01', 34, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(37, 2, 41, '1', 168, '2018-01-01', 34, 0, NULL, 9, 'C', 180, 1, 3, NULL, 6, 0),
(38, 2, 42, '1', 2, '2018-01-01', 35, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(39, 2, 43, '1', 2, '2018-07-04', 36, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(40, 2, 44, '1', 14, '2018-07-04', 37, 0, NULL, 1, 'C', 15, 1, 2, NULL, 6, 0),
(41, 2, 45, '1', 14, '2018-07-04', 38, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(42, 2, 46, '1', 14, '2018-01-01', 39, 0, NULL, 1, 'C', 40, 1, 2, NULL, 6, 0),
(43, 2, 47, '1', 364, '2018-01-01', 40, 0, NULL, 150, 'C', 3000, 1, 3, NULL, 6, 0),
(44, 2, 48, '1', 7, '2018-01-01', 41, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(45, 2, 49, '1', 14, '2018-01-01', 42, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(46, 2, 50, '1', 14, '2018-01-01', 43, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(47, 2, 51, '1', 14, '2018-01-01', 44, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(48, 3, 52, '1', 56, '2018-01-01', 11, 0, NULL, 6, 'C', 180, 1, 2, NULL, 6, 0),
(49, 3, 53, '1', 14, '2018-01-01', 12, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(50, 3, 54, '1', 14, '2018-01-01', 13, 0, NULL, 1, 'C', 20, 1, 2, NULL, 6, 0),
(51, 3, 55, '1', 14, '2018-01-01', 14, 0, NULL, 0, 'C', 20, 1, 1, NULL, 6, 0),
(52, 3, 56, '1', 2, '2018-01-01', 15, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(53, 3, 57, '1', 56, '2018-01-01', 46, 0, NULL, 6, 'C', 180, 1, 2, NULL, 6, 0),
(54, 3, 58, '1', 2, '2018-07-04', 59, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(55, 3, 59, '1', 28, '2018-07-04', 47, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(56, 3, 60, '1', 56, '2018-07-04', 48, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(57, 3, 61, '1', 14, '2018-01-01', 49, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(58, 3, 62, '1', 112, '2018-01-01', 49, 0, NULL, 1, 'C', 15, 1, 2, NULL, 6, 0),
(59, 3, 63, '1', 2, '2018-01-01', 50, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(60, 3, 64, '1', 112, '2018-07-04', 50, 0, NULL, 1, 'C', 15, 1, 2, NULL, 6, 0),
(61, 3, 0, '1', 56, '2018-01-01', 51, 0, NULL, 3, 'C', 34, 1, 5, NULL, 6, 0),
(62, 3, 66, '1', 2, '2018-01-01', 52, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(63, 3, 67, '1', 14, '2018-01-01', 52, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(64, 3, 68, '1', 2, '2018-01-01', 53, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(65, 3, 69, '1', 112, '2018-01-01', 53, 0, NULL, 8, 'C', 240, 1, 2, NULL, 6, 0),
(66, 3, 70, '1', 14, '2018-01-01', 54, 0, NULL, 1, 'C', 20, 1, 2, NULL, 6, 0),
(67, 3, 71, '1', 14, '2018-01-01', 54, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(68, 3, 72, '1', 14, '2018-01-01', 54, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(69, 3, 72, '1', 14, '2018-01-01', 54, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(70, 3, 73, '1', 56, '2018-01-01', 55, 0, NULL, 4, 'C', 120, 1, 2, NULL, 6, 0),
(71, 3, 74, '1', 14, '2018-01-01', 56, 0, NULL, 1, 'C', 30, 1, 2, NULL, 6, 0),
(72, 3, 75, '1', 30, '2018-01-01', 57, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(73, 3, 76, '1', 182, '2018-01-01', 58, 0, NULL, 24, 'C', 480, 1, 3, NULL, 6, 0),
(74, 4, 77, '1', 2, '2018-01-01', 16, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(75, 4, 78, '1', 28, '2018-01-01', 17, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(76, 4, 80, '1', 2, '2018-01-01', 17, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(77, 4, 81, '1', 2, '2018-01-01', 18, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(78, 4, 83, '1', 14, '2018-01-01', 20, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(79, 4, 84, '1', 14, '2018-01-01', 20, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(80, 4, 86, '1', 84, '2018-01-01', 61, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(81, 4, 85, '1', 28, '2018-01-01', 61, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(82, 4, 87, '1', 28, '2018-01-01', 62, 0, NULL, 1, 'C', 30, 1, 2, NULL, 6, 0),
(83, 4, 88, '1', 28, '2018-01-01', 63, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(84, 4, 85, '1', 28, '2018-01-01', 63, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(85, 4, 91, '1', 14, '2018-01-01', 64, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(86, 4, 81, '1', 2, '2018-01-01', 18, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(87, 4, 90, '1', 14, '2018-07-05', 65, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(88, 4, 90, '1', 14, '2018-07-05', 65, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(89, 4, 92, '1', 28, '2018-01-01', 66, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(90, 4, 93, '1', 2, '2018-01-01', 67, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(91, 4, 94, '1', 2, '2018-01-01', 68, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(92, 4, 95, '1', 2, '2018-01-01', 69, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(93, 4, 96, '1', 2, '2018-01-01', 70, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(94, 4, 97, '1', 2, '2018-01-01', 71, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(95, 5, 1, '1', 30, '2018-01-01', 21, 0, NULL, 3, 'C', 60, 1, 3, NULL, 6, 0),
(96, 5, 2, '1', 2, '2018-01-01', 21, 0, NULL, 0, 'C', 20, 1, 1, NULL, 6, 0),
(97, 5, 3, '1', 182, '2018-01-01', 21, 0, NULL, 1, 'C', 20, 1, 2, NULL, 6, 0),
(98, 5, 4, '1', 2, '2018-01-01', 21, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(99, 5, 5, '1', 2, '2018-01-01', 21, 0, NULL, 1, 'C', 30, 1, 2, NULL, 6, 0),
(100, 5, 10, '1', 2, '2018-01-01', 22, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(101, 5, 11, '1', 105, '2018-01-01', 22, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(102, 5, 12, '1', 14, '2018-01-01', 22, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(103, 5, 13, '1', 14, '2018-01-01', 22, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(104, 5, 14, '1', 70, '2018-01-01', 22, 0, NULL, 0, 'C', 20, 1, 1, NULL, 6, 0),
(105, 5, 16, '1', 14, '2018-01-01', 23, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(106, 5, 17, '1', 35, '2018-01-01', 23, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(107, 5, 18, '1', 35, '2018-01-01', 23, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(108, 5, 19, '1', 35, '2018-01-01', -1, 0, NULL, 0, 'C', 20, 1, 1, NULL, 6, 0),
(109, 5, 26, '1', 14, '2018-01-01', 25, 0, NULL, 1, 'C', 20, 1, 2, NULL, 6, 0),
(110, 5, 108, '1', 35, '2019-02-07', 24, 0, NULL, 0, 'C', 0, -1, 0, NULL, 6, 0),
(111, 5, 109, '1', 70, '2018-01-01', 23, 0, NULL, 0, 'C', 15, 1, 1, NULL, 6, 0),
(112, 5, 98, '1', 2, '2018-01-01', 21, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(113, 5, 105, '1', 14, '2018-01-01', 21, 0, NULL, 0, 'C', 20, 1, 1, NULL, 6, 0),
(114, 5, 100, '1', 28, '2018-01-01', 21, 0, NULL, 1, 'C', 30, 1, 2, NULL, 6, 0),
(115, 5, 101, '1', 14, '2018-01-01', 21, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(116, 5, 102, '1', 14, '2018-01-01', 21, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(117, 5, 103, '1', 14, '2018-01-01', 21, 0, NULL, 1, 'C', 20, 1, 2, NULL, 6, 0),
(118, 5, 104, '1', 14, '2018-01-01', 21, 0, NULL, 1, 'C', 30, 1, 2, NULL, 6, 0),
(119, 5, 105, '1', 14, '2018-01-01', 21, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(120, 5, 106, '1', 14, '2018-01-01', 21, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(121, 5, 107, '1', 56, '2018-01-01', 21, 0, NULL, 1, 'C', 20, 1, 2, NULL, 6, 0),
(122, 1, 1, '1', 12, '2018-08-30', 1, 0, NULL, 2, 'C', 12, 1, 10, NULL, 6, 0),
(123, 1, 1, '1', 2, '2018-09-05', 1, 0, NULL, 2, 'C', 23, 1, 4, NULL, 6, 0),
(124, 1, 1, '1', 2, '2018-09-05', 1, 0, NULL, 2, 'C', 23, 1, 4, NULL, 6, 0),
(125, 1, 1, '1', 2, '2018-09-05', 1, 0, NULL, 2, 'C', 23, 1, 4, NULL, 6, 0),
(126, 1, 1, '1', 45, '2018-09-05', 1, 0, NULL, 2, 'C', 23, 1, 4, NULL, 6, 0),
(127, 1, 1, '1', 45, '2018-09-05', 1, 0, NULL, 2, 'C', 23, 1, 4, NULL, 6, 0),
(128, 1, 1, '1', 2, '2018-09-15', 1, 0, NULL, 0, 'C', 1, 1, 2, '128_6_2018-09-15-02-15-19.jpg', 6, 0),
(129, 13, 112, '1', 1, '0000-00-00', 80, 0, NULL, 1, 'AN', 1, 2, 1, NULL, 7, 0),
(130, 13, 121, '1', 1, '2018-09-24', 127, 0, NULL, 4, 'AN', 2, 2, 2, NULL, 7, 0),
(131, 13, 113, '1', 1, '2018-09-26', 115, 0, NULL, 0, 'AN', 1, 1, 2, NULL, 7, 0),
(132, 13, 113, '1', 1, '2018-09-26', 115, 0, NULL, 0, 'AN', 1, 1, 2, NULL, 7, 0),
(133, 1, 9, '1', 1, '2018-09-25', 30, 0, NULL, 4, 'C', 2, 2, 2, NULL, 6, 0),
(134, 1, 1, '1', 22, '2018-09-26', 1, 0, NULL, 3, 'C', 33, 1, 5, '134_6_2018-09-26-00-21-02.png', 6, 0),
(135, 1, 1, '1', 22, '2018-09-26', 1, 0, NULL, 3, 'C', 33, 1, 5, '135_6_2018-09-26-00-21-12.png', 6, 0),
(136, 5, 111, '1', 22, '2018-12-25', 25, 0, NULL, 3, 'AN', 0, -1, 0, '136_6_2018-09-26-00-26-16.png', 6, 0),
(137, 5, 2, '1', 222, '2018-10-02', 21, 0, NULL, 2, 'C', 33, 1, 3, NULL, 6, 0),
(138, 9, 111, '1', 2, '2018-10-02', 1, 0, NULL, 2, 'AN', 33, 1, 4, NULL, 6, 0),
(139, 5, 109, '1', 222, '2018-10-02', 22, 0, NULL, 2, 'C', 33, 1, 3, NULL, 6, 0),
(140, 5, 108, '1', 2, '0000-00-00', 24, 0, NULL, 600, 'C', 100, 2, 6, NULL, 6, 0),
(141, 18, 111, '1', 222, '2018-10-03', 1, 0, NULL, 4, 'AN', 50, 1, 5, NULL, 6, 0),
(142, 9, 3, '1', 60, '2018-10-04', 200, 0, NULL, 0, 'C', 1, 1, 2, NULL, 6, 0),
(143, 9, 18, '5', 250, '2018-10-19', 3, 200, NULL, 4, 'C', 2, 2, 2, NULL, 6, 1000),
(144, 9, 15, '6', 250, '2018-10-19', 3, 200, NULL, 4, 'C', 2, 2, 2, NULL, 6, 1310),
(145, 1, 4, 'Diario', 12, '2018-11-07', 31, 200, NULL, 60, 'C', 2, 2, 2, NULL, 6, 220),
(146, 1, 18, '2', 15, '2018-11-07', 31, 0, NULL, 60, 'C', 30, 2, 2, NULL, 6, 0),
(147, 1, 16, '2', 30, '2018-11-06', 26, 0, NULL, 96, 'C', 48, 2, 2, NULL, 6, 0),
(148, 1, 3, '2', 15, '2018-11-11', 31, 0, NULL, 72, 'C', 24, 2, 3, '148_6_2018-11-06-17-38-50.jpg', 6, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceso`
--

CREATE TABLE `proceso` (
  `id_proceso` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `estado` varchar(45) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `proceso`
--

INSERT INTO `proceso` (`id_proceso`, `descripcion`, `id_empresa`, `estado`) VALUES
(1, 'un proceso nuevo 1', 0, 'AN'),
(2, 'nuevo proceso 001', 0, 'AN'),
(3, 'Extracción y Transporte', 0, 'AC'),
(4, 'proceso nuevo', 6, 'AN'),
(5, 'proceso emp 6', 6, 'AN'),
(6, 'proceso testing', 6, 'AN'),
(7, 'EXTRACCIÓN Y TRANSPORTE DE MINERAL', 6, 'AC'),
(8, 'Extracción y Transporte De Mineral', 6, 'AC'),
(9, 'Proceso 8', 6, 'AC'),
(11, 'Perforación', 7, 'AC'),
(12, 'Perforación y Voladura', 6, 'AC'),
(13, 'Operaciones', 7, 'AC'),
(14, 'Mantenimiento', 7, 'AC'),
(15, 'Capacitacion', 7, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remitos`
--

CREATE TABLE `remitos` (
  `remitoId` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `provid` int(11) NOT NULL,
  `comprobante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `remitos`
--

INSERT INTO `remitos` (`remitoId`, `fecha`, `provid`, `comprobante`, `id_empresa`) VALUES
(1, '2018-10-11 14:34:57', 2, '111', 6),
(2, '2018-10-26 14:41:44', 1, '222', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubro`
--

CREATE TABLE `rubro` (
  `id_rubro` int(10) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sector`
--

CREATE TABLE `sector` (
  `id_sector` int(10) NOT NULL,
  `descripcion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sector`
--

INSERT INTO `sector` (`id_sector`, `descripcion`, `estado`, `id_empresa`) VALUES
(10, 'Equipos Moviles', 'AC', 6),
(11, 'Administración', 'AC', 6),
(12, 'Perforación', 'AC', 6),
(13, 'Carga', 'AC', 6),
(14, 'Perforadoras Tamrock', 'AN', 7),
(15, 'Perforación y Voladura', 'AC', 7),
(16, 'eli sector/etapa', 'AN', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguro`
--

CREATE TABLE `seguro` (
  `id_seguro` int(11) NOT NULL,
  `asegurado` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `ref` int(11) NOT NULL,
  `numero_pliza` int(11) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_vigencia` datetime NOT NULL,
  `cobertura` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `id_equipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `seguro`
--

INSERT INTO `seguro` (`id_seguro`, `asegurado`, `ref`, `numero_pliza`, `fecha_inicio`, `fecha_vigencia`, `cobertura`, `id_equipo`) VALUES
(1, 'empresa xxx', 1111111, 11112221, '2017-07-10 00:00:00', '2017-07-18 00:00:00', '12 dias', 5),
(2, '1', 123, 123, '2017-07-10 00:00:00', '2017-07-25 00:00:00', '1234', 6),
(3, '123 juan peres', 1234, 12345, '2017-07-10 00:00:00', '2017-07-10 00:00:00', '123456', 1),
(4, 'gemma empresa', 33333321, 2147483647, '2017-07-12 00:00:00', '2017-07-12 00:00:00', 'A', 0),
(5, 'gemme empresa2', 52652, 500001, '2017-07-12 00:00:00', '2017-07-12 00:00:00', 'A', 0),
(242, 'empres hugo pepe', 1414, 14145, '2017-07-12 00:00:00', '2017-07-12 00:00:00', '12 dias', 0),
(243, 'gemma nueva empresa', 56213, 56213000, '2017-07-12 00:00:00', '2017-07-12 00:00:00', '1 meses', 0),
(244, 'nueva emresa julieta 34434', 45454, 45454, '2017-07-12 00:00:00', '2017-07-12 00:00:00', '10 dias', 0),
(245, 'gemma nueva emresa 41 poliza', 54540, 545401, '2017-07-12 00:00:00', '2017-07-26 00:00:00', '5 dias', 242),
(246, '', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setupparam`
--

CREATE TABLE `setupparam` (
  `id_equipo` int(11) NOT NULL,
  `id_parametro` int(11) NOT NULL,
  `maximo` double NOT NULL,
  `minimo` double NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `setupparam`
--

INSERT INTO `setupparam` (`id_equipo`, `id_parametro`, `maximo`, `minimo`, `id_empresa`) VALUES
(1, 22, 12, 4, 6),
(19, 22, 100, 50, 6),
(19, 23, 80, 20, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisactions`
--

CREATE TABLE `sisactions` (
  `actId` int(11) NOT NULL,
  `actDescription` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `actDescriptionSpanish` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sisactions`
--

INSERT INTO `sisactions` (`actId`, `actDescription`, `actDescriptionSpanish`) VALUES
(1, 'Add', 'Agregar'),
(2, 'Edit', 'Editar'),
(3, 'Del', 'Eliminar'),
(4, 'View', 'Consultar'),
(5, 'Imprimir', 'Imprimir'),
(6, 'Saldo', 'Consultar Saldo'),
(7, 'Asignar', 'Asignar'),
(8, 'Finalizar', 'Finalizar'),
(9, 'OP', 'OP'),
(10, 'Pedidos', 'Pedidos'),
(11, 'Supervisor', 'Supervisor'),
(12, 'Entregar', 'Entrega de Ordenes'),
(13, 'Lectura', 'Lect horas equipos '),
(14, 'Correctivo', 'Ver Correctivos'),
(15, 'Preventivos', 'Ver Preventivos'),
(16, 'Backlog', 'Ver Backlog'),
(17, 'Predictivo', 'Ver Predictivos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisgroups`
--

CREATE TABLE `sisgroups` (
  `grpId` int(11) NOT NULL,
  `grpName` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `grpDash` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sisgroups`
--

INSERT INTO `sisgroups` (`grpId`, `grpName`, `grpDash`, `id_empresa`) VALUES
(1, 'Administrador', 'Otrabajo', 6),
(2, 'Vendedor', 'Sservicio', 6),
(3, 'Depósito', 'Sservicio', 6),
(4, 'Operario1', 'Sservicio', 6),
(5, 'Supervisor de Taller', 'Sservicio', 6),
(7, 'Mecanicos', 'escritorio', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisgroupsactions`
--

CREATE TABLE `sisgroupsactions` (
  `grpactId` int(11) NOT NULL,
  `grpId` int(11) NOT NULL,
  `menuAccId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sisgroupsactions`
--

INSERT INTO `sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES
(154, 151, 1),
(158, 158, 1),
(159, 159, 1),
(160, 160, 1),
(987, 4, 116),
(988, 4, 155),
(989, 4, 156),
(990, 1, 6),
(991, 1, 7),
(992, 1, 8),
(993, 1, 9),
(994, 1, 10),
(995, 1, 11),
(996, 1, 12),
(997, 1, 13),
(998, 1, 14),
(999, 1, 15),
(1000, 1, 16),
(1001, 1, 17),
(1002, 1, 18),
(1003, 1, 19),
(1004, 1, 20),
(1005, 1, 21),
(1006, 1, 23),
(1007, 1, 24),
(1008, 1, 25),
(1009, 1, 151),
(1010, 1, 26),
(1011, 1, 27),
(1012, 1, 28),
(1013, 1, 29),
(1014, 1, 30),
(1015, 1, 31),
(1016, 1, 32),
(1017, 1, 33),
(1018, 1, 34),
(1019, 1, 35),
(1020, 1, 36),
(1021, 1, 37),
(1022, 1, 38),
(1023, 1, 39),
(1024, 1, 40),
(1025, 1, 41),
(1026, 1, 42),
(1027, 1, 43),
(1028, 1, 115),
(1029, 1, 116),
(1030, 1, 117),
(1031, 1, 155),
(1032, 1, 156),
(1033, 1, 157),
(1034, 1, 118),
(1035, 1, 119),
(1036, 1, 120),
(1037, 1, 121),
(1038, 1, 122),
(1039, 1, 123),
(1040, 1, 152),
(1041, 1, 153),
(1042, 1, 154),
(1043, 1, 177),
(1044, 1, 178),
(1045, 1, 179),
(1046, 1, 180),
(1047, 1, 64),
(1048, 1, 65),
(1049, 1, 66),
(1050, 1, 67),
(1051, 1, 68),
(1052, 1, 69),
(1053, 1, 70),
(1054, 1, 71),
(1055, 1, 72),
(1056, 1, 73),
(1057, 1, 74),
(1058, 1, 75),
(1059, 1, 79),
(1060, 1, 80),
(1061, 1, 81),
(1062, 1, 1),
(1063, 1, 2),
(1064, 1, 3),
(1065, 1, 4),
(1066, 1, 85),
(1067, 1, 86),
(1068, 1, 87),
(1069, 1, 88),
(1070, 1, 89),
(1071, 1, 90),
(1072, 1, 91),
(1073, 1, 92),
(1074, 1, 93),
(1075, 1, 94),
(1076, 1, 95),
(1077, 1, 96),
(1078, 1, 97),
(1079, 1, 98),
(1080, 1, 99),
(1081, 1, 100),
(1082, 1, 101),
(1083, 1, 102),
(1084, 1, 103),
(1085, 1, 104),
(1086, 1, 105),
(1087, 1, 106),
(1088, 1, 107),
(1089, 1, 108),
(1090, 1, 109),
(1091, 1, 110),
(1092, 1, 111),
(1093, 1, 170),
(1094, 1, 171),
(1095, 1, 172),
(1096, 0, 127),
(1097, 0, 128),
(1098, 0, 129),
(1099, 1, 130),
(1100, 1, 132),
(1101, 1, 136),
(1102, 1, 137),
(1103, 1, 138),
(1104, 1, 139),
(1105, 1, 140),
(1106, 1, 141),
(1107, 1, 142),
(1108, 1, 143),
(1109, 1, 144),
(1110, 1, 145),
(1111, 1, 146),
(1112, 1, 147),
(1113, 1, 148),
(1114, 1, 149),
(1115, 1, 150),
(1116, 1, 45),
(1117, 1, 46),
(1118, 1, 47),
(1119, 1, 48),
(1120, 1, 49),
(1121, 1, 50),
(1122, 1, 54),
(1123, 1, 55),
(1124, 1, 56),
(1125, 1, 57),
(1126, 1, 58),
(1127, 1, 59),
(1128, 1, 60),
(1129, 7, 23),
(1130, 1, 181),
(1131, 1, 182),
(1132, 1, 183),
(1133, 1, 184),
(1134, 1, 185),
(1135, 1, 186),
(1136, 1, 187),
(1137, 1, 188),
(1138, 1, 189),
(1139, 1, 190),
(1140, 1, 191),
(1141, 1, 192),
(1142, 1, 193),
(1143, 1, 194),
(1144, 1, 195),
(1145, 1, 196),
(1155, 1, 197),
(1156, 1, 198),
(1157, 1, 199),
(1158, 1, 200),
(1159, 1, 201),
(1160, 1, 202),
(1161, 1, 203),
(1162, 1, 204),
(1163, 1, 205),
(1164, 1, 206),
(1165, 1, 207),
(1166, 1, 208),
(1167, 1, 209),
(1168, 1, 210),
(1169, 1, 211),
(1170, 1, 212),
(1171, 1, 213),
(1172, 1, 214),
(1173, 1, 215),
(1174, 1, 216),
(1175, 1, 217),
(1176, 1, 218),
(1177, 1, 219),
(1178, 1, 220),
(1179, 1, 221),
(1180, 1, 222),
(1181, 1, 223),
(1182, 1, 224);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sismenu`
--

CREATE TABLE `sismenu` (
  `id` int(11) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `number` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sismenu`
--

INSERT INTO `sismenu` (`id`, `parent`, `name`, `icon`, `slug`, `number`, `id_empresa`) VALUES
(2, NULL, 'Seguridad', 'fa fa-lock', '', 2, 6),
(3, 2, 'Usuarios', 'fa fa-fw fa-user', 'user', 2, 6),
(4, 2, 'Grupos', 'fa fa-fw fa-users', 'group', 1, 6),
(5, 2, 'Menu', 'fa fa-fw fa-bars', 'menu', 3, 6),
(6, 2, 'Database', 'fa fa-fw fa-database', 'backup', 4, 6),
(7, NULL, 'Mantenimiento', 'fa fa-wrench ', '', 3, 6),
(8, 7, 'Equipos', 'fa fa-fw fa-cogs', 'Equipo', 1, 6),
(9, 7, 'Componentes', 'fa fa-fw fa-cogs', 'Componente/asigna', 2, 6),
(10, 7, 'Preventivo', 'fa fa-fw fa-tasks', 'Preventivo', 5, 6),
(12, 7, 'Backlog', 'fa fa-fw fa-tasks', 'Backlog', 6, 6),
(13, 7, 'Registro de Parametros', 'fa fa-fw fa-tasks', 'Lectura', 10, 6),
(14, 7, 'Predictivo', 'fa fa-fw fa-tasks', 'Predictivo', 7, 6),
(15, 7, 'Solicitud de Servicio', 'fa fa-fw fa-sitemap', 'Sservicio', 3, 6),
(16, NULL, 'Pañol', 'fa fa-briefcase', '', 4, 6),
(17, 59, 'Articulos', 'fa fa-fw fa-barcode ', 'Article', 1, 6),
(18, 59, 'Stock', 'fa fa-fw fa-cubes', 'Lote', 2, 6),
(20, 59, 'Orden Insumos', 'fa fa-fw fa-check', 'Ordeninsumo', 3, 6),
(21, 59, 'Remitos', 'fa fa-fw fa-paperclip ', 'Remito', 4, 6),
(23, 16, 'Herramientas', 'fa fa-fw fa-sign-out ', 'Herramienta', 5, 6),
(24, 16, 'Salida Herramientas', 'fa fa-fw fa-paper-plane', 'Order', 6, 6),
(25, 16, 'Entrada Herramientas', 'fa fa-fw fa-paper-plane', 'Unload', 7, 6),
(26, 16, 'Trazabilidad Componentes', 'fa fa-fw fa-exchange', 'Trazacomp', 8, 6),
(28, 59, 'Punto Pedido', 'fa fa-fw fa-bookmark', 'Lote/puntoPedList', 10, 6),
(29, NULL, 'ABM', 'fa fa-book', '', 6, 6),
(30, 29, 'ABM Grupo', 'fa fa-fw fa-server ', 'Grupo', 2, 6),
(31, 29, 'ABM Sector', 'fa fa-fw fa-sitemap ', 'Sector', 3, 6),
(32, 29, 'ABM Contratista', 'fa fa-fw fa-life-ring', 'Contratista', 4, 6),
(33, 7, 'Parametrizar Predictivo', 'fa fa-fw fa-bullhorn', 'Parametro', 5, 6),
(34, 29, 'ABM Deposito', 'fa fa-fw fa-qrcode', 'Deposito', 5, 6),
(35, 29, 'ABM Tareas', 'fa fa-fw fa-street-view', 'Tarea', 6, 6),
(36, 29, 'ABM Parametros', 'fa fa-fw fa-adjust', 'Altparametro', 6, 6),
(37, 29, 'ABM Proveedor', 'fa fa-fw fa-truck', 'Proveedor', 7, 6),
(38, 29, 'ABM Familia', 'fa fa-fw fa-check-square', 'Family', 8, 6),
(40, 7, 'Ordenes de trabajo', 'fa fa-fw fa-tasks', 'Otrabajo/listOrden', 8, 6),
(41, 7, 'Administrar Ordenes', 'fa fa-fw fa-thumbs-up', 'Envio', 10, 6),
(43, 59, 'Nota de Pedido', 'fa fa-fw fa-cart-plus', 'Notapedido', 11, 6),
(44, NULL, 'Compras', 'fa fa-shopping-cart ', '', 5, 6),
(45, 44, 'Enviar Pedidos', 'fa fa-fw fa-envelope-open-o', '', 1, 6),
(46, 44, 'Recepción pedidos', 'fa fa-fw fa-check', 'Administracion', 2, 6),
(47, NULL, 'Reportes', 'fa fa-line-chart ', '', 8, 6),
(49, 47, 'Rep Informe de Servicios', 'fa fa-fw fa-file-text-o ', 'Reporte', 3, 6),
(50, 47, 'Rep Ordenes de trabajo', 'fa fa-fw fa-file-text-o ', 'Reporteorden', 2, 6),
(51, 47, 'Grafica de predictivos', 'fa fa-fw fa-pie-chart ', 'Grafica', 1, 6),
(52, 47, 'Rep articulos', 'fa fa-fw fa-file-text-o', 'Reportepedido', 5, 6),
(53, 29, 'ABM modelos', '', '', 0, 6),
(54, 7, 'Plan de Mantenimiento', 'fa fa-fw fa-calendar', 'calendario/indexot', 9, 6),
(55, 7, 'trazabilidad Activos', 'fa fa-fw fa-exchange', 'fa fa-calendar', 11, 6),
(58, NULL, 'Equipos', 'fa fa-exchange', '', 0, 6),
(59, NULL, 'Almacenes', 'fa fa-check', '', 4, 6),
(60, 29, 'ABM Marca', 'fa fa-fw fa-copyright', 'Marca', 9, 6),
(61, 47, 'Rep articulos pedidos', 'fa fa-fw fa-file-text-o ', 'Reportepedido', 6, 6),
(62, 29, 'ABM Area', 'fa fa-fw fa-asterisk', 'Area', 1, 6),
(63, 29, 'ABM Clientes', 'fa fa-fw fa-user', 'Cliente', 2, 6),
(64, 29, 'ABM Criticidad', 'fa fa-fw fa-line-chart', 'Criticidad', 3, 6),
(65, 29, 'ABM Procesos', 'fa fa-fw fa-sitemap', 'Proceso', 5, 6),
(66, 29, 'ABM Componentes', 'fa fa-fw fa-cogs', 'Componente', 2, 6),
(67, 29, 'ABM Unidad de medida', 'fa fa-fw fa-thermometer', 'UnidadMedida', 11, 6),
(68, 29, 'ABM Sucursales', 'fa fa-fw fa-building', 'Sucursal', 10, 6),
(69, 7, 'Informe de Servicios', 'fa fa-fw fa-file-text-o', 'Ordenservicio', 4, 6),
(70, 29, 'ABM Sistemas', 'fa fa-fw fa fa-cogs', 'SistemaABM', 12, 6),
(71, NULL, 'Mis Tareas', 'glyphicon glyphicon-list-alt', 'Tarea', 10, 6),
(72, 29, 'ABM Plantilla Insumos', '', 'Plantillainsumo', 13, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sismenuactions`
--

CREATE TABLE `sismenuactions` (
  `menuAccId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  `actId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sismenuactions`
--

INSERT INTO `sismenuactions` (`menuAccId`, `menuId`, `actId`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 1),
(6, 3, 1),
(7, 3, 2),
(8, 3, 3),
(9, 3, 4),
(10, 4, 1),
(11, 4, 2),
(12, 4, 3),
(13, 4, 4),
(14, 5, 1),
(15, 5, 2),
(16, 5, 3),
(17, 5, 4),
(18, 6, 1),
(19, 6, 2),
(20, 6, 3),
(21, 6, 4),
(22, 7, 1),
(23, 8, 1),
(24, 8, 2),
(25, 8, 3),
(26, 9, 1),
(27, 9, 2),
(28, 9, 3),
(29, 10, 1),
(30, 10, 2),
(31, 10, 3),
(32, 12, 1),
(33, 12, 2),
(34, 12, 3),
(35, 13, 1),
(36, 13, 2),
(37, 13, 3),
(38, 14, 1),
(39, 14, 2),
(40, 14, 3),
(41, 15, 1),
(42, 15, 2),
(43, 15, 3),
(44, 16, 1),
(45, 17, 1),
(46, 17, 2),
(47, 17, 3),
(48, 18, 1),
(49, 18, 2),
(50, 18, 3),
(51, 19, 1),
(52, 19, 2),
(53, 19, 3),
(54, 20, 1),
(55, 20, 2),
(56, 20, 3),
(57, 21, 1),
(58, 21, 2),
(59, 21, 3),
(60, 21, 4),
(61, 22, 1),
(62, 22, 2),
(63, 22, 3),
(64, 23, 1),
(65, 23, 2),
(66, 23, 3),
(67, 24, 1),
(68, 24, 2),
(69, 24, 3),
(70, 25, 1),
(71, 25, 2),
(72, 25, 3),
(73, 26, 1),
(74, 26, 2),
(75, 26, 3),
(76, 27, 1),
(77, 27, 2),
(78, 27, 3),
(79, 28, 1),
(80, 28, 2),
(81, 28, 3),
(82, 29, 1),
(83, 29, 2),
(84, 29, 3),
(85, 30, 1),
(86, 30, 2),
(87, 30, 3),
(88, 31, 1),
(89, 31, 2),
(90, 31, 3),
(91, 32, 1),
(92, 32, 2),
(93, 32, 3),
(94, 33, 1),
(95, 33, 2),
(96, 33, 3),
(97, 34, 1),
(98, 34, 2),
(99, 34, 3),
(100, 35, 1),
(101, 35, 2),
(102, 35, 3),
(103, 36, 1),
(104, 36, 2),
(105, 36, 3),
(106, 37, 1),
(107, 37, 2),
(108, 37, 3),
(109, 38, 1),
(110, 38, 2),
(111, 38, 3),
(112, 39, 1),
(113, 39, 2),
(114, 39, 3),
(115, 40, 1),
(116, 40, 2),
(117, 40, 3),
(118, 41, 1),
(119, 41, 2),
(120, 41, 3),
(121, 43, 1),
(122, 43, 2),
(123, 43, 3),
(124, 44, 1),
(125, 44, 2),
(126, 44, 3),
(127, 45, 0),
(128, 45, 0),
(129, 45, 0),
(130, 46, 1),
(131, 46, 52),
(132, 46, 3),
(133, 47, 1),
(134, 47, 2),
(135, 47, 3),
(136, 48, 1),
(137, 48, 2),
(138, 48, 3),
(139, 49, 1),
(140, 49, 2),
(141, 49, 3),
(142, 50, 1),
(143, 50, 2),
(144, 50, 3),
(145, 51, 1),
(146, 51, 2),
(147, 51, 3),
(148, 52, 1),
(149, 52, 2),
(150, 52, 3),
(151, 8, 13),
(152, 54, 1),
(153, 54, 2),
(154, 54, 3),
(155, 40, 9),
(156, 40, 7),
(157, 40, 10),
(158, 55, 1),
(159, 55, 2),
(160, 55, 3),
(161, 56, 1),
(162, 56, 2),
(163, 56, 3),
(164, 58, 1),
(165, 58, 2),
(166, 58, 3),
(167, 58, 4),
(168, 59, 1),
(170, 60, 1),
(171, 60, 2),
(172, 60, 3),
(173, 47, 1),
(174, 47, 2),
(175, 47, 3),
(176, 54, 13),
(177, 54, 14),
(178, 54, 15),
(179, 54, 16),
(180, 54, 17),
(181, 62, 1),
(182, 62, 2),
(183, 62, 3),
(184, 62, 4),
(185, 63, 1),
(186, 63, 2),
(187, 63, 3),
(188, 63, 4),
(189, 64, 1),
(190, 64, 2),
(191, 64, 3),
(192, 64, 4),
(193, 65, 1),
(194, 65, 2),
(195, 65, 3),
(196, 65, 4),
(197, 66, 1),
(198, 66, 2),
(199, 66, 3),
(200, 66, 4),
(201, 67, 1),
(202, 67, 2),
(203, 67, 3),
(204, 67, 4),
(205, 68, 1),
(206, 68, 2),
(207, 68, 3),
(208, 68, 4),
(209, 69, 1),
(210, 69, 2),
(211, 69, 3),
(212, 69, 4),
(213, 70, 1),
(214, 70, 2),
(215, 70, 3),
(216, 70, 4),
(217, 71, 1),
(218, 71, 2),
(219, 71, 3),
(220, 71, 4),
(221, 72, 1),
(222, 72, 2),
(223, 72, 3),
(224, 72, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema`
--

CREATE TABLE `sistema` (
  `sistemaid` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `estado` varchar(5) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sistema`
--

INSERT INTO `sistema` (`sistemaid`, `descripcion`, `estado`, `id_empresa`) VALUES
(1, 'Electrico', 'AC', 6),
(2, 'Hidraulico', 'AC', 6),
(3, 'Mecánico', 'AC', 6),
(4, 'Electrónico', 'AC', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisusers`
--

CREATE TABLE `sisusers` (
  `usrId` int(11) NOT NULL,
  `usrNick` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrName` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrLastName` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrComision` int(11) NOT NULL,
  `usrPassword` varchar(5000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `grpId` int(11) NOT NULL,
  `usrimag` blob NOT NULL,
  `estado` varchar(5) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sisusers`
--

INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrimag`, `estado`, `id_empresa`) VALUES
(1, 'admin', 'admin', 'admin', 0, '21232f297a57a5a743894a0e4a801fc3', 1, 0x89504e470d0a1a0a0000000d49484452000000d7000000d70806000000897dc4b50000373c4944415478daed7df77714d7b6a6fe8879e9cefc7267d65b33f7be993bebad3773efbc07f6c5016363636cc0986b1b9b8cc1981c6cc0062cc0e49c4124814012412491834822482401226392c9395a20f6d477c42e9dae3e15babbbafb74ab6aadbd105277d53975f67776de27e379412d4a652a9f518beabff33afdf5af7fa566cd9a51d3a64de9edb7df16ff677ae38d37e8fdf7df177f6bdebc39b56ad58abefefa6b4fd4b66d5bfafcf3cfc5f7f97eefbefbaef81dee05c2fff17bfcece57e5f7ef9a5f95d993ef9e4135bfaf4d34f95dfb1528b162da875ebd6d4ae5d3bcf734c34619c5813bcb3d5436a53aaf3a01d65a4f2e0ef2eae06162f16d33befbc23c00466f38b2900caf7de7b4fdc1f0006c3376edc58fc1fe073fb7ecb962d4d10e0bb0d1b3614e37cf3cd3743c61e09611cb8874cf5ebd7a70f3ffc506c3698bf8e40c32683b1620e433abc16804b376ad5e47525a022914cd1109e81e7d5a953c794924ecf6cdfbe3d7df5d55702541f7ffc719864659000b85e48f57d277aebadb7a8418306026cf17e3701c0d2005c597d5e33990752c34f09e585c0a8fc7c4809a7cf32b03ef8e083908d00520fbf0793f93936bc0bdc17f7c7bb514975fc2dd1efaca6012c25c15532b1b6a90a2693415845741a032405181daa1a3e8bef78b1cdfc268c031b023602196c9082005a32255aba022c2395edac6430a9ccac0c16bbcfc0d681e3831d1e60205dd4326c08506f99a959030000930db0747172a41cb8be6f55a50e62b74d2673b22303e071726030b00042bfd53f3f370acc876d39fc9b8c8d0bef07cfc6e6092f7000ae04d2b651b54d09906c866470d931219c18ac0abad964bab9c931de64a9b090a8505b01b04bf30270255c1dd4c1106770d9fd9d193495806595229823181d204ba43a0b6d4078609bbc1e802b1134beab1eea205393264d6cc1c5c04b55605941f6d1471f099025f2dde3997887f00a07e08a23413d605b40078683cac7992076bbae97a0722a112417e69448a70c7b63e11d0ec0156727861ffa3f766230079c0d883f710cca8990ae84cfe13bf82ed4d2bffded6f619e42fc0d3b3c185057e7851f3611361527478e9f8066fb0b664100ae38c5b49c5cde6eccc0f11d303db22adc321a908ec46944c8a8b0031dfe263f8bf30f75b00913618f41754b94fd05b3200097cf84a06234520b8002b30394f817cce0855815b1820d40e38c0a59a2599920110ca79314c37ce32da5d939046f71002e9f6d2daf520b8bccc1513f5448764bcb8156483ec4ae20b5002864a0e3b9e9ae0ebae55ac673defc7e534d3dcc48050fa1d7528e781adab83fc6819d5a4e9cad5bb7aea734a848a401242440ed96c08bcfe0b3894856f6b211c5730cb87faaa9875a83ab6983d7b5f110aa6c017617c79ae708c65125d846439c949b2c8f6222bc87a992bda12db8905f8617895d59771735c781220518ec42ab8d87cd04d9f3a8f5722a9e6482f4c2e7557561b8379e912eaa2ae77376fefcf5005c7eb8df75aa3f72531b3911d60d60f8ac0c2a9636727573b48410010067f58ae277c94c74f63b332615927b33747664a46a201620b19316f81bab7f708c000cb102ca2954c089c3b2644c6569964ace0d2dc1b5f8c7da664f8c74f2aab18d06a90249a292541cd806416a7b2504b8ed5447ecf6d60a683068aabe5fae04d73d354a4b7071f97ebad80a72ad12f7de90333ea29927544f6e9c1369d9bfb5794f2a828c4b5374ce9ccf0854c2f813676e346ad448002a96863100951c7793ed366e4ce344f89c0a8cc9aa908eb5cd82ce95cb19baaa84ba7b0923556162910e9c6e2483a25ebd7a022c50fba2b5c9f05d0052be6f2abd771eb7aed22b23f012c6bfb236daf817de81b5e705a4e0175f7c21eeed446ddab409495076031a545559754d0529c681655da59756e082f747a7d292681284d9a53ea84f37caecfd2d6d9b339cca0ba62869e3ec11943b2193ba75fec6d6f921f7b688d50665e021658b3b44c924f7fb48953c490e69e828bdb4021797f1ebbca89c06c5294abcdbd7af579726f4eb44c7964da4cabd391113800690e1deb8277b13e33917d87e9070906e72176004b0394ee6256e17d85e2900ae487209e3a96a80a955f97daaf4a4be1dbfa2a2ac215101ca4ae7564fa56fdb274f1d06d858aa414d4c155b4c57db2b434717bc9fe9320c1455d9092464245d6c9b7ef43e756ed98c660fee4ea539a3e8feb639be80ca2f7ab87dbe5037772d18432ba7fd4ca307f651aa9c5eabadf1fe20c564f554c7f0084b2fdde25e19bab9e0a32d8ab4d618a9dcd54e04b50ec019dabdad099e93cb2768059e6869c5a481d4b3631b73530133ca073778c93861a91d8b832611712f9db2363274b3b7a2c9e8e6ba2b6600ae24c6efe49d77d384be543c63a049250b46a40578bcd08d4db3e950ee185a337980d844ec3619b9b8940f72b0e643e23deba62672c843a79cc38c54b5b73851163b166792ab623e48fbc17dc7f46c4b8fd74f31e9c9c6693506587604c90cb0415a0370ad9a35b2cde2e02398e4a394740af473cea14eedd83252d1dec2ae8a933b0028a773aba0cee073f5df799baeaf181702ae8a1d736b3cb89c4007270dd463386ca0325bc1266786e81293e4f0852ef55eda80cb8bbd05b0e0334e4d6364e2de0b33fa770c01d6e30d53e9c59e850190a290727660d3c10ee37a2f5ddcf25a808b3b3cd9c5b7b831a5b5418c13018888d5a8a4d6b3adb302c0c448b9a3be0b51237589878933da1abc1e80cb7ad6962a680a607df6d96711e7cdd94a2d835e142f0800e2135d593b5dd86c9066906089e867e8c5b1a14323d10c9df309f96c2bf9ac5ff9e8d368a4d6934dd30350c4496d441c30d98e0ef0892e312f2dc0a56a4483b41c6e5ba63aa5315aa9153832e24708aa438a25dbd1a14b9f8d0c5d9275bdec76c81af02ab5704fabd4122a61e0c8883bc1cbc88e8e64a4b28953599a04e0329d195e82c790645efa46e07e999dbe0a03d6d32d3303e64f10c195cf5ec544079c39d85de3c1c5ce0c2f3b9c177b8b4b26cee58e0c54428decb0449ef1c581ee1a0f2eee05ef2521d4c9de423099539d3a356f1206acc04b987c3b2c516a22b75fabf1e082e1e9b538d24e0db466b42387d00aacc04ba8871d96881e8a9ca951e3c1e535139e8b14e5fe0f728759fef9930fdf534aad67dbb20226d7404d9403cff16a8a83fb2243be46830b39605e8f376567865c8a0e40e1bb68ac6997a0cbf47cd7fc80c1357276346d583fa4512927063bd9d36cb3b9991000578d77c5475266026706979f6331acf9854e8e0c50c0d47a1152d050f68358246c64a6e68dab5a2780b0a6d83cb1d67267628464dc6abb6a3cb8bc7a0ab99608c0b24bdac5df5a7ed25009acc0ded28f7edb3e47b956eb26f477945e706a790922d7f80c0d2f6dd4a0066227b26bffcccd62709f85995dd4f65690a8ab1d3ddf9d1db64e47e60fa1c9fd3a39820b1a4c90fee4430d1774702f8715a0aecb49250ce25b7a92759da026b6f8b491e35ac3f6f67286b20e15c9193a7a0aa1063668d0c07337593836ecbc848133435f7aba794618b8b821a91db93933588ba9d159f1769e42a88868b1ccfd1bdc32e121d59cbc848133436fa786bc4e884fb20d6e475e03c8351a5c2a4f2180c4ad9abd6666b00b5e15380e9c199a3b358a6687ac153c87225669a3b1a071a91bb8b822a246174b469253e8042e4839bb0cf820595773a786a1aeabc085908bddd965a992b49b54704572e0829bbd65e7820761770c1839353c860c2eebf9d01ce772f31406e092720abd767b8ac5de0a3c85a9e331647001541c4866421c13c726216fd0a95747002e8390fbe5256117fdcbedc0c5c66bc1c85e81a7308dc06567734155e433c5e04d56693da261694d6f50136dc2ae2abe85e0a31db8823293d471c7bb810b6a211f7d04e7864a82e952e29fb2e0b29e236507acc00d9f5ee092bdc87cce9835cf3000570ce0b21e6de3143c46f3cf80815327d6c5712ebbfc51b7b3a4c12b01b85e810b866a24e0c28e06c316df6367865dd5b170c31bbb62c0c0a913eb4286865c4c19690059b7635c93ee2d744b676170613793b3e20134bb463401b86a26b85872e9724e57d283c86ea7dce3857129bf7ce802834bd59b300057fa81cb4b00997bc5eb728c50d2c0c52dd5dcaa900128b85ead117b4e73b14b7b0a4afb53832a76ce0b2939c19ac259150db8582dd421af30e959f16eb12e004a052c195cd8ed82ec8cf44981625b3c1670e972ba6452c1c56dd554f10afc0e1179bb18171fcb6a975318802bbdc0e525f54997966a5a800bbab1eae820d8596858e29453c8e0728a7105e04a4d70a9ca4ebce4a006e052f489b7bae41b356a64561f0368aaac787cc731c615802b25c18535659e9009315138b19c4006534197d4276d9a82cad9f1388b0bde41008aa3ef76e0728a7105e04a4d70614ded0e43e7aebd00912a84a34b4b356dc0c5aa21fa65e085e1c559fb24c8e77405e04a6f70216ea94a81c206cb7985d87c91b86b0de304e0b2d0a579555e43804555856c77ba0902ca01b8d2bb60d2cee6c2d96d001b7f46ce88479d60002e07d5d04bf2ae5bea5300aed404975d20d9adeb934efd0ab502975be75dd5a17701b8d21b5c886f46d2f549b7d4276dc0e525a08cfa9d005ce90f2ec42d55b12e37573cf34400ae0803ca1c54b6562007e04a3f7071ac0bbd51a201972ea94f5a818b55436b40d9ea31e4eae3005ce90b2e8e7545022e789b0370b9a886f0f8d8e9d42cb1b80a3900577a828b635d724ea91bb8746a06aa25b85835c44b55810baa021bba01b8d2175caa58975b6ea12ea7496a0b2ea732143e94418e7305e94fe9092e552f0db7ac789d5aaa69092e1072c354aa2132e465352148dc4d5f70a1559e35d6e5055c3a1cd5aa35b8c6770d570df133525de44c0d2fe08aa495f583c20974b76064085dcbfe912e4eed664bf83b7f16df8f85c970af5bb9837d3954ae7c7073f16f2cf790df83d33b0061dcd677e7f5f92a70a902c96ee0023fe894faa425b854a79f708a8b1c4c763ba6d54b993f18e04a561f2aedf61e15b7aded1bedfbe64d3afa63533a3da2750808550c87dfe133f81e40112bb8f02cdc0bcf7fb2699ae346c2e0c0670ff769e8eb3b0061fe7663302b9177cc0d5b3755accb0d5c3a757dd2165cb26aa88aca73bccb4b25b21db898a10102bf19ca0b8191c1d020790c7e482e907c4f7e8ef559892427a05b4f3ab12b9a743be1049fd729af505b70b16aa86a5ec3aa219236dd7a68a8c0851d3b1ebb74ace487d4620248759b1f808d0dcd2bb870b806bcc3d84499e06e577992753aaa557b70b16a886a64bbdef15eba3f3dd918ba5bb2faa51b9d1bd731261bc94e3d4c96a4729362f25cedc0e556d7c5f698aea94fda82cb2d531efa37ba42b9f52de476d6584c2caa5245fbfe633a33ba1d5d9ed5cb906a23e8c19a712184df5d9dd7cfa4f313be119f9709f790a9a4cb3b11d925f1f2c4c1b68a0460d67994677e1e3657f95d5ccf1918f6be40f83d3e8b77beb7e31b4a29c60e2074e852ad1b4eae41b805d20a1ba94c08cb40ab41612d9f3a0a5e58fc63ed005c9116515ac125bf50b74032747dab1a08c601485460f29bace0b412fe1e4f573798d8e9f9f19e3f08cf3939ac4518d0a0a25bcf45b6c6baac591a300bacb6b88ed9195a83cbaebf865cdfc53de3ed807577d908d3138885c54e7c2b7f4842182a128a772c49a7b95e98da950ef67cdf04d88d9c41cab5e358971c484ea5d427adc125a743a954433777fc8355e38c45fc804abbd6130b6a95529bc7f5a4293dbfa2e1df34a34fdea96dd29ffef8dfe9f7bfff7dd424df4b45ad1abe259e092a18faad1887df60bab07a32ed9e3398660df886c6f66a4d3fb46ee43aae776bffdf98e68deff3bdba34ab6fceaf7cfe4fb6aa23363b6c7ab77287d8c6ba2201176cf5005c3e64ca433574eaba7b627073fa75f6f7228e222f2a00152b80fca63ffdcb1fa8478b460210d102eaee962c01a6fa75fe5dabb9f186a3021954766817582b6c862a70c9e5fea994faa415b8eecfab45a706d50a337eebbda14e87421f052e33b07a0cb160f2b1ad4fb7ce148b99fd433b73c15b37fd9046f6ee40d30676a76d73470b7ab27f45ccc4f7b2a35593078be782308677ebd40e61c4b69fd41740890458eb26f5170035c1fa3fff859a357c8f06756b4f637fe8463387f4711dd781fc2931cffdf49a392173fcf19b1654ebcfff664ab62b4b475683ab707cc899c8f29ac98164f60a3a0591195cc21bd9a78a970270bda23b59b5685f875a4a0f56df86ea4c79ced6c0dffab4fdcc35bff064ced05752e28fbe30925ff4ec60215dd8be9466fdfc3dd5fef3bf8a31428a45a20232a87ab46c42ebb24652e5c9a2107a51be35a973ecdae25331beae5f7c6482eb595156d8b1adaa40b21770712a9ce98dec50c55301b80cc26e230753e5bcb51ddf37b58d79e18543aa21e0e87618c3a08e9f57eda086a48898414ad7d0833d057473c3fca8e846e10cdb7b57946d344170b7640dd5fe4bd54e0fd07801178088cfcf1ad28b2a4f6c0d0316d3b3436bab9f5bb28a1e1f581bf57c6eae9b4d0f76e64624cd79039081a5ca2bb4828b4b8cecc0c5279bf468feb1e01d339ed62700173dcaa90616f2fc540cd4b96533e5595ef83fab046e591a2c15660ceb4fcf8e1755d3895df4dbe9bd215471e1083d3d534ab7f6aca36bdb0a7ca11b3b57d3dd035be8c989e2ea679dd94795bf941a544295678ba9f2d4766afb59e32ab018f6931770b13a5856984d95a77756dd07f7bb78902aaf1cada6ab27e8b75f0ed3c3a3bbe8f6be0dbeceebdec12d61eff059f98e90f75cfbdfff22c65938e17bc7a45d99eabff3b6990265072eaee32aca1a22ee091e627e026fd568705d1e5bcb0c2cda6529ac993cc036e6c59e22abc7b0f5477595c6f5c5833be8c595e30240760410dc285e4f4f6ffe4abfddbd4987776ca69dabf3a864e3722a3568cbb21c9356e56653c1e26c2a5c9a43bb3715d0b6b54b6885f1bbc78f1e125f4fae5e108c787377213d3a5e2c18fcc9a9fd06c39fa497d74f9b54796697b091583574b3bdca72ab2582905006a8e4fb313dbf748c9e9d3b448fcaf7d0c363bbc5586eeddf4295cf2bcc3196eed94585c67c766c582ee6803981d6e62f30e7ba6b4d1e1ddc5c40fb372ea3adcb73e8eee5f3e2fd3c387d44800c730a799717cb8c671fa5e7978fd1c03e5d95eb513acb3e3714314c2770b1d46ad5ac5148de2807cec15b351a5ce5fd6b9969314e8cd4f4a3f795dda110a95725f0d6fa3fff3b6c2161e4575eab6668fc8c1dfdc5af2704e09e9e2e1100b85bb6c764bc8adf7ea355f90b69fb8665b46b6301ad5eb2d0643c2b6d5d932f00b665cd123a72603fc9d7c3f3e582a91f1cd911062a3116481703200c2e73ccefbfa92496c421e032249f3c3f2b619ed7b7afa4eb3b568700cb9ce37acc7139adcc5b603bc7220378aa396223c27def1f366cbc5fcbc3c671b1748b125c0b0776f4042e5525326b2da539a3427885b371c05b351a5c6c6fa9923a659a3db8bb3299979d1a568fa16a21f32619aac385034ac6831a7863f75a7a74e94c08286e5ebf461b57e586ede82a82f42a3676f69d0683eedaba91acd7bdf2520130489110605d2daf52e90c80600388c6ddbd3b7f7a15c0ceedb50518d44100a0e2e1bdb0396e58e1718ecb1651f19615628ec5db42e7f8e2e963ba6d6806774a360b2087ccd15057ebbff5d7b0718ffcf6734fe0b23605e57587c960e515ce214db6dd9574709576f606aefbdbe6d0476f8597a27033482fe03219d0b047e48587ba0435c9ca74cc789b0c9510cc74e9dc09f1bbf2b2c3b68cb7c7603cecfe7b8a3691ea02c0c0e426d3c13682c479e578a8fdff4283b9885b21102c135446d9f56e6e1cecc000500d4928cf118056014b9e63f1d6d5f4bca24248b2d54b17bbccb180f66c57cf1152fa56f13aa18e0aede0fc3edb8dc32bb8acf63667e75c593bdd165ce0ad1a0d2e76c1cbe082de8c4c71ab5b7e52d3d7949d79553986efbef6677b7031035e3a4c8f4fec153683ac26c9176c27482e06d7ad1bd76dc1b5d55095185c470f9590dd75ab641b3d39b6bdcaf92079f4ee96ae0d092c237ee51434464c8c3f8f98569897104c7df98829b5601fa92e8009e0dabf633dddbf7353cc71fdca652e732ca0c3fb8b6de788675ddfb68c2a8e6d36c7a302d7cae1dd3c814b6567776ff09ab29485c105de0ad4424b3d1332c5ed32b71154b6da5ed0bdade0da36f13bfaa1759310908580cba0fbbb96d283b347c9ed2ac8994dd9937fa2c5d387d0a2a9836958dfee34e4bbae213466606f5a326b18e5cd184a73c60fa4cb17cedbdeefc5b32774bb283f0c0c903e3c562760c9c40083c47372c33f3c77dc718e6b97cc37e73867dcc0b0f981a60def47cbb2868b39ce759923cff3669101b0a39b42c0858d0376a393d492c165b5b7a0bd800fb6b4aae60b1960ec92aff16a21834b7668b0f710ff1e1bd08cce8ded20e848df4662b7b20695dddcf14debbd1e062e2cf8f31be7c9cb75e7d64d9a3cb40fcd1ad99be68dfb9e164dec47137fea4a13067631a82bcd18d693161960c81ed797660eef45eb0a725deff9f2c5f33010f468d7dcccd2f0daebe245f102139008462b0176fd4cc473cc3668dc80ce345eccb10bcd1bf3ddab397e2fe6b861659ea777f7b2e2a970cbcbe0429ad78b3d0b1d81c5cd41012e64e3581d58e33bfd4df086bcf15a1d1a351e5c72ca13bf1c2e83c7ef9077c62ffbd2f49eb4f0f3f0f66b1cebb05b244830113b1ad62f9cf12e1ea2970f6f8a5dd6e9ba72f102e5cc1c4bb347f7110cb670423f5a3cb9bfa01c036cd9e3fb52d6e8beb46fc7667786bb734930bc752c485b62e6f304aea2d954b1731e3579eb3fece7c72efa5bbfd0cba70f5d01669d230005c2cfd83ce68efb818ad6af72955800159ec98e1a797e0890bbc5b838888c0ecbb2d4423201e25f488f6270710f10ae11637e026f0571ae572f032f07c99c202e5547d634bf6c644fe37778e9b26ac83ab8dde1e370f70a89f059635bd5094c003be8e985635471ffb62de31c3db88f8a562fa02d0559b4f515ed285c4807766da0278f1fbb4b2b047815cf4710985526cf5d9a0c703ddb3a8b26776fee3ebf57f4f2de5557f09f3a7a90766dc80f99237edebb75a5e31c1f5f38414f4eeda3e7a78b6de7871082684c636c0a4ec03a327f48586c939d575c202bf71e1149c0afba70f1ef6b7c9c0b3960fc32509a2e0792593594933af1ff0ef543ab94195c76cd6a10a874b34b647ab27f253d3abc996eee5c498f2f9f71049bdb855dfcc5fd1b229e26efe256824322d2bc42c1a01ba6d2a99c9f4dd5104e11d73942921920abb87b8362b9f06eee1ddf4f77f7aca6472585a66da522b62759e5b52befb7164bcae5463005f03b008f375af088ac2673f72b50b2f30bb5c82db42b79678fe1f50503aa7734c3eeca6c14dac086631e4e9da038a86c756ab85145f936e1f8b8b9355f18e737f76e104e1030961d09862bdd44f7f7ad1140f5f21c76c1ef9a9d197143cd7b2b460b0741984bde6d6e0618303780e3dee11d626e18bbddbc10c3c28683770187cc9303859e9ef3e2c436d3deca1b5155bf869e926ece0c6b35043651ce238589c0fd47e477223bc382c45dc9a981aa616ba726fc1e7559fcd24f0f6f6dda5dec92f702ae4599df56676944002e5bef5bf1322539edde76045b096383e325925213760a402dda95f593299d3d492f07a96d37b768ef59b6665e884a28c06553de2fe715c25165b5b7166676117f87838b5b05c8ef842bcf83c4dd57746144a8dd25bf2cb13b192f925ffa2f933a53618b2a70f1cbf7022e560da3915ef12478f8785cab47455e950cb510a5f24fb7cc300b25e175d4657eb29750f6823a010b79a2aa7826d61b2aa10c2e6bbf10e623f05400ae578592aa7805bb55b1339b4574868ac84e8d48c0f5b070a2e992471a8e2e8cc759f0505be19c88145c900000d7bd95a385cac5401559f21acc6fdd9cb1d59bda2b2f28c2074ee0e22a646ba2b6ec1106b8acf9a872eb3c1d0a26b5a944e64c0dab6a089dfaf6929f435fbef1b996ef5657287b01d783d5e3456099171a09b2c9663c560741181baaa623eeeb5e345b800b1b10becfb657aceaa11f84e7b3fb1de3f25a6ac2ce0c3933e3dbf66d43120544ecd3626fb14a98eccc0cedc025c7bb64d510f539d0ab43dcb47d1b098f612492ebfecab12131af488d7fbf09aaa935bf0e3654c4a784ecce16e0124e1f4345bcb379969977e8877d190bb0385117e3918b3fbd7a0a65700d68df5cf432e4cf5c9bd73fa4fe4f5609931ddfd20e5c37a6a955438e5dc82f1f4e0d780cb93a99c16517e7aa925ce3846a889fbb7ef6417569bc619f247a8707b07847c758223d9125acbbeefc1fe8eadcbeaffa344ea7b2c5a34c8025637e5005d9fbf9a73ffe0f3abc6058c878a1fe3a810b6d1bb09eb24a38a4fd6721c9d9584fd99921ab84e0a5005c123dcd57ab86fc0265ef12bc8748e2fde293506fa1d3823d5c33412c08ff1f09a372cd176c1f3045bc9d179ce2245a0ebcf667baba7c8c180f54a568c17563e140012e9e1f009637bc87f91c307abca534e606555bceeac7c681f959d55d374f21b7b296c195d5ad79886682f725834b5609c14b01b81c54437e711c549617044165b8e37ffcaa9167703d5a3799eeaf1813f23b2cbcaa6259ee9c04c045e35d04b3e1bbb807806bad6562c653f5b48ff8e085bc21025c77974beab3a122164de9272487aa2b14ecbd68e785ef01ac3c376b990c362db908120e8c100fa74bda930a5c0b0776363d85d6cd8843363aa984da814bced6b00694adbbddc68ef528ab5dc3b0e0a21359c1c5840c07d862aaea6515f0dcc8e9fbf058c279213f3f1a47866cbfdcce1f6ad85c3fd2edbca16173038061d3c920b312c0e1362755a1a395b051592b8b2145ad366234e0da3c7940c8676470c981631dba3e69db14948b27414ea76120a17779db7a26b8dc7ac60b70ad1aebfa19000d2a231812800318bc80ce0e48b8c7b4dead04a05852399dc4122db8e02d943359ec627d3c370021967981701f9e9b6d6b3b4b5f14d561776ee0ead1be5558575e39e589f925d9c591da834b4ee4459e981db890fe2283cbe92821593504b97dce0978602437c2e7bcde3316a95515449e22c05525bd0644352f2f73b2db1c1cc9504dad1e50374fa10a5c39df34529e5e239fa4a943a2aef6e0925bada18cc06ec7e3c44d06171af77b597091d3662c7ab400f393dc8e95f5420f0b2798e082ede5453a27848c778cc46255d03b1270416a21f462bdb75c9ea44b2bb5d438fcae7f78cc4b157844390aa7c5389d8d6cedc0eb45354904f3c1fe88155cb2e4023d5c3b31f99b870db0385dcb0bb8384120bbdd0721e96ff2a6843213b3996c7ffdf8584b70c9312f0e14aac005bb6b64bb4fa9cfa7ef452c2db0f8b07792c580b1aa8366f26ef102bab36498092eb8e3c5e6912480e1fdda6d1a6e694f32b8b061426a59ab22e435d431b69512a79c70cc8bf3c75465e15c7630a9cd871131809c550e4684472b51cc8767f9052c956a08a031230bfb26412083ba6d27ad42eacf3cdc0bf6332acd21b5b0be762dca5925d425dd2965c0a52aff579dc185bfa35189f5081a2752edac6046303db207fc9468b817765a30841f6aa092698d71cbaaa115bcbc8970e532c613f586628055ccc7b80fee1749f0db8b3343548e6776a18e9f35367ba8a8547bd94ba8536c2b25c0757562784059c51038e0ce5af3e5974a06c68996a2c9138c8510586770c5eade8f177971667089ffa2165555e828310a5b3f4302721b085d5542adc12597a1b04b5e753835f20cad8d6cdc289ad20edd49560defaf1ca3e518235151f9fc64d5a993d032e4be96baa43ba5d4c992d6445e55749febbb4abad48b48554b3770614eb26a684d394a3679c9ccb08659e4e644d68c0fee0e76a887befc9b52e0b2532d9c76393b4ab4da166fe24c0d263f62687edb855ed786ab8c55da08abf4baf4264c5970712a949c6768dd01616b416ad9e9e7b676978b672bd9b649e5fedc88c17525eb3b01ac7b05a3844b5ea739b99599a8ec68a8fc76798a01b8e2d08d9777c1ab73fa86b5bac6a278b6bbb665259de1acfd424c26dc30852a0fada0ca927cef6ae1e6e926b8f07e50407967d9707dd4568fde493866aceb8a0d141b8eac6d04e08a13b81099e79e8656b21e5c1dcfd4a398bc7b05239587fdc11901e744e5be4554796a87678001480016e68fffe3e7b2fe9f68012c2fadabadb14b99b0d65873f99ebcfe678704e08a290d4ace31941bede305730607ef64589c4883c9c920d591496c3799debeb2b5f4f2cc2eaa3cb2a60a6c2ef713e94fafa4217e3e35aca51ef696c7e031885b54635d410c22f9a00eb965b50e5d9e52125c72cb356b4728bc74b91295cfc255051d6d83c93154ffc64a2c8da1c2418a3e5a3729248dc9fcecd1f55459be992a8f6fa4cad2a5f647b8f66f22becf06bf4ee05285506c3b3fbd5a6f9654886761adadda4b00ae38810bbb98b519a49cc4e9355b03922299e0825d247bf8a2f5f6e15d94677e2100ca5918b8077e974af6166c2b550730c43903c915c7da2e59e7c66ea65a44ce35f3aa1a5aab64130dae4bd37b9860c2cf32c176f212ab8253042e6b7cc70ad643bd3f4c297bebc42b75dfda328d7bc0abcafa91c913802bc6b27faba45211ab8661f53f1ac6bb105e103d190d105c9bdf9ff676a81362c4e3ffe7277c630b30a85a722d131300c5e03afcdd4729636f41dbe078a5ca8baa5a67ddcafa530a5c486be19768ddcdd4eac7b488bd86898e773dda3e4f9cef7c61e9682ae9569f2e4cee2c807035ef67ba94fb331d9bd98fcaa6f6a60363bea503435bdbaa8ef81e6c2afc2b4badeb798614ccfa8e4e4ee9416593ba8b33834177b66489e756ec5ea0657ccb4e25b4db9874396c2165c105427a8bd7972e7b0dbd0694e39567f874e77cc1d060ec93cb26082acd19154625593f0952fd0d743067245dc81d16022c382e00ce638b465059ce08dbefda5159de58319ef3ab26d3b5f53304e8e29996158b4aa83a4dd3f420f6af1580cb2fbb4beeb0aa7ae958187ef15e730dfdc833843400830248670a26d1a1c5a3236678273abd7c82082c336143c0f3fc7c06e8f892717471cd54bab9719690b07e1472469aa88b3554c5ff542aa1cef6564a804b6e16aa0218f47339435a26afb986d124b932982005fc66722bc3dba9720081df40b6124bb768d4498024dac031543fabed25034bb74e4f29092e2e3f9101e64450235995b4e6a6796dffe524a1c06c7e333000c2aa23eecf7612c0e3654cf81c7f87a527df0fe41700b19140d5f5ac1abb1c70670d1c63ddbcac333ea3c3292669012e6bf1a48a902ac59e23feac57d5d04b9f763031a488574664c696999eed1b901f6a57b4c463609b10aa602420f4027a2f9d75adb984000c341539bea922ddd5c1940317b75d4349378004c2cfb0c9acbb98ac4a7a8d79b9310aa481d38e0e0605b326da1b170f6f263601a78d042084c3c60f173c1c4faaba2cac35d6d6badebab54f4b1b7045d383c36b3a94934bdec97900464cb7c24b1968762083faea870b9ecb4b52451a05e0b2b409f012f37272c9dbd95950a9d215585e36162729eda5a49fabc8753a992400578431324f8e0da98bab95a261ae74223b8fa89dede5b5a49f635bba766f0ac0e5c10982188a97645e956a68b773435d8a3c81755a585d52e29368a70917b7977432b39cc5b02723510dbd64c1735b3c5dce2f0ec015438ccc8b6343a51a42f5b3f3064692a4ab3a162919c042ac884b76909be805ec9050916c305e54427664e85c491c80cb8550a9ead92daf500dedecad48c0852037981a295c286a8c547a210e07492313ee877b3101b8008d4c76ae6c7c1663c07ddd9264ddecae68bd84dcf7241d1d1935065cf2a9295ea497b561a85d4e6024e09241022080f12135ac60b0922aeb3d52e2424300dcae54271670595df25ebc849c91910a591601b83cbae5bd94a25803ca7e824ba5a681e159fab8818d094091a516ee214bb5447a0cad49bf5e5442ac43ba4bad1a032eb92ecccb017172aea15dd6821fe04a0777bc0c2e2fbd09d9fd9eee52abc6804bee24e5457ac9e5ff4e09b535055cc83cf1022e2fbde06b8ad4aa51e08a447ac965284e397635055c761e5339d6e5a5bc84a596ce2da80370c528bdbc780ed9b1e104ae9a1244b68b73c9592a5e1c199ceaa473697e00ae04780eb9fb9213b8e259c1ab13d93975185c5e9ad0705c4bf7eae1005c3ec4bdbc646da0afa113b8e2995bc871281dc0e5548a820dc62d23839bcfa46b0e61002e45d686f5206b95f472dab5518612b723770c6023f70eb12eabeb9d83c6877a3510764cbc33e39d36987b5b677b2e86d4b9c76000ae38e41cba65cc97e78f498a53831d04bf4cec5cd576ad4d2d938e7cdfc83c49d34ba1672c84921aa7f9df5aebadab533aa73905e08ad2357f74e1705faa726339e6146ad5f5ec0182acaaacdf879747626f952c1841d7578e77540739cd29958a1c0370f9e0dcf092d47b2e7724edcf1eeed8c0259ed2cba93559bca516bca14e1bcbded983e9fa8a71813a18802b3af510e0da9395e958f29e88aeb5e2047b8912d1ccd42e1b1e840da778c6c088cbf70370d520e2bc43bb83f32e2d1d2d9868dfdca1b68c164947a47471c163c3b103175adab177b026aa8301b824ef211f0fabf21e42ed0113814a168e4cb8d710aa1982b8567738aa83e36aefedb40f4360a3e177a2b2b3d2b92f4600ae18fa225aedafbb6b269a8cb477ce10cfa5177e01cbade9288097c8ac0c6c30fc3e8ecc1b52e34af70370c5687f593bf5323381ec9c1bf1706c38b57393c9ef1e8800b55de0184e0c3b7041f2d7743b2b00974b5f7a6bf606984806989d7ae8b7f4f2daa4d3eff66e7689bafbe70f0b790f70f6a84a496a52164600ae283a46c16e60809d5818ca5476de433f6d2fb7cc88783dd7ced692d541a65ff247853830d2b9d94c002e1f83cbb207913d8632d9790ffdf21c3a65a2c7331c60e72164efa04c70f6c8c0aae90e8c005c11808b01767de9a830c6b2b3bfc0e87ed8404e6ef07895bfd8a983b2775026c406195848880ef8270097e743ce39c30000db33b53fed9d39288c0e2c1a45070d40c954be6c7ccccc6ebda71bdddc149b5b1edf57ddb774c108e5bcf74ee865a636d5e42c8c005c51824b762dafedf82e151b00db376b5008ed9f9d49071755492c994ec40030947158efe746bfac9e1235b06e6d9aa5bc274eb5b4ce17b4636c4f5adffeed10091f802b0057c4e062806d6c599b96b4799b768deb691eb56a1eb93a6f281dc91b1b46e54bc7d383a2b951d95baafbb9d1a31d91a9a315c50b6c9f7538770c95ce191c3657cc3faf451ddadaaab699e214802b0057d4e0021dcf6c4eb95fd4a67c83b1768fef49a5b37f0aa183f3878a80af8ac0c08f3d32feddadb36defe346c7f2c7797a0e407563e34c3a6180dfee5e078c0dc33a47cc1bf3cffba23ad81e802b0097277ab1a3133dba788a0e0f6a11062e50e998ce94d7dc90602deb50d1d0afe9e09ccc103a9cfd331d5b32ce9620c92e174e13f6cdb35dd9610c7f7dc34cf119a77b78213ce3a1213165c2bd11e83eb36292ebf7310febdc305fcc1d74787cd7ea00bb04aeca0b6be8c59171012f05e0b2d0ea7af4f2f1af84ebf9e3070260aa3cc3dd63bbd35263f7ce3776ef75bd3ea5fd53fbd1a1b9834d3ab2609868bb96aa84f1cbf301619e982fe68df9df5b33310c5cb7f7ae11efee65c5037abebe71c04f01b8aaa9f24c2e59af67659bc300767cc1cf543aad1fadeaf01e2d3176f1658614db3db2b3c8e2602a33181412e8c4b2092945280c95e78179f13cf1efbe497de8d4a2e11675f94b21ede5ebe5cd03014f05e07a45c64e6b77559cd917c24cd70a0c9b64fe103a943590b667b6a1a5cd6b09da36a085f83dd3510384f0189e5c3e417bc2388f2e1c1632fecdfd3e37e7b6ae7b23315ffcfed62aa9f278f32caab87545f9de5e940e0ec01580abca5670ba9e5f2e178c64f6855836968e197649d9fca1b4775c0f2a30a4d73263775fdbf9432a99fc9df8bd20e33308069f5a3e515bc2f88e2e18668e19e35f6d4829cc6765dbba21f3b9bc744c75e3d4ddb95479ffa6ed3b838a1d802b905ae4e50223c9007bb876325d5936868e1912eac89c9fa8f09bfab4fccbda82b60f6a297e2fc89008a70cc90047826e8471f13831078c7b45ab3a620e1b7a3416bfc3dfcee68e10a53732b05e563c737d67355d7a6504b6562e79bd2a9fdc178c25ab89f70b2709e6832d563cbc23ad3498b3c060ced5edead2be315dc4ef41a7968ca5b32b276943180f8f0de35e6b6c0e183768d79076e2f7277386d14d4b031ad8a15eaf97f74e05e0aac904ef56241776ec67070ac31c1dd8d9cfe78da4b2ac1f6973afc6b4e2abda82d675aa4ffbc776a51306a39eca1b45e7564ea6f3aba6248df07c8c03e3c1b8303e1e2bc67d6c5e269d5c344cd896612dbe7f394c915ecfb77c1580ab46c6b5f67c47d15e2a4f22830c59f40727f5a2f506e3ae349816849f4b0c66863438573041a42b259af0dc938b868b71c863dbd8b5211d9ef63d9d32407575f958a1f286cccb50875fdcbe1cd57b826610802b706444be2bc3d161d3fd08eae2af864d76687c375af7755d5a6d3031083f1767b6a2d306935f583559646fc49bf09c13f33369efcfeda9b0751d732c1b0d801d18d7558ce5b2b12160cc6127be14653b3a2e5c257d0d766c64042a616cd7f3ebe7421c1d2ababd6a021d1ddf5530333336684bb78674d000dfd9fc9174a970aaef746ae110717feb73b7f56a227e0f097bad609c1254c2be32d45f2f8e8b40350cc0453be67d4e2327f4a3963f4fa4dd67ee905f97cad1a1a287eb26d3d5dc61b4b75f335adff60d2a6c51dba42d5d1bd0bea16de8f8cc7e747ec968515b15299d9c3788caa6f4a6e2815f8afbc9f75fd7a60e150ff8924e66fd20324d1eac9d643f56c4afa2b0af54d7d12b0fa871e64c5a34fd1b3abca07100ae74a0f38bdfa73559ade987319954776036fde75e1b43a8ee9862f2fbfaad7c87a793ece53eea877ef894b6b57f83d6b5a865802094b676fd80b6f76ee44af85ca1e2fb1b3bd415403b35adb7f0fa01dc6e638a550d94af7b4f2ae82f437784bcf73f7cb74a6c6ed3a7f4109b5d00ae1420ec8a58b02e2347d25ffae787814945a3379cf51d6050139f16cd8d0864dc87e2fcc4ce74f8c766b4ebdb7ab4a5556d51e6b21e52c723edeef531950cf8824e4dee4ed7f286d9aa7b4a506d9a4e15a776d3cbe7bff9f62eba2e3eea691d20d9a051006cb797bc15802b99840560150f0be3650155f4871fb6d2c5db4f7c071818f4c5d10de27c2da75eef5e0087ae4a6ee476528b53af79d116bb249f5edef077a3595b763dea7581a6018d039a073490005c7156f1a0b3dba978b15093a92514afebe5d51355676dedce1607c4413a440b345f68c35471bc2a408fd32045b9cbc9227af9eca1aff3c686858dcbaf358226824d34d554c90cdd1d0fd0d1fd0413d3ef7aaca77feaba8afea1533e151ebc183f80ddbf46152505d52797184c0d6901b0f11141f122484d48271cdc80c3f44c408120ad2e1f89cb9c1b4ddc29de6f3cd68ded36069bce922d43277b092f2cee60ea984b7fd76e1efda7d6b34cfa6fdf2ea07b8f9f513cafca5f4aec8f0a32981eccef1bedce76ae463ebec97769c5d7f015a5d5efb6ed1cfafb0e8be81fbe5d4affd46d4d5cc1868d18da8d4e604b1ab8a04f47e27c8886feb1cb0a2199feae7d76089854d4775131c5fb8214ab3cb822792797405a19aa6abcae9d277e757dcf580bac0936ba784937808d6db6643a4832126d3b61d2f10214160bbbe4df7fbdd0759155b4f3e4b5f803ecf96f8e522c6e74b6d8574f6098dbdd90fcffda7b71c4ef1c5a04a4db3f765e1e37e9962c153223513614c4763c5e1cdb4d5ea4931bd519544089ba84142b2b8c3fa80c498967c5fb6a3e7143ccef5f509b2c53ba41f3f09b5fe010833d9f08a065c41b54b1b8ca9d0085dd0e3abd2f0b2ad1b48dc72891179c0a7103551c5540f9cad979d2f775504937bf55496850906829072eec0e7101541c1711f45f3bcda78bb71e251660cf1e0a97b86f769501d878aa80f275e4c22df1cee2bd2e76769b5fd22c1eb659463c02bc7ec5a2a083c3bb170f09e544cd276da2645c31393c120caa58ecac78800d36dbefbaafd50a60be832b5635305980b2523c635fae20bb71d63bc8a0fe2518547cd519b82ce9c00a23836fc03fb0d722051b78575b7045ab0aea022899b02323f134999700999dd303a032fe9e0c50e1ea9455a41fb06cec357890bd020dde6cedc08540b0ec1277333c75049495fa2dde4b3a5c21ae7b048013e0fd73baa66d284b096029a59a61abb901cdaf142bdfc0c5761640253220da6485012c1500652518ecc9be84c3e315b812e501b4bbd61cf82535816521372fa21ff65786dfeaa000cfab09609790072dff2d5508768516d2eb950d06a975e3ce7d910d61a574f40cc64b554c847a98e147d685a90e1ae2d61a10b44aae545c0ca84189bc2edc7c209e294b4d76d5bf7c7487fa64adb3dd08e22569e1194c0760b177d18bfd156be574cce092332f5471286b941d804bb5c5005381e1e3edd64630f6c311ab95529383cdb8de1fb8d071ac50ddfc1e9b969ec138832b56ef6146ac1918b213433511004e1e70b4797fc926307d3caed3976f52cfb9dbe877ada62a9f3bb2b0bcda7358924fcf9e3da37fee30c375bcc84ef7ebc2f8d205582a70214666073024ff26055c724c0bf6955dae987522a9ba287e322ceca64139db5d9ff9cf3d965607988f6fa2b3172e2574439854b033ad80a5f205c0c1e6e4dc4838b864a9c503b49b8cac1aa6aadde5a7f710ea9f67fbc578afb9fbaf5481cbb0bbf237ef8bd821136dad5abc730675001752a854e68b4cd1e61f66f8616b61608e93e9989bf27697195cee931735b3e27bd1648fb798b54f800b76979d33c36f806113f92fed66a63db8589382b9e2541f168d6b3e23560fa1273bca227653d5ee62ea347b47429d02a66a78f504fd6df892e8334e3c020c7660ba7806ddc0259b334ec165849b12022ec4006cddef362417c2211d25d51768d1eeb389f3b6199b139a98427afdaf4ed3638ad9b9012cdd3c836ee092eb00adb698557a25045c729f0b5b4786073d3795097d37ca2edff3a45ef9c1acd3b79ea65f4f1d897b50fcddcca5690d2c2b2f86f80a1c1c1b20f4e8882bb8f000f981d6662f5e55c37458a43732573b26f7fa99d1005574c5cec3fedc2bab28a59371fd74c5bbc56563f11c66c4e2c8f0aa12aa54c354766ac8d4397b5f425285e0561f99e75fbcc99a75326175498d00960c2e9523cec9b11169526f462c8e8c487305e580b21f3d2fb420639358bcf7424272f03e1ebac4d7fb7158215d5dee6e5a941dff3a393622c9dac888a55e2be2ec7629a09cea1ec310fbab4b8e697fa512a3c2fe42c26fbabadcddb2e2edf8d7c9b11149ce6144e0925ba2451b0ce65413af8e9054a17feb5790ba754e35919c04838b6303fd367d051772ac426255d1368b31068e3cc474925c01a51fb9b575f3d29acd33b880d674c9b208282057ff808b63c34b50f9ff035bede88965ec2ad60000000049454e44ae42608289504e470d0a1a0a0000000d49484452000000d7000000d70806000000897dc4b50000373c4944415478daed7df77714d7b6a6fe8879e9cefc7267d65b33f7be993bebad3773efbc07f6c5016363636cc0986b1b9b8cc1981c6cc0062cc0e49c4124814012412491834822482401226392c9395a20f6d477c42e9dae3e15babbbafb74ab6aadbd105277d53975f67776de27e379412d4a652a9f518beabff33afdf5af7fa566cd9a51d3a64de9edb7df16ff677ae38d37e8fdf7df177f6bdebc39b56ad58abefefa6b4fd4b66d5bfafcf3cfc5f7f97eefbefbaef81dee05c2fff17bfcece57e5f7ef9a5f95d993ef9e4135bfaf4d34f95dfb1528b162da875ebd6d4ae5d3bcf734c34619c5813bcb3d5436a53aaf3a01d65a4f2e0ef2eae06162f16d33befbc23c00466f38b2900caf7de7b4fdc1f0006c3376edc58fc1fe073fb7ecb962d4d10e0bb0d1b3614e37cf3cd3743c61e09611cb8874cf5ebd7a70f3ffc506c3698bf8e40c32683b1620e433abc16804b376ad5e47525a022914cd1109e81e7d5a953c794924ecf6cdfbe3d7df5d55702541f7ffc719864659000b85e48f57d277aebadb7a8418306026cf17e3701c0d2005c597d5e33990752c34f09e585c0a8fc7c4809a7cf32b03ef8e083908d00520fbf0793f93936bc0bdc17f7c7bb514975fc2dd1efaca6012c25c15532b1b6a90a2693415845741a032405181daa1a3e8bef78b1cdfc268c031b023602196c9082005a32255aba022c2395edac6430a9ccac0c16bbcfc0d681e3831d1e60205dd4326c08506f99a959030000930db0747172a41cb8be6f55a50e62b74d2673b22303e071726030b00042bfd53f3f370acc876d39fc9b8c8d0bef07cfc6e6092f7000ae04d2b651b54d09906c866470d931219c18ac0abad964bab9c931de64a9b090a8505b01b04bf30270255c1dd4c1106770d9fd9d193495806595229823181d204ba43a0b6d4078609bbc1e802b1134beab1eea205393264d6cc1c5c04b55605941f6d1471f099025f2dde3997887f00a07e08a23413d605b40078683cac7992076bbae97a0722a112417e69448a70c7b63e11d0ec0156727861ffa3f766230079c0d883f710cca8990ae84cfe13bf82ed4d2bffded6f619e42fc0d3b3c185057e7851f3611361527478e9f8066fb0b664100ae38c5b49c5cde6eccc0f11d303db22adc321a908ec46944c8a8b0031dfe263f8bf30f75b00913618f41754b94fd05b3200097cf84a06234520b8002b30394f817cce0855815b1820d40e38c0a59a2599920110ca79314c37ce32da5d939046f71002e9f6d2daf520b8bccc1513f5448764bcb8156483ec4ae20b5002864a0e3b9e9ae0ebae55ac673defc7e534d3dcc48050fa1d7528e781adab83fc6819d5a4e9cad5bb7aea734a848a401242440ed96c08bcfe0b3894856f6b211c5730cb87faaa9875a83ab6983d7b5f110aa6c017617c79ae708c65125d846439c949b2c8f6222bc87a992bda12db8905f8617895d59771735c781220518ec42ab8d87cd04d9f3a8f5722a9e6482f4c2e7557561b8379e912eaa2ae77376fefcf5005c7eb8df75aa3f72531b3911d60d60f8ac0c2a9636727573b48410010067f58ae277c94c74f63b332615927b33747664a46a201620b19316f81bab7f708c000cb102ca2954c089c3b2644c6569964ace0d2dc1b5f8c7da664f8c74f2aab18d06a90249a292541cd806416a7b2504b8ed5447ecf6d60a683068aabe5fae04d73d354a4b7071f97ebad80a72ad12f7de90333ea29927544f6e9c1369d9bfb5794f2a828c4b5374ce9ccf0854c2f813676e346ad448002a96863100951c7793ed366e4ce344f89c0a8cc9aa908eb5cd82ce95cb19baaa84ba7b0923556162910e9c6e2483a25ebd7a022c50fba2b5c9f05d0052be6f2abd771eb7aed22b23f012c6bfb236daf817de81b5e705a4e0175f7c21eeed446ddab409495076031a545559754d0529c681655da59756e082f747a7d292681284d9a53ea84f37caecfd2d6d9b339cca0ba62869e3ec11943b2193ba75fec6d6f921f7b688d50665e021658b3b44c924f7fb48953c490e69e828bdb4021797f1ebbca89c06c5294abcdbd7af579726f4eb44c7964da4cabd391113800690e1deb8277b13e33917d87e9070906e72176004b0394ee6256e17d85e2900ae487209e3a96a80a955f97daaf4a4be1dbfa2a2ac215101ca4ae7564fa56fdb274f1d06d858aa414d4c155b4c57db2b434717bc9fe9320c1455d9092464245d6c9b7ef43e756ed98c660fee4ea539a3e8feb639be80ca2f7ab87dbe5037772d18432ba7fd4ca307f651aa9c5eabadf1fe20c564f554c7f0084b2fdde25e19bab9e0a32d8ab4d618a9dcd54e04b50ec019dabdad099e93cb2768059e6869c5a481d4b3631b73530133ca073778c93861a91d8b832611712f9db2363274b3b7a2c9e8e6ba2b6600ae24c6efe49d77d384be543c63a049250b46a40578bcd08d4db3e950ee185a337980d844ec3619b9b8940f72b0e643e23deba62672c843a79cc38c54b5b73851163b166792ab623e48fbc17dc7f46c4b8fd74f31e9c9c6693506587604c90cb0415a0370ad9a35b2cde2e02398e4a394740af473cea14eedd83252d1dec2ae8a933b0028a773aba0cee073f5df799baeaf181702ae8a1d736b3cb89c4007270dd463386ca0325bc1266786e81293e4f0852ef55eda80cb8bbd05b0e0334e4d6364e2de0b33fa770c01d6e30d53e9c59e850190a290727660d3c10ee37a2f5ddcf25a808b3b3cd9c5b7b831a5b5418c13018888d5a8a4d6b3adb302c0c448b9a3be0b51237589878933da1abc1e80cb7ad6962a680a607df6d96711e7cdd94a2d835e142f0800e2135d593b5dd86c9066906089e867e8c5b1a14323d10c9df309f96c2bf9ac5ff9e8d368a4d6934dd30350c4496d441c30d98e0ef0892e312f2dc0a56a4483b41c6e5ba63aa5315aa9153832e24708aa438a25dbd1a14b9f8d0c5d9275bdec76c81af02ab5704fabd4122a61e0c8883bc1cbc88e8e64a4b28953599a04e0329d195e82c790645efa46e07e999dbe0a03d6d32d3303e64f10c195cf5ec544079c39d85de3c1c5ce0c2f3b9c177b8b4b26cee58e0c54428decb0449ef1c581ee1a0f2eee05ef2521d4c9de423099539d3a356f1206acc04b987c3b2c516a22b75fabf1e082e1e9b538d24e0db466b42387d00aacc04ba8871d96881e8a9ca951e3c1e535139e8b14e5fe0f728759fef9930fdf534aad67dbb20226d7404d9403cff16a8a83fb2243be46830b39605e8f376567865c8a0e40e1bb68ac6997a0cbf47cd7fc80c1357276346d583fa4512927063bd9d36cb3b9991000578d77c5475266026706979f6331acf9854e8e0c50c0d47a1152d050f68358246c64a6e68dab5a2780b0a6d83cb1d67267628464dc6abb6a3cb8bc7a0ab99608c0b24bdac5df5a7ed25009acc0ded28f7edb3e47b956eb26f477945e706a790922d7f80c0d2f6dd4a0066227b26bffcccd62709f85995dd4f65690a8ab1d3ddf9d1db64e47e60fa1c9fd3a39820b1a4c90fee4430d1774702f8715a0aecb49250ce25b7a92759da026b6f8b491e35ac3f6f67286b20e15c9193a7a0aa1063668d0c07337593836ecbc848133435f7aba794618b8b821a91db93933588ba9d159f1769e42a88868b1ccfd1bdc32e121d59cbc848133436fa786bc4e884fb20d6e475e03c8351a5c2a4f2180c4ad9abd6666b00b5e15380e9c199a3b358a6687ac153c87225669a3b1a071a91bb8b822a246174b469253e8042e4839bb0cf820595773a786a1aeabc085908bddd965a992b49b54704572e0829bbd65e7820761770c1839353c860c2eebf9d01ce772f31406e092720abd767b8ac5de0a3c85a9e331647001541c4866421c13c726216fd0a95747002e8390fbe5256117fdcbedc0c5c66bc1c85e81a7308dc06567734155e433c5e04d56693da261694d6f50136dc2ae2abe85e0a31db8823293d471c7bb810b6a211f7d04e7864a82e952e29fb2e0b29e236507acc00d9f5ee092bdc87cce9835cf3000570ce0b21e6de3143c46f3cf80815327d6c5712ebbfc51b7b3a4c12b01b85e810b866a24e0c28e06c316df6367865dd5b170c31bbb62c0c0a913eb4286865c4c19690059b7635c93ee2d744b676170613793b3e20134bb463401b86a26b85872e9724e57d283c86ea7dce3857129bf7ce802834bd59b300057fa81cb4b00997bc5eb728c50d2c0c52dd5dcaa900128b85ead117b4e73b14b7b0a4afb53832a76ce0b2939c19ac259150db8582dd421af30e959f16eb12e004a052c195cd8ed82ec8cf44981625b3c1670e972ba6452c1c56dd554f10afc0e1179bb18171fcb6a975318802bbdc0e525f54997966a5a800bbab1eae820d8596858e29453c8e0728a7105e04a4d70a9ca4ebce4a006e052f489b7bae41b356a64561f0368aaac787cc731c615802b25c18535659e9009315138b19c4006534197d4276d9a82cad9f1388b0bde41008aa3ef76e0728a7105e04a4d70614ded0e43e7aebd00912a84a34b4b356dc0c5aa21fa65e085e1c559fb24c8e77405e04a6f70216ea94a81c206cb7985d87c91b86b0de304e0b2d0a579555e43804555856c77ba0902ca01b8d2bb60d2cee6c2d96d001b7f46ce88479d60002e07d5d04bf2ae5bea5300aed404975d20d9adeb934efd0ab502975be75dd5a17701b8d21b5c886f46d2f549b7d4276dc0e525a08cfa9d005ce90f2ec42d55b12e37573cf34400ae0803ca1c54b6562007e04a3f7071ac0bbd51a201972ea94f5a818b55436b40d9ea31e4eae3005ce90b2e8e7545022e789b0370b9a886f0f8d8e9d42cb1b80a3900577a828b635d724ea91bb8746a06aa25b85835c44b55810baa021bba01b8d2175caa58975b6ea12ea7496a0b2ea732143e94418e7305e94fe9092e552f0db7ac789d5aaa69092e1072c354aa2132e465352148dc4d5f70a1559e35d6e5055c3a1cd5aa35b8c6770d570df133525de44c0d2fe08aa495f583c20974b76064085dcbfe912e4eed664bf83b7f16df8f85c970af5bb9837d3954ae7c7073f16f2cf790df83d33b0061dcd677e7f5f92a70a902c96ee0023fe894faa425b854a79f708a8b1c4c763ba6d54b993f18e04a561f2aedf61e15b7aded1bedfbe64d3afa63533a3da2750808550c87dfe133f81e40112bb8f02cdc0bcf7fb2699ae346c2e0c0670ff769e8eb3b0061fe7663302b9177cc0d5b3755accb0d5c3a757dd2165cb26aa88aca73bccb4b25b21db898a10102bf19ca0b8191c1d020790c7e482e907c4f7e8ef559892427a05b4f3ab12b9a743be1049fd729af505b70b16aa86a5ec3aa219236dd7a68a8c0851d3b1ebb74ace487d4620248759b1f808d0dcd2bb870b806bcc3d84499e06e577992753aaa557b70b16a886a64bbdef15eba3f3dd918ba5bb2faa51b9d1bd731261bc94e3d4c96a4729362f25cedc0e556d7c5f698aea94fda82cb2d531efa37ba42b9f52de476d6584c2caa5245fbfe633a33ba1d5d9ed5cb906a23e8c19a712184df5d9dd7cfa4f313be119f9709f790a9a4cb3b11d925f1f2c4c1b68a0460d67994677e1e3657f95d5ccf1918f6be40f83d3e8b77beb7e31b4a29c60e2074e852ad1b4eae41b805d20a1ba94c08cb40ab41612d9f3a0a5e58fc63ed005c9116515ac125bf50b74032747dab1a08c601485460f29bace0b412fe1e4f573798d8e9f9f19e3f08cf3939ac4518d0a0a25bcf45b6c6baac591a300bacb6b88ed9195a83cbaebf865cdfc53de3ed807577d908d3138885c54e7c2b7f4842182a128a772c49a7b95e98da950ef67cdf04d88d9c41cab5e358971c484ea5d427adc125a743a954433777fc8355e38c45fc804abbd6130b6a95529bc7f5a4293dbfa2e1df34a34fdea96dd29ffef8dfe9f7bfff7dd424df4b45ad1abe259e092a18faad1887df60bab07a32ed9e3398660df886c6f66a4d3fb46ee43aae776bffdf98e68deff3bdba34ab6fceaf7cfe4fb6aa23363b6c7ab77287d8c6ba2201176cf5005c3e64ca433574eaba7b627073fa75f6f7228e222f2a00152b80fca63ffdcb1fa8478b460210d102eaee962c01a6fa75fe5dabb9f186a3021954766817582b6c862a70c9e5fea994faa415b8eecfab45a706d50a337eebbda14e87421f052e33b07a0cb160f2b1ad4fb7ce148b99fd433b73c15b37fd9046f6ee40d30676a76d73470b7ab27f45ccc4f7b2a35593078be782308677ebd40e61c4b69fd41740890458eb26f5170035c1fa3fff859a357c8f06756b4f637fe8463387f4711dd781fc2931cffdf49a392173fcf19b1654ebcfff664ab62b4b475683ab707cc899c8f29ac98164f60a3a0591195cc21bd9a78a970270bda23b59b5685f875a4a0f56df86ea4c79ced6c0dffab4fdcc35bff064ced05752e28fbe30925ff4ec60215dd8be9466fdfc3dd5fef3bf8a31428a45a20232a87ab46c42ebb24652e5c9a2107a51be35a973ecdae25331beae5f7c6482eb595156d8b1adaa40b21770712a9ce98dec50c55301b80cc26e230753e5bcb51ddf37b58d79e18543aa21e0e87618c3a08e9f57eda086a48898414ad7d0833d057473c3fca8e846e10cdb7b57946d344170b7640dd5fe4bd54e0fd07801178088cfcf1ad28b2a4f6c0d0316d3b3436bab9f5bb28a1e1f581bf57c6eae9b4d0f76e64624cd79039081a5ca2bb4828b4b8cecc0c5279bf468feb1e01d339ed62700173dcaa90616f2fc540cd4b96533e5595ef83fab046e591a2c15660ceb4fcf8e1755d3895df4dbe9bd215471e1083d3d534ab7f6aca36bdb0a7ca11b3b57d3dd035be8c989e2ea679dd94795bf941a544295678ba9f2d4766afb59e32ab018f6931770b13a5856984d95a77756dd07f7bb78902aaf1cada6ab27e8b75f0ed3c3a3bbe8f6be0dbeceebdec12d61eff059f98e90f75cfbdfff22c65938e17bc7a45d99eabff3b6990265072eaee32aca1a22ee091e627e026fd568705d1e5bcb0c2cda6529ac993cc036e6c59e22abc7b0f5477595c6f5c5833be8c595e30240760410dc285e4f4f6ffe4abfddbd4987776ca69dabf3a864e3722a3568cbb21c9356e56653c1e26c2a5c9a43bb3715d0b6b54b6885f1bbc78f1e125f4fae5e108c787377213d3a5e2c18fcc9a9fd06c39fa497d74f9b54796697b091583574b3bdca72ab2582905006a8e4fb313dbf748c9e9d3b448fcaf7d0c363bbc5586eeddf4295cf2bcc3196eed94585c67c766c582ee6803981d6e62f30e7ba6b4d1e1ddc5c40fb372ea3adcb73e8eee5f3e2fd3c387d44800c730a799717cb8c671fa5e7978fd1c03e5d95eb513acb3e3714314c2770b1d46ad5ac5148de2807cec15b351a5ce5fd6b9969314e8cd4f4a3f795dda110a95725f0d6fa3fff3b6c2161e4575eab6668fc8c1dfdc5af2704e09e9e2e1100b85bb6c764bc8adf7ea355f90b69fb8665b46b6301ad5eb2d0643c2b6d5d932f00b665cd123a72603fc9d7c3f3e582a91f1cd911062a3116481703200c2e73ccefbfa92496c421e032249f3c3f2b619ed7b7afa4eb3b568700cb9ce37acc7139adcc5b603bc7220378aa396223c27def1f366cbc5fcbc3c671b1748b125c0b0776f4042e5525326b2da539a3427885b371c05b351a5c6c6fa9923a659a3db8bb3299979d1a568fa16a21f32619aac385034ac6831a7863f75a7a74e94c08286e5ebf461b57e586ede82a82f42a3676f69d0683eedaba91acd7bdf2520130489110605d2daf52e90c80600388c6ddbd3b7f7a15c0ceedb50518d44100a0e2e1bdb0396e58e1718ecb1651f19615628ec5db42e7f8e2e963ba6d6806774a360b2087ccd15057ebbff5d7b0718ffcf6734fe0b23605e57587c960e515ce214db6dd9574709576f606aefbdbe6d0476f8597a27033482fe03219d0b047e48587ba0435c9ca74cc789b0c9510cc74e9dc09f1bbf2b2c3b68cb7c7603cecfe7b8a3691ea02c0c0e426d3c13682c479e578a8fdff4283b9885b21102c135446d9f56e6e1cecc000500d4928cf118056014b9e63f1d6d5f4bca24248b2d54b17bbccb180f66c57cf1152fa56f13aa18e0aede0fc3edb8dc32bb8acf63667e75c593bdd165ce0ad1a0d2e76c1cbe082de8c4c71ab5b7e52d3d7949d79553986efbef6677b7031035e3a4c8f4fec153683ac26c9176c27482e06d7ad1bd76dc1b5d55095185c470f9590dd75ab641b3d39b6bdcaf92079f4ee96ae0d092c237ee51434464c8c3f8f98569897104c7df98829b5601fa92e8009e0dabf633dddbf7353cc71fdca652e732ca0c3fb8b6de788675ddfb68c2a8e6d36c7a302d7cae1dd3c814b6567776ff09ab29485c105de0ad4424b3d1332c5ed32b71154b6da5ed0bdade0da36f13bfaa1759310908580cba0fbbb96d283b347c9ed2ac8994dd9937fa2c5d387d0a2a9836958dfee34e4bbae213466606f5a326b18e5cd184a73c60fa4cb17cedbdeefc5b32774bb283f0c0c903e3c562760c9c40083c47372c33f3c77dc718e6b97cc37e73867dcc0b0f981a60def47cbb2868b39ce759923cff3669101b0a39b42c0858d0376a393d492c165b5b7a0bd800fb6b4aae60b1960ec92aff16a21834b7668b0f710ff1e1bd08cce8ded20e848df4662b7b20695dddcf14debbd1e062e2cf8f31be7c9cb75e7d64d9a3cb40fcd1ad99be68dfb9e164dec47137fea4a13067631a82bcd18d693161960c81ed797660eef45eb0a725deff9f2c5f33010f468d7dcccd2f0daebe245f102139008462b0176fd4cc473cc3668dc80ce345eccb10bcd1bf3ddab397e2fe6b861659ea777f7b2e2a970cbcbe0429ad78b3d0b1d81c5cd41012e64e3581d58e33bfd4df086bcf15a1d1a351e5c72ca13bf1c2e83c7ef9077c62ffbd2f49eb4f0f3f0f66b1cebb05b244830113b1ad62f9cf12e1ea2970f6f8a5dd6e9ba72f102e5cc1c4bb347f7110cb670423f5a3cb9bfa01c036cd9e3fb52d6e8beb46fc7667786bb734930bc752c485b62e6f304aea2d954b1731e3579eb3fece7c72efa5bbfd0cba70f5d01669d230005c2cfd83ce68efb818ad6af72955800159ec98e1a797e0890bbc5b838888c0ecbb2d4423201e25f488f6270710f10ae11637e026f0571ae572f032f07c99c202e5547d634bf6c644fe37778e9b26ac83ab8dde1e370f70a89f059635bd5094c003be8e985635471ffb62de31c3db88f8a562fa02d0559b4f515ed285c4807766da0278f1fbb4b2b047815cf4710985526cf5d9a0c703ddb3a8b26776fee3ebf57f4f2de5557f09f3a7a90766dc80f99237edebb75a5e31c1f5f38414f4eeda3e7a78b6de7871082684c636c0a4ec03a327f48586c939d575c202bf71e1149c0afba70f1ef6b7c9c0b3960fc32509a2e0792593594933af1ff0ef543ab94195c76cd6a10a874b34b647ab27f253d3abc996eee5c498f2f9f71049bdb855dfcc5fd1b229e26efe256824322d2bc42c1a01ba6d2a99c9f4dd5104e11d73942921920abb87b8362b9f06eee1ddf4f77f7aca6472585a66da522b62759e5b52befb7164bcae5463005f03b008f375af088ac2673f72b50b2f30bb5c82db42b79678fe1f50503aa7734c3eeca6c14dac086631e4e9da038a86c756ab85145f936e1f8b8b9355f18e737f76e104e1030961d09862bdd44f7f7ad1140f5f21c76c1ef9a9d197143cd7b2b460b0741984bde6d6e0618303780e3dee11d626e18bbddbc10c3c28683770187cc9303859e9ef3e2c436d3deca1b5155bf869e926ece0c6b35043651ce238589c0fd47e477223bc382c45dc9a981aa616ba726fc1e7559fcd24f0f6f6dda5dec92f702ae4599df56676944002e5bef5bf1322539edde76045b096383e325925213760a402dda95f593299d3d492f07a96d37b768ef59b6665e884a28c06553de2fe715c25165b5b7166676117f87838b5b05c8ef842bcf83c4dd57746144a8dd25bf2cb13b192f925ffa2f933a53618b2a70f1cbf7022e560da3915ef12478f8785cab47455e950cb510a5f24fb7cc300b25e175d4657eb29750f6823a010b79a2aa7826d61b2aa10c2e6bbf10e623f05400ae578592aa7805bb55b1339b4574868ac84e8d48c0f5b070a2e992471a8e2e8cc759f0505be19c88145c900000d7bd95a385cac5401559f21acc6fdd9cb1d59bda2b2f28c2074ee0e22a646ba2b6ec1106b8acf9a872eb3c1d0a26b5a944e64c0dab6a089dfaf6929f435fbef1b996ef5657287b01d783d5e3456099171a09b2c9663c560741181baaa623eeeb5e345b800b1b10becfb657aceaa11f84e7b3fb1de3f25a6ac2ce0c3933e3dbf66d43120544ecd3626fb14a98eccc0cedc025c7bb64d510f539d0ab43dcb47d1b098f612492ebfecab12131af488d7fbf09aaa935bf0e3654c4a784ecce16e0124e1f4345bcb379969977e8877d190bb0385117e3918b3fbd7a0a65700d68df5cf432e4cf5c9bd73fa4fe4f5609931ddfd20e5c37a6a955438e5dc82f1f4e0d780cb93a99c16517e7aa925ce3846a889fbb7ef6417569bc619f247a8707b07847c758223d9125acbbeefc1fe8eadcbeaffa344ea7b2c5a34c8025637e5005d9fbf9a73ffe0f3abc6058c878a1fe3a810b6d1bb09eb24a38a4fd6721c9d9584fd99921ab84e0a5005c123dcd57ab86fc0265ef12bc8748e2fde293506fa1d3823d5c33412c08ff1f09a372cd176c1f3045bc9d179ce2245a0ebcf667baba7c8c180f54a568c17563e140012e9e1f009637bc87f91c307abca534e606555bceeac7c681f959d55d374f21b7b296c195d5ad79886682f725834b5609c14b01b81c54437e711c549617044165b8e37ffcaa9167703d5a3799eeaf1813f23b2cbcaa6259ee9c04c045e35d04b3e1bbb807806bad6562c653f5b48ff8e085bc21025c77974beab3a122164de9272487aa2b14ecbd68e785ef01ac3c376b990c362db908120e8c100fa74bda930a5c0b0776363d85d6cd8843363aa984da814bced6b00694adbbddc68ef528ab5dc3b0e0a21359c1c5840c07d862aaea6515f0dcc8e9fbf058c279213f3f1a47866cbfdcce1f6ad85c3fd2edbca16173038061d3c920b312c0e1362755a1a395b051592b8b2145ad366234e0da3c7940c8676470c981631dba3e69db14948b27414ea76120a17779db7a26b8dc7ac60b70ad1aebfa19000d2a231812800318bc80ce0e48b8c7b4dead04a05852399dc4122db8e02d943359ec627d3c370021967981701f9e9b6d6b3b4b5f14d561776ee0ead1be5558575e39e589f925d9c591da834b4ee4459e981db890fe2283cbe92821593504b97dce0978602437c2e7bcde3316a95515449e22c05525bd0644352f2f73b2db1c1cc9504dad1e50374fa10a5c39df34529e5e239fa4a943a2aef6e0925bada18cc06ec7e3c44d06171af77b597091d3662c7ab400f393dc8e95f5420f0b2798e082ede5453a27848c778cc46255d03b1270416a21f462bdb75c9ea44b2bb5d438fcae7f78cc4b157844390aa7c5389d8d6cedc0eb45354904f3c1fe88155cb2e4023d5c3b31f99b870db0385dcb0bb8384120bbdd0721e96ff2a6843213b3996c7ffdf8584b70c9312f0e14aac005bb6b64bb4fa9cfa7ef452c2db0f8b07792c580b1aa8366f26ef102bab36498092eb8e3c5e6912480e1fdda6d1a6e694f32b8b061426a59ab22e435d431b69512a79c70cc8bf3c75465e15c7630a9cd871131809c550e4684472b51cc8767f9052c956a08a031230bfb26412083ba6d27ad42eacf3cdc0bf6332acd21b5b0be762dca5925d425dd2965c0a52aff579dc185bfa35189f5081a2752edac6046303db207fc9468b817765a30841f6aa092698d71cbaaa115bcbc8970e532c613f586628055ccc7b80fee1749f0db8b3343548e6776a18e9f35367ba8a8547bd94ba8536c2b25c0757562784059c51038e0ce5af3e5974a06c68996a2c9138c8510586770c5eade8f177971667089ffa2165555e828310a5b3f4302721b085d5542adc12597a1b04b5e753835f20cad8d6cdc289ad20edd49560defaf1ca3e518235151f9fc64d5a993d032e4be96baa43ba5d4c992d6445e55749febbb4abad48b48554b3770614eb26a684d394a3679c9ccb08659e4e644d68c0fee0e76a887befc9b52e0b2532d9c76393b4ab4da166fe24c0d263f62687edb855ed786ab8c55da08abf4baf4264c5970712a949c6768dd01616b416ad9e9e7b676978b672bd9b649e5fedc88c17525eb3b01ac7b05a3844b5ea739b99599a8ec68a8fc76798a01b8e2d08d9777c1ab73fa86b5bac6a278b6bbb665259de1acfd424c26dc30852a0fada0ca927cef6ae1e6e926b8f07e50407967d9707dd4568fde493866aceb8a0d141b8eac6d04e08a13b81099e79e8656b21e5c1dcfd4a398bc7b05239587fdc11901e744e5be4554796a87678001480016e68fffe3e7b2fe9f68012c2fadabadb14b99b0d65873f99ebcfe678704e08a290d4ace31941bede305730607ef64589c4883c9c920d591496c3799debeb2b5f4f2cc2eaa3cb2a60a6c2ef713e94fafa4217e3e35aca51ef696c7e031885b54635d410c22f9a00eb965b50e5d9e52125c72cb356b4728bc74b91295cfc255051d6d83c93154ffc64a2c8da1c2418a3e5a3729248dc9fcecd1f55459be992a8f6fa4cad2a5f647b8f66f22becf06bf4ee05285506c3b3fbd5a6f9654886761adadda4b00ae38810bbb98b519a49cc4e9355b03922299e0825d247bf8a2f5f6e15d94677e2100ca5918b8077e974af6166c2b550730c43903c915c7da2e59e7c66ea65a44ce35f3aa1a5aab64130dae4bd37b9860c2cf32c176f212ab8253042e6b7cc70ad643bd3f4c297bebc42b75dfda328d7bc0abcafa91c913802bc6b27faba45211ab8661f53f1ac6bb105e103d190d105c9bdf9ff676a81362c4e3ffe7277c630b30a85a722d131300c5e03afcdd4729636f41dbe078a5ca8baa5a67ddcafa530a5c486be19768ddcdd4eac7b488bd86898e773dda3e4f9cef7c61e9682ae9569f2e4cee2c807035ef67ba94fb331d9bd98fcaa6f6a60363bea503435bdbaa8ef81e6c2afc2b4badeb798614ccfa8e4e4ee9416593ba8b33834177b66489e756ec5ea0657ccb4e25b4db9874396c2165c105427a8bd7972e7b0dbd0694e39567f874e77cc1d060ec93cb26082acd19154625593f0952fd0d743067245dc81d16022c382e00ce638b465059ce08dbefda5159de58319ef3ab26d3b5f53304e8e29996158b4aa83a4dd3f420f6af1580cb2fbb4beeb0aa7ae958187ef15e730dfdc833843400830248670a26d1a1c5a3236678273abd7c82082c336143c0f3fc7c06e8f892717471cd54bab9719690b07e1472469aa88b3554c5ff542aa1cef6564a804b6e16aa0218f47339435a26afb986d124b932982005fc66722bc3dba9720081df40b6124bb768d4498024dac031543fabed25034bb74e4f29092e2e3f9101e64450235995b4e6a6796dffe524a1c06c7e333000c2aa23eecf7612c0e3654cf81c7f87a527df0fe41700b19140d5f5ac1abb1c70670d1c63ddbcac333ea3c3292669012e6bf1a48a902ac59e23feac57d5d04b9f763031a488574664c696999eed1b901f6a57b4c463609b10aa602420f4027a2f9d75adb984000c341539bea922ddd5c1940317b75d4349378004c2cfb0c9acbb98ac4a7a8d79b9310aa481d38e0e0605b326da1b170f6f263601a78d042084c3c60f173c1c4faaba2cac35d6d6badebab54f4b1b7045d383c36b3a94934bdec97900464cb7c24b1968762083faea870b9ecb4b52451a05e0b2b409f012f37272c9dbd95950a9d215585e36162729eda5a49fabc8753a992400578431324f8e0da98bab95a261ae74223b8fa89dede5b5a49f635bba766f0ac0e5c10982188a97645e956a68b773435d8a3c81755a585d52e29368a70917b7977432b39cc5b02723510dbd64c1735b3c5dce2f0ec015438ccc8b6343a51a42f5b3f3064692a4ab3a162919c042ac884b76909be805ec9050916c305e54427664e85c491c80cb8550a9ead92daf500dedecad48c0852037981a295c286a8c547a210e07492313ee877b3101b8008d4c76ae6c7c1663c07ddd9264ddecae68bd84dcf7241d1d1935065cf2a9295ea497b561a85d4e6024e09241022080f12135ac60b0922aeb3d52e2424300dcae54271670595df25ebc849c91910a591601b83cbae5bd94a25803ca7e824ba5a681e159fab8818d094091a516ee214bb5447a0cad49bf5e5442ac43ba4bad1a032eb92ecccb017172aea15dd6821fe04a0777bc0c2e2fbd09d9fd9eee52abc6804bee24e5457ac9e5ff4e09b535055cc83cf1022e2fbde06b8ad4aa51e08a447ac965284e397635055c761e5339d6e5a5bc84a596ce2da80370c528bdbc780ed9b1e104ae9a1244b68b73c9592a5e1c199ceaa473697e00ae04780eb9fb9213b8e259c1ab13d93975185c5e9ad0705c4bf7eae1005c3ec4bdbc646da0afa113b8e2995bc871281dc0e5548a820dc62d23839bcfa46b0e61002e45d686f5206b95f472dab5518612b723770c6023f70eb12eabeb9d83c6877a3510764cbc33e39d36987b5b677b2e86d4b9c76000ae38e41cba65cc97e78f498a53831d04bf4cec5cd576ad4d2d938e7cdfc83c49d34ba1672c84921aa7f9df5aebadab533aa73905e08ad2357f74e1705faa726339e6146ad5f5ec0182acaaacdf879747626f952c1841d7578e77540739cd29958a1c0370f9e0dcf092d47b2e7724edcf1eeed8c0259ed2cba93559bca516bca14e1bcbded983e9fa8a71813a18802b3af510e0da9395e958f29e88aeb5e2047b8912d1ccd42e1b1e840da778c6c088cbf70370d520e2bc43bb83f32e2d1d2d9868dfdca1b68c164947a47471c163c3b103175adab177b026aa8301b824ef211f0fabf21e42ed0113814a168e4cb8d710aa1982b8567738aa83e36aefedb40f4360a3e177a2b2b3d2b92f4600ae18fa225aedafbb6b269a8cb477ce10cfa5177e01cbade9288097c8ac0c6c30fc3e8ecc1b52e34af70370c5687f593bf5323381ec9c1bf1706c38b57393c9ef1e8800b55de0184e0c3b7041f2d7743b2b00974b5f7a6bf606984806989d7ae8b7f4f2daa4d3eff66e7689bafbe70f0b790f70f6a84a496a52164600ae283a46c16e60809d5818ca5476de433f6d2fb7cc88783dd7ced692d541a65ff247853830d2b9d94c002e1f83cbb207913d8632d9790ffdf21c3a65a2c7331c60e72164efa04c70f6c8c0aae90e8c005c11808b01767de9a830c6b2b3bfc0e87ed8404e6ef07895bfd8a983b2775026c406195848880ef8270097e743ce39c30000db33b53fed9d39288c0e2c1a45070d40c954be6c7ccccc6ebda71bdddc149b5b1edf57ddb774c108e5bcf74ee865a636d5e42c8c005c51824b762dafedf82e151b00db376b5008ed9f9d49071755492c994ec40030947158efe746bfac9e1235b06e6d9aa5bc274eb5b4ce17b4636c4f5adffeed10091f802b0057c4e062806d6c599b96b4799b768deb691eb56a1eb93a6f281dc91b1b46e54bc7d383a2b951d95baafbb9d1a31d91a9a315c50b6c9f7538770c95ce191c3657cc3faf451ddadaaab699e214802b0057d4e0021dcf6c4eb95fd4a67c83b1768fef49a5b37f0aa183f3878a80af8ac0c08f3d32feddadb36defe346c7f2c7797a0e407563e34c3a6180dfee5e078c0dc33a47cc1bf3cffba23ad81e802b0097277ab1a3133dba788a0e0f6a11062e50e998ce94d7dc90602deb50d1d0afe9e09ccc103a9cfd331d5b32ce9620c92e174e13f6cdb35dd9610c7f7dc34cf119a77b78213ce3a1213165c2bd11e83eb36292ebf7310febdc305fcc1d74787cd7ea00bb04aeca0b6be8c59171012f05e0b2d0ea7af4f2f1af84ebf9e3070260aa3cc3dd63bbd35263f7ce3776ef75bd3ea5fd53fbd1a1b9834d3ab2609868bb96aa84f1cbf301619e982fe68df9df5b33310c5cb7f7ae11efee65c5037abebe71c04f01b8aaa9f24c2e59af67659bc300767cc1cf543aad1fadeaf01e2d3176f1658614db3db2b3c8e2602a33181412e8c4b2092945280c95e78179f13cf1efbe497de8d4a2e11675f94b21ede5ebe5cd03014f05e07a45c64e6b77559cd917c24cd70a0c9b64fe103a943590b667b6a1a5cd6b09da36a085f83dd3510384f0189e5c3e417bc2388f2e1c1632fecdfd3e37e7b6ae7b23315ffcfed62aa9f278f32caab87545f9de5e940e0ec01580abca5670ba9e5f2e178c64f6855836968e197649d9fca1b4775c0f2a30a4d73263775fdbf9432a99fc9df8bd20e33308069f5a3e515bc2f88e2e18668e19e35f6d4829cc6765dbba21f3b9bc744c75e3d4ddb95479ffa6ed3b838a1d802b905ae4e50223c9007bb876325d5936868e1912eac89c9fa8f09bfab4fccbda82b60f6a297e2fc89008a70cc90047826e8471f13831078c7b45ab3a620e1b7a3416bfc3dfcee68e10a53732b05e563c737d67355d7a6504b6562e79bd2a9fdc178c25ab89f70b2709e6832d563cbc23ad3498b3c060ced5edead2be315dc4ef41a7968ca5b32b276943180f8f0de35e6b6c0e183768d79076e2f7277386d14d4b031ad8a15eaf97f74e05e0aac904ef56241776ec67070ac31c1dd8d9cfe78da4b2ac1f6973afc6b4e2abda82d675aa4ffbc776a51306a39eca1b45e7564ea6f3aba6248df07c8c03e3c1b8303e1e2bc67d6c5e269d5c344cd896612dbe7f394c915ecfb77c1580ab46c6b5f67c47d15e2a4f22830c59f40727f5a2f506e3ae349816849f4b0c66863438573041a42b259af0dc938b868b71c863dbd8b5211d9ef63d9d32407575f958a1f286cccb50875fdcbe1cd57b826610802b706444be2bc3d161d3fd08eae2af864d76687c375af7755d5a6d3031083f1767b6a2d306935f583559646fc49bf09c13f33369efcfeda9b0751d732c1b0d801d18d7558ce5b2b12160cc6127be14653b3a2e5c257d0d766c64042a616cd7f3ebe7421c1d2ababd6a021d1ddf5530333336684bb78674d000dfd9fc9174a970aaef746ae110717feb73b7f56a227e0f097bad609c1254c2be32d45f2f8e8b40350cc0453be67d4e2327f4a3963f4fa4dd67ee905f97cad1a1a287eb26d3d5dc61b4b75f335adff60d2a6c51dba42d5d1bd0bea16de8f8cc7e747ec968515b15299d9c3788caa6f4a6e2815f8afbc9f75fd7a60e150ff8924e66fd20324d1eac9d643f56c4afa2b0af54d7d12b0fa871e64c5a34fd1b3abca07100ae74a0f38bdfa73559ade987319954776036fde75e1b43a8ee9862f2fbfaad7c87a793ece53eea877ef894b6b57f83d6b5a865802094b676fd80b6f76ee44af85ca1e2fb1b3bd415403b35adb7f0fa01dc6e638a550d94af7b4f2ae82f437784bcf73f7cb74a6c6ed3a7f4109b5d00ae1420ec8a58b02e2347d25ffae787814945a3379cf51d6050139f16cd8d0864dc87e2fcc4ce74f8c766b4ebdb7ab4a5556d51e6b21e52c723edeef531950cf8824e4dee4ed7f286d9aa7b4a506d9a4e15a776d3cbe7bff9f62eba2e3eea691d20d9a051006cb797bc15802b99840560150f0be3650155f4871fb6d2c5db4f7c071818f4c5d10de27c2da75eef5e0087ae4a6ee476528b53af79d116bb249f5edef077a3595b763dea7581a6018d039a073490005c7156f1a0b3dba978b15093a92514afebe5d51355676dedce1607c4413a440b345f68c35471bc2a408fd32045b9cbc9227af9eca1aff3c686858dcbaf358226824d34d554c90cdd1d0fd0d1fd0413d3ef7aaca77feaba8afea1533e151ebc183f80ddbf46152505d52797184c0d6901b0f11141f122484d48271cdc80c3f44c408120ad2e1f89cb9c1b4ddc29de6f3cd68ded36069bce922d43277b092f2cee60ea984b7fd76e1efda7d6b34cfa6fdf2ea07b8f9f513cafca5f4aec8f0a32981eccef1bedce76ae463ebec97769c5d7f015a5d5efb6ed1cfafb0e8be81fbe5d4affd46d4d5cc1868d18da8d4e604b1ab8a04f47e27c8886feb1cb0a2199feae7d76089854d4775131c5fb8214ab3cb822792797405a19aa6abcae9d277e757dcf580bac0936ba784937808d6db6643a4832126d3b61d2f10214160bbbe4df7fbdd0759155b4f3e4b5f803ecf96f8e522c6e74b6d8574f6098dbdd90fcffda7b71c4ef1c5a04a4db3f765e1e37e9962c153223513614c4763c5e1cdb4d5ea4931bd519544089ba84142b2b8c3fa80c498967c5fb6a3e7143ccef5f509b2c53ba41f3f09b5fe010833d9f08a065c41b54b1b8ca9d0085dd0e3abd2f0b2ad1b48dc72891179c0a7103551c5540f9cad979d2f775504937bf55496850906829072eec0e7101541c1711f45f3bcda78bb71e251660cf1e0a97b86f769501d878aa80f275e4c22df1cee2bd2e76769b5fd22c1eb659463c02bc7ec5a2a083c3bb170f09e544cd276da2645c31393c120caa58ecac78800d36dbefbaafd50a60be832b5635305980b2523c635fae20bb71d63bc8a0fe2518547cd519b82ce9c00a23836fc03fb0d722051b78575b7045ab0aea022899b02323f134999700999dd303a032fe9e0c50e1ea9455a41fb06cec357890bd020dde6cedc08540b0ec1277333c75049495fa2dde4b3a5c21ae7b048013e0fd73baa66d284b096029a59a61abb901cdaf142bdfc0c5761640253220da6485012c1500652518ecc9be84c3e315b812e501b4bbd61cf82535816521372fa21ff65786dfeaa000cfab09609790072dff2d5508768516d2eb950d06a975e3ce7d910d61a574f40cc64b554c847a98e147d685a90e1ae2d61a10b44aae545c0ca84189bc2edc7c209e294b4d76d5bf7c7487fa64adb3dd08e22569e1194c0760b177d18bfd156be574cce092332f5471286b941d804bb5c5005381e1e3edd64630f6c311ab95529383cdb8de1fb8d071ac50ddfc1e9b969ec138832b56ef6146ac1918b213433511004e1e70b4797fc926307d3caed3976f52cfb9dbe877ada62a9f3bb2b0bcda7358924fcf9e3da37fee30c375bcc84ef7ebc2f8d205582a70214666073024ff26055c724c0bf6955dae987522a9ba287e322ceca64139db5d9ff9cf3d965607988f6fa2b3172e2574439854b033ad80a5f205c0c1e6e4dc4838b864a9c503b49b8cac1aa6aadde5a7f710ea9f67fbc578afb9fbaf5481cbb0bbf237ef8bd821136dad5abc730675001752a854e68b4cd1e61f66f8616b61608e93e9989bf27697195cee931735b3e27bd1648fb798b54f800b76979d33c36f806113f92fed66a63db8589382b9e2541f168d6b3e23560fa1273bca227653d5ee62ea347b47429d02a66a78f504fd6df892e8334e3c020c7660ba7806ddc0259b334ec165849b12022ec4006cddef362417c2211d25d51768d1eeb389f3b6199b139a98427afdaf4ed3638ad9b9012cdd3c836ee092eb00adb698557a25045c729f0b5b4786073d3795097d37ca2edff3a45ef9c1acd3b79ea65f4f1d897b50fcddcca5690d2c2b2f86f80a1c1c1b20f4e8882bb8f000f981d6662f5e55c37458a43732573b26f7fa99d1005574c5cec3fedc2bab28a59371fd74c5bbc56563f11c66c4e2c8f0aa12aa54c354766ac8d4397b5f425285e0561f99e75fbcc99a75326175498d00960c2e9523cec9b11169526f462c8e8c487305e580b21f3d2fb420639358bcf7424272f03e1ebac4d7fb7158215d5dee6e5a941dff3a393622c9dac888a55e2be2ec7629a09cea1ec310fbab4b8e697fa512a3c2fe42c26fbabadcddb2e2edf8d7c9b11149ce6144e0925ba2451b0ce65413af8e9054a17feb5790ba754e35919c04838b6303fd367d051772ac426255d1368b31068e3cc474925c01a51fb9b575f3d29acd33b880d674c9b208282057ff808b63c34b50f9ff035bede88965ec2ad60000000049454e44ae426082, 'AC', 6);
INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrimag`, `estado`, `id_empresa`) VALUES
(2, 'lia.busatto', 'lia', 'busatto', 0, '2dc4e4a6fbeab8a7f828efa9aec7d7ad', 1, '', 'AC', 6),
(3, 'juan.perez', 'juan', 'perez', 0, '2dc4e4a6fbeab8a7f828efa9aec7d7ad', 1, '', 'AC', 6),
(16, 'm.rodriguez@mrsservice.com.ar', 'Mariano', 'Rodriguez', 0, '21232f297a57a5a743894a0e4a801fc3', 1, 0xffd8ffe000104a46494600010101012c012c0000ffdb0043000503040404030504040405050506070c08070707070f0b0b090c110f1212110f111113161c1713141a1511111821181a1d1d1f1f1f13172224221e241c1e1f1effc0000b0801d601c201011100ffc4001d000100010403010000000000000000000000080206070903040501ffc400521000010303010405050a0c0404050501000100020304051106071221310813415161142242718109153254919293a1b1d118233352566272b2c1d2e1f016245382435563a22544738494344664b3c2c3ffda0008010100003f0098c0961dd7125a7938fd8572a22222222222222222222222222222222222222222222222222222a5eeddc0032e3c82a3ab97fd53f20fb9721008208c82b8c12cc35c72d3c89ecf02b9511111111111111111111111111111111111111111111111111152f76ee001971e4118dddc9272e3ccaa917c20104119055009690d77169e47bbc0ae4444444444444444444444444444444444444444444444444454bddbb80065c790463777249cb8f32aa4445f080410464154025a435dc5a791eef02b911111111111111111111111111111111111111111111111152f76ee001971e4118dddc9272e3ccaa9111117c201041190550096f9ae3969e44f67815c8888888888888888bc7d59a86cfa5b4fd5dfafd5d150dba919bf2cb21e03c00ed2790039a861b50e993a8eb2e12d36cfed94d6ca16921957591896793f5b74f9ad1e072b1abba4feda9cf2eff1681939c0a3840fdd5f3f09fdb57e979ffe1c3fca9f84fedabf4bcfff000e1fe55ebe9ee969b60b655324adb95beed003e7435346c6877fb981aefad4b7e8f9b7bd37b5981d4223f7a75040cde968249038483b5f1bbd21e1cc7d6b3222222222222222222222222a5eec6001971e4118dddc9272e3ccaa911111117c201182320aa012d3bae3969e47bbc0ae444444444444444517bdd17a5ac9765565ab827985343750da88dae218e0e8ddba5c3b70470f5a8108888b247468a4acaddbc68fa7a1a8969e637163cbe37169dd682e70cf716b483eb5b5044444444444444444444454bdd8c0032e3c8231bbb924e5c799552222222222f840230464154025a775c72d3c8f77815c88888888888ba974b850daedf357dc6ae0a3a481a5f2cd33c318c68e6493c0288bb74e97d1d3be7b1ecbe164ce1963ef150cf373ff0049879fed3be4ed59e3a306abafd69b0fd3f7dbad5beaee2f8e48aaa67fc27bd9239b938ed2003ed5e4f4cab37bf5d1e75234341751b23ac07bbab7827eacad652222290fd00ecdef96dd5b5ee66f476db7cd367b9cec35bf695b115093683d27357e87e901a9e869dd0ddf4dd3568a6f209b8757d5b431fd5bc71692e0e3c7232a4cec776b9a376a36af29d3b5fb9591b41a9b7cf86cf09f11e90fd6190b21222222222222222222a5eec70032e3c8231bbb924e5c79955222222222222f840230464154025a775c72d3c8f77815c888888888adada2eb5d3da034c546a1d4b5cda5a38461a39be57f6318df49c56baba40edd353ed5ae6e864924b6e9f89f9a6b6c6fe07b9d21f4ddf50ec58854f8f73a6f22af65579b2b9dbcfb7dd0c8067936560c0f958ef95482da15a997bd0b7db43d9be2aedf3441bde4b0e3ebc2d454f13e09e4864187c6e2c70ee20e0ae2444533bdcd8b30dcd5da808c1cc146d3e1c5e7f82989573c74b493544c7763898e7bcf7003256a1358dce5bceacbbdde776f49595b34ee3de5cf27f8aa74ddf6eda6ef34f78b15c27a0aea6707c5342fdd703fc478153eba2f748cb76d1218b4deaa920b7ea88da031d90d8abb1dacee7f7b7e4522511111111111111152f763000cb8f208c6eee493971e65548888888888888be1008c11905500969dd71cb4f23dde05722222222f135aea5b3e90d315da8efb56da5b7d1466491e799ee6b476b89e007795accdbeed66f9b57d5f25cab9efa7b6404b6df421de6c0cef3def3da7d8b1aa2963ee6f5e4c1ae352d89cfc32ae81950d19e6f8df8fb1e54e73c7815a96db2d98e9edab6a8b3630296e73b1beadf247d455a0888b62bd01acbef6ec1e2ae7b30fb9d7cd38777b06183eb6b964adbdde4583633ab6eb9dd315ae6634f8bc6e0fadcb54278f15f173d2544f4b55154d34af86789c1f1c8c761cd7039041ec2b619d1136ef16d1ad034c6a39991ea9a18810ee42b621e98fd71e90f6f7e242a2222222222222a5eec6001971e4118dddc9272e3ccaa91111111111111117c201182321500969c1396f61eef02b9111117c2400493803995af2e9a7b61935d6b07e93b25513a76cd29612c779b55503839e7bc37881ed3daa3aa22cd3d0aef22cfd21f4fef1c36b84b4673da5ec38fac05b2f5adee9d166f7a7a41dcea1acdc8ae34d055b3c4966eb8fce6958211116d73a3ed98583629a42d65bbae65ae291e318c3a41d6387cae2b1df4f4bd7bd9b04a9a364bb92dcab61a703f39a097387fdab5ce88bd7d297eba698d43437eb2d53e96be8a66cb0c8d38c11d87bc1e447685b45d85ed16dbb4ed9e50ea5a3dc8ea08eaaba9c1c982768f39beaed1e042bf11111111111152f763801971e4118dc71272e3ccaa9111111111111111117c201182321500969c1396f61eef02b91111612e98db4a76cff00651510dba7eaef57a268e8cb4f9d1b48fc6483d4d381e2e0b5aa492492724f35f1115c9b31babac5b44d3d7763f73c96e5048e767186ef8cfd595b718a46cb132561cb5ed0e69ef05424f749ed7147a9b485e411d6d4d1cf4ce1db88ded70fff00695115117a5a6a8bdf3d476db6ef8679555c50ef1e4379e067eb5b7ea2823a6a4829a2686c7146d635a390006005103dd27bd62974969e6bbe13e7ac701e003067e7150b911167ce853b4c7e86da8c565af98b6cd7f73696604f9b14d9fc5c9e1c4ee9f03e0b6388888888888a97bb1c00cb8f208c6e3249cb8f32aa44444444444444444445f0804608c854025a704e5bd87bbc0ae4445ad7e9a7addfac36d770a5866dfb7d90790538072d2e6f191c3d6e27e4583d11114b5d9674c4adb0e92a7b36aed3b35deaa8e21143594f3063a568186f580f6e31c473ee58436f3b56bd6d675736f374899494b4f175345471b8b9b0b339393dae2799f5772c7288b92391f1bdb246e2d7b487348e608ed52f34274d09edda5e1a1d53a5e5b95d29e2118aba7a86b1b390301cf691e69efc65478db4ed26f5b52d6b36a4bd08e1f30454b4b112594f10e4d19e678924f695632222e48a57c52b658dc5af63839ae1cc11c8ada87474d6bfe3ed8fd87504b26fd5983c9eb0ff00d68fcd713ebc03ed59111111111152e763801971e4118dc712724f32aa4444444444444444444444201183c57182587078b7b0f7782e456fed16fd1e96d097cd4529c36df432d47b5ad247d785a90afaa9ebabaa2baa9e649ea2574b2b8fa4e71249f94aeb22222222222222222299fee6fea873a1d4da3e693830c75f4ed2eeff0031e00f634fb54c9444444454bdd8e0065c79046377789392799552222222222222222222222221008c1e2b8c12c383c5bd87bbc160fe9cb7875aba3ddda18de5925c2a20a4691dc5e1ce1ed6b485adb44444444444444444459dba0c5e1d6be90b6aa7ce1b72a6a8a4771fd4df1f5c616c8911111152f763801971e4118ddde24e49e65548888888888888888888888888be1008c1e21461f7439ce9765f63b6b2501f2ddbad630fa7b913c633dfe72810e05ae2d702083820f62a511111111111111111646e8d353252edeb464b1fc2375899ec71dd3f515b524444454b9d8e03893c8235b8e3cc9e65548888888888888888888888888bab73aea4b6dbea2e15d3b29e969a374b34af386b18d1924fb1416db2f4b9d5576bcd450ecfdecb359e371632a9f107d44e01f87c78301ec038f7958275c6d275d6b6a7829f556a5aebac34f2196164ce188dc4632300762f0fcdb9b38e1b5cd1ea130fe6fb579ce05ae2d702083820f62a5111111111111111177acb73afb35da96eb6ba99296ba9256cb04f19c3a378390478acafa6ba4bed8acb5cca89355cb7460765d0d744d91ae1da39023d854dbe8e5b66b46d734e4b34703686f345815d45bf90dcf27b0f6b0f1f57259611152e76380e24f208d6e389e24f32aa444444444444444444444444445837a715d2b2d9d1e6f028de633573c14d2b87fa6e78de1edc616b651540904104823910bd11bb72660e1b5cd1c0f2130fe6fb579ce05ae2d702083820f62a511111111111111111676e83374acb7f481b5d3d36fba2aea79a0a8683c377777813ea2d0b6448a973b1c00cb8f208d6e39f12799552222222222222222222222222222b3f6c5a2a9b685b37bc693a8788cd6c3f89908cf572b4ef31dec700b56dae349df7466a2a9b06a3b74b435d4ee20b5edc078ec734f2734f610bc04550241041208e442f446edcd98386d734703c84c3f9bed5e73816b8b5c0820e083d8a94444444444444445f4024e0712a6af40ed8fdd6d3592ed2751d1be8fada7305aa095a5af735df0a52d3c810303da54c254b9d8e0065c79046b71db9279955222222222222222222222222222222f0356e8fd2daba91b4ba9ac16fbb44dcee794c01e599e7baee6df61566fe0f7b19fd01b67ce93f993f07bd8cfe80db3e749fcc9f83dec67f406d9f3a4fe641d1f36340823415b411c88749fcc93ec0b63d24bbf3684b63c9f48ba4cfb7cefad3f07bd8cfe80db3e749fcc9f83dec67f406d9f3a4fe64fc1ef633fa036cf9d27f327e0f7b19fd01b67ce93f993f07bd8cfe80db3e749fcc9f83dec67f406d9f3a4fe64fc1ef633fa036cf9d27f327e0f7b19fd01b67ce93f993f07bd8cfe80db3e749fcc9f83dec67f406d9f3a4fe64fc1ef633fa036cf9d27f327e0f7b19fd01b67ce93f993f07bd8cfe80db3e749fcc9f83dec67f406d9f3a4fe64fc1ef633fa036cf9d27f327e0f7b19fd01b67ce93f997a1a7f631b2cb0d732bad7a1acf15430e58f7c3d6969ef1be4e0f8859000000006005f1cec70032e3c8235b8edc93ccaa911111111111111111111111111111115a5b52d7fa7b66fa6dba87533ea9942676c1bd4f0195c1ce048c81c8703c5636b3f4abd91dd6eb4b6ca5adbb79455ccc862dfa0706ef38803273c064acec8846460aa0799c0fc1ec3dcab44444444444458ff6bbb5cd1fb2c65b9fab2a2ae31713208053d3994f99bb9ce0f0f8415b7a0fa486cd35b6ada0d2f60a8bacb72ae739b0b64a22c6f9ad2e3924f0e0d2b322a5cec701c5c79046b71db9279955222222222222222222222222222222222c27d36ad86e5d1d6fe58cde7d23e0a96f806cadde3f3495adfb3d4ba8eef4756c76eba19d9203dd8702b70368ac65c2d7475f17e4ea6064cdf539a08fb576d108c8c1546770e0fc1ec3dcab444444444445063dd21ba9975c699b3b5e0b69adef9dc33c9cf908fb1a1597d032d82e1d20a8ea4b7228282a2a73dc7019ff00f6b632e763801971e411adc7893ccaa91111111111111111111111111111111115a3b61b2ff88b659a9ec8065d576c9e36f0e4edc383ebcad4b1c8e0460ada9746cbeff88b61ba4ee45c1d20b7b20938f2747e663e46859151108c8c1540f30e0fc1ec3dcab44444444445ad3e9b37b17ae9097b646ecc76f6454607716306f7d64aca7ee6fd89e6f5aa351c911dd653c549038f692e2e7fb38354d76b71e24f32aa44444444444444444444444444444444445448c6c91ba378cb5c0823bc15a98db1d81fa5b6a7a96c2f6ee8a4b8cad600386e171737ea214c9f73b7528b86cc6eba6a47832daab8c8c6e78f5728ce7d5bc1ca50a222119182a81e6703f07b0f72ad11111111752e9590dbadb5570a8735b0d342e95e49c001a093f62d4c6abb81d45aaaefaa2e0e7f575d5b2ced07839fbce2434780181953c7a08595f41b141779a2eaa5bbd6c93b5a06008d9e6331e1c0a902888888888888888888888888888888888888b5fdee83e9575a36b349a8e28c8a7bd51b4b88181d6c7e6b87af1ba7dabc7e829ac069adb6c16aa8977292fb03a8dd9381d68f3a327da0b7fdcb6328888878f02a968dde19c8ec5522222222c31d31f5845a4b61d7519ff3377736dd0b03b74bb7f3bfc7b30c0ee3ea5add68a9bbdce0a6899992691b0c31307019380005b67d9be9e8b49e82b169b89ad68b7d0c50bb1c8bc346f1f6bb255c4888888888888888888888888888888888888b00f4e8d1aed4fb149ee94d0f5959609856b70327aaf8328f560871fd85af3b25ceaacf79a2bb50cae8eaa8e764f0bc736bdae0e07e50b6cfb34d5147ad74259b5450b9a62b852b257341cee3f187b7d8e047b15c68888888888888a00fba05ae9b7fda4d1e91a29b7e92c111ebb0781a89305df234347af2ad1e863a30eaedba5ae59a2dfa1b30371a82470cb3f263daf2d38ee056cb11111111111111111111111111111111111111752eb454d73b6d4dbab226cb4d5313a1958e190e6b8608f90ad506d7347d5683da2de74b55077f92a97085e47c388f163bc72d23db95273dcf2da3869b86cdae3381bdbd5b6cde3dbff1183ea77caa672222222222222b4b6b9ace8b67fb3dbbeaaae7371470130b09fca4a783183d6e216a8eff0074adbe5eab6f37198cb595b3be799e7b5ce393f6a9f5d02b411d33b2c935356c3b95fa86412b778608a7664463da779ded523d11111171c92c51e3ac91adcf2c9c2ac104020e41e4bea2e27cf04670f9a369ee2e0172a2222222222222222222222222a2525b1b9c39804850d7a636969b5269b975d474d13ea6db0361ab7319e718cbbcd793e04e3da144cd1d7fb9696d516dd456998c55d6fa86cf13bbc83c41f02320f815b53d936b8b5ed0f42dbb555a9edeaeaa31d7459c98251f0e33e20fd583daaed4456e57dfe48f51c16a8a300195ad7b8f6e7b95c6adaa4bf4d57aa3dee6b1ac8185ed77697100ab9511111404e9d9b551aaf5747a1acb51bf69b2484d53d872d9aab91f5860e1eb2561dd86e81adda3ed32d5a629dae6c12c9d6d64b8e1140de2f77c9c07890b6875fd569ed2ec86dd0323868e1643047d8d6801a07b02a74655d4575a5f3d4bf7e4333867c3017b88889945666d25ce6ba88b5c4677b91f52b9add2b23b3d34b23dac60a7639ce71c003747125602db1f4a8d2da4e49ad9a4a8dfa9ee8cf34cb192da48ddfb7cdffede1e2a2a6d03a456d7753ccf6546a19ecd4cfce29adcdea001fb43cef6e562fafbedeae1389ebaf170ab97783b7e6a97bdd91c8e49e6a6a7445e918cbfb297426bbad6b6ecd023b7dc257605501ca379fcfee3dbeb52c511111111111111111111117997bbcd25a98d3312e91df0583995e07f8cdfbd9f223b9deae0b35ce3bb50be7898e6004b483df858da90d0cd6db9db2e5442b692e14aea69613c9cd77020fb1406dabe936e85d6b5961b85b246d3876fd24fc4759113e69f5f61f10b22f44bda74bb35d6d1db2aea9d3695be1dd973ff0097940e1263ea3e1ea53af48ea417e9098db1988c42563d8ec87038c107bb8af6ee550ea5b7d454b4073a28dcf00f6e06579161becd71b7d6543a26b5d00cb40ede04ff000565d45ce796fadb91871307b5c198ed185ed9d5b753ca847cc2bc4a2b95553dedd5f1420cee738ee6e93cf39e0af5d2d76aeb93a71594e2211805be6919f9579d79d5551e58ea3b54024703bbbfba5c49f001751ba96fb43235d71a4cc6e3e9c4584fa8abc2d95d05c28995501f31c3883cda7b4156b5e35555beb5d4768843b75dbbbfbbbce71f00b17edf36b973d13a36b6d4e9cc57fae8bf12e2cdd75342410f971dfd8df1f5281adafacad9e4f7ae81b8de25cf733ac7b89ed738f69536ba24688d41a26c115daef6a64775bdee176fc1bae8a0e6d6e472cfc23ecee59bb5fcb5e182289a4d2160321dde00e7bd78563a8bec744596d639d0ef9ce1b9f3b033fc15db59769ad9a721aaab6e6a9e37774f0f3b8ab6db75d4956d13441fb8ee5bace0af2d3efa97da29df599ebc83bf91c7e11c7d497eb836db6d92a9c32479ad1de4f2567d33f51deb7aa2191cd8f3818380b9e86eb79b4dc594d708df2b1c7963271de17cdac55535150535755ccc829e1648f92479c06b400492a1ef484dba5d757c11d8ecd5535bb4853d3461fd592d96e2edd1c1c79867eafcab035154cef2fba564862a561fc5c4de1be7b1a3c178d72ac96baadf5131e2e3c00e40772eaa97dd107a3a3eba6a2da06bba37329185b35aedd20c1948e2d9641f9bda076f3e4a6c818181c02fa888888888888888888888b1feb0fc5eac8e5aa6b9d4f98ce3bda3191f6ab9e9ab2c3511b58c34f870c00400bd2a2829e9e1dca6635b193bd86f2e2ac6d9e471c9779c48c6bb101232391de0adee949b2ba1da2ece6b5d053c42f76d8249e825c60b88193193dc71f2ad7d692a7a8a79a5a3ac89f14d495ad0e8de3058edd787023d8b3b7430db6c5a72e4ed2babeaf76d4620ca4ad90fff004c4bda031e7f332781ecf529bf78919369fad9237b5ec752c8e6b9a72082d3820ab7f669c61af69e232cff00fa5d1bdb1acd7d0343406f5f070c70f455f9d4c5fe9b7e45625b1a1bb427b481bbd7cbc3fdae57c4e0369e52d1ba770f2f52c7ba36be8add709a6ae76ee63dd69ddc9ce78af6f505fecb5d68a8a66cae7c8e6f9998cfc2ec5f3403ddef256b778f9af247879ab13eb9dabd9f65b64b95c676c7597934dfe4a8b7bce738b80de777301e67b790506ee7a96efacf54ddaefa86e0ea9b95d2370323dd81bd905ad1d81a00c01d8b2cf44dd9ff00bf17ef7df53db267586dd54d95ac3e6f94cede4cc1f84c1c09f914f4b5ea4b5d648d81af30bcf06b5e31ecee5cdac4674d567ecb7f782f3f66e7ff0004987ff92efdd6aa76891be4b6d36e30b889bb07815ea694696e9ea36b81690ce20facae4bd5da9ed5146fa80e224240c05e16b6aa657697a5aa8b219254348cfecb97ada331fe1aa3c0ec77ef15ea3e28def6bdcc6b9cde448e4a15f4feda59adaba5d0965a8229e9247fbe6f61f87261a445ea1ccf8fa94537d69af9e861ac71652c4d645c3b000012abd4ce9857750e68653c631035bf0777b0fb5790a5e7443e8e6eb89a4d7dafa84f910c4b6db6ccdfcb76896407d1ee6f6f33c14da6b5ad686b400d030001c005522222222222222222222222e9dcadf47708fabaa8daf2391ed0adeb9e92a3653cb353ccf8dcc6970c9e1c151b3cad9e5f29a595c5ec8c02d27b39f05d1d9e79b7ca81ff00448ffb82bcef43367ad1df4f27ee9514f6afb1b7ea386b756e96a506eb03a392b699831e52c01c379a3b5e3eb0a1c5a60904f71a2734b27742e6063860ef070247af82cf5d1c7a406a1d1d413e93d56ca9b969d6d2c82191c099a8f872693f099fabd9d9dca5e6c3b5159b52daaaae363b8c15b4afdc3bd1bb25a78f070e60f815d9d5cef26d5f0d4bc1dc0e8dfeb031f72be69aa60a88daf86563c386460ab0e699b41aedd3cfe6b04ee24f838119fad5f7d6c55303c432b24cb4fc17679858f74bd3d04b78969ae4d660821a1e71e7655d370b5e9ab7c066aca782260fce71e3f5ac2fb60dbfe92d1303acba26282ef75ab0e699a176f535390d3f09d9f39dfaa3daa0adc6f574d415d7abb5e2ae4acac9d9bcf9243fae380ee03b00e4af0e8efb21baed4b5379ce928b4fd0b83ee570c603073dc69ed79fab9ad90e9cb369ab5e9fa3b35aa1a514347136285b90e21a3bcf324f6956eeb482db4f5708b7eeb65e3d6358720777b55d572866a9d29246f04caea7048f1183fc15bda16ef4b4314f4955208b79fbed71e5c80c7d4af663a29e26c8ddd7b1c32d3cd705757525bd8c35323626b8e1aad0d7175a2afa6a78e9661239af24e3b173dce8e67681a56ee1de88b6423c38fdeb9f47dea862b4c74b5133629222479dda324ff15e3ed4369743a474c5c6ef0b3ca052d3b9c31e93f9300efc9c2d6cebc9a5aa69aca8a87d45454564d34d238e497bf0e77d6575e58e927a3a4b6b98d8a47d33248a4ef791c41f5aeb5381570bad35be654c44881eeeff00cd2a45f427d89da75757546b5d5223a9a4b5d57534f6f737cd926001de93bda32303b4f353b9ad0d686b406b40c00070015488888888888888888888888ad4bedbafcfb9c95747379871bad0ec602f3dd43aa2b1a619647861e7938571e99b332d14ce05dbf349c5eefe0bcdd2f63acb75da5a89cb3ab7308183e20ab8ebe274d433c2df85246e68f59185e268fb354da5d51e50e61eb3771bbe1951f7a4cf46666a9aea9d63a0faba3bdb8996a68fe0c7527b5cdfcd7fd45435bbdaaf56eada8b5de2abc8aa21718e686605af69ed0415dcd1fad2f1a027755e91bfd652573ded739f11c30819e0e69e0e1e05481d23d2d61bad24345b43b0e2a63186dc6d9c37bf6a271fb0fa82ccdb39db56c9a6aa35035e50d38733744558c740e0491f9dc15ed76d4bb39d40c1554fad2c6d9070eb1b5b1f1f582579543b4ad98e906d43ee3b44b13f7c0c3193873b8679004e5628da3f493d9636a647e9c92e170ab39cbba831405dfb47cef6805479da16d7f50eaf6c94f59a8db416c3ce8adb13da641dce7bb04fd9e0b1dc176845ce9b11982860de0d60f38f1046f1ef25665e8f3b03b9ed22696e2f9eae8b4dc84365ac7d3756651bc096c592778f8e303ea53c34e689d3fa6b47c3a56c144db75b616e1ad8be138f6b9c7d224f124ae8cba238e62ad047eb330bbf68d2747473367a890d43da720118683fc55c9818c638772b7ee1a4add553ba5639f0971c90de4bdaa281b4d49153b497363686827b70ba97cb441768a38e77b9a23248ddf15d0a3d256da79848e2f9707387725ef398c746632d05846318e1856fd6e91b7cf217c65d164f21c947ee9cb353691d9350d251f9f5573b8b2325fd8c635cf247b4354218ae54efa114f5b0be522473f781c712b82e95acaa961742c31b628dac6f1e3c1760dd29e711beae97ac9d800eb03b04e3929e5d00eb5b5fb2cbaced8bab3ef9969f1c31bc548f44445e26a1d53a7b4ed5dbe96f978a4b7cf719fa8a364d206999f8e43fbee5eda222222222222222222f27516a2b0e9da2756dfaf1436ca768c97d4ced8c63da78ac2facba59ec9ac2e7c3415770bf4ed2462869fcccfedbcb411eacac51a87a6e5c5ee7374f687a5847a325755b9ff2b58063e5572f460e91babb697b583a7351d3da2928e5a19658194b139a4cad2d2065ce24f9bbdf2296088b18eda7629a2f6a7427df9a334975637105ca9806cccee0eec7b7c0fd4a116d77a356d1b41cb2d553d03aff0067664b6b68185ce6b7f5e3f84dfac78ac2b2c6f8a4747231cd7b4e1cd70c10550888aead07b3fd61ae6e2da2d2d60adb8bc9c3a46478899e2e79f340f5952ff61fd10ad166960bced1aa62bbd6370f65b6027c9987f5ddce4f5701eb529e8e9a9e8e963a5a482382089a191c51b435ac039000720bb08b1ef486d6b59b3ed91deb54db9d08aea56c6da6eb5bbcd2f7bdad008ede6a28593a6b6b9a77b45df4c58aba31cfa93242f3edde70fa9649d2bd34f45d6bd916a2d3776b4b9c78c90b9b511b7d7f05df2059ab436d8f66bacc31b61d5d6e9677f2a79a4ea65f98fc157e8208041041e442fa88a1ff00ba56e3ef368c6e4e0d455123fdb1a84e88a7bfb9d55103f65779a66cd1ba68ee85cf8c386f34160c123b8e0a942888ac2db56d3f4f6cb749c97abdca24a8782da2a363bf19532638003b0779ec5ad5da9ed0b51ed1757cfa92ff0056e74ce38a7858e223a666783183b31dfcc9e2a5bf42fdbdd56a77d3ece7574cf9eed1c47decac392ea8631a498de7f39ad04877681de38cb044444444444444458ff6abb5ed09b34a2326a3bcc42af7731d0539125449ea60e43c4e02889b53e981acefce9a8b45d2c5a7280e5ad9dc04b54e1dfbc7cd6fb06477951db505faf5a82b9f5b7bbad65c6a5e4b9d254cce79c9e7cf92f2d15cdb2fd5757a1b5fd9b55d102e92dd52d95ccce3ac6727b3dad247b56d6b48dfed7aab4dd06a2b3d4b6a282ba16cd0bc1ec3d87b883c08ef0bd8444561ebad916ce75b073b50e93b7cf3b863ca238faa947fbdb82b0eea1e861b3dac95efb45f2f76b278b63df64cc1f386f7d6ad87f41fa4df3b9b409c373c01b70271f3d77ed1d08f4ec6f06ebadae950ded14f4cc8b3f3b7964ad1bd17b643a76464efb0c9779d9e9dc6632b49efdce0dfa9660b55b682d546ca3b6d153d1d3b061b141106347b02ee2222853ee826d261b855d0ecd2cf375c692515573319cfe33188e2e1da012e23c4772880f6b98e2c7b4b5c0e0823041542a9ae731c1cd25ae072083c42ca5b33dbeed37423e38edda826aea061e3455e4cd111dc33c5bec214b3d9074b5d11aa9f15bf55c474c5cdf86892476fd2c87c1fcd9ea770f1522e96782aa9d9514d34734320de6491b839ae1de08e6b9945af746ad2faad9958af11b0bbc86e9d5bc81f05b24678fcad68f6a81888af1d946bfd43b36d5b4fa8b4ed575723086cf0389eaaa23cf163c768f1e63985b2ad8b6d3b4eed4b49457bb1ca193b30dada27b875b4d2638b4f78ee7768f915fa8ac2db56d434f6cb749c97abd4a24a8782da3a363bf1953276003b0779ec5ad3daaebfd45b47d593ea1d43526495e4b6085a7f174f1e783183b07daad059fba065a1f72e9034558d1e6db286a2a5c7bb2deac7ff00b16c69111111111111174aef72a0b45b67b95d2b20a2a3a7617cd3ccf0c631a3b492a19edffa5c5555bea2c1b302ea6a6196497891bf8c93ff0049a7e08fd63c7c0289773aeadb9d74d5d71ab9eaeaa67174b34cf2f7bcf7927895d4444459f3a2b6df2af65d70f78ef7d6d6696ab943a46378be8de79c8c1da3bdbdbd9c56c234d5f2d1a92cd4f79b1dc69ee14150d0f8a681c1cd23f81f03c42f511152e76380e2e28d6e3c49e6554888888a3b74a0e9156ad9f5bea34e695a986bf55c837096f9d1d083e93cf22fee6fb4f8ebeee35d5970b84f70aea996a2aea2432cd348ecb9ef272493df95d80e6dc1818f21b58d1863cf0128ee3e3dc7fb1e7bdae63cb1ed2d734e082304154222cafb14dbaeb9d9855c705bab0dc6cc5c3acb6d538ba323f50f361f57c8b643b3ebfcbaa7475b350cb69adb4baba112f925580258f39e78ec3cc7811c02c57d35efda568362376b36a2ac0dadb9340b653b38c924cc70735d8ec682064fdf85adb444575eccb5dea2d9e6a8875069bad753d44671246ee31ceced63dbda0fd4b39fe1a5b46ff90e9ffa393f993f0d2da2ff00c8b4f7d1c9fccb07ed435fea3da36a99b50ea4aceba7779b0c4de1140cec631bd83eded568a29c7ee74e8c7d0e97bdeb7aa8b0eb94a2929091ff000e3c9711eb71c7fb54b544444444444456d6d175ae9ed01a62a350ea5ae6d2d1c230d1cdf2bfb18c6fa4e2b5d1d2076e5a9b6af757452c925bb4fc2fcd2db637f9be0e90fa4efa8762c468888888afed91ed635a6cc2e9e55a6ae4e14d23819e866f3e09bd6dec3e23054cfd92f4b2d05aa990d16a871d2f73760133bb7a95e7c24f47fdd8f5a9036eaea2b8d247574159055d3c837992c3207b5c3bc11c173b9d83ba38b8afad6ee8ef2799ef55222222c7db47db16cf367f4ef3a8b51d336a9a3228a9dc25a87786e3797ace078a883b6de967aa7554735a34543269cb5bf2d7546f66aa56fed0e0c07c38f8a8d72cb24d2ba595ee7c8f25ce738e4b89e6495c4be8241c8e057a4d736e0c0c9086d5b4618f3c04a3b8f8f71fec79ef6b98f2c7b4b5cd38208c10550be8049c019254cce887d1cb1e49b40da0d171e12db2d9337976896507e50d3eb2a436dcb6ada77653a49f75ba3c4d5b282ca0a063b0fa8781f534769ecf5ad6a6d335c6a0da1eaaa8d45a8eaccd5329c4718e11c2cec63076342b5d111111115d1b32d1976d7fadadda5ecf1174f59280f7e3cd8631c5f23bb80192b6aba1f4e5bb48e92b669bb547b9476fa76c31f7bb038b8f89393ed5eda22222222222b7b681abac7a174a56ea5d4354da6a1a56649f4a477a2c68ed713c005ad0dbbed66ffb57d54eb9dcde69edd065b4140d7659033bcf7bcf69fe0b1ba2222222222bc742eb0d55a364172b1ea3b8daa30ecb6282721b33877b3e091e247f4cbfa4fa61ed32d5865de92d37b8876cb118a43eb734ff000593ec3d36ec3206b2f7a2ebe9dde93e9aa5af6fc8402af1a0e985b249d83af17ea576393a8811f2872f5474add8c900fbf95a3ff64f5d6ace96db1ca71e65c2eb51c3388a84fc9c4856e5e7a68ecfa981f7aec17eaf3d81ed6439facac79a9fa6c6a19c3e3d3ba46df4608f365ab99d2b9a7d430161cd6dd2036b1ab44915c3565552533f9d3d07f9767fdbe77d6b184b23e591d24af73dee39739c7249f12b8d1117d048391c0af49ae65c182390b5956d1863cf0128ee3e3dc7fb1e7bd8f6c863735c1e0e0b48e20f72995d10fa3963c93681b40a2e3c25b65b266f2ed12ca0fca1a7d65487db9ed5b4feca749baeb747b66ae941650d0b1d87d43ff834769ec5ad5da66b8d41b42d5953a8b51d599eaa6388e307f17033b18c1d8d1fd55aa88888888bd7d2b60bbea7bed358ec3433575c2a9fb914313724f89ee03993d8b639d1936296ed9369c3354ba3abd495ec1e5d540708c73ea99faa0f33da7d8b32a22222222222ebd65553d151cd57573320a7818649647bb0d6340c924f60016b63a54ed96af6a7ac9d4f412be3d336d7b99410e71d69e46670ef3d9dc161644444444445e852c0c6c7e57560f55e8339194fddde7fb1d7aba892a65eb1f81d8d68e01a3b000bae8888888888888aa19c8c673d98534ba27747c3336835fed0adc3ae6e24b750cade247a32ccd3dbdc3e5ecc480db9ed5b4feca34a3aeb747b66ad9416d0d0b1d87d43ff008347695ad5da66b8d41b42d5953a8b515599aa66388e31f93823ec63076347f556aa2222efdc2d574b736175c2dd5746da86092133c0e609187939b91c47885d045cf4b4f3d54eca7a68249e579c3191b0b9ce3dc00e6b37ec9ba306d1b5ac91555ca89da6ed4ec13515ec225737f562f859f5e14dcd8cec7b476caed460b0d1f5d7095a054dc6700cf37867d16fea8fad6464444444444445117a7bed6df6eb7b766362a9dda9ac6096ef231dc5911e2d87fddccf860769508511111111117a14b031b1f95d58222f419c8ca7eeef3fd8ebd5d4495326fbf1dcd68e01a3b000bae8888888888888be8049c0192a667444e8e58f24da06d068b8f096d96c99bcbb44b283f2869f59521f6e7b56d3db28d26fbadd5c27ad981650d0b1d87d43f1f5347695ae0da1eb5bd6d33524f7bd4557bd717922068388991e722268f440ec3dbdbdeacd7b5cc7963da5ae69c1046082a844452c7a2274727dfdf4baef5e51b9b6969125bedd2b706a88e52483fd3ee1e97ab9cd6ba596cf75a2f21b9daa8ab6980ddea6781af663bb046158177d80ec76e6f73eab415a9ae773f270f807b0464617568ba386c56924eb22d0946e77fd5a89a41f239e42be74d68ad23a6411a7f4cda2d848c175352318e3eb2064ab8511111111111115b7b49d596fd11a1eedaa6e4f020b7d3ba40d27e1bf93583c4b881ed5aa3d617fb86a9d4f70d457698cb5b70a874f2b8f793c87801803d4bc74444444445e852c0c6c7e57560f55e8339194fddde7fb1d7aba892a65df791dcd68e01a3b000bae8888888888888be8049c019254cce887d1cb1e49b40da0d171e12db2d9337976896507e50d3eb2a43edcb6ada7b653a4dd74ba3db3574a0b686818ec3ea1ff00c1a3b4f62d6aed2f5c6a1da26aba9d47a8eb0cf5331c4718e11c0cec63076347f52ad60707217a4d732e3188e42055b4618f3c0483f34f8f71fec79ef6b98f2c7b4b5cd38208c105508a58f444e8e6fbfc94baef5e51b996969125badd2b706a88e52483fd3ee1e97ab9cdd33d253cf4f44668217c8d220877834b83471dd6f68031cb92ed22222222222222222286dee8aebb708ecdb3ca29c80eff00c42e01a79f31130ffdcec7eca860888888888bbf4b031b18aaab69eabd0672329fbbbcff0063af5551254cbd64847735a38068ee0b8111111111111117d009380324a999d10fa3963c935fed028b8f096d96c99bcbb44b283f286fb4a90db73dab69dd94e937dd2e9209eba505b416f63807d43ff83476bbb3d6b5a9b4cd73a83687aaea3516a3ab3354ca711c6383216763183b1a15ae8be838390bd26b9970608e421b54d1863cf0120fcd3e3dc7fb1e7bd8e8dee63da5ae69c10471054aee887d1c9f7e92975debca3732d2d224b75ba56e0d59ec9241fe9f70f4bd5ce586d6f689a6f65da3a4be5f266b18c6f5749491e04950fc706307da7900b5fb57b77d5975db95af69174a83fe42a8753451bc88a1a6270f89beb69393da78ad975aabe9ae96ca5b9514825a6ab8593c2f1c9cc70041f90aeda222222222222222a247b638dd23c86b1a09713d802d52ede75649ad76b7a8b50b9ee7453563e3a704e776261dd60f5602b111111111177e9606362157560f55e8339194fddde7fb1c15751254ca647e3b9ad1c0347600175d11111111111117d009380324a999d10fa3963c935fed028b8f096d96c99bed12ca0fca1bed2a436dcf6ada77653a49f74ba4827ae972ca0a063b0fa87ff068ed7767ad6b57697ae7506d0b55d46a2d455666a994e238c70642cec63076342b591117d1c0e42971d13fa3ebb5236875e6d0681c2dd110fa0a39060d601f064947e60ecefede0a54ed6b689a6f65da3e4bedf266b18c1d5d25247812543f1c18c1fc7900b5abb61da4ea2da7eae9afd7f9ce325b4b48c27aaa68f3c18d1f69e64ab1d6c7fa0deaf76a6d87d250d44dd655d9277513f2727abf851e7d871ec59e5111111111111111585d20f511d2db19d537a649d5cd15be46427fea3c6e37eb72d52222222222efd2c11b63155560f55e847c8ca7eeef3fd8e0aba892a65323f1dcd68e01a3b000bae8888888888888be8049c019254cce887d1c71e49aff0068145c784b6cb64cde5da25941f9437da5486db9ed5b4eeca7493ee975904d5b282ca0a063b12543ff0083476bbb3d6b5abb4cd73a83685aaea3516a2ab33d4cc711c60fe2e16763183b0056b22222965d10fa39beff002536bcd7946596969125bedf2b706a88e523c7fa7dc3d2f573961b5ada269bd97e8f92f97d95ac635bd5d251c7812543f1c2360fe3c805adfdabed12f7b57d4d25defb388a7692da1a6638f530c59c88c03c8feb769e7e1603d8e8dee63da5ae69c104710550a56fb9cba89d49af2fda62490f575f422a636766fc4ec13f23bea53ad111111111111111472f7416f06dfb0d8adcd760dcee90c2403cdad0e93e4cb02d7a22222222efd2d3c6c84555583d5fa0ce4643f778ff0063af5551254ca64908ee00700d1dc17022222222222222fa012400324a999d10fa3963c93681b41a2e3c25b65b266f2ed12ca0fca1a7d65486db9ed574eeca7493ae974789aba50594140c761f50f1f63476bbb3d6b5abb4cd71a83685aaea3516a2ab3354ca711c60fe2e06763183b1a15ac8888a58f443e8e6fbf494daf35e51b996969125bedf2b706acf648f1fe9f70f4bd5ce58ed6b689a6f65da3e4be5f666b18c6ee525247812543f1c18c1f69e402d6aed87693a8b6a1ab66bf5fe73ba32da4a4613d553479e0d68fb4f32559038715e931ccb8462391c1b54d1863cf0120fcd3e3dc7fb1e7bd8e8dee63da5ae69c1047105659e8817775a3a43696937cb63a999f4b27887b1c00f9dbab678888888888888888a20fba535ae658b46dbf7b84b5353316f7ee35833ff007a84a888888bbf4b4f1c708aaab07aaf419c8c87eef1fec75eaaa24a994c9211dc00e01a3b82e0444444444444445327a1c74788a7868b689ae2903d8ec4d6ab74ade047a33480fcad1ed522b6e5b56d3db29d24fbadd1e26ad94165050b1d87d43c0fa9a3b4f67ad6b57699ae3506d0b55d46a2d475666a994e238c1f3216763183b1a15ac8888a58f443e8e6ebf3e9b5e6bca3732d2d224b75be56e0d51ec91e3fd3ee1e97ab9cb1daded134decbb474b7cbe4cd6318ddca4a48f024a87e383183ed3c805ad5db0ed2750ed4356cd7ebfce7746594948c27aaa68f3c1ad1f69e64ab1d17d1c38af498e65c2311c8e0daa68c31e780907e69f1ee3fd8f6f6475125b76b3a56a5c0b1d05ea94b81e18c4adc8f932b6d4388ca222222222222222867ee987ff62ffefbff00f050cd1111177e969e38e2155560f57ff0e3e4643f778aebd5d449533192423b801c034770f05c088888888888888b2d7452d9ec5b45dafdbadd5d1192d5420d6d70c70731846187f69d81eacad886d4b595a7673b3eb86a6b88020a18836185bc3ad90f0646df59c0f52d5fed2f5cea0da16acaad47a8aaccf5331c47183e6411e783183b00fea9a53679adf55d2baab4ee95bb5ca06e733414ce31fa83b913e0bc6be59eed63b83edf7ab6565baad9f0a1aa85d1bc7b1c32bce4452c7a21f47375fdf4daf35e5139b6969125badf2b706a8f3123c7fa7dc3d2f573961b5bda269bd9768e96fb7c99ac6306e52524781254498e0c60fb4f2016b5b6c3b48d43b50d5d35feff0039038b6929184f554d1e7835a3ed3cc9563a2222bab43be3aed5d636ccf0caa657c1b921e5201237cd3e3dc7fb1b6c8ff26df5055222222222222222877ee9652bdd6ed155833b91cb5719eecb84447ee950ad111177a969e38e1155560f57ff000e3e4643f778ae0aaa892a6532484770038068ee0b811111111111111114d3f735ed51790eafbdb99f8eeb29e95aefd5c39c47ca02e6f748ef9510d974a69d639cd86aa69aae403938c61ad00fcfca8d9d1c744d2ed076c363d337027c8a57ba6aa68382f8a3697b9a0f6640c2da3daadf456ab7416eb6d24349474ec11c30c4c0d631a0600002c57d2b367367d79b2abb4d3d2462ef6ca67d5d055067e31ae60de2ccf3dd700411edec5ac6452c7a21f47275f9f4baef5e5196da5a4496eb74adc1ab3d92483fd3ee1e97ab9cb1daded134decbb48497cbeccd631a3aba4a48f024a87e383183ed3c805ad5db06d27516d4356cd7ebfce43725b4948c27aaa68f3c1ad1f69e64ab1d111115cbb2da535db4cd2f461bbdd7dde963c679e65685b6e68ea801e87eeff45ca88888888888888a367ba1766757ec5692e91b726d9748a47bb1c98f6b99f6b9ab5f4888bbd4b4f1c710aaab1f8bf423e4643f778ae0aaa892a6532487c001c0347705c08888888888888888a65fb9b37985aed5ba7deefc6bfa8ac6027b06f30e3e705ec7ba3da6e7abd27a7354431b9f1dbea64a69881f01b280413fee601ed515361bae1db3ada859b5618dd2c14b296d4c6df84e85e0b5e078e095b43d1baaf4feb0b2c379d3b75a6b851ccd0e0e89e096e7b1c39b4f81587fa5ced86c1a3b67b74d374571a7aad477481d4d1d3452073a9dae18748fc7c1c0ce01e24e16b914b1e889d1c9f7f7d2ebbd7946e6da5a4496fb74adc1aa2394920ff4fb87a5eae72c76b7b44d37b2ed1f25f2fb3358c68dca4a48f024a87e383183ed3c805ad5db0ed27516d4356cd7ebfce77465b4948c27aaa68f3c1ad1f69e64ab1d111111656e8996575f3a40e95a70c2e8e9ea8d5c87f3446d2e07e706fcab684b8ff27fb1fbbfd17222222222222222b336d7a586b4d95ea2d361a0cb5744f10646712b46f30fce016a82a21929e6920998639637163da79b5c0e082b85177a969e38e1155563f17ff0e3e4643f778ae0aaa892a65324878f200700d1dc170222222222222222222c91d1cf680766db57b56a098bbdef2e34d5ed1db0bf838e3bc703ec5b2cd5563b0ed0b435559ebbabadb45de946ec919072d70cb5ed3de381056b4f6ddb21d55b2dd412d1dda9249edaf79f23b8c6d26299b9e193e8bbbc156151dc2be8b3e455b534dbdc0f552b999f90ae173a5a8972e2f96471c6492e738a965d13fa35d45d2aa9f5aed0edaf82dd111250dae76e1d50ee61f2b4f260ec69e7dbc39cabdad6d134decbb47c97cbeccd6318ddca4a48f024a87e383183ed3c805ad5db0ed27516d3f574d7ebfce71c5b4948c27aaa68f3c18d1f69e64ab1d11111114b9f739348bea3515fb5acf11eaa9201434cf3daf79de7e3d4037e5537d171fe4ff63f77fa2e444444444444445ae6e9b1b3297446d3a6bf50d396d92fef75442e6b7cd8a6ff00891f871f38781f0580177a9a9e38e1155563f17ff0e3ed90fdde2b82aaa24a994c921e3c801c0347705c08888888888888888888a4c7455e9212e828e1d21ac4cd55a6cbb14d52df3a4a1c9e58f4a3f0e63b3b94e2a1acd2fae74df5d4b3db6fd68aa671c6ecd13c1ec23f8158e2f9d19362f76aa754bf48b692471c9149552c2cf506b5dba3d817bfa1f625b2ed1954dabb0e8fa18ea9872ca89f7a791a7c1d21247b151b64db268bd985aa49af3708ea2e5bbf88b6d3bc3a790f6647a23c4e16ba36c3b49d45b4fd5d35faff0039c716d252309eaa9a3cf06347da7992ac744444445dcb4d0565d6e74b6cb7c0fa8abaa95b0c113065cf7b8e001ed2b69db05d030ecdb6636bd32cdd754b19d756c8df4e77f179f50e0078057f222e3fc9fec7eeff0045c8888888888888ad1dac683b26d1f45d7697be4398a76ef4333479f4f28f83237c47d63216b4b69fb37be6ccb53d45a354d310d8dc7c92467c0ac67639a7bbbfb472564d5544951319243c790038068ee1e0b811111111111111111111115c1a3f58ea9d2157e57a6afd5f6a94f334f316877ac722b2ad074addb452d3885d7ea3a9dde4e9a8222ef940195e46a8e921b61d434eea7a8d5b351c2e182da18994f91dd96807eb58a6b6aaa6b6a5f5559512d44f21cbe495e5ce71f12575d11111117244c7cb23638d8e7bdc70d6b46493dc14e7e867b01974c887681aca9836f12b336da391bc691ae1f947773c8e43b07ad4ad44445c5f93fd8fddfe8b951111111111150f71ceeb78b8fd5e2ad8da2e81d2fb40d3b258f53dba3ab81de7472729617fe7b1dcda541bdb4f455d6ba3e59ae3a59926a5b28cb8752dff00350b7b9d1fa5eb6fc8147caaa79e9677d3d4c32432b0e1cc91a5ae69f1057022222222222222222222222222222222be366bb2bd75b43ad6d3e98b0d4d4425c03eae46f574f1f8b9e787b064a9bdd1ff00a32e99d9dc905f2fef8afda8da039b2399fe5e99dff4da799fd63c7b805209111111717e4bff004ff77fa2e5444444444543dc73bade2e3f578afac6868ef27993daaa4565ebcd96e82d70c77f89b4cd056cceff00cc08f7261e3bedc1581f58742cd235ae7cba6352dcad2e27cd8aa182a236fd8efad62bd43d0d369542e73ad373b1dda31c875ae8643ec70c7fdcac4bbf46edb3db77bacd13553b47a54d3c52e7d8d712ad9add92ed3a889f29d01a92319c64dba423e5030bc5a9d1fab29b1e51a6af116796f51c833f52e94d66bbc3218e5b55746f1cdaea7703f62e3f7aee7ff2eacfa177dca8f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb954db75c1df0282a9dea85c7f82fbef5dcff00e5d59f42efb976e1d35a8a62ceaac5737efe3777695e739e58e0bd4a3d9cebfac38a5d15a82639ddf32df29e3ddc97bf6cd846d7ae0408767f7b667975f0753fbf857958fa256d8ae0e1e556db65a81e66aeb9a71f47bcb24695e8495af74726a8d690c4cf4e1b7d3173bd8f79c7fdab34684e8c7b26d2ae8e77d91f7aaa660f5b7293ac191da19c1a3e459928a969a869194b474d0d34118c32289818c68ee00700bb088888888b8bf25fb1fbbfd172a2222222a1ee20eeb78b8fd5e257d634347793cc9ed552222222260772f981dc10b5a46081f22eb7bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdcb96182084110c31c60f30d68195c981dc17dc0ee08888888888888888b87f25fb1fbbfd3ec5cc88888a87b883bade2e3f57895f58d0d1de4f327b554888888888888888888888888888888888888888888888888b87f25fb1fbbfd3ec5cc888a87b883bade2e3f57895f58d0d1de4f327b55488888888888888888888888888888888888888888888888888b87f25fb1fbbfd3ec5cc8b8dee20eeb38b8fc83c4aa98d0d1de4f127bd548888888888888888888888888888888888888888888888888888b87f27ff00a7fbbfd3ecfb39952d686e70399c955222222222222222222eb57d54345453d6543cc70411ba595f82775ad19270389e03b17cb6d6d3dc2df4d5f49275b4f53136685fba46f31c0169c1e23208e6bed555d2d23633555315389656c51995e1bbef71c35a33cdc4f003995f21aba69ea2a2086a61926a67064f1b5e0ba225a1c0380e2d25a41e3d8415da5d7ada9a6a2a596aeb278a9a08585f24d2bc318c68192e713c001de57334873439a41046411c8aa9742c576a0be5a69aeb6ba8ebe8aa99bf0c9b8e6ef37bf0e008f685df4445c7248c8e3749238318d04b9ce38000ed2adbb46bdd23756d63e8af90399474e6aa7748c7c404239ca0bc00e67eb3723c55141aff0049d7d0d656d25d1d24544c63e76f92cc246b5e70c708cb37dcd2793802171c5b47d1f2d2c9570dce79228e7f2790b682a09649bbbdba5bb991c083cbb526da3e8b86d745737df19e4b5b1be581cda795c4c6c76eb9e5a1bbcd60231bce0078aec5e75de93b3d5434f70bdd3c4f9a264ed2d6b9ec6c6f386bdee682d634f639c402973d73a5ed9786da2bae124358f9a3818d349316ba47e371a1e19ba7391daaaa1d6da5ebaffef152de2292bfac7c4d8c31e1af7b3e1b1af2371ce6e0e5a092307b95569d6ba5eeb7b759682ed14f5c0c81ac0c786c85870f0c791baf2deddd270ae3444444444444445c5d4b3f34fca7ef5ca88888888888888ac0db3457e8ed14179d354f575571a19e460829dae717b6685f164b4730d7ba37e7b0349563dbac9aba82c35b709a9eef5559a5ab29a96df1eec9bf5f0415323a47b5bcdfd6412b5b919c9663b175ecfa6f5ccb60bc50dc1b7335963b79a9b74ae0f02aeae674554430fa5baf89d1e38e37c8ed5e9e888f5643aa25b85eadd7b36d68aad4a23ea1e5c24959d5b28daded7b5bbe7abe60e3864a6a2a4b9cbaf6f13d2daaf75be5f4b500f5d495119a661a221a19235c619622e01bd5101e24713838caf3abb4ddeed560eaacd6dbdb7aed29472d5319d73dcfaa8ea222e6e09fca866f8dc1c71c00ec5d8d554359a96e17abc4964d44fb6457cb4d4c2c34d530cafa763436774710c3ce38f0037873c02b935158ee74b53b44758adb7c8eb2e5e475347235950e6cd4d8805435a738eb384837321f8e0dc04b269cb857cf65a57c7793649aff0033e48594955451c30790b810048f32b627483d2dd05ce70030467a77bd3d73ad9f5bdaa9ad57aae15b6fb839934d154d3bd92091ae861dede30d430e3f1659c43416b8712172eaca19268243159f55c909d32c8b4f363a7abdfa6b807cbbc5fe946fcf5477a4c0dd1cf0bdeb1d1d4335f4f26a4b7ea396f5e5f0ba86ae99929a56530a660707483f1419d675bbcd3e71241c15e56c6a1d41a5a8e193535a2f3539b4c5ef78a7a294f92b04a5b253ba3f46425cc90b8e0b867b1985dca2a1aff7ef50936fd4cdd56faab99a3ac6b656d2f93b98ff00260e91c7aa2cc7561ad6e5c1e3240c12add36bba4b60ad8b4f5ab5452c6eb251c57064d154c72495e2aa22f7303fce73c33acde7b32304715ed9d2f5b6ed4b51536ea0bcb194baba88511eb277b1948f8a2ebdcd0490632e73f79dcb2389e0b2f5d62ad9edf2c56fab652553b1d5ccf8bac0ce233e6e467864735c95c5cda39deca7754b9b1b8b61040321c7c1e3c38f2e3c160cd4b6ebc6aa9753d45a6d57e91953a625a664573a134c68e5eb18e14b079ad0f0434e4e1dc5adf3f8e15d54974acadd6179d656dd3d796d350e9aea190d55be58259ea1b23e510b18e01cf200032d0465d80572d45a2f369d92d2d9ededab7deef33451dc2ae38c992396aa41e533bb032ddd0e7e09f83badee4da7362b7e993a5ed76dbfd144eb61828eaad141e521d86968a57e1ae73011ba727773d8e0415686afb65fe86cf5f416cb6dc292b2fda72968eaa8a1b33eb2074cd85d188a29db2621dddedd719410079c092afea7b5d7d6ebbb3525c29a6f7b74fdad93c6f2d3d54d5b2663c827838c6c6bbc41941ee5655aad37c1aa34f69ca38ee9ef559f504f5dd5d5599f0f5116273bceaadf31ca09930d0c1921de7725eb6cfaaa6d41a9ed975bfdb2fd6faba6ebcdb6da6c53d2d1d007b5c1c5f2b9987c859c32486e5c40193959711111111111111111111111111111111111111111111111111111111111111111111111117fffd9, 'AC', 7),
(17, 'rosanchez@trazalog.com', 'Roberto ', 'Sanchez', 0, '21232f297a57a5a743894a0e4a801fc3', 1, 0xffd8ffe000104a46494600010100000100010000ffdb008400090607101011120d1113110f0f1210121910100d161010100f12161716161615161f181e342c241a2a1c1613213d2d31352c2e313118203344352c4334393a2d010a0a0a0e0d0e1a0f10192d1d20253737372d2f2b372d372b2c312f2d333335372d2b2f2e2d312b2d2d2d2f2b2d2f372d2b2d3737372b2d372d2d2d2b2b2b2d2dffc00011080064006403012200021101031101ffc4001c0001000202030100000000000000000000000607040501030802ffc4003d1000010302030603010c0b00000000000001000203041105122106133141516107719122143233425253627281a1d1f015172325439293a2b1c2e2ffc4001a010100020301000000000000000000000000030401020506ffc40028110002020103020505010000000000000000010203110412210531152241516123528191a113ffda000c03010002110311003f00bc511100444401142f6abc4bc3e81ce84b8d45437430d359d90f47b8e83cb8f655fd778e35449dc52c11b796f9f24aefedb2c651b28b65e88bcfadf1ab13bdcc748474c930ff007532d93f18696a5cd86b19ee3909b093367a7713d4f16f2e3a774ca0e0d16822f96381008d411a11cd7d2c9a8444401111004444070aa6f1976edf4ffbae95e59339a0d4cacd1d131dc2369e4e2352790b7556ad4cc2363a4768d634b9c7a068b95e44c5f117d54f355bf57cd2bde7b6626c3c80b0fb16ad9bc239661a222d09c222202d5f0776edf0cacc2aa5d9a9e439699ef3f0121e11dcfc47701d0f62af65e350e23506c41b823911a83e7c17a4365fc4fc3aa591c724e20a82c607b6a4189a64b00eb38e9c6fcd6e990ce3ea89da2f88de1c03810e04684588217dad88c22220088880d1edbca59875738711473dbf91c1793c2f5aed6d3ef686b221a97d24e00ee58eb2a0fc33d9d13bbddd28bc519b44d3c1f2686fe4dd3edf255f516aaa0e6cb1a7839bc238c17c3a9a6877d2c9ee77b8031465b98d8f37f4e5a715815db018845ef636cedeb0b9a4fa3ac55cab0717c523a58ccf2e7dd820131b5cfb5efc6dcbbae1c7a8dce7c739f43a6f4d04b928caac22a62f848268feb31f6f5b2c78207c8ec8c6b9eef92c6973bd02b79fe2051866f036a8c7f2c44e0cf526cb7b475cd7c02adb1bda1f1978616b5b3380bd858733cbcd5b96bad82ccebc10aa2127e59151516c3e232dad0165ce9be7323edccdd6f3f53f8bdaf969fcb7dff2a5743b7146f7c408a88f79231ac3242f0d739ce000b8d15c015bd2596d99ff0048ed2b6a36c31b1e4a1703c376930521d1c124d4f7f6e9d8e6d442e1cec1a6ed3dc0f5573ece630dada78ea8472439ef9a29da58f8ded2439a6fc45c1d56d2c8aea4546f272888b26022220353b433b9b159ba663627b58a8ac4c6b6c0001a3e2b6cd1f729bd746d731cd7d8348d49b69dd42dc2c48bdc03c4735e7fab464ac52cf075740d38b58e4eedec5f367fa87f05db4c6173dad31900b803ed923ef0b0d173a3734d3c2fd1725526b197fd26fb8664dde56eeed6c96196dd2dc2ca2f513064a58cb08daf00b6c08234bdeff6fa2e062d3e5c99b4b71b7b5eab055fd5ebe36a8a82c60a9a7d2ca0dee26ef858f0039ad73410407004023810bb828352e3552ea98a9b38dde76dc3400e2d02f6254e576b4f7c6e8ee89ceba9954f0ce51115822088880e2eba6b27ddb1d25af945ec39aee5d751107b5cc3c1c085a4f3b5e3b9958cac910aeaf7cc7da366f268e03f15852bf282e3c00d576cd11638b1dc41d7f3d162d7fc1bfeafe0bc85929ca7e7ee7a1ae31515b7b1908b5f85d5e61bb3ef870fa402d828dac3240b4f886f58e2439f909d2c4d85f968b708917806bb65066ac86faeae3afd572b3944b67dbfb76f60eff1652e5e8fa5bcd4dfc9c7d7bfa9f80888ba6510888802222035b89e16d9b5f7af034775ec7b28ce2983d40639a185f71a64b1beaa6e96546fd0556cb73e1fc166ad54eb585ca2aa182558d443283d405b2a782ac68fa794fd26b75561d92ca17d2ab7eac9bc427ec884b28a63fc29079b485f5fa3e6f9b7fa29a592cb4f08afee63c427ec8d3607863a32647e8e22c1bd07e6cb7288ba54d31aa0a11ec53b2c7396e672888a534088880222200888802222008888022220088880222203ffd9, 'AC', 6),
(18, 'm.muriel@mrsservice.com.ar', 'mmm', 'Muriel', 1, '21232f297a57a5a743894a0e4a801fc3', 1, '', 'AC', 6),
(19, 'r.sanchez@mrsservice.com.ar', 'sanchez', 'sanchez', 0, '21232f297a57a5a743894a0e4a801fc3', 1, '', 'AC', 7);
INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrimag`, `estado`, `id_empresa`) VALUES
(20, 'test1', 'test1', 'test1', 1, '098f6bcd4621d373cade4e832627b4f6', 3, 0xffd8ffe000104a46494600010100000100010000ffdb0084000906070d100e0f100f0d0d0f0f0f0d0e0e0e0e0f0f0f0e100d0f1611161615111515181d2820181a251b151621312125292b2e2e2e171f3338332c37282d2e2b010a0a0a0e0d0e151010162d1d1d1d2b2d2b2d2d2d2b2d2d2b2d2d2d2d2b2d2d2d2d2d2d2d2b2b2d2b2b2b2b2d2b2d2b2b2d2b2b2d2d2d2d2d2d2d2d2d2d2d2d37ffc000110800e100e103011100021101031101ffc4001c0001000203010101000000000000000000000102030405070608ffc40046100002020002030a080c05040300000000000102030411051221060731415152617191c11322328192a1b1d1142342445354727382a2c2e133436293b2246383c31674f0ffc4001a010101000301010000000000000000000000010203050406ffc4003011010001030106050401040300000000000001020311040514314151521221226191131542a132236281f071b1e1ffda000c03010002110311003f00f7100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ab9c570c92f3a2e25330a3c456b86c87a511e19e89e28eac73d21878f0df52eb9c4ca2dd73c926ed11c6a8607a6f059a5f0aa337b12f091da65f46e76cb0de2d77c7cb7e324d269a69ed4d6d4cd4dc9000000000000000000000000000000000000007c5ef87ba3bb0de0e8a25a93b6329cec5e54609e494791b79ede83dfa2b14d79aaae10e66d0d5576f1451e533cde752d258896d788b9bfbc9fbcea451447e31f0e24dcb93f94fcca8f1563e1b2c7d7393ef33888e8c3c55759f96394f3e179f5ed2e5319e2a36b910f12786156cc72cb0f4fdc369dc2d5a3eb8e23175424a566519cd29463aef24723556abaaeccd34bbda1bf4516222baa238bb366ec345af9e54fecb72f61a234d77b5e99d6588fce1b7a274ee1315ade02e8cdc7ca8ed525d393e230aed5547f28c36dabd45c8cd139748d6da00000000000052db6308b94a4a314b3726f249162267ca126622332e5cf74fa3970e328f4d336fd0b9db2d33a9b31f9c35acdd9e8c8fcea2fa949f7194696ecfe2c275b623f2609eef345afe749f5573328d1dde8c276858ead69ef8ba39702be5d55fbd996e373d984ed2b3eff000c166f95835e4d388975a8aef328d057d618ced3b7ca25ad3df3aae2c1dafaec8232dc27b987dd69ec96bd9be7cbe4e0d7e2b5f72328d0473a984ed49e547edaf3df3713c585a175ce6fdc651a0a3ba584ed4b9ca986b59be46907e4d7868fe09cbf5194686df59633b4af7288ff007fcb04f7c2d26fe5d11eaabded99468ad7bfcb09da17fac7c35e7bb9d28fe73975575aee32dd2d76b1dfaff77e9c8d23a52fc4cd597d8ec9a8a8293496514dbcb674b66ea28a688c531879ee5caee4e6a9ccb5948d996ac275865306b0cae15721930ab9132b846645c1ac170fa3dee359e94ad45b4955294ba5679647875b3e9874b6747aa65ed272dda0000000008949259bd880c6b130e279f5293ee03e137cebb156c68a30f562275cb5a76f83aac926d34a316d2eb67bb4734539aaa97376845cabc34511331cdf071d038f7c182c4ff6a4bda7bb78b7dce66eb7bb25961b9bd24f830588f452f6b26f36bb9773bdd8cb1dc9e957f31bbb6b5fa86f56bb9772bfdbff004c91dc76957f339aeb957ef31deed75651a0bfdabc7713a55fcd72eb9c177937cb5d57edf7ba432c7707a55e5f135acf96d8ec26fb6bdd97dbaf7b7cb22def74af330ffdefd89bf5bf75fb6ddf6ff7fc2d1def34971fc1d7fcb9f7137ea3a4ac6cdb9d6175bdd63f8edc32fc6de5ea26fd4f465f6cafba1923bdc62f8f15845d3e3b26ff004f6afdb2aeff00d2cb7b7bf8f1d84ec9937f8ed5fb64f7fe975bdc4f8f1f86e9c93f7937ff00ed65f6cfee5e1bddc78f48d5974413ef26ff003dabf6ba7b9923bddd1c7a4d79aa8bfd437fabb4fb5d1dd3fa645bdde1b8f48cbcd54567eb26ff005f4865f6cb7dd2c91deeb07c78eb9f5422bb8c77eafa42c6cdb5d659abdedf02f63c5629be2d908fb624df6e7b328d9d6bddc8ddb6e3f0780c22babb3132b25757545593adc76a6dec504f822f8cdda7d4d772bc4f068d5692d5ab7e28ce5f0b99ef7330fb6de828d6c6e2accb64288413e46e4d9cdd6cf9c43adb3a9f2997ad1e07500000086c0d7c462229c12b22b5a4d369c734b564f8fa80c562adadb8a970a7e5d5c29e7c801ceafad4bd387b808d7abeb13f4ff602c9d5f496be852b1812dd7cb776e200a375725fdb88f7811955ccbfb6ef7812a153fe55bdb25ed6110e35fd04fd5ef00f53eadf96b02bab0fab47d1aca0e11fabd7f93dc055ff00ebd7db1f700d797d0d7dabdc05bc359cc87a5fb0076d9c957e6f700f096ffb5f980b4676f2d5d9202ead9a71d6716a52d5d89acbc56f3f51064b9e72abef1bec8480f84df8b1195383af9d7d96fa15eaff00d87b7451eb99f673f68cfa298f779866749c87a56f2d4fc5e3ace7622105d5187ee72f5739addad046287a49e47b800000c18c59c57de579f4ad74981755417c98af3202f9ae5413308738f2aed45c49e28eac52c4d6b86c82fc48be1aba319b94f5863963e85c3754bf1c7de5fa75f6cb19bd6e3f28f9637a570cb871347f761ef2fd1b9db3f0c779b3df1f30a3d3184facd1fdc8bef2fd0b9db3f09bd59ef8f963969cc27d66af4932eef73b658ef963be18e5ba0c1fd621eb65ddaef6a6fda7ef86396e8b07f4f1ec97b8bbadded63bfe9fbd8e5ba4c1fd37e597b8bbadde89f70d3f730cb74d84fa4f532ee977a31fb8d8ee6296ea709cf7d85dceef44fb958eaaff00e4f867f2df60dd2e743ee363ab2c74e50ff98975a68c274f723936d3acb33f932ad2107b54e2d7434cd734cc7186fa6ba6a8cc4e51f0f8f3e3da8985ca5691afe921e921832cf563632e0927d4d326172c93bfc6abef3feb985cb61d99d957558fd4977915e71befe233c4e1619f91879cfa9ca797e847bf451e554b97b467ce987c1667b9cec3d7f7a0a35745eb7d2e22e9f5acf25ec391a89cd72eee96316e1f6e687a40007277557d95e0ae9d7271928af196c693924f2e9cb33d1a4a69aaf53153c9afaaaa74f5cd3389c3cd258bb9f0dd73ebb26fbcef7828ed8f87c7fd5b9df3f32a3bec7c339beb94997c31d13c554f39f96396de1dbd7b4c98cc678abaab91760c9e18e88c97222657c31d00b8466454361556c0ab6454302ac2aac8a86155614526b81b5d4f23195866af1d6478f5bafde6155113c59d35d54ce625d9c06948cb638c735c5ab1cff73c5774b1c697534faf9e15fcba50c625c1923c587562acf9b2d38df1dede18af6930b96fc3179baf6ff33f448986512ea517a7647a2b9bed71f718b289797ef9788d7d25359e6a14d51f3e59bf69d1d2462872b5d39b98f67ca592ca2df433d333e4f1c479bde37bdc3783d15838f1ba54df5c9e671ae4e6a97d0598c5110fa3306c0001ccdd2d5af82c4c7fd8b1f62cfb8dfa69c5da27dde7d5d3e2b15c7b4bca93cd27d07d13e240a864100405430a820ab0a8615564101556155645430aab22aad904115119b4d34f26b6a615d8ab13ad0535c2b64d723e53c1a9b58f543ada1bf9f44af5e27c75b7e4b5eb3c6e965d2a715b61b7e5fe99130ca25dcc05f9d9ff001a5f9998cb389796eeaf11e134862a59ecf0ce2ba9248e9588c510e46a67376a71efdb16b9728f6bc8d954e225aa88cd510fd25a169f0785c3c32cb568ae3975451c69e2fa0a7843748a00030e2ebd7aac8f3ab9c7b62d195138aa258d719a661e3543f123d48fa797c2cc62661722200a85430208a86155604322aa150c2a927b1f512561bba1aa85987ae528a726b293e569ed2daf551132d1a8aa68b95444f9377e07573226cf0c347d5afa9f04ab9911e183ea55d513c3d697911ec18858aeacf173748d69453492db93c8d75c3d566a9999cb9ecd6dedbd1966566a3f26c4e2faf88d7729cc36daaa69aa261573719a4f89c93ffef31cb98c793e829ab3196fd176d87dafd2cc659c3bfa36ff001e4f9231ef6632ce1e5b8abb5edb67ceb6c9799c9e474a88c530e3dc9cd533eebe0eaf097d15f3f11547f3a25d9c512cac466b87e96ae39452e449762390eeac0000003c66d86ad96c3997dd0f32b2597a8fa6a2734533ed0f88d4d3e1bd5c7bca864d286150c0ab22a0086155645430aab02ac8a80adcdcdcbe2651e65d62ed79f78b1fc663dda7591fd489eb10ea9bde400d7ba79ec24b6530d3c7c73adf464cc2ae0dd6a7154390687b084b2927c8d3ec6161b5a4f65a9ae0938cbb51ccbb18aa5dcd3559b70bd33db1fb5fa59aa5e98762ac46a577cf9b5c9f640c7199659c465e6f5702ea3a50e44bbdb8ba3c2695c0c72cd2bb5e4ba2316fdc69d4ce287a34919b8fd0c731d80000000791e9daf531b8b8e597c7b92ea924cfa2d34e6cd1ff000f90da34f87515b44dcf0a02a1855482185430aab2086155615522a185608d738b96a5d6c14a5acd45a4b3ece835f8719c4cc339aa271e2a6270b784bfeb3779f55f70c55dd298b7d90877627eb33f3c62c7afb8f0daec53c3627eb1db5c58cd7ddfa65e1b5d9fb1df897b1df169f0af05159ae4cf319afbbf4782d72a7f686055856ee3de75533e8517e668f06a23d4eae8aacd330ad2f6c7ed7733ccf7b6749ddab82c53e58ea7a4d47bcb4466a84b938a25f1703df0e64bec77aaa35f4bc1fd161ed9f6e51ef3cdaa9f4bd9a28f54cbdcce7ba80000000f2edd957aba46efeb8553f565dc7774339b31ecf98daf4e2fe7ac38a7adca405410430aab02191550a8615564156150c8aab22aac8aab0a861556c8202aac2b713d6c2cd7325ade6c8f2ea63cb2f768aac5585697b63f6bf4b3c4eac2bba2b72c1b5cfbe11ecce5fa4cad47a9aefce287cc567b61cf97a1ef2b4e78cc658d79187aa09f4b936d7a91e2d5cf0743431c65ec278dd0000000079cef855e58dae5cfc37f8cff0073b1b3a7d1547bbe7b6d53eaa25f32ce83888645430a8605591556150c0ab22a185558555b31555854320ab0a86455585430aab20dcd1db55b0e7d6fb51aaf46696fd3d5e1ae14c3bf23ad7f8b39cee434f74f3f8aa23cb6592ecd8bdacd9678cb4ea3f8c38759eb878a5eabbcad79538cb39f7c22bf0c76fb4e7ea67d4ea68e3143d3e2cf33d690000001f09be557e3e127cbe1ab7d8a4bd874f66cf9d50e2ed9a7fa74cfbbe399d57cf2a410c2aa150c8202aac2aac8a8615564555915520861550a86455581564540567d1f6656c3a5eabf3ec31abce19533896551d5925c936bd4ce655189977689cd312e3ee96cce74ae4ab37d6e46db31c5ab513c1cdacf443c92f5cde9e3aba3d3fa4bac9be9db9771cdbf39ae5d8d3462dc3d068b0d2ded840000003e3f7caaff00d3d13e6e252f4a3247bf67cff5263d9ccdad4e74f9e92f823b0f9755854010c8aab0aab6150c82ac2a1b22aac8aab22aac2a1855590542a185559150c0465934f91a64574711e5a7cbe37e5673af462a97674b566dc3e674e4f3c435cd8571f51b2d7f1617e7d4d5cf24fa99bb934737b1ee11783c0e1e3c7e0d3edda72ae4e6a976ad462887d9e1a660d8df8302c00001f37be155ada3ac7ccb299f6589779ebd14e2f52f16d0a7c5a7ade6acee3e49560411556150c0ab22a18555855598aaac2a19155605591501556150c82185542a1915bce59c20fa1afcacf16a63cf2e968aaf2987cb6909eb5f6bfebcbb165dc5b7fc616ef9d52c73f25f4ec339e12d74c66a87b26e79a8d354792b8af51ca9e2ee53c21f5b8396c22ba7530328000072375d4ebe8ec5c78fe0f64965cb15acbd86ed3ce2ed13eed1a9a7c566b8f6979345e693e548fa17c621854322aac086c2aac8aab0a86c8aab22aac821855585559150c0ab22a02aac2a190430ad8a67e235c8fda9a3cfa88cd2f5e8eac578eaf9573d694a5ce94a5daf331a7837d5e732cf5ace55ae5b20bd64b938a64b319ae1eb5a26dd89742472dda7d668f9ec03b34bd8067400001831f5ebd36c79d5591ed8b46544e2a89635c66998789519ea473e15149f5ad87d2be26631330b322202aac2a191556055b22aac8a864555b0aab0a864150a8615522a18104555854302ca4d4679731b5d68c2e4669986cb55786b897cd568d10f6cb6f07b6ea57f5e7d88d77e71436e9a33721e91a26ee039ceb3ed345d9b101dfc3f001b080900044966b203c4b130d4b6eadec70bac8b4f852d6797a8fa4b739a299f67c6ea289a6ed513d5899934a1815645430aab22aac8aab0a86455581564540555854320ab0a80a86455581015307b7d4457cfce394e4b924d1e7e6f76730d8c03f8f874464cf3ea67d2f568e3d597dce87b76a3c2e93efb4241b480fa7a61920330000000e2697dcae07153f096d4fc265939c252837d79709bedea6e5b8c533e4f35dd25abb39aa3cdf3d89ded2979f82c7626be45250b12f633d11b42e73887967655a9e132d1b77b5c525e2691ae4f9278770f5a9b3646d1eb4fedaa76453caafd7feb4acdc06978e7959819f429db16fb6197acce36851ce25a6764d5ca61a566e474d473ff00475c92e38df5edea4de6671aeb4c27655d6959a1f4a45bd6d198ad9c715aebd465bd5a9fc9ae7675e8e4d0b9dd0794f098b83e9a64fd86717a89fc9ae745763935e7a42a8f94e70fb709c7da8ca2b89e12c274f7238c11c7d0f82d876e45cb1fa55c725d5f07c138bf3a09e198e49d65ca826060559150c2aac2a190430a80a860466457231f0cad974e4cd35479bd76e734c2b81cfc2bfb297acf16aa7843a3a38e32f46dca68c9d8d3c9e5b0f23dcf50d1981508a03a280000000000000000000060b3074cbcaaab97da845f717329886862b735a3adfe260b0d2ebae26515d51c258cdba678c39b89def742cf87035c7eedcabf63328bf7239b19b16e7939d76f55a25f91f0aadf2c6f93ff002ccce3557239b5ce96dcf273edde8a8fe5e91c643ed2aec5ec4671acafa35ce86dcb42ede9f18bf87a562f9159876bd6a4cce35b3d1ae76750d1bf7b5d351f22fc15be79c3da8ce35b1d1ae766c729695db89d3f0f9ad167d8ba2cce359435cecd9ead1bb40e998797a2efcb960d4bd8651aaa3ab09d9f5b46c862a1e5e03191ff00866d7a919c5fa279b5ce8ae43567a4611d938d907fd7071f699c5ca679b5ce9eb8e498e90a5f04d17c50c7e957d191626b7f2e3da5cc31f055d1ced298886bc36e6e4b24a3b5b7c492e334dc9887a6c5154c4c3eb7711b8dc4df2f0b6d365509496aab22e3292e5c9ed473afd7154f93afa6b73453e6f65d13a22ba22925c4687a1d3000000000000000000000000000000000000001818a586a9f0d75beb8c581cfc46e6f4759fc4c0e127f6a9adf719457547096334533c61cdc46f7da166f37a3e95f76e752ec8b46517ab8e6c26cd13c9d2d19b9bd1f86fe060e8adf3941393fc4f698d55d55719674d14d3c21d4d55c862c9200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003fffd9, 'AN', 6),
(21, 'test', 'test', 'test', 0, '098f6bcd4621d373cade4e832627b4f6', 1, 0x89504e470d0a1a0a0000000d4948445200000200000002000806000000f478d4fa000041964944415478daecdd79909de975dff7dff3de6e74036834f675303b06980db3738604a9a1488e4c8db83872bcc856e2582c9764b922254ad94ae272397695aa9c2aa752899c546257a9243baa4afe70a4b2224b16458934694adcc959b8cc7056ce82c10e74f7bdf75d9ee79cfcf1dedbb8b8d30df4726fdf8bc1f753d5d583ee4677cfbde83ee739cf79ce13dc5d0000e0c692f110000040020000004800000000090000002001000000240000008004000000900000000012000000400200000048000000000900000020010000002400000080040000009000000000120000004002000000090000002001000000240000008004000000900000000012000000400200000048000000000900000020010000002400000080040000009000000000120000004002000000480000000009000000240000008004000000900000000012000000400200000048000000000900000020010000002400000080040000009000000000120000004002000000480000000009000000200100000024000000900000000012000000f09e36b19a0ffeb5bf3c39eeff3f41d226490f6559f63321844724dd1542d8cf538db570c9e4fe96cb9f93ebbbeefe0d77ff9ca47949894708a3f40fff4dc583808d4900c6fc37f594823e16147e6dcffe3d0f3ff6f863da7f70bf76edd9ad2ddbb749c978b6b1867f579ecdcfcddf7afad4e95bcf9c3efdc9b77ef4967ef0dd1f5c0821fcf394d2af87102e48e21f1700128011adfa6f0a21fc93bd07f67de6e94f3fad9b8fdd291555f717b81459a861edb6cd6ed3b6edb3baf3d8112964ca179a3bbff0d9cfffa3af7ff59b7f2304fda299fd8710024b310024001b19fccdecd88e9d3b7ee3c48f7fe8c4f107eed7d4cc56292f3b7981a4107896b1ce2a40cf8b92a6b76cd64f7efa69dd73fcde237ffee53fff7f5f78fe855fcd1afacd1042c983058004600382bfbbdfbe63e78edff8d8d34f9db8eff147a5bce8acf65d6e516e26b9757f73036bfc9716a49029745ea4869405dd7aec8876eed9391ba47ff6fde75fc82626c2bf147d0100480086cbcc66376fd9fcdfffd8479f3c71df138f49ad5c7293c55c65ebbc8a0b6fa86a5f502a16e455530a1c78c09aa2bfc2e4664d6edea189e9594d6cd9a94d3307d498dcace0d2ecde3d7afa2ffed4b6bc9dffea4b2fbefafcd4d4c49778cc0090000c4f26e9895dbb77ffed7b8edf2715a52ce62a2ebea5e6a9e7155b17a46c42210429048589699e69ac23dbac542e9c56397f4a92296493dabcfb88b6ec3ba689b04db3db77e8be07eebbede51fbef12beefef51042ce8306e07a08a4d7e3ea7ffbcccccc2f7ff8a91fd7f4f6edaa16ce69ee475fd5c557bea454341526a614b24667d54f0f00065005089942d650c82625b95aa7bfaf0b2ffeb1f273afcb1b99ee397ebf8e3f7cec89224f1fe7f10240023024eebe6fdbecb64f1cb9f798e2f93775e9d52fab7dee5565935334fd61631282c6a4ac6aebd2eb5f51fbad67b475c7acee3a76f4504afa188f0f80ebc1f5b705e09adc34b5e913b71fb9439e9abaf4da57145be7944d4cf16c6283d3e786dca3e6df7e5e9353d3dabd67af76efd97a77b3d99a69341a0b3c4000a8000c90991d989a9afea5871ebd5fcdd7bea5b27956a1b1896712a3a9058486dca2164e7e5f13e9820e1ebee5e618fd611e1900240083d5c826b2a70f1cdc7fdb9e5d9b357ffa0556fe187d12903554b52f69a23ca53d7b771e4e49f7f2a800200118ecea7fe7f4f4e6ffe6a99ffaa82ebdfeed4e4316307aaea04d59a16d93ad999065f7f08800200118e4422bcb9e3a78d3c163fb0eed53fbe29b0aa1c1338831f9d719646553d38d42b33bb6dd9a52e2ec2900128081acb0cc67272727ffc1c73efe51b5df79b19ef14fc33fc62703504a51335b3769cf9e1db75af2bb794c0090000c627dd5084f1e3a7cd3f103b71cd0fc3bdf971a133c7b182b66d2cc9649eddc3e755b32b10d00800460ddab7ff74d5996fd771ffbf847949f7a49a9585060f98f71fb772a69f326d7cc54dc19938ef18800200158efea3f84470f1e3a74e2d0ad0735fff677151a34ff614cffb17aa96dd3d2e6add347dc9c7fa8004800d69901fcea079ffc808a736f281673acfe31aeff529562a51ddbb7e9c0813db7a5946ee531014002b076f7ecddbfef9377de75bbe64f3ec7ea1f63cdccb57d765abb776cbea78a7a9047040009c05ab97ee5b1271e6d787e4eb17d91d53fc63c0190b64e4bbbb74fee0a59f6909cc7040009c05a1cdcb16bc7cfdc77fc1ecdbdf5ac4246e73fc65cc8e4b1a59db393dab577d7f194d20e1e1400e368ac23aa99fdfcf1878ecf4caaa572e19c42a321674585b14e00a4b228b473c71e1dd8bff7f88533678f3726f4251e180024002bb76dcbd6adbff0d8138fe9e25b5f97429013fd31ee5c4ae6dab567b3766d6fde52947a7c7a5a5fe29f2e00128095fb99bbefbffbe09629d3dca577eaa515bf44719d9401bc5ad0febd5b27f6eedb79a2b570e9b71a8dec1c8f0b807132b63d006519ffab0f7cf0842ebdf9bca8fbe3fa8aff99da73e775f3a15dbae3c8ed1fc9db768207050015801570f78fdc75eccebb77ce4ee9d41b6fd40b7f92005c47628adab6c975db6d0776bef8fdad3f5995adcf6559a3cd23038004e06abf3cabf42b273efca1c6c2e917e416c5ad3fb8feaa000de5f36775ebe1bb74f8d69bffdaf79efdc1efcecce873e4b158c3824831a6fb53d41329e97dee3a1c32651695fedbbfc0ef46747ee5643ad9c8f48389497d7162a2f18d1096feb7f10fff4d35be0980bbdfb9ffe0de270fdfb457175ef86667e1cf6f4d5c7f3f8dedb933dab3ef2e3df4e843bbdf79ebadcfb49a0bdf6e341af402e09acc6c6bacec27aaa80f64418fdf76e74dfb6f3a7c78dfa19b0fed9edd3eab1082dcb811158bbf70b470694e67cf9e5d78fd95d7de7efdb51f7d2dcbb27f9265d94bd75505c0dd7eeee1f73d36535e7a43b12a795e71fdaedc5252fbd229dd73f723fadeb3b7fcc56f7dfdbb5f9e9dd5ff4e1500cba9aa782256fab9ed3bb63c72c703771eb8f9e69bf71e3a7c7072ebb6196dd9b245d35b364b934c43457ffc0f5259a92cf299874f3c7ef4fbdf7ef6e89f7ef6f38fa618ff6ea3d1f8c2f592006ccadbfeb3f73d705fa3f9fa9fb0f2c7f5fd33d99850ebfc1b9add7f44273efce4965327dff91fce9c3af7dcd4f4c4177974d017f83f162bfdc2b17bef78fcfe878edf72f896c361ebd6addabc79b3b2e929c94d32af7ba14a1646583a09d8343dad4d5bb7eaf11f3ba16ddbb6ddf3fbbffbfbffaa2ccbffa4d1687c7bec130033fbab8f7ff0918359755e316fd1f787eb5ca6aa68ebd2e9d774f3910fe8237fe1237bfff0f7fef09f35e79b3f3bb969e2251e1fa494ee8a95ff8ff71e3ff6fe071e7df0d02db7dea2999919854d93f55c6977a98a52c8a4d0e8bc56677194f100a2874b32299a261a0dddffd8c32a8ae296cffec1677f3356f1a359969d1feb04a02cecefbcff432736b5ce7c476689e713d77f529e35d43cf3aa36efba59f7beff099545f1becffdfbcffd66abd9feb9c94992801b7ad55fc6bf77e0a6fdbff8e0230fddf1c0c30f68ebb6ad0a59a30efa3175027e903c49f969a93c2d1567256bd5bfebd9ffc762ec77a9b1459adc2e4d1d90361f5450a6873ef0842e5eb8f0e037bef2cdbf5955d5ff114228c6320130b3c7ef3c76fbbd339b3d5c7cf33cab7fbc77aa00655b73effc50bb67f6e8c10f9d08eefec13ffda33ff9cd56b3fd9989c9891ff218dd70abfe47cac2ffe7479e38fee8c73efed4ccccb6194d6cda54ff1277d5813f36a5e2ed4ed03f275994bcfb623c8878b73857ff7b69be226dda296d7f50135bf6e9d1271ed373df79feef9465f9afc73601a82afbc5c73ef0bed9e2dcabb25872ee1fef9d14206ba875e6554d6dddadedb73ea4873e742234b2ec837ffcef3ff747ad66eb97262626fe1d8fd20db3eaffd9db8edcf66b0f3ff6d06d47ef39a62d335beba0df0dfccd37a4e60fa578b15ef97b942cd59500a95ef6074aff58ae12902425a9382d9df90fd2aef769c7c1dbb57dc78ea3cd85e6ad92ce8f5d026066bb77eedafed4adb71c6accbdfca732823fde5382a4a04b6f3dabc9ad3bb465ef9d7ae0fdef0bdbb6cfdefe7bbff37bbf7dfeecdcbf9a9a6afce310c2451eabf7aeb28c7fffc8b13bfefe273efdc9bd3bf7ee529665527731dffe91b4f0a2142f4956e9720334011fabfd5dd34d060ae9fc9f2b4ccfe8e04d07c3a993ef3c96527a4e521cab042025fb2bf73f747c4735f7a662d9e6d21fbc077f2e836259e8c26bdfd4c4a62dda347b5077de7d54bff05ffec28e67befdcc2f7ee9f3fff1afb59bad5f9f989cf8e7921678c0de63c1bf88ffebb1fb8e7ee6533ffda999d99ddb3b6fcda4f28cfcd2b7a5ea52bdda5fdcdc67831f0348063c2a9cffaa66672695658d9b628c8db14b0062d4cfdcf7c0fd5bf3b3df90a5c8f386f7e8cf63a67cfebc4ebdf045ed3bfaa4a6b6efd7d6d96d7ae2c9139b8ede73ecc073df7ee61f7ff5cfbef65f1779f16fb32cfbbf43089fe741bbfe1545fcede30fddfb577ff2534f4fceeedcde59f527f9a5ef480baf485e2dbd8203d62d93ca8b9ad4a424dfd6b397341e09404ae9fedbee3c7c744acdb0902f7456fffc10e0bd9b0414f3e775fa852f6adfd10f696a76bf1a0adab3778f3efcd44736bdffc74eec7bf1fb2f7ee6bbdf79fe3f7fedd5d7e6524a2f49e248ccf5f85487e06511ef78f47d0f1d7cea133fd198999dad17f8c549f9856f497141cc3ac1465402627e49f254f4bf67f40940f4bffec0c30fedcccfbfa654958cfec58d51095838afb79ffd23edbef3fddab6ff4e852c539665dabc79b31e78f881c6f1878e37caa29c3e7feefc5e33babeafb3c0afac91e90b9ffdbc364d4f858f3efd31d5c13f93cf7f4f9afb9e64050b1d6cd43f4855454bee3eaf7065701d750210ccc3276eb979ef74f1f6abb294fa2b14c07b54a6182bbdf3fd2fa875e14dedbefd514d4e6f5b0c2021044d6f9ed6a1c387f881b8cef8e6697de9f73fabe9cd9bf5d19ffca86677ee94cce417bf292dbcd4e9d4e669c5c6a9a2cba53c688c128094d283771cbd7d6f5a78a75efdcb59fce386ab06ccbdf3b2e64fbfa61d37dda39d37dfa7c6e41685104886af47539bf4c237bea38b172ee8c98ffe98b6efde2d5595fcc257a5d61be2171c46a1ac92e4baa4cbe74ec6200188fef1bb8e1e992d2ebea9140bcaffb871578d9674ee47cfeafc1bdfd5cc9e9b35bbff88b6ec3c584f86c3f591cb351a9a3f75467ffad93fd1131f7cbf761fd82fc55c7eeecb52fe0eab7e8ce81fa654562eaf4f178d4d052073654f1fdc3733a38ba52c392b1edce032b9bbe64ebfaeb953af4a59439b36d757bf6290d956fd4b71b9d3c6bd6ff7bebfe78b1fd357ad0cd2c444435ffceacb3a72f441ddffe0839227f9d93f27f863e4aae872f77c6c128018d3bdb71db9edf6d03e25abca2b7fba801b3b61af87bfb8ab6a321b68a5cc978ef5570474f7c589bbd699c0d7bd64cf3aef4b76f9bfade7fd6eaab729a5c5f775351a416fbc7d5133bb6fd5131f3aa1a9add3f2d3ff51cadfe689c1c87fa15495493e46158014fd93771dbd7357d57c535e553d375c01c0f016ff8b49415ff05f0cf63d01de7b5f24257f77352004a99d479d3e5fe9f18f3ea4edfbf74ba7ffbcb3e72f56ff18790630765b00e67a64c74c6326cb4d91b3ff00d613d89759fdf7becfddaf08eeea0bfea973fb6eb22b57fff5adbc2eb7cb1d548b273383d408d29b27e7f4e0638fe9ce6347a54b3f942fbc5277fb33c61763a0aa4cee6af6ef268eae0720e8a0e5e7a45431fa17c0701280be7dfbde557d77b56fe68b81de5cb2e4b24e904fdef97b7679dba0bea9bcf3593369ae5968627a56f73ff288a6b79afccd67a4d494c2244f0cc6a100a02a9a5cde0c7d0bed912500210b53ed0b27b5694bf707952400c06082ff52094077a5af9e2420f9e5042025c9e457acfc17ab01ea56022ef702b8a4e041a7cf3675ef23c7b577ff1ee9cc37a4eaa214267862301e3a3d2d72551a970a4050f0aa2a65be69c9e69dabfec02ffb07002401ef4e00bae5ffc520de5dcd9b779afe2e57007aff9cacf3baf345ba5581ae3c2fb569cb761dbbef7e4d354ecb5b6f5d5e7601a35ffccbab24ef14b5fadf3f31f26fce7d555b00de57d2730f3d4d3d6403c00db7c0f177875b5bfcfdd20df6de930cf4ecf777bafd6337d027ef54057ab60616fb02425d45e86c078490e9d4e979ddffc863dab76f8b74e15b92b529fd63ac3280aab47a0cf012cbe551f6002c06ffd5260026c9cd154d8ac9eabdbceed11d9e72e0c65afd5fa52270b983dffbbafe7b56f93d2b7beb4900925dae1074ab07c92f1f034c292a7a43b7dc7e87364f9d979f3fa331b9601558544697bb9afdf7008cbc02b09604a0fb435b255795ea8cbd8c52ecfce002b8b1837ff71ddeb7ffbfb87fdf9b00a80ef08ba57ef32b4bff6e320b9d8fed7c9e4e35a039b7a0071fbe5fb7df3a2b5dfc81649594b1fac738550042a70150b9c66d0bc0fdf2608e1527005607fb2aba2eb55dafbd53a8d99caf1b784800001201bfbc58e8af085c710a40978f03c64e777fb7d96fa94a41bd7d506f0384d0d08ecdae2377dda96d5b9bf253a7e534fe61dce2bf3a63805d0b4161dc2a00929bc97de50d33e675025056a633172a7de3cd593df681bfc4146100572e2cd4db67d43d0658afe04d561ff7b3fa6d2959fdda4c6656ffd9bcb30590eaff4e75b6606142f9c5b774eb4d856e3d3423b5df915b94b24d342563ec747a0016c6af0220bf62bce6b57ea8bb15802ab98a4a6ab50b1db9eb09fdf23ffe2d9e65002b1625a5285555524a515555a9aa2ac52aaaac4a5565a918a3628aaaca4a55ac1463949b2b4c6ed50fbff41b3a3cf19c766c4ff2b97738f687b155c6a5c7008f3c01e8edcabd6646dff9f818eb92465eb9da9594e7b924a9dd6ef34c0337dc6adf977c9b7546f599d9629f51bdb24f57bcc45807ffeeebaaaa5496a5524a8b6fefbea494642695454b97de7e460fddef9a9ccc65554b6a4cf164603c93ddba07a03d561580a020f7bafc7fcd04c02eefcd9551ca0b53ab30b50b57d1882aaaa4b9b9399e6980e0bf18f87b1300eb94f67b9380dee05e7656fcbdc940efebeedf314deac2eb5fd7a11dae3b6ed925cdbd293558fd634c85ee4d806a8d5d05a0db917bad04a01bfcab5897fe2b93f252ca4b57311175e1c2bce62e5de2c9064800de9508f42700bd01bd77e5df4d0696fa73fdf1a6ca33cdbdf3821e3e5669c7ee86fcdc05cefd63ac9595c9cde7346e3d00a61526002655e62a9234d7727de795b6de399debe439a939f5b2fef00fff9d5a0b5c9b0adcc8c1bffbf610c215478c7b5f524a8bafbbd58018e315ffdd5f21e8260e557235acad3ba7ceea9683b30a7e49e681a17f18eb124059b94c6a8e5d0540ea64e62bd80248d15555d2a566a5d7e777e8937feb9754c4246bcce8a683fb15e34e9e6be0064f047a2b00bd7bfffd3d00bd9580ee0abfbbf2effef98afdff181535a9f65b5fd7cd3749371fde25cdbd28650d9e048c73fc57154d928f570f8042fdedaca802d0b9a82346575e46edddbb4f3ffb0bff802717c09249417fe0ef06fcdea0dfdbf45714c592afabaa52511475f9bf8aba14bea73b0fb7353d1364a7da52639a071c632d26974c2d8ddd1680af7c0b20993aa37f254bb1fe1feb94e77af7ecba253eae18066ecc0a40effeffd59affba01be9b0474037f37e8771b038ba29079a6d6b957b4bf7141b7dfbc436a9f66ef1fd74705a04a3269ccee0290eadafe8a7ec8eb1fecee98cec5495f668b3fb866a676bbbd7884870400b8b1827fefdb56d2fddf0dfc4b5502ba49403751282d53f3edefe9f89d4d1db8e536f9d95728ffe3ba50542697e643586705609021f5f2759cd71ee1bbf87176792467b7025096a5de7aeb2d7df18b5f549ee7047fe0064f0afaef1849292dbeee4f08faf7fbfbf7feeb6140a6e095eeda725277dcb24f8dd0945992328eff61dc2b004131badc3c5feaddabfb173ce00cc0e48b576e5eebcbbabcfef8ce9f242d66e9274f9ed4993367f4533ff5533ce1c00d5e01e86f005caef1afbb6dd82dfbf796febbabffaaaa54a6865a279fd15dfb1b3a7ae49074e9052efdc175a3aa4c7235a531aa0048f595bee6d74e00bab774d5b7705dfef8aaaa94e7b9f23cd7be7dfbf4f8e38ff36c03e8fcdeb0771defebddd7ef06feeeef9076bbada22816ff5c2702a55aedb6aa94e9eedbb76bf36c263b3927cf36f100e33aa80074ae0396d67f17800fb802e0767918d0d5128cd45bfeefdcd1dd4d00ba3d0031d68d816559f2a403376815a077efbf7bdebf3701e85de9f72700fd2f6559aa88d2fcc91fe880bdae63771d955a6fcb39f88febaa02e0725773a90bf3469600984bd15c29b9d2353e6f32d51fd7b9bdab6e08d4153fd0fdfb7d006eace0df3ff0a777bfbfffac7f3729e82601dd8544f7bf638c2aca4a79aba546eb35dd7d74bbf6deb44b76f2f9fae21fda8c705dfc905cbe0d302c9101ac2a014803fc479fbc0eea65bc3c0868b94f1f3b638063ea240de62aabb4f803db3bcd8b0a007063affe97ab0074f7fc7b8ffc75ffbbf76d8b6faf5cad732feb90ff50f7dfff6165e559a514b9f807d75506109349f56540eb4c006c70df5632a9a8a489c6b54f01c4545f025445a94c753f4051e45794f17af7f500dc78abffde04a0bf01b0ff829f6e89bf2ccbc5bdffa228d46ab5ea44a08c5a983ba7ade50b7afcd1bbb4e7e00ed9c96768fec375230449d1bb1bffb6ee04a01a6075bdb2a032ba26aacb9585e5b618ea64a1731150e5aa92a9d56aa9dd6e2bcff3c524a0d96caad56af1cc0337e0eabff7bfbbc781fb67fbf7aff6cbb25cdcf3ef2601795e28cfdbcadffe9a8eec78430f7de06f29b45e92557352c6ea1fd78f5899dcbdd43205f655250079b9ba3d802c74b29065928976e7f32d6e2d2cf3e9a34b45e16a97521983aa94b430bfb018f0bb3fbcf3f3f36a369b3cebc07b34e877f7317b1380fef9fffd67fdbb3d00bd37fdf50efc596cfc6bb755c6a8bc886a9ffabe6ecebea7a79efeb436350aa54b2fd77bffc075530108f54d80ae054969dd09c09e6d2bef7ecd32e9fc826b3e9726b23a11e88def3149cdd295a4c5e97ebecca74fa9ae00b44ba95d994a335dbc7451f3f3f35a58a8138176bbad4b972e91000037d0ea7f25d7fff60ffbe92600bdd3ff8aa2505e142acba4eafc0fb43fff927ee2134feae6a377c8ce3d2b551758fde3faab004493bbf28154001ad96ab20f69e7d6a0dd33d2db175d736d6932d3e2d599c9a456ee4aa9ae005ced844132a988525ed62f85992e5c38af8b172faad96c2e5602ce9f3fcf1600700304fefeb72f970074cbffcb8d00ee6e07e49d33ff7eee59dd149ed1a73ef561ddfde8fb149a2765730cfec175580190542593bb2f390468d509c0ea7e582f6f01ec9f0d3ab4437af994ab99d7d58164d27c2e15d1af682e5cea67dcbc1e66905752ab900a4f3a77ee9c2e5cb8a056aba5858505b55a2d9d3b774eed769b671e788f05fe10c25567fff706ffa5b601fa2f0ebb7c074054194d65eb827634bfa6076f353dfe818feb8e7bef53563665733f94628b0400d76506507666006c7802d01bd01b9d2d80a307839e7bc375b1e50a415ac8a589862f791f40efcfba79dd3350c47adba06d51a74f9fd1dcc53ae0cfcdcd697e7e5e67ce9c2101006e9095ffb51280de63807522703919a86252594579fbb4b62c3cab9b1aa7f4d18f3eaec73ff8b8262727152cca9aafc89baf30f31fd7adce16c082c2881280de806e928e1d0c9a6c047df565d3c5962f2600def99877fda87bbd45d03d0ab8904b2d339d397b4ef373175514852ece2da8b9d0d2a933e754e41c0304de6329c092bf4fead7b698082c790f404f15202bcec82d2a54739aacce6abb9dd2cdbb831efff0a3baff814f6b7acb16351a0d4941de7c437ee15929f4ec5b02d75905a0285d2e6f4a61b409406f35200bdabd6b46dba6275ddba6a4e94d5223acf4574043ae8b6a7cef9f6a4af5254107834b3352f6fc17b485095d00fa7e73b8a4fdfbf7a9d1c8b463e70eeddfbf57b71f795c070f1f541682b22c5bfc25e5ad3764e7bea27ac992f110e2bacd00525d016885413401ae2f17d141493f6d667f73dbaedd0ffca5876f9d3a78e880f6ecddab7d07f6696a6ad3407ed4c9d5012cfd5b28745e05054921cbaefc15e549d67c5576e1db92277e9be0ba57a6d1f60064927699d9dfddb173c72fdf7ddfdd3b1f78f8c16cdf817d0a59a6e0befca00000d828715ee9c233f2d68fa4d020f8e3bd5000505124b9fb9c46700a604af2bfbd6d76db3fbaef81fbf67de0c74e6866c7f6fa507f5f460e001ba77beed8a5f2926cee4559fbcdceaabfc1453f78cffc338f75056030730056b1eabfdd4cffcbddf71ffbe4d39f7a5ab37b764b55d509fe418b7701cb7b7e18016088bf0fcb4bf5ef9bb4202f2ecaf3d3f2ea42e7775260d58ff75c05a08a26971636a402e0ee0d333bb1ffe081fff3b1f73f76ef030f1dd7a6ad5beb5b7ca44e86edf2f292bc38232f2e4a714e5ecd4956f18401d898df8c52a70249931fdebbaacae5eef9d0130077cf52b28fdf7ee4b67ff1e1a77efcf06db7df56b7fcc728c9e4e59cbcf5a6acf9ba54cd5dfe410c9dcc3b3478b6000018489ebb7817c0a561270021253b71cb6d37ff4f1fffc4c70f1fb8fd76a92cea927f9c97cdbd249b7f59b2b21eaa41b0070060b81580b801a700ca321ed97f60df3f7df2231fbee7c0e1c352554ab12d9b7f4936f7032915f5284dc6690200b021627d17405b61484d8066be2584c6dfbbe3e81d1fbafdd85d7549bf7546e9c2b7e4f93bf5159a047e0000364e90aaca2457330ca502e09e99f95fbff7f8dd3fffc18f7c588da949f9c55765e7bf25af2e49d9269e04000046a08a2e9316969b04b8ae16d8aa4a77ecddb7fb333ff6912735bb7fbffcfc8bb2b35f95c779823f000023ac00749a009bcb7dc89a1300779fccb2c6a76f3f72e78943b7dc2c3fff43a58bcfca53bb2efb0300809189d125f7d672ef5f73a4aeaa74d7e19b0ffd178f9f78bfa479c573df91aa4b5236c5a30e00c028a5c54980d5602b00aea090bdffa65b6f7960cfe1ddb2d3df91f2335236cd830e00c0088520593449ee0a4b3700aeb9029052dabf7bcfce4f1ebdfb2ea9f923a5f957a5b08991be00008c81a24a7257bbae050cb0025045bf67efbefd4fdd7aeb6ef9d9efd7819f8b7d000018830a4050ac8700b5c255aeb75a7502e0eed9c4e4c47dbbf7ecdcb6695353b1f90ee7fc010018233176860069f92d8055270066b667e7ae9d1fbae5a659e9e28b8cf50500609c2a00aaefe0735bfe26c0b52500c90fcf6e9ffde04dfbb6c8174ed5b3fd0100c0d86400653499d4d4207b0092e9c0f4643c3cbbad524ac6030d00c0d855004c266f0eac02e0eed9e4a6c9dbb66f0d523c2317ab7f0000c62d0388d124574b836a0234f3ad5b67b61cdbbb7756cae7e8fc070060dce27fe7148099b7073907606672221cdaba39481ec4a97f0000c64f7d0f80cf058501f5008420790c8a795d63000000e39700c4c58b8006d30310a4683136ab3297b28c471800807113d41d0474d53900abdd0288669ec798eab602f6000000182fde1d04a4810e028ae6deaa2a6307000080b1ac000495954bee031c04145425f3669558fa030030aeaa6832d7bc06d703109299f2189d0a00000063590190aae803bf0b20ba7b3b261319000000e3a9d303d00a617009809b798b0a000000e3abb30530c0638041b2a4163d0000008ca91054542e779fbbda87adfe3220f7568c9c020000605ca5cbc70097b5eadb7cdc55a44e05803a000000e3c615eb389d0fb40220292673293a770101003046ea89fd2e7397a434d00420049566ae189302fb0000008c530aa0b24a3293e92a0d80d21ab60024c5941463d4442313fb0000008c5105a08a92bbb7065e019054b97b11a3b1fe070060ccc4aad30018ae5e0158fd1640dd03d08e89590000008c550540529916af021e700520a832532b4627fe030030661940ac6700b4a4015700545f09cc2c000000c6b102504f015c081af8164088e6f51600a700000018a3042004c5fa22a0216c01d4158022262a0000008c9b58f700e41af831c0a0984ccd2ad67fe414200000e3520290cae8d7bc08684d1580209566de8c293109100080315355a9be08280c7e0b20997951251e640000c6aa00b03808e8da5b006b3c06e8ad58990225000000c6ab02104d6ede0a0a575daaaf6914b0bbf294bc6e00a009000080f1a80078504a2697dad78ad06be901a8a279b38ac6230d00c058650052599acc7c4e521c6802a0a0e8e6ad1819050c00c0b8e9f4000c630e4088c95524a3020000c0b85500aa9464c318051ca464a95b01a0040000c03849d1bbb7010eb6074092ccbccd31400000c6af02d07317c0551380559f0208413253abea5c06c421000000c62703a82a97b92f64d7a8d2afad02e0de4e91d00f00c0b85500627d4c3fbfd687ae2901707995cc59fe030030463cb992bbe4aa8692000485cacc554f03e401070060e48bff20c57a0aa01474cda37a136bfc3a6532f7183dd48d009402000018710aa0b2749979a96bcc00587b0520289a59991215000000c6a602904c925a434b00244533e59d2f040000c6404c2677e541d7de02586b025099a91da3945101000060e4b220c5ca65e6d71c03bce6042004c564de8e89fb00000018175572b9a9a970ed0460cd4d8066d6aa92490a72ce030200305a21a8ac4ce6ded4356e025c7b0540811e000000c64c4c26736f0faf07202826579e12f701010030260500c5e472a9ad2136019666d68c910a000000e3a2ac4c663eaf156c01aca9072048d1ccf318adee01a405000080d15600544f02940d730e40e81e0374710c000080f110a3cbdcdb2b3905b08e41405e24737a00000018870a4008aaa2cb5ccda030a439005295cc5b313aeb7f0000c6a60260f2fa18e0109b009337ab64ec000000300e1500496534d90a7b0026d6f855a2b98a94eaee3f7a000100182d0f750f40a70230ac2d8010cdbd1d93310800008031a900443399abad21de06e82979bb4af4000000301e19405055b9dcd50ee1dac5f9b51e0354326f272e030200606c2a00554c32f7b9957cfc5a4f01e8f21c000000300e19404a929bda2bf9f0b5de0628f77a12a09bd3050800c08899b9aa687279b192f27cb6e6af1414cdea6c833e40000046b8f80f528a2eaf17e469257f67cd0940502893b9ea2b81c900000018610aa02a9acc5c4121aee46f64ebf86a65324f31320e180080515700aaba02d056d08a128089b57f3545372f93f9e6ac116803000060445c524c565f04b48231c0ebaa0004a94a9d6140140000001861054052955cee2b1b03bcae0440526549ed98440b000000a34c003a6380cdbc1586df04a832b9b7121500000046aebe09504d49436e020caa2c791e932bd0050800c0082b00a1ae00b837155656019858c7d7abccbc48d1eaee03ba000100180daf9b00dd5568639a00d5aa18040400c0882b005255b9ccbc29a91a6a02a0104a4bd68a95f1c803003062556532f7f930f41e80bada5024631010000023af0024979b5a5ae116c09a7b00825425f37634978b414000008c8a2b28a62473e51afa1c80a0e8ee454ace31400000465c0188d1e5ab3805b09e26c022256fc6680c02020060c462ea0e020a1bd20350cf01e071070060a415802a9aac1e0434f42d80cacc73332a0000008c3401e85400567317c03a9a004332f3bc8aaec02020000046c743b70720d7b007014952326fa5e84c02020060c425802a9accb4b0d2aafc7ab60064c95b3119f11f008011ca42e73220f3e64a43f27a4e01c8e44534c929ff03003032ee9d1e0079b1d2bf33b1beafa83299cbcc690100006044a2b992bb5c2a575c3558e7d7accc5c29310e1800805108a1b3faaf5bffd24affdefa1280a0222557954c9c05040060242980aa2ac9dc93567811d0ba1380a010cd3c9a711000008051550092496e6a07858da90084a02a99e5291aeb7f000046b2feaf47f39a597ba5f70048eb6d02944a33b563f2992989614000008c40ac4c564f01dc982d004955aa13002a0000008c4815d59d01b0413d0041654a96c74413000000a390d5fbf1dd0ac0866d0144332f92d5b57f76000000d8582e29259399e7daa8638041aacc3d4f89d00f00c0288420a524b96b554d80eb9c0310f298bc1523838000001895b29e03301fa46a6312807a126011cd78f40100185105a08a2e336f6ae30601299ad55b005400000018490aa0642e736d5c0f80822a33759a00c900000018450520c62477dfb84140412a93593b762701d20b0800c0c672294697d9c60e022a52522b251e7f0000465201509d00d48380c28a138089757ed52a256fc764a2000000c0080a00a1be0b20ad7210d07a6f03acccbd4cc96901000060241580a0985cee9e6b03b70094ccf364dc050000c0883200c5fa14407b357f6dbd770128256f56157701000030a2f8afaa3299f9dc6a42f1ba2b00665e9ab1030000c0c82a00d1e5eec586550024c9a5bc2e3dd0020800c04633732573793d0868e31200d5e38045150000800d5efc07c94c727785559c0090d67f1db08254a4e48a952d96040000c086a400aacaa4ce69bc6a357f331bc0d72e93b9d72701a8010000b0911580982473955ac511c04155002a332f93f9549808a2150000808de192a2597d0fc02ab70006d003108a64de8e89590000006c680540f51440336f87555600d69d0084a0d23ac380c8000000d8d80ca0aab7005a1bdf03209529795e452a0000006c7805a01e02d4d22a2e021a4c05402a93796e663c1300006c640210ea7b00ccbdb5e15b000a8a972f04a2060000c0464ac964a696363c01908a14d54e891600000036b60420a5cb37016efc20a068d68ad1ea0480638000006c4cfc77a9ac4c29f982c2866f0184ca5ca519911f00800d4d008214537d0f4018c120a03225cb2b333905000000368c2b2899c946330848a5256fa7e40a34010200b07115004931d68380348253006532cf5362ed0f00c0466700f53140b536bc07a09e03a0bcae00f05c0000b09115802abaccbc1534824980665e2406010100b0e119404a2677b5377e126090d5090073000000d8d8f81f144d32f35cabecc31fc46d804ac9db3192010000b0d11580fa2e006baef6af4e0ce28b27b3fa3a600f9c03040060a3e2bf77af0356b3d1d8e00420483253692611ff0100d8382e2925c9a562b57f371bd0f7509ab9ccb8121800800d59fd07a91b7bb5ca1300034b00425091922999d3070000c0c6a400aa92c9dca4550e011a6405208fe6aa2f042203000060232a0031bacc6461841580ca4cc9a8000000b061523d05b058ed14c0415600aa6456300e1800800daa00a81e026466b9d6b005303198ef229496d44e495b0257020200b0216292ccd4d21ab60006920004a9a82b0026858c0c0000800da800c42ac9cc9b218c2801509d00e4b1731f00e11f0080e1f24e035e3d06388ca607a0f33d14f55944ba000100d8900a4072997b4b233c065826f3321957020300b05192b9dc3d0fa34a008294a7e4adc82900000036a602d09d0390d6d60438980a405099921754000000d8a004409d8b80dc9b0aa34a00142a33670e0000001b9801247325f722486924094090f2e49e272e03020060c33280ce55c06d8d6a0e40670b204fd1ea748042000000c32e0028552e336f6b5493008354a664794a2e06010200307c2ea98a561f031ce15d00454acaa3892640000036a802d01d051c1446760aa032f7ca3a93000100c0f033806426772f34ba390041c93c4f89264000003626fe87fa3ae0ba0760d5065501504ade8cc999040c00c0462400a1d303603ebf96edf7411d03949957c631400000364c3297b98ad1550024b92baf6712f3840000306cee2eabe3ee6813004995998b614000000c57085232c9ead377712d9f636280df4c3b25578a9d12009500000086a6aa4cc95c92ca912600928a68ae68ae2c043919000000c3a90028a8aa4f00545ac3186069905b0041959917669c04000060c81980527d13603b84112700412a63e74a60000030d4f8af64929bd6340468b01500a930e34640000036220388d194cc5b6b4d0006d80418f2943c4fc9a4c0954000000cb30210eb2140cdb0c626c0415600ca645e26a305000080616700c95cc9bd5018f11640a8e700945c080400c0b0e37f504a26376f6b0d37010eb6021094a764ed949c3b81010018b2642e33e51a790f8094c7e4ed985c72311218008021aaea26c031e80108a13453691c03040060f81580e432f7b6463d0740525537013a3b0000000c513d07c065e685a434d20420487932cf133d8000000c3903088ac9e5ae56188351c085991796d802000060e81580fa2e80b634fa51c0454a9e273305f6000000186a06109329998d450f40d9ed016008200000438cff5e5f06e4ae3cac710ec0004701cbea414075f4e718200000c3e1722553770ec09a22eec0120085a094bc1d237701000030d40a40e8ce01b0e644636dc5fc41f6002826cb8ddb000100187a069092c94cedb57e8a89417e3f6e2a93b99c498000000c8d7b7d0ac0dd8bb57e8e6cc0df53994c6218200000c363c994ea605baef5730c34010841794aae948c698000000c4108524c2e332984b59d00184605a048c9544f032403000060e00980825292ccddb5c62140d2807b00145424f394cc1a8d10e4340200003050be5801f0623d09c060b7003ac380cc8c0200000043a90048c94c669e87a071d90208f58540892708008061650031b9cc954b8ae35101082a2cd5d30029000000309c0a404cae64de94b4e663801303febe8a685e4473b998050000c0a079e71e00332fc2b83401d615002b523205310e180080c19700ea29809ebcad313a0658a6a4d299040400c070e2bf243329b90a8d4d0f809427f73cb98b494000000c474c26376f86754c021cf01c8090a764798a2e711f000000434a005cd1bcadf13906a82a2655f52440000030ac04a07311d09ab70006db0428e5d61d0444132000000317e4b2fa14403b8cd528e0e445b43a1b20fc030030581ea4685232e51a9b6380529ecc0b4b4e010000806154003c284693b9b715c6e43a60494532cfcd99040800c0703280fa18a0995ae3740aa032f3aabe0c881200000083e74a6672f7520a6bbe7d67d05b004ae64532760000001896645e3701ae63e6cea09b0095a2e729b982d3050800c030c4e84ae60b93136b4f00063d0950665e1813800000188abada6e32537b3d9f67d04d80725761c9e52cff01001838f7ba0950eb3802280dfe3a6029a88ae64a46120000c040436c904a33a5fad2bdf14a0082d48cd194527d1490dd00000006c72a97992bac63068034842d000595f5f944223f0000830db1a17b02208d5d0540f530a02ab9261b1c0400006060ea31c02e73cfa5f5550086b005108a943c4fc926271a999c3d00000006262593251521acfd26c0e1540082dac9ace43e000000061c625db2e44ae6adf5560006de0310a43c25ee03000060088b6c457325f7b614c66b0b40dd1e80ce31408e02020030389d214045586713e0e02b004145322fcc5c94000000187002905c669e2b8cdf2980d24ca5193d0000000c5ae7a87da1f11b04145a31791e3b730088ff00000c2ecac6644aa666908af1aa000495665e79ea2eff49010000180c574a2ef7f1dc0228ccbc5c1c0448fc070060406becc52d80525adf1c80e11c03ec340106ba00010018e0fabf3309d0d40ee336095041454c5ed6c7002900000030c855764aae349ea380959b7961660aa40000000c30c6ba2c99ccacad75de0638f16b7f7972b0df5c08b99997c9ea3f731500000003e28b5b004550587513606fcccf86f0ed5934afba63000000c0c04a004a2eb97ba17586d989a17c7351793253086c01000030b810eb4ad1954ccd89c6fa3ed7307a00544f02ecbc81f80f00c0c0a26c7d1780b7d558df49bb61cc0190b995662e37e23f000083e22e99b9dcd7d70038b40440aaef02e020200000835afb776f027449639a008410da31d5e30a8338090000c02032004b2e735708e35b0168a5e44a5c080400c0c04473a5a481540086710c50a1de02b0c546400000b0ded8aa64ae54df0330b615803cb9972e9b0e9d79800000603d1940e834007a11d67913e0d0128010945bf2d292a615024d000000ac97d73d00eecaa530b61580764c9ea7e4b33e49fc070060103a0df62d49c598560042919297c9bbc700c9000000585f705dec0128c2b836014aca937969561f03040000eb8eff3273992b5718eb41408a6675f99f2d000000d6c7176f02f452521ccb0a40086a45f3dccc4509000080c194002c49666a05291fd70a406ee6a5b9770e0152020000609df1bf3b0a787cb70082542cde0848fc070060fd5c3293cc5548633a07404179342f93711d100000038afff52860f33c8cf124c0a2bb05400900008001acad43f71480e71ae3bb00724b5ebab9024d8000000c24ba9ab9dc942b8ceb24c010f2682a13c7000100180cef4c021cd016c0d06e0374f3d289fc00000c2cb89a496e6a6b00730086d503e0891e000000065a027077997b1906b0bf3eac53004a4985a5ce1c20e23f0000eb0bad2e55c9954cadc90144ef61cd01909957e61c0304006030ebffde5300e35a0190e4ae22595dae2005000060bd71d5e5f580bd6a109f2f1bda771a54a47a66310000585748ad4f00c4fa8e9d62109f736288df6f2bd57b15dd8a00000058630690ac5e54070d2601c886f8bdb693b91b911f008075b3fa222093d63f0468b8158010f254cf0298e24a600000d6b5a89679a701700037010ebb02509a29d2030000c0fa83aad55b0065d0609a0087d903d04ec94b4bbe558d400f0000006be42e751aebdb1afb1e80a056722f4c2eb6000000584f012028b929d537018efd2980c2cc2b33e6000000b05e662e332f4218ff2d802299aaee6d806c010000b036aefa18a0bb0a69fc9b00733395f59945f6000000585f054032f3812500433c06a8564a56985b27cfa0040000c01a17d5b2644a49ad20b5c7ba02a0ce168019a11f0080f57097924b2e2f35ee3d00412aac930074bf790000b0369d390085c67d0e4008a19dcc4a93297029300000eb88a9f528e0645e0485b13f06982753e9c629000000d6e38a414061cc070129a89d7ab6000000c0daa57a0e40fb7ab80db01e04c4d21f0080f5c5d420994be62a751ddc0510cdeb414021d0030000c07ab8bbdc54761aebc6370108418ac98b644e0f000000eb8afe524caee4de9ec806335c6f98730064c94ba707000080f5c7545bbc0d70202666372fff85e6f37a25bfe66f562acd29fe0300b0ee04a08ea7e5a03edfc4af7f362df98e9d5b837efec733b5aafa0282e61a9281a09027f77adf823400008035495edf0618069900bc7c7ab9c0ecbad07425930eee08facc93992eb5a556b1aa44a09d92cb922b5009000060d542902cb9cc5c1ad01140e91a4d80dde4e047e75d272fba0eef0afacf4e643a3db7c22420a86da92e5b842032000000d6a0b3ffaf410d01ba6602d0fb855f3beb7af3bc6bb221fd8d0f64bad092f2f2ea894090dac93cba6b2270233000006b925c4aa62a68831380ae68d2975e30bd70d275ec50d05f795fa6b3f3574d028a648a667502c0514000005627742b00beb28b80dca52d9ba42c1b6002d04d02debee83a33ef6a04e9a71fcb746eb924202877f3cadca61ba2040000c05a320033979b97ba4a13a0bb343d29cd6e96feb7cf994e5ef4c126005d5592bef0035390f49f3e9ee942b37e5bb8f27b6ec6a4c25cdb68010000606d9249c9d40a41ade582ff9e6dd2bff87cd21be75c175ad7aebaaf6b12604cd2e77f60fadaaba6f7df99e9930fd5bd013d494061ee89c80f00c09a0b00727799fbbbee017049930d69c716e95f7e3ee9b9375cb6c298bbee51c03149975ad29f7ccf9465d24f1ecf34d7995314427d2570b2fa9ba407000080d5f1ba0150662ad4b305e092766d957eeb4b493f38e96a155a71f01f4802d09b087cf6395323484fdd97693eaf2b00c9bc72223f00006b66972b008b09c08e2dd2fff5e5a46fbde6ab0afc5d03bd0b2099f407cf9afef8bba6ad5392a4a625955c090c00c01a85204b92995a2184b65437fafdf69f99bef6cada82ff402b008b598a497ff08c2993f4a1a3593bb9aaee37471a0000c01a16d85e1f03dc36a5f277be65faca4b56df0db08ec03a94eb80dda5ffef3b2697ca4f3f9a45b74ef4270300006095415572736ddda4e25f7f35155ffee16082e9201380f0ae3cc0954753c50e0000006b679d4980ee8a83fa9ceb4900c20a3ea26de665dd0448160000c0aa836d671090b9b71542de89a7e1dd7582e126006115ef7737e531a94ae67205711a000080d5a98f01ba6252eebeec5d0061b5c9c04a1380b0a6b775e600b88b41c00000ac2b0950292d6e015c2de0879524022b4900c255fe1caef236aba2621595bcd3a94801000080d5077f37a9aa5456496527ce66cb0478ef8bc7be960460b9c0dfff3aebf973effbc242a1aa5578347399a5fa2e630000b0626641e6ae56e9b18cee9226fb027cf7b52fb1fa5f3609985843f0ef7de90dfebd438532498db72f7a796ea19e0468c9658927120080552500a13e06f8ce25cfcf2e5c11bbfd2a2fe15a49c04ab700fa037ed6f3e7fe0ac0e29f5f3feb3a79d12d1309000000abe5922682d408ae974e797cfb82ab53017049d617f4adf3a295240113d758fd876556fdbd2f4152a3effd8b1f5f2455294929b9125b000000ac58901493cb4dca2b4f9d376d9294fa82bef7c4defeb72d99044cac30f837fafebbd19300347ade9ff5250033413a9f976665cc329e4a0000569700942615952785302ff9e64e02609d2420f504fcfe5ebc74b524e05a3d00fd4940d6f37aa227f837faaa02dd84605711f5f285053f37b3d9f76e6a68cd9716000070a3696452bb942eb6fced94f4a6a4d9251280a4fa7860ef223e75e2b169054d804b35fe8525027b43f5fe43370198e8f9effe8f9b7ef98c3fffd2297f73ef76df3b31d539cec0730a00c03597ffc1a45621bd70d29f7ffba2bf28697bcfeabe1bf8bbc1bf774c70ffa900f5570196eb01586acfbf37f84ff62401933d89406f456042d2c42ba77cfe99d7ed5b47f7ebfee95d6132cba8020000b092d57f594917e6d5fcc62bf69537cefb82a46d9d40df0dfebddbeefdc1bff76531f02f5501582a11e86ff89bec7bd9d493084cf4fc77d6f3fed9e7deb42f1dd91f1ed8361dde37bbb9fee4240100002c2d0bf515c0979af26fbe6a9ffbe13bf615497b3b01bc1bfcabbe05fb72c1dffb2a007582d113ec7b5ff7aefab3be00df1bf8a73bff3db5c4ebe9cecbec422e9d99d7fcd6691ddc33a35d13597db981d80e0000e08a95b72425932eb6a4afbcec5ffdb7dfb6ffe79d4bba2069b3aeecb35b6ee56f4b04fe15cd01e89ff0d77bd4afb7bcbfa92719e8ad04f42608dd4460e6b5b37ee177bf615f986b65f6e86de18efdb36a4c4ed4594e16b82b000070634bf5bc7f95513a35aff6375ff3af7df639fb9db72ffa1949bb3a2bfe86ae2cfdf706fdd413a74d979b0083de3d07202c35de37f46418bd0d7ebdabfbcd9dd7bd6febed0be8ffd82d9266243566a6b5fbbe9bb27b1fbc391cbe739f76ecd812a6b66dbe728c20000037127369be905f6cf9fc4befe8e4736ff933cfbd697fd6cc75a11383bb1701c59eff2e25159d97bcf352f6bc549da4a0d2bb870669a509c0644fc0ef2def77ff7b93debd3d30d593006cee24005bbb49c2f6cdda7df3ae6cefcc666dd9bc495b280200006e105794ea437ddb6f9957bad42c74f6f573f6c2a596dee97c6cd513ccfb5f7a837fefeba22709e8f60b585f12b0e2cb80322d3f09b0ff9860efebacaff4903a09c2c4a5b69a97deb296deddc14822000078af067ef504ffde157ddef3527516ccdd957ea32780775f92969eccbbe2783ab182801b56f0bea5be60ef9e44eafc8f741b174c978f0f3648000000375802d05d14f78eeccd74e528dffe01fa595ffc5d57dc9cd0bb0705acb47471b56306d653766874329aeec7949d2a40ef0441823f00e046ac027417c9bd65fdde927ff7fdfdddfdb64c0c5e550270ad40dfff05fb4b10dd9746e77558e2f3c4be2ac0445ff027010000dc885580de785ae9f2f9fed8f792fa1202d395f700f4bef8325f6f450940ff5fee0ff8b16775dfe8294bf47f6cefc794ba72a2e052d38bfa2f2c0000e0bd12f4c312f1b5bf12d0bfb84e4bc4deea2a49427f32b0a60a402feb5be577bf816c89e0df1bf87b0716f4ff77768d404f020000782f2500cbbdbd77e5de5f65d71249c052270262dfc7595f0cef4d38964c00bcef2ff4de2ddc3b7738eb0bd0ddf7f7ce0d084bacf497daef0f047e00c00d9808f812af97dae7efdf26e8ef19a8faaa0069892ac0bbbef644cf3bc212abfefe04202c11fcb544f05fee68022b7d0000ae5d19b85aef5def56407fc3605c2271b8e675c0fd5fbc7fc4603758577d1f67baf226c0899ea0bfd4b9c4debfcb004000c08dcc96898fbddb03bdc1bc7795bf54d3606f0560b9d37acb2600bdc1dffa8277eafbb8defd86ee6abf3f01e85de5b3da070060655581a52a0149efdeefaff4eefdff7495d5ffbb2601f66e03f855b293de6fa6b729b0dbe4575d25011089000000d70cfecb2500a6ab9f16e8fd98abce09985866f5dffb67d395db014b65234b8d055eea881f0000587932e02b480496ea13582ef82f7b0a60a964a05bea5f2e09e80dfad2bb4f0990040000b0b64a407f3f40ff9141d7d2c7085dcb9f3ab86a405e2a68f736f3f596f8b3bef75f6bdf9f240000806b077ff5057ff52502fd0bf2e5c6f3af2a01b85a12d01fec335d7991c1d5823f490000002b0bfefd6fefaf04f42606570bfc4b7eeed5de0418ae521590ae3de48704000080f527004bbd7dc5c17fa58138aca13a40d0070060b0c9c0b52ef95951e05f4b500eeb781b890000006baf02ac36c85ff37ae0b50463023c0000d7478230b4604db0070060bc93820d09e0240400008c61c07f57c076771e4a00006e30dcc607000009000000200100000024000000800400f8ffdbad03190000008041fed6f7f88a22000400001000004000000001000004000010000040000000010000040000100000400000000100000400000400001000004000000001000004000010000040000000010000040000100000400000000100000400001000004000000001000004000004000010000040000000010000040000100000400000000100000400001000004000000001000004000010000040000000010000040000040000100000400000809900fcc57d3ce2422bd00000000049454e44ae426082, 'AN', 6);
INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrimag`, `estado`, `id_empresa`) VALUES
(22, 'eee2', 'eee2', 'eee2', 0, 'd2f2297d6e829cd3493aa7de4416a18f', 2, 0xffd8ffe000104a46494600010100000100010000ffdb0084000906070d100e0f100f0d0d0f0f0f0d0e0e0e0e0f0f0f0e100d0f1611161615111515181d2820181a251b151621312125292b2e2e2e171f3338332c37282d2e2b010a0a0a0e0d0e151010162d1d1d1d2b2d2b2d2d2d2b2d2d2b2d2d2d2d2b2d2d2d2d2d2d2d2b2b2d2b2b2b2b2d2b2d2b2b2d2b2b2d2d2d2d2d2d2d2d2d2d2d2d37ffc000110800e100e103011100021101031101ffc4001c0001000203010101000000000000000000000102030405070608ffc40046100002020002030a080c05040300000000000102030411051221060731415152617191c11322328192a1b1d1142342445354727382a2c2e133436293b2246383c31674f0ffc4001a010101000301010000000000000000000000010203050406ffc4003011010001030106050401040300000000000001020311040514314151521221226191131542a132236281f071b1e1ffda000c03010002110311003f00f7100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ab9c570c92f3a2e25330a3c456b86c87a511e19e89e28eac73d21878f0df52eb9c4ca2dd73c926ed11c6a8607a6f059a5f0aa337b12f091da65f46e76cb0de2d77c7cb7e324d269a69ed4d6d4cd4dc9000000000000000000000000000000000000007c5ef87ba3bb0de0e8a25a93b6329cec5e54609e494791b79ede83dfa2b14d79aaae10e66d0d5576f1451e533cde752d258896d788b9bfbc9fbcea451447e31f0e24dcb93f94fcca8f1563e1b2c7d7393ef33888e8c3c55759f96394f3e179f5ed2e5319e2a36b910f12786156cc72cb0f4fdc369dc2d5a3eb8e23175424a566519cd29463aef24723556abaaeccd34bbda1bf4516222baa238bb366ec345af9e54fecb72f61a234d77b5e99d6588fce1b7a274ee1315ade02e8cdc7ca8ed525d393e230aed5547f28c36dabd45c8cd139748d6da00000000000052db6308b94a4a314b3726f249162267ca126622332e5cf74fa3970e328f4d336fd0b9db2d33a9b31f9c35acdd9e8c8fcea2fa949f7194696ecfe2c275b623f2609eef345afe749f5573328d1dde8c276858ead69ef8ba39702be5d55fbd996e373d984ed2b3eff000c166f95835e4d388975a8aef328d057d618ced3b7ca25ad3df3aae2c1dafaec8232dc27b987dd69ec96bd9be7cbe4e0d7e2b5f72328d0473a984ed49e547edaf3df3713c585a175ce6fdc651a0a3ba584ed4b9ca986b59be46907e4d7868fe09cbf5194686df59633b4af7288ff007fcb04f7c2d26fe5d11eaabded99468ad7bfcb09da17fac7c35e7bb9d28fe73975575aee32dd2d76b1dfaff77e9c8d23a52fc4cd597d8ec9a8a8293496514dbcb674b66ea28a688c531879ee5caee4e6a9ccb5948d996ac275865306b0cae15721930ab9132b846645c1ac170fa3dee359e94ad45b4955294ba5679647875b3e9874b6747aa65ed272dda0000000008949259bd880c6b130e279f5293ee03e137cebb156c68a30f562275cb5a76f83aac926d34a316d2eb67bb4734539aaa97376845cabc34511331cdf071d038f7c182c4ff6a4bda7bb78b7dce66eb7bb25961b9bd24f830588f452f6b26f36bb9773bdd8cb1dc9e957f31bbb6b5fa86f56bb9772bfdbff004c91dc76957f339aeb957ef31deed75651a0bfdabc7713a55fcd72eb9c177937cb5d57edf7ba432c7707a55e5f135acf96d8ec26fb6bdd97dbaf7b7cb22def74af330ffdefd89bf5bf75fb6ddf6ff7fc2d1def34971fc1d7fcb9f7137ea3a4ac6cdb9d6175bdd63f8edc32fc6de5ea26fd4f465f6cafba1923bdc62f8f15845d3e3b26ff004f6afdb2aeff00d2cb7b7bf8f1d84ec9937f8ed5fb64f7fe975bdc4f8f1f86e9c93f7937ff00ed65f6cfee5e1bddc78f48d5974413ef26ff003dabf6ba7b9923bddd1c7a4d79aa8bfd437fabb4fb5d1dd3fa645bdde1b8f48cbcd54567eb26ff005f4865f6cb7dd2c91deeb07c78eb9f5422bb8c77eafa42c6cdb5d659abdedf02f63c5629be2d908fb624df6e7b328d9d6bddc8ddb6e3f0780c22babb3132b25757545593adc76a6dec504f822f8cdda7d4d772bc4f068d5692d5ab7e28ce5f0b99ef7330fb6de828d6c6e2accb64288413e46e4d9cdd6cf9c43adb3a9f2997ad1e07500000086c0d7c462229c12b22b5a4d369c734b564f8fa80c562adadb8a970a7e5d5c29e7c801ceafad4bd387b808d7abeb13f4ff602c9d5f496be852b1812dd7cb776e200a375725fdb88f7811955ccbfb6ef7812a153fe55bdb25ed6110e35fd04fd5ef00f53eadf96b02bab0fab47d1aca0e11fabd7f93dc055ff00ebd7db1f700d797d0d7dabdc05bc359cc87a5fb0076d9c957e6f700f096ffb5f980b4676f2d5d9202ead9a71d6716a52d5d89acbc56f3f51064b9e72abef1bec8480f84df8b1195383af9d7d96fa15eaff00d87b7451eb99f673f68cfa298f779866749c87a56f2d4fc5e3ace7622105d5187ee72f5739addad046287a49e47b800000c18c59c57de579f4ad74981755417c98af3202f9ae5413308738f2aed45c49e28eac52c4d6b86c82fc48be1aba319b94f5863963e85c3754bf1c7de5fa75f6cb19bd6e3f28f9637a570cb871347f761ef2fd1b9db3f0c779b3df1f30a3d3184facd1fdc8bef2fd0b9db3f09bd59ef8f963969cc27d66af4932eef73b658ef963be18e5ba0c1fd621eb65ddaef6a6fda7ef86396e8b07f4f1ec97b8bbadded63bfe9fbd8e5ba4c1fd37e597b8bbadde89f70d3f730cb74d84fa4f532ee977a31fb8d8ee6296ea709cf7d85dceef44fb958eaaff00e4f867f2df60dd2e743ee363ab2c74e50ff98975a68c274f723936d3acb33f932ad2107b54e2d7434cd734cc7186fa6ba6a8cc4e51f0f8f3e3da8985ca5691afe921e921832cf563632e0927d4d326172c93bfc6abef3feb985cb61d99d957558fd4977915e71befe233c4e1619f91879cfa9ca797e847bf451e554b97b467ce987c1667b9cec3d7f7a0a35745eb7d2e22e9f5acf25ec391a89cd72eee96316e1f6e687a40007277557d95e0ae9d7271928af196c693924f2e9cb33d1a4a69aaf53153c9afaaaa74f5cd3389c3cd258bb9f0dd73ebb26fbcef7828ed8f87c7fd5b9df3f32a3bec7c339beb94997c31d13c554f39f96396de1dbd7b4c98cc678abaab91760c9e18e88c97222657c31d00b8466454361556c0ab6454302ac2aac8a86155614526b81b5d4f23195866af1d6478f5bafde6155113c59d35d54ce625d9c06948cb638c735c5ab1cff73c5774b1c697534faf9e15fcba50c625c1923c587562acf9b2d38df1dede18af6930b96fc3179baf6ff33f448986512ea517a7647a2b9bed71f718b289797ef9788d7d25359e6a14d51f3e59bf69d1d2462872b5d39b98f67ca592ca2df433d333e4f1c479bde37bdc3783d15838f1ba54df5c9e671ae4e6a97d0598c5110fa3306c0001ccdd2d5af82c4c7fd8b1f62cfb8dfa69c5da27dde7d5d3e2b15c7b4bca93cd27d07d13e240a864100405430a820ab0a8615564101556155645430aab22aad904115119b4d34f26b6a615d8ab13ad0535c2b64d723e53c1a9b58f543ada1bf9f44af5e27c75b7e4b5eb3c6e965d2a715b61b7e5fe99130ca25dcc05f9d9ff001a5f9998cb389796eeaf11e134862a59ecf0ce2ba9248e9588c510e46a67376a71efdb16b9728f6bc8d954e225aa88cd510fd25a169f0785c3c32cb568ae3975451c69e2fa0a7843748a00030e2ebd7aac8f3ab9c7b62d195138aa258d719a661e3543f123d48fa797c2cc62661722200a85430208a86155604322aa150c2a927b1f512561bba1aa85987ae528a726b293e569ed2daf551132d1a8aa68b95444f9377e07573226cf0c347d5afa9f04ab9911e183ea55d513c3d697911ec18858aeacf173748d69453492db93c8d75c3d566a9999cb9ecd6dedbd1966566a3f26c4e2faf88d7729cc36daaa69aa261573719a4f89c93ffef31cb98c793e829ab3196fd176d87dafd2cc659c3bfa36ff001e4f9231ef6632ce1e5b8abb5edb67ceb6c9799c9e474a88c530e3dc9cd533eebe0eaf097d15f3f11547f3a25d9c512cac466b87e96ae39452e449762390eeac0000003c66d86ad96c3997dd0f32b2597a8fa6a2734533ed0f88d4d3e1bd5c7bca864d286150c0ab22a0086155645430aab02ac8a80adcdcdcbe2651e65d62ed79f78b1fc663dda7591fd489eb10ea9bde400d7ba79ec24b6530d3c7c73adf464cc2ae0dd6a7154390687b084b2927c8d3ec6161b5a4f65a9ae0938cbb51ccbb18aa5dcd3559b70bd33db1fb5fa59aa5e98762ac46a577cf9b5c9f640c7199659c465e6f5702ea3a50e44bbdb8ba3c2695c0c72cd2bb5e4ba2316fdc69d4ce287a34919b8fd0c731d80000000791e9daf531b8b8e597c7b92ea924cfa2d34e6cd1ff000f90da34f87515b44dcf0a02a1855482185430aab2086155615522a185608d738b96a5d6c14a5acd45a4b3ece835f8719c4cc339aa271e2a6270b784bfeb3779f55f70c55dd298b7d90877627eb33f3c62c7afb8f0daec53c3627eb1db5c58cd7ddfa65e1b5d9fb1df897b1df169f0af05159ae4cf319afbbf4782d72a7f686055856ee3de75533e8517e668f06a23d4eae8aacd330ad2f6c7ed7733ccf7b6749ddab82c53e58ea7a4d47bcb4466a84b938a25f1703df0e64bec77aaa35f4bc1fd161ed9f6e51ef3cdaa9f4bd9a28f54cbdcce7ba80000000f2edd957aba46efeb8553f565dc7774339b31ecf98daf4e2fe7ac38a7adca405410430aab02191550a8615564156150c8aab22aac8aab0a861556c8202aac2b713d6c2cd7325ade6c8f2ea63cb2f768aac5585697b63f6bf4b3c4eac2bba2b72c1b5cfbe11ecce5fa4cad47a9aefce287cc567b61cf97a1ef2b4e78cc658d79187aa09f4b936d7a91e2d5cf0743431c65ec278dd0000000079cef855e58dae5cfc37f8cff0073b1b3a7d1547bbe7b6d53eaa25f32ce83888645430a8605591556150c0ab22a185558555b31555854320ab0a86455585430aab20dcd1db55b0e7d6fb51aaf46696fd3d5e1ae14c3bf23ad7f8b39cee434f74f3f8aa23cb6592ecd8bdacd9678cb4ea3f8c38759eb878a5eabbcad79538cb39f7c22bf0c76fb4e7ea67d4ea68e3143d3e2cf33d690000001f09be557e3e127cbe1ab7d8a4bd874f66cf9d50e2ed9a7fa74cfbbe399d57cf2a410c2aa150c8202aac2aac8a8615564555915520861550a86455581564540567d1f6656c3a5eabf3ec31abce19533896551d5925c936bd4ce655189977689cd312e3ee96cce74ae4ab37d6e46db31c5ab513c1cdacf443c92f5cde9e3aba3d3fa4bac9be9db9771cdbf39ae5d8d3462dc3d068b0d2ded840000003e3f7caaff00d3d13e6e252f4a3247bf67cff5263d9ccdad4e74f9e92f823b0f9755854010c8aab0aab6150c82ac2a1b22aac8aab22aac2a1855590542a185559150c0465934f91a64574711e5a7cbe37e5673af462a97674b566dc3e674e4f3c435cd8571f51b2d7f1617e7d4d5cf24fa99bb934737b1ee11783c0e1e3c7e0d3edda72ae4e6a976ad462887d9e1a660d8df8302c00001f37be155ada3ac7ccb299f6589779ebd14e2f52f16d0a7c5a7ade6acee3e49560411556150c0ab22a18555855598aaac2a19155605591501556150c82185542a1915bce59c20fa1afcacf16a63cf2e968aaf2987cb6909eb5f6bfebcbb165dc5b7fc616ef9d52c73f25f4ec339e12d74c66a87b26e79a8d354792b8af51ca9e2ee53c21f5b8396c22ba7530328000072375d4ebe8ec5c78fe0f64965cb15acbd86ed3ce2ed13eed1a9a7c566b8f6979345e693e548fa17c621854322aac086c2aac8aab0a86c8aab22aac821855585559150c0ab22a02aac2a190430ad8a67e235c8fda9a3cfa88cd2f5e8eac578eaf9573d694a5ce94a5daf331a7837d5e732cf5ace55ae5b20bd64b938a64b319ae1eb5a26dd89742472dda7d668f9ec03b34bd8067400001831f5ebd36c79d5591ed8b46544e2a89635c66998789519ea473e15149f5ad87d2be26631330b322202aac2a191556055b22aac8a864555b0aab0a864150a8615522a18104555854302ca4d4679731b5d68c2e4669986cb55786b897cd568d10f6cb6f07b6ea57f5e7d88d77e71436e9a33721e91a26ee039ceb3ed345d9b101dfc3f001b080900044966b203c4b130d4b6eadec70bac8b4f852d6797a8fa4b739a299f67c6ea289a6ed513d5899934a1815645430aab22aac8aab0a86455581564540555854320ab0a80a86455581015307b7d4457cfce394e4b924d1e7e6f76730d8c03f8f874464cf3ea67d2f568e3d597dce87b76a3c2e93efb4241b480fa7a61920330000000e2697dcae07153f096d4fc265939c252837d79709bedea6e5b8c533e4f35dd25abb39aa3cdf3d89ded2979f82c7626be45250b12f633d11b42e73887967655a9e132d1b77b5c525e2691ae4f9278770f5a9b3646d1eb4fedaa76453caafd7feb4acdc06978e7959819f429db16fb6197acce36851ce25a6764d5ca61a566e474d473ff00475c92e38df5edea4de6671aeb4c27655d6959a1f4a45bd6d198ad9c715aebd465bd5a9fc9ae7675e8e4d0b9dd0794f098b83e9a64fd86717a89fc9ae745763935e7a42a8f94e70fb709c7da8ca2b89e12c274f7238c11c7d0f82d876e45cb1fa55c725d5f07c138bf3a09e198e49d65ca826060559150c2aac2a190430a80a860466457231f0cad974e4cd35479bd76e734c2b81cfc2bfb297acf16aa7843a3a38e32f46dca68c9d8d3c9e5b0f23dcf50d1981508a03a280000000000000000000060b3074cbcaaab97da845f717329886862b735a3adfe260b0d2ebae26515d51c258cdba678c39b89def742cf87035c7eedcabf63328bf7239b19b16e7939d76f55a25f91f0aadf2c6f93ff002ccce3557239b5ce96dcf273edde8a8fe5e91c643ed2aec5ec4671acafa35ce86dcb42ede9f18bf87a562f9159876bd6a4cce35b3d1ae76750d1bf7b5d351f22fc15be79c3da8ce35b1d1ae766c729695db89d3f0f9ad167d8ba2cce359435cecd9ead1bb40e998797a2efcb960d4bd8651aaa3ab09d9f5b46c862a1e5e03191ff00866d7a919c5fa279b5ce8ae43567a4611d938d907fd7071f699c5ca679b5ce9eb8e498e90a5f04d17c50c7e957d191626b7f2e3da5cc31f055d1ced298886bc36e6e4b24a3b5b7c492e334dc9887a6c5154c4c3eb7711b8dc4df2f0b6d365509496aab22e3292e5c9ed473afd7154f93afa6b73453e6f65d13a22ba22925c4687a1d3000000000000000000000000000000000000001818a586a9f0d75beb8c581cfc46e6f4759fc4c0e127f6a9adf719457547096334533c61cdc46f7da166f37a3e95f76e752ec8b46517ab8e6c26cd13c9d2d19b9bd1f86fe060e8adf3941393fc4f698d55d55719674d14d3c21d4d55c862c9200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003fffd9, 'AC', 6),
(28, 'fernando.palacios', 'Fernando', 'Palacios', 0, '2dc4e4a6fbeab8a7f828efa9aec7d7ad', 1, '', 'AC', 6),
(59, 'ernesto.clavel', 'Ernesto', 'Clavel', 0, '2dc4e4a6fbeab8a7f828efa9aec7d7ad', 1, '', 'AC', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_reparacion`
--

CREATE TABLE `solicitud_reparacion` (
  `id_solicitud` int(100) NOT NULL,
  `numero` int(100) DEFAULT NULL,
  `id_tipo` int(10) DEFAULT NULL,
  `nivel` int(10) DEFAULT NULL,
  `solicitante` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `f_solicitado` datetime NOT NULL,
  `f_sugerido` date NOT NULL,
  `hora_sug` time NOT NULL,
  `id_equipo` int(10) NOT NULL,
  `correctivo` int(10) DEFAULT NULL,
  `causa` varchar(255) CHARACTER SET latin1 NOT NULL,
  `observaciones` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `estado` varchar(2) CHARACTER SET latin1 NOT NULL,
  `usrId` int(11) NOT NULL,
  `fecha_conformidad` date NOT NULL,
  `observ_conformidad` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `foto1` blob,
  `foto2` blob,
  `foto3` blob,
  `foto` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `case_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `solicitud_reparacion`
--

INSERT INTO `solicitud_reparacion` (`id_solicitud`, `numero`, `id_tipo`, `nivel`, `solicitante`, `f_solicitado`, `f_sugerido`, `hora_sug`, `id_equipo`, `correctivo`, `causa`, `observaciones`, `estado`, `usrId`, `fecha_conformidad`, `observ_conformidad`, `foto1`, `foto2`, `foto3`, `foto`, `id_empresa`, `case_id`) VALUES
(1, NULL, NULL, NULL, 'Jose Perez', '2017-11-08 10:44:25', '2017-11-09', '08:00:00', 1, NULL, 'rotura de rueda', NULL, 'T', 3, '2018-09-29', 'Conformidad ', NULL, NULL, NULL, NULL, 6, NULL),
(2, NULL, NULL, NULL, 'wqewqe', '2017-11-08 10:45:54', '2017-11-09', '08:00:00', 1, NULL, 'assdas', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, NULL, 6, NULL),
(3, NULL, NULL, NULL, 'asdsadasd', '2017-11-08 10:46:39', '2017-11-09', '08:00:00', 1, NULL, 'asdad', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, NULL, 6, NULL),
(4, NULL, NULL, NULL, 'sssss', '2017-11-08 10:47:21', '2017-11-09', '08:00:00', 1, NULL, 'sadasdas', NULL, 'T', 1, '2018-01-30', 'trabajo terminado', NULL, NULL, NULL, NULL, 6, NULL),
(5, NULL, NULL, NULL, 'huggo', '2017-11-08 12:53:19', '2017-11-09', '08:00:00', 1, NULL, 'observc test2', NULL, 'T', 1, '2018-09-25', 'nuevaaaa', NULL, NULL, NULL, NULL, 6, NULL),
(6, NULL, NULL, NULL, 'Hugo Gallardo', '2017-11-14 15:23:31', '2017-11-15', '08:00:00', 2, NULL, 'Rotura de llanta', NULL, 'C', 5, '0000-00-00', '', NULL, NULL, NULL, NULL, 6, NULL),
(7, NULL, NULL, NULL, 'Hugo Gallardo', '2017-12-01 05:35:25', '2017-12-04', '08:00:00', 2, NULL, 'Falla test sobre RS-0001 (01-12)', NULL, 'C', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6, NULL),
(8, NULL, NULL, NULL, 'hugo gallardo', '2018-01-13 21:54:50', '2018-01-14', '08:00:00', 2, NULL, 'rotura de equipo test', NULL, 'S', 5, '0000-00-00', '', NULL, NULL, NULL, NULL, 6, NULL),
(9, NULL, NULL, NULL, 'juan perez', '2018-01-17 13:38:28', '2018-01-19', '08:00:00', 4, NULL, 'mancha de aceite abajo del equipo ', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, NULL, 6, NULL),
(10, NULL, NULL, NULL, 'Solicitante 1', '2018-01-18 18:05:53', '2018-01-18', '18:04:00', 8, NULL, 'ccg', '18:04', 'AN', 0, '2018-02-08', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(11, NULL, NULL, NULL, '1', '2018-01-18 18:07:20', '2018-01-18', '18:06:00', 6, NULL, 'mancha de aceite debajo del equipo', '18:06', '', 0, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(12, NULL, NULL, NULL, '1', '2018-01-30 14:06:43', '2018-01-30', '14:03:00', 9, NULL, 'No tiene fuerza para levantar la carga', '14:03', 'C', 0, '2018-02-08', 'ok\r\n', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(13, NULL, NULL, NULL, '3', '2018-02-05 19:01:38', '2018-02-05', '18:59:00', 9, NULL, 'bateria descargada\n\n', '18:59', '', 0, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(14, NULL, NULL, NULL, '1', '2018-02-05 19:42:17', '2018-02-07', '05:41:00', 9, NULL, 'fhjh', '05:41', 'AN', 0, '2018-02-08', 'Trabajo OK ', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(15, NULL, NULL, NULL, '1', '2018-02-05 19:46:36', '2018-02-17', '05:41:00', 6, NULL, 'ggggjffufjffg', '05:41', 'T', 0, '2018-04-11', 'TERMINADO CON EXITO', NULL, NULL, NULL, 'assets/files/reclamos/15.jpg', 6, NULL),
(16, NULL, NULL, NULL, '1', '2018-02-07 12:36:19', '2018-02-16', '12:35:00', 7, NULL, 'fff', '12:35', 'AN', 0, '2018-02-08', '', NULL, NULL, NULL, 'assets/files/reclamos/16.jpg', 6, NULL),
(17, NULL, NULL, NULL, '1', '2018-02-08 14:38:14', '2018-02-08', '14:35:00', 10, NULL, 'Ruido en cuerpo de bomba int 0057A', '14:35', 'T', 0, '2018-04-11', 'lista la solicitud', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(18, NULL, NULL, NULL, '1', '2018-02-08 14:46:00', '2018-02-08', '14:45:00', 6, NULL, 'Gets con desgaste excesivo', '14:45', 'C', 0, '2018-04-10', 'CONFORMIDAD', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(19, NULL, NULL, NULL, 'hugo gallardo cloud', '2018-04-11 12:56:39', '2018-04-12', '08:00:00', 10, NULL, 'solicitud de servicios prrueba coud', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6, NULL),
(20, NULL, NULL, NULL, 'hugo de nuevo', '2018-04-11 13:15:16', '2018-04-13', '16:00:00', 10, NULL, 'sol de servicio test', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6, NULL),
(21, NULL, NULL, NULL, 'ssss', '2018-04-12 10:53:14', '2018-04-13', '08:00:00', 10, NULL, 'asdadasdas', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6, NULL),
(22, NULL, NULL, NULL, 'ssss', '2018-04-12 10:57:40', '2018-04-13', '08:00:00', 10, NULL, 'zcxczx', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6, NULL),
(23, NULL, NULL, NULL, 'hugo', '2018-06-18 17:19:46', '2018-06-19', '08:00:00', 10, NULL, 'falla de equipo prueba', NULL, 'AN', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6, NULL),
(24, NULL, NULL, NULL, 'hugo gallardo', '2018-06-18 17:22:00', '2018-06-19', '08:00:00', 10, NULL, 'fala en quipo testeado', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6, NULL),
(25, NULL, NULL, NULL, 'hugo gallardo', '2018-06-18 17:36:20', '2018-06-19', '08:00:00', 10, NULL, 'fala en quipo testeado', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6, NULL),
(26, NULL, NULL, NULL, 'hugo ggggg', '2018-06-18 17:38:17', '2018-06-19', '08:00:00', 10, NULL, 'fallaa test', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6, NULL),
(27, NULL, NULL, NULL, 'hugo g', '2018-06-19 11:09:05', '2018-06-20', '08:00:00', 4, NULL, 'falla test', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6, NULL),
(28, NULL, NULL, NULL, 'hugo g', '2018-06-19 11:13:04', '2018-06-20', '08:00:00', 4, NULL, 'falla test 1', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6, NULL),
(29, NULL, NULL, NULL, 'hugo g', '2018-06-19 11:17:36', '2018-06-20', '08:00:00', 4, NULL, 'falla testing 1', NULL, 'T', 3, '2018-06-19', 'terminada conforme', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(30, NULL, NULL, NULL, 'hugo', '2018-06-21 09:41:58', '2018-06-22', '08:00:00', 4, NULL, 'falla testing solicitud', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(31, NULL, NULL, NULL, 'hugo', '2018-06-25 09:29:37', '2018-06-26', '08:00:00', 4, NULL, 'fala ttesting 25-06', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(32, NULL, NULL, NULL, 'hugo ggg', '2018-06-28 12:52:09', '2018-06-29', '08:00:00', 4, NULL, 'falla calendario ', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(33, NULL, NULL, NULL, '1', '2018-07-30 03:30:17', '2018-07-30', '10:23:00', 2, NULL, 'Ventana sucia', '10:23', '', 0, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 0, NULL),
(34, NULL, NULL, NULL, '1', '2018-08-30 04:35:56', '2018-08-30', '15:30:00', 4, NULL, 'falla en rodillo de cinta', '15:30', '', 0, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 0, NULL),
(35, NULL, NULL, NULL, '1', '2018-08-30 08:00:51', '2018-08-30', '18:16:00', 7, NULL, 'ddd', '18:16', 'AN', 3, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/reclamos/35.jpg', 6, NULL),
(36, NULL, NULL, NULL, 'dasasdasd', '2018-08-30 08:18:16', '2018-08-31', '08:00:00', 1, NULL, 'asdad', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(37, NULL, NULL, NULL, '1', '2018-08-30 22:50:07', '2018-08-31', '10:05:00', 2, NULL, 'fgggsf', '10:05', '', 0, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/reclamos/37.jpg', 0, NULL),
(38, NULL, NULL, NULL, 'juan perez', '2018-09-04 23:33:51', '2018-09-06', '08:00:00', 1, NULL, 'dsadas', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(39, NULL, NULL, NULL, 'juan perez', '2018-09-07 00:08:47', '2018-09-08', '08:00:00', 1, NULL, 'sadasda', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(40, NULL, NULL, NULL, 'asd', '2018-09-07 00:38:52', '2018-09-08', '18:30:00', 0, NULL, 'asdsad', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(41, NULL, NULL, NULL, 'nose', '2018-09-07 00:41:25', '2018-09-08', '08:00:00', 0, NULL, 'nueva', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(42, NULL, NULL, NULL, 'nose', '2018-09-07 00:42:09', '2018-09-08', '08:00:00', 0, NULL, 'anda?', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(43, NULL, NULL, NULL, 'nueva', '2018-09-07 00:42:27', '2018-09-08', '08:00:00', 0, NULL, 'anda?', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(44, NULL, NULL, NULL, 'nose', '2018-09-07 00:43:06', '2018-09-08', '08:00:00', 0, NULL, 'test', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(45, NULL, NULL, NULL, 'nose', '2018-09-07 00:44:57', '2018-09-08', '08:00:00', 0, NULL, 'test', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(46, NULL, NULL, NULL, 'nueva', '2018-09-07 00:46:02', '2018-09-08', '08:00:00', 0, NULL, 'test', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(47, NULL, NULL, NULL, 'nose', '2018-09-07 00:46:27', '2018-09-08', '08:00:00', 0, NULL, 'jjj', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(48, NULL, NULL, NULL, 'kkk', '2018-09-07 00:46:40', '2018-09-08', '08:00:00', 0, NULL, 'jjjj', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(49, NULL, NULL, NULL, 'yo', '2018-09-24 09:42:30', '0000-00-00', '08:00:00', -1, NULL, 'nose', NULL, 'S', 16, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7, NULL),
(50, NULL, NULL, NULL, 'yo', '2018-09-24 10:19:02', '0000-00-00', '08:00:00', 13, NULL, 'Fuga de aceite hidraulico por pto', NULL, 'AN', 16, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7, NULL),
(51, NULL, NULL, NULL, 'Nuevo solicitante', '2018-09-25 10:23:40', '0000-00-00', '19:00:00', 1, NULL, 'equipo averiado ', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(52, NULL, NULL, NULL, 'nuevo', '2018-09-25 10:24:58', '2018-11-08', '10:00:00', 5, NULL, 'Nota Nueva', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(53, NULL, NULL, NULL, 'Hugo', '2018-09-25 10:27:46', '0000-00-00', '10:00:00', 5, NULL, 'falla grave', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(54, NULL, NULL, NULL, 'nn', '2018-09-26 00:13:28', '0000-00-00', '12:30:00', 5, NULL, 'nueva borrar', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(55, NULL, NULL, NULL, 'yo', '2018-09-26 18:26:01', '0000-00-00', '08:00:00', 13, NULL, 'vidrio', NULL, 'AN', 16, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7, NULL),
(56, NULL, NULL, NULL, 'yo', '2018-10-04 16:55:24', '2018-10-05', '10:15:00', 5, NULL, 'nota', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(57, NULL, NULL, NULL, 'eli', '2018-10-04 21:51:39', '2018-10-25', '09:00:00', 5, NULL, 'eli', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(58, NULL, NULL, NULL, 'nose', '2018-10-05 09:34:38', '2018-10-25', '09:00:00', 5, NULL, 'sera o no seraaaaa', NULL, 'T', 1, '2018-10-05', 'dgsgg', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(59, NULL, NULL, NULL, 'nuevo pabloncho', '2018-10-05 09:50:25', '2018-10-25', '13:00:00', 5, NULL, 'pabloncho', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(60, NULL, NULL, NULL, 'pabli', '2018-10-05 09:51:06', '2018-10-12', '12:00:00', 9, NULL, 'jaajaja', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(61, NULL, NULL, NULL, 'mauriiiiiiii peeeeee', '2018-10-05 09:55:42', '2018-10-24', '12:30:00', 5, NULL, 'borrarrrr', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(62, NULL, NULL, NULL, 'nose', '2018-10-05 09:57:01', '2018-10-06', '08:00:00', 5, NULL, 'eliminarrrrrrr', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(63, NULL, NULL, NULL, 'nose', '2018-10-05 09:58:24', '2018-10-06', '08:00:00', 9, NULL, 'jajajajajaja', NULL, 'T', 1, '2018-10-05', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(64, NULL, NULL, NULL, 'nose', '2018-10-05 10:02:33', '2018-10-06', '08:00:00', 5, NULL, 'no anda', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(65, NULL, NULL, NULL, 'hugo gallarete', '2018-10-05 10:04:25', '2018-10-06', '13:00:00', 9, NULL, 'falla 1', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(66, NULL, NULL, NULL, 'huguis', '2018-10-05 10:04:53', '2018-10-24', '08:00:00', 9, NULL, 'falla 2', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(67, NULL, NULL, NULL, 'aabbcc', '2018-10-05 10:08:52', '2018-10-19', '11:00:00', 5, NULL, 'falla 3', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(68, NULL, NULL, NULL, 'dfghdfgh', '2018-10-05 10:17:13', '2018-10-06', '08:00:00', 9, NULL, 'dfghfhfgh', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(69, NULL, NULL, NULL, 'asas', '2018-10-05 10:24:05', '2018-10-06', '08:00:00', 9, NULL, 'asasas', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(70, NULL, NULL, NULL, 'nueva 123', '2018-10-05 10:25:12', '2018-10-06', '08:00:00', 5, NULL, 'nueva y ultima', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(71, NULL, NULL, NULL, 'nose', '2018-10-05 10:25:29', '2018-10-06', '08:00:00', 9, NULL, 'eli', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(72, NULL, NULL, NULL, 'nn', '2018-10-05 11:23:25', '2018-10-06', '08:00:00', 5, NULL, 'falllaaaaaaa', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(73, NULL, NULL, NULL, 'Marcelo Muriel ', '2018-10-08 08:47:51', '2018-10-15', '12:00:00', 16, NULL, 'Engrase de cardan ', NULL, 'S', 18, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7, NULL),
(74, NULL, NULL, NULL, 'Perez', '2018-10-08 11:57:58', '2018-10-24', '12:00:00', 9, NULL, 'falla fatal', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6, NULL),
(75, NULL, NULL, NULL, '1', '2018-10-08 12:05:47', '2018-10-08', '12:04:00', 13, NULL, 'ggg', '12:04', 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/reclamos/75.jpg', 6, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id_sucursal` int(11) NOT NULL,
  `dire` varchar(3000) NOT NULL,
  `telefono` varchar(3000) NOT NULL,
  `zonas` varchar(3000) NOT NULL,
  `id_localidad` int(11) NOT NULL,
  `descripc` varchar(3000) NOT NULL,
  `estado` varchar(5) NOT NULL,
  `id_empresa` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id_sucursal`, `dire`, `telefono`, `zonas`, `id_localidad`, `descripc`, `estado`, `id_empresa`) VALUES
(1, 'mmmm', '4253133', 'desamparados', 1, 'Casa central', 'AC', 6),
(2, 'algun lugar', '235040', 'capital', 2, 'sucursal de capital', 'AC', 6),
(3, 'direccion', '4235040', 'capital', 1, 'las leñas', 'AN', 6),
(4, '1', '1', '1', 1, 'MRS SERVICE', 'AC', 7),
(5, 'direccion test', '12345678', 'zona test', 0, 'descripcion test', 'AC', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id_tarea` int(11) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `estado` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `form_asoc` int(11) DEFAULT NULL,
  `visible` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id_tarea`, `descripcion`, `estado`, `id_empresa`, `form_asoc`, `visible`) VALUES
(1, 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 'AC', 6, NULL, 1),
(2, 'Limpie las Mangueras y las Conexiones del Radiador.', 'AC', 6, NULL, 1),
(3, 'Cambie Liquido de Refrigerante de Motor (Revise la Mezcla Anticongelante antes de la Epoca Invernal).', 'AC', 6, NULL, 1),
(4, 'Revise la Bomba de Agua', 'AC', 6, NULL, 1),
(5, 'Compruebe el Intercooler y las Mangueras de Conexion.', 'AC', 6, NULL, 1),
(6, 'Drene la Valvula de Purga de Agua del Deposito de Combustible', 'AC', 6, NULL, 1),
(7, 'Cambie el Filtro de Combustible del Motor', 'AC', 6, NULL, 1),
(8, 'Cambie el Respiradero del Deposito de Combustible.', 'AC', 6, NULL, 1),
(9, 'Limpie el Cuerpo del Radiador.', 'AC', 6, NULL, 1),
(10, 'Lubricar Todos los Puntos de Engrase de la Corredera ', 'AC', 6, NULL, 1),
(11, 'Compruebe la Holgura del Carro del Martillo Perforador y el Carril de la Corredera.', 'AC', 6, NULL, 1),
(12, 'Compruebe el Estado de las Mordazas del Centralizador del Retenedor.', 'AC', 6, NULL, 1),
(13, 'Compruebe el Aceite del Engranaje de la Corredera.', 'AC', 6, NULL, 1),
(14, 'Cambie el Aceite del Engranaje de la Corredera.', 'AC', 6, NULL, 1),
(15, 'Cambie los Filtros del Motor', 'AC', 6, NULL, 1),
(16, 'Lubrique los 13 Puntos de Engrase Segun Diagrama.', 'AC', 6, NULL, 1),
(17, 'Compruebe las Soldaduras del Brazo y de la Cuna.', 'AC', 6, NULL, 1),
(18, 'Compruebe los Soportes de los Cilindros ', 'AC', 6, NULL, 1),
(19, 'Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.', 'AC', 6, NULL, 1),
(20, 'Revisar Apriete de las Varillas Tirantes. ', 'AC', 6, NULL, 1),
(21, 'Revisar Presion y Estado de Valvulas y Tapones de Llenado de Acumulacion.', 'AC', 6, NULL, 1),
(22, 'Revisar Apriete de los Tornillos del Acumulador, Motor de Rotación y Tapa Trasera.', 'AC', 6, NULL, 1),
(23, 'Engrase los Ejes de Oscilación y Pasadores del Cilindro de Oscilación.', 'AC', 6, NULL, 1),
(24, 'Compruebe el Estado y la Sujeccion del Cable del Cabrestante.', 'AC', 6, NULL, 1),
(25, 'Compruebe que no Existen Roturas en las Costuras de Soldadura.', 'AC', 6, NULL, 1),
(26, 'Compruebe el Electrolito y las Conexiones de las Baterias.', 'AC', 6, NULL, 1),
(27, 'Inspección: Revisar Desgaste de Correa de Distribución (de ser necesario cambiar). ', 'AC', 6, NULL, 1),
(28, 'Regular Luz de Válvula de Motor (cada 2000hs segun horometro).', 'AC', 6, NULL, 1),
(29, 'Probar la Capacidad de Retención del Freno de Servicio y del Freno de Estacionamiento (procedimiento CAT SMCS - 4251-081; 4267-081).', 'AC', 6, NULL, 1),
(30, 'Inspección: Revisar Anclaje , Desgaste y Fecha de Instalacion del Cinturón de Seguridad (de ser necesario cambie el cinturón de seguridad con mas de tres años o por excesivo desgaste). ', 'AC', 6, NULL, 1),
(31, 'Inspeccion: Revisar Nivel del Liquido Limpiaparabrisas (de ser necesario rellenar).', 'AC', 6, NULL, 1),
(32, 'Lubricar Articulación de Cucharón y Cojinete del Cilindro Cargador (utilizar grasa EP68). ', 'AC', 6, NULL, 1),
(33, 'Inspeccion: Revisar Desgaste en Cuchillas, Cantoneras y Planchas de Desgaste Inferiores (controlar par de apriete en bulones, de ser necesario cambiar).', 'AC', 6, NULL, 1),
(34, 'Lubricar Cojinete del Pivote Inferior y Superior del Cucharon (limpie todas las conexiones de engrase antes de lubricar, utilizar grasa EP68 ).', 'AC', 6, NULL, 1),
(35, 'Inspección: Revisar Desgaste en Puntas del Cucharon (de ser necesario, programar cambiarlo).', 'AC', 6, NULL, 1),
(36, 'Cambiar Aceite de Transmisión (cada 1000hs según horometro, utilizar el aceite SAE10W). ', 'AC', 6, NULL, 1),
(37, 'Inspección: Nivel de Aceite de Transmisión. ', 'AC', 6, NULL, 1),
(38, 'Cambiar Aceite Hidráulico (cada 500hs segun horometro, utilizar aceite hidráulico 68).. ', 'AC', 6, NULL, 1),
(39, 'Inspección: Nivel de Aceite Hidráulico.', 'AC', 6, NULL, 1),
(40, 'Lubricar Estrias de la Columna de Dirección (tener en cuenta 8 puntos de engrase).', 'AC', 6, NULL, 1),
(41, 'Lubricar Rodamiento de la Columna de Dirección (utilizar la grasa EP68).', 'AC', 6, NULL, 1),
(42, 'Inspección: Revisar Corrosion en Terminales y Desgaste o Daño en los Cables (de ser necesario, limpiar bornes de bateria y/o cambiar cables).', 'AC', 6, NULL, 1),
(43, 'Lubricar Cojinetes Superior e Inferior de Articulación (limpie todas las conexiones de engrase antes de lubricar, utilizar grasa EP68).', 'AC', 6, NULL, 1),
(44, 'Limpiar Equipo (utilice aire comprimido).', 'AC', 6, NULL, 1),
(45, 'Cambiar Filtro de Aceite de Motor (1R-1808 ITEM 57874).', 'AC', 6, NULL, 1),
(46, 'Cambiar Aceite de Motor (cada 250 hs según horometro, utilizar aceite 15W40).', 'AC', 6, NULL, 1),
(47, 'Limpiar Tanque de Combustible.', 'AC', 6, NULL, 1),
(48, 'Inspección: Revisar Desgaste de Correa de Distribución (de ser necesario cambiar).', 'AC', 6, NULL, 1),
(49, 'Cambiar Filtro de Aire Primario 245-3818 Item 57871 (cada 250 hs según horometro).', 'AC', 6, NULL, 1),
(50, 'Cambiar Filtro De Aire Secundario  245-3819 Item 57872 (cada 250 hs según horometro).', 'AC', 6, NULL, 1),
(51, 'Cambiar Filtro Separador De Agua Del Sistema De Combustible (cada 250 hs según horometro).', 'AC', 6, NULL, 1),
(52, 'Inspección: Revisar Holgura De La Válvula (cada 1000 hs según horómetro. la holgura debe ser de 0,508 mm).', 'AC', 6, NULL, 1),
(53, 'Limpiar Respiradero Del Carter (utilice disolvente liquido no inflamable).', 'AC', 6, NULL, 1),
(54, 'Limpiar Válvula de Alivio de Tanque Hidráulico (utilice disolvente liquido no inflamable).', 'AC', 6, NULL, 1),
(55, 'Limpiar Rejilla de Aceite de Dirección Piloto (utilice disolvente liquido no inflamable).', 'AC', 6, NULL, 1),
(56, 'Lubricar Cojinetes (Vástago y Cabezal) del Cilindro de Dirección (limpie todas las conexiones de engrase antes de lubricar. utilizar grasa EP68).', 'AC', 6, NULL, 1),
(57, 'Inspección: Revisar Holgura De La Válvula (cada 1000 hs según horómetro. la holgura debe ser de 0,254 mm).', 'AC', 6, NULL, 1),
(58, 'Inspección Visual: Nivel de Aceite de Transmisión (cuando se requiera).', 'AC', 6, NULL, 1),
(59, 'Cambiar Filtro de Aceite de Transmisión (cada 500 hs según horometro).', 'AC', 6, NULL, 1),
(60, 'Limpieza Respiradero (remover barro y suciedad. lavar con líquido limpiador. cada 1000 hs según horometro).', 'AC', 6, NULL, 1),
(61, 'Inspección Visual: Nivel de Aceite del Eje de Mando Delantero.', 'AC', 6, NULL, 1),
(62, 'Lubricar Eje de Mando Delantero (cada 2000 hs según horómetro. utilizar aceite. ver tabla de aceites. capacidad 16 litros).', 'AC', 6, NULL, 1),
(63, 'Inspección Visual: Nivel de Aceite del Eje de Mando Trasero (Tomar lectura de nivel con varilla de medición).', 'AC', 6, NULL, 1),
(64, 'Lubricar Eje de Mando Trasero (cada 2000 hs según horómetro. utilizar aceite. ver tabla de aceites capacidad 16 litros).', 'AC', 6, NULL, 1),
(65, 'Cambiar Aceite de Diferencial Delantero y Trasero (cada 1000 hs según horometro útilizar aceite sae50).', 'AC', 6, NULL, 1),
(66, 'Limpiar Filtro Acondicionador de Aire (utilizar aire comprimido seco, en caso de daños, cambiar. realizar cada 100 hs según horómetro).', 'AC', 6, NULL, 1),
(67, 'Cambiar Filtro Acondicionador de Aire (realizar cada 2000 hs según horómetro).', 'AC', 6, NULL, 1),
(68, 'Inspección: Nivel de Aceite Hidráulico (controlar el nivel por medio del medidor visual. revisar cada 100 hs según horómetro).', 'AC', 6, NULL, 1),
(69, 'Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).', 'AC', 6, NULL, 1),
(70, 'Revisar Presión de Inflado (revisar cada 50 hs según horómetro. la presión de inflado debe ser entre 2,5kg/cm2  a 3,5 kg/cm2).', 'AC', 6, NULL, 1),
(71, 'Inspección Visual: Revisar Estado General de los Neumáticos (controlar que no tengan ningún tipo de daños. revisar cada 50 hs según horómetro).', 'AC', 6, NULL, 1),
(72, 'Revisar el Apriete de los Tornllos de los Cubos de las Ruedas (revisar cada 250 hs. según horómetro. la tensión de apriete  es de 94,5 +/- 10,5 kgm).', 'AC', 6, NULL, 1),
(73, 'Cambiar Aceite de Mandos Finales (cada 1000 hs según horometro utilizar aceite SAE 50).', 'AC', 6, NULL, 1),
(74, 'Limpiar el Equipo (utilice aire comprimido).', 'AC', 6, NULL, 1),
(75, 'Inspección: Comprobar Funcionamiento de Alarma de Retroceso (con el equipo en contacto, active el freno de servicio y coloque marcha en retroceso).', 'AC', 6, NULL, 1),
(76, 'Inspección: Revisar Presencia de Fisuras y Bulones Flojos o Dañados.', 'AC', 6, NULL, 1),
(77, 'Inspección: Comprobar Funcionamiento de las Luces.', 'AC', 6, NULL, 1),
(78, 'Cambiar Aceite de Motor (utilizar aceite 15W40).', 'AC', 6, NULL, 1),
(80, 'Inspección Visual: Controlar Pérdida y Nivel de Aceite Motor (de ser necesario nivelar con aceite 15W40).', 'AC', 6, NULL, 1),
(81, 'Inspección Visual: Controlar Soportes del Motor.', 'AC', 6, NULL, 1),
(82, 'Inspección Visual: Controlar la Tensión de la Cadena.', 'AC', 6, NULL, 1),
(83, 'Presión Según Fabricante.', 'AC', 6, NULL, 1),
(84, 'Inspección Visual de los Neumáticos (control del dibujo de los neumáticos).', 'AC', 6, NULL, 1),
(85, 'Cambiar Filtro de Aceite de Motor ITEM. 51488.', 'AC', 6, NULL, 1),
(86, 'Inspección Visual: Controlar la Tensión de la Correa (utilice medidor de tensión de correa).', 'AC', 6, NULL, 1),
(87, 'Cambiar Filtro de  Aire (primario ITEM 51518).', 'AC', 6, NULL, 1),
(88, 'Cambiar Filtro Separador de Agua del Sistema de Combustible.', 'AC', 6, NULL, 1),
(89, 'Inspección Visual: Controlar Soportes del Motor.', 'AC', 6, NULL, 1),
(90, 'Probar la Capacidad de Retención del Freno de Servicio y del Freno de Estacionamiento.', 'AC', 6, NULL, 1),
(91, 'Inspección Visual: Controlar Pérdida y Nivel de Agua del Radiador.', 'AC', 6, NULL, 1),
(92, 'Cambiar Cartucho Filtro de Aire.', 'AC', 6, NULL, 1),
(93, 'Inspección: Revisar Corrosión en Terminales y Desgaste o Daño en los Cables (de ser necesario, limpiar bornes de bateria y/o cambiar cables).', 'AC', 6, NULL, 1),
(94, 'Inspección: Comprobar Funcionamiento de la Bocina.', 'AC', 6, NULL, 1),
(95, 'Lubricar Movimiento (utilizar grasa EP 62).', 'AC', 6, NULL, 1),
(96, 'Inspeccion Visual: Controlar el Nivel de Aceite del Convertidor.', 'AC', 6, NULL, 1),
(97, 'Inspección Visual: Controlar Manguera.', 'AC', 6, NULL, 1),
(98, 'Limpie el Filtro de Admisión de Aire (se puede limpiar como máximo 6 veces, luego cambiar).', 'AC', 6, NULL, 1),
(99, 'Cambie el Filtro de Admisión de Aire (ITEM. 51549).', 'AC', 6, NULL, 1),
(100, 'Cambie el Cartucho de Filtro de Aire.', 'AC', 6, NULL, 1),
(101, 'Compruebe Juego y Desgaste en Patas de Motor.', 'AC', 6, NULL, 1),
(102, 'Compruebe el Amortiguador de Vibraciones del Cigüeñal.', 'AC', 6, NULL, 1),
(103, 'Revise las Tuberias y Conexiones de la Admisión de Aire.', 'AC', 6, NULL, 1),
(104, 'Cambie el Aceite de Motor (aceite 15W40).', 'AC', 6, NULL, 1),
(105, 'Cambie los Filtros de Aceite (ITEM. 58108).', 'AC', 6, NULL, 1),
(106, 'Sustituya el Elemento del Respiradero del Carter de Motor.', 'AC', 6, NULL, 1),
(107, 'Compruebe las Boquillas del Inyector.', 'AC', 6, NULL, 1),
(108, 'Revise el Sensor de Temperatura.', 'AC', 6, NULL, 1),
(109, 'Compruebe la Holgura de la Cuna.', 'AC', 6, NULL, 1),
(111, 'TEST', 'AN', 6, NULL, 1),
(112, 'Orden y Limpieza', 'AC', 7, NULL, 1),
(113, 'Cambio de Vidrios ', 'AC', 7, NULL, 1),
(114, 'Cambio Asiento  ', 'AN', 7, NULL, 1),
(115, 'Reemplazo de butaca', 'AC', 7, NULL, 1),
(116, 'Regulación de cerradura ', 'AC', 7, NULL, 1),
(117, 'Cambio de Cerradura ', 'AC', 7, NULL, 1),
(118, 'Cambio de Manómetros ', 'AC', 7, NULL, 1),
(119, 'Reemplazo de motores de Rotación de Cabezal ', 'AC', 7, NULL, 1),
(120, 'Reemplazo de cabezal', 'AC', 7, NULL, 1),
(121, 'Regulación Eléctrica de Joysticks ', 'AC', 7, NULL, 1),
(122, 'Regulación Mecánica de Joysticks', 'AC', 7, NULL, 1),
(123, 'Cambio de TIM', 'AC', 7, NULL, 1),
(124, 'Calibración de TIM ', 'AC', 7, NULL, 1),
(125, 'Reparación de Calefacción ', 'AC', 7, NULL, 1),
(126, 'Limpieza  de Filtro Interior de Cabina ', 'AC', 7, NULL, 1),
(127, 'Cambio de Filtro Exterior de Cabina ', 'AC', 7, NULL, 1),
(128, 'Cambio de Filtro Interior de Cabina', 'AC', 7, NULL, 1),
(129, 'Resellado de Cabina ', 'AC', 7, NULL, 1),
(130, 'Cambio de Burletes de Puerta ', 'AC', 7, NULL, 1),
(131, 'Cambio de Puerta de Acceso ', 'AC', 7, NULL, 1),
(132, 'Cambio de Lampara  Luz de cabina ', 'AC', 7, NULL, 1),
(133, 'Cambio de Interruptores en Cabina ', 'AC', 7, NULL, 1),
(134, 'Cambio de Joysticks ', 'AC', 7, NULL, 1),
(135, 'Carga de Gas de A/C ', 'AC', 7, NULL, 1),
(136, 'Chequeo de Sistema de A/C', 'AC', 7, NULL, 1),
(137, 'Cambio de Compresor de A/C ', 'AC', 7, NULL, 1),
(138, 'Cambio de Equipo A/C de Cabina ', 'AC', 7, NULL, 1),
(139, 'Cambio de Escobillas Limpiaparabrisas ', 'AC', 7, NULL, 1),
(140, 'Cambio de Escalera de Acceso ', 'AC', 7, NULL, 1),
(141, 'Reparación de Escalera de Acceso ', 'AC', 7, NULL, 1),
(142, 'Cambio de llave U ', 'AC', 7, NULL, 1),
(143, 'Cambio de Cilindro de Llave U ', 'AC', 7, NULL, 1),
(144, 'Cambio de Goma de Cierre  ', 'AC', 7, NULL, 1),
(145, 'Cambio de Guías de  Teflon Cabezal ', 'AC', 7, NULL, 1),
(146, 'Regulación de Motores de Rotación ', 'AC', 7, NULL, 1),
(147, 'Cambio de Sellos Agua-Aire en Cabezal ', 'AC', 7, NULL, 1),
(148, 'Cambio de Retenes de Cabezal ', 'AC', 7, NULL, 1),
(149, 'Cambio de Sensor de RPM  de Cabezal ', 'AC', 7, NULL, 1),
(150, 'Alineación de Cabezal ', 'AC', 7, NULL, 1),
(151, 'Regulación de Sostenimiento de Cabezal ', 'AC', 7, NULL, 1),
(152, 'Cambio de Luces de Trabajo ', 'AC', 7, NULL, 1),
(153, 'Chequeo de Sistema Eléctrico ', 'AC', 7, NULL, 1),
(154, 'Cambio de Bomba Principal ', 'AC', 7, NULL, 1),
(155, 'Cambio de Bombas Auxiliares ', 'AC', 7, NULL, 1),
(156, 'Cambio de Retenes de Bomba ', 'AC', 7, NULL, 1),
(157, 'Regulación De Bombas ', 'AC', 7, NULL, 1),
(158, 'Cambio de Actuadores de Bomba ', 'AC', 7, NULL, 1),
(159, 'Cambio de Banco de 6 Carretes ', 'AC', 7, NULL, 1),
(160, 'Cambio de Banco de 9 Carretes ', 'AC', 7, NULL, 1),
(161, 'Cambio de Válvulas Pulsar ', 'AC', 7, NULL, 1),
(162, 'Resellado de Banco Principales ', 'AC', 7, NULL, 1),
(163, 'Cambio de Válvulas Diversoras ', 'AC', 7, NULL, 1),
(164, 'Reparación de Válvulas Diversoras ', 'AC', 7, NULL, 1),
(165, 'Reparación de Válvulas de Aceite Caliente ', 'AC', 7, NULL, 1),
(166, 'Reparación de Válvula DR/PR ', 'AC', 7, NULL, 1),
(167, 'Cambio de Válvula Fema ', 'AC', 7, NULL, 1),
(168, 'Cambio de Motor de Traslación ', 'AC', 7, NULL, 1),
(169, 'Cambio de Motor Hidráulico ', 'AC', 7, NULL, 1),
(170, 'Regulación  RPM de ventilador  de Enfriamiento ', 'AC', 7, NULL, 1),
(171, 'Reparación de Fugas Hidráulicas ', 'AC', 7, NULL, 1),
(172, 'Reparación de Válvulas Contrabalance ', 'AC', 7, NULL, 1),
(173, ' Reparación de Válvulas de Sostenimiento', 'AC', 7, NULL, 1),
(174, 'Cambio de Válvulas de Sostenimiento ', 'AC', 7, NULL, 1),
(175, 'Cambio de Cilindro Hidráulico ', 'AC', 7, NULL, 1),
(176, 'Chequeo  de Sistema Hidráulico ', 'AC', 7, NULL, 1),
(177, 'Cambio de Radiador ', 'AC', 7, NULL, 1),
(178, 'Limpieza de Radiador ', 'AC', 7, NULL, 1),
(179, 'Cambio de Termostato ', 'AC', 7, NULL, 1),
(180, 'Cambio de bomba de Agua ', 'AC', 7, NULL, 1),
(181, 'Reparación de Boba de Agua  ', 'AC', 7, NULL, 1),
(182, 'Purgado de Sistema de Iyeccion de Agua ', 'AC', 7, NULL, 1),
(183, 'Reparación de Válvula Check ', 'AC', 7, NULL, 1),
(184, 'Cambio de Válvula Check ', 'AC', 7, NULL, 1),
(185, 'Limpieza de Filtros De Aire ', 'AC', 7, NULL, 1),
(186, 'Cambio de Filtro de Aceite de Motor ', 'AC', 7, NULL, 1),
(187, 'Cambio de Filtro de Aceite Hidráulico ', 'AC', 7, NULL, 1),
(188, 'Cambio de Filtro de Aceite de Compresor ', 'AC', 7, NULL, 1),
(189, 'Cambio de Filtro de Aire ', 'AC', 7, NULL, 1),
(190, 'Cambio de Filtros Colector de Polvo', 'AC', 7, NULL, 1),
(191, 'Limpieza de Filtros Colector de Polvo ', 'AC', 7, NULL, 1),
(192, 'Cambio de Sensores ', 'AC', 7, NULL, 1),
(193, 'Cambio de Arnés ', 'AC', 7, NULL, 1),
(194, 'Calibración de Sensores ', 'AC', 7, NULL, 1),
(195, 'Chequeo Sistema Neumático ', 'AC', 7, NULL, 1),
(196, 'Cambio de Módulos Eléctricos  ', 'AC', 7, NULL, 1),
(197, 'Cambio de Fusibles ', 'AC', 7, NULL, 1),
(198, 'Cambio de Baterías ', 'AC', 7, NULL, 1),
(199, 'Cambio de Presoswitchs ', 'AC', 7, NULL, 1),
(200, 'Cambio de Solenoides ', 'AC', 7, NULL, 1),
(201, 'Limpieza de Sensores', 'AC', 7, NULL, 1),
(202, 'Tensado de Cadenas de Tren Rodante ', 'AC', 7, NULL, 1),
(203, 'Cambio de Rolos Superiores Tren Rodante ', 'AC', 7, NULL, 1),
(204, 'Cambio de Rolos Inferiores Tren Rodante', 'AC', 7, NULL, 1),
(205, 'Cambio de Rueda GuíaTren Rodante  ', 'AC', 7, NULL, 1),
(206, 'Cambio de Mando Final ', 'AC', 7, NULL, 1),
(207, 'Tenzado de Cables de Avance ', 'AC', 7, NULL, 1),
(208, 'Tensado de Cables de Holdback ', 'AC', 7, NULL, 1),
(209, 'Cambio de Poleas Cables de Avance ', 'AC', 7, NULL, 1),
(210, 'Cambio de Sprocket de Holdback ', 'AC', 7, NULL, 1),
(211, 'Cambio de Mangueras Hidráulicas ', 'AC', 7, NULL, 1),
(212, 'Cambio de Mangueras Neumáticas ', 'AC', 7, NULL, 1),
(213, 'Cambio de Vidrios ', 'AN', 7, NULL, 1),
(214, 'Cambio de Guías Metálicas  de Viga ', 'AC', 7, NULL, 1),
(215, 'Cambio de Zapatas de Oruga ', 'AC', 7, NULL, 1),
(216, 'Retorqueo de Zapatas de Orugas ', 'AC', 7, NULL, 1),
(217, 'Recarga de Fluidos ', 'AC', 7, NULL, 1),
(218, 'Cambio de Baterías ', 'AC', 7, NULL, 1),
(219, 'Engrase de Equipo ', 'AC', 7, NULL, 1),
(220, 'Toma de Muestras ', 'AC', 7, NULL, 1),
(221, 'Ejecución de BKL ', 'AC', 7, NULL, 1),
(222, 'Inspección Perforadora 901 ', 'AC', 7, NULL, 1),
(223, 'Inspección Perforadora 903 ', 'AC', 7, NULL, 1),
(224, 'Inspección Perforadora 905 ', 'AC', 7, NULL, 1),
(225, 'Inspección Perforadora 906 ', 'AC', 7, NULL, 1),
(226, 'Regulación de Cmpresor ', 'AC', 7, NULL, 1),
(227, 'Reparación de Válvula UL-88 ', 'AC', 7, NULL, 1),
(228, 'Regulación de Intercambiador de Barras ', 'AC', 7, NULL, 1),
(229, 'Limpieza de Difusor de Grasa de Barras', 'AC', 7, NULL, 1),
(230, 'Limpieza de Mangon de Succión primario ', 'AC', 7, NULL, 1),
(231, 'Revision total de motor', 'AC', 6, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_back`
--

CREATE TABLE `tbl_back` (
  `backId` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `tarea_descrip` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `horash` int(11) DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `back_duracion` int(11) NOT NULL,
  `back_canth` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `idcomponenteequipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_back`
--

INSERT INTO `tbl_back` (`backId`, `id_equipo`, `tarea_descrip`, `fecha`, `horash`, `estado`, `back_duracion`, `back_canth`, `id_empresa`, `idcomponenteequipo`) VALUES
(16, 10, '4', '2018-04-27', NULL, 'AN', 60, 0, 6, NULL),
(17, 8, '10', '2018-04-29', NULL, 'AN', 120, 0, 6, NULL),
(18, 5, '10', '2018-05-02', NULL, 'AN', 20, 0, 6, NULL),
(19, 6, '6', '2018-05-04', NULL, 'AN', 15, 0, 6, NULL),
(20, 7, '8', '2018-05-02', NULL, 'AN', 50, 0, 6, NULL),
(21, 4, '4', '2018-05-11', NULL, 'AN', 20, 0, 6, NULL),
(22, 10, '5', '2018-05-01', NULL, 'AN', 30, 0, 6, NULL),
(23, 4, '5', '2018-05-31', NULL, 'AN', 80, 0, 6, NULL),
(24, 4, '5', '2018-10-31', NULL, 'C', 650, 0, 6, NULL),
(25, 11, '9', '2018-06-28', NULL, 'C', 60, 0, 6, NULL),
(26, 1, '3', '2018-08-30', NULL, 'C', 10, 0, 6, NULL),
(27, 13, '124', '0000-00-00', NULL, 'C', 250, 0, 7, NULL),
(28, 1, '1', '0000-00-00', NULL, 'C', 1233, 0, 6, NULL),
(29, 9, '111', '2018-10-25', NULL, 'C', 200, 0, 6, NULL),
(30, 13, '125', '2018-10-09', NULL, 'AN', 2, 0, 7, NULL),
(31, 1, '10', '2018-10-18', NULL, 'C', 45, 0, 6, NULL),
(32, 1, '13', '2018-10-18', NULL, 'C', 45, 0, 6, 5),
(33, 1, '26', '2018-10-21', NULL, 'C', 60, 0, 6, 343);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detanotapedido`
--

CREATE TABLE `tbl_detanotapedido` (
  `id_detaNota` int(11) NOT NULL,
  `id_notaPedido` int(11) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `provid` int(11) DEFAULT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `fechaEntregado` date DEFAULT NULL,
  `remito` int(11) DEFAULT NULL,
  `estado` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_detanotapedido`
--

INSERT INTO `tbl_detanotapedido` (`id_detaNota`, `id_notaPedido`, `artId`, `cantidad`, `provid`, `fechaEntrega`, `fechaEntregado`, `remito`, `estado`) VALUES
(65, 61, 2, 13, 2, '2018-06-27', '2018-06-27', 1, 'P'),
(69, 64, 2, 12, 1, '2018-07-22', '2018-07-22', 1234, 'E'),
(70, 65, 11, 2, 1, '2018-10-16', '2018-10-16', 1, 'P'),
(71, 65, 11, 6, 2, '2018-10-15', '2018-10-15', 1, 'P'),
(72, 66, 22, 2, 2, '2018-10-26', '2018-10-26', 1, 'P'),
(73, 66, 71, 1, 3, '2018-10-15', '2018-10-15', 1, 'P'),
(74, 67, 16, 1, 1, '2018-10-15', '2018-10-15', 1, 'P'),
(75, 68, 12, 6, 2, '2018-10-13', '2018-10-13', 1, 'P'),
(76, 69, 185, 12, 2, '2018-10-29', '2018-10-29', 1, 'P'),
(77, 70, 10, 10, 3, '2018-10-29', '2018-10-29', 1, 'P'),
(78, 70, 10, 25, 2, '2018-10-30', '2018-10-30', 1, 'P'),
(79, 71, 12, 1, 5, '2018-11-02', '2018-11-02', 1, 'P'),
(80, 72, 2, NULL, NULL, '1969-12-31', '1969-12-31', 1, 'P'),
(81, 72, 10, NULL, NULL, '1969-12-31', '1969-12-31', 1, 'P'),
(82, 73, 2, 20, NULL, '1969-12-31', '1969-12-31', 1, 'P'),
(83, 73, 10, 10, NULL, '1969-12-31', '1969-12-31', 1, 'P'),
(84, 74, 2, 10, NULL, NULL, NULL, NULL, 'P'),
(85, 74, 10, 20, NULL, NULL, NULL, NULL, 'P'),
(86, 75, 2, 47, NULL, '2019-01-15', NULL, NULL, 'P'),
(87, 76, 10, 0, NULL, '2019-01-15', NULL, NULL, 'P'),
(88, 77, 2, 12, NULL, '2019-01-16', NULL, NULL, 'P'),
(89, 78, 10, 400, NULL, '2019-01-16', NULL, NULL, 'P'),
(90, 79, 2, 12222, NULL, '2019-01-16', NULL, NULL, 'P'),
(91, 81, 2, 12, NULL, '2019-01-16', NULL, NULL, 'P');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detavaledescarga`
--

CREATE TABLE `tbl_detavaledescarga` (
  `detavaledid` int(11) NOT NULL,
  `valedid` int(11) DEFAULT NULL,
  `herrId` int(11) DEFAULT NULL,
  `observa` varchar(255) DEFAULT NULL,
  `dest` varchar(255) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_detavaledescarga`
--

INSERT INTO `tbl_detavaledescarga` (`detavaledid`, `valedid`, `herrId`, `observa`, `dest`, `id_empresa`) VALUES
(1, 1, 4, NULL, NULL, 6),
(2, 2, 103, NULL, NULL, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detavalesalida`
--

CREATE TABLE `tbl_detavalesalida` (
  `detavid` int(10) NOT NULL,
  `valesid` int(11) DEFAULT NULL,
  `herrId` int(10) DEFAULT NULL,
  `observa` text,
  `dest` varchar(255) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_detavalesalida`
--

INSERT INTO `tbl_detavalesalida` (`detavid`, `valesid`, `herrId`, `observa`, `dest`, `id_empresa`) VALUES
(1, 1, 8, NULL, NULL, 6),
(2, 1, 1, NULL, NULL, 6),
(3, 1, 2, NULL, NULL, 6),
(4, 5, 4, NULL, NULL, 6),
(5, 6, 0, NULL, NULL, 0),
(6, 6, 0, NULL, NULL, 0),
(7, 6, 0, NULL, NULL, 0),
(8, 6, 4, NULL, NULL, 0),
(15, 10, 103, NULL, NULL, 7),
(16, 11, 54, NULL, NULL, 0),
(17, 11, 23, NULL, NULL, 0),
(18, 11, 2, NULL, NULL, 0),
(19, 15, 2, NULL, NULL, 6),
(20, 15, 17, NULL, NULL, 6),
(21, 15, 15, NULL, NULL, 6),
(22, 16, 16, NULL, NULL, 6),
(23, 17, 91, NULL, NULL, 6),
(24, 17, 5, NULL, NULL, 6),
(25, 18, 9, NULL, NULL, 6),
(26, 18, 59, NULL, NULL, 6),
(27, 19, 6, NULL, NULL, 6),
(28, 19, 7, NULL, NULL, 6),
(29, 20, 4, NULL, NULL, 6),
(30, 21, 20, NULL, NULL, 6),
(31, 21, 83, NULL, NULL, 6),
(32, 22, 20, NULL, NULL, 6),
(33, 22, 83, NULL, NULL, 6),
(34, 23, 56, NULL, NULL, 6),
(35, 24, 20, NULL, NULL, 6),
(36, 25, 23, NULL, NULL, 6),
(37, 26, 27, NULL, NULL, 6),
(38, 26, 29, NULL, NULL, 6),
(39, 27, 5, NULL, NULL, 6),
(40, 27, 29, NULL, NULL, 6),
(41, 28, 0, NULL, NULL, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estado`
--

CREATE TABLE `tbl_estado` (
  `estadoid` int(11) NOT NULL,
  `descripcion` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_estado`
--

INSERT INTO `tbl_estado` (`estadoid`, `descripcion`, `estado`) VALUES
(1, 'ACTIVO', 'AC'),
(2, 'TRANSITO', 'TR'),
(3, 'REPARACION', 'RE'),
(4, 'COMODATO', 'CO'),
(5, 'CURSO', 'C'),
(6, 'INACTIVO', 'IN'),
(7, 'SOLICITADO', 'S'),
(8, 'TAREA REALIZADA', 'RE'),
(9, 'TERMINADO PARCIAL', 'TE'),
(10, 'TERMINADO', 'T'),
(11, 'ENTREGADO', 'E'),
(12, 'PEDIDO', 'P'),
(13, 'ASIGNADO', 'As'),
(14, 'ANULADO', 'AN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estanteria`
--

CREATE TABLE `tbl_estanteria` (
  `id_estanteria` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fila` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_estanteria`
--

INSERT INTO `tbl_estanteria` (`id_estanteria`, `descripcion`, `fila`, `codigo`, `id_empresa`) VALUES
(1, 'estanteria 1', '1', 'dd1', 6),
(2, 'estanteria 2', '1', 'dd2', 6),
(3, 'estanteria 3', '1', 'dd3', 6),
(4, 'estanteria 4', '1', 'dd4', 6),
(5, 'estanteria 5', '1', 'd5', 6),
(6, 'Estantería de prueba 01', '12', 'ESTANTERIA TEST 01', 6),
(7, '', '6', 'E1 ', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_listarea`
--

CREATE TABLE `tbl_listarea` (
  `id_listarea` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `tareadescrip` varchar(5000) COLLATE utf8_spanish_ci NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_listarea`
--

INSERT INTO `tbl_listarea` (`id_listarea`, `id_orden`, `tareadescrip`, `id_usuario`, `fecha`, `estado`) VALUES
(1, 1, 'tarea 12', NULL, NULL, 'IN'),
(2, 1, 'tarea1212', NULL, NULL, 'C'),
(3, 1, 'tarea130', NULL, NULL, 'IN'),
(4, 1, 'tareanueva1', NULL, NULL, 'C'),
(5, 1, 'tarea gemma1', NULL, NULL, '1'),
(6, 1, 'TAREA2', NULL, NULL, '6'),
(7, 1, 'TAREA 25', NULL, NULL, '6'),
(8, 1, 'nombre de tarea 1 ', NULL, NULL, '5'),
(9, 1, 'nuevatrea30', NULL, NULL, '5'),
(10, 1, 'tarea de gemma', NULL, NULL, '5'),
(11, 1, 'nueva tarea 34 ', NULL, NULL, '5'),
(12, 1, 'nueva tarea 50', 3, NULL, '5'),
(13, 0, 'nueva tares 45 45', NULL, NULL, '5'),
(14, 1, 'nueva tarea12', 1, NULL, '6'),
(15, 1, 'gemmma belen tarea', 3, NULL, '5'),
(16, 1, 'nueva tare ', NULL, NULL, '5'),
(17, 1, 'nueva tarea ', NULL, NULL, '5'),
(18, 1, 'TAREA 10 ', NULL, NULL, '5'),
(19, 1, 'hhu', NULL, NULL, '5'),
(20, 1, 'hyhy12', NULL, NULL, '5'),
(21, 1, 'dedede', NULL, NULL, '5'),
(22, 1, 'genemmma ', NULL, NULL, '6'),
(23, 1, 'gemma', NULL, NULL, '6'),
(24, 1, 'fefefef', NULL, NULL, '5'),
(25, 1, 'fefeenueva ', NULL, NULL, '6'),
(26, 1, 'gemama', NULL, NULL, '5'),
(27, 1, 'geegegegegeg', NULL, NULL, '5'),
(28, 1, 'nueva traea gemma', NULL, NULL, '6'),
(29, 1, 'gemma ingresi ntarea', NULL, NULL, '6'),
(30, 1, 'hola ', NULL, NULL, '6'),
(31, 1, 'vuev tarea maruicio', NULL, NULL, '5'),
(32, 1, 'tarea AHORA SI', 2, NULL, '5'),
(33, 1, 'TAREA SI12', 1, NULL, '5'),
(34, 1, 'TAREA 100', 2, NULL, '5'),
(35, 8, 'sASA', NULL, NULL, 'C'),
(36, 8, 'asSa', NULL, NULL, 'C'),
(37, 8, 'ASA', NULL, NULL, 'C'),
(38, 22, 'desarme', NULL, NULL, 'C'),
(39, 22, 'limpieza ', NULL, NULL, 'C'),
(40, 22, 'armado', 1, NULL, 'C'),
(41, 22, 'limpieza', 2, NULL, 'C'),
(42, 22, 'desarme', 3, NULL, 'C'),
(43, 16, 'DDFDS', NULL, NULL, 'C'),
(44, 16, 'SDFSF', 3, '2017-12-11', 'C'),
(45, 16, 'nueva tarea: Limpieza ', 1, '2017-12-11', 'RE'),
(46, 17, 'jadfñjdskjfd', NULL, NULL, 'C'),
(47, 16, 'saadsa', 6, '2017-12-13', 'C'),
(48, 16, 'sadadasd', NULL, NULL, 'C'),
(49, 16, 'sdadasdsa', 3, NULL, 'C'),
(50, 16, '1111', NULL, NULL, 'C'),
(51, 16, '2222', 3, NULL, 'C'),
(52, 16, 'dedede', 1, NULL, 'RE'),
(53, 16, 'gegeg', 1, NULL, 'RE'),
(54, 21, 'tarea 1', 1, NULL, 'C'),
(55, 21, 'tarea2', 3, NULL, 'C'),
(56, 21, 'tarea3', NULL, NULL, 'C'),
(57, 21, 'tarea4', NULL, NULL, 'C'),
(58, 21, 'tarea6', 1, NULL, 'RE'),
(59, 37, 'dsadadad', 1, '2017-12-20', 'C'),
(60, 34, 'fsdfsfsd', 1, '2017-12-29', 'C'),
(61, 34, 'qwewqeqw', 1, '2017-12-29', 'C'),
(62, 47, 'sdadsad', NULL, NULL, 'C'),
(63, 47, 'sadad', NULL, NULL, 'C'),
(64, 47, 'dasdd', NULL, NULL, 'RE'),
(65, 47, 'dthdhgd', NULL, NULL, 'RE'),
(66, 73, 'dffgrrb', NULL, NULL, 'C'),
(67, 73, 'geegtgt', 5, NULL, 'C'),
(68, 73, 'evefvev', 1, NULL, 'C'),
(69, 532, 'ssss', NULL, NULL, 'RE'),
(70, 532, 'subtarea 1', NULL, NULL, 'RE'),
(71, 532, 'subtarea 2', NULL, NULL, 'IN'),
(72, 532, 'bababbaa', NULL, NULL, 'C'),
(73, 220, 'tarea test', NULL, NULL, 'C'),
(74, 535, 'ttajalads', NULL, NULL, 'C'),
(75, 535, 'afasdfadsf', NULL, '2018-06-22', 'C'),
(76, 535, 'tareaaaaa', 3, NULL, 'RE'),
(77, 535, 'tarea 3', 2, NULL, 'C'),
(78, 535, 'tareaaaa 4', NULL, '2018-06-23', 'C'),
(79, 536, 'tarea 1', NULL, '2018-06-23', 'RE'),
(80, 536, 'tarea 2', 3, '2018-06-29', 'C'),
(81, 536, 'aaaa', 2, '2018-06-23', 'C'),
(82, 538, 'tarea 1 asociada a OT id 538', NULL, NULL, 'C'),
(83, 539, 'tarea asociada a la OT 539', 3, NULL, 'C'),
(84, 539, 'tarea 2 asociada a la OT 539', 3, NULL, 'C'),
(85, 539, 'tarea 3 ot 539', NULL, NULL, 'C'),
(86, 540, 'hhhhhh', NULL, NULL, 'C'),
(87, 541, 'tarea ot 540', 2, '2018-06-30', 'C'),
(88, 158, 'kkkkk', 2, '2018-08-30', 'RE'),
(89, 23, 'Tarea 1', NULL, NULL, 'IN'),
(90, 23, 'Tarea 2', NULL, NULL, 'RE'),
(91, 23, 'Tarea3', 1, '0000-00-00', 'C'),
(92, 510, 'Tarea3', NULL, NULL, 'IN'),
(93, 510, 'Tarea de Prueba', NULL, NULL, 'IN'),
(94, 510, 'nueva tarea', 1, '2018-11-10', 'RE'),
(95, 510, 'fer', NULL, NULL, 'IN'),
(96, 510, 'tarea 03', 1, '2018-10-04', 'RE'),
(97, 563, 'tarea 03b', NULL, NULL, 'C'),
(98, 568, 'tarea de test', NULL, NULL, 'C'),
(99, 510, 'tarea test', 1, '2018-10-05', 'IN'),
(100, 510, 'asdasdasd', NULL, NULL, 'IN'),
(101, 576, 'rgreghfgjfhgjhjkhjk', NULL, NULL, 'C'),
(102, 576, 'asdasdasd', NULL, NULL, 'C'),
(103, 576, 'rgreghfgjfhgjhjkhjk', NULL, NULL, 'C'),
(104, 545, 'Tarea3', NULL, NULL, 'C'),
(105, 510, 'nueva tarea fer', NULL, NULL, 'IN'),
(106, 510, 'nuevaaaaa', NULL, NULL, 'IN'),
(107, 510, 'holis', NULL, NULL, 'IN'),
(108, 510, 'tarea 11222', NULL, NULL, 'IN'),
(109, 510, 'Tarea 999', -1, '0000-00-00', 'IN'),
(110, 510, 'tarea 8888', NULL, NULL, 'RE'),
(111, 510, 'holis fer', 1, NULL, 'IN'),
(112, 510, 'estas ahi???', NULL, '0000-00-00', 'IN'),
(113, 549, 'Cambio de vidrio lateral de cabina ', NULL, NULL, 'RE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_lote`
--

CREATE TABLE `tbl_lote` (
  `loteid` int(11) NOT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `cantidad` varchar(255) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `lotestado` char(4) DEFAULT NULL,
  `depositoid` int(11) DEFAULT NULL,
  `usrId` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_lote`
--

INSERT INTO `tbl_lote` (`loteid`, `codigo`, `fecha`, `cantidad`, `artId`, `lotestado`, `depositoid`, `usrId`, `id_empresa`) VALUES
(1, 'cod-0001', '2017-11-06', '181', 2, 'AC', 1, NULL, 6),
(2, 'cod-002', '2018-10-01', '21', 10, 'AC', 1, NULL, 6),
(3, 'Cod-0003', '2018-10-01', '11', 11, 'AC', 2, NULL, 6),
(4, 'cod-006', '2018-10-25', '90', 10, 'AC', 2, NULL, 6),
(7, '12345678', '2018-10-27', '50', 175, 'AC', 2, NULL, 6),
(8, '12345678', '2018-10-27', '25', 175, 'AC', 1, NULL, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_notapedido`
--

CREATE TABLE `tbl_notapedido` (
  `id_notaPedido` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_ordTrabajo` int(11) NOT NULL,
  `id_empresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_notapedido`
--

INSERT INTO `tbl_notapedido` (`id_notaPedido`, `fecha`, `id_ordTrabajo`, `id_empresa`) VALUES
(61, '2018-06-27', 25, 6),
(64, '2018-07-22', 1, 6),
(65, '2018-10-12', 164, 6),
(66, '2018-10-12', 161, 6),
(67, '2018-10-12', 164, 6),
(68, '2018-10-12', 166, 6),
(69, '2018-10-29', 160, 6),
(70, '2018-10-29', 160, 6),
(71, '2018-10-29', 160, 6),
(72, '2019-01-14', 160, 6),
(73, '2019-01-14', 160, 6),
(74, '2019-01-15', 44, 6),
(75, '2019-01-15', 44, 6),
(76, '2019-01-15', 44, 6),
(77, '2019-01-16', 44, 6),
(78, '2019-01-16', 44, 6),
(79, '2019-01-16', 44, 6),
(80, '2019-01-16', 44, 6),
(81, '2019-01-16', 44, 6),
(82, '2019-01-16', 44, 6),
(83, '2019-01-16', 44, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_preventivoherramientas`
--

CREATE TABLE `tbl_preventivoherramientas` (
  `id` int(11) NOT NULL,
  `prevId` int(11) DEFAULT NULL,
  `herrId` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_preventivoherramientas`
--

INSERT INTO `tbl_preventivoherramientas` (`id`, `prevId`, `herrId`, `cantidad`, `id_empresa`) VALUES
(1, 22, 20, 1, 6),
(2, 23, 1, 2, 0),
(3, 23, 2, 20, 0),
(4, 24, 1, 2, 0),
(5, 26, 1, 4, 6),
(6, 26, 2, 5, 6),
(7, 26, 4, 1, 6),
(11, 1, 1, 11, 6),
(12, 1, 4, 22, 6),
(13, 1, 5, 33, 6),
(14, 1, 2, 44, 6),
(15, 1, 1, 1, 6),
(16, 1, 2, 2, 6),
(17, 1, 5, 3, 6),
(18, 1, 1, 1, 6),
(19, 1, 2, 2, 6),
(20, 1, 5, 3, 6),
(21, 1, 1, 1, 6),
(22, 1, 2, 2, 6),
(23, 1, 5, 3, 6),
(24, 1, 4, 2, 6),
(25, 1, 4, 2, 6),
(26, 41, 1, 11, 6),
(27, 41, 2, 22, 6),
(28, 42, 4, 2, 6),
(29, 55, 1, 1111, 6),
(30, 55, 2, 222, 6),
(31, 42, 1, 3, 3),
(32, NULL, 1, 0, 6),
(33, NULL, 2, 0, 6),
(34, NULL, 4, 0, 6),
(35, NULL, 2, 0, 6),
(36, NULL, 1, 0, 6),
(37, NULL, 5, 0, 6),
(38, NULL, 1, 45, 6),
(39, NULL, 2, 33, 6),
(40, NULL, 5, 22, 6),
(62, 43, 4, 333, 6),
(63, 43, 1, 55, 6),
(67, 56, 2, 1, 6),
(68, 56, 4, 2, 6),
(79, 47, 1, 15, 6),
(80, 128, 4, 1, 6),
(81, 129, 93, 1, 7),
(82, 134, 4, 22, 6),
(83, 135, 4, 22, 6),
(87, 136, 2, 2222, 6),
(90, 141, 2, 34, 6),
(91, 148, 2, 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_preventivoinsumos`
--

CREATE TABLE `tbl_preventivoinsumos` (
  `id` int(11) NOT NULL,
  `prevId` int(11) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_preventivoinsumos`
--

INSERT INTO `tbl_preventivoinsumos` (`id`, `prevId`, `artId`, `cantidad`, `id_empresa`) VALUES
(1, 22, 3, 45, 6),
(2, 23, 1, 15, 6),
(3, 23, 2, 20, 6),
(4, 24, 3, 20, 6),
(5, 26, 1, 5, 6),
(6, 26, 2, 15, 6),
(7, 26, 3, 45, 6),
(8, 27, 1, 11, 6),
(9, 27, 2, 22, 6),
(10, 1, 1, 1, 6),
(11, 1, 2, 2, 6),
(12, 1, 3, 3, 6),
(13, 55, 1, 111, 6),
(14, 55, 2, 222, 6),
(15, 42, 1, 20, 6),
(16, 42, 3, 15, 6),
(17, 42, 4, 35, 6),
(29, 43, 1, 11, 6),
(30, 43, 3, 45, 6),
(33, 56, 1, 2, 6),
(56, 47, 1, 25, 6),
(57, 128, 21, 1, 6),
(58, 134, 2, 22, 6),
(59, 135, 2, 22, 6),
(63, 136, 173, 22, 6),
(65, 141, 2, 50, 6),
(66, 148, 18, 2, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipoordentrabajo`
--

CREATE TABLE `tbl_tipoordentrabajo` (
  `id` int(11) NOT NULL,
  `tipo_orden` int(11) NOT NULL,
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_tipoordentrabajo`
--

INSERT INTO `tbl_tipoordentrabajo` (`id`, `tipo_orden`, `descripcion`) VALUES
(1, 1, 'Orden de Trabajo'),
(2, 2, 'Solicitud de servicio'),
(3, 3, 'Preventivo'),
(4, 4, 'Backlog'),
(5, 5, 'Predictivo'),
(6, 6, 'Correctivo Programado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_trazacomponente`
--

CREATE TABLE `tbl_trazacomponente` (
  `id_trazacomponente` int(11) NOT NULL,
  `idcomponenteequipo` int(11) NOT NULL,
  `id_estanteria` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `fecha_Entrega` datetime DEFAULT NULL,
  `ult_recibe` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observaciones` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usrId` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_trazacomponente`
--

INSERT INTO `tbl_trazacomponente` (`id_trazacomponente`, `idcomponenteequipo`, `id_estanteria`, `fila`, `fecha`, `fecha_Entrega`, `ult_recibe`, `estado`, `observaciones`, `usrId`, `id_empresa`) VALUES
(1, 71, 1, 2, '2017-10-05 07:29:05', '2017-10-05 07:31:25', 'Balderramo', 'E', 'se lleva balderrama para reparar bomba inyectora', 5, 6),
(2, 72, 2, 3, '2017-10-05 07:29:05', '2017-10-05 07:29:05', 'Sr Perez', 'REC', 'recibo radiador para reparar', 5, 6),
(3, 3, 1, 1, '2017-12-02 07:12:21', '2017-12-02 07:12:21', 'pedro perez', 'C', 'sadadsa', 1, 6),
(4, 3, 1, 1, '2017-12-02 07:12:53', '2017-12-02 07:12:53', 'motores balderramo', 'C', 'dasdasd', 1, 6),
(5, 0, 6, 6, '2018-07-03 00:39:20', '2018-07-03 00:39:20', 'qwerty', 'C', 'qwerty', 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_unidadmedida`
--

CREATE TABLE `tbl_unidadmedida` (
  `id_unidadmedida` int(11) NOT NULL,
  `descripcion` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_unidadmedida`
--

INSERT INTO `tbl_unidadmedida` (`id_unidadmedida`, `descripcion`, `estado`, `id_empresa`) VALUES
(1, 'Unidades', 'AN', 6),
(2, 'Litro', 'AC', 6),
(3, 'Metro', 'AC', 6),
(4, 'Kg', 'AC', 6),
(5, 'm2', 'AN', 6),
(6, 'm3', 'AN', 6),
(7, 'caja', 'AC', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_valedesacarga`
--

CREATE TABLE `tbl_valedesacarga` (
  `valedid` int(11) NOT NULL,
  `valedfecha` datetime DEFAULT NULL,
  `usrId` int(11) DEFAULT NULL,
  `respons` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `dest` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_valedesacarga`
--

INSERT INTO `tbl_valedesacarga` (`valedid`, `valedfecha`, `usrId`, `respons`, `dest`, `id_empresa`) VALUES
(1, '2018-07-02 00:00:00', 1, 'Hugo G', 'Destino 01 prueba', 6),
(2, '2018-10-08 00:00:00', 18, 'Rodriguez Guillermo ', 'mina chinchillas ', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_valesalida`
--

CREATE TABLE `tbl_valesalida` (
  `valesid` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `usrId` int(10) DEFAULT NULL,
  `respons` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `dest` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_valesalida`
--

INSERT INTO `tbl_valesalida` (`valesid`, `fecha`, `usrId`, `respons`, `dest`, `id_empresa`) VALUES
(1, '2017-11-14', NULL, 'Roberto Pérez', 'Obra 1', 6),
(2, '2017-11-14', NULL, 'Francisco Rodriguez', 'Obra 2', 6),
(4, '2017-11-14', 5, NULL, NULL, 6),
(5, '2018-07-02', 1, 'hugo G', 'destino 01 prueba', 6),
(6, '2018-09-19', 1, NULL, NULL, 0),
(10, '2018-10-08', 18, 'Rodriguez Guillermo ', 'mina chinchillas ', 7),
(15, '2018-10-20', 1, NULL, NULL, 6),
(16, '2018-10-20', 1, NULL, NULL, 6),
(17, '2018-10-20', 1, NULL, NULL, 6),
(18, '2018-10-20', 1, NULL, NULL, 6),
(19, '2018-10-20', 1, NULL, NULL, 6),
(20, '2018-10-20', 1, NULL, NULL, 6),
(21, '2018-10-20', 1, NULL, NULL, 6),
(22, '2018-10-20', 1, NULL, NULL, 6),
(23, '2018-10-21', 1, NULL, NULL, 6),
(24, '2018-10-21', 1, NULL, NULL, 6),
(25, '2018-10-21', 1, NULL, NULL, 6),
(26, '2018-10-21', 1, NULL, NULL, 6),
(27, '2018-10-23', 1, NULL, NULL, 6),
(28, '2018-11-05', 1, '', '', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocuenta`
--

CREATE TABLE `tipocuenta` (
  `tipocuentaid` int(11) NOT NULL,
  `tipocuentadescrip` varchar(255) DEFAULT NULL,
  `tipocuentamonto` varchar(50) DEFAULT NULL,
  `tipocuentausuarios` varchar(50) DEFAULT NULL,
  `tipocuentaactivos` varchar(50) DEFAULT NULL,
  `tipocuentaempresas` varchar(50) DEFAULT NULL,
  `apps` varchar(2) DEFAULT NULL,
  `modulo_alerta` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipocuenta`
--

INSERT INTO `tipocuenta` (`tipocuentaid`, `tipocuentadescrip`, `tipocuentamonto`, `tipocuentausuarios`, `tipocuentaactivos`, `tipocuentaempresas`, `apps`, `modulo_alerta`) VALUES
(1, 'GO', '0', '10', '100', '1', 'NO', 'NO'),
(2, 'PRO', '100', '50', '1000', '3', 'SI', 'SI'),
(3, 'CORPORATE', '300', 'ILIMITADO', 'ILIMITADO', 'ILIMITADO', 'SI', 'SI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_industrial`
--

CREATE TABLE `unidad_industrial` (
  `id_unidad` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `unidad_industrial`
--

INSERT INTO `unidad_industrial` (`id_unidad`, `descripcion`, `id_empresa`) VALUES
(1, 'veladero', 6),
(2, 'nueva unidad insdutrial 2', 6),
(3, 'MINA CHINCHILLAS', 7),
(4, 'La Laja', 2),
(5, 'unidad agregada 1', 6),
(6, 'unidad agregada 2', 6),
(7, 'unidad agregada 3', 6),
(8, 'unidad agregada 4', 6),
(9, 'unidad agregada 5', 6),
(10, 'unidadagregada 6', 6),
(11, 'La laja', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_tiempo`
--

CREATE TABLE `unidad_tiempo` (
  `id_unidad` int(11) NOT NULL,
  `unidaddescrip` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `unidad_tiempo`
--

INSERT INTO `unidad_tiempo` (`id_unidad`, `unidaddescrip`) VALUES
(1, 'minutos'),
(2, 'horas'),
(3, 'dias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioasempresa`
--

CREATE TABLE `usuarioasempresa` (
  `empresaid` int(11) NOT NULL,
  `usrId` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `tipo` tinyint(1) NOT NULL,
  `grpId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarioasempresa`
--

INSERT INTO `usuarioasempresa` (`empresaid`, `usrId`, `fecha`, `tipo`, `grpId`) VALUES
(6, 1, NULL, 1, 0),
(6, 17, '2018-09-18 00:00:00', 1, 0),
(7, 16, '2018-09-17 00:00:00', 1, 0),
(7, 18, '2018-09-21 00:00:00', 1, 7),
(7, 19, '2018-09-12 00:00:00', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abmdeposito`
--
ALTER TABLE `abmdeposito`
  ADD PRIMARY KEY (`depositoId`);

--
-- Indices de la tabla `abmproveedores`
--
ALTER TABLE `abmproveedores`
  ADD PRIMARY KEY (`provid`);

--
-- Indices de la tabla `admcustomers`
--
ALTER TABLE `admcustomers`
  ADD PRIMARY KEY (`cliId`);

--
-- Indices de la tabla `admstock`
--
ALTER TABLE `admstock`
  ADD PRIMARY KEY (`stkId`),
  ADD KEY `prodId` (`prodId`) USING BTREE,
  ADD KEY `usrId` (`usrId`) USING BTREE;

--
-- Indices de la tabla `admvisits`
--
ALTER TABLE `admvisits`
  ADD PRIMARY KEY (`vstId`),
  ADD KEY `cliId` (`cliId`) USING BTREE;

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id_area`);

--
-- Indices de la tabla `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`artId`),
  ADD UNIQUE KEY `artBarCode` (`artBarCode`) USING BTREE,
  ADD UNIQUE KEY `artDescription` (`artDescription`) USING BTREE;

--
-- Indices de la tabla `asignaherramientas`
--
ALTER TABLE `asignaherramientas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `herrId` (`herrId`) USING BTREE,
  ADD KEY `id_orden` (`id_orden`) USING BTREE;

--
-- Indices de la tabla `asignausuario`
--
ALTER TABLE `asignausuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usrId` (`usrId`) USING BTREE,
  ADD KEY `id_orden` (`id_orden`) USING BTREE;

--
-- Indices de la tabla `asp_detaplantillainsumos`
--
ALTER TABLE `asp_detaplantillainsumos`
  ADD PRIMARY KEY (`deta_id`);

--
-- Indices de la tabla `asp_plantillainsumos`
--
ALTER TABLE `asp_plantillainsumos`
  ADD PRIMARY KEY (`plant_id`);

--
-- Indices de la tabla `asp_subtareas`
--
ALTER TABLE `asp_subtareas`
  ADD PRIMARY KEY (`id_subtarea`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`idCiudades`),
  ADD KEY `Paises_Codigo` (`Paises_Codigo`) USING BTREE,
  ADD KEY `Ciudad` (`Ciudad`) USING BTREE;

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`clinteid`),
  ADD KEY `fk_clientes_cuenta1_idx` (`cuenta_cuentaid`) USING BTREE;

--
-- Indices de la tabla `componenteequipo`
--
ALTER TABLE `componenteequipo`
  ADD PRIMARY KEY (`idcomponenteequipo`);

--
-- Indices de la tabla `componentes`
--
ALTER TABLE `componentes`
  ADD PRIMARY KEY (`id_componente`),
  ADD KEY `id_equipo` (`id_equipo`) USING BTREE,
  ADD KEY `marcaid` (`marcaid`) USING BTREE;

--
-- Indices de la tabla `conffamily`
--
ALTER TABLE `conffamily`
  ADD PRIMARY KEY (`famId`);

--
-- Indices de la tabla `confsubfamily`
--
ALTER TABLE `confsubfamily`
  ADD PRIMARY KEY (`sfamId`),
  ADD KEY `famId` (`famId`) USING BTREE;

--
-- Indices de la tabla `confzone`
--
ALTER TABLE `confzone`
  ADD PRIMARY KEY (`zonaId`);

--
-- Indices de la tabla `contratistaquipo`
--
ALTER TABLE `contratistaquipo`
  ADD PRIMARY KEY (`id_contratista`,`id_equipo`),
  ADD KEY `id_equipo` (`id_equipo`) USING BTREE;

--
-- Indices de la tabla `contratistas`
--
ALTER TABLE `contratistas`
  ADD PRIMARY KEY (`id_contratista`);

--
-- Indices de la tabla `criticidad`
--
ALTER TABLE `criticidad`
  ADD PRIMARY KEY (`id_criti`);

--
-- Indices de la tabla `deta_ordeninsumos`
--
ALTER TABLE `deta_ordeninsumos`
  ADD PRIMARY KEY (`id_detaordeninsumo`),
  ADD KEY `loteid` (`loteid`) USING BTREE,
  ADD KEY `id_ordeninsumo` (`id_ordeninsumo`) USING BTREE;

--
-- Indices de la tabla `deta_ordenservicio`
--
ALTER TABLE `deta_ordenservicio`
  ADD PRIMARY KEY (`id_detasercicio`),
  ADD KEY `id_ordenservicio` (`id_ordenservicio`) USING BTREE,
  ADD KEY `id_componente` (`id_componente`) USING BTREE;

--
-- Indices de la tabla `deta_remito`
--
ALTER TABLE `deta_remito`
  ADD PRIMARY KEY (`detaremitoid`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `envios`
--
ALTER TABLE `envios`
  ADD PRIMARY KEY (`id_envio`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id_equipo`),
  ADD KEY `id_empresa` (`id_empresa`) USING BTREE,
  ADD KEY `id_sector` (`id_sector`) USING BTREE,
  ADD KEY `id_criticidad` (`id_criticidad`) USING BTREE,
  ADD KEY `id_grupo` (`id_grupo`) USING BTREE;

--
-- Indices de la tabla `fallas`
--
ALTER TABLE `fallas`
  ADD PRIMARY KEY (`id_reparacion`);

--
-- Indices de la tabla `ficha_equipo`
--
ALTER TABLE `ficha_equipo`
  ADD PRIMARY KEY (`id_fichaequip`);

--
-- Indices de la tabla `frm_categorias`
--
ALTER TABLE `frm_categorias`
  ADD PRIMARY KEY (`CATE_ID`);

--
-- Indices de la tabla `frm_formularios`
--
ALTER TABLE `frm_formularios`
  ADD PRIMARY KEY (`form_id`);

--
-- Indices de la tabla `frm_formularios_completados`
--
ALTER TABLE `frm_formularios_completados`
  ADD PRIMARY KEY (`FOCO_ID`),
  ADD KEY `INFO_ID` (`INFO_ID`);

--
-- Indices de la tabla `frm_grupos`
--
ALTER TABLE `frm_grupos`
  ADD PRIMARY KEY (`GRUP_ID`);

--
-- Indices de la tabla `frm_instancias_formulario`
--
ALTER TABLE `frm_instancias_formulario`
  ADD PRIMARY KEY (`info_id`),
  ADD KEY `info_id` (`info_id`);

--
-- Indices de la tabla `frm_tipos_dato`
--
ALTER TABLE `frm_tipos_dato`
  ADD PRIMARY KEY (`TIDA_ID`);

--
-- Indices de la tabla `frm_valores`
--
ALTER TABLE `frm_valores`
  ADD PRIMARY KEY (`VALO_ID`);

--
-- Indices de la tabla `frm_valores_validos`
--
ALTER TABLE `frm_valores_validos`
  ADD PRIMARY KEY (`VAPO_ID`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id_grupo`);

--
-- Indices de la tabla `herramientas`
--
ALTER TABLE `herramientas`
  ADD PRIMARY KEY (`herrId`),
  ADD UNIQUE KEY `1` (`herrcodigo`) USING BTREE,
  ADD KEY `depositoId` (`depositoId`) USING BTREE;

--
-- Indices de la tabla `historial_lecturas`
--
ALTER TABLE `historial_lecturas`
  ADD PRIMARY KEY (`id_lectura`);

--
-- Indices de la tabla `infocomponentes`
--
ALTER TABLE `infocomponentes`
  ADD PRIMARY KEY (`infocompid`),
  ADD KEY `id_equipo` (`id_equipo`) USING BTREE;

--
-- Indices de la tabla `infoequipos`
--
ALTER TABLE `infoequipos`
  ADD PRIMARY KEY (`infoid`),
  ADD KEY `id_equipo` (`id_equipo`) USING BTREE;

--
-- Indices de la tabla `informacionequipo`
--
ALTER TABLE `informacionequipo`
  ADD PRIMARY KEY (`id_informacion`);

--
-- Indices de la tabla `marcasequipos`
--
ALTER TABLE `marcasequipos`
  ADD PRIMARY KEY (`marcaid`);

--
-- Indices de la tabla `modelo_año`
--
ALTER TABLE `modelo_año`
  ADD PRIMARY KEY (`id_año`);

--
-- Indices de la tabla `orden_insumos`
--
ALTER TABLE `orden_insumos`
  ADD PRIMARY KEY (`id_orden`);

--
-- Indices de la tabla `orden_pedido`
--
ALTER TABLE `orden_pedido`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `id_trabajo` (`id_trabajo`) USING BTREE,
  ADD KEY `id_proveedor` (`id_proveedor`) USING BTREE;

--
-- Indices de la tabla `orden_servicio`
--
ALTER TABLE `orden_servicio`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `id_equipo` (`id_equipo`) USING BTREE,
  ADD KEY `id_empresaservicio` (`id_contratista`) USING BTREE,
  ADD KEY `id_solicitudreparacion` (`id_solicitudreparacion`) USING BTREE,
  ADD KEY `id_orden_insumo` (`id_orden_insumo`) USING BTREE;

--
-- Indices de la tabla `orden_trabajo`
--
ALTER TABLE `orden_trabajo`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `orden_trabajo_ibfk_1` (`cliId`) USING BTREE,
  ADD KEY `id_usuario` (`id_usuario`) USING BTREE,
  ADD KEY `id_usuariosolicitante` (`id_usuario_a`) USING BTREE,
  ADD KEY `usuario_entrega` (`id_usuario_e`) USING BTREE,
  ADD KEY `id_sucursal` (`id_sucursal`) USING BTREE;

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `parametroequipo`
--
ALTER TABLE `parametroequipo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_equipo` (`id_equipo`) USING BTREE,
  ADD KEY `paramId` (`paramId`) USING BTREE;

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`paramId`);

--
-- Indices de la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD PRIMARY KEY (`idperiodo`);

--
-- Indices de la tabla `predictivo`
--
ALTER TABLE `predictivo`
  ADD PRIMARY KEY (`predId`);

--
-- Indices de la tabla `preventivo`
--
ALTER TABLE `preventivo`
  ADD PRIMARY KEY (`prevId`),
  ADD KEY `id_equipo` (`id_equipo`) USING BTREE,
  ADD KEY `id_tarea` (`id_tarea`) USING BTREE,
  ADD KEY `id_componente` (`id_componente`) USING BTREE;

--
-- Indices de la tabla `proceso`
--
ALTER TABLE `proceso`
  ADD PRIMARY KEY (`id_proceso`);

--
-- Indices de la tabla `remitos`
--
ALTER TABLE `remitos`
  ADD PRIMARY KEY (`remitoId`),
  ADD KEY `provid` (`provid`) USING BTREE;

--
-- Indices de la tabla `rubro`
--
ALTER TABLE `rubro`
  ADD PRIMARY KEY (`id_rubro`);

--
-- Indices de la tabla `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`id_sector`);

--
-- Indices de la tabla `seguro`
--
ALTER TABLE `seguro`
  ADD PRIMARY KEY (`id_seguro`);

--
-- Indices de la tabla `setupparam`
--
ALTER TABLE `setupparam`
  ADD PRIMARY KEY (`id_parametro`,`id_equipo`),
  ADD KEY `id_equipo` (`id_equipo`) USING BTREE;

--
-- Indices de la tabla `sisactions`
--
ALTER TABLE `sisactions`
  ADD PRIMARY KEY (`actId`);

--
-- Indices de la tabla `sisgroups`
--
ALTER TABLE `sisgroups`
  ADD PRIMARY KEY (`grpId`);

--
-- Indices de la tabla `sisgroupsactions`
--
ALTER TABLE `sisgroupsactions`
  ADD PRIMARY KEY (`grpactId`),
  ADD KEY `grpId` (`grpId`) USING BTREE,
  ADD KEY `menuAccId` (`menuAccId`) USING BTREE;

--
-- Indices de la tabla `sismenu`
--
ALTER TABLE `sismenu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`) USING BTREE;

--
-- Indices de la tabla `sismenuactions`
--
ALTER TABLE `sismenuactions`
  ADD PRIMARY KEY (`menuAccId`);

--
-- Indices de la tabla `sistema`
--
ALTER TABLE `sistema`
  ADD PRIMARY KEY (`sistemaid`);

--
-- Indices de la tabla `sisusers`
--
ALTER TABLE `sisusers`
  ADD PRIMARY KEY (`usrId`);

--
-- Indices de la tabla `solicitud_reparacion`
--
ALTER TABLE `solicitud_reparacion`
  ADD PRIMARY KEY (`id_solicitud`),
  ADD KEY `id_equipo` (`id_equipo`) USING BTREE;

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id_sucursal`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id_tarea`);

--
-- Indices de la tabla `tbl_back`
--
ALTER TABLE `tbl_back`
  ADD PRIMARY KEY (`backId`);

--
-- Indices de la tabla `tbl_detanotapedido`
--
ALTER TABLE `tbl_detanotapedido`
  ADD PRIMARY KEY (`id_detaNota`),
  ADD KEY `id_notaPedido` (`id_notaPedido`) USING BTREE;

--
-- Indices de la tabla `tbl_detavaledescarga`
--
ALTER TABLE `tbl_detavaledescarga`
  ADD PRIMARY KEY (`detavaledid`),
  ADD KEY `equipid` (`herrId`) USING BTREE,
  ADD KEY `valedid` (`valedid`) USING BTREE;

--
-- Indices de la tabla `tbl_detavalesalida`
--
ALTER TABLE `tbl_detavalesalida`
  ADD PRIMARY KEY (`detavid`),
  ADD KEY `equiid` (`herrId`) USING BTREE,
  ADD KEY `valesid` (`valesid`) USING BTREE;

--
-- Indices de la tabla `tbl_estado`
--
ALTER TABLE `tbl_estado`
  ADD PRIMARY KEY (`estadoid`);

--
-- Indices de la tabla `tbl_estanteria`
--
ALTER TABLE `tbl_estanteria`
  ADD PRIMARY KEY (`id_estanteria`);

--
-- Indices de la tabla `tbl_listarea`
--
ALTER TABLE `tbl_listarea`
  ADD PRIMARY KEY (`id_listarea`);

--
-- Indices de la tabla `tbl_lote`
--
ALTER TABLE `tbl_lote`
  ADD PRIMARY KEY (`loteid`),
  ADD KEY `depositoid` (`depositoid`) USING BTREE,
  ADD KEY `artId` (`artId`) USING BTREE;

--
-- Indices de la tabla `tbl_notapedido`
--
ALTER TABLE `tbl_notapedido`
  ADD PRIMARY KEY (`id_notaPedido`);

--
-- Indices de la tabla `tbl_preventivoherramientas`
--
ALTER TABLE `tbl_preventivoherramientas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prevId` (`prevId`) USING BTREE,
  ADD KEY `tbl_preventivoherramientas_ibfk_2` (`herrId`) USING BTREE;

--
-- Indices de la tabla `tbl_preventivoinsumos`
--
ALTER TABLE `tbl_preventivoinsumos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prevId` (`prevId`) USING BTREE,
  ADD KEY `artId` (`artId`) USING BTREE;

--
-- Indices de la tabla `tbl_tipoordentrabajo`
--
ALTER TABLE `tbl_tipoordentrabajo`
  ADD PRIMARY KEY (`id`,`tipo_orden`);

--
-- Indices de la tabla `tbl_trazacomponente`
--
ALTER TABLE `tbl_trazacomponente`
  ADD PRIMARY KEY (`id_trazacomponente`),
  ADD KEY `idcomponenteequipo` (`idcomponenteequipo`) USING BTREE,
  ADD KEY `id_estanteria` (`id_estanteria`) USING BTREE,
  ADD KEY `usrId` (`usrId`) USING BTREE;

--
-- Indices de la tabla `tbl_unidadmedida`
--
ALTER TABLE `tbl_unidadmedida`
  ADD PRIMARY KEY (`id_unidadmedida`);

--
-- Indices de la tabla `tbl_valedesacarga`
--
ALTER TABLE `tbl_valedesacarga`
  ADD PRIMARY KEY (`valedid`),
  ADD KEY `usrId` (`usrId`) USING BTREE;

--
-- Indices de la tabla `tbl_valesalida`
--
ALTER TABLE `tbl_valesalida`
  ADD PRIMARY KEY (`valesid`),
  ADD KEY `repid` (`usrId`) USING BTREE;

--
-- Indices de la tabla `tipocuenta`
--
ALTER TABLE `tipocuenta`
  ADD PRIMARY KEY (`tipocuentaid`);

--
-- Indices de la tabla `unidad_industrial`
--
ALTER TABLE `unidad_industrial`
  ADD PRIMARY KEY (`id_unidad`);

--
-- Indices de la tabla `unidad_tiempo`
--
ALTER TABLE `unidad_tiempo`
  ADD PRIMARY KEY (`id_unidad`);

--
-- Indices de la tabla `usuarioasempresa`
--
ALTER TABLE `usuarioasempresa`
  ADD PRIMARY KEY (`empresaid`,`usrId`),
  ADD KEY `usrId` (`usrId`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abmdeposito`
--
ALTER TABLE `abmdeposito`
  MODIFY `depositoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `abmproveedores`
--
ALTER TABLE `abmproveedores`
  MODIFY `provid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `admcustomers`
--
ALTER TABLE `admcustomers`
  MODIFY `cliId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `admstock`
--
ALTER TABLE `admstock`
  MODIFY `stkId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT de la tabla `admvisits`
--
ALTER TABLE `admvisits`
  MODIFY `vstId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `articles`
--
ALTER TABLE `articles`
  MODIFY `artId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;
--
-- AUTO_INCREMENT de la tabla `asignaherramientas`
--
ALTER TABLE `asignaherramientas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `asignausuario`
--
ALTER TABLE `asignausuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `asp_detaplantillainsumos`
--
ALTER TABLE `asp_detaplantillainsumos`
  MODIFY `deta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `asp_plantillainsumos`
--
ALTER TABLE `asp_plantillainsumos`
  MODIFY `plant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `asp_subtareas`
--
ALTER TABLE `asp_subtareas`
  MODIFY `id_subtarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `idCiudades` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `clinteid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `componenteequipo`
--
ALTER TABLE `componenteequipo`
  MODIFY `idcomponenteequipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `componentes`
--
ALTER TABLE `componentes`
  MODIFY `id_componente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;
--
-- AUTO_INCREMENT de la tabla `conffamily`
--
ALTER TABLE `conffamily`
  MODIFY `famId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT de la tabla `confsubfamily`
--
ALTER TABLE `confsubfamily`
  MODIFY `sfamId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `confzone`
--
ALTER TABLE `confzone`
  MODIFY `zonaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `contratistas`
--
ALTER TABLE `contratistas`
  MODIFY `id_contratista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `criticidad`
--
ALTER TABLE `criticidad`
  MODIFY `id_criti` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `deta_ordeninsumos`
--
ALTER TABLE `deta_ordeninsumos`
  MODIFY `id_detaordeninsumo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `deta_ordenservicio`
--
ALTER TABLE `deta_ordenservicio`
  MODIFY `id_detasercicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `deta_remito`
--
ALTER TABLE `deta_remito`
  MODIFY `detaremitoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id_empresa` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `envios`
--
ALTER TABLE `envios`
  MODIFY `id_envio` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `fallas`
--
ALTER TABLE `fallas`
  MODIFY `id_reparacion` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `ficha_equipo`
--
ALTER TABLE `ficha_equipo`
  MODIFY `id_fichaequip` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `frm_categorias`
--
ALTER TABLE `frm_categorias`
  MODIFY `CATE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7001;
--
-- AUTO_INCREMENT de la tabla `frm_formularios`
--
ALTER TABLE `frm_formularios`
  MODIFY `form_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7001;
--
-- AUTO_INCREMENT de la tabla `frm_formularios_completados`
--
ALTER TABLE `frm_formularios_completados`
  MODIFY `FOCO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;
--
-- AUTO_INCREMENT de la tabla `frm_grupos`
--
ALTER TABLE `frm_grupos`
  MODIFY `GRUP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7001;
--
-- AUTO_INCREMENT de la tabla `frm_instancias_formulario`
--
ALTER TABLE `frm_instancias_formulario`
  MODIFY `info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `frm_valores`
--
ALTER TABLE `frm_valores`
  MODIFY `VALO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7001;
--
-- AUTO_INCREMENT de la tabla `frm_valores_validos`
--
ALTER TABLE `frm_valores_validos`
  MODIFY `VAPO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2328;
--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id_grupo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `herramientas`
--
ALTER TABLE `herramientas`
  MODIFY `herrId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT de la tabla `historial_lecturas`
--
ALTER TABLE `historial_lecturas`
  MODIFY `id_lectura` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT de la tabla `infocomponentes`
--
ALTER TABLE `infocomponentes`
  MODIFY `infocompid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `infoequipos`
--
ALTER TABLE `infoequipos`
  MODIFY `infoid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `informacionequipo`
--
ALTER TABLE `informacionequipo`
  MODIFY `id_informacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1088;
--
-- AUTO_INCREMENT de la tabla `marcasequipos`
--
ALTER TABLE `marcasequipos`
  MODIFY `marcaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT de la tabla `modelo_año`
--
ALTER TABLE `modelo_año`
  MODIFY `id_año` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `orden_insumos`
--
ALTER TABLE `orden_insumos`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `orden_pedido`
--
ALTER TABLE `orden_pedido`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT de la tabla `orden_servicio`
--
ALTER TABLE `orden_servicio`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `orden_trabajo`
--
ALTER TABLE `orden_trabajo`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=617;
--
-- AUTO_INCREMENT de la tabla `parametroequipo`
--
ALTER TABLE `parametroequipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `paramId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `periodo`
--
ALTER TABLE `periodo`
  MODIFY `idperiodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `predictivo`
--
ALTER TABLE `predictivo`
  MODIFY `predId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `preventivo`
--
ALTER TABLE `preventivo`
  MODIFY `prevId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;
--
-- AUTO_INCREMENT de la tabla `proceso`
--
ALTER TABLE `proceso`
  MODIFY `id_proceso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `remitos`
--
ALTER TABLE `remitos`
  MODIFY `remitoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `rubro`
--
ALTER TABLE `rubro`
  MODIFY `id_rubro` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `sector`
--
ALTER TABLE `sector`
  MODIFY `id_sector` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `seguro`
--
ALTER TABLE `seguro`
  MODIFY `id_seguro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;
--
-- AUTO_INCREMENT de la tabla `sisactions`
--
ALTER TABLE `sisactions`
  MODIFY `actId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `sisgroups`
--
ALTER TABLE `sisgroups`
  MODIFY `grpId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `sisgroupsactions`
--
ALTER TABLE `sisgroupsactions`
  MODIFY `grpactId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1183;
--
-- AUTO_INCREMENT de la tabla `sismenu`
--
ALTER TABLE `sismenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT de la tabla `sismenuactions`
--
ALTER TABLE `sismenuactions`
  MODIFY `menuAccId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;
--
-- AUTO_INCREMENT de la tabla `sistema`
--
ALTER TABLE `sistema`
  MODIFY `sistemaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `sisusers`
--
ALTER TABLE `sisusers`
  MODIFY `usrId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT de la tabla `solicitud_reparacion`
--
ALTER TABLE `solicitud_reparacion`
  MODIFY `id_solicitud` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id_sucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id_tarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;
--
-- AUTO_INCREMENT de la tabla `tbl_back`
--
ALTER TABLE `tbl_back`
  MODIFY `backId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT de la tabla `tbl_detanotapedido`
--
ALTER TABLE `tbl_detanotapedido`
  MODIFY `id_detaNota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT de la tabla `tbl_detavaledescarga`
--
ALTER TABLE `tbl_detavaledescarga`
  MODIFY `detavaledid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tbl_detavalesalida`
--
ALTER TABLE `tbl_detavalesalida`
  MODIFY `detavid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT de la tabla `tbl_estado`
--
ALTER TABLE `tbl_estado`
  MODIFY `estadoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `tbl_estanteria`
--
ALTER TABLE `tbl_estanteria`
  MODIFY `id_estanteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `tbl_listarea`
--
ALTER TABLE `tbl_listarea`
  MODIFY `id_listarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
--
-- AUTO_INCREMENT de la tabla `tbl_lote`
--
ALTER TABLE `tbl_lote`
  MODIFY `loteid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `tbl_notapedido`
--
ALTER TABLE `tbl_notapedido`
  MODIFY `id_notaPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT de la tabla `tbl_preventivoherramientas`
--
ALTER TABLE `tbl_preventivoherramientas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT de la tabla `tbl_preventivoinsumos`
--
ALTER TABLE `tbl_preventivoinsumos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT de la tabla `tbl_tipoordentrabajo`
--
ALTER TABLE `tbl_tipoordentrabajo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `tbl_trazacomponente`
--
ALTER TABLE `tbl_trazacomponente`
  MODIFY `id_trazacomponente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tbl_unidadmedida`
--
ALTER TABLE `tbl_unidadmedida`
  MODIFY `id_unidadmedida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `tbl_valedesacarga`
--
ALTER TABLE `tbl_valedesacarga`
  MODIFY `valedid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tbl_valesalida`
--
ALTER TABLE `tbl_valesalida`
  MODIFY `valesid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT de la tabla `tipocuenta`
--
ALTER TABLE `tipocuenta`
  MODIFY `tipocuentaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `unidad_industrial`
--
ALTER TABLE `unidad_industrial`
  MODIFY `id_unidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `unidad_tiempo`
--
ALTER TABLE `unidad_tiempo`
  MODIFY `id_unidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_detanotapedido`
--
ALTER TABLE `tbl_detanotapedido`
  ADD CONSTRAINT `tbl_detanotapedido_ibfk_1` FOREIGN KEY (`id_notaPedido`) REFERENCES `tbl_notapedido` (`id_notaPedido`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
