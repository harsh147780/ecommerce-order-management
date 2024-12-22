-- first we create a database of name ecommerce
CREATE DATABASE ecommerce;
use ecommerce;
-- Create the necessary tables with constraints
-- Create the Products Table 
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

-- Create the Customers Table:
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);
-- Create the orders Table:
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- Create the OrderItems Table:
CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- Now add some sample data to your tables:
-- Insert Data into Products Table:
INSERT INTO Products (ProductName, Price) VALUES 
('Laptop', 1000.00), 
('Smartphone', 500.00), 
('Headphones', 150.00);

-- Insert Data into Customers Table: 
INSERT INTO Customers (CustomerName, Email) VALUES 
('John Doe', 'john@example.com'), 
('Jane Smith', 'jane@example.com');

-- Insert Data into Orders Table: 
INSERT INTO Orders (CustomerID, OrderDate) VALUES 
(1, '2024-12-20'), 
(2, '2024-12-21');

-- Insert Data into OrderItems Table: 
INSERT INTO OrderItems (OrderID, ProductID, Quantity) VALUES 
(1, 1, 2), 
(1, 3, 1), 
(2, 2, 1);

-- if we want to update table

UPDATE Products 
SET Price = 1200.00 
WHERE ProductName = 'Laptop';


-- Inner Join to Fetch Order Details with Customer and Product Information
SELECT Orders.OrderID, Customers.CustomerName, Products.ProductName, OrderItems.Quantity
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
INNER JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
INNER JOIN Products ON OrderItems.ProductID = Products.ProductID;


SELECT Products.ProductName, OrderItems.Quantity
FROM Products
RIGHT JOIN OrderItems ON Products.ProductID = OrderItems.ProductID;






