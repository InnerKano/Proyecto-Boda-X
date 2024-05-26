-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-05-2024 a las 07:54:36
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
(1, 'Blanco Elegante: El Sueño Clasico', 'Traje Blanco', 350000, 1),
(2, 'Azul Marino Profundo: Distincion con un Toque Moderno', 'Traje Azul', 850000, 1),
(3, 'Vinotinto Atardecer: Romance Enigmatico', 'Traje Vinotinto', 1200000, 1),
(4, 'Negro Impoluto: El Poder de la Tradicion', 'Traje Negro', 2500000, 1),
(5, 'Gris Versatil: Elegancia para Cualquier Ocasion', 'Traje Gris', 3000000, 1),
(6, 'Rosa Piel Romantica', 'Accesorio 1', 30000, 2),
(7, 'Rosa Blush con Encanto', 'Accesorio 2', 45000, 2),
(8, 'Lirio Blanco Impoluto', 'Accesorio 3', 55000, 2),
(9, 'Suculenta Verde con Detalle Rojo', 'Accesorio 4', 25000, 2),
(10, 'Rosa Rosada con Ternura', 'Accesorio 5', 38000, 2),
(11, 'Ramo de Rosas Blancas y Ramas Verdes', 'Flores novia 1', 150000, 3),
(12, 'Sueños Florales en Rosa y Rojo', 'Flores novia 2', 200000, 3),
(13, 'Brisa Rosada', 'Flores novia 3', 100000, 3),
(14, 'Sinfonía Floral en Rosa y Verde', 'Flores novia 4', 180000, 3),
(15, 'Danza de Colores', 'Flores novia 5', 120000, 3),
(16, 'Brillo eterno en accesorios elegantes.', 'Brillo Eterno', 350000, 4),
(17, 'Diamantes para brillar en tu día especial.', 'Sueños de Diamante', 1200000, 4),
(18, 'Diseños exclusivos para novias sofisticadas.', 'Joyeria de Lujo', 90000, 4),
(19, 'Piezas únicas para una novia radiante.', 'Joyeria Exclusiva', 120000, 4),
(20, 'Accesorios delicados para una novia encantadora.', 'Toque de Elegancia', 150000, 4),
(21, 'Estilo y glamour en cada costura.', 'Estilo Clásico', 200000, 5),
(22, 'Diseños modernos para una novia sofisticada.', 'Elegancia Contemporánea', 400000, 5),
(23, 'Exclusividad y lujo en cada detalle.', 'Estilo Exclusivo', 600000, 5),
(24, 'Vestidos de diseñador para una novia única.', 'Diseño de Autor', 800000, 5),
(25, 'Sofisticación y romance en cada diseño.', 'Encanto Soñador', 1000000, 5),
(26, 'Estilos modernos para una novia radiante.', 'Estilo Vanguardista', 50000, 6),
(27, 'Elegancia clásica en cada peinado.', 'Elegancia Tradicional', 100000, 6),
(28, 'Peinados únicos para una novia sofisticada.', 'Estilo Personalizado', 150000, 6),
(29, 'Diseños de tendencia para una novia moderna.', 'Tendencia Actual', 200000, 6),
(30, 'Romanticismo y delicadeza en cada peinado.', 'Romance Eterno', 250000, 6),
(31, 'Vestidos elegantes para una fiesta inolvidable.', 'Elegancia Nocturna', 100000, 7),
(32, 'Estilo y sofisticación para tu celebración.', 'Estilo Glamoroso', 200000, 7),
(33, 'Diseños exclusivos para una fiesta única.', 'Estilo Exclusivo', 300000, 7),
(34, 'Vestidos de diseñador para una noche especial.', 'Diseño de Autor', 400000, 7),
(35, 'Sofisticación y elegancia en cada detalle.', 'Encanto Nocturno', 500000, 7),
(36, 'Regalos únicos para un nuevo comienzo.', 'Detalles Especiales', 150000, 8),
(37, 'Opciones exclusivas para una lista de regalos perfecta.', 'Regalos Exclusivos', 300000, 8),
(38, 'Regalos selectos para celebrar tu amor.', 'Selección Premium', 450000, 8),
(39, 'Detalles personalizados para una lista única.', 'Personalización Total', 600000, 8),
(40, 'Regalos exclusivos para una lista de ensueño.', 'Lista de Ensueño', 750000, 8),
(41, 'Música para cada momento de tu boda.', 'Armonía Perfecta', 200000, 9),
(42, 'Ritmos que harán vibrar tu celebración.', 'Energía Contagiosa', 400000, 9),
(43, 'Melodías para una atmósfera mágica.', 'Magia Sonora', 600000, 9),
(44, 'Canciones que marcarán tu día especial.', 'Recuerdos Musicales', 800000, 9),
(45, 'Música que acompañará cada emoción.', 'Emociones Melódicas', 1000000, 9),
(46, 'Decoraciones que transformarán tu ceremonia.', 'Transformación Total', 300000, 10),
(47, 'Ambientes que reflejarán tu amor.', 'Amor en Cada Detalle', 600000, 10),
(48, 'Decoraciones de ensueño para un día único.', 'Ensueño Romántico', 900000, 10),
(49, 'Ambientes que crearán recuerdos inolvidables.', 'Recuerdos Inolvidables', 1200000, 10),
(50, 'Decoraciones que harán brillar tu amor.', 'Brillo de Amor', 1500000, 10),
(51, 'Invitaciones que reflejarán tu estilo único.', 'Estilo Personalizado', 50000, 11),
(52, 'Invitaciones que cautivarán a tus invitados.', 'Cautivadora Elegancia', 100000, 11),
(53, 'Estilo y elegancia en cada detalle de tu invitación.', 'Elegancia Exclusiva', 150000, 11),
(54, 'Invitaciones que serán el inicio de un gran día.', 'Inicio Inolvidable', 200000, 11),
(55, 'Estilo único para una invitación memorable.', 'Memorias Iniciales', 250000, 11),
(56, 'Delicias que endulzarán tu día especial.', 'Dulces Momentos', 50000, 12),
(57, 'Sabores exquisitos para una celebración única.', 'Sabor Exclusivo', 100000, 12),
(58, 'Pasteles que serán el centro de atención.', 'Centro de Atención', 150000, 12),
(59, 'Dulces tentaciones para una fiesta inolvidable.', 'Tentaciones Deliciosas', 200000, 12),
(60, 'Sabores que deleitarán a todos tus invitados.', 'Deleite de Sabores', 250000, 12),
(61, 'Espacios mágicos para una ceremonia inolvidable.', 'Magia en el Aire', 500000, 13),
(62, 'Locaciones exclusivas para una boda de ensueño.', 'Locaciones de Ensueño', 1000000, 13),
(63, 'Elegancia y estilo en cada rincón de tu boda.', 'Elegancia Única', 1500000, 13),
(64, 'Ambientes que crearán recuerdos inolvidables.', 'Recuerdos Eternos', 2000000, 13),
(65, 'Destinos de ensueño para un día único.', 'Destino de Amor', 2500000, 13),
(66, 'Instantes que perdurarán por siempre.', 'Recuerdos Inmortales', 200000, 14),
(67, 'Fotografías que capturarán tu amor eterno.', 'Amor en Imágenes', 400000, 14),
(68, 'Momentos únicos plasmados para siempre.', 'Momentos Eternos', 600000, 14),
(69, 'Recuerdos que te acompañarán toda la vida.', 'Recuerdos para Siempre', 800000, 14),
(70, 'Imágenes que contarán tu historia de amor.', 'Historia Capturada', 1000000, 14),
(71, 'Detalles que adornarán tu celebración.', 'Detalles Decorativos', 10000, 15),
(72, 'Elegancia en cada centro de mesa.', 'Elegancia Central', 20000, 15),
(73, 'Centros de mesa que realzarán tu decoración.', 'Centros Destacados', 30000, 15),
(74, 'Toques de color para alegrar tu mesa.', 'Colorido Elegante', 40000, 15),
(75, 'Centros de mesa que serán el centro de atención.', 'Centros Luminosos', 50000, 15),
(76, 'Variedad de opciones para todos los gustos.', 'Variedad en Sabores', 100000, 16),
(77, 'Delicias veganas para una opción saludable.', 'Delicias sin Carne', 200000, 16),
(78, 'Postres exquisitos para el final perfecto.', 'Dulces Tentaciones', 300000, 16),
(79, 'Ensaladas frescas y comidas frías para todos.', 'Frescura en Cada Bocado', 400000, 16),
(80, 'Barras de carnes frías y quesos para los amantes del sabor.', 'Sabores Tradicionales', 500000, 16),
(81, 'Platos vegetarianos para una opción saludable.', 'Opción Vegetariana', 200000, 17),
(82, 'Delicioso pollo para satisfacer a todos.', 'Pollo Exquisito', 400000, 17),
(83, 'Sabrosa carne para los amantes del sabor.', 'Sabor a Carne', 600000, 17),
(84, 'Pastas exquisitas para una opción reconfortante.', 'Delicias Italianas', 800000, 17),
(85, 'Gastronomía griega para una experiencia única.', 'Sabor Mediterráneo', 1000000, 17),
(86, 'Llega con estilo a tu gran día.', 'Estilo en Movimiento', 500000, 18),
(87, 'Elegancia y lujo para tu llegada triunfal.', 'Llegada Triunfal', 1000000, 18),
(88, 'Estilo único para una entrada inolvidable.', 'Estilo Exclusivo', 1500000, 18),
(89, 'Lujo y glamour en cada detalle de tu llegada.', 'Glamour de Llegada', 2000000, 18),
(90, 'Elegancia y distinción en tu entrada triunfal.', 'Elegancia Distintiva', 2500000, 18),
(91, 'Compromiso sellado con elegancia.', 'Elegancia Comprometida', 300000, 19),
(92, 'Lujo y exclusividad para un compromiso inolvidable.', 'Compromiso Exclusivo', 600000, 19),
(93, 'Compromiso eterno sellado con amor.', 'Amor Eterno', 900000, 19),
(94, 'Compromiso único para una unión especial.', 'Unión Especial', 1200000, 19),
(95, 'Anillo que simboliza un amor duradero.', 'Amor Duradero', 1500000, 19),
(96, 'Compromiso sellado con elegancia.', 'Elegancia Comprometida', 500000, 20),
(97, 'Lujo y exclusividad para un compromiso inolvidable.', 'Compromiso Exclusivo', 1000000, 20),
(98, 'Compromiso eterno sellado con amor.', 'Amor Eterno', 1500000, 20),
(99, 'Compromiso único para una unión especial.', 'Unión Especial', 2000000, 20),
(100, 'Anillo que simboliza un amor duradero.', 'Amor Duradero', 2500000, 20),
(101, ' incluye vuelos, hotel Shangri-La Villingili Maldives de 7 noches con todo incluido, una cena románt', 'Isla Maldivas', 20000000, 21),
(102, 'incluye vuelos, hotel Riad El Fenn de 7 noches con desayuno, una excursión al desierto del Sahara y ', 'Marruecos', 12000000, 21),
(103, 'incluye vuelos, hotel Hotel Danieli 7 noches con desayuno, un paseo en góndola y una entrada a la Ba', 'Venecia', 15000000, 21),
(104, 'incluye vuelos, hotel Cavo Tagoo de 7 noches con desayuno, un beach club en Paradise Beach y una ent', 'Mykonos', 18000000, 21),
(105, 'incluye vuelos, hotel Katikies Santorin de 7 noches con desayuno, una excursión en barco a la calder', 'Santorini', 22000000, 21);

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
(1, 'Traje novio'),
(2, 'Accesorios novio'),
(3, 'Flores novia'),
(4, 'Joyeria novia'),
(5, 'Vestido novia'),
(6, 'Peinados novia'),
(7, 'Vestido fiesta novia'),
(8, 'Mesa de regalos'),
(9, 'Musica'),
(10, 'Decoracion ceremonia'),
(11, 'Tipo de invitaciones'),
(12, 'Pastel de boda'),
(13, 'Lugar ceremonia'),
(14, 'Sesion fotografica'),
(15, 'Centro de mesa'),
(16, 'Catering'),
(17, 'Banquete'),
(18, 'Carro matrimonio'),
(19, 'Anillo boda'),
(20, 'Anillo compromiso'),
(21, 'Destinos luna de miel');

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
