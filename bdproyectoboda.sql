/* ---------------------------------------------------------------------- */
/* Tables                                                                 */
/* ---------------------------------------------------------------------- */

/* ---------------------------------------------------------------------- */
/* Add table "Usuario"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE IF NOT EXISTS `Usuario` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `ubicacion` VARCHAR(45) NOT NULL,
  
  PRIMARY KEY (`ID`)
);

/* ---------------------------------------------------------------------- */
/* Add table "Servicios"                                               */
/* ---------------------------------------------------------------------- */


CREATE TABLE IF NOT EXISTS `Servicios` (
  `ID` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`)
);

/* ---------------------------------------------------------------------- */
/* Add table "OpcionesServicios"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE IF NOT EXISTS `OpcionesServicios` (
  `ID` INT NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `opcion_nombre` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  `Servicios_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  PRIMARY KEY (`precio`),
  FOREIGN KEY (`Servicios_ID`) REFERENCES `Servicios` (`ID`)
);



/* ---------------------------------------------------------------------- */
/* Add table "Carrito"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE IF NOT EXISTS `Carrito` (
  `Usuario_ID` INT NOT NULL,
  `Servicios_ID` INT NOT NULL,
  `OpcionesServicios_ID` INT NOT NULL,
  FOREIGN KEY (`Usuario_ID`) REFERENCES `Usuario` (`ID`),
  FOREIGN KEY (`Servicios_ID`) REFERENCES `Servicios` (`ID`),
  FOREIGN KEY (`OpcionesServicios_ID`) REFERENCES `OpcionesServicios` (`ID`)
);