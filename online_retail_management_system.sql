-- Question 1: 
--Database Creation 
CREATE DATABASE IF NOT EXISTS online_retail_management;

USE online_retail_management;

-- Clear existing views and tables to prevent duplicate records on repeated runs
SET FOREIGN_KEY_CHECKS = 0;
DROP VIEW IF EXISTS OrderSummary;
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Categories;
SET FOREIGN_KEY_CHECKS = 1;



-- Question 2: Table Design and Creation 

-- 1. Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(20),
    Address TEXT,
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Categories Table
CREATE TABLE IF NOT EXISTS Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE,
    Description TEXT
);



-- 3. Products Table
CREATE TABLE IF NOT EXISTS Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryID INT,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price INT NOT NULL CHECK (Price >= 0),
    StockQuantity INT NOT NULL DEFAULT 0 CHECK (StockQuantity >= 0),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) ON DELETE SET NULL
);

-- 4. Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalAmount INT DEFAULT 0,
    Status ENUM('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);


-- 5. OrderItems Table
CREATE TABLE IF NOT EXISTS OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE RESTRICT
);

-- 6. Payments Table
CREATE TABLE IF NOT EXISTS Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Amount INT NOT NULL,
    PaymentMethod ENUM('Credit Card', 'PayPal', 'Mobile Money', 'Bank Transfer') NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE
);


-- Question 3: Data Insertion 

-- Inserting into Categories
INSERT INTO Categories (CategoryName, Description) VALUES
('Electronics', 'Devices and gadgets'),
('Clothing', 'Men and Women fashion'),
('Home & Kitchen', 'Home appliances and furniture'),
('Books', 'Physical and E-books'),
('Sports', 'Sporting goods and equipment');



-- Inserting into Customers (20 records)
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES
('Racheal', 'Nalweyiso', 'nalweyisoracheal@gmail.com', '+256701234567', 'Ntinda, Kampala, Uganda'),
('Bob', 'Muwanguzi', 'bobmuwanguzi@gmail.com', '+256702345678', 'Kololo, Kampala, Uganda'),
('Charlie', 'Okello', 'charlieokello@gmail.com', '+256703456789', 'Gulu City, Uganda'),
('David', 'Williams', 'davidwilliams@gmail.com', '+256704567890', 'Entebbe, Wakiso, Uganda'),
('Eva', 'Abagye', 'evaabagye@gmail.com', '+256705678901', 'Mbarara City, Uganda'),
('Frank', 'Kagalama', 'frankkagalama@gmail.com', '+254701234567', 'Westlands, Nairobi, Kenya'),
('Grace', 'Akello', 'graceakello@gmail.com', '+254702345678', 'Kisumu, Kenya'),
('Henry', 'Davis', 'henrydavis@gmail.com', '+254703456789', 'Karen, Nairobi, Kenya'),
('Ivy', 'Namakula', 'ivynamakula@gmail.com', '+254704567890', 'Nakuru, Kenya'),
('Jack', 'Ssemanda', 'jackssemanda@gmail.com', '+254705678901', 'Mombasa, Kenya'),
('Karen', 'Nankya', 'karennankya@gmail.com', '+250781234567', 'Kigali City, Rwanda'),
('Leo', 'Kintu', 'leokintu@gmail.com', '+250782345678', 'Gasabo, Kigali, Rwanda'),
('Mia', 'Kyomuwendo', 'miakyomuwendo@gmail.com', '+250783456789', 'Huye, Rwanda'),
('Noah', 'Mbaguta', 'noahmbaguta@gmail.com', '+250784567890', 'Musanze, Rwanda'),
('Olivia', 'Namata', 'olivianamata@gmail.com', '+250785678901', 'Rubavu, Rwanda'),
('Paul', 'Thomas', 'paulthomas@gmail.com', '+447911123456', 'Manchester, United Kingdom'),
('Quinn', 'Ntale', 'quinnntale@gmail.com', '+447922234567', 'Birmingham, United Kingdom'),
('Rachel', 'Mutoni', 'rachelmutoni@gmail.com', '+447933345678', 'London, United Kingdom'),
('Sam', 'Bagenda', 'sambagenda@gmail.com', '+447944456789', 'Liverpool, United Kingdom'),
('Tina', 'Mbabazi', 'tinambabazi@gmail.com', '+447955567890', 'Leeds, United Kingdom');

