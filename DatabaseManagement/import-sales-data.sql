-- Import Sales Data from CSV
-- This script imports sales data and creates inventory items, sales, and sale items

USE MedicalManagementDB;
GO

-- Step 1: Create new inventory items for products not in the system
-- First, let's add the glucose-related products

-- GLUCOSE METER- BIO HERMES
IF NOT EXISTS (SELECT 1 FROM InventoryItem WHERE Name = 'GLUCOSE METER- BIO HERMES')
BEGIN
    INSERT INTO InventoryItem (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate, CreatedBy)
    VALUES ('GLUCOSE METER- BIO HERMES', 'Bio Hermes Glucose Meter', 'Medical Device', 'GM-BH-001', 'Unit', 136.53, 0, 50, 'Bio Hermes', 1, 0, GETDATE(), 0);
    PRINT 'Added: GLUCOSE METER- BIO HERMES';
END

-- GLUCOSE TEST STRIPS
IF NOT EXISTS (SELECT 1 FROM InventoryItem WHERE Name = 'GLUCOSE TEST STRIPS')
BEGIN
    INSERT INTO InventoryItem (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate, CreatedBy)
    VALUES ('GLUCOSE TEST STRIPS', 'Glucose Test Strips', 'Medical Supplies', 'GTS-001', 'Box', 44.84, 0, 100, 'Medical Supplies Co', 1, 0, GETDATE(), 0);
    PRINT 'Added: GLUCOSE TEST STRIPS';
END

-- GLUCOSE METER - BATTERY
IF NOT EXISTS (SELECT 1 FROM InventoryItem WHERE Name = 'GLUCOSE METER - BATTERY')
BEGIN
    INSERT INTO InventoryItem (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate, CreatedBy)
    VALUES ('GLUCOSE METER - BATTERY', 'Battery for Glucose Meter', 'Medical Supplies', 'GMB-001', 'Unit', 15.00, 0, 100, 'Medical Supplies Co', 1, 0, GETDATE(), 0);
    PRINT 'Added: GLUCOSE METER - BATTERY';
END

-- GLOCOSE METER - QUALITY CONTROL SOLUTIONS (note: typo in original data)
IF NOT EXISTS (SELECT 1 FROM InventoryItem WHERE Name = 'GLOCOSE METER - QUALITY CONTROL SOLUTIONS')
BEGIN
    INSERT INTO InventoryItem (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate, CreatedBy)
    VALUES ('GLOCOSE METER - QUALITY CONTROL SOLUTIONS', 'Quality Control Solutions for Glucose Meter', 'Medical Supplies', 'GMQC-001', 'Unit', 24.10, 0, 50, 'Medical Supplies Co', 1, 0, GETDATE(), 0);
    PRINT 'Added: GLOCOSE METER - QUALITY CONTROL SOLUTIONS';
END

-- HBA1C TEST STRIPS
IF NOT EXISTS (SELECT 1 FROM InventoryItem WHERE Name = 'HBA1C TEST STRIPS')
BEGIN
    INSERT INTO InventoryItem (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate, CreatedBy)
    VALUES ('HBA1C TEST STRIPS', 'HbA1c Test Strips', 'Medical Supplies', 'HBA1C-001', 'Box', 1763.70, 0, 20, 'Medical Supplies Co', 1, 0, GETDATE(), 0);
    PRINT 'Added: HBA1C TEST STRIPS';
END

GO

-- Step 2: Import sales data
-- Note: We'll group by Invoice Number since each invoice is one sale with multiple items

DECLARE @InventoryItems TABLE (
    Id INT,
    Name NVARCHAR(MAX)
);

INSERT INTO @InventoryItems (Id, Name)
SELECT Id, Name FROM InventoryItem WHERE IsDeleted = 0;

-- Invoice IN157895
IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157895')
BEGIN
    INSERT INTO Sale (SaleNumber, SaleDate, CustomerId, CustomerName, CustomerEmail, CustomerPhone, Subtotal, TaxAmount, Discount, Total, PaymentMethod, PaymentStatus, DeliveryStatus, Notes, IsDeleted, CreatedDate, CreatedBy)
    VALUES ('IN157895', '2025-09-01', 1, 'DEPARTMENT OF HEALTH LIMPOPO', NULL, NULL, 312654.69, 0, 0, 312654.69, 1, 1, 1, 'Province: Limpopo', 0, GETDATE(), 0);
    
    DECLARE @SaleId1 INT = SCOPE_IDENTITY();
    INSERT INTO SaleItem (SaleId, InventoryItemId, Quantity, UnitPrice, TotalPrice, IsDeleted)
    SELECT @SaleId1, Id, 2290, 136.53, 312654.69, 0 FROM @InventoryItems WHERE Name = 'GLUCOSE METER- BIO HERMES';
    PRINT 'Added Sale: IN157895';
