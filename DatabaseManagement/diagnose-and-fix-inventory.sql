-- =============================================================================
-- Diagnose and Fix Inventory Database Issues
-- =============================================================================
-- Purpose: Check if all inventory items exist and insert missing ones
-- Issue: API only returning 20 items, hemoglobin meter missing
-- =============================================================================

SET NOCOUNT ON;

PRINT '═══════════════════════════════════════════════════════════════';
PRINT '  INVENTORY DATABASE DIAGNOSTIC & FIX';
PRINT '═══════════════════════════════════════════════════════════════';
PRINT '';

-- =============================================================================
-- STEP 1: Check current inventory count
-- =============================================================================
PRINT '1. Current Inventory Status:';
PRINT '─────────────────────────────────────────────────────────────';

SELECT 
    COUNT(*) AS TotalItems,
    COUNT(CASE WHEN IsDeleted = 0 THEN 1 END) AS ActiveItems,
    COUNT(CASE WHEN IsDeleted = 1 THEN 1 END) AS DeletedItems
FROM InventoryItems;

PRINT '';
PRINT '2. Current Items by Category:';
PRINT '─────────────────────────────────────────────────────────────';

SELECT 
    Category,
    CASE Category
        WHEN 1 THEN 'Hemoglobin Testing'
        WHEN 2 THEN 'Glucose Testing'
        WHEN 3 THEN 'HBA1C Testing'
        WHEN 4 THEN 'Multiparameter Testing'
        WHEN 5 THEN 'Quality Control'
        WHEN 6 THEN 'Equipment Accessories'
        WHEN 7 THEN 'Disposables'
        WHEN 8 THEN 'Medical Equipment'
        ELSE 'Unknown'
    END AS CategoryName,
    COUNT(*) AS ItemCount
FROM InventoryItems
WHERE IsDeleted = 0
GROUP BY Category
ORDER BY Category;

PRINT '';
PRINT '3. Check for Hemoglobin Meter:';
PRINT '─────────────────────────────────────────────────────────────';

SELECT Id, Name, SKU, Category, StockAvailable, IsDeleted
FROM InventoryItems
WHERE Name LIKE '%HEMOGLOBIN%METER%' OR SKU LIKE '%NDOH35002%';

IF @@ROWCOUNT = 0
    PRINT '  ⚠️ WARNING: Hemoglobin Meter NOT FOUND!';
ELSE
    PRINT '  ✓ Hemoglobin Meter found';

PRINT '';
PRINT '4. All Current Items:';
PRINT '─────────────────────────────────────────────────────────────';

SELECT Id, SKU, Name, Category, StockAvailable, Status, IsDeleted
FROM InventoryItems
ORDER BY Id;

PRINT '';
PRINT '═══════════════════════════════════════════════════════════════';
PRINT '  CHECKING FOR MISSING ITEMS';
PRINT '═══════════════════════════════════════════════════════════════';

-- Create temp table with expected items
IF OBJECT_ID('tempdb..#ExpectedItems') IS NOT NULL DROP TABLE #ExpectedItems;

CREATE TABLE #ExpectedItems (
    SKU NVARCHAR(50),
    Name NVARCHAR(500),
    Category INT,
    Expected BIT DEFAULT 1
);

-- Insert all expected items from schema
INSERT INTO #ExpectedItems (SKU, Name, Category) VALUES
('NDOH35002', 'HEMOGLOBIN METER - BIO AID HB METER', 1),
('NDOH35003', 'HEMOGLOBIN TEST STRIPS', 1),
('NDOH35013', 'HEMOGLOBIN METER - BATTERY', 6),
('NDOH35014', 'HEMOGLOBIN METER - QUALITY CONTROL SOLUTIONS', 5),
('NDOH35015', 'HEMOGLOBIN METER - SINGLE USE DISPOSABLE LANCET', 7),
('NDOH35016', 'GLUCOSE METER - BATTERY', 6),
('NDOH35017', 'GLUCOSE TEST STRIPS', 2),
('NDOH35004', 'GLUCOSE METER- BIO HERMES', 2),
('NDOH35018', 'GLOCOSE METER - QUALITY CONTROL SOLUTIONS', 5),
('NDOH35006', 'DUAL GLUCOSE & HBA1C METER- BIOHERMES', 2),
('NDOH35034', 'HBA1C TEST STRIPS', 3),
('NDOH35005', 'MULTIPARAMETER - TAIDOC', 4),
('NDOH35019', 'MULTIPARAMETER - 50 KETONE TEST STRIPS VIAL', 4),
('NDOH35020', 'MULTIPARAMETER - 50 URIC ACID VIAL', 4),
('NDOH35021', 'MULTIPARAMETER - 50 CHOLESTEROL VIAL', 4),
('NDOH35022', 'MULTIPARAMETER - 50 LACTATE VIAL', 4),
('NDOH35036', 'DUAL GLUCOSE & HBA1C - QUALITY CONTROL SOLUTION HBA1C', 5),
('NDOH35037', 'DUAL GLUCOSE & HBA1C - QUALITY CONTROL SOLUTIONS GLUCOSE', 5);

