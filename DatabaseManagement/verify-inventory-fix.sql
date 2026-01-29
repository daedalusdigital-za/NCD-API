-- =============================================================================
-- Quick Inventory Verification Script
-- =============================================================================
-- Purpose: Quick check to verify all inventory items are present
-- Run this AFTER running the diagnose-and-fix-inventory.sql script
-- =============================================================================

SET NOCOUNT ON;

PRINT '═══════════════════════════════════════════════════════════════';
PRINT '  INVENTORY VERIFICATION CHECK';
PRINT '═══════════════════════════════════════════════════════════════';
PRINT '';

-- Check 1: Total count
PRINT '✓ Total Item Count:';
SELECT 
    COUNT(*) AS TotalItems,
    COUNT(CASE WHEN IsDeleted = 0 THEN 1 END) AS ActiveItems,
    COUNT(CASE WHEN IsDeleted = 1 THEN 1 END) AS DeletedItems
FROM InventoryItems;

DECLARE @ActiveCount INT = (SELECT COUNT(*) FROM InventoryItems WHERE IsDeleted = 0);

IF @ActiveCount = 18
    PRINT '  ✅ PASS: Expected 18 items, found ' + CAST(@ActiveCount AS VARCHAR);
ELSE
    PRINT '  ❌ FAIL: Expected 18 items, but found ' + CAST(@ActiveCount AS VARCHAR);

PRINT '';

-- Check 2: Hemoglobin Meter
PRINT '✓ Hemoglobin Meter Check:';
IF EXISTS (SELECT 1 FROM InventoryItems WHERE SKU = 'NDOH35002' AND IsDeleted = 0)
    PRINT '  ✅ PASS: Hemoglobin Meter (NDOH35002) found';
ELSE
    PRINT '  ❌ FAIL: Hemoglobin Meter (NDOH35002) NOT found';

PRINT '';

-- Check 3: All expected SKUs
PRINT '✓ Expected SKUs Check:';
CREATE TABLE #ExpectedSKUs (SKU NVARCHAR(50));
INSERT INTO #ExpectedSKUs VALUES
('NDOH35002'),('NDOH35003'),('NDOH35013'),('NDOH35014'),('NDOH35015'),
('NDOH35016'),('NDOH35017'),('NDOH35004'),('NDOH35018'),('NDOH35006'),
('NDOH35034'),('NDOH35005'),('NDOH35019'),('NDOH35020'),('NDOH35021'),
('NDOH35022'),('NDOH35036'),('NDOH35037');

DECLARE @MissingSKUs INT = (
    SELECT COUNT(*) 
    FROM #ExpectedSKUs e
    LEFT JOIN InventoryItems i ON e.SKU = i.SKU AND i.IsDeleted = 0
    WHERE i.Id IS NULL
);

IF @MissingSKUs = 0
    PRINT '  ✅ PASS: All 18 expected SKUs are present';
ELSE
BEGIN
    PRINT '  ❌ FAIL: Missing ' + CAST(@MissingSKUs AS VARCHAR) + ' SKU(s):';
    SELECT e.SKU AS MissingSKU
    FROM #ExpectedSKUs e
    LEFT JOIN InventoryItems i ON e.SKU = i.SKU AND i.IsDeleted = 0
    WHERE i.Id IS NULL;
END

DROP TABLE #ExpectedSKUs;

PRINT '';

-- Check 4: Category distribution
PRINT '✓ Category Distribution:';
SELECT 
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
    COUNT(*) AS ItemCount,
    CASE 
        WHEN Category = 1 AND COUNT(*) = 2 THEN '✅'
        WHEN Category = 2 AND COUNT(*) = 3 THEN '✅'
        WHEN Category = 3 AND COUNT(*) = 1 THEN '✅'
        WHEN Category = 4 AND COUNT(*) = 5 THEN '✅'
        WHEN Category = 5 AND COUNT(*) = 4 THEN '✅'
        WHEN Category = 6 AND COUNT(*) = 2 THEN '✅'
        WHEN Category = 7 AND COUNT(*) = 1 THEN '✅'
        ELSE '⚠️'
    END AS Status
FROM InventoryItems
WHERE IsDeleted = 0
GROUP BY Category
ORDER BY Category;

PRINT '';

-- Check 5: List all items
PRINT '✓ Complete Item List:';
SELECT 
    Id,
    SKU,
    Name,
    CASE Category
        WHEN 1 THEN 'Hemoglobin Testing'
        WHEN 2 THEN 'Glucose Testing'
        WHEN 3 THEN 'HBA1C Testing'
        WHEN 4 THEN 'Multiparameter Testing'
        WHEN 5 THEN 'Quality Control'
        WHEN 6 THEN 'Equipment Accessories'
        WHEN 7 THEN 'Disposables'
        WHEN 8 THEN 'Medical Equipment'
    END AS Category,
    StockAvailable,
    CASE Status
        WHEN 1 THEN 'In Stock'
        WHEN 2 THEN 'Low Stock'
        WHEN 3 THEN 'Out of Stock'
        WHEN 4 THEN 'Discontinued'
    END AS Status
FROM InventoryItems
WHERE IsDeleted = 0
ORDER BY Category, SKU;

PRINT '';
PRINT '═══════════════════════════════════════════════════════════════';

-- Final verdict
DECLARE @FinalStatus VARCHAR(10);
IF @ActiveCount = 18 AND @MissingSKUs = 0
BEGIN
    SET @FinalStatus = '✅ PASS';
    PRINT '  ' + @FinalStatus + ' - Database is ready!';
    PRINT '';
    PRINT '  Next Step: Test the API endpoint';
    PRINT '  URL: https://ngcanduapi.azurewebsites.net/api/Inventory/GetAll';
END
ELSE
BEGIN
    SET @FinalStatus = '❌ FAIL';
    PRINT '  ' + @FinalStatus + ' - Issues found! Run diagnose-and-fix-inventory.sql';
END

PRINT '═══════════════════════════════════════════════════════════════';
