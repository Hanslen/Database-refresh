use northwind;
CREATE TABLE Addresses(
	id INT NOT NULL AUTO_INCREMENT,
	street_name VARCHAR(100) NOT NULL,
	city VARCHAR(50) NOT NULL,
	region VARCHAR(50) DEFAULT NULL,
	postal_code VARCHAR(50) DEFAULT NULL,
	country VARCHAR(50) NOT NULL,
	PRIMARY KEY(`id`)
);
create unique index id_x_address on Addresses(street_name, city,region,postal_code,country);
INSERT INTO Addresses (street_name, city, region, postal_code, country)  
SELECT DISTINCT Address, City, Region, PostalCode,Country FROM Customers;
-- CREATE TABLE new_customers AS SELECT * FROM Customers;
CREATE TABLE new_cusomters LIKE Customers; -- (This one will copy the key as well)
ALTER TABLE new_customers ADD COLUMN address_id INT;
-- SET SQL_SAFE_UPDATES=0; 
UPDATE new_customers INNER JOIN Addresses ON Addresses.street_name = new_customers.Address 
SET new_customers.address_id=Addresses.id;
ALTER TABLE new_customers DROP Address, DROP City, DROP Region, DROP PostalCode, DROP country;
ALTER TABLE new_customers ADD CONSTRAINT fk_address_id FOREIGN KEY (address_id) REFERENCES Addresses(id);