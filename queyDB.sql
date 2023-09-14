 -- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema school
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema school
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `school` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `school` ;

-- -----------------------------------------------------
-- Table `school`.`groups_g`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`groups_g` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `groups_gcol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school`.`grades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`grades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `id_group` INT NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gradescol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `grades_ibfk_1` (`id_group` ASC) VISIBLE,
  CONSTRAINT `grades_ibfk_1`
    FOREIGN KEY (`id_group`)
    REFERENCES `school`.`groups_g` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school`.`teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`teachers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `dni` INT NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `dni` (`dni` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school`.`grades_teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`grades_teachers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_grade` INT NOT NULL,
  `id_teacher` INT NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `grades_teacherscol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `grades_teachers_ibfk_1` (`id_grade` ASC) VISIBLE,
  INDEX `grades_teachers_ibfk_2` (`id_teacher` ASC) VISIBLE,
  CONSTRAINT `grades_teachers_ibfk_1`
    FOREIGN KEY (`id_grade`)
    REFERENCES `school`.`grades` (`id`),
  CONSTRAINT `grades_teachers_ibfk_2`
    FOREIGN KEY (`id_teacher`)
    REFERENCES `school`.`teachers` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`students` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `dni` INT NOT NULL,
  `id_grade` INT NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `dni` (`dni` ASC) VISIBLE,
  INDEX `idx_name` (`name` ASC) VISIBLE,
  INDEX `idx_last_name` (`last_name` ASC) VISIBLE,
  INDEX `students_ibfk_1` (`id_grade` ASC) VISIBLE,
  CONSTRAINT `students_ibfk_1`
    FOREIGN KEY (`id_grade`)
    REFERENCES `school`.`grades` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school`.`subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`subjects` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school`.`students_subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`students_subjects` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_student` INT NOT NULL,
  `id_subject` INT NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `students_subjects_ibfk_1` (`id_student` ASC) VISIBLE,
  INDEX `students_subjects_ibfk_2` (`id_subject` ASC) VISIBLE,
  CONSTRAINT `students_subjects_ibfk_1`
    FOREIGN KEY (`id_student`)
    REFERENCES `school`.`students` (`id`),
  CONSTRAINT `students_subjects_ibfk_2`
    FOREIGN KEY (`id_subject`)
    REFERENCES `school`.`subjects` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school`.`teachers_subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`teachers_subjects` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_teacher` INT NOT NULL,
  `id_subject` INT NOT NULL,
  `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `teachers_subjects_ibfk_1` (`id_teacher` ASC) VISIBLE,
  INDEX `teachers_subjects_ibfk_2` (`id_subject` ASC) VISIBLE,
  CONSTRAINT `teachers_subjects_ibfk_1`
    FOREIGN KEY (`id_teacher`)
    REFERENCES `school`.`teachers` (`id`),
  CONSTRAINT `teachers_subjects_ibfk_2`
    FOREIGN KEY (`id_subject`)
    REFERENCES `school`.`subjects` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
