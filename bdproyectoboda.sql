/* ---------------------------------------------------------------------- */
/* Tables                                                                 */
/* ---------------------------------------------------------------------- */

/* ---------------------------------------------------------------------- */
/* Add table "Usuario"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE IF NOT EXISTS `Usuario` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`)
);

/* ---------------------------------------------------------------------- */
/* Add table "Invitados"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE IF NOT EXISTS `Invitados` (
  `Usuario_ID` INT NOT NULL,
  `nombre_inv` VARCHAR(45) NOT NULL,
  `apellido_inv` VARCHAR(45) NOT NULL,
  FOREIGN KEY (`Usuario_ID`) REFERENCES `Usuario` (`ID`)
);

/* ---------------------------------------------------------------------- */
/* Add table "Servicios"                                               */
/* ---------------------------------------------------------------------- */


CREATE TABLE IF NOT EXISTS `Servicios` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `anadirlo` TINYINT NOT NULL,
  PRIMARY KEY (`ID`)
);

/* ---------------------------------------------------------------------- */
/* Add table "OpcionesServicios"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE IF NOT EXISTS `OpcionesServicios` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `opcion_nombre` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  `Servicios_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`Servicios_ID`) REFERENCES `Servicios` (`ID`)
);



/* ---------------------------------------------------------------------- */
/* Add table "Carrito"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE IF NOT EXISTS `Carrito` (
  `Carrito_ID` INT NOT NULL AUTO_INCREMENT,
  `Costo_Total` INT NOT NULL,
  `Usuario_ID` INT NOT NULL,
  `Servicios_ID` INT NOT NULL,
  `OpcionesServicios_ID` INT NOT NULL,
  PRIMARY KEY (`Carrito_ID`),
  FOREIGN KEY (`Usuario_ID`) REFERENCES `Usuario` (`ID`),
  FOREIGN KEY (`Servicios_ID`) REFERENCES `Servicios` (`ID`),
  FOREIGN KEY (`OpcionesServicios_ID`) REFERENCES `OpcionesServicios` (`ID`)
);