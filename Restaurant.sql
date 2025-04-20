CREATE DATABASE IF NOT EXISTS Restaurant;
SHOW DATABASES;
USE Restaurant;

CREATE TABLE Customers(
    CustomerID INT NOT NULL PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    PhoneNumber INT NOT NULL UNIQUE
);

SHOW TABLES;

INSERT INTO Customers(CustomerID, FullName, PhoneNumber) VALUES 
(1, "Olivia Bennett", 987654320), 
(2, "Liam Johnson", 987654321), 
(3, "Emma Thompson", 987654381), 
(4, "Noah Davis", 987654921), 
(5, "Ava Martinez", 987664321),     
(6, "William Clark", 987854321),      
(7, "Sophia Lewis", 987604321),      
(8, "James Walker", 987624321),      
(9, "Isabella Hall", 997654321),     
(10, "Mason Allen", 957654321);

SELECT * FROM Customers;

CREATE TABLE Bookings(
    BookingID INT,
    BookingDate DATE,
    TableNumber INT,
    NumberOfGuests INT,
    CustomerID INT
);

INSERT INTO Bookings 
(BookingID, BookingDate, TableNumber, NumberOfGuests, CustomerID) 
VALUES
(101, '2023-08-01', 4, 3, 1),  
(102, '2023-08-01', 2, 2, 2),  
(103, '2023-08-02', 6, 4, 3), 
(104, '2023-08-02', 1, 5, 4),  
(105, '2023-08-03', 5, 2, 5),  
(106, '2023-08-03', 3, 2, 6), 
(107, '2023-08-03', 8, 6, 7),  
(108, '2023-08-04', 2, 3, 8),  
(109, '2023-08-04', 1, 2, 9), 
(110, '2023-08-05', 6, 4, 10),  
(111, '2023-08-06', 3, 2, 2),  
(112, '2023-08-06', 5, 3, 4);


SELECT * FROM Bookings;

CREATE TABLE Courses(
    CourseName VARCHAR(255) PRIMARY KEY,
    Cost DECIMAL(4,2)
);

INSERT INTO Courses (CourseName, Cost) VALUES 
("Caesar Salad", 13.00), 
("Tomato Basil Soup", 10.75), 
("Margherita Pizza", 14.50), 
("Spaghetti Bolognese", 13.25), 
("Grilled Chicken Skewers", 16.80), 
("Falafel Wrap", 11.90);

SELECT * FROM Courses;
SHOW TABLES;

SELECT * 
FROM Bookings 
WHERE BookingDate BETWEEN '2025-08-01' AND '2025-08-06';

SELECT Customers.FullName, Bookings.BookingID 
FROM Customers RIGHT JOIN Bookings 
ON Customers.CustomerID = Bookings.CustomerID 
WHERE BookingDate = '2025-08-01';

SELECT BookingDate, COUNT(BookingDate) 
FROM Bookings 
GROUP BY BookingDate;

UPDATE Courses SET Cost = 17.00 WHERE CourseName = "Margherita Pizza";
SELECT * FROM Courses;

CREATE TABLE DeliveryAddress(     
    ID INT PRIMARY KEY,     
    Address VARCHAR(255) NOT NULL,     
    Type VARCHAR(100) NOT NULL DEFAULT "Private",     
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

SHOW COLUMNS FROM DeliveryAddress;

ALTER TABLE Courses ADD COLUMN Ingredients VARCHAR(255);
SHOW COLUMNS FROM Courses;

SELECT FullName 
FROM Customers 
WHERE (
    SELECT CustomerID 
    FROM Bookings 
    WHERE Customers.CustomerID = Bookings.CustomerID 
    AND BookingDate = "2021-08-03"
);

CREATE VIEW BookingsView AS 
SELECT BookingID, BookingDate, NumberOfGuests 
FROM Bookings 
WHERE NumberOfGuests > 3 
AND BookingDate < "2021-08-06";

SELECT * FROM BookingsView;

CREATE PROCEDURE GetBookingsData (InputDate DATE) 
SELECT * 
FROM Bookings 
WHERE BookingDate = InputDate;

CALL GetBookingsData ("2021-08-01");

SELECT CONCAT("ID: ", BookingID,', Date: ', BookingDate,', Number of guests: ', NumberOfGuests) AS "Booking Details" 
FROM Bookings;
