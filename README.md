# Online Retail Management System 

Iam Nalweyiso Racheal.

## Project Description
This is my course project for DBMS. I designed and built a database for an **Online Retail Management System**. It helps to manage and keep track of customers, product categories, products in stock, orders placed, order items, and payments. I also added some views and database triggers to help with data safety and reporting.

## Tables Created
1. **Customers**: Holds customer info like name, email, phone, and address.
2. **Categories**: For grouping products (like Electronics, Clothing, etc.).
3. **Products**: Contains products details, prices, and stock numbers.
4. **Orders**: Tracks customer orders, dates, and order status.
5. **OrderItems**: Links products and orders together (since an order can have multiple products).
6. **Payments**: Records payments made for each order.

## How to Import and Run the Database
1. Make sure you have a MySQL server running (I used XAMPP).
2. Open phpMyAdmin or your preferred database tool.
3. Import the online_retail_management.sql file:
   - **Using phpMyAdmin**: Select the server, click the Import tab at the top, select the online_retail_management.sql file, and click "Go".
   - **Using Terminal**: You can run this command to import it:
     
     mysql -u root -p < online_retail_management.sql
     
4. The script will automatically create the online_retail_management database, build all the tables, load the sample data, and set up the views and triggers.

## Project Files
- online_retail_management.sql: The main SQL script with all the queries, table creations, and insert commands.
- DBMS_TakeHome_Report.md: My main documentation report for the project.
- screenshots/: Folder where I put screenshots of my database working.
- README.md: This file.
