# 🍽️ **OrderFlow: Restaurant Database Management System using MySQL & Stored Procedures**

OrderFlow is a relational database system designed for managing restaurant bookings, customer information, and courses. Built with **MySQL**, it integrates essential SQL features such as **stored procedures**, **views**, **joins**, and **subqueries** to provide efficient data management and retrieval. The project demonstrates advanced SQL techniques to streamline restaurant operations.

---

## 📌 **Project Highlights**

- ✅ **Relational Schema**: Includes `Customers`, `Bookings`, `Courses`, and `DeliveryAddress` tables, designed for efficient data organization.
- 📅 **Booking System**: Date-wise filtering of bookings with customer associations for a seamless reservation experience.
- 🔁 **Stored Procedure**: `GetBookingsData` to fetch bookings by specific dates, improving query reusability.
- 🧾 **Virtual Table (View)**: `BookingsView` to display filtered booking data based on specific criteria, ensuring efficient reporting.
- 🔄 **Dynamic Updates**: Utilized **UPDATE**, **ALTER**, and **subqueries** to perform real-time adjustments to data and structure.
- 📋 **Advanced SQL Features**: Demonstrates **constraints**, **foreign keys**, **string functions**, and more for maintaining data integrity and advanced querying.

---

## 🛠️ **Technologies Used**

- **Database**: MySQL 8.x
- **SQL Features**:
  - DDL (Data Definition Language)
  - DML (Data Manipulation Language)
  - Views & Joins
  - Grouping & Filtering
  - Stored Procedures
  - Constraints & Foreign Keys

---

## 🧱 **Schema Overview**

### **Tables**:

- **Customers**  
  - `CustomerID` *(PK)*  
  - `FullName`  
  - `PhoneNumber` *(Unique)*

- **Bookings**  
  - `BookingID`  
  - `BookingDate`  
  - `TableNumber`  
  - `NumberOfGuests`  
  - `CustomerID` *(FK)*

- **Courses**  
  - `CourseName` *(PK)*  
  - `Cost`  
  - `Ingredients` *(added later via ALTER)*

- **DeliveryAddress**  
  - `ID` *(PK)*  
  - `Address`  
  - `Type` *(default = 'Private')*  
  - `CustomerID` *(FK)*

---

## ⚙️ **How to Run**

1. Open MySQL Workbench or any MySQL client.
2. Copy the entire SQL script from this repo into a new query window.
3. Run the script step-by-step or all at once.
4. Use `CALL GetBookingsData('2023-08-01');` to test the stored procedure.
5. Use `SELECT * FROM BookingsView;` to check the filtered booking view.

---

## 🔍 **Key Stored Procedure**

```sql
CREATE PROCEDURE GetBookingsData (InputDate DATE)
SELECT * 
FROM Bookings 
WHERE BookingDate = InputDate;