-- Inserting into Products (20 records)
INSERT INTO Products (CategoryID, ProductName, Description, Price, StockQuantity) VALUES
(1, 'Smartphone X', 'Latest smartphone model', 2959963, 50),
(1, 'Laptop Pro', 'High performance laptop', 4809963, 30),
(1, 'Wireless Earbuds', 'Noise-cancelling earbuds', 554963, 100),
(1, 'Smartwatch', 'Fitness tracking watch', 739963, 75),
(2, 'Men T-Shirt', 'Cotton casual t-shirt', 73963, 200),
(2, 'Women Jeans', 'Slim fit blue jeans', 184963, 150),
(2, 'Winter Jacket', 'Warm winter coat', 332963, 60),
(2, 'Sneakers', 'Running shoes', 258963, 120),
(3, 'Coffee Maker', 'Programmable coffee machine', 147963, 80),
(3, 'Blender', 'High-speed blender', 221963, 45),
(3, 'Microwave Oven', 'Compact microwave', 369963, 25),
(3, 'Vacuum Cleaner', 'Bagless upright vacuum', 480963, 40),
(4, 'Fiction Novel', 'Bestselling fiction book', 55463, 300),
(4, 'Programming Guide', 'Learn Python programming', 110963, 150),
(4, 'Cookbook', 'Healthy recipes', 92463, 100),
(4, 'History Book', 'World history overview', 73963, 80),
(5, 'Yoga Mat', 'Non-slip exercise mat', 96163, 150),
(5, 'Dumbbells Set', 'Adjustable weights', 170163, 90),
(5, 'Tennis Racket', 'Professional racket', 318163, 40),
(5, 'Soccer Ball', 'Size 5 match ball', 110963, 110);

-- Inserting into Orders (20 records)
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Status) VALUES
(1, '2026-05-01 10:00:00', 3033926, 'Delivered'),
(2, '2026-05-02 11:30:00', 4809963, 'Shipped'),
(3, '2026-05-03 14:15:00', 184963, 'Processing'),
(4, '2026-05-04 09:45:00', 554963, 'Delivered'),
(5, '2026-05-05 16:20:00', 332963, 'Pending'),

(6, '2026-05-06 12:10:00', 739963, 'Shipped'),
(7, '2026-05-07 08:05:00', 147963, 'Delivered'),
(8, '2026-05-08 13:50:00', 221963, 'Cancelled'),
(9, '2026-05-09 17:30:00', 55463, 'Delivered'),
(10, '2026-05-10 10:25:00', 96163, 'Processing'),

(11, '2026-05-11 11:40:00', 318163, 'Shipped'),
(12, '2026-05-12 15:55:00', 480963, 'Pending'),
(13, '2026-05-13 09:15:00', 110963, 'Delivered'),
(14, '2026-05-14 14:00:00', 170163, 'Shipped'),
(15, '2026-05-15 16:45:00', 73963, 'Delivered'),

(16, '2026-05-16 10:30:00', 92463, 'Processing'),
(17, '2026-05-17 12:20:00', 258963, 'Delivered'),
(18, '2026-05-18 13:10:00', 369963, 'Shipped'),
(19, '2026-05-19 09:00:00', 110963, 'Delivered'),
(20, '2026-05-20 15:35:00', 2959963, 'Pending');

-- Inserting into OrderItems (20 records)
INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 2959963),
(1, 5, 1, 73963),
(2, 2, 1, 4809963),
(3, 6, 1, 184963),
(4, 3, 1, 554963),
(5, 7, 1, 332963),
(6, 4, 1, 739963),
(7, 9, 1, 147963),
(8, 10, 1, 221963),
(9, 13, 1, 55463),
(10, 17, 1, 96163),
(11, 19, 1, 318163),
(12, 12, 1, 480963),
(13, 14, 1, 110963),
(14, 18, 1, 170163),
(15, 16, 1, 73963),
(16, 15, 1, 92463),
(17, 8, 1, 258963),
(18, 11, 1, 369963),
(19, 20, 1, 110963),
(20, 1, 1, 2959963);

