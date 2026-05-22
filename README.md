# Online Retail Management System (DBMS Project)

**Student Name:** Racheal
**Course:** Database Management Systems (DBMS)

## Project Description
This repository contains the database design and implementation for an **Online Retail Management System**. The database is modeled based on a research proposal/concept paper to manage an online retail store's core entities. It helps keep track of customers, products available in various categories, the orders placed, the items inside each order, and the payments made. It leverages advanced database features such as Views and Triggers to ensure data integrity and ease of reporting.

## List of Tables Created
1. **Customers**: Stores the retail store's customer base.
2. **Categories**: Holds product classification categories.
3. **Products**: Contains inventory and pricing details.
4. **Orders**: Tracks order statuses and total amounts.
5. **OrderItems**: Maps products to specific orders (Many-to-Many resolution).
6. **Payments**: Records transaction logs for the orders.

## Instructions for Importing/Running the Database
1. Make sure you have a MySQL Server installed (e.g., XAMPP, WAMP, or standalone MySQL).
2. Open your preferred MySQL client (MySQL Workbench, phpMyAdmin, or terminal).
3. Connect to your database server.
4. Run the SQL script provided in this repository:
   - **Using phpMyAdmin**: Go to the "Import" tab, choose the `online_retail_management.sql` file, and click "Go".
   - **Using MySQL Workbench**: Open the `online_retail_management.sql` script via `File > Open SQL Script...` and execute the entire script (click the lightning bolt icon).
   - **Using Command Line**:
     ```bash
     mysql -u your_username -p < online_retail_management.sql
     ```
5. The script will automatically create the database `online_retail_management`, create all the tables, insert sample data, create views, and create triggers.

## Repository Contents
- `online_retail_management.sql`: The main SQL script containing all DDL and DML commands.
- `DBMS_TakeHome_Report.md`: Documentation report (can be exported to PDF).
- `screenshots/`: Folder intended for screenshots of database operations.
- `README.md`: This descriptive file.
