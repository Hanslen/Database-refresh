CREATE SCHEMA `hw2_courses` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
CREATE TABLE `hw2_courses`.`student` (
  `uni` VARCHAR(7) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `department` VARCHAR(45) NOT NULL,
  `second_department` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`uni`),
  UNIQUE INDEX `uni_UNIQUE` (`uni` ASC) );

CREATE TABLE `hw2_courses`.`takes` (
  `uni` VARCHAR(7) NOT NULL,
  `courseID` INT NOT NULL,
  `sessionID` INT NOT NULL,
  `enrollment` VARCHAR(10) NOT NULL DEFAULT 'waitlisted'
  );
CREATE TABLE `hw2_courses`.`score` (
  `uni` VARCHAR(10) NOT NULL,
  `courseID` INT NOT NULL,
  `score` VARCHAR(5) NOT NULL,
  INDEX `uni_idx` (`uni` ASC) ,
  CONSTRAINT `uni`
    FOREIGN KEY (`uni`)
    REFERENCES `hw2_courses`.`student` (`uni`)
    );
CREATE TABLE `hw2_courses`.`department` (
  `departmentID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`departmentID`) );
CREATE TABLE `hw2_courses`.`ta` (
  `uni` VARCHAR(7) NOT NULL,
  `sessionID` INT NOT NULL,
  `courseID` INT NOT NULL,
  PRIMARY KEY (`uni`) );
CREATE TABLE `hw2_courses`.`faculty` (
  `facultyID` VARCHAR(20) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `departmentID` INT NOT NULL,
  PRIMARY KEY (`facultyID`) );
CREATE TABLE `hw2_courses`.`session` (
  `sessionID` INT NOT NULL AUTO_INCREMENT,
  `courseID` INT NOT NULL,
  `time` VARCHAR(20) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `facultyID` VARCHAR(20) NOT NULL,
  `maxStudent` INT NOT NULL,
  `enrolled` INT NOT NULL,
  `waitlisted` INT NOT NULL,
  PRIMARY KEY (`sessionID`) ,
  UNIQUE INDEX `sessionID_UNIQUE` (`sessionID` ASC) );

CREATE TABLE `hw2_courses`.`course` (
  `courseID` INT NOT NULL AUTO_INCREMENT,
  `courseName` VARCHAR(50) NOT NULL,
  `description` VARCHAR(100) NOT NULL DEFAULT 'The instructor has not add any description yet.',
  `semester` VARCHAR(10) NOT NULL,
  `level` VARCHAR(10) NOT NULL,
  `departmentID` INT NOT NULL,
  PRIMARY KEY (`courseID`) );

INSERT INTO `hw2_courses`.`department` (`name`) VALUES ('Computer Science');
INSERT INTO `hw2_courses`.`department` (`name`) VALUES ('Law School');
INSERT INTO `hw2_courses`.`department` (`name`) VALUES ('Business School');
INSERT INTO `hw2_courses`.`department` (`name`) VALUES ('Data Science');
INSERT INTO `hw2_courses`.`department` (`name`) VALUES ('Literature');


INSERT INTO `hw2_courses`.`course` (`courseName`, `description`, `semester`, `level`, `departmentID`) VALUES ('IntroductionToDatabases', 'The fundamentals of databases design and application development using databases: entity-relationship modeling, logical design of relational databases.', 'Autumn', '4000','1');
INSERT INTO `hw2_courses`.`course` (`courseName`, `description`, `semester`, `level`, `departmentID`) VALUES ('Discrete Math', 'Logic and formal proofs', 'Autumn', '3000','1');
INSERT INTO `hw2_courses`.`course` (`courseName`, `semester`, `level`, `departmentID`) VALUES ('Computer Networks', 'Autumn', '4000','1');
INSERT INTO `hw2_courses`.`course` (`courseName`, `description`, `semester`, `level`, `departmentID`) VALUES ('Machine Learning', 'Topics from generative and discriminative machine learning including least squares methods, support vector machines, kernel methods, neural networks, Gaussian distributions, linear classification, linear regression, maximum likelihood, exponential family distributions, Bayesian networks, Bayesian inference, mixture models, the EM algorithm, graphical models and hidden Markov models. Algorithms implemented in MATLAB.', 'Autumn', '4000','1');
INSERT INTO `hw2_courses`.`course` (`courseName`, `semester`, `level`, `departmentID`) VALUES ('Advanced Databases', 'Spring', '6000','1');
INSERT INTO `hw2_courses`.`course` (`courseName`, `description`, `semester`, `level`, `departmentID`) VALUES ('Business Writing', 'Cover letter, resume and formal letter writing', 'Spring', '3000','3');

INSERT INTO `hw2_courses`.`faculty` (`facultyID`, `firstname`, `lastname`, `address`, `email`, `departmentID`) VALUES ('q123', 'Tom', 'Chen', '115st Broadway', 'tomchen@gmail.com','1');
INSERT INTO `hw2_courses`.`faculty` (`facultyID`, `firstname`, `lastname`, `address`, `email`, `departmentID`) VALUES ('f231', 'Bob', 'Wang', '114st Manhattan Ave', 'asdjioa@gmail.com','1');
INSERT INTO `hw2_courses`.`faculty` (`facultyID`, `firstname`, `lastname`, `address`, `email`, `departmentID`) VALUES ('d192', 'May', 'Mak', '115st Broadway', 'd192@columbia.edu','1');
INSERT INTO `hw2_courses`.`faculty` (`facultyID`, `firstname`, `lastname`, `address`, `email`, `departmentID`) VALUES ('p920', 'Sam', 'Lee', '109st Broadway', 'sam@gmail.com','1');
INSERT INTO `hw2_courses`.`faculty` (`facultyID`, `firstname`, `lastname`, `address`, `email`, `departmentID`) VALUES ('j321', 'James', 'Chen', '109st Manhattan Ave', 'jameschen@columbia.edu', '4');
INSERT INTO `hw2_courses`.`faculty` (`facultyID`, `firstname`, `lastname`, `address`, `email`, `departmentID`) VALUES ('h222', 'Paul', 'Lee', '121st Manhattan Ave', 'h222@columbia.edu');
INSERT INTO `hw2_courses`.`faculty` (`facultyID`, `firstname`, `lastname`, `address`, `email`, `departmentID`) VALUES ('a423', 'Amy', 'Ding', '110st Broadway', 'amyding@gmail.com', '2');
INSERT INTO `hw2_courses`.`faculty` (`facultyID`, `firstname`, `lastname`, `address`, `email`, `departmentID`) VALUES ('g415', 'Peter', 'Lee', '111st ManhattanAve', 'peter@columbia.edu', '3');
INSERT INTO `hw2_courses`.`faculty` (`facultyID`, `firstname`, `lastname`, `address`, `email`, `departmentID`) VALUES ('t515', 'Bai', 'Bing', '111st Broadway', 'bai@columbia.edu', '5');

INSERT INTO `hw2_courses`.`session` (`courseID`, `time`, `location`, `facultyID`, `maxStudent`, `enrolled`, `waitlisted`) VALUES ('1', 'TR8:40am-9:55am', 'Math Building227', 'd192', '80', '55', '120');
INSERT INTO `hw2_courses`.`session` (`courseID`, `time`, `location`, `facultyID`, `maxStudent`, `enrolled`, `waitlisted`) VALUES ('1', 'W6:00pm-8:30pm', 'Mudd802', 'd192', '100', '100', '32');
INSERT INTO `hw2_courses`.`session` (`courseID`, `time`, `location`, `facultyID`, `maxStudent`, `enrolled`, `waitlisted`) VALUES ('2', 'MW10:10am-11:25', 'LawSchool277', 'h222', '80', '40', '32');
INSERT INTO `hw2_courses`.`session` (`courseID`, `time`, `location`, `facultyID`, `maxStudent`, `enrolled`, `waitlisted`) VALUES ('3', 'M2:00pm-4:00pm', 'MathBuilding321', 'q123', '80', '80', '5');
INSERT INTO `hw2_courses`.`session` (`courseID`, `time`, `location`, `facultyID`, `maxStudent`, `enrolled`, `waitlisted`) VALUES ('3', 'TR8:40am-9:55am', 'Mudd123', 'p920', '100', '100', '30');
INSERT INTO `hw2_courses`.`session` (`courseID`, `time`, `location`, `facultyID`, `maxStudent`, `enrolled`, `waitlisted`) VALUES ('4', 'M2:00pm-4:00pm', 'Mudd123', 'p920', '100', '95', '32');

INSERT INTO `hw2_courses`.`score` (`uni`, `courseID`, `score`) VALUES ('jc4833', '1', '93');
INSERT INTO `hw2_courses`.`score` (`uni`, `courseID`, `score`) VALUES ('jy1234', '1', '93');
INSERT INTO `hw2_courses`.`score` (`uni`, `courseID`, `score`) VALUES ('vw2222', '2', '87');
INSERT INTO `hw2_courses`.`score` (`uni`, `courseID`, `score`) VALUES ('jc4833', '2', '91');
INSERT INTO `hw2_courses`.`score` (`uni`, `courseID`, `score`) VALUES ('jc4833', '3', '89');
INSERT INTO `hw2_courses`.`score` (`uni`, `courseID`, `score`) VALUES ('jy1234', '3', '93');

INSERT INTO `hw2_courses`.`ta` (`uni`, `sessionID`, `courseID`) VALUES ('jc4833', '1', '1');
INSERT INTO `hw2_courses`.`ta` (`uni`, `sessionID`, `courseID`) VALUES ('jy1234', '2', '1');

INSERT INTO `hw2_courses`.`takes` (`uni`, `courseID`, `sessionID`, `enrollment`) VALUES ('jc4833', '3', '4', 'enrolled');
INSERT INTO `hw2_courses`.`takes` (`uni`, `courseID`, `sessionID`, `enrollment`) VALUES ('jy1234', '4', '6', 'waitlisted');
INSERT INTO `hw2_courses`.`takes` (`uni`, `courseID`, `sessionID`, `enrollment`) VALUES ('vw2222', '1', '2', 'waitlisted');

