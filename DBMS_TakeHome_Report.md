# Database Management Systems (DBMS) Take Home Test Report

**Project Title:** Online Retail Management System
**Student Name:** Racheal
**Date:** 27th May 2026

## 1. System Description
The Online Retail Management System is designed to manage the core operations of an online store. It facilitates the management of customers, product cataloging, order processing, and payment tracking. The system transitions traditional physical store operations to a robust digital platform, improving data organization, reducing redundancy, and enhancing the overall customer experience.

## 2. Tables Created
The database consists of six related tables:
1. **Customers**: Stores customer details (CustomerID, FirstName, LastName, Email, Phone, Address, RegistrationDate).
2. **Categories**: Organizes products into categories (CategoryID, CategoryName, Description).
3. **Products**: Contains product inventory and pricing (ProductID, CategoryID, ProductName, Description, Price, StockQuantity).
4. **Orders**: Tracks customer orders and status (OrderID, CustomerID, OrderDate, TotalAmount, Status).
5. **OrderItems**: Details the individual products within an order (OrderItemID, OrderID, ProductID, Quantity, UnitPrice).
6. **Payments**: Records payment transactions for orders (PaymentID, OrderID, PaymentDate, Amount, PaymentMethod).

## 3. Relationships Used
The system relies on the following primary foreign key relationships to maintain referential integrity:
*   **One-to-Many between Customers and Orders**: A customer can place multiple orders. (`CustomerID` in `Orders` references `Customers`).
*   **One-to-Many between Categories and Products**: A category can have multiple products. (`CategoryID` in `Products` references `Categories`).
*   **One-to-Many between Orders and OrderItems**: An order can contain multiple items. (`OrderID` in `OrderItems` references `Orders`).
*   **One-to-Many between Products and OrderItems**: A product can appear in multiple order items. (`ProductID` in `OrderItems` references `Products`).
*   **One-to-Many (or One-to-One practically) between Orders and Payments**: An order can have payments associated with it. (`OrderID` in `Payments` references `Orders`).

## 4. Advanced Features Implemented
*   **View (`OrderSummary`)**: Created a view that joins `Orders`, `Customers`, `OrderItems`, and `Products` to provide a clear, unified summary of orders and their items.
*   **Trigger (`After_OrderItem_Insert`)**: Implemented a trigger that automatically updates the `StockQuantity` in the `Products` table whenever a new item is purchased (inserted into `OrderItems`).

---

## 5. Screenshots

*(Note: Please replace the placeholders below with actual screenshots from your MySQL execution before exporting this report to PDF/Word)*

### 5.1. Database Created
*(Insert screenshot showing the creation of the `online_retail_management` database)*
![Database Created](screenshots/placeholder.png)

### 5.2. Tables Created
*(Insert screenshot showing the tables in the database, e.g., `SHOW TABLES;` and `DESCRIBE Customers;`)*
![Tables Created](screenshots/placeholder.png)

### 5.3. Inserted Records
*(Insert screenshot showing the records inserted, e.g., `SELECT * FROM Customers LIMIT 5;`)*
![Inserted Records](screenshots/placeholder.png)

### 5.4. Query Outputs
*(Insert screenshots showing the successful execution of the SELECT, JOIN, and UPDATE queries)*
![Query Outputs](screenshots/placeholder.png)
