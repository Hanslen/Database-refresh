DROP VIEW `allPossible`;
CREATE VIEW `allPossible` AS
SELECT Appetizer.name AS choice1, Beverages.name AS choice2, Entrees.name AS choice3,Desserts.name AS choice4 FROM ((Appetizer INNER JOIN Beverages) INNER JOIN Desserts) INNER JOIN Entrees UNION ALL
SELECT A1.name AS choice1, A2.name AS choice2, Entrees.name AS choice3, Beverages.name AS choice4 FROM ((Appetizer A1 INNER JOIN Appetizer A2 ON A1.name <> A2.name) INNER JOIN Entrees) INNER JOIN Beverages UNION ALL
SELECT A1.name AS choice1, A2.name AS choice2, Entrees.name AS choice3, Desserts.name AS choice4 FROM ((Appetizer A1 INNER JOIN Appetizer A2 ON A1.name <> A2.name) INNER JOIN Entrees) INNER JOIN Desserts;

SELECT * FROM allPossible;
CREATE TABLE `restaurant`(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(45),
	PRIMARY KEY(id)
);
DROP TABLE `Order`;
CREATE TABLE `Order`(
	id INT NOT NULL AUTO_INCREMENT,
	choice1 VARCHAR(45) NOT NULL,
	choice2 VARCHAR(45) NOT NULL,
	choice3 VARCHAR(45) NOT NULL,
	choice4 VARCHAR(45) NOT NULL,
	PRIMARY KEY(id)
);
DROP TRIGGER IF EXISTS `before_order_insert`;
DELIMITER $$
CREATE TRIGGER `before_order_insert`
    BEFORE INSERT ON `Order` FOR EACH ROW
    BEGIN
        IF NOT EXISTS(SELECT * FROM `allPossible` WHERE allPossible.choice1=NEW.choice1 AND allPossible.choice2=NEW.choice2 AND allPossible.choice3=NEW.choice3 AND allPossible.choice4=NEW.choice4) THEN
			SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'The Order is not Valid';
		END IF;
    END$$
DELIMITER ;
SELECT * FROM `Order`;
SELECT * FROM allPossible;
INSERT INTO `Order` (choice1, choice2, choice3, choice4) VALUE ('A2','B3','E2','D3');

DROP TABLE `PurchaseHistory`;	
CREATE TABLE `PurchaseHistory`(
	restaurantID INT NOT NULL,
	itemID VARCHAR(45) NOT NULL,
	numOfSold INT NOT NULL,
	PRIMARY KEY(restaurantID, itemID)
);
SELECT * FROM `PurchaseHistory`;
SELECT * FROM restaurant;
DROP PROCEDURE IF EXISTS `updateNumOfSold`;
DELIMITER $$
CREATE PROCEDURE `updateNumOfSold`(updateorderID int, newNumOfSold int)
	BEGIN
		UPDATE `PurchaseHistory` SET numOfSold=newNumOfSold WHERE orderID=updateorderID;
	END$$
DELIMITER ;

DROP TRIGGER IF EXISTS `before_purchaseHistory_insert`;
DELIMITER $$
CREATE TRIGGER `before_purchaseHistory_insert`
    BEFORE INSERT ON `PurchaseHistory` FOR EACH ROW
    BEGIN 
		DECLARE newNumOfSold INT;
		IF EXISTS(SELECT * FROM `PurchaseHistory` WHERE orderID=NEW.orderID) THEN
			SELECT numOfSold INTO newNumOfSold FROM `PurchaseHistory` WHERE orderID=NEW.orderID;
			CALL updateNumOfSold(NEW.orderID, newNumOfSold);
		END IF;
    END$$
DELIMITER ;

DROP FUNCTION IF EXISTS `checkOrderValid`;
DELIMITER $$
	CREATE FUNCTION `checkOrderValid` (choice1 VARCHAR(45), choice2 VARCHAR(45), choice3 VARCHAR(45), choice4 VARCHAR(45)) RETURNS boolean
	BEGIN
        RETURN EXISTS(SELECT * FROM `allPossible` WHERE allPossible.choice1=choice1 AND allPossible.choice2=choice2 AND allPossible.choice3=choice3 AND allPossible.choice4=choice4);
    END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `updatePurchaseHistory`;
DELIMITER $$
	CREATE PROCEDURE `updatePurchaseHistory` (restaurant int, choice1 VARCHAR(45), choice2 VARCHAR(45), choice3 VARCHAR(45), choice4 VARCHAR(45))
	BEGIN
		DECLARE oldchoice1 INT;
		DECLARE oldchoice2 INT;
		DECLARE oldchoice3 INT;
		DECLARE oldchoice4 INT;
		IF checkOrderValid(choice1,choice2,choice3,choice4) THEN
			SELECT numOfSold INTO oldchoice1 FROM PurchaseHistory WHERE restaurantID=restaurant AND itemID=choice1;
			SELECT numOfSold INTO oldchoice2 FROM PurchaseHistory WHERE restaurantID=restaurant AND itemID=choice2;
			SELECT numOfSold INTO oldchoice3 FROM PurchaseHistory WHERE restaurantID=restaurant AND itemID=choice3;
			SELECT numOfSold INTO oldchoice4 FROM PurchaseHistory WHERE restaurantID=restaurant AND itemID=choice4;
			UPDATE PurchaseHistory SET numOfSold = oldchoice1+1 WHERE restaurantID=restaurant AND itemID=choice1;
			UPDATE PurchaseHistory SET numOfSold = oldchoice2+1 WHERE restaurantID=restaurant AND itemID=choice2;
			UPDATE PurchaseHistory SET numOfSold = oldchoice3+1 WHERE restaurantID=restaurant AND itemID=choice3;
			UPDATE PurchaseHistory SET numOfSold = oldchoice4+1 WHERE restaurantID=restaurant AND itemID=choice4;
		ELSE
			SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'The Order is not Valid';
		END IF;
	END $$
DELIMITER ;

SELECT * FROM `PurchaseHistory`;
CALL updatePurchaseHistory(1, 'A1', 'B1','E1','D1');