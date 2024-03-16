-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema initial
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema initial
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `initial` DEFAULT CHARACTER SET utf8 ;
USE `initial` ;

-- -----------------------------------------------------
-- Table `initial`.`menuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `initial`.`menuItems` (
  `menuItemsID` INT NOT NULL,
  `courseName` VARCHAR(45) NOT NULL,
  `starterName` VARCHAR(45) NOT NULL,
  `desertName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`menuItemsID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `initial`.`menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `initial`.`menus` (
  `menuID` INT NOT NULL,
  `menuItemsID` INT NOT NULL,
  `menuName` VARCHAR(45) NOT NULL,
  `cuisine` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`menuID`),
  INDEX `menu_items_id_fk_idx` (`menuItemsID` ASC) VISIBLE,
  CONSTRAINT `menu_items_id_fk`
    FOREIGN KEY (`menuItemsID`)
    REFERENCES `initial`.`menuItems` (`menuItemsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `initial`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `initial`.`customers` (
  `customerID` INT NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `contactNumber` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `initial`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `initial`.`orders` (
  `orderID` INT NOT NULL,
  `menuID` INT NOT NULL,
  `customerID` INT NOT NULL,
  `cost` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`orderID`),
  INDEX `menu_id_fk_idx` (`menuID` ASC) VISIBLE,
  INDEX `customer_id_fk_idx` (`customerID` ASC) VISIBLE,
  CONSTRAINT `menu_id_fk`
    FOREIGN KEY (`menuID`)
    REFERENCES `initial`.`menus` (`menuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`customerID`)
    REFERENCES `initial`.`customers` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

