-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`USER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`USER` (
  `idUSER` VARCHAR(7) NOT NULL,
  `USER_FULLNAME` VARCHAR(45) NULL,
  `USER_PHONE_NUMBER` INT NULL,
  `USER_EMAIL` VARCHAR(45) NOT NULL,
  `USER_PASSWORD` VARCHAR(45) NOT NULL,
  `USER_LOCATION` VARCHAR(45) NULL,
  PRIMARY KEY (`idUSER`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MEMO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MEMO` (
  `idMEMO` VARCHAR(8) NOT NULL,
  `USER_idUSER` VARCHAR(7) NOT NULL,
  `MEMO_CONTENT` VARCHAR(255) NULL,
  PRIMARY KEY (`idMEMO`, `USER_idUSER`),
  INDEX `fk_MEMO_USER1_idx` (`USER_idUSER` ASC) VISIBLE,
  CONSTRAINT `fk_MEMO_USER1`
    FOREIGN KEY (`USER_idUSER`)
    REFERENCES `mydb`.`USER` (`idUSER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CONTACTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CONTACTS` (
  `idCONTACTS` VARCHAR(7) NOT NULL,
  `USER_idUSER` VARCHAR(7) NOT NULL,
  `CONTACT_FIRST_NAME` VARCHAR(45) NULL,
  `CONTACT_MIDDLE_NAME` VARCHAR(45) NULL,
  `CONTACT_LAST_NAME` VARCHAR(45) NULL,
  `CONTACT_PHONE_NUM` INT NULL,
  `CONTACT_NOTE` VARCHAR(255) NULL,
  `CONTACT_LOCATION` VARCHAR(45) NULL,
  `CONTACT_RELATIONSHIP` VARCHAR(45) NULL,
  `CONTACT_BIRTHDAY` DATE NULL,
  `CONTACT_EMAIL` VARCHAR(45) NULL,
  PRIMARY KEY (`idCONTACTS`, `USER_idUSER`),
  INDEX `fk_CONTACTS_USER1_idx` (`USER_idUSER` ASC) VISIBLE,
  CONSTRAINT `fk_CONTACTS_USER1`
    FOREIGN KEY (`USER_idUSER`)
    REFERENCES `mydb`.`USER` (`idUSER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TASKS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TASKS` (
  `idTASKS` VARCHAR(7) NOT NULL,
  `USER_idUSER` VARCHAR(7) NOT NULL,
  `TASK_DESCRIPTOIN` VARCHAR(100) NULL,
  `TASK_CHECK_DELETION` TINYINT NOT NULL,
  PRIMARY KEY (`idTASKS`, `USER_idUSER`),
  INDEX `fk_TASKS_USER1_idx` (`USER_idUSER` ASC) VISIBLE,
  CONSTRAINT `fk_TASKS_USER1`
    FOREIGN KEY (`USER_idUSER`)
    REFERENCES `mydb`.`USER` (`idUSER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MEDIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MEDIA` (
  `idMEDIA` VARCHAR(7) NOT NULL,
  `MEDIA_NAME` VARCHAR(45) NULL,
  `MEDIA_DATE_ADDED` DATE NULL,
  `MEDIA_TYPE` VARCHAR(5) NULL,
  `MEDIA_COMPLETION` INT NOT NULL,
  `USER_idUSER` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMEDIA`, `USER_idUSER`),
  INDEX `fk_MEDIA_USER1_idx` (`USER_idUSER` ASC) VISIBLE,
  CONSTRAINT `fk_MEDIA_USER1`
    FOREIGN KEY (`USER_idUSER`)
    REFERENCES `mydb`.`USER` (`idUSER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BOOK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BOOK` (
  `BOOK_AUTHOR` VARCHAR(45) NULL,
  `BOOK_BOOKMARK` INT NOT NULL,
  `MEDIA_idMEDIA` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`MEDIA_idMEDIA`),
  CONSTRAINT `fk_BOOK_MEDIA1`
    FOREIGN KEY (`MEDIA_idMEDIA`)
    REFERENCES `mydb`.`MEDIA` (`idMEDIA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MOVIE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MOVIE` (
  `MOVIE_LENGTH` TIME NULL,
  `MOVIE_DIRECTOR` VARCHAR(45) NULL,
  `MOVIE_RATING` VARCHAR(45) NULL,
  `MEDIA_idMEDIA` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`MEDIA_idMEDIA`),
  CONSTRAINT `fk_MOVIE_MEDIA1`
    FOREIGN KEY (`MEDIA_idMEDIA`)
    REFERENCES `mydb`.`MEDIA` (`idMEDIA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MUSIC`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MUSIC` (
  `MUSIC_GENRE` VARCHAR(45) NULL,
  `MUSIC_ARTIST` VARCHAR(45) NULL,
  `MUSIC_ALBUM` VARCHAR(45) NULL,
  `MEDIA_idMEDIA` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`MEDIA_idMEDIA`),
  CONSTRAINT `fk_MUSIC_MEDIA1`
    FOREIGN KEY (`MEDIA_idMEDIA`)
    REFERENCES `mydb`.`MEDIA` (`idMEDIA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FINANCIAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FINANCIAL` (
  `idFINANCIAL` DATETIME NOT NULL,
  `FIN_SAVINGS` FLOAT NOT NULL,
  `FIN_EXPENSES` FLOAT NOT NULL,
  `FIN_EARNED_INCOME` FLOAT NOT NULL,
  `USER_idUSER` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`idFINANCIAL`, `USER_idUSER`),
  INDEX `fk_FINANCIAL_USER1_idx` (`USER_idUSER` ASC) VISIBLE,
  CONSTRAINT `fk_FINANCIAL_USER1`
    FOREIGN KEY (`USER_idUSER`)
    REFERENCES `mydb`.`USER` (`idUSER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EVENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EVENT` (
  `idEVENT` VARCHAR(7) NOT NULL,
  `USER_idUSER` VARCHAR(7) NOT NULL,
  `EVENT_NAME` VARCHAR(45) NULL,
  `EVENT_LOCATION` VARCHAR(45) NULL,
  `EVENT_DATE` DATE NOT NULL,
  `EVENT_TIME` TIME NULL,
  `EVENT_DESCRIPTION` VARCHAR(45) NULL,
  PRIMARY KEY (`idEVENT`, `USER_idUSER`),
  INDEX `fk_EVENT_USER1_idx` (`USER_idUSER` ASC) VISIBLE,
  CONSTRAINT `fk_EVENT_USER1`
    FOREIGN KEY (`USER_idUSER`)
    REFERENCES `mydb`.`USER` (`idUSER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`INSPO_QUOTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`INSPO_QUOTE` (
  `idINSPO_QUOTE` INT NOT NULL,
  `INSPO_DESCRIPTION` VARCHAR(255) NULL,
  `INSPO_AUTHOR` VARCHAR(255) NULL,
  PRIMARY KEY (`idINSPO_QUOTE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GROUPS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GROUPS` (
  `idGROUP_NAME` VARCHAR(45) NOT NULL,
  `GROUP_USER_FULLNAME` VARCHAR(45) NULL,
  `GROUP_LEADER` TINYINT NOT NULL,
  PRIMARY KEY (`idGROUP_NAME`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MEMBERSHIP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MEMBERSHIP` (
  `GROUPS_idGROUP_NAME` VARCHAR(45) NOT NULL,
  `USER_idUSER` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`GROUPS_idGROUP_NAME`, `USER_idUSER`),
  INDEX `fk_GROUP_MANAGEMENT_has_USER_USER1_idx` (`USER_idUSER` ASC) VISIBLE,
  INDEX `fk_GROUP_MANAGEMENT_has_USER_GROUP_MANAGEMENT1_idx` (`GROUPS_idGROUP_NAME` ASC) VISIBLE,
  CONSTRAINT `fk_GROUP_MANAGEMENT_has_USER_GROUP_MANAGEMENT1`
    FOREIGN KEY (`GROUPS_idGROUP_NAME`)
    REFERENCES `mydb`.`GROUPS` (`idGROUP_NAME`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GROUP_MANAGEMENT_has_USER_USER1`
    FOREIGN KEY (`USER_idUSER`)
    REFERENCES `mydb`.`USER` (`idUSER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VIEW`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VIEW` (
  `idINSPO_QUOTE` INT NOT NULL,
  `idUSER` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`idINSPO_QUOTE`, `idUSER`),
  INDEX `fk_INSPO_QUOTE_has_USER_USER1_idx` (`idUSER` ASC) VISIBLE,
  INDEX `fk_INSPO_QUOTE_has_USER_INSPO_QUOTE1_idx` (`idINSPO_QUOTE` ASC) VISIBLE,
  CONSTRAINT `fk_INSPO_QUOTE_has_USER_INSPO_QUOTE1`
    FOREIGN KEY (`idINSPO_QUOTE`)
    REFERENCES `mydb`.`INSPO_QUOTE` (`idINSPO_QUOTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INSPO_QUOTE_has_USER_USER1`
    FOREIGN KEY (`idUSER`)
    REFERENCES `mydb`.`USER` (`idUSER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GROUP_TASKS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GROUP_TASKS` (
  `GROUPS_idGROUP_NAME` VARCHAR(45) NOT NULL,
  `idGROUP_TASKS` VARCHAR(45) NULL,
  `GT_DESCRIPTION` VARCHAR(100) NULL,
  `GT_COMPLETION` TINYINT NULL,
  PRIMARY KEY (`GROUPS_idGROUP_NAME`),
  CONSTRAINT `fk_GROUP_TASKS_GROUPS1`
    FOREIGN KEY (`GROUPS_idGROUP_NAME`)
    REFERENCES `mydb`.`GROUPS` (`idGROUP_NAME`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GROUP_NOTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GROUP_NOTES` (
  `GROUPS_idGROUP_NAME` VARCHAR(45) NOT NULL,
  `idGROUP_NOTES` VARCHAR(8) NULL,
  `GN_DESCRIPTION` VARCHAR(100) NULL,
  PRIMARY KEY (`GROUPS_idGROUP_NAME`),
  CONSTRAINT `fk_GROUP_NOTES_GROUPS1`
    FOREIGN KEY (`GROUPS_idGROUP_NAME`)
    REFERENCES `mydb`.`GROUPS` (`idGROUP_NAME`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GROUP_EVENTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GROUP_EVENTS` (
  `GROUPS_idGROUP_NAME` VARCHAR(45) NOT NULL,
  `idGROUP_EVENTS` VARCHAR(8) NULL,
  `GS_EVENT_NAME` VARCHAR(45) NULL,
  `GS_DATE` DATE NULL,
  `GS_TIME` TIME NULL,
  `GS_DESCRIPTION` VARCHAR(100) NULL,
  PRIMARY KEY (`GROUPS_idGROUP_NAME`),
  CONSTRAINT `fk_GROUP_EVENTS_GROUPS1`
    FOREIGN KEY (`GROUPS_idGROUP_NAME`)
    REFERENCES `mydb`.`GROUPS` (`idGROUP_NAME`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SHOWS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SHOWS` (
  `EPWATCHED` INT NULL,
  `SHOW_EPTOTAL` INT NULL,
  `MEDIA_idMEDIA` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`MEDIA_idMEDIA`),
  CONSTRAINT `fk_SHOWS_MEDIA1`
    FOREIGN KEY (`MEDIA_idMEDIA`)
    REFERENCES `mydb`.`MEDIA` (`idMEDIA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


desc USER;
desc MEMO;
desc CONTACTS;
desc TASKS;
desc MEDIA;
desc MOVIE;
desc BOOK;
desc MUSIC;
desc SHOWS;
desc FINANCIAL;
desc EVENT;
desc INSPO_QUOTE;
desc `GROUPS`;
desc GROUP_TASKS;
desc GROUP_EVENTS;
desc MEMBERSHIP;
desc VIEW;
desc GROUP_NOTES;


INSERT INTO `INSPO_QUOTE` (`idINSPO_QUOTE`,`INSPO_DESCRIPTION`,`INSPO_AUTHOR`) VALUES (0,'\'you will face many defeats in life, but never let yourself be defeated\'','unknown');
INSERT INTO `INSPO_QUOTE` (`idINSPO_QUOTE`,`INSPO_DESCRIPTION`,`INSPO_AUTHOR`) VALUES (1,'it is foolish to fear what we have yet to see and know','unknown');
INSERT INTO `INSPO_QUOTE` (`idINSPO_QUOTE`,`INSPO_DESCRIPTION`,`INSPO_AUTHOR`) VALUES (2,'our lives begin to end the day we become silent about things that matter','MLK');
INSERT INTO `INSPO_QUOTE` (`idINSPO_QUOTE`,`INSPO_DESCRIPTION`,`INSPO_AUTHOR`) VALUES (3,'intellectual growth should commence at birth and cease only at death','Albert Einstein');
INSERT INTO `INSPO_QUOTE` (`idINSPO_QUOTE`,`INSPO_DESCRIPTION`,`INSPO_AUTHOR`) VALUES (4,'Believe in the me that believes in you','unknown');
INSERT INTO `INSPO_QUOTE` (`idINSPO_QUOTE`,`INSPO_DESCRIPTION`,`INSPO_AUTHOR`) VALUES (5,'The ticket to the future is always open','Vash The Stampede');

