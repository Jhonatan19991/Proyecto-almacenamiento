-- MySQL Script generated by MySQL Workbench
-- Sun Mar  3 23:37:03 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PROYECTO
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PROYECTO
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PROYECTO` DEFAULT CHARACTER SET utf8 ;
USE `PROYECTO` ;

-- -----------------------------------------------------
-- Table `PROYECTO`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTO`.`Usuario` (
  `IDusuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NOT NULL,
  `Telefono` INT NOT NULL,
  `Correo` VARCHAR(255) NOT NULL,
  `Sexo` ENUM('Hombre', 'Mujer') NULL,
  `Edad` INT NULL,
  PRIMARY KEY (`IDusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROYECTO`.`Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTO`.`Rol` (
  `IDrol` INT NOT NULL AUTO_INCREMENT,
  `User` VARCHAR(255) NOT NULL,
  `Password` VARCHAR(255) NOT NULL,
  `TipoRol` ENUM('Cliente', 'Admin') NOT NULL,
  `IDusuario` INT NOT NULL,
  PRIMARY KEY (`IDrol`, `IDusuario`),
  INDEX `fk_Rol_Usuario1_idx` (`IDusuario` ASC),
  CONSTRAINT `fk_Rol_Usuario1`
    FOREIGN KEY (`IDusuario`)
    REFERENCES `PROYECTO`.`Usuario` (`IDusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROYECTO`.`Promocion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTO`.`Promocion` (
  `IDpromocion` INT NOT NULL AUTO_INCREMENT,
  `Fecha_inicion` DATE NOT NULL,
  `Fecha_final` DATE NOT NULL,
  `Descripcion` VARCHAR(255) NOT NULL,
  `Tipo` ENUM('grupal', 'individual') NOT NULL DEFAULT 'Individual',
  PRIMARY KEY (`IDpromocion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROYECTO`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTO`.`Producto` (
  `IDproducto` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NOT NULL,
  `Talla` ENUM('XS', 'S', 'M', 'L', 'XL') NOT NULL,
  `Precio` DECIMAL(10,2) NOT NULL,
  `Categoria` ENUM('Camiseta', 'Chaqueta', 'Buzos', 'Sudaderas') NOT NULL,
  `Descripcion` VARCHAR(255) NOT NULL,
  `Stock` INT NOT NULL,
  `Imagen` VARCHAR(255) NULL,
  `Tipo` ENUM('Personalizado', 'Deportivo') NOT NULL,
  `Genero` ENUM('Mujeres', 'Hombres','Niños') NOT NULL,
  PRIMARY KEY (`IDproducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROYECTO`.`Promocion_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTO`.`Promocion_producto` (
  `IDproducto` INT NOT NULL,
  `IDpromocion` INT NOT NULL,
  `Descuento` INT NOT NULL,
  PRIMARY KEY (`IDproducto`, `IDpromocion`),
  INDEX `fk_Promocion_producto_Producto1_idx` (`IDproducto` ASC),
  INDEX `fk_Promocion_producto_Promocion1_idx` (`IDpromocion` ASC),
  CONSTRAINT `fk_Promocion_producto_Producto1`
    FOREIGN KEY (`IDproducto`)
    REFERENCES `PROYECTO`.`Producto` (`IDproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Promocion_producto_Promocion1`
    FOREIGN KEY (`IDpromocion`)
    REFERENCES `PROYECTO`.`Promocion` (`IDpromocion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROYECTO`.`Opinion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTO`.`Opinion` (
  `IDopinion` INT NOT NULL AUTO_INCREMENT,
  `Comentario` VARCHAR(255) NOT NULL,
  `Calificacion` ENUM('1', '2', '3', '4', '5') NOT NULL,
  `Fecha` DATETIME NOT NULL,
  `IDproducto` INT NOT NULL,
  `IDusuario` INT NOT NULL,
  PRIMARY KEY (`IDopinion`, `IDproducto`, `IDusuario`),
  INDEX `fk_Reseña_Producto1_idx` (`IDproducto` ASC),
  INDEX `fk_Reseña_Usuario1_idx` (`IDusuario` ASC),
  CONSTRAINT `fk_Reseña_Producto1`
    FOREIGN KEY (`IDproducto`)
    REFERENCES `PROYECTO`.`Producto` (`IDproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reseña_Usuario1`
    FOREIGN KEY (`IDusuario`)
    REFERENCES `PROYECTO`.`Usuario` (`IDusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROYECTO`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTO`.`Compra` (
  `IDcompra` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `Hora` TIME NOT NULL,
  `Total` DECIMAL(10,2) NOT NULL,
  `metodoPago` VARCHAR(50) NOT NULL,
  `IDusuario` INT NOT NULL,
  PRIMARY KEY (`IDcompra`, `IDusuario`),
  INDEX `fk_Compra_Usuario1_idx` (`IDusuario` ASC),
  CONSTRAINT `fk_Compra_Usuario1`
    FOREIGN KEY (`IDusuario`)
    REFERENCES `PROYECTO`.`Usuario` (`IDusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROYECTO`.`Carrito_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTO`.`Carrito_compra` (
  `IDcompra` INT NOT NULL,
  `IDproducto` INT NOT NULL,
  `Cantidad` INT NOT NULL,
  INDEX `fk_Carrito_compra_Compra1_idx` (`IDcompra` ASC),
  PRIMARY KEY (`IDproducto`, `IDcompra`),
  CONSTRAINT `fk_Carrito_compra_Compra1`
    FOREIGN KEY (`IDcompra`)
    REFERENCES `PROYECTO`.`Compra` (`IDcompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Carrito_compra_Producto1`
    FOREIGN KEY (`IDproducto`)
    REFERENCES `PROYECTO`.`Producto` (`IDproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROYECTO`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTO`.`Departamento` (
  `IDdepartamento` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IDdepartamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROYECTO`.`Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTO`.`Ciudad` (
  `IDciudad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `IDdepartamento` INT NOT NULL,
  PRIMARY KEY (`IDciudad`, `IDdepartamento`),
  INDEX `fk_Ciudad_Departamento1_idx` (`IDdepartamento` ASC),
  CONSTRAINT `fk_Ciudad_Departamento1`
    FOREIGN KEY (`IDdepartamento`)
    REFERENCES `PROYECTO`.`Departamento` (`IDdepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROYECTO`.`Detalle_envio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTO`.`Detalle_envio` (
  `IDenvio` INT NOT NULL AUTO_INCREMENT,
  `codigoPostal` INT NOT NULL,
  `Direccion` VARCHAR(255) NOT NULL,
  `Barrio` VARCHAR(255) NOT NULL,
  `estado` ENUM('en proceso', 'enviado', 'entregado') NOT NULL,
  `IDcompra` INT NOT NULL,
  `IDciudad` INT NOT NULL,
  PRIMARY KEY (`IDenvio`, `IDcompra`, `IDciudad`),
  INDEX `fk_Detalle_envio_Compra1_idx` (`IDcompra` ASC),
  INDEX `fk_Detalle_envio_Ciudad1_idx` (`IDciudad` ASC),
  CONSTRAINT `fk_Detalle_envio_Compra1`
    FOREIGN KEY (`IDcompra`)
    REFERENCES `PROYECTO`.`Compra` (`IDcompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_envio_Ciudad1`
    FOREIGN KEY (`IDciudad`)
    REFERENCES `PROYECTO`.`Ciudad` (`IDciudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;