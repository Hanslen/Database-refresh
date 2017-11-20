DROP DATABASE `db_extra1`;
CREATE SCHEMA `db_extra1` ;
SET SQL_SAFE_UPDATES = 0;
use `db_extra1`;
DROP TABLE IF EXISTS `db_extra1`.`employee`;
CREATE TABLE `db_extra1`.`employee` (
  `first_name` VARCHAR(32) NOT NULL,
  `last_name` VARCHAR(32) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` VARCHAR(45),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  PRIMARY KEY (`user_id`));

DROP TABLE IF EXISTS `db_extra1`.`user_prefix_count`;
CREATE TABLE `db_extra1`.`user_prefix_count` (
  `prefix` VARCHAR(40) NOT NULL,
  `max_value` INT NOT NULL,
  PRIMARY KEY (`prefix`));

-- DEFINE TRIGGER `insert_employee`
DROP TRIGGER IF EXISTS `insert_employee`;
DELIMITER $$
	 	CREATE TRIGGER `insert_employee`
 		BEFORE INSERT ON `employee` FOR EACH ROW
 		BEGIN
			DECLARE num INT;
			DECLARE prefix_ varchar(91);
			SET prefix_=CONCAT(NEW.first_name, ".", NEW.last_name);
 			IF EXISTS(SELECT * FROM user_prefix_count WHERE prefix=prefix_) THEN
				SELECT max_value INTO num FROM user_prefix_count WHERE prefix=prefix_;
				UPDATE user_prefix_count SET max_value=num+1 WHERE prefix=CONCAT(NEW.first_name,".",NEW.last_name);
			ELSE
				INSERT INTO user_prefix_count VALUES(CONCAT(NEW.first_name,".",NEW.last_name),1);
			END IF;
			
			SET NEW.user_id = (SELECT generate_user_id(NEW.first_name,NEW.last_name));
	END $$
DELIMITER ;

-- DEFINE FUNCTION generate_user_id
DROP FUNCTION IF EXISTS `generate_user_id`;
DELIMITER $$
	CREATE FUNCTION `generate_user_id`(first_name VARCHAR(45), last_name VARCHAR(45)) RETURNS VARCHAR(45) CHARSET utf8
	BEGIN
		DECLARE pre VARCHAR(91);
		DECLARE num INT;
		DECLARE new_user_id VARCHAR(45);
		SET pre = CONCAT(first_name,".",last_name);
		SELECT max_value INTO num FROM user_prefix_count WHERE prefix=pre;
		SET new_user_id = CONCAT(pre,".",num);
	RETURN new_user_id;
	END$$
DELIMITER ;

-- DEFINE TRIGGER `update_employee`
DROP TRIGGER IF EXISTS `update_employee`;
DELIMITER $$
	 	CREATE TRIGGER `update_employee`
 		BEFORE UPDATE ON `employee` FOR EACH ROW
 		BEGIN
			IF NOT NEW.user_id = OLD.user_id THEN
				SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'You can not update user_id column';
			ELSEIF NOT NEW.created = OLD.created THEN
				SET NEW.created=OLD.created;
			END IF;
	END $$
DELIMITER ;

-- insert initial data (test 1)
INSERT INTO employee(first_name, last_name, email) VALUES ('Candie', 'MacPake', 'cmacpake6@spiegel.de');
INSERT INTO employee(first_name, last_name, email) VALUES ('Carling', 'Bockman', 'cbockman5@cam.ac.uk');
INSERT INTO employee(first_name, last_name, email) VALUES ('Chrissy', 'Weatherup', 'cweatherup2@theguardian.com');
INSERT INTO employee(first_name, last_name, email) VALUES ('Cloris', 'Edards', 'cedards4@springer.com');
INSERT INTO employee(first_name, last_name, email) VALUES ('Diannne', 'Aickin', 'daickin9@domainmarket.com');
INSERT INTO employee(first_name, last_name, email) VALUES ('Dougy', 'Snoxill', 'dsnoxill1@scribd.com');
INSERT INTO employee(first_name, last_name, email) VALUES ('Dulciana', 'Cambell', 'dcambell8@i2i.jp');
INSERT INTO employee(first_name, last_name, email) VALUES ('Jared', 'Melarkey', 'jmelarkey3@google.co.jp');
INSERT INTO employee(first_name, last_name, email) VALUES ('Joice', 'Tomsen', 'jtomsen7@slideshare.net');
INSERT INTO employee(first_name, last_name, email) VALUES ('Juana', 'Gatesman', 'jgatesman0@chron.com');
-- SELECT * FROM employee;

-- update test (test2)
-- UPDATE employee SET first_name='Douglas' WHERE first_name='Dougy' AND last_name='Snoxill';
-- SELECT * FROM employee;

-- Attempt to INSERT a tuple with a duplicate email. This should faily.
-- INSERT INTO employee(first_name, last_name, email) VALUES ('Test', 'Fail', 'jgatesman0@chron.com');

-- Attempt to update Douglas Snoxill's user ID. This should fail.
-- UPDATE employee SET user_id='hackeruserid' WHERE first_name='Candie' AND last_name='MacPake';

-- John Smith test (test 5)
-- INSERT INTO employee(first_name, last_name, email) VALUES ('John', 'Smith', 'js1@statcounter.com');
-- INSERT INTO employee(first_name, last_name, email) VALUES ('John', 'Smith', 'js2@statcounter.com');
-- INSERT INTO employee(first_name, last_name, email) VALUES ('John', 'Smith', 'js3@statcounter.com');
-- INSERT INTO employee(first_name, last_name, email) VALUES ('John', 'Smith', 'js4@statcounter.com');
-- INSERT INTO employee(first_name, last_name, email) VALUES ('John', 'Smith', 'js5@statcounter.com');
-- DELETE FROM employee WHERE email='js2@statcounter.com';
-- DELETE FROM employee WHERE email='js4@statcounter.com';
-- INSERT INTO employee(first_name, last_name, email) VALUES ('John', 'Smith', 'js@statcounter.com');
-- SELECT * FROM employee;