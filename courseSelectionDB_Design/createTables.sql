SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db_hw2_courses
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_hw2_courses` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `db_hw2_courses` ;

-- -----------------------------------------------------
-- Table `db_hw2_courses`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_hw2_courses`.`department` (
  `departmentID` INT NOT NULL AUTO_INCREMENT,
  `departmentName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`departmentID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_hw2_courses`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_hw2_courses`.`student` (
  `uni` VARCHAR(7) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `departmentID` INT NOT NULL,
  PRIMARY KEY (`uni`),
  INDEX `fk_student_department_idx` (`departmentID` ASC),
  CONSTRAINT `fk_student_department`
    FOREIGN KEY (`departmentID`)
    REFERENCES `db_hw2_courses`.`department` (`departmentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_hw2_courses`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_hw2_courses`.`courses` (
  `courseID` INT NOT NULL AUTO_INCREMENT,
  `courseName` VARCHAR(45) NOT NULL,
  `description` VARCHAR(100) NOT NULL DEFAULT 'The instructor has not add any description yet.',
  `semester` VARCHAR(45) NOT NULL,
  `level` VARCHAR(45) NOT NULL,
  `departmentID` INT NOT NULL,
  PRIMARY KEY (`courseID`),
  INDEX `fk_courses_department_idx` (`departmentID` ASC),
  CONSTRAINT `fk_courses_department`
    FOREIGN KEY (`departmentID`)
    REFERENCES `db_hw2_courses`.`department` (`departmentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_hw2_courses`.`score`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_hw2_courses`.`score` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uni` VARCHAR(45) NOT NULL,
  `courseID` INT NOT NULL,
  `score` VARCHAR(45) NOT NULL,
  INDEX `fk_score_courses_idx` (`courseID` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_score_student`
    FOREIGN KEY (`uni`)
    REFERENCES `db_hw2_courses`.`student` (`uni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_score_courses`
    FOREIGN KEY (`courseID`)
    REFERENCES `db_hw2_courses`.`courses` (`courseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_hw2_courses`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_hw2_courses`.`faculty` (
  `facultyID` VARCHAR(45) NOT NULL,
  `departmetnID` INT NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`facultyID`),
  INDEX `fk_faculty_department_idx` (`departmetnID` ASC),
  CONSTRAINT `fk_faculty_department`
    FOREIGN KEY (`departmetnID`)
    REFERENCES `db_hw2_courses`.`department` (`departmentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_hw2_courses`.`section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_hw2_courses`.`section` (
  `sectionID` INT NOT NULL AUTO_INCREMENT,
  `courseID` INT NOT NULL,
  `time` VARCHAR(45) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `facultyID` VARCHAR(45) NOT NULL,
  `maxStudent` INT NOT NULL,
  `enrolled` INT NOT NULL DEFAULT 0,
  `waitlisted` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`sectionID`),
  INDEX `fk_section_courses_idx` (`courseID` ASC),
  INDEX `fk_section_faculty_idx` (`facultyID` ASC),
  CONSTRAINT `fk_section_courses`
    FOREIGN KEY (`courseID`)
    REFERENCES `db_hw2_courses`.`courses` (`courseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_faculty`
    FOREIGN KEY (`facultyID`)
    REFERENCES `db_hw2_courses`.`faculty` (`facultyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_hw2_courses`.`ta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_hw2_courses`.`ta` (
  `uni` VARCHAR(45) NOT NULL,
  `sectionID` INT NOT NULL,
  PRIMARY KEY (`uni`),
  INDEX `fk_ta_section_idx` (`sectionID` ASC),
  CONSTRAINT `fk_ta_student`
    FOREIGN KEY (`uni`)
    REFERENCES `db_hw2_courses`.`student` (`uni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ta_section`
    FOREIGN KEY (`sectionID`)
    REFERENCES `db_hw2_courses`.`section` (`sectionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_hw2_courses`.`student_has_courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_hw2_courses`.`student_has_courses` (
  `student_uni` VARCHAR(7) NOT NULL,
  `courses_courseID` INT NOT NULL,
  PRIMARY KEY (`student_uni`, `courses_courseID`),
  INDEX `fk_student_has_courses_courses1_idx` (`courses_courseID` ASC),
  INDEX `fk_student_has_courses_student1_idx` (`student_uni` ASC),
  CONSTRAINT `fk_student_has_courses_student1`
    FOREIGN KEY (`student_uni`)
    REFERENCES `db_hw2_courses`.`student` (`uni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_courses_courses1`
    FOREIGN KEY (`courses_courseID`)
    REFERENCES `db_hw2_courses`.`courses` (`courseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_hw2_courses`.`student_has_section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_hw2_courses`.`student_has_section` (
  `uni` VARCHAR(7) NOT NULL,
  `sectionID` INT NOT NULL,
  `enrolled` VARCHAR(45) NOT NULL DEFAULT 'waitlisted',
  INDEX `fk_student_has_section_section1_idx` (`sectionID` ASC),
  CONSTRAINT `fk_student_has_section_student1`
    FOREIGN KEY (`uni`)
    REFERENCES `db_hw2_courses`.`student` (`uni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_section_section1`
    FOREIGN KEY (`sectionID`)
    REFERENCES `db_hw2_courses`.`section` (`sectionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
