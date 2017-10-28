SELECT Country, count(*) as noOfCustomers, concat('(',group_concat(CustomerID separator ','),',') 
as Customers FROM Customers GROUP BY Country ORDER by Country;
SELECT DISTINCT Country FROM Customers; -- SELECT different country name
SELECT * FROM Customers WHERE City='Berlin' OR City='Munchen';
SELECT * FROM Customers ORDER BY Country DESC; -- Default is ASC
SELECT * FROM Customers ORDER BY Country, CustomerName;
INSERT INTO Customers (CustomerName, City, Country) VALUES ('Cardinal', 'Stavanger','Norway');
UPDATE Customers SET ContactName = 'Alfred', City='Frankfurt' WHERE CustomerID=1;
DELETE FROM Customers WHERE CustomerName='Alfred'; -- Can delete all rows without deleting table.
SELECT TOP 3 * FROM Customers; = SELECT * FROM Customers LIMIT 3; = SELECT * FROM Customers WHERE ROWNUM <= 3;
SELECT TOP 50 PERCENT * FROM Customers;
SELECT TOP 3 * FROM Customers WHERE Country='Germany';
SELECT MIN(Price) AS SmallestPrice FROM Products;
SELECT MAX(Price) AS LargestPrice FROM Products;
SELECT COUNT(ProductID) FROM Products;
SELECT AVG(Price) FROM Products;
SELECT SUM(Quantity) FROM OrderDetails;
SELECT * FROM Customers WHERE CustomerName LIKE 'a%'; -- '-' a single character,'%' >= 0 character
SELECT * FROM Customers WHERE Country IN ('Germany', 'France','UK');
SELECT * FROM Customers WHERE Country NOT IN (‘Germany’, ‘France’, ‘UK’);
SELECT * FROM Customers WHERE Country IN (SELECT Country FROM Suppliers);
SELECT * FROM Products WHERE (Price BETWEEN 10 AND 20) AND CategoryID NOT IN (1,2,3);
SELECT * FROM Orders WHERE OrderDate BETWEEN #07/04/1996# AND #07/09/1996#;
SELECT o.OrderID,o.OrderDate, c.CustomerName FROM Customers AS c, Orders AS o 
WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;
SELECT Orders.OrderID, Customers. CustomerName, Orders.OrderDate FROM Orders INNER JOIN Customers 
ON Orders.CustomerID=Customers.CustomerID;
SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName FROM ((Orders INNER JOIN 
Customers ON Orders.CustomerID = Customers.CustomerID) INNER JOIN Shippers ON Orders.ShipperID=Shippers.ShipperID);
SELECT * FROM department LEFT JOIN student ON student.departmentID=department.departmentID;
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City FROM Customer A, Customers B 
WHERE A.CustomerID <> B.CustomerID AND A.City=B.City ORDER BY A.City; -- self join 
SELECT City FROM Customers UNION SELECT City FROM Suppliers Order By City.
SELECT City, Country FROM Customers WHERE Country='Germany' UNION SELECT City, Country FROM Suppliers 
WHERE Country='Germany' ORDER BY City;
SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country;
SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country ORDER BY COUNT(CustomerID) DESC;
SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders LEFT JOIN Shippers 
ON Orders.ShipperID=Shippers.ShipperID GROUP BY ShipperName;
SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country HAVING COUNT(CustomerID) > 5;
SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders FROM (Orders INNER JOIN Employees 
ON Orders.EmployeeID=Employees.EmployeeID) GROUP BY LastName HAVING COUNT(Orders.OrderID) > 10;
SELECT Employee.LastName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders INNER JOIN Employees 
ON Orders.EmployeeID=Employee.EmployeeID WHERE LastName='Davolio' OR LastName='Fuller'
GROUP BY LastNmae HAVING COUNT(Orders.OrderID) > 25;
SELECT SupplierName FROM Suppliers WHERE EXISTS (SELECT ProductName FROM Products 
WHERE SupplierId=Suppliers.supplierId AND Price<20);
SELECT productNames FROM Products WHERE ProductID=ANY(SELECT ProductID FROM OrderDetails WHERE Quantity =10);
SELECT productNames FROM Products WHERE ProductID = ANY(SELECT productID FROM orderDetails WHERE quantity>99);
SELECT productNames FROM Products WHERE ProductID=ALL(SELECT productID FROM orderDetails WHERE quantity=10);
SELECT * INTO CustomerBackup2017 IN 'Backup.mdb' FROM Customers;
ALTER TABLE Persons ADD DateOfBirth date; ALTER TABLE Persons ALTER COLUMN DateOfBirth year;