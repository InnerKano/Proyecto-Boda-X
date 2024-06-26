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
(1, 'Anillo de oro blanco con diamantes.', 'Elegancia Radiante', 3100, 1, 1),
(2, 'Anillo de platino con zafiro azul.', 'Compromiso Real', 6100, 1, 1),
(3, 'Anillo de oro rosa con esmeralda.', 'Amor Brillante', 9200, 1, 1),
(4, 'Anillo de titanio con detalles en oro.', 'Unión Fuerte', 12500, 1, 1),
(5, 'Anillo de plata esterlina con rubí.', 'Amor Encantado', 15200, 1, 1),

(6, 'Carro clásico decorado para bodas.', 'Estilo Clásico', 5200, 1, 2),
(7, 'Limosina de lujo con chofer.', 'Lujo sobre Ruedas', 10500, 1, 2),
(8, 'Carro deportivo exclusivo.', 'Velocidad Elegante', 15300, 1, 2),
(9, 'Carro antiguo restaurado.', 'Vintage Glamour', 20200, 1, 2),
(10, 'Carro eléctrico de alta gama.', 'Eco Chic', 25500, 1, 2),

(11, 'Menú gourmet variado.', 'Gourmet Deluxe', 1200, 1, 3),
(12, 'Buffet vegetariano saludable.', 'Veggie Festín', 2200, 1, 3),
(13, 'Asado argentino de primera calidad.', 'Parrillada Premium', 6200, 1, 3),
(14, 'Selección de pastas artesanales.', 'Italia en la Mesa', 8200, 1, 3),
(15, 'Banquete de mariscos frescos.', 'Mariscos Selectos', 10200, 1, 3),

(16, 'Centros de mesa con flores frescas.', 'Flores Frescas', 150, 1, 4),
(17, 'Decoración con velas aromáticas.', 'Aromas Elegantes', 250, 1, 4),
(18, 'Mantelería fina y elegantes servilletas.', 'Textiles Finos', 350, 1, 4),
(19, 'Accesorios de mesa con temática marina.', 'Tema Marino', 450, 1, 4),
(20, 'Cristalería decorativa y exclusiva.', 'Cristal Brillante', 550, 1, 4),

(21, 'Jardín botánico para bodas.', 'Jardín Encantado', 5200, 1, 5),
(22, 'Salón de eventos con vista panorámica.', 'Vista Panorámica', 10500, 1, 5),
(23, 'Playa privada para ceremonias.', 'Boda en la Playa', 15200, 1, 5),
(24, 'Castillo histórico para bodas.', 'Boda Real', 20200, 1, 5),
(25, 'Cabaña en la montaña para eventos íntimos.', 'Cabaña Romántica', 25500, 1, 5),

(26, 'Lista de regalos con productos artesanales.', 'Artesanías Exclusivas', 1600, 1, 6),
(27, 'Regalos tecnológicos de última generación.', 'Tecnología Avanzada', 3200, 1, 6),
(28, 'Vinos y licores de colección.', 'Colección de Sabores', 4700, 1, 6),
(29, 'Obras de arte personalizadas.', 'Arte Personalizado', 6200, 1, 6),
(30, 'Experiencias de viaje inolvidables.', 'Viajes de Ensueño', 7800, 1, 6),

(31, 'DJ profesional para toda la noche.', 'Noche Inolvidable', 2100, 1, 7),
(32, 'Banda en vivo para animar tu evento.', 'Banda Vibrante', 4200, 1, 7),
(33, 'Quarteto de cuerdas para la ceremonia.', 'Cuerdas Mágicas', 6300, 1, 7),
(34, 'Cantante de jazz para la recepción.', 'Jazz Elegante', 8200, 1, 7),
(35, 'Playlist personalizada para cada momento.', 'Música a Medida', 10500, 1, 7),

(36, 'Pastel de bodas de tres niveles.', 'Tres Niveles', 600, 1, 8),
(37, 'Pastel con temática floral.', 'Flores Dulces', 1200, 1, 8),
(38, 'Pastel con diseño minimalista.', 'Minimalismo Dulce', 1600, 1, 8),
(39, 'Pastel con sabores exóticos.', 'Exotismo Dulce', 2200, 1, 8),
(40, 'Pastel inspirado en cuentos de hadas.', 'Hadas Dulces', 2600, 1, 8),

(41, 'Sesión de fotos pre-boda en exteriores.', 'Preboda al Aire Libre', 2100, 1, 9),
(42, 'Cobertura completa del día de la boda.', 'Día Completo', 4200, 1, 9),
(43, 'Álbum fotográfico personalizado.', 'Álbum Personalizado', 6300, 1, 9),
(44, 'Video resumen de la ceremonia.', 'Video Resumen', 8200, 1, 9),
(45, 'Fotografía artística en locaciones especiales.', 'Arte en Locación', 10500, 1, 9),

(46, 'Invitaciones con diseño floral.', 'Flores Elegantes', 600, 1, 10),
(47, 'Invitaciones con detalles en oro.', 'Oro Brillante', 1200, 1, 10),
(48, 'Invitaciones de estilo vintage.', 'Vintage Chic', 1600, 1, 10),
(49, 'Invitaciones con diseño moderno y minimalista.', 'Moderno Minimalista', 2200, 1, 10),
(50, 'Invitaciones personalizadas con fotos.', 'Fotos Memorables', 2600, 1, 10),

/* LUNA DE MIEL */
(51, 'Un lujoso resort en una isla privada con bungalows sobre el agua. Ofrece vistas impresionantes, spa, y actividades acuáticas.', 'Resort Paradise Island', 41000, 2, 1),
(52, 'Un refugio tranquilo con villas frente al mar y acceso directo a la playa. Ideal para parejas en busca de privacidad.', 'Isla Maldivas Retreat', 32500, 2, 1),
(53, 'Un resort boutique con cabañas en la playa, piscina infinita y restaurantes gourmet.', 'Sunset Beach Resort', 55000, 2, 1),
(54, 'Un alojamiento ecológico con bungalows sostenibles sobre la arena blanca. Perfecto para amantes de la naturaleza.', 'Coral Reef Lodge', 36500, 2, 1),
(55, 'Un resort todo incluido con actividades de buceo y snorkel. Habitaciones amplias y vistas panorámicas.', 'Blue Lagoon Resort', 61000, 2, 1),

(56, 'Un riad tradicional en Marrakech con patios interiores, mosaicos y terrazas con vistas a la ciudad.', 'Riad Alhambra', 6200, 2, 2),
(57, 'Un alojamiento en el desierto del Sahara con tiendas de campaña de lujo y excursiones en camello.', 'Desert Oasis Lodge', 8200, 2, 2),
(58, 'Un retiro en las montañas del Atlas con vistas panorámicas, senderismo y auténtica cocina marroquí.', 'Atlas Mountains Retreat', 7300, 2, 2),
(59, 'Una casa de playa en Essaouira con habitaciones elegantes y acceso directo al mar.', 'Essaouira Beach House', 5300, 2, 2),
(60, 'Un palacio restaurado en la medina de Fez con habitaciones decoradas con azulejos y detalles históricos.', 'Fez Medina Palace', 10200, 2, 2),

(61, 'Este hotel data de 1889 y está ubicado a solo 30 metros de la Plaza de San Marcos. Las habitaciones cuentan con aire acondicionado, muebles elegantes y lámparas de Murano.', 'Antico Panada', 5500, 2, 3),
(62, 'A 100 metros de la Galleria dell’Accademia y a 5 minutos a pie de la colección Peggy Guggenheim, este hotel ofrece habitaciones con aire acondicionado y TV.', 'Domus Cavanis', 55950, 2, 3),
(63, 'Este hotel ocupa un monasterio restaurado en el tranquilo barrio de Cannaregio, a 100 metros de la estación de tren de Santa Lucía.', 'Hotel Abbazia', 10680, 2, 3),
(64, 'Cerca de la parada de ferry San Tomà, en el animado barrio universitario de Venecia, el Hotel Tivoli es una excelente opción.', 'Hotel Tivoli', 73700, 2, 3),
(65, 'Ofrece habitaciones venecianas típicas en un edificio histórico del distrito Cannaregio, a poca distancia a pie del Puente de Rialto.', 'Hotel Mezzo Pozzo', 41900, 2, 3),

(66, 'Suites de lujo en molinos de viento renovados con vistas al mar Egeo. Piscina infinita y ambiente elegante.', 'Windmill Suites', 14200, 2, 4),
(67, 'Una villa frente a la playa con acceso privado al mar y jacuzzi al aire libre.', 'Mykonos Beachfront Villa', 20200, 2, 4),
(68, 'Un apartamento en el corazón de Little Venice con balcones sobre el agua y vistas al atardecer.', 'Little Venice Hideaway', 12700, 2, 4),
(69, 'Un resort boutique con habitaciones blancas y piscina con vista al mar.', 'Paradise Cove Resort', 18200, 2, 4),
(70, 'Un retiro tranquilo en una colina con vistas panorámicas y desayuno casero.', 'Aegean Retreat', 12100, 2, 4),

