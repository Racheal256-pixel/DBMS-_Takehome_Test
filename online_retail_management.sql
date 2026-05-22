-- Question 1: Database Creation (5 Marks)
CREATE DATABASE IF NOT EXISTS online_retail_management;
USE online_retail_management;

-- Question 2: Table Design and Creation (8 Marks)

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
    Price DECIMAL(10, 2) NOT NULL CHECK (Price >= 0),
    StockQuantity INT NOT NULL DEFAULT 0 CHECK (StockQuantity >= 0),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) ON DELETE SET NULL
);

-- 4. Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2) DEFAULT 0.00,
    Status ENUM('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

-- 5. OrderItems Table
CREATE TABLE IF NOT EXISTS OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE RESTRICT
);

-- 6. Payments Table
CREATE TABLE IF NOT EXISTS Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentMethod ENUM('Credit Card', 'PayPal', 'Mobile Money', 'Bank Transfer') NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE
);


-- Question 3: Data Insertion (5 Marks)
-- Inserting into Categories
INSERT INTO Categories (CategoryName, Description) VALUES
('Electronics', 'Devices and gadgets'),
('Clothing', 'Men and Women fashion'),
('Home & Kitchen', 'Home appliances and furniture'),
('Books', 'Physical and E-books'),
('Sports', 'Sporting goods and equipment');

-- Inserting into Customers (20 records)
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES
('Alice', 'Smith', 'alice.smith@example.com', '1234567890', '123 Elm St'),
('Bob', 'Johnson', 'bob.johnson@example.com', '1234567891', '456 Oak St'),
('Charlie', 'Brown', 'charlie.brown@example.com', '1234567892', '789 Pine St'),
('David', 'Williams', 'david.williams@example.com', '1234567893', '321 Maple St'),
('Eva', 'Jones', 'eva.jones@example.com', '1234567894', '654 Cedar St'),
('Frank', 'Garcia', 'frank.garcia@example.com', '1234567895', '987 Birch St'),
('Grace', 'Miller', 'grace.miller@example.com', '1234567896', '147 Walnut St'),
('Henry', 'Davis', 'henry.davis@example.com', '1234567897', '258 Cherry St'),
('Ivy', 'Rodriguez', 'ivy.rodriguez@example.com', '1234567898', '369 Spruce St'),
('Jack', 'Martinez', 'jack.martinez@example.com', '1234567899', '741 Ash St'),
('Karen', 'Hernandez', 'karen.hernandez@example.com', '1234567800', '852 Fir St'),
('Leo', 'Lopez', 'leo.lopez@example.com', '1234567801', '963 Redwood St'),
('Mia', 'Gonzalez', 'mia.gonzalez@example.com', '1234567802', '159 Willow St'),
('Noah', 'Wilson', 'noah.wilson@example.com', '1234567803', '753 Poplar St'),
('Olivia', 'Anderson', 'olivia.anderson@example.com', '1234567804', '951 Cypress St'),
('Paul', 'Thomas', 'paul.thomas@example.com', '1234567805', '357 Chestnut St'),
('Quinn', 'Taylor', 'quinn.taylor@example.com', '1234567806', '456 Sycamore St'),
('Rachel', 'Moore', 'rachel.moore@example.com', '1234567807', '123 Hickory St'),
('Sam', 'Jackson', 'sam.jackson@example.com', '1234567808', '789 Beech St'),
('Tina', 'Martin', 'tina.martin@example.com', '1234567809', '321 Elm St');

-- Inserting into Products (20 records)
INSERT INTO Products (CategoryID, ProductName, Description, Price, StockQuantity) VALUES
(1, 'Smartphone X', 'Latest smartphone model', 799.99, 50),
(1, 'Laptop Pro', 'High performance laptop', 1299.99, 30),
(1, 'Wireless Earbuds', 'Noise-cancelling earbuds', 149.99, 100),
(1, 'Smartwatch', 'Fitness tracking watch', 199.99, 75),
(2, 'Men T-Shirt', 'Cotton casual t-shirt', 19.99, 200),
(2, 'Women Jeans', 'Slim fit blue jeans', 49.99, 150),
(2, 'Winter Jacket', 'Warm winter coat', 89.99, 60),
(2, 'Sneakers', 'Running shoes', 69.99, 120),
(3, 'Coffee Maker', 'Programmable coffee machine', 39.99, 80),
(3, 'Blender', 'High-speed blender', 59.99, 45),
(3, 'Microwave Oven', 'Compact microwave', 99.99, 25),
(3, 'Vacuum Cleaner', 'Bagless upright vacuum', 129.99, 40),
(4, 'Fiction Novel', 'Bestselling fiction book', 14.99, 300),
(4, 'Programming Guide', 'Learn Python programming', 29.99, 150),
(4, 'Cookbook', 'Healthy recipes', 24.99, 100),
(4, 'History Book', 'World history overview', 19.99, 80),
(5, 'Yoga Mat', 'Non-slip exercise mat', 25.99, 150),
(5, 'Dumbbells Set', 'Adjustable weights', 45.99, 90),
(5, 'Tennis Racket', 'Professional racket', 85.99, 40),
(5, 'Soccer Ball', 'Size 5 match ball', 29.99, 110);

