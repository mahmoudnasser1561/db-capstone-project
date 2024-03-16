-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Customer` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customer` (
  `CustomerID` INT NOT NULL,
  `CustomerFirstName` VARCHAR(45) NULL,
  `CustomerLastName` VARCHAR(45) NULL,
  `Email` VARCHAR(255) NULL,
  `ContactNumber` INT(10) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Staff` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `StaffID` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `Email` VARCHAR(255) NULL,
  `ContactNumber` INT(10) NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Address` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Address` (
  `AddressID` INT NOT NULL,
  `StreetAddress` VARCHAR(255) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `PostalCode` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Booking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Booking` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Booking` (
  `BookingID` INT NOT NULL,
  `BookingSlot` DATETIME NULL,
  `CustomerID` INT NULL,
  `StaffID` INT NULL,
  `AddressID` INT NULL,
  `Total Price` VARCHAR(45) NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `StaffID_idx` (`StaffID` ASC) VISIBLE,
  INDEX `AddressID_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `StaffID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonDB`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `AddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `LittleLemonDB`.`Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Orders` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATETIME NULL,
  `DeliveryStatus` VARCHAR(20) NULL,
  `AddressID` INT NULL,
  `BookingID` INT NULL,
  `TotalPrice` DECIMAL NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `BookingID_idx` (`BookingID` ASC) VISIBLE,
  CONSTRAINT `BookingID`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemonDB`.`Booking` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Menu` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `MenuID` INT NOT NULL,
  `MenuItemName` VARCHAR(45) NULL,
  `MenuItemDescription` VARCHAR(255) NULL,
  `MenuPriceItem` DECIMAL NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Order Menu Items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Order Menu Items` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Order Menu Items` (
  `OrderMenuItemsID` INT NOT NULL,
  `OrderID` INT NULL,
  `MenuID` INT NULL,
  `Quantity` INT NULL,
  PRIMARY KEY (`OrderMenuItemsID`),
  INDEX `MenuID_idx` (`MenuID` ASC) VISIBLE,
  INDEX `OrderID_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `MenuID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OrderID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDB`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