-- Check for missing items
PRINT 'Missing Items:';
PRINT '─────────────────────────────────────────────────────────────';

SELECT e.SKU, e.Name, e.Category
FROM #ExpectedItems e
LEFT JOIN InventoryItems i ON e.SKU = i.SKU AND i.IsDeleted = 0
WHERE i.Id IS NULL;

DECLARE @MissingCount INT = @@ROWCOUNT;

IF @MissingCount > 0
BEGIN
    PRINT '';
    PRINT CONCAT('⚠️  Found ', @MissingCount, ' missing items!');
    PRINT '';
END
ELSE
BEGIN
    PRINT '✓ All expected items are present';
    PRINT '';
END

PRINT '';
PRINT '═══════════════════════════════════════════════════════════════';
PRINT '  FIX: INSERT MISSING INVENTORY ITEMS';
PRINT '═══════════════════════════════════════════════════════════════';
PRINT '';

BEGIN TRY
    BEGIN TRANSACTION;

    -- Insert missing items with proper mapping
    DECLARE @InsertedCount INT = 0;

    -- NDOH35002 - Hemoglobin Meter
    IF NOT EXISTS (SELECT 1 FROM InventoryItems WHERE SKU = 'NDOH35002' AND IsDeleted = 0)
    BEGIN
        INSERT INTO InventoryItems (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate)
        VALUES ('HEMOGLOBIN METER - BIO AID HB METER', 'Bio Aid HB Meter for hemoglobin testing', 1, 'NDOH35002', 'Each', 455.04, 8406, 100, 'Bio Aid Medical', 1, 0, GETDATE());
        SET @InsertedCount = @InsertedCount + 1;
        PRINT '  ✓ Inserted: HEMOGLOBIN METER - BIO AID HB METER';
    END

    -- NDOH35003 - Hemoglobin Test Strips
    IF NOT EXISTS (SELECT 1 FROM InventoryItems WHERE SKU = 'NDOH35003' AND IsDeleted = 0)
    BEGIN
        INSERT INTO InventoryItems (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate)
        VALUES ('HEMOGLOBIN TEST STRIPS', 'Test strips for hemoglobin meters', 1, 'NDOH35003', 'Box', 160.25, 24442, 500, 'Bio Aid Medical', 1, 0, GETDATE());
        SET @InsertedCount = @InsertedCount + 1;
        PRINT '  ✓ Inserted: HEMOGLOBIN TEST STRIPS';
    END

    -- NDOH35013 - Hemoglobin Meter Battery
    IF NOT EXISTS (SELECT 1 FROM InventoryItems WHERE SKU = 'NDOH35013' AND IsDeleted = 0)
    BEGIN
        INSERT INTO InventoryItems (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate)
        VALUES ('HEMOGLOBIN METER - BATTERY', 'Replacement battery for hemoglobin meters', 6, 'NDOH35013', 'Each', 10.53, 0, 50, 'Battery Suppliers Inc', 3, 0, GETDATE());
        SET @InsertedCount = @InsertedCount + 1;
        PRINT '  ✓ Inserted: HEMOGLOBIN METER - BATTERY';
    END

    -- NDOH35014 - Hemoglobin QC Solutions
    IF NOT EXISTS (SELECT 1 FROM InventoryItems WHERE SKU = 'NDOH35014' AND IsDeleted = 0)
    BEGIN
        INSERT INTO InventoryItems (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate)
        VALUES ('HEMOGLOBIN METER - QUALITY CONTROL SOLUTIONS', 'Quality control solutions for hemoglobin meters', 5, 'NDOH35014', 'Each', 138.58, 0, 20, 'Quality Control Ltd', 3, 0, GETDATE());
        SET @InsertedCount = @InsertedCount + 1;
        PRINT '  ✓ Inserted: HEMOGLOBIN METER - QUALITY CONTROL SOLUTIONS';
    END

    -- NDOH35015 - Disposable Lancet
    IF NOT EXISTS (SELECT 1 FROM InventoryItems WHERE SKU = 'NDOH35015' AND IsDeleted = 0)
    BEGIN
        INSERT INTO InventoryItems (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate)
        VALUES ('HEMOGLOBIN METER - SINGLE USE DISPOSABLE LANCET', 'Single use disposable lancet for blood sampling', 7, 'NDOH35015', 'Each', 0.56, 500, 1000, 'Disposables Direct', 2, 0, GETDATE());
        SET @InsertedCount = @InsertedCount + 1;
        PRINT '  ✓ Inserted: HEMOGLOBIN METER - SINGLE USE DISPOSABLE LANCET';
    END

    -- NDOH35016 - Glucose Meter Battery
    IF NOT EXISTS (SELECT 1 FROM InventoryItems WHERE SKU = 'NDOH35016' AND IsDeleted = 0)
    BEGIN
        INSERT INTO InventoryItems (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate)
        VALUES ('GLUCOSE METER - BATTERY', 'Replacement battery for glucose meters', 6, 'NDOH35016', 'Each', 8.31, 0, 100, 'Battery Suppliers Inc', 3, 0, GETDATE());
        SET @InsertedCount = @InsertedCount + 1;
        PRINT '  ✓ Inserted: GLUCOSE METER - BATTERY';
    END

    -- NDOH35017 - Glucose Test Strips
    IF NOT EXISTS (SELECT 1 FROM InventoryItems WHERE SKU = 'NDOH35017' AND IsDeleted = 0)
    BEGIN
        INSERT INTO InventoryItems (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate)
        VALUES ('GLUCOSE TEST STRIPS', 'Test strips for glucose meters (50 pack)', 2, 'NDOH35017', '50Pack', 51.57, 2321, 1000, 'Glucose Solutions SA', 2, 0, GETDATE());
        SET @InsertedCount = @InsertedCount + 1;
        PRINT '  ✓ Inserted: GLUCOSE TEST STRIPS';
    END

    -- NDOH35004 - Glucose Meter
    IF NOT EXISTS (SELECT 1 FROM InventoryItems WHERE SKU = 'NDOH35004' AND IsDeleted = 0)
    BEGIN
        INSERT INTO InventoryItems (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate)
        VALUES ('GLUCOSE METER- BIO HERMES', 'Bio Hermes glucose meter', 2, 'NDOH35004', 'Each', 157.01, 7092, 200, 'Bio Hermes Medical', 1, 0, GETDATE());
        SET @InsertedCount = @InsertedCount + 1;
        PRINT '  ✓ Inserted: GLUCOSE METER- BIO HERMES';
    END

    -- NDOH35018 - Glucose QC Solutions
    IF NOT EXISTS (SELECT 1 FROM InventoryItems WHERE SKU = 'NDOH35018' AND IsDeleted = 0)
    BEGIN
        INSERT INTO InventoryItems (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate)
        VALUES ('GLOCOSE METER - QUALITY CONTROL SOLUTIONS', 'Quality control solutions for glucose meters', 5, 'NDOH35018', 'Each', 27.72, 569, 100, 'Quality Control Ltd', 2, 0, GETDATE());
        SET @InsertedCount = @InsertedCount + 1;
        PRINT '  ✓ Inserted: GLOCOSE METER - QUALITY CONTROL SOLUTIONS';
    END

    -- NDOH35006 - Dual Glucose & HBA1C Meter
    IF NOT EXISTS (SELECT 1 FROM InventoryItems WHERE SKU = 'NDOH35006' AND IsDeleted = 0)
    BEGIN
        INSERT INTO InventoryItems (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate)
        VALUES ('DUAL GLUCOSE & HBA1C METER- BIOHERMES', 'Dual function glucose and HBA1C meter', 2, 'NDOH35006', 'Each', 2527.98, 1483, 50, 'Bio Hermes Medical', 1, 0, GETDATE());
        SET @InsertedCount = @InsertedCount + 1;
        PRINT '  ✓ Inserted: DUAL GLUCOSE & HBA1C METER- BIOHERMES';
    END

    -- NDOH35034 - HBA1C Test Strips
    IF NOT EXISTS (SELECT 1 FROM InventoryItems WHERE SKU = 'NDOH35034' AND IsDeleted = 0)
    BEGIN
        INSERT INTO InventoryItems (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate)
        VALUES ('HBA1C TEST STRIPS', 'HBA1C test strips (50 pack)', 3, 'NDOH35034', '50Pack', 2028.26, 1974, 100, 'HBA1C Diagnostics', 1, 0, GETDATE());
        SET @InsertedCount = @InsertedCount + 1;
        PRINT '  ✓ Inserted: HBA1C TEST STRIPS';
    END

    -- NDOH35005 - Multiparameter Taidoc
    IF NOT EXISTS (SELECT 1 FROM InventoryItems WHERE SKU = 'NDOH35005' AND IsDeleted = 0)
    BEGIN
        INSERT INTO InventoryItems (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate)
        VALUES ('MULTIPARAMETER - TAIDOC', 'Taidoc multiparameter testing device', 4, 'NDOH35005', 'Each', 607.10, 6971, 100, 'Taidoc Technology', 1, 0, GETDATE());
        SET @InsertedCount = @InsertedCount + 1;
        PRINT '  ✓ Inserted: MULTIPARAMETER - TAIDOC';
    END

    -- NDOH35019 - Ketone Test Strips
    IF NOT EXISTS (SELECT 1 FROM InventoryItems WHERE SKU = 'NDOH35019' AND IsDeleted = 0)
    BEGIN
        INSERT INTO InventoryItems (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate)
        VALUES ('MULTIPARAMETER - 50 KETONE TEST STRIPS VIAL', 'Ketone test strips for multiparameter device (50 pack)', 4, 'NDOH35019', '50Pack', 460.78, 2470, 500, 'Taidoc Technology', 2, 0, GETDATE());
        SET @InsertedCount = @InsertedCount + 1;
        PRINT '  ✓ Inserted: MULTIPARAMETER - 50 KETONE TEST STRIPS VIAL';
    END

    -- NDOH35020 - Uric Acid Vial
    IF NOT EXISTS (SELECT 1 FROM InventoryItems WHERE SKU = 'NDOH35020' AND IsDeleted = 0)
    BEGIN
        INSERT INTO InventoryItems (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate)
        VALUES ('MULTIPARAMETER - 50 URIC ACID VIAL', 'Uric acid test vial for multiparameter device (50 pack)', 4, 'NDOH35020', '50Pack', 316.75, 969, 200, 'Taidoc Technology', 1, 0, GETDATE());
        SET @InsertedCount = @InsertedCount + 1;
        PRINT '  ✓ Inserted: MULTIPARAMETER - 50 URIC ACID VIAL';
    END

    -- NDOH35021 - Cholesterol Vial
    IF NOT EXISTS (SELECT 1 FROM InventoryItems WHERE SKU = 'NDOH35021' AND IsDeleted = 0)
    BEGIN
        INSERT INTO InventoryItems (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate)
        VALUES ('MULTIPARAMETER - 50 CHOLESTEROL VIAL', 'Cholesterol test vial for multiparameter device (50 pack)', 4, 'NDOH35021', '50Pack', 791.85, 2082, 300, 'Taidoc Technology', 1, 0, GETDATE());
        SET @InsertedCount = @InsertedCount + 1;
        PRINT '  ✓ Inserted: MULTIPARAMETER - 50 CHOLESTEROL VIAL';
    END

    -- NDOH35022 - Lactate Vial
    IF NOT EXISTS (SELECT 1 FROM InventoryItems WHERE SKU = 'NDOH35022' AND IsDeleted = 0)
    BEGIN
        INSERT INTO InventoryItems (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate)
        VALUES ('MULTIPARAMETER - 50 LACTATE VIAL', 'Lactate test vial for multiparameter device (50 pack)', 4, 'NDOH35022', '50Pack', 1007.83, 970, 200, 'Taidoc Technology', 1, 0, GETDATE());
        SET @InsertedCount = @InsertedCount + 1;
        PRINT '  ✓ Inserted: MULTIPARAMETER - 50 LACTATE VIAL';
    END

    -- NDOH35036 - Dual QC HBA1C
    IF NOT EXISTS (SELECT 1 FROM InventoryItems WHERE SKU = 'NDOH35036' AND IsDeleted = 0)
    BEGIN
        INSERT INTO InventoryItems (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate)
        VALUES ('DUAL GLUCOSE & HBA1C - QUALITY CONTROL SOLUTION HBA1C', 'QC solution for HBA1C testing on dual meters', 5, 'NDOH35036', 'Each', 166.29, 0, 50, 'Bio Hermes Medical', 3, 0, GETDATE());
        SET @InsertedCount = @InsertedCount + 1;
        PRINT '  ✓ Inserted: DUAL GLUCOSE & HBA1C - QUALITY CONTROL SOLUTION HBA1C';
    END

    -- NDOH35037 - Dual QC Glucose
    IF NOT EXISTS (SELECT 1 FROM InventoryItems WHERE SKU = 'NDOH35037' AND IsDeleted = 0)
    BEGIN
        INSERT INTO InventoryItems (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate)
        VALUES ('DUAL GLUCOSE & HBA1C - QUALITY CONTROL SOLUTIONS GLUCOSE', 'QC solution for glucose testing on dual meters', 5, 'NDOH35037', 'Each', 27.72, 17000, 1000, 'Bio Hermes Medical', 1, 0, GETDATE());
        SET @InsertedCount = @InsertedCount + 1;
        PRINT '  ✓ Inserted: DUAL GLUCOSE & HBA1C - QUALITY CONTROL SOLUTIONS GLUCOSE';
    END

    COMMIT TRANSACTION;

    PRINT '';
    PRINT '═══════════════════════════════════════════════════════════════';
    PRINT CONCAT('  ✅ SUCCESS: Inserted ', @InsertedCount, ' missing items');
    PRINT '═══════════════════════════════════════════════════════════════';

