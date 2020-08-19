-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_appJuridico
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_appJuridico
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_appJuridico` DEFAULT CHARACTER SET utf8 ;
USE `db_appJuridico` ;

-- -----------------------------------------------------
-- Table `db_appJuridico`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_appJuridico`.`clientes` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(15) NULL,
  `email` VARCHAR(255) NULL,
  `ativo` VARCHAR(1) NULL,
  `datacriacao` DATETIME NOT NULL,
  `datamodificaca` DATETIME NOT NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_appJuridico`.`tipos_processos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_appJuridico`.`tipos_processos` (
  `idtipo_processo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `ativo` VARCHAR(1) NOT NULL,
  `datacriacao` DATETIME NOT NULL,
  `datamodificacao` DATETIME NOT NULL,
  PRIMARY KEY (`idtipo_processo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_appJuridico`.`processos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_appJuridico`.`processos` (
  `idprocesso` INT NOT NULL AUTO_INCREMENT,
  `num.processos` VARCHAR(45) NOT NULL,
  `titulo_processos` VARCHAR(100) NOT NULL,
  `descricao` TEXT NULL,
  `arquivo` VARCHAR(255) NULL,
  `datadoprocesso` DATETIME NOT NULL,
  `dataencerramento` DATETIME NULL,
  `idcliente` INT NOT NULL,
  `idtipo_processo` INT NOT NULL,
  PRIMARY KEY (`idprocesso`),
  INDEX `fk_processos_clientes_idx` (`idcliente` ASC) ,
  INDEX `fk_processos_tipos_processos1_idx` (`idtipo_processo` ASC) ,
  CONSTRAINT `fk_processos_clientes`
    FOREIGN KEY (`idcliente`)
    REFERENCES `db_appJuridico`.`clientes` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_processos_tipos_processos1`
    FOREIGN KEY (`idtipo_processo`)
    REFERENCES `db_appJuridico`.`tipos_processos` (`idtipo_processo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
