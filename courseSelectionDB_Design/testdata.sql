-- department data
INSERT INTO `db_hw2_courses`.`department` (`departmentName`) VALUES ('Computer Science');
INSERT INTO `db_hw2_courses`.`department` (`departmentName`) VALUES ('Business School');
INSERT INTO `db_hw2_courses`.`department` (`departmentName`) VALUES ('Chemistry Department');
INSERT INTO `db_hw2_courses`.`department` (`departmentName`) VALUES ('Law School');

-- faculty data
INSERT INTO `db_hw2_courses`.`faculty` (`facultyID`, `departmetnID`, `firstName`, `lastName`, `address`, `email`) VALUES ('q1234', '1', 'Sam', 'Chen', '321 115st Broadway', 'q1234@columbia.edu');
INSERT INTO `db_hw2_courses`.`faculty` (`facultyID`, `departmetnID`, `firstName`, `lastName`, `address`, `email`) VALUES ('w1234', '1', 'Paul', 'Wang', '321 115st Broadway', 'w1234@columbia.edu');
INSERT INTO `db_hw2_courses`.`faculty` (`facultyID`, `departmetnID`, `firstName`, `lastName`, `address`, `email`) VALUES ('e1234', '1', 'Jack', 'Lee', '499 109st ManhattanAve', 'e1234@columbia.edu');
INSERT INTO `db_hw2_courses`.`faculty` (`facultyID`, `departmetnID`, `firstName`, `lastName`, `address`, `email`) VALUES ('r1234', '1', 'James', 'Ding', '333 114st Manhattan Ave', 'r1234@columbia.edu');
INSERT INTO `db_hw2_courses`.`faculty` (`facultyID`, `departmetnID`, `firstName`, `lastName`, `address`, `email`) VALUES ('a1234', '2', 'Amy', 'Chen', '124 Riverside', 'a1234@columbia.edu');
INSERT INTO `db_hw2_courses`.`faculty` (`facultyID`, `departmetnID`, `firstName`, `lastName`, `address`, `email`) VALUES ('s1234', '2', 'John', 'Lee', '55th ABC department 2F', 's1234@columbia.edu');
INSERT INTO `db_hw2_courses`.`faculty` (`facultyID`, `departmetnID`, `firstName`, `lastName`, `address`, `email`) VALUES ('z1234', '3', 'Mike', 'Lee', '110st Amsterdam Ave', 'z1234@columbia.edu');
INSERT INTO `db_hw2_courses`.`faculty` (`facultyID`, `departmetnID`, `firstName`, `lastName`, `address`, `email`) VALUES ('x1234', '3', 'Tim', 'Zhang', '55th ABC department 2F', 'x1234@columbia.edu');
INSERT INTO `db_hw2_courses`.`faculty` (`facultyID`, `departmetnID`, `firstName`, `lastName`, `address`, `email`) VALUES ('c1234', '4', 'Zoe', 'Lee', '55th ABC department 2F', 'c1234@columbia.edu');

-- courses data
INSERT INTO `db_hw2_courses`.`courses` (`courseName`, `description`, `semester`, `level`, `departmentID`) VALUES ('IntroductionToDatabases', 'The fundamentals of databases design and application development using databases', 'Autumn', '4000', '1');
INSERT INTO `db_hw2_courses`.`courses` (`courseName`, `description`, `semester`, `level`, `departmentID`) VALUES ('Discrete Math', 'Logic and formal proofs', 'Autumn', '3000', '1');
INSERT INTO `db_hw2_courses`.`courses` (`courseName`, `semester`, `level`, `departmentID`) VALUES ('Computer Networks', 'Spring', '4000', '1');
INSERT INTO `db_hw2_courses`.`courses` (`courseName`, `description`, `semester`, `level`, `departmentID`) VALUES ('Machine Learning', 'Topics from generative and discriminative machine learning including least squares methods', 'Autumn', '4000', '1');
INSERT INTO `db_hw2_courses`.`courses` (`courseName`, `semester`, `level`, `departmentID`) VALUES ('Advanced Databases', 'Spring', '6000', '1');
INSERT INTO `db_hw2_courses`.`courses` (`courseName`, `description`, `semester`, `level`, `departmentID`) VALUES ('Business Writing', 'Cover letter, resume and formal letter writing', 'Autumn', '3000', '2');
INSERT INTO `db_hw2_courses`.`courses` (`courseName`, `description`, `semester`, `level`, `departmentID`) VALUES ('IntroductionToChemistry', 'Atom, and molecule introduction, basic chemical equation', 'Spring', '4000', '3');
INSERT INTO `db_hw2_courses`.`courses` (`courseName`, `semester`, `level`, `departmentID`) VALUES ('Law Principle', 'Spring', '4000', '4');

