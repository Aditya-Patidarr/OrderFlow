# 🍽️ Restaurant Database Project using MySQL & Stored Procedures

This project showcases a mini relational database system for a restaurant, built with **MySQL**. It includes tables for customers, bookings, courses, and delivery addresses. Key SQL concepts are demonstrated, including **joins**, **views**, **grouping**, **subqueries**, **altering table structure**, and **stored procedures**.

---

## 📌 Project Highlights

- ✅ Relational schema using `Customers`, `Bookings`, `Courses`, and `DeliveryAddress` tables.
- 📅 Booking system with date-wise filtering and customer associations.
- 🔁 Stored Procedure: `GetBookingsData` to fetch bookings by date.
- 🧾 Virtual Table (View): `BookingsView` for filtering key booking data.
- 🔄 Dynamic updates and conditional operations like `UPDATE`, `ALTER`, and subqueries.
- 📋 Demonstrates advanced SQL features: constraints, views, string functions, and more.

---

## 🛠️ Technologies Used

- **Database**: MySQL 8.x
- **SQL Features**: 
  - DDL (Data Definition Language)
  - DML (Data Manipulation Language)
  - Views & Joins
  - Grouping & Filtering
  - Stored Procedures
  - Constraints & Foreign Keys

---

## 🧱 Schema Overview

### Tables:

- **Customers**
  - CustomerID *(PK)*
  - FullName
  - PhoneNumber *(Unique)*

- **Bookings**
  - BookingID
  - BookingDate
  - TableNumber
  - NumberOfGuests
  - CustomerID *(FK)*

- **Courses**
  - CourseName *(PK)*
  - Cost
  - Ingredients *(added later via ALTER)*

- **DeliveryAddress**
  - ID *(PK)*
  - Address
  - Type *(default = 'Private')*
  - CustomerID *(FK)*

---

## ⚙️ How to Run

1. Open MySQL Workbench or any MySQL client.
2. Copy the entire SQL script from this repo into a new query window.
3. Run the script step-by-step or all at once.
4. Use `CALL GetBookingsData('2023-08-01');` to test the stored procedure.
5. Use `SELECT * FROM BookingsView;` to check the filtered booking view.

---

## 🔍 Key Stored Procedure

```sql
CREATE PROCEDURE GetBookingsData (InputDate DATE)
SELECT * 
FROM Bookings 
WHERE BookingDate = InputDate;