(71, 'Suites con vistas a la caldera y piscina privada. Decoración minimalista y ambiente romántico.', 'Caldera View Suites', 24200, 2, 5),
(72, 'Casas cueva en Oia con terrazas privadas y jacuzzi al aire libre.', 'Oia Cave Houses', 31800, 2, 5),
(73, 'Una villa en lo alto de los acantilados con vistas al mar y puestas de sol inolvidables.', 'Santorini Cliffside Villa', 36500, 2, 5),
(74, 'Un resort junto a la playa de arena negra con piscina y tumbonas.', 'Perissa Beach Resort', 18200, 2, 5),
(75, 'Un retiro junto al faro de Akrotiri con jardines y tranquilidad.', 'Akrotiri Lighthouse Retreat', 15800, 2, 5),

/* NOVIA */
(76, 'Ramo de lirios blancos y eucalipto.', 'Pureza Floral', 200, 3, 1),
(77, 'Arreglo de tulipanes rosados y amarillos.', 'Primavera Dulce', 250, 3, 1),
(78, 'Bouquet de peonías y rosas rojas.', 'Pasión en Flores', 180, 3, 1),
(79, 'Ramo de orquídeas y hortensias.', 'Elegancia Tropical', 220, 3, 1),
(80, 'Mezcla de flores silvestres y lavanda.', 'Encanto Silvestre', 150, 3, 1),

(81, 'Conjunto de collar y aretes de perlas.', 'Perlas Eternas', 480, 3, 2),
(82, 'Anillo de compromiso con diamante solitario.', 'Brillo de Amor', 1320, 3, 2),
(83, 'Pulsera de oro blanco con zafiros.', 'Reflejos Azules', 130, 3, 2),
(84, 'Collar de esmeraldas y diamantes.', 'Lujo Verde', 160, 3, 2),
(85, 'Aretes de oro rosa con rubíes.', 'Destellos Rosados', 190, 3, 2),

(86, 'Recogido clásico con tiara.', 'Clásico y Elegante', 80, 3, 3),
(87, 'Peinado suelto con ondas suaves.', 'Ondas Románticas', 120, 3, 3),
(88, 'Trenzado bohemio con flores naturales.', 'Trenza Bohemia', 190, 3, 3),
(89, 'Moño bajo con detalles de perlas.', 'Moño Sofisticado', 250, 3, 3),
(90, 'Peinado con velo y corona floral.', 'Corona de Amor', 280, 3, 3),

(91, 'Vestido de fiesta con lentejuelas doradas.', 'Brillo Dorado', 150, 3, 4),
(92, 'Vestido de noche de satén azul.', 'Elegancia Nocturna', 280, 3, 4),
(93, 'Vestido de fiesta con encaje negro.', 'Encaje Nocturno', 370, 3, 4),
(94, 'Vestido de gasa con detalles plateados.', 'Gasa Plateada', 470, 3, 4),
(95, 'Vestido de fiesta rojo con corte sirena.', 'Sirena Encantada', 570, 3, 4),

(96, 'Vestido de novia con encaje y tul.', 'Encanto de Novia', 220, 3, 5),
(97, 'Vestido de novia estilo princesa.', 'Princesa Moderna', 420, 3, 5),
(98, 'Vestido de novia con pedrería.', 'Pedrería Brillante', 650, 3, 5),
(99, 'Vestido de novia vintage.', 'Vintage Elegante', 830, 3, 5),
(100, 'Vestido de novia con cola larga.', 'Majestuosa Cola', 1050, 3, 5),

/* NOVIO */
(101, 'Corbata de seda con diseño geométrico.', 'Corbata Geométrica', 120, 4, 1),
(102, 'Gemelos de plata con iniciales grabadas.', 'Gemelos Personalizados', 180, 4, 1),
(103, 'Reloj de pulsera de acero inoxidable.', 'Reloj Elegante', 270, 4, 1),
(104, 'Fajín de satén con detalles dorados.', 'Fajín Dorado', 150, 4, 1),
(105, 'Pañuelo de bolsillo de lino.', 'Pañuelo Clásico', 220, 4, 1),

(106, 'Traje blanco de lino.', 'Blanco Puro', 390, 4, 2),
(107, 'Traje azul marino con detalles plateados.', 'Marino Distinguido', 880, 4, 2),
(108, 'Traje vinotinto de terciopelo.', 'Terciopelo Elegante', 1300, 4, 2),
(109, 'Traje negro clásico.', 'Negro Intemporal', 2550, 4, 2),
(110, 'Traje gris con corte moderno.', 'Gris Moderno', 3150, 4, 2);
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

-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `ubicacion` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `usuario_id` INT,
  `productos` TEXT,
  `valor_total` DECIMAL(10, 2),
  `fecha_compra` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`usuario_id`) REFERENCES `usuario`(`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--


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
--
-- Filtros para la tabla `opcionesservicios`
--
ALTER TABLE `opcionesservicios`
  ADD CONSTRAINT `opcionesservicios_ibfk_1` FOREIGN KEY (`Servicios_ID`) REFERENCES `servicios` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