END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    PRINT '═══════════════════════════════════════════════════════════════';
    PRINT '  ❌ ERROR: ' + @ErrorMessage;
    PRINT '═══════════════════════════════════════════════════════════════';
    RAISERROR(@ErrorMessage, 16, 1);
END CATCH;

PRINT '';
PRINT '═══════════════════════════════════════════════════════════════';
PRINT '  FINAL INVENTORY STATUS';
PRINT '═══════════════════════════════════════════════════════════════';

SELECT 
    COUNT(*) AS TotalItems,
    COUNT(CASE WHEN IsDeleted = 0 THEN 1 END) AS ActiveItems
FROM InventoryItems;

PRINT '';
PRINT 'Items by Category:';
SELECT 
    Category,
    CASE Category
        WHEN 1 THEN 'Hemoglobin Testing'
        WHEN 2 THEN 'Glucose Testing'
        WHEN 3 THEN 'HBA1C Testing'
        WHEN 4 THEN 'Multiparameter Testing'
        WHEN 5 THEN 'Quality Control'
        WHEN 6 THEN 'Equipment Accessories'
        WHEN 7 THEN 'Disposables'
        WHEN 8 THEN 'Medical Equipment'
    END AS CategoryName,
    COUNT(*) AS ItemCount
FROM InventoryItems
WHERE IsDeleted = 0
GROUP BY Category
ORDER BY Category;

PRINT '';
PRINT '═══════════════════════════════════════════════════════════════';
PRINT '  ✅ SCRIPT COMPLETED';
PRINT '═══════════════════════════════════════════════════════════════';
PRINT '';
PRINT 'Next Steps:';
PRINT '1. Test API endpoint: https://ngcanduapi.azurewebsites.net/api/Inventory/GetAll';
PRINT '2. Verify all 18 items are returned';
PRINT '3. Check frontend to confirm hemoglobin meter appears';
PRINT '';
