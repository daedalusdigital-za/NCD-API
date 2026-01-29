-- Add missing inventory items to InventoryItem table
-- This script checks and adds hemoglobin meter and other items if they don't exist

PRINT '════════════════════════════════════════════════════════════════';
PRINT '  Adding Missing Inventory Items';
PRINT '════════════════════════════════════════════════════════════════';
PRINT '';

DECLARE @InsertedCount INT = 0;

-- NDOH35002 - Hemoglobin Meter
IF NOT EXISTS (SELECT 1 FROM InventoryItem WHERE SKU = 'NDOH35002' AND IsDeleted = 0)
BEGIN
    INSERT INTO InventoryItem (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate, CreatedBy)
    VALUES ('HEMOGLOBIN METER - BIO AID HB METER', 'Bio Aid HB Meter for hemoglobin testing', 3, 'NDOH35002', 'Each', 455.04, 8406, 100, 'Bio Aid Medical', 1, 0, GETDATE(), 1);
    SET @InsertedCount = @InsertedCount + 1;
    PRINT '  ✓ Inserted: HEMOGLOBIN METER - BIO AID HB METER';
END
ELSE
    PRINT '  ○ Already exists: HEMOGLOBIN METER - BIO AID HB METER';

-- NDOH35003 - Hemoglobin Test Strips
IF NOT EXISTS (SELECT 1 FROM InventoryItem WHERE SKU = 'NDOH35003' AND IsDeleted = 0)
BEGIN
    INSERT INTO InventoryItem (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate, CreatedBy)
    VALUES ('HEMOGLOBIN TEST STRIPS', 'Test strips for hemoglobin meters', 3, 'NDOH35003', 'Box', 160.25, 24442, 500, 'Bio Aid Medical', 1, 0, GETDATE(), 1);
    SET @InsertedCount = @InsertedCount + 1;
    PRINT '  ✓ Inserted: HEMOGLOBIN TEST STRIPS';
END
ELSE
    PRINT '  ○ Already exists: HEMOGLOBIN TEST STRIPS';

-- NDOH35013 - Hemoglobin Meter Battery
IF NOT EXISTS (SELECT 1 FROM InventoryItem WHERE SKU = 'NDOH35013' AND IsDeleted = 0)
BEGIN
    INSERT INTO InventoryItem (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate, CreatedBy)
    VALUES ('HEMOGLOBIN METER - BATTERY', 'Replacement battery for hemoglobin meters', 6, 'NDOH35013', 'Each', 10.53, 0, 50, 'Battery Suppliers Inc', 3, 0, GETDATE(), 1);
    SET @InsertedCount = @InsertedCount + 1;
    PRINT '  ✓ Inserted: HEMOGLOBIN METER - BATTERY';
END
ELSE
    PRINT '  ○ Already exists: HEMOGLOBIN METER - BATTERY';

-- NDOH35014 - Hemoglobin QC Solutions
IF NOT EXISTS (SELECT 1 FROM InventoryItem WHERE SKU = 'NDOH35014' AND IsDeleted = 0)
BEGIN
    INSERT INTO InventoryItem (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate, CreatedBy)
    VALUES ('HEMOGLOBIN METER - QUALITY CONTROL SOLUTIONS', 'Quality control solutions for hemoglobin meters', 5, 'NDOH35014', 'Each', 138.58, 0, 20, 'Quality Control Ltd', 3, 0, GETDATE(), 1);
    SET @InsertedCount = @InsertedCount + 1;
    PRINT '  ✓ Inserted: HEMOGLOBIN METER - QUALITY CONTROL SOLUTIONS';
END
ELSE
    PRINT '  ○ Already exists: HEMOGLOBIN METER - QUALITY CONTROL SOLUTIONS';

-- NDOH35015 - Disposable Lancet
IF NOT EXISTS (SELECT 1 FROM InventoryItem WHERE SKU = 'NDOH35015' AND IsDeleted = 0)
BEGIN
    INSERT INTO InventoryItem (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate, CreatedBy)
    VALUES ('HEMOGLOBIN METER - SINGLE USE DISPOSABLE LANCET', 'Single use disposable lancet for blood sampling', 7, 'NDOH35015', 'Each', 0.56, 500, 1000, 'Disposables Direct', 2, 0, GETDATE(), 1);
    SET @InsertedCount = @InsertedCount + 1;
    PRINT '  ✓ Inserted: HEMOGLOBIN METER - SINGLE USE DISPOSABLE LANCET';
END
ELSE
    PRINT '  ○ Already exists: HEMOGLOBIN METER - SINGLE USE DISPOSABLE LANCET';

PRINT '';
PRINT '════════════════════════════════════════════════════════════════';
PRINT '  Summary: ' + CAST(@InsertedCount AS NVARCHAR(10)) + ' new items added';
PRINT '════════════════════════════════════════════════════════════════';

-- Verify the results
SELECT 
    Id, 
    SKU,
    Name,
    Category,
    Status,
    StockAvailable,
    UnitPrice
FROM InventoryItem
WHERE SKU IN ('NDOH35002', 'NDOH35003', 'NDOH35013', 'NDOH35014', 'NDOH35015')
    AND IsDeleted = 0
ORDER BY SKU;
