-- Crear la base de datos
CREATE DATABASE BebidasDB;

-- Usar la base de datos
USE BebidasDB;
--Crear la tabla Vendors (Proveedores)
CREATE TABLE Vendors (
    VendorNumber INT PRIMARY KEY,
    VendorName VARCHAR(255) NOT NULL
);
--Crear la tabla PurchasePrices2017 (Precios de compra 2017)
CREATE TABLE PurchasePrices2017 (
    Brand VARCHAR(255),
    Description VARCHAR(255),
    Price DECIMAL(10, 2),
    Size VARCHAR(50),
    Volume VARCHAR(50),
    Classification VARCHAR(50),
    PurchasePrice DECIMAL(10, 2),
    VendorNumber INT,
    FOREIGN KEY (VendorNumber) REFERENCES Vendors(VendorNumber)
);
--Crear la tabla Sales2016 (Ventas 2016)
CREATE TABLE Sales2016 (
    InventoryId INT,
    Store VARCHAR(255),
    Description VARCHAR(255),
    SalesQuantity INT,
    SalesDollars DECIMAL(10, 2),
    SalesTax DECIMAL(10, 2),
    Volume VARCHAR(50),
    Classification VARCHAR(50),
    VendorNumber INT,
    VendorName VARCHAR(255),
    FOREIGN KEY (VendorNumber) REFERENCES Vendors(VendorNumber)
);
--Crear la tabla InvoicePurchases2016 (Facturas de compras 2016)
CREATE TABLE InvoicePurchases2016 (
    VendorNumber INT,
    VendorName VARCHAR(255),
    InvoiceDate DATE,
    PONumber VARCHAR(50),
    PayDate DATE,
    Quantity INT,
    Dollars DECIMAL(10, 2),
    Freight DECIMAL(10, 2),
    Approval VARCHAR(50),
    FOREIGN KEY (VendorNumber) REFERENCES Vendors(VendorNumber)
);
--Crear la tabla Purchases2016 (Compras 2016)
CREATE TABLE Purchases2016 (
    InventoryId INT,
    Store VARCHAR(255),
    Brand VARCHAR(255),
    Description VARCHAR(255),
    Size VARCHAR(50),
    Volume VARCHAR(50),
    VendorNumber INT,
    PONumber VARCHAR(50),
    InvoiceDate DATE,
    PayDate DATE,
    PurchasePrice DECIMAL(10, 2),
    Quantity INT,
    PayDollars DECIMAL(10, 2),
    PRIMARY KEY (InventoryId),
    FOREIGN KEY (VendorNumber) REFERENCES Vendors(VendorNumber)
);
--Crear la tabla BegInv2016 (Inventario inicial 2016)
CREATE TABLE BegInv2016 (
    InventoryId INT PRIMARY KEY,
    Store VARCHAR(255),
    City VARCHAR(255),
    Description VARCHAR(255)
);
--Crear la tabla EndInv2016 (Inventario final 2016)
CREATE TABLE EndInv2016 (
    InventoryId INT PRIMARY KEY,
    Store VARCHAR(255),
    City VARCHAR(255),
    Description VARCHAR(255)
);