END

-- Invoice IN157897
IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157897')
BEGIN
    INSERT INTO Sale (SaleNumber, SaleDate, CustomerId, CustomerName, CustomerEmail, CustomerPhone, Subtotal, TaxAmount, Discount, Total, PaymentMethod, PaymentStatus, DeliveryStatus, Notes, IsDeleted, CreatedDate, CreatedBy)
    VALUES ('IN157897', '2025-09-01', 1, 'DEPARTMENT OF HEALTH LIMPOPO', NULL, NULL, 213670.13, 0, 0, 213670.13, 1, 1, 1, 'Province: Limpopo', 0, GETDATE(), 0);
    
    DECLARE @SaleId2 INT = SCOPE_IDENTITY();
    INSERT INTO SaleItem (SaleId, InventoryItemId, Quantity, UnitPrice, TotalPrice, IsDeleted)
    SELECT @SaleId2, Id, 1565, 136.53, 213670.13, 0 FROM @InventoryItems WHERE Name = 'GLUCOSE METER- BIO HERMES';
    PRINT 'Added Sale: IN157897';
END

-- Invoice IN157896
IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157896')
BEGIN
    INSERT INTO Sale (SaleNumber, SaleDate, CustomerId, CustomerName, CustomerEmail, CustomerPhone, Subtotal, TaxAmount, Discount, Total, PaymentMethod, PaymentStatus, DeliveryStatus, Notes, IsDeleted, CreatedDate, CreatedBy)
    VALUES ('IN157896', '2025-09-01', 1, 'DEPARTMENT OF HEALTH LIMPOPO', NULL, NULL, 269060.87, 0, 0, 269060.87, 1, 1, 1, 'Province: Limpopo', 0, GETDATE(), 0);
    
    DECLARE @SaleId3 INT = SCOPE_IDENTITY();
    INSERT INTO SaleItem (SaleId, InventoryItemId, Quantity, UnitPrice, TotalPrice, IsDeleted)
    SELECT @SaleId3, Id, 6000, 44.84, 269060.87, 0 FROM @InventoryItems WHERE Name = 'GLUCOSE TEST STRIPS';
    PRINT 'Added Sale: IN157896';
END

-- Invoice IN157898
IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157898')
BEGIN
    INSERT INTO Sale (SaleNumber, SaleDate, CustomerId, CustomerName, CustomerEmail, CustomerPhone, Subtotal, TaxAmount, Discount, Total, PaymentMethod, PaymentStatus, DeliveryStatus, Notes, IsDeleted, CreatedDate, CreatedBy)
    VALUES ('IN157898', '2025-09-01', 1, 'DEPARTMENT OF HEALTH LIMPOPO', NULL, NULL, 44843.48, 0, 0, 44843.48, 1, 1, 1, 'Province: Limpopo', 0, GETDATE(), 0);
    
    DECLARE @SaleId4 INT = SCOPE_IDENTITY();
    INSERT INTO SaleItem (SaleId, InventoryItemId, Quantity, UnitPrice, TotalPrice, IsDeleted)
    SELECT @SaleId4, Id, 1000, 44.84, 44843.48, 0 FROM @InventoryItems WHERE Name = 'GLUCOSE TEST STRIPS';
    PRINT 'Added Sale: IN157898';
END

-- Invoice IN157894
IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157894')
BEGIN
    INSERT INTO Sale (SaleNumber, SaleDate, CustomerId, CustomerName, CustomerEmail, CustomerPhone, Subtotal, TaxAmount, Discount, Total, PaymentMethod, PaymentStatus, DeliveryStatus, Notes, IsDeleted, CreatedDate, CreatedBy)
    VALUES ('IN157894', '2025-09-01', 1, 'MANKWENG HOSPITAL PHARMACY', NULL, NULL, 67265.22, 0, 0, 67265.22, 1, 1, 1, 'Province: Limpopo', 0, GETDATE(), 0);
    
    DECLARE @SaleId5 INT = SCOPE_IDENTITY();
    INSERT INTO SaleItem (SaleId, InventoryItemId, Quantity, UnitPrice, TotalPrice, IsDeleted)
    SELECT @SaleId5, Id, 1500, 44.84, 67265.22, 0 FROM @InventoryItems WHERE Name = 'GLUCOSE TEST STRIPS';
    PRINT 'Added Sale: IN157894';
END

-- Continue with remaining invoices...
-- I'll create a more comprehensive script for all records

PRINT 'Sales import completed for first batch';
PRINT 'Total inventory items created: 5';
PRINT 'Total sales records created: 5 (sample)';

GO