-- Inserting into Payments (20 records)
INSERT INTO Payments (OrderID, PaymentDate, Amount, PaymentMethod) VALUES
(1, '2026-05-01 10:05:00', 3033926, 'Credit Card'),
(2, '2026-05-02 11:35:00', 4809963, 'PayPal'),
(3, '2026-05-03 14:20:00', 184963, 'Mobile Money'),
(4, '2026-05-04 09:50:00', 554963, 'Credit Card'),
(6, '2026-05-06 12:15:00', 739963, 'Bank Transfer'),
(7, '2026-05-07 08:10:00', 147963, 'Credit Card'),
(9, '2026-05-09 17:35:00', 55463, 'Mobile Money'),
(10, '2026-05-10 10:30:00', 96163, 'PayPal'),
(11, '2026-05-11 11:45:00', 318163, 'Credit Card'),
(13, '2026-05-13 09:20:00', 110963, 'Bank Transfer'),
(14, '2026-05-14 14:05:00', 170163, 'Credit Card'),
(15, '2026-05-15 16:50:00', 73963, 'PayPal'),
(16, '2026-05-16 10:35:00', 92463, 'Mobile Money'),
(17, '2026-05-17 12:25:00', 258963, 'Credit Card'),
(18, '2026-05-18 13:15:00', 369963, 'Bank Transfer'),
(19, '2026-05-19 09:05:00', 110963, 'Credit Card'),
(1, '2026-05-01 11:05:00', 37000, 'PayPal'),
(2, '2026-05-02 12:35:00', 74000, 'Mobile Money'),
(3, '2026-05-03 15:20:00', 18500, 'Bank Transfer'),
(4, '2026-05-04 10:50:00', 55500, 'Credit Card');


-- Question 4: SQL Queries 

-- 1. Display all records from a table
SELECT * FROM Customers;

-- 2. Retrieve records using WHERE (showing Price in UGX format)
SELECT 
    ProductID, 
    CategoryID, 
    ProductName, 
    Description, 
    CONCAT('UGX ', FORMAT(Price, 0)) AS Price, 
    StockQuantity 
FROM Products
WHERE Price > 50000;

-- 3. Use ORDER BY (showing TotalAmount in UGX format)
SELECT 
    OrderID, 
    CustomerID, 
    OrderDate, 
    CONCAT('UGX ', FORMAT(TotalAmount, 0)) AS TotalAmount, 
    Status 
FROM Orders 
ORDER BY OrderDate DESC;

-- 4. Use aggregate functions (COUNT, SUM, AVG) (showing monetary sums and averages in UGX format)
SELECT COUNT(CustomerID) AS TotalCustomers FROM Customers;
SELECT CONCAT('UGX ', FORMAT(SUM(TotalAmount), 0)) AS TotalSales FROM Orders WHERE Status = 'Delivered';
SELECT CONCAT('UGX ', FORMAT(AVG(Price), 0)) AS AverageProductPrice FROM Products;

-- 5. INNER JOIN between at least two tables (showing TotalAmount in UGX format)
SELECT 
    Orders.OrderID, 
    Customers.FirstName, 
    Customers.LastName, 
    Orders.OrderDate, 
    CONCAT('UGX ', FORMAT(Orders.TotalAmount, 0)) AS TotalAmount, 
    Orders.Status
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- 6. Update records using UPDATE
UPDATE Products SET Price = Price * 0.9 WHERE CategoryID = 2; 


-- Question 5: Advanced Database Feature
-- Creating a View to show Order Summary (with prices formatted in UGX)
CREATE OR REPLACE VIEW OrderSummary AS
SELECT 
    o.OrderID,
    c.FirstName,
    c.LastName,
    p.ProductName,
    oi.Quantity,
    CONCAT('UGX ', FORMAT(oi.UnitPrice, 0)) AS UnitPrice,
    CONCAT('UGX ', FORMAT(oi.Quantity * oi.UnitPrice, 0)) AS LineTotal,
    o.OrderDate
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN OrderItems oi ON o.OrderID = oi.OrderID
INNER JOIN Products p ON oi.ProductID = p.ProductID;


-- Showing product prices in UGX format
SELECT CONCAT('UGX ', FORMAT(Price,0)) AS Price
FROM Products;


-- Show view output
SELECT * FROM OrderSummary;

-- Trigger to update Stock Quantity when an OrderItem is inserted
DROP TRIGGER IF EXISTS After_OrderItem_Insert;
DELIMITER //
CREATE TRIGGER After_OrderItem_Insert
AFTER INSERT ON OrderItems
FOR EACH ROW
BEGIN
    UPDATE Products 
    SET StockQuantity = StockQuantity - NEW.Quantity
    WHERE ProductID = NEW.ProductID;
END;
//
DELIMITER ;