-- Inserting into Orders (20 records)
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Status) VALUES
(1, '2026-05-01 10:00:00', 819.98, 'Delivered'),
(2, '2026-05-02 11:30:00', 1299.99, 'Shipped'),
(3, '2026-05-03 14:15:00', 49.99, 'Processing'),
(4, '2026-05-04 09:45:00', 149.99, 'Delivered'),
(5, '2026-05-05 16:20:00', 89.99, 'Pending'),
(6, '2026-05-06 12:10:00', 199.99, 'Shipped'),
(7, '2026-05-07 08:05:00', 39.99, 'Delivered'),
(8, '2026-05-08 13:50:00', 59.99, 'Cancelled'),
(9, '2026-05-09 17:30:00', 14.99, 'Delivered'),
(10, '2026-05-10 10:25:00', 25.99, 'Processing'),
(11, '2026-05-11 11:40:00', 85.99, 'Shipped'),
(12, '2026-05-12 15:55:00', 129.99, 'Pending'),
(13, '2026-05-13 09:15:00', 29.99, 'Delivered'),
(14, '2026-05-14 14:00:00', 45.99, 'Shipped'),
(15, '2026-05-15 16:45:00', 19.99, 'Delivered'),
(16, '2026-05-16 10:30:00', 24.99, 'Processing'),
(17, '2026-05-17 12:20:00', 69.99, 'Delivered'),
(18, '2026-05-18 13:10:00', 99.99, 'Shipped'),
(19, '2026-05-19 09:00:00', 29.99, 'Delivered'),
(20, '2026-05-20 15:35:00', 799.99, 'Pending');

-- Inserting into OrderItems (20 records)
INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 799.99),
(1, 5, 1, 19.99),
(2, 2, 1, 1299.99),
(3, 6, 1, 49.99),
(4, 3, 1, 149.99),
(5, 7, 1, 89.99),
(6, 4, 1, 199.99),
(7, 9, 1, 39.99),
(8, 10, 1, 59.99),
(9, 13, 1, 14.99),
(10, 17, 1, 25.99),
(11, 19, 1, 85.99),
(12, 12, 1, 129.99),
(13, 14, 1, 29.99),
(14, 18, 1, 45.99),
(15, 16, 1, 19.99),
(16, 15, 1, 24.99),
(17, 8, 1, 69.99),
(18, 11, 1, 99.99),
(19, 20, 1, 29.99),
(20, 1, 1, 799.99);

-- Inserting into Payments (20 records)
INSERT INTO Payments (OrderID, PaymentDate, Amount, PaymentMethod) VALUES
(1, '2026-05-01 10:05:00', 819.98, 'Credit Card'),
(2, '2026-05-02 11:35:00', 1299.99, 'PayPal'),
(3, '2026-05-03 14:20:00', 49.99, 'Mobile Money'),
(4, '2026-05-04 09:50:00', 149.99, 'Credit Card'),
(6, '2026-05-06 12:15:00', 199.99, 'Bank Transfer'),
(7, '2026-05-07 08:10:00', 39.99, 'Credit Card'),
(9, '2026-05-09 17:35:00', 14.99, 'Mobile Money'),
(10, '2026-05-10 10:30:00', 25.99, 'PayPal'),
(11, '2026-05-11 11:45:00', 85.99, 'Credit Card'),
(13, '2026-05-13 09:20:00', 29.99, 'Bank Transfer'),
(14, '2026-05-14 14:05:00', 45.99, 'Credit Card'),
(15, '2026-05-15 16:50:00', 19.99, 'PayPal'),
(16, '2026-05-16 10:35:00', 24.99, 'Mobile Money'),
(17, '2026-05-17 12:25:00', 69.99, 'Credit Card'),
(18, '2026-05-18 13:15:00', 99.99, 'Bank Transfer'),
(19, '2026-05-19 09:05:00', 29.99, 'Credit Card'),
(1, '2026-05-01 11:05:00', 10.00, 'PayPal'), 
(2, '2026-05-02 12:35:00', 20.00, 'Mobile Money'), 
(3, '2026-05-03 15:20:00', 5.00, 'Bank Transfer'), 
(4, '2026-05-04 10:50:00', 15.00, 'Credit Card'); 


-- Question 4: SQL Queries (10 Marks)

-- 1. Display all records from a table
SELECT * FROM Customers;

-- 2. Retrieve records using WHERE
SELECT * FROM Products WHERE Price > 50.00;

-- 3. Use ORDER BY
SELECT * FROM Orders ORDER BY OrderDate DESC;

-- 4. Use aggregate functions (COUNT, SUM, AVG)
SELECT COUNT(CustomerID) AS TotalCustomers FROM Customers;
SELECT SUM(TotalAmount) AS TotalSales FROM Orders WHERE Status = 'Delivered';
SELECT AVG(Price) AS AverageProductPrice FROM Products;

-- 5. Perform an INNER JOIN between at least two tables
SELECT 
    Orders.OrderID, 
    Customers.FirstName, 
    Customers.LastName, 
    Orders.OrderDate, 
    Orders.TotalAmount, 
    Orders.Status
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- 6. Update records using UPDATE
UPDATE Products SET Price = Price * 0.9 WHERE CategoryID = 2; -- Apply 10% discount to Clothing


-- Question 5: Advanced Database Feature (5 Marks)
-- Creating a View to show Order Summary
CREATE OR REPLACE VIEW OrderSummary AS
SELECT 
    o.OrderID,
    c.FirstName,
    c.LastName,
    p.ProductName,
    oi.Quantity,
    oi.UnitPrice,
    (oi.Quantity * oi.UnitPrice) AS LineTotal,
    o.OrderDate
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN OrderItems oi ON o.OrderID = oi.OrderID
INNER JOIN Products p ON oi.ProductID = p.ProductID;

-- Show view output
SELECT * FROM OrderSummary;

-- Trigger to update Stock Quantity when an OrderItem is inserted
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
