-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-05-2024 a las 05:49:20
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectoboda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `Usuario_ID` int(11) NOT NULL,
  `Servicios_ID` int(11) NOT NULL,
  `OpcionesServicios_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcionesservicios`
--

CREATE TABLE `opcionesservicios` (
  `ID` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `opcion_nombre` varchar(45) NOT NULL,
  `precio` int(11) NOT NULL,
  `Servicios_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `opcionesservicios`
--

INSERT INTO `opcionesservicios` (`ID`, `descripcion`, `opcion_nombre`, `precio`, `Servicios_ID`) VALUES
(1, 'Compromiso sellado con elegancia.', 'Elegancia Comprometida', 300000, 1),
(2, 'Lujo y exclusividad para un compromiso inolvidable.', 'Compromiso Exclusivo', 600000, 1),
(3, 'Compromiso eterno sellado con amor.', 'Amor Eterno', 900000, 1),
(4, 'Compromiso único para una unión especial.', 'Unión Especial', 1200000, 1),
(5, 'Anillo que simboliza un amor duradero.', 'Amor Duradero', 1500000, 1),
(6, 'Llega con estilo a tu gran día.', 'Estilo en Movimiento', 500000, 2),
(7, 'Elegancia y lujo para tu llegada triunfal.', 'Llegada Triunfal', 1000000, 2),
(8, 'Estilo único para una entrada inolvidable.', 'Estilo Exclusivo', 1500000, 2),
(9, 'Lujo y glamour en cada detalle de tu llegada.', 'Glamour de Llegada', 2000000, 2),
(10, 'Elegancia y distinción en tu entrada triunfal.', 'Elegancia Distintiva', 2500000, 2),
(11, 'Variedad de opciones para todos los gustos.', 'Variedad en Sabores', 100000, 3),
(12, 'Delicias veganas para una opción saludable.', 'Delicias sin Carne', 200000, 3),
(13, 'Sabrosa carne para los amantes del sabor.', 'Sabor a Carne', 600000, 3),
(14, 'Pastas exquisitas para una opción reconfortante.', 'Delicias Italianas', 800000, 3),
(15, 'Gastronomía griega para una experiencia única.', 'Sabor Mediterráneo', 1000000, 3),
(16, 'Detalles que adornarán tu celebración.', 'Detalles Decorativos', 10000, 4),
(17, 'Elegancia en cada centro de mesa.', 'Elegancia Central', 20000, 4),
(18, 'Centros de mesa que realzarán tu decoración.', 'Centros Destacados', 30000, 4),
(19, 'Toques de color para alegrar tu mesa.', 'Colorido Elegante', 40000, 4),
(20, 'Centros de mesa que serán el centro de atención.', 'Centros Luminosos', 50000, 4),
(21, 'Espacios mágicos para una ceremonia inolvidable.', 'Magia en el Aire', 500000, 5),
(22, 'Locaciones exclusivas para una boda de ensueño.', 'Locaciones de Ensueño', 1000000, 5),
(23, 'Elegancia y estilo en cada rincón de tu boda.', 'Elegancia Única', 1500000, 5),
(24, 'Ambientes que crearán recuerdos inolvidables.', 'Recuerdos Eternos', 2000000, 5),
(25, 'Destinos de ensueño para un día único.', 'Destino de Amor', 2500000, 5),
(26, 'Regalos únicos para un nuevo comienzo.', 'Detalles Especiales', 150000, 6),
(27, 'Opciones exclusivas para una lista de regalos perfecta.', 'Regalos Exclusivos', 300000, 6),
(28, 'Regalos selectos para celebrar tu amor.', 'Selección Premium', 450000, 6),
(29, 'Detalles personalizados para una lista única.', 'Personalización Total', 600000, 6),
(30, 'Regalos exclusivos para una lista de ensueño.', 'Lista de Ensueño', 750000, 6),
(31, 'Música para cada momento de tu boda.', 'Armonía Perfecta', 200000, 7),
(32, 'Ritmos que harán vibrar tu celebración.', 'Energía Contagiosa', 400000, 7),
(33, 'Melodías para una atmósfera mágica.', 'Magia Sonora', 600000, 7),
(34, 'Canciones que marcarán tu día especial.', 'Recuerdos Musicales', 800000, 7),
(35, 'Música que acompañará cada emoción.', 'Emociones Melódicas', 1000000, 7),
(36, 'Delicias que endulzarán tu día especial.', 'Dulces Momentos', 50000, 8),
(37, 'Sabores exquisitos para una celebración única.', 'Sabor Exclusivo', 100000, 8),
(38, 'Pasteles que serán el centro de atención.', 'Centro de Atención', 150000, 8),
(39, 'Dulces tentaciones para una fiesta inolvidable.', 'Tentaciones Deliciosas', 200000, 8),
(40, 'Sabores que deleitarán a todos tus invitados.', 'Deleite de Sabores', 250000, 8),
(41, 'Instantes que perdurarán por siempre.', 'Recuerdos Inmortales', 200000, 9),
(42, 'Fotografías que capturarán tu amor eterno.', 'Amor en Imágenes', 400000, 9),
(43, 'Momentos únicos plasmados para siempre.', 'Momentos Eternos', 600000, 9),
(44, 'Recuerdos que te acompañarán toda la vida.', 'Recuerdos para Siempre', 800000, 9),
(45, 'Imágenes que contarán tu historia de amor.', 'Historia Capturada', 1000000, 9),
(46, 'Invitaciones que reflejarán tu estilo único.', 'Estilo Personalizado', 50000, 10),
(47, 'Invitaciones que cautivarán a tus invitados.', 'Cautivadora Elegancia', 100000, 10),
(48, 'Estilo y elegancia en cada detalle de tu invitación.', 'Elegancia Exclusiva', 150000, 10),
(49, 'Invitaciones que serán el inicio de un gran día.', 'Inicio Inolvidable', 200000, 10),
(50, 'Estilo único para una invitación memorable.', 'Memorias Iniciales', 250000, 10),
(51, ' incluye vuelos, hotel Shangri-La Villingili Maldives de 7 noches con todo incluido, una cena románt', 'Isla Maldivas', 20000000, 11),
(52, 'incluye vuelos, hotel Riad El Fenn de 7 noches con desayuno, una excursión al desierto del Sahara y ', 'Marruecos', 12000000, 11),
(53, 'incluye vuelos, hotel Hotel Danieli 7 noches con desayuno, un paseo en góndola y una entrada a la Ba', 'Venecia', 15000000, 11),
(54, 'incluye vuelos, hotel Cavo Tagoo de 7 noches con desayuno, un beach club en Paradise Beach y una ent', 'Mykonos', 18000000, 11),
(55, 'incluye vuelos, hotel Katikies Santorin de 7 noches con desayuno, una excursión en barco a la calder', 'Santorini', 22000000, 11),
(56, 'Ramo de Rosas Blancas y Ramas Verdes', 'Flores novia 1', 150000, 12),
(57, 'Sueños Florales en Rosa y Rojo', 'Flores novia 2', 200000, 12),
(58, 'Brisa Rosada', 'Flores novia 3', 100000, 12),
(59, 'Sinfonía Floral en Rosa y Verde', 'Flores novia 4', 180000, 12),
(60, 'Danza de Colores', 'Flores novia 5', 120000, 12),
(61, 'Brillo eterno en accesorios elegantes.', 'Brillo Eterno', 350000, 13),
(62, 'Diamantes para brillar en tu día especial.', 'Sueños de Diamante', 1200000, 13),
(63, 'Diseños exclusivos para novias sofisticadas.', 'Joyeria de Lujo', 90000, 13),
(64, 'Piezas únicas para una novia radiante.', 'Joyeria Exclusiva', 120000, 13),
(65, 'Accesorios delicados para una novia encantadora.', 'Toque de Elegancia', 150000, 13),
(66, 'Estilos modernos para una novia radiante.', 'Estilo Vanguardista', 50000, 14),
(67, 'Elegancia clásica en cada peinado.', 'Elegancia Tradicional', 100000, 14),
(68, 'Peinados únicos para una novia sofisticada.', 'Estilo Personalizado', 150000, 14),
(69, 'Diseños de tendencia para una novia moderna.', 'Tendencia Actual', 200000, 14),
(70, 'Romanticismo y delicadeza en cada peinado.', 'Romance Eterno', 250000, 14),
(71, 'Vestidos elegantes para una fiesta inolvidable.', 'Elegancia Nocturna', 100000, 15),
(72, 'Estilo y sofisticación para tu celebración.', 'Estilo Glamoroso', 200000, 15),
(73, 'Diseños exclusivos para una fiesta única.', 'Estilo Exclusivo', 300000, 15),
(74, 'Vestidos de diseñador para una noche especial.', 'Diseño de Autor', 400000, 15),
(75, 'Sofisticación y elegancia en cada detalle.', 'Encanto Nocturno', 500000, 15),
(76, 'Estilo y glamour en cada costura.', 'Estilo Clásico', 200000, 16),
(77, 'Diseños modernos para una novia sofisticada.', 'Elegancia Contemporánea', 400000, 16),
(78, 'Exclusividad y lujo en cada detalle.', 'Estilo Exclusivo', 600000, 16),
(79, 'Vestidos de diseñador para una novia única.', 'Diseño de Autor', 800000, 16),
(80, 'Sofisticación y romance en cada diseño.', 'Encanto Soñador', 1000000, 16),
(81, 'Rosa Piel Romantica', 'Accesorio 1', 30000, 17),
(82, 'Rosa Blush con Encanto', 'Accesorio 2', 45000, 17),
(83, 'Lirio Blanco Impoluto', 'Accesorio 3', 55000, 17),
(84, 'Suculenta Verde con Detalle Rojo', 'Accesorio 4', 25000, 17),
(85, 'Rosa Rosada con Ternura', 'Accesorio 5', 38000, 17),
(86, 'Blanco Elegante: El Sueño Clasico', 'Traje Blanco', 350000, 18),
(87, 'Azul Marino Profundo: Distincion con un Toque Moderno', 'Traje Azul', 850000, 18),
(88, 'Vinotinto Atardecer: Romance Enigmatico', 'Traje Vinotinto', 1200000, 18),
(89, 'Negro Impoluto: El Poder de la Tradicion', 'Traje Negro', 2500000, 18),
(90, 'Gris Versatil: Elegancia para Cualquier Ocasion', 'Traje Gris', 3000000, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`ID`, `nombre`) VALUES
(1, 'Anillo de boda'),
(2, 'Carro de matrimonio'),
(3, 'Catering y banquete'),
(4, 'Decoracion de mesa'),
(5, 'Lugar de ceremonia'),
(6, 'Mesa de regalos'),
(7, 'Musica'),
(8, 'Pastel de boda'),
(9, 'Sesion fotografica'),
(10, 'Tipo de invitaciones'),
(11, 'Luna de miel'),
(12, 'Flores novia'),
(13, 'Joyeria novia'),
(14, 'Peinados novia'),
(15, 'Vestido de fiesta novia'),
(16, 'Vestido de novia'),
(17, 'Accesorios novio'),
(18, 'Traje novio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `ubicacion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD KEY `Usuario_ID` (`Usuario_ID`),
  ADD KEY `Servicios_ID` (`Servicios_ID`),
  ADD KEY `OpcionesServicios_ID` (`OpcionesServicios_ID`);

--
-- Indices de la tabla `opcionesservicios`
--
ALTER TABLE `opcionesservicios`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Servicios_ID` (`Servicios_ID`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`Usuario_ID`) REFERENCES `usuario` (`ID`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`Servicios_ID`) REFERENCES `servicios` (`ID`),
  ADD CONSTRAINT `carrito_ibfk_3` FOREIGN KEY (`OpcionesServicios_ID`) REFERENCES `opcionesservicios` (`ID`);

--
-- Filtros para la tabla `opcionesservicios`
--
ALTER TABLE `opcionesservicios`
  ADD CONSTRAINT `opcionesservicios_ibfk_1` FOREIGN KEY (`Servicios_ID`) REFERENCES `servicios` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