-- student data
INSERT INTO `db_hw2_courses`.`student` (`uni`, `firstname`, `lastname`, `email`, `password`, `address`, `phone`, `departmentID`) VALUES ('jc4833', 'Jiahe', 'Chen', 'jc4833@columbia.edu', 'qwert', '115St Manhattan Ave', '1234567890', '1');
INSERT INTO `db_hw2_courses`.`student` (`uni`, `firstname`, `lastname`, `email`, `password`, `address`, `phone`, `departmentID`) VALUES ('jy1234', 'Jackson', 'Yi', 'jy1234@columbia.edu', 'asdf', '114St Broadway', '0987654321', '2');
INSERT INTO `db_hw2_courses`.`student` (`uni`, `firstname`, `lastname`, `email`, `password`, `address`, `phone`, `departmentID`) VALUES ('rw4321', 'Roy', 'Wang', 'rw4321@columbia.edu', 'zxcv', '113St Broadway', '1345678902', '1');
INSERT INTO `db_hw2_courses`.`student` (`uni`, `firstname`, `lastname`, `email`, `password`, `address`, `phone`, `departmentID`) VALUES ('kw1111', 'Karry', 'Wang', 'kw1111@columbia.edu', 'qazx', '121St Manhattan Ave', '1123456789', '3');
INSERT INTO `db_hw2_courses`.`student` (`uni`, `firstname`, `lastname`, `email`, `password`, `address`, `phone`, `departmentID`) VALUES ('vw2222', 'Vicky', 'Wang', 'vw2222@columbia.edu', 'sdfg', '115St Broadway', '3214567890', '4');
INSERT INTO `db_hw2_courses`.`student` (`uni`, `firstName`, `lastName`, `email`, `password`, `address`, `phone`, `departmentID`) VALUES ('xc2121', 'Xiaohong', 'Chen', 'xc2121@columbia.edu', 'sadas', '115St Manhattan Ave', '3828128392', '1');
INSERT INTO `db_hw2_courses`.`student` (`uni`, `firstName`, `lastName`, `email`, `password`, `address`, `phone`, `departmentID`) VALUES ('ms1092', 'Mingming', 'Shao', 'ms1092', 'asiudh', '55st 5th AAA Department', '1232183912', '1');
INSERT INTO `db_hw2_courses`.`student` (`uni`, `firstName`, `lastName`, `email`, `password`, `address`, `phone`, `departmentID`) VALUES ('yz1234', 'Yi', 'Zuo', 'yz1234', 'hoifa', '124st Broadway', '4891092381', '1');

-- section data
INSERT INTO `db_hw2_courses`.`section` (`courseID`, `time`, `location`, `facultyID`, `maxStudent`, `enrolled`, `waitlisted`) VALUES ('1', 'MW8:40am-9:55am', 'Mudd123', 'q1234', '80', '55', '30');
INSERT INTO `db_hw2_courses`.`section` (`courseID`, `time`, `location`, `facultyID`, `maxStudent`, `enrolled`, `waitlisted`) VALUES ('1', 'W9:00am-11:00am', 'Mudd124', 'w1234', '80', '70', '10');
INSERT INTO `db_hw2_courses`.`section` (`courseID`, `time`, `location`, `facultyID`, `maxStudent`, `enrolled`, `waitlisted`) VALUES ('1', 'MW8:40am-9:55am', 'Mudd320', 'e1234', '100', '10', '23');
INSERT INTO `db_hw2_courses`.`section` (`courseID`, `time`, `location`, `facultyID`, `maxStudent`, `enrolled`, `waitlisted`) VALUES ('2', 'M2:00pm-4:00pm', 'Mudd550', 'q1234', '80', '80', '10');
INSERT INTO `db_hw2_courses`.`section` (`courseID`, `time`, `location`, `facultyID`, `maxStudent`, `enrolled`, `waitlisted`) VALUES ('2', 'Tu10:00am-12:00am', 'Mudd123', 'q1234', '80', '20', '50');
INSERT INTO `db_hw2_courses`.`section` (`courseID`, `time`, `location`, `facultyID`, `maxStudent`, `enrolled`, `waitlisted`) VALUES ('4', 'W4:40pm-6:00pm', 'LawSchool270', 'e1234', '80', '10', '23');
INSERT INTO `db_hw2_courses`.`section` (`courseID`, `time`, `location`, `facultyID`, `maxStudent`, `enrolled`, `waitlisted`) VALUES ('5', 'Tr9:00am-10:00am', 'LawSchool270', 'w1234', '100', '100', '32');
INSERT INTO `db_hw2_courses`.`section` (`courseID`, `time`, `location`, `facultyID`, `maxStudent`, `enrolled`, `waitlisted`) VALUES ('5', 'Tu10:00am-12:00am', 'Mudd222', 'w1234', '80', '75', '2');
INSERT INTO `db_hw2_courses`.`section` (`courseID`, `time`, `location`, `facultyID`, `maxStudent`, `enrolled`, `waitlisted`) VALUES ('6', 'MW8:40am-9:55am', 'Mudd810', 'a1234', '80', '80', '10');

