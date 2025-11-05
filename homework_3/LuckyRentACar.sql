-- =======================================
--  LUCKY RENT-A-CAR DATABASE - FULL SCRIPT
-- =======================================

-- Eðer veritabaný zaten varsa, sil
IF DB_ID('LuckyRentACar') IS NOT NULL
BEGIN
    ALTER DATABASE LuckyRentACar SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE LuckyRentACar;
END
GO

-- Yeni veritabanýný oluþtur
CREATE DATABASE LuckyRentACar;
GO

-- Bu veritabanýný kullan
USE LuckyRentACar;
GO

-- =======================================
-- MANUFACTURER TABLE
-- =======================================
CREATE TABLE Manufacturer (
    Manufacturer_Name VARCHAR(50) PRIMARY KEY,
    Manufacturer_Country VARCHAR(50),
    Sales_Rep_Name VARCHAR(50),
    Sales_Rep_Telephone VARCHAR(20)
);

-- ÖRNEK VERÝLER
INSERT INTO Manufacturer VALUES
('Toyota', 'Japan', 'Hiro Tanaka', '+81-45-123-4567'),
('Ford', 'USA', 'John Miller', '+1-313-555-1000'),
('BMW', 'Germany', 'Klara Schmidt', '+49-89-123-7777');


-- =======================================
-- CAR TABLE
-- =======================================
CREATE TABLE Car (
    Car_Serial_Number INT PRIMARY KEY,
    Model VARCHAR(50),
    Year INT,
    Class VARCHAR(30),
    Manufacturer_Name VARCHAR(50),
    FOREIGN KEY (Manufacturer_Name) REFERENCES Manufacturer(Manufacturer_Name)
);

-- ÖRNEK VERÝLER
INSERT INTO Car VALUES
(1001, 'Corolla', 2022, 'Sedan', 'Toyota'),
(1002, 'RAV4', 2021, 'SUV', 'Toyota'),
(2001, 'Focus', 2020, 'Hatchback', 'Ford'),
(3001, 'X5', 2023, 'SUV', 'BMW');


-- =======================================
-- CUSTOMER TABLE
-- =======================================
CREATE TABLE Customer (
    Customer_Number INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Customer_Address VARCHAR(100),
    Customer_Telephone VARCHAR(20),
    Customer_Credit_Rating VARCHAR(20)
);

-- ÖRNEK VERÝLER
INSERT INTO Customer VALUES
(1, 'Ali Yýlmaz', 'Ankara, Turkey', '+90-312-111-1111', 'A'),
(2, 'Ayþe Demir', 'Ýstanbul, Turkey', '+90-212-222-2222', 'B'),
(3, 'Mehmet Kaya', 'Ýzmir, Turkey', '+90-232-333-3333', 'A');


-- =======================================
-- MAINTENANCE TABLE
-- =======================================
CREATE TABLE Maintenance (
    Repair_Number INT PRIMARY KEY,
    Car_Serial_Number INT,
    Date DATE,
    Repair_Procedure VARCHAR(100),
    Mileage INT,
    Repair_Time INT,
    FOREIGN KEY (Car_Serial_Number) REFERENCES Car(Car_Serial_Number)
);

-- ÖRNEK VERÝLER
INSERT INTO Maintenance VALUES
(501, 1001, '2023-05-10', 'Oil Change', 15000, 2),
(502, 2001, '2024-01-15', 'Brake Replacement', 30000, 4),
(503, 3001, '2024-06-01', 'Engine Check', 12000, 3);


-- =======================================
-- RENTAL TABLE
-- =======================================
CREATE TABLE Rental (
    Car_Serial_Number INT,
    Customer_Number INT,
    Rental_Date DATE,
    Return_Date DATE,
    Total_Cost DECIMAL(10,2),
    PRIMARY KEY (Car_Serial_Number, Customer_Number, Rental_Date),
    FOREIGN KEY (Car_Serial_Number) REFERENCES Car(Car_Serial_Number),
    FOREIGN KEY (Customer_Number) REFERENCES Customer(Customer_Number)
);

-- ÖRNEK VERÝLER
INSERT INTO Rental VALUES
(1001, 1, '2024-02-10', '2024-02-15', 5000.00),
(2001, 2, '2024-03-05', '2024-03-10', 4200.00),
(3001, 3, '2024-04-20', '2024-04-28', 8000.00);


-- =======================================
-- KONTROL AMAÇLI GÖSTERÝM (ÝSTEÐE BAÐLI)
-- =======================================
SELECT * FROM Manufacturer;
SELECT * FROM Car;
SELECT * FROM Customer;
SELECT * FROM Maintenance;
SELECT * FROM Rental;
