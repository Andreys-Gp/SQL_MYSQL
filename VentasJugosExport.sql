-- MySQL Script generated by MySQL Workbench
-- Thu Jan 18 23:42:08 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ventas_jugos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ventas_jugos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ventas_jugos` DEFAULT CHARACTER SET utf32 ;
USE `ventas_jugos` ;

-- -----------------------------------------------------
-- Table `ventas_jugos`.`facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas_jugos`.`facturas` (
  `NUMERO` INT NOT NULL,
  `FECHA` DATE NULL DEFAULT NULL,
  `DNI` INT NOT NULL,
  `MATRICULA` INT NOT NULL,
  `IMPUESTO` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`NUMERO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf32;


-- -----------------------------------------------------
-- Table `ventas_jugos`.`items_facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas_jugos`.`items_facturas` (
  `NUMERO` VARCHAR(5) NOT NULL,
  `CODIGO` VARCHAR(10) NOT NULL,
  `CANTIDAD` INT NULL DEFAULT NULL,
  `PRECIO` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`NUMERO`, `CODIGO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf32;


-- -----------------------------------------------------
-- Table `ventas_jugos`.`tb_clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas_jugos`.`tb_clientes` (
  `DNI` VARCHAR(11) NOT NULL,
  `NOMBRE` VARCHAR(100) NULL DEFAULT NULL,
  `DIRECCION` VARCHAR(150) NULL DEFAULT NULL,
  `BARRIO` VARCHAR(50) NULL DEFAULT NULL,
  `CIUDAD` VARCHAR(50) NULL DEFAULT NULL,
  `ESTADO` VARCHAR(45) NULL DEFAULT NULL,
  `CP` VARCHAR(8) NULL DEFAULT NULL,
  `FECHA_NACIMIENTO` DATE NULL DEFAULT NULL,
  `EDAD` INT NULL DEFAULT NULL,
  `SEXO` VARCHAR(1) NULL DEFAULT NULL,
  `LIMITE_CREDITO` FLOAT NULL DEFAULT NULL,
  `VOLUMEN_COMPRA` FLOAT NULL DEFAULT NULL,
  `PRIMERA_COMPRA` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf32;


-- -----------------------------------------------------
-- Table `ventas_jugos`.`tb_vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas_jugos`.`tb_vendedor` (
  `MATRICULA` VARCHAR(5) NOT NULL,
  `NOMBRE` VARCHAR(100) NULL DEFAULT NULL,
  `BARRIO` VARCHAR(50) NULL DEFAULT NULL,
  `COMISION` FLOAT NULL DEFAULT NULL,
  `FECHA_COMISION` DATE NULL DEFAULT NULL,
  `DE_BACACIONES` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MATRICULA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf32;


-- -----------------------------------------------------
-- Table `ventas_jugos`.`tb_facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas_jugos`.`tb_facturas` (
  `NUMERO` VARCHAR(5) NOT NULL,
  `FECHA` DATE NULL DEFAULT NULL,
  `DNI` VARCHAR(11) NOT NULL,
  `MATRICULA` VARCHAR(5) NOT NULL,
  `IMPUESTO` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`NUMERO`),
  INDEX `FK_CLIENTE` (`DNI` ASC) VISIBLE,
  INDEX `FK_VENDEDOR` (`MATRICULA` ASC) VISIBLE,
  CONSTRAINT `FK_CLIENTE`
    FOREIGN KEY (`DNI`)
    REFERENCES `ventas_jugos`.`tb_clientes` (`DNI`),
  CONSTRAINT `FK_VENDEDOR`
    FOREIGN KEY (`MATRICULA`)
    REFERENCES `ventas_jugos`.`tb_vendedor` (`MATRICULA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf32;


-- -----------------------------------------------------
-- Table `ventas_jugos`.`tb_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas_jugos`.`tb_producto` (
  `CODIGO` VARCHAR(10) NOT NULL,
  `DESCRIPCION` VARCHAR(100) NULL DEFAULT NULL,
  `SABOR` VARCHAR(50) NULL DEFAULT NULL,
  `TAMANO` VARCHAR(50) NULL DEFAULT NULL,
  `ENVASE` VARCHAR(50) NULL DEFAULT NULL,
  `PRECIO_LISTA` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf32;


-- -----------------------------------------------------
-- Table `ventas_jugos`.`tb_items_facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas_jugos`.`tb_items_facturas` (
  `NUMERO` VARCHAR(5) NOT NULL,
  `CODIGO` VARCHAR(10) NOT NULL,
  `CANTIDAD` INT NULL DEFAULT NULL,
  `PRECIO` FLOAT NULL DEFAULT NULL,
  INDEX `FK_PRODUCTO` (`CODIGO` ASC) VISIBLE,
  INDEX `FK_FACTURAS` (`NUMERO` ASC) VISIBLE,
  CONSTRAINT `FK_FACTURAS`
    FOREIGN KEY (`NUMERO`)
    REFERENCES `ventas_jugos`.`tb_facturas` (`NUMERO`),
  CONSTRAINT `FK_PRODUCTO`
    FOREIGN KEY (`CODIGO`)
    REFERENCES `ventas_jugos`.`tb_producto` (`CODIGO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf32;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;