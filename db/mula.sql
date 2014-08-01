SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mula
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mula` DEFAULT CHARACTER SET utf8 COLLATE utf8_persian_ci ;
USE `mula` ;

-- -----------------------------------------------------
-- Table `mula`.`beer_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mula`.`beer_type` ;

CREATE TABLE IF NOT EXISTS `mula`.`beer_type` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mula`.`batch`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mula`.`batch` ;

CREATE TABLE IF NOT EXISTS `mula`.`batch` (
  `id` INT NOT NULL,
  `type` INT NULL,
  `details` MEDIUMTEXT NULL,
  `date_in` DATETIME NULL,
  `date_out` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_batch_beer_type_idx` (`type` ASC),
  CONSTRAINT `fk_batch_beer_type`
    FOREIGN KEY (`type`)
    REFERENCES `mula`.`beer_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mula`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mula`.`status` ;

CREATE TABLE IF NOT EXISTS `mula`.`status` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `next` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_status_status_idx` (`next` ASC),
  INDEX `next` (`next` ASC),
  CONSTRAINT `fk_status_status`
    FOREIGN KEY (`next`)
    REFERENCES `mula`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mula`.`container`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mula`.`container` ;

CREATE TABLE IF NOT EXISTS `mula`.`container` (
  `id` INT NOT NULL,
  `code` VARCHAR(16) NULL,
  `capacity` INT NULL,
  `details` MEDIUMTEXT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mula`.`history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mula`.`history` ;

CREATE TABLE IF NOT EXISTS `mula`.`history` (
  `id` INT NOT NULL,
  `source` INT NULL,
  `batch` INT NULL,
  `container` INT NULL,
  `status` INT NULL,
  `details` MEDIUMTEXT NULL,
  `date_in` DATETIME NULL,
  `date_out` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `id_source` (`source` ASC),
  INDEX `id_batch` (`batch` ASC),
  INDEX `id_container` (`container` ASC),
  INDEX `id_status` (`status` ASC),
  CONSTRAINT `fk_history_batch`
    FOREIGN KEY (`batch`)
    REFERENCES `mula`.`batch` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_history_status`
    FOREIGN KEY (`status`)
    REFERENCES `mula`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_history_history`
    FOREIGN KEY (`source`)
    REFERENCES `mula`.`history` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_history_container`
    FOREIGN KEY (`container`)
    REFERENCES `mula`.`container` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
