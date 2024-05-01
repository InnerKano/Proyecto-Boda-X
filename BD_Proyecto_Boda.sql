-- MySQL Workbench Synchronization
-- Generated: 2024-05-01 16:49
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: acano

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `proyectoboda`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

ALTER TABLE `proyectoboda`.`Usuarios` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD UNIQUE INDEX (`nombre_usuario` ASC) VISIBLE,
DROP INDEX `email` ,
DROP INDEX `nombre_usuario` ;
;

CREATE TABLE IF NOT EXISTS `proyectoboda`.`ServiciosBoda` (
  `id` INT(11) NULL DEFAULT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `precio_base` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `proyectoboda`.`OpcionesServicio` (
  `id` INT(11) NULL DEFAULT NULL AUTO_INCREMENT,
  `id_servicio` INT(11) NOT NULL,
  `opcion_nombre` VARCHAR(100) NOT NULL,
  `precio_adicional` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX (`id_servicio` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`id_servicio`)
    REFERENCES `proyectoboda`.`ServiciosBoda` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `proyectoboda`.`CarritoBoda` (
  `id` INT(11) NULL DEFAULT NULL AUTO_INCREMENT,
  `id_opcion` INT(11) NULL DEFAULT NULL,
  `Usuarios_id` INT(11) NOT NULL,
  `ServiciosBoda_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX (`id_opcion` ASC) VISIBLE,
  INDEX `fk_CarritoBoda_Usuarios1_idx` (`Usuarios_id` ASC) VISIBLE,
  INDEX `fk_CarritoBoda_ServiciosBoda1_idx` (`ServiciosBoda_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`id_opcion`)
    REFERENCES `proyectoboda`.`OpcionesServicio` (`id`),
  CONSTRAINT `fk_CarritoBoda_Usuarios1`
    FOREIGN KEY (`Usuarios_id`)
    REFERENCES `proyectoboda`.`Usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CarritoBoda_ServiciosBoda1`
    FOREIGN KEY (`ServiciosBoda_id`)
    REFERENCES `proyectoboda`.`ServiciosBoda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
