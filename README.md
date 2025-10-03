# Task 8 - Stored Procedures and Functions

## Objective

Learn to create **reusable SQL blocks** using **stored procedures** and **functions**
This task helps modularize SQL logic, making queries reusable, maintainable, and efficient.

## Tools

- VS Code with MySQL extension
- DB Browser for MySQL

## Database Dependency

This task uses the **same e-commerce database** created in previous tasks (Task 5–7) with the following tables:  
- `Customers(customer_id, customer_name, city)`  
- `Orders(order_id, customer_id, order_date, amount)`

> Do not require to create the tables if its following from the previous tasks.

## Deliverables

1. At least **one stored procedure**
2. At least **one function**

## Learning Outcomes

- Understand the difference between **procedures and functions**  
- Learn to use **IN/OUT parameters**  
- Modularize SQL logic for **reusability and maintainability**  
- Apply **conditional logic** inside stored routines  
- Know how to **call and debug** procedures/functions

## How to Run

1. Open **VS Code** (or MySQL Workbench) and connect to your MySQL database.
2. Make sure your **Customers** and **Orders** tables exist (from previous tasks).
3. Open the SQL file containing the **stored procedure and function**.
4. Execute the SQL code to **create the procedure and function**.
5. To test the procedure:  **CALL GetCustomerOrders(1);**
6. To test the function: **SELECT GetTotalOrders(1) AS TotalOrders;**
