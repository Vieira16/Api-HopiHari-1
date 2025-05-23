-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hopi_hari_db` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hopi_hari_db` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema hopi_hari_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hopi_hari_db` ;

-- -----------------------------------------------------
-- Schema hopi_hari_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hopi_hari_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `hopi_hari_db` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopi_hari_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(200) NOT NULL,
  `last_name` VARCHAR(200) NOT NULL,
  `email` VARCHAR(200) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `birth_date` DATE NOT NULL,
  `phone` VARCHAR(200) NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cpf_UNIQUE` (`birth_date` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopi_hari_db`.`Lines` (
  `id_ride` INT NOT NULL,
  `atracoes_id` INT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP GENERATED ALWAYS AS (CURRENT_TIMESTAMP) VIRTUAL,
  PRIMARY KEY (`id_ride`, `created_at`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`atracoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopi_hari_db`.`atracoes` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `waiting_time` INT NULL,
  `status` VARCHAR(200) NULL,
  `area` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`notifications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopi_hari_db`.`notifications` (
  `id_user` INT NOT NULL,
  `status` TINYINT NULL,
  `users_id` INT NOT NULL,
  `atracoes_id` INT NOT NULL,
  PRIMARY KEY (`id_user`),
  INDEX `fk_notifications_users_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_notifications_atracoes1_idx` (`atracoes_id` ASC) VISIBLE,
  CONSTRAINT `fk_notifications_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `hopi_hari_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notifications_atracoes1`
    FOREIGN KEY (`atracoes_id`)
    REFERENCES `hopi_hari_db`.`atracoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `hopi_hari_db` ;

-- -----------------------------------------------------
-- Table `hopi_hari_db`.`atracoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopi_hari_db`.`atracoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `tempo_espera` INT NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `area` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `hopi_hari_db`.`lines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopi_hari_db`.`lines` (
  `id_ride` INT NOT NULL,
  `atracoes_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_ride`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `hopi_hari_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopi_hari_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `birth_date` DATE NOT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `hopi_hari_db`.`notifications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopi_hari_db`.`notifications` (
  `id_user` INT NOT NULL,
  `status` TINYINT NULL DEFAULT NULL,
  `users_id` INT NOT NULL,
  `atracoes_id` INT NOT NULL,
  PRIMARY KEY (`id_user`),
  INDEX `fk_notifications_users_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_notifications_axtracoes1_idx` (`atracoes_id` ASC) VISIBLE,
  CONSTRAINT `fk_notifications_atracoes1`
    FOREIGN KEY (`atracoes_id`)
    REFERENCES `hopi_hari_db`.`atracoes` (`id`),
  CONSTRAINT `fk_notifications_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `hopi_hari_db`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `hopi_hari_db`.`users_has_atracoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopi_hari_db`.`users_has_atracoes` (
  `users_id` INT NOT NULL,
  `atracoes_id` INT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP GENERATED ALWAYS AS (CURRENT_TIMESTAMP) VIRTUAL,
  PRIMARY KEY (`created_at`, `users_id`),
  INDEX `fk_users_has_atracoes_atracoes1_idx` (`atracoes_id` ASC) VISIBLE,
  INDEX `fk_users_has_atracoes_users_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_atracoes_atracoes1`
    FOREIGN KEY (`atracoes_id`)
    REFERENCES `hopi_hari_db`.`atracoes` (`id`),
  CONSTRAINT `fk_users_has_atracoes_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `hopi_hari_db`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;