-- ta data
INSERT INTO `db_hw2_courses`.`ta` (`uni`, `sectionID`) VALUES ('jc4833', '1');
INSERT INTO `db_hw2_courses`.`ta` (`uni`, `sectionID`) VALUES ('jy1234', '2');
INSERT INTO `db_hw2_courses`.`ta` (`uni`, `sectionID`) VALUES ('kw1111', '3');
INSERT INTO `db_hw2_courses`.`ta` (`uni`, `sectionID`) VALUES ('jc4833', '1');
INSERT INTO `db_hw2_courses`.`ta` (`uni`, `sectionID`) VALUES ('yz1234', '4');


-- student_has_section data
INSERT INTO `db_hw2_courses`.`student_has_section` (`uni`, `sectionID`, `enrolled`) VALUES ('ms1092', '2', 'enrolled');
INSERT INTO `db_hw2_courses`.`student_has_section` (`uni`, `sectionID`, `enrolled`) VALUES ('kw1111', '6', 'waitlisted');
INSERT INTO `db_hw2_courses`.`student_has_section` (`uni`, `sectionID`, `enrolled`) VALUES ('kw1111', '1', 'enrolled');
INSERT INTO `db_hw2_courses`.`student_has_section` (`uni`, `sectionID`, `enrolled`) VALUES ('jy1234', '5', 'enrolled');
INSERT INTO `db_hw2_courses`.`student_has_section` (`uni`, `sectionID`, `enrolled`) VALUES ('jy1234', '4', 'waitlisted');
INSERT INTO `db_hw2_courses`.`student_has_section` (`uni`, `sectionID`, `enrolled`) VALUES ('jc4833', '6', 'waitlisted');
INSERT INTO `db_hw2_courses`.`student_has_section` (`uni`, `sectionID`, `enrolled`) VALUES ('jc4833', '5', 'enrolled');
INSERT INTO `db_hw2_courses`.`student_has_section` (`uni`, `sectionID`, `enrolled`) VALUES ('jc4833', '4', 'waitlisted');
INSERT INTO `db_hw2_courses`.`student_has_section` (`uni`, `sectionID`, `enrolled`) VALUES ('xc2121', '5', 'waitlisted');
INSERT INTO `db_hw2_courses`.`student_has_section` (`uni`, `sectionID`, `enrolled`) VALUES ('ms1092', '5', 'waitlisted');
INSERT INTO `db_hw2_courses`.`student_has_section` (`uni`, `sectionID`, `enrolled`) VALUES ('yz1234', '5', 'waitlisted');

-- score data
INSERT INTO `db_hw2_courses`.`score` (`uni`, `courseID`, `score`) VALUES ('jc4833', '1', '95');
INSERT INTO `db_hw2_courses`.`score` (`uni`, `courseID`, `score`) VALUES ('jy1234', '1', '93');
INSERT INTO `db_hw2_courses`.`score` (`uni`, `courseID`, `score`) VALUES ('kw1111', '2', '94');
INSERT INTO `db_hw2_courses`.`score` (`uni`, `courseID`, `score`) VALUES ('ms1092', '1', '87');
INSERT INTO `db_hw2_courses`.`score` (`uni`, `courseID`, `score`) VALUES ('rw4321', '1', '90');
INSERT INTO `db_hw2_courses`.`score` (`uni`, `courseID`, `score`) VALUES ('vw2222', '2', '70');
INSERT INTO `db_hw2_courses`.`score` (`uni`, `courseID`, `score`) VALUES ('jc4833', '3', '85');
INSERT INTO `db_hw2_courses`.`score` (`uni`, `courseID`, `score`) VALUES ('xc2121', '1', '85');
INSERT INTO `db_hw2_courses`.`score` (`uni`, `courseID`, `score`) VALUES ('jy1234', '3', '78');
INSERT INTO `db_hw2_courses`.`score` (`uni`, `courseID`, `score`) VALUES ('rw4321', '3', '88');
INSERT INTO `db_hw2_courses`.`score` (`uni`, `courseID`, `score`) VALUES ('rw4321', '2', '86');

