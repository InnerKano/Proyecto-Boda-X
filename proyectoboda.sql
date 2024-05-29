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
  `descripcion` varchar(200) NOT NULL,
  `opcion_nombre` varchar(45) NOT NULL,
  `precio` int(11) NOT NULL,
  `Servicios_ID` int(11) NOT NULL,
  `Seccion_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `opcionesservicios`
--

INSERT INTO `opcionesservicios` (`ID`, `descripcion`, `opcion_nombre`, `precio`, `Servicios_ID`, `Seccion_ID`) VALUES
/* BODA/CEREMONIA */
(1, 'Compromiso sellado con elegancia.', 'Elegancia Comprometida', 300000, 1, 1),
(2, 'Lujo y exclusividad para un compromiso inolvidable.', 'Compromiso Exclusivo', 600000, 1, 1),
(3, 'Compromiso eterno sellado con amor.', 'Amor Eterno', 900000, 1, 1),
(4, 'Compromiso único para una unión especial.', 'Unión Especial', 1200000, 1, 1),
(5, 'Anillo que simboliza un amor duradero.', 'Amor Duradero', 1500000, 1, 1),
(6, 'Llega con estilo a tu gran día.', 'Estilo en Movimiento', 500000, 1, 2),
(7, 'Elegancia y lujo para tu llegada triunfal.', 'Llegada Triunfal', 1000000, 1, 2),
(8, 'Estilo único para una entrada inolvidable.', 'Estilo Exclusivo', 1500000, 1, 2),
(9, 'Lujo y glamour en cada detalle de tu llegada.', 'Glamour de Llegada', 2000000, 1, 2),
(10, 'Elegancia y distinción en tu entrada triunfal.', 'Elegancia Distintiva', 2500000, 1, 2),
(11, 'Variedad de opciones para todos los gustos.', 'Variedad en Sabores', 100000, 1, 3),
(12, 'Delicias veganas para una opción saludable.', 'Delicias sin Carne', 200000, 1, 3),
(13, 'Sabrosa carne para los amantes del sabor.', 'Sabor a Carne', 600000, 1, 3),
(14, 'Pastas exquisitas para una opción reconfortante.', 'Delicias Italianas', 800000, 1, 3),
(15, 'Gastronomía griega para una experiencia única.', 'Sabor Mediterráneo', 1000000, 1, 3),
(16, 'Detalles que adornarán tu celebración.', 'Detalles Decorativos', 10000, 1, 4),
(17, 'Elegancia en cada centro de mesa.', 'Elegancia Central', 20000, 1, 4),
(18, 'Centros de mesa que realzarán tu decoración.', 'Centros Destacados', 30000, 1, 4),
(19, 'Toques de color para alegrar tu mesa.', 'Colorido Elegante', 40000, 1, 4),
(20, 'Centros de mesa que serán el centro de atención.', 'Centros Luminosos', 50000, 1, 4),
(21, 'Espacios mágicos para una ceremonia inolvidable.', 'Magia en el Aire', 500000, 1, 5),
(22, 'Locaciones exclusivas para una boda de ensueño.', 'Locaciones de Ensueño', 1000000, 1, 5),
(23, 'Elegancia y estilo en cada rincón de tu boda.', 'Elegancia Única', 1500000, 1, 5),
(24, 'Ambientes que crearán recuerdos inolvidables.', 'Recuerdos Eternos', 2000000, 1, 5),
(25, 'Destinos de ensueño para un día único.', 'Destino de Amor', 2500000, 1, 5),
(26, 'Regalos únicos para un nuevo comienzo.', 'Detalles Especiales', 150000, 1, 6),
(27, 'Opciones exclusivas para una lista de regalos perfecta.', 'Regalos Exclusivos', 300000, 1, 6),
(28, 'Regalos selectos para celebrar tu amor.', 'Selección Premium', 450000, 1, 6),
(29, 'Detalles personalizados para una lista única.', 'Personalización Total', 600000, 1, 6),
(30, 'Regalos exclusivos para una lista de ensueño.', 'Lista de Ensueño', 750000, 1, 6),
(31, 'Música para cada momento de tu boda.', 'Armonía Perfecta', 200000, 1, 7),
(32, 'Ritmos que harán vibrar tu celebración.', 'Energía Contagiosa', 400000, 1, 7),
(33, 'Melodías para una atmósfera mágica.', 'Magia Sonora', 600000, 1, 7),
(34, 'Canciones que marcarán tu día especial.', 'Recuerdos Musicales', 800000, 1, 7),
(35, 'Música que acompañará cada emoción.', 'Emociones Melódicas', 1000000, 1, 7),
(36, 'Delicias que endulzarán tu día especial.', 'Dulces Momentos', 50000, 1, 8),
(37, 'Sabores exquisitos para una celebración única.', 'Sabor Exclusivo', 100000, 1, 8),
(38, 'Pasteles que serán el centro de atención.', 'Centro de Atención', 150000, 1, 8),
(39, 'Dulces tentaciones para una fiesta inolvidable.', 'Tentaciones Deliciosas', 200000, 1, 8),
(40, 'Sabores que deleitarán a todos tus invitados.', 'Deleite de Sabores', 250000, 1, 8),
(41, 'Instantes que perdurarán por siempre.', 'Recuerdos Inmortales', 200000, 1, 9),
(42, 'Fotografías que capturarán tu amor eterno.', 'Amor en Imágenes', 400000, 1, 9),
(43, 'Momentos únicos plasmados para siempre.', 'Momentos Eternos', 600000, 1, 9),
(44, 'Recuerdos que te acompañarán toda la vida.', 'Recuerdos para Siempre', 800000, 1, 9),
(45, 'Imágenes que contarán tu historia de amor.', 'Historia Capturada', 1000000, 1, 9),
(46, 'Invitaciones que reflejarán tu estilo único.', 'Estilo Personalizado', 50000, 1, 10),
(47, 'Invitaciones que cautivarán a tus invitados.', 'Cautivadora Elegancia', 100000, 1, 10),
(48, 'Estilo y elegancia en cada detalle de tu invitación.', 'Elegancia Exclusiva', 150000, 1, 10),
(49, 'Invitaciones que serán el inicio de un gran día.', 'Inicio Inolvidable', 200000, 1, 10),
(50, 'Estilo único para una invitación memorable.', 'Memorias Iniciales', 250000, 1, 10),
/* LUNA DE MIEL */
(51, 'Un lujoso resort en una isla privada con bungalows sobre el agua. Ofrece vistas impresionantes, spa, y actividades acuáticas.', 'Resort Paradise Island', 4000000, 2, 1),
(52, 'Un refugio tranquilo con villas frente al mar y acceso directo a la playa. Ideal para parejas en busca de privacidad.', 'Isla Maldivas Retreat', 3200000, 2, 1),
(53, 'Un resort boutique con cabañas en la playa, piscina infinita y restaurantes gourmet.', 'Sunset Beach Resort', 5400000, 2, 1),
(54, 'Un alojamiento ecológico con bungalows sostenibles sobre la arena blanca. Perfecto para amantes de la naturaleza.', 'Coral Reef Lodge', 3600000, 2, 1),
(55, 'Un resort todo incluido con actividades de buceo y snorkel. Habitaciones amplias y vistas panorámicas.', 'Blue Lagoon Resort', 6000000, 2, 1),

(56, 'Un riad tradicional en Marrakech con patios interiores, mosaicos y terrazas con vistas a la ciudad.', 'Riad Alhambra', 600000, 2, 2),
(57, 'Un alojamiento en el desierto del Sahara con tiendas de campaña de lujo y excursiones en camello.', 'Desert Oasis Lodge', 800000, 2, 2),
(58, 'Un retiro en las montañas del Atlas con vistas panorámicas, senderismo y auténtica cocina marroquí.', 'Atlas Mountains Retreat', 720000, 2, 2),
(59, 'Una casa de playa en Essaouira con habitaciones elegantes y acceso directo al mar.', 'Essaouira Beach House', 520000, 2, 2),
(60, 'Un palacio restaurado en la medina de Fez con habitaciones decoradas con azulejos y detalles históricos.', 'Fez Medina Palace', 1000000, 2, 2),

(61, 'Este hotel data de 1889 y está ubicado a solo 30 metros de la Plaza de San Marcos. Las habitaciones cuentan con aire acondicionado, muebles elegantes y lámparas de Murano.', 'Antico Panada', 545000, 2, 3),
(62, 'A 100 metros de la Galleria dell’Accademia y a 5 minutos a pie de la colección Peggy Guggenheim, este hotel ofrece habitaciones con aire acondicionado y TV.', 'Domus Cavanis', 5584500, 2, 3),
(63, 'Este hotel ocupa un monasterio restaurado en el tranquilo barrio de Cannaregio, a 100 metros de la estación de tren de Santa Lucía.', 'Hotel Abbazia', 10669500, 2, 3),
(64, 'Cerca de la parada de ferry San Tomà, en el animado barrio universitario de Venecia, el Hotel Tivoli es una excelente opción.', 'Hotel Tivoli', 7364000, 2, 3),
(65, 'Ofrece habitaciones venecianas típicas en un edificio histórico del distrito Cannaregio, a poca distancia a pie del Puente de Rialto.', 'Hotel Mezzo Pozzo', 4189500, 2, 3),

(66, 'Suites de lujo en molinos de viento renovados con vistas al mar Egeo. Piscina infinita y ambiente elegante.', 'Windmill Suites', 1400000, 2, 4),
(67, 'Una villa frente a la playa con acceso privado al mar y jacuzzi al aire libre.', 'Mykonos Beachfront Villa', 2000000, 2, 4),
(68, 'Un apartamento en el corazón de Little Venice con balcones sobre el agua y vistas al atardecer.', 'Little Venice Hideaway', 1260000, 2, 4),
(69, 'Un resort boutique con habitaciones blancas y piscina con vista al mar.', 'Paradise Cove Resort', 1800000, 2, 4),
(70, 'Un retiro tranquilo en una colina con vistas panorámicas y desayuno casero.', 'Aegean Retreat', 1200000, 2, 4),

(71, 'Suites con vistas a la caldera y piscina privada. Decoración minimalista y ambiente romántico.', 'Caldera View Suites', 2400000, 2, 5),
(72, 'Casas cueva en Oia con terrazas privadas y jacuzzi al aire libre.', 'Oia Cave Houses', 3150000, 2, 5),
(73, 'Una villa en lo alto de los acantilados con vistas al mar y puestas de sol inolvidables.', 'Santorini Cliffside Villa', 3600000, 2, 5),
(74, 'Un resort junto a la playa de arena negra con piscina y tumbonas.', 'Perissa Beach Resort', 1800000, 2, 5),
(75, 'Un retiro junto al faro de Akrotiri con jardines y tranquilidad.', 'Akrotiri Lighthouse Retreat', 1575000, 2, 5),



/* NOVIA */
(76, 'Ramo de Rosas Blancas y Ramas Verdes', 'Flores novia 1', 150000, 3, 1),
(77, 'Sueños Florales en Rosa y Rojo', 'Flores novia 2', 200000, 3, 1),
(78, 'Brisa Rosada', 'Flores novia 3', 100000, 3, 1),
(79, 'Sinfonía Floral en Rosa y Verde', 'Flores novia 4', 180000, 3, 1),
(80, 'Danza de Colores', 'Flores novia 5', 120000, 3, 1),
(81, 'Brillo eterno en accesorios elegantes.', 'Brillo Eterno', 350000, 3, 2),
(82, 'Diamantes para brillar en tu día especial.', 'Sueños de Diamante', 1200000, 3, 2),
(83, 'Diseños exclusivos para novias sofisticadas.', 'Joyeria de Lujo', 90000, 3, 2),
(84, 'Piezas únicas para una novia radiante.', 'Joyeria Exclusiva', 120000, 3, 2),
(85, 'Accesorios delicados para una novia encantadora.', 'Toque de Elegancia', 150000, 3, 2),
(86, 'Estilos modernos para una novia radiante.', 'Estilo Vanguardista', 50000, 3, 3),
(87, 'Elegancia clásica en cada peinado.', 'Elegancia Tradicional', 100000, 3, 3),
(88, 'Peinados únicos para una novia sofisticada.', 'Estilo Personalizado', 150000, 3, 3),
(89, 'Diseños de tendencia para una novia moderna.', 'Tendencia Actual', 200000, 3, 3),
(90, 'Romanticismo y delicadeza en cada peinado.', 'Romance Eterno', 250000, 3, 3),
(91, 'Vestidos elegantes para una fiesta inolvidable.', 'Elegancia Nocturna', 100000, 3, 4),
(92, 'Estilo y sofisticación para tu celebración.', 'Estilo Glamoroso', 200000, 3, 4),
(93, 'Diseños exclusivos para una fiesta única.', 'Estilo Exclusivo', 300000, 3, 4),
(94, 'Vestidos de diseñador para una noche especial.', 'Diseño de Autor', 400000, 3, 4),
(95, 'Sofisticación y elegancia en cada detalle.', 'Encanto Nocturno', 500000, 3, 4),
(96, 'Estilo y glamour en cada costura.', 'Estilo Clásico', 200000, 3, 5),
(97, 'Diseños modernos para una novia sofisticada.', 'Elegancia Contemporánea', 400000, 3, 5),
(98, 'Exclusividad y lujo en cada detalle.', 'Estilo Exclusivo', 600000, 3, 5),
(99, 'Vestidos de diseñador para una novia única.', 'Diseño de Autor', 800000, 3, 5),
(100, 'Sofisticación y romance en cada diseño.', 'Encanto Soñador', 1000000, 3, 5),

/* NOVIO */
(101, 'Rosa Piel Romantica', 'Accesorio 1', 30000, 4, 1),
(102, 'Rosa Blush con Encanto', 'Accesorio 2', 45000, 4, 1),
(103, 'Lirio Blanco Impoluto', 'Accesorio 3', 55000, 4, 1),
(104, 'Suculenta Verde con Detalle Rojo', 'Accesorio 4', 25000, 4, 1),
(105, 'Rosa Rosada con Ternura', 'Accesorio 5', 38000, 4, 1),
(106, 'Blanco Elegante: El Sueño Clasico', 'Traje Blanco', 350000, 4, 2),
(107, 'Azul Marino Profundo: Distincion con un Toque Moderno', 'Traje Azul', 850000, 4, 2),
(108, 'Vinotinto Atardecer: Romance Enigmatico', 'Traje Vinotinto', 1200000, 4, 2),
(109, 'Negro Impoluto: El Poder de la Tradicion', 'Traje Negro', 2500000, 4, 2),
(110, 'Gris Versatil: Elegancia para Cualquier Ocasion', 'Traje Gris', 3000000, 4, 2);


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
