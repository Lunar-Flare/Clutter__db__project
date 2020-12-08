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
-- Table `mydb`.`auth_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`auth_group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`django_content_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`django_content_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `app_label` VARCHAR(100) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label` ASC, `model` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 40
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`auth_permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`auth_permission` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `content_type_id` INT NOT NULL,
  `codename` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id` ASC, `codename` ASC) VISIBLE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `mydb`.`django_content_type` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 157
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`auth_group_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`auth_group_permissions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `group_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id` ASC, `permission_id` ASC) VISIBLE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `mydb`.`auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `mydb`.`auth_group` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`auth_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`auth_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(128) NOT NULL,
  `last_login` DATETIME(6) NULL DEFAULT NULL,
  `is_superuser` TINYINT(1) NOT NULL,
  `username` VARCHAR(150) NOT NULL,
  `first_name` VARCHAR(150) NOT NULL,
  `last_name` VARCHAR(150) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `is_staff` TINYINT(1) NOT NULL,
  `is_active` TINYINT(1) NOT NULL,
  `date_joined` DATETIME(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username` (`username` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`auth_user_groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`auth_user_groups` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `group_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id` ASC, `group_id` ASC) VISIBLE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id` ASC) VISIBLE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `mydb`.`auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`auth_user_user_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`auth_user_user_permissions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id` ASC, `permission_id` ASC) VISIBLE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `mydb`.`auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 149
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `idUSER` VARCHAR(45) NOT NULL,
  `USER_FULLNAME` VARCHAR(45) NULL DEFAULT NULL,
  `USER_PHONE_NUMBER` INT NULL DEFAULT NULL,
  `USER_EMAIL` VARCHAR(45) NOT NULL,
  `USER_PASSWORD` VARCHAR(45) NOT NULL,
  `USER_LOCATION` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idUSER`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`media`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`media` (
  `idMEDIA` INT NOT NULL,
  `MEDIA_NAME` VARCHAR(45) NULL DEFAULT NULL,
  `MEDIA_DATE_ADDED` DATE NULL DEFAULT NULL,
  `MEDIA_TYPE` VARCHAR(5) NULL DEFAULT NULL,
  `USER_idUSER` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMEDIA`, `USER_idUSER`),
  INDEX `fk_MEDIA_USER1_idx` (`USER_idUSER` ASC) VISIBLE,
  CONSTRAINT `fk_MEDIA_USER1`
    FOREIGN KEY (`USER_idUSER`)
    REFERENCES `mydb`.`user` (`idUSER`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`book` (
  `BOOK_AUTHOR` VARCHAR(45) NULL DEFAULT NULL,
  `BOOK_BOOKMARK` INT NULL DEFAULT NULL,
  `BOOK_COMPLETION` TINYINT NULL DEFAULT NULL,
  `MEDIA_idMEDIA` INT NOT NULL,
  PRIMARY KEY (`MEDIA_idMEDIA`),
  CONSTRAINT `fk_BOOK_MEDIA1`
    FOREIGN KEY (`MEDIA_idMEDIA`)
    REFERENCES `mydb`.`media` (`idMEDIA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`contacts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`contacts` (
  `idCONTACTS` INT NOT NULL,
  `USER_idUSER` VARCHAR(45) NOT NULL,
  `CONTACT_FIRST_NAME` VARCHAR(45) NULL DEFAULT NULL,
  `CONTACT_MIDDLE_NAME` VARCHAR(45) NULL DEFAULT NULL,
  `CONTACT_LAST_NAME` VARCHAR(45) NULL DEFAULT NULL,
  `CONTACT_PHONE_NUM` INT NULL DEFAULT NULL,
  `CONTACT_NOTE` VARCHAR(255) NULL DEFAULT NULL,
  `CONTACT_LOCATION` VARCHAR(45) NULL DEFAULT NULL,
  `CONTACT_RELATIONSHIP` VARCHAR(45) NULL DEFAULT NULL,
  `CONTACT_BIRTHDAY` DATE NULL DEFAULT NULL,
  `CONTACT_EMAIL` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCONTACTS`, `USER_idUSER`),
  INDEX `fk_CONTACTS_USER1_idx` (`USER_idUSER` ASC) VISIBLE,
  CONSTRAINT `fk_CONTACTS_USER1`
    FOREIGN KEY (`USER_idUSER`)
    REFERENCES `mydb`.`user` (`idUSER`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`django_admin_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`django_admin_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `action_time` DATETIME(6) NOT NULL,
  `object_id` LONGTEXT NULL DEFAULT NULL,
  `object_repr` VARCHAR(200) NOT NULL,
  `action_flag` SMALLINT UNSIGNED NOT NULL,
  `change_message` LONGTEXT NOT NULL,
  `content_type_id` INT NULL DEFAULT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id` ASC) VISIBLE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `mydb`.`django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 218
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`django_migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`django_migrations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `app` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `applied` DATETIME(6) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`django_session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`django_session` (
  `session_key` VARCHAR(40) NOT NULL,
  `session_data` LONGTEXT NOT NULL,
  `expire_date` DATETIME(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  INDEX `django_session_expire_date_a5c62663` (`expire_date` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`event` (
  `idEVENT` INT NOT NULL,
  `idUSER` VARCHAR(45) NOT NULL,
  `EVENT_NAME` VARCHAR(45) NULL DEFAULT NULL,
  `EVENT_LOCATION` VARCHAR(45) NULL DEFAULT NULL,
  `EVENT_DATE` DATE NOT NULL,
  `EVENT_TIME` TIME NULL DEFAULT NULL,
  `EVENT_DESCRIPTION` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idEVENT`, `idUSER`),
  INDEX `fk_EVENT_USER1_idx` (`idUSER` ASC) VISIBLE,
  CONSTRAINT `fk_EVENT_USER1`
    FOREIGN KEY (`idUSER`)
    REFERENCES `mydb`.`user` (`idUSER`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`financial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`financial` (
  `idFINANCIAL` DATETIME NOT NULL,
  `FIN_SAVINGS` FLOAT NOT NULL,
  `FIN_EXPENSES` FLOAT NOT NULL,
  `FIN_EARNED_INCOME` FLOAT NOT NULL,
  `USER_idUSER` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFINANCIAL`, `USER_idUSER`),
  INDEX `fk_FINANCIAL_USER1_idx` (`USER_idUSER` ASC) VISIBLE,
  CONSTRAINT `fk_FINANCIAL_USER1`
    FOREIGN KEY (`USER_idUSER`)
    REFERENCES `mydb`.`user` (`idUSER`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`groups` (
  `idGROUP_NAME` VARCHAR(45) NOT NULL,
  `GROUP_USER_FULLNAME` VARCHAR(45) NULL DEFAULT NULL,
  `GROUP_LEADER` TINYINT NOT NULL,
  PRIMARY KEY (`idGROUP_NAME`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`group_events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`group_events` (
  `GROUPS_idGROUP_NAME` VARCHAR(45) NOT NULL,
  `idGROUP_EVENTS` VARCHAR(8) NULL DEFAULT NULL,
  `GS_EVENT_NAME` VARCHAR(45) NULL DEFAULT NULL,
  `GS_DATE` DATE NULL DEFAULT NULL,
  `GS_TIME` TIME NULL DEFAULT NULL,
  `GS_DESCRIPTION` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`GROUPS_idGROUP_NAME`),
  CONSTRAINT `fk_GROUP_EVENTS_GROUPS1`
    FOREIGN KEY (`GROUPS_idGROUP_NAME`)
    REFERENCES `mydb`.`groups` (`idGROUP_NAME`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`group_notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`group_notes` (
  `GROUPS_idGROUP_NAME` VARCHAR(45) NOT NULL,
  `idGROUP_NOTES` VARCHAR(8) NULL DEFAULT NULL,
  `GN_DESCRIPTION` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`GROUPS_idGROUP_NAME`),
  CONSTRAINT `fk_GROUP_NOTES_GROUPS1`
    FOREIGN KEY (`GROUPS_idGROUP_NAME`)
    REFERENCES `mydb`.`groups` (`idGROUP_NAME`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`group_tasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`group_tasks` (
  `GROUPS_idGROUP_NAME` VARCHAR(45) NOT NULL,
  `idGROUP_TASKS` VARCHAR(45) NULL DEFAULT NULL,
  `GT_DESCRIPTION` VARCHAR(100) NULL DEFAULT NULL,
  `GT_COMPLETION` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`GROUPS_idGROUP_NAME`),
  CONSTRAINT `fk_GROUP_TASKS_GROUPS1`
    FOREIGN KEY (`GROUPS_idGROUP_NAME`)
    REFERENCES `mydb`.`groups` (`idGROUP_NAME`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`inspo_quote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`inspo_quote` (
  `idINSPO_QUOTE` INT NOT NULL,
  `INSPO_DESCRIPTION` VARCHAR(255) NULL DEFAULT NULL,
  `INSPO_AUTHOR` VARCHAR(225) NULL DEFAULT NULL,
  PRIMARY KEY (`idINSPO_QUOTE`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`membership` (
  `GROUPS_idGROUP_NAME` VARCHAR(45) NOT NULL,
  `USER_idUSER` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`GROUPS_idGROUP_NAME`, `USER_idUSER`),
  INDEX `fk_GROUP_MANAGEMENT_has_USER_USER1_idx` (`USER_idUSER` ASC) VISIBLE,
  INDEX `fk_GROUP_MANAGEMENT_has_USER_GROUP_MANAGEMENT1_idx` (`GROUPS_idGROUP_NAME` ASC) VISIBLE,
  CONSTRAINT `fk_GROUP_MANAGEMENT_has_USER_GROUP_MANAGEMENT1`
    FOREIGN KEY (`GROUPS_idGROUP_NAME`)
    REFERENCES `mydb`.`groups` (`idGROUP_NAME`),
  CONSTRAINT `fk_GROUP_MANAGEMENT_has_USER_USER1`
    FOREIGN KEY (`USER_idUSER`)
    REFERENCES `mydb`.`user` (`idUSER`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`memo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`memo` (
  `idMEMO` INT NOT NULL,
  `idUSER` VARCHAR(45) NOT NULL,
  `MEMO_CONTENT` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`idMEMO`, `idUSER`),
  INDEX `fk_MEMO_USER1_idx` (`idUSER` ASC) VISIBLE,
  CONSTRAINT `fk_MEMO_USER1`
    FOREIGN KEY (`idUSER`)
    REFERENCES `mydb`.`user` (`idUSER`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`movie` (
  `MOVIE_LENGTH` TIME NULL DEFAULT NULL,
  `MOVIE_DIRECTOR` VARCHAR(45) NULL DEFAULT NULL,
  `MOVIE_RATING` VARCHAR(45) NULL DEFAULT NULL,
  `MOVIE_COMPLETED` TINYINT NULL DEFAULT NULL,
  `MEDIA_idMEDIA` INT NOT NULL,
  PRIMARY KEY (`MEDIA_idMEDIA`),
  CONSTRAINT `fk_MOVIE_MEDIA1`
    FOREIGN KEY (`MEDIA_idMEDIA`)
    REFERENCES `mydb`.`media` (`idMEDIA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`music`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`music` (
  `MUSIC_GENRE` VARCHAR(45) NULL DEFAULT NULL,
  `MUSIC_ARTIST` VARCHAR(45) NULL DEFAULT NULL,
  `MUSIC_ALBUM` VARCHAR(45) NULL DEFAULT NULL,
  `MEDIA_idMEDIA` INT NOT NULL,
  PRIMARY KEY (`MEDIA_idMEDIA`),
  CONSTRAINT `fk_MUSIC_MEDIA1`
    FOREIGN KEY (`MEDIA_idMEDIA`)
    REFERENCES `mydb`.`media` (`idMEDIA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`shows`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`shows` (
  `EPWATCHED` INT NULL DEFAULT NULL,
  `SHOW_EPTOTAL` INT NULL DEFAULT NULL,
  `SHOW_COMPLETION` INT NULL DEFAULT NULL,
  `MEDIA_idMEDIA` INT NOT NULL,
  PRIMARY KEY (`MEDIA_idMEDIA`),
  CONSTRAINT `fk_SHOWS_MEDIA1`
    FOREIGN KEY (`MEDIA_idMEDIA`)
    REFERENCES `mydb`.`media` (`idMEDIA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mydb`.`tasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tasks` (
  `idTASKS` INT NOT NULL,
  `idUSER` VARCHAR(45) NOT NULL,
  `TASK_DESCRIPTOIN` VARCHAR(100) NULL DEFAULT NULL,
  `TASK_CHECK_DELETION` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`idTASKS`, `idUSER`),
  INDEX `fk_TASKS_USER1_idx` (`idUSER` ASC) VISIBLE,
  CONSTRAINT `fk_TASKS_USER1`
    FOREIGN KEY (`idUSER`)
    REFERENCES `mydb`.`user` (`idUSER`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`view`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`view` (
  `idINSPO_QUOTE` INT NOT NULL,
  `idUSER` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idINSPO_QUOTE`, `idUSER`),
  INDEX `fk_INSPO_QUOTE_has_USER_USER1_idx` (`idUSER` ASC) VISIBLE,
  INDEX `fk_INSPO_QUOTE_has_USER_INSPO_QUOTE1_idx` (`idINSPO_QUOTE` ASC) VISIBLE,
  CONSTRAINT `fk_INSPO_QUOTE_has_USER_INSPO_QUOTE1`
    FOREIGN KEY (`idINSPO_QUOTE`)
    REFERENCES `mydb`.`inspo_quote` (`idINSPO_QUOTE`),
  CONSTRAINT `fk_INSPO_QUOTE_has_USER_USER1`
    FOREIGN KEY (`idUSER`)
    REFERENCES `mydb`.`user` (`idUSER`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `inspo_quote` (`idINSPO_QUOTE`,`INSPO_DESCRIPTION`,`INSPO_AUTHOR`) VALUES (0,'\'you will face many defeats in life, but never let yourself be defeated\'','unknown');
INSERT INTO `inspo_quote` (`idINSPO_QUOTE`,`INSPO_DESCRIPTION`,`INSPO_AUTHOR`) VALUES (1,'it is foolish to fear what we have yet to see and know','unknown');
INSERT INTO `inspo_quote` (`idINSPO_QUOTE`,`INSPO_DESCRIPTION`,`INSPO_AUTHOR`) VALUES (2,'our lives begin to end the day we become silent about things that matter','MLK');
INSERT INTO `inspo_quote` (`idINSPO_QUOTE`,`INSPO_DESCRIPTION`,`INSPO_AUTHOR`) VALUES (3,'intellectual growth should commence at birth and cease only at death','Albert Einstein');
INSERT INTO `inspo_quote` (`idINSPO_QUOTE`,`INSPO_DESCRIPTION`,`INSPO_AUTHOR`) VALUES (4,'Believe in the me that believes in you','unknown');
INSERT INTO `inspo_quote` (`idINSPO_QUOTE`,`INSPO_DESCRIPTION`,`INSPO_AUTHOR`) VALUES (5,'The ticket to the future is always open','Vash The Stampede');
