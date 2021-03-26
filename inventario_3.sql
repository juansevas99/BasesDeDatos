-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema inventario_3_1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `inventario_3_1` ;

-- -----------------------------------------------------
-- Schema inventario_3_1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `inventario_3_1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `inventario_3_1` ;

-- -----------------------------------------------------
-- Table `inventario_3_1`.`medida`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario_3_1`.`medida` ;

CREATE TABLE IF NOT EXISTS `inventario_3_1`.`medida` (
  `id_medida` INT NOT NULL AUTO_INCREMENT,
  `nombre_medida` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_medida`),
  UNIQUE INDEX `nombre_medida` (`nombre_medida` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventario_3_1`.`atributo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario_3_1`.`atributo` ;

CREATE TABLE IF NOT EXISTS `inventario_3_1`.`atributo` (
  `id_atributo` INT NOT NULL AUTO_INCREMENT,
  `nombre_atributo` VARCHAR(45) NOT NULL,
  `medida_id_medida` INT NOT NULL,
  PRIMARY KEY (`id_atributo`),
  UNIQUE INDEX `nombre_atributo` (`nombre_atributo` ASC) VISIBLE,
  INDEX `fk_atributo_medida1_idx` (`medida_id_medida` ASC) VISIBLE,
  CONSTRAINT `fk_atributo_medida1`
    FOREIGN KEY (`medida_id_medida`)
    REFERENCES `inventario_3_1`.`medida` (`id_medida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventario_3_1`.`categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario_3_1`.`categoria` ;

CREATE TABLE IF NOT EXISTS `inventario_3_1`.`categoria` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE INDEX `nombre_categoria_UNIQUE` (`nombre_categoria` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventario_3_1`.`categoria_has_atributo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario_3_1`.`categoria_has_atributo` ;

CREATE TABLE IF NOT EXISTS `inventario_3_1`.`categoria_has_atributo` (
  `categoria_id_categoria` INT NOT NULL,
  `atributo_id_atributo` INT NOT NULL,
  PRIMARY KEY (`categoria_id_categoria`, `atributo_id_atributo`),
  INDEX `fk_categoria_has_atributo_atributo1_idx` (`atributo_id_atributo` ASC) VISIBLE,
  INDEX `fk_categoria_has_atributo_categoria1_idx` (`categoria_id_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_categoria_has_atributo_atributo1`
    FOREIGN KEY (`atributo_id_atributo`)
    REFERENCES `inventario_3_1`.`atributo` (`id_atributo`),
  CONSTRAINT `fk_categoria_has_atributo_categoria1`
    FOREIGN KEY (`categoria_id_categoria`)
    REFERENCES `inventario_3_1`.`categoria` (`id_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventario_3_1`.`estado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario_3_1`.`estado` ;

CREATE TABLE IF NOT EXISTS `inventario_3_1`.`estado` (
  `id_estado` INT NOT NULL AUTO_INCREMENT,
  `nombre_estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_estado`),
  UNIQUE INDEX `nombre_estado_UNIQUE` (`nombre_estado` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventario_3_1`.`marca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario_3_1`.`marca` ;

CREATE TABLE IF NOT EXISTS `inventario_3_1`.`marca` (
  `id_marca` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_marca`),
  UNIQUE INDEX `nombre` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventario_3_1`.`producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario_3_1`.`producto` ;

CREATE TABLE IF NOT EXISTS `inventario_3_1`.`producto` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `referencia_producto` VARCHAR(45) NOT NULL,
  `nombre_producto` VARCHAR(45) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `estado_id_estado` INT NOT NULL,
  `categoria_id_categoria` INT NOT NULL,
  `stock_producto` INT NOT NULL,
  `proveedor_id_proveedor` INT NOT NULL,
  `marca_id_marca` INT NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE INDEX `referencia_producto_UNIQUE` (`referencia_producto` ASC) VISIBLE,
  INDEX `fk_producto_estado_idx` (`estado_id_estado` ASC) VISIBLE,
  INDEX `fk_producto_categoria1_idx` (`categoria_id_categoria` ASC) VISIBLE,
  INDEX `fk_producto_proveedor1_idx` (`proveedor_id_proveedor` ASC) VISIBLE,
  INDEX `fk_producto_marca1_idx` (`marca_id_marca` ASC) VISIBLE,
  CONSTRAINT `fk_producto_categoria1`
    FOREIGN KEY (`categoria_id_categoria`)
    REFERENCES `inventario_3_1`.`categoria` (`id_categoria`),
  CONSTRAINT `fk_producto_estado`
    FOREIGN KEY (`estado_id_estado`)
    REFERENCES `inventario_3_1`.`estado` (`id_estado`),
  CONSTRAINT `fk_producto_marca1`
    FOREIGN KEY (`marca_id_marca`)
    REFERENCES `inventario_3_1`.`marca` (`id_marca`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventario_3_1`.`proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario_3_1`.`proveedor` ;

CREATE TABLE IF NOT EXISTS `inventario_3_1`.`proveedor` (
  `id_proveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `documento` VARCHAR(14) NOT NULL,
  `telefono` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE INDEX `documento` (`documento` ASC) VISIBLE,
  UNIQUE INDEX `nombre_proveedor` (`nombre_proveedor` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventario_3_1`.`OrdenCompra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario_3_1`.`OrdenCompra` ;

CREATE TABLE IF NOT EXISTS `inventario_3_1`.`OrdenCompra` (
  `id_oden_compra` INT NOT NULL AUTO_INCREMENT,
  `referencia_entradas` VARCHAR(45) NOT NULL,
  `lote_entradas` VARCHAR(45) NOT NULL,
  `cantidad` INT NOT NULL,
  `precioUnitario` DECIMAL(10,2) NOT NULL,
  `fecha_creacion_entrada` DATETIME NOT NULL,
  `id_referencia` VARCHAR(45) NOT NULL,
  `producto_id_producto` INT NOT NULL,
  `proveedor_id_proveedor` INT NOT NULL,
  PRIMARY KEY (`id_oden_compra`),
  UNIQUE INDEX `referencia_entradas_UNIQUE` (`referencia_entradas` ASC) VISIBLE,
  UNIQUE INDEX `lote_entradas_UNIQUE` (`lote_entradas` ASC) VISIBLE,
  INDEX `fk_entradas_producto1_idx` (`producto_id_producto` ASC) VISIBLE,
  INDEX `fk_entradas_proveedor1_idx` (`proveedor_id_proveedor` ASC) VISIBLE,
  CONSTRAINT `fk_entradas_producto1`
    FOREIGN KEY (`producto_id_producto`)
    REFERENCES `inventario_3_1`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_entradas_proveedor1`
    FOREIGN KEY (`proveedor_id_proveedor`)
    REFERENCES `inventario_3_1`.`proveedor` (`id_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 32
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventario_3_1`.`tipos_entrada`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario_3_1`.`tipos_entrada` ;

CREATE TABLE IF NOT EXISTS `inventario_3_1`.`tipos_entrada` (
  `id_tipos_entrada` INT NOT NULL,
  `nomnre_tipos_entrada` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipos_entrada`),
  UNIQUE INDEX `nomnre_tipos_entrada_UNIQUE` (`nomnre_tipos_entrada` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventario_3_1`.`detalle_entradas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario_3_1`.`detalle_entradas` ;

CREATE TABLE IF NOT EXISTS `inventario_3_1`.`detalle_entradas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha_creacion` DATETIME NOT NULL,
  `cantidad` INT NOT NULL,
  `observaciones` VARCHAR(250) NULL DEFAULT NULL,
  `id_orden_compra` INT NOT NULL,
  `tipos_entrada_id_tipos_entrada` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_detalle_entradas_OrdenCompra1_idx` (`id_orden_compra` ASC) VISIBLE,
  INDEX `fk_detalle_entradas_tipos_entrada1_idx` (`tipos_entrada_id_tipos_entrada` ASC) VISIBLE,
  CONSTRAINT `fk_detalle_entradas_OrdenCompra1`
    FOREIGN KEY (`id_orden_compra`)
    REFERENCES `inventario_3_1`.`OrdenCompra` (`id_oden_compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_entradas_tipos_entrada1`
    FOREIGN KEY (`tipos_entrada_id_tipos_entrada`)
    REFERENCES `inventario_3_1`.`tipos_entrada` (`id_tipos_entrada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `inventario_3_1`.`tipo_salida`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario_3_1`.`tipo_salida` ;

CREATE TABLE IF NOT EXISTS `inventario_3_1`.`tipo_salida` (
  `id_tipo_salida` INT NOT NULL AUTO_INCREMENT,
  `nombre_tipo_salida` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_salida`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventario_3_1`.`salidas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario_3_1`.`salidas` ;

CREATE TABLE IF NOT EXISTS `inventario_3_1`.`salidas` (
  `id_salidas` INT NOT NULL AUTO_INCREMENT,
  `referencia_salidas` VARCHAR(45) NOT NULL,
  `cantidad_salidas` INT NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `id_tipo_salida` INT NOT NULL,
  `id_orden_compra` INT NOT NULL,
  PRIMARY KEY (`id_salidas`),
  UNIQUE INDEX `referencia_salidas_UNIQUE` (`referencia_salidas` ASC) VISIBLE,
  INDEX `fk_salidas_tipo_salida1_idx` (`id_tipo_salida` ASC) VISIBLE,
  INDEX `fk_salidas_OrdenCompra1_idx` (`id_orden_compra` ASC) VISIBLE,
  CONSTRAINT `fk_salidas_tipo_salida1`
    FOREIGN KEY (`id_tipo_salida`)
    REFERENCES `inventario_3_1`.`tipo_salida` (`id_tipo_salida`),
  CONSTRAINT `fk_salidas_OrdenCompra1`
    FOREIGN KEY (`id_orden_compra`)
    REFERENCES `inventario_3_1`.`OrdenCompra` (`id_oden_compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 48
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventario_3_1`.`valor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario_3_1`.`valor` ;

CREATE TABLE IF NOT EXISTS `inventario_3_1`.`valor` (
  `atributo_id_atributo` INT NOT NULL,
  `producto_id_producto` INT NOT NULL,
  `valor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`atributo_id_atributo`, `producto_id_producto`),
  INDEX `fk_atributo_has_producto_producto1_idx` (`producto_id_producto` ASC) VISIBLE,
  INDEX `fk_atributo_has_producto_atributo1_idx` (`atributo_id_atributo` ASC) VISIBLE,
  CONSTRAINT `fk_atributo_has_producto_atributo1`
    FOREIGN KEY (`atributo_id_atributo`)
    REFERENCES `inventario_3_1`.`atributo` (`id_atributo`),
  CONSTRAINT `fk_atributo_has_producto_producto1`
    FOREIGN KEY (`producto_id_producto`)
    REFERENCES `inventario_3_1`.`producto` (`id_producto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventario_3_1`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario_3_1`.`usuario` ;

CREATE TABLE IF NOT EXISTS `inventario_3_1`.`usuario` (
  `id_usuario` INT NOT NULL,
  `usuario` VARCHAR(10) NOT NULL,
  `correo` VARCHAR(220) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `usuario_UNIQUE` (`usuario` ASC) VISIBLE,
  UNIQUE INDEX `correo_UNIQUE` (`correo` ASC) VISIBLE,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inventario_3_1`.`rol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario_3_1`.`rol` ;

CREATE TABLE IF NOT EXISTS `inventario_3_1`.`rol` (
  `id_rol` INT NOT NULL,
  `rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE INDEX `rol_UNIQUE` (`rol` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inventario_3_1`.`usuario_has_rol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario_3_1`.`usuario_has_rol` ;

CREATE TABLE IF NOT EXISTS `inventario_3_1`.`usuario_has_rol` (
  `usuario_id_usuario` INT NOT NULL,
  `rol_id_rol` INT NOT NULL,
  PRIMARY KEY (`usuario_id_usuario`, `rol_id_rol`),
  INDEX `fk_usuario_has_rol_rol1_idx` (`rol_id_rol` ASC) VISIBLE,
  INDEX `fk_usuario_has_rol_usuario1_idx` (`usuario_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_rol_usuario1`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `inventario_3_1`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_rol_rol1`
    FOREIGN KEY (`rol_id_rol`)
    REFERENCES `inventario_3_1`.`rol` (`id_rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
