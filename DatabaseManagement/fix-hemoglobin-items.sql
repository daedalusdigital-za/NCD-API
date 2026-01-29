-- Fix incorrect inventory item names and categories
PRINT '════════════════════════════════════════════════════════════════';
PRINT '  Fixing Inventory Item Names and Categories';
PRINT '════════════════════════════════════════════════════════════════';
PRINT '';

-- NDOH35003 - Update to correct name and category
UPDATE InventoryItem
SET 
    Name = 'HEMOGLOBIN TEST STRIPS',
    Description = 'Test strips for hemoglobin meters',
    Category = 3,  -- HemoglobinTesting
    LastUpdated = GETDATE(),
    UpdatedBy = 1
WHERE SKU = 'NDOH35003' AND IsDeleted = 0;
PRINT '  ✓ Updated: NDOH35003 - HEMOGLOBIN TEST STRIPS (Category 3)';

-- NDOH35013 - Update to correct name and category
UPDATE InventoryItem
SET 
    Name = 'HEMOGLOBIN METER - BATTERY',
    Description = 'Replacement battery for hemoglobin meters',
    Category = 6,  -- Accessories
    UnitPrice = 10.53,
    LastUpdated = GETDATE(),
    UpdatedBy = 1
WHERE SKU = 'NDOH35013' AND IsDeleted = 0;
PRINT '  ✓ Updated: NDOH35013 - HEMOGLOBIN METER - BATTERY (Category 6)';

-- NDOH35014 - Update to correct name and category
UPDATE InventoryItem
SET 
    Name = 'HEMOGLOBIN METER - QUALITY CONTROL SOLUTIONS',
    Description = 'Quality control solutions for hemoglobin meters',
    Category = 5,  -- QualityControl
    UnitPrice = 138.58,
    LastUpdated = GETDATE(),
    UpdatedBy = 1
WHERE SKU = 'NDOH35014' AND IsDeleted = 0;
PRINT '  ✓ Updated: NDOH35014 - HEMOGLOBIN METER - QUALITY CONTROL SOLUTIONS (Category 5)';

-- NDOH35015 - Update to correct name and category
UPDATE InventoryItem
SET 
    Name = 'HEMOGLOBIN METER - SINGLE USE DISPOSABLE LANCET',
    Description = 'Single use disposable lancet for blood sampling',
    Category = 7,  -- Consumables
    UnitPrice = 0.56,
    LastUpdated = GETDATE(),
    UpdatedBy = 1
WHERE SKU = 'NDOH35015' AND IsDeleted = 0;
PRINT '  ✓ Updated: NDOH35015 - HEMOGLOBIN METER - SINGLE USE DISPOSABLE LANCET (Category 7)';

PRINT '';
PRINT '════════════════════════════════════════════════════════════════';
PRINT '  ✅ All hemoglobin items updated successfully';
PRINT '════════════════════════════════════════════════════════════════';
PRINT '';

-- Verify the results
PRINT 'Verification - Hemoglobin Items:';
SELECT 
    Id, 
    SKU,
    Name,
    Category,
    CASE Category
        WHEN 1 THEN 'GlucoseTesting'
        WHEN 2 THEN 'DiabetesTesting'
        WHEN 3 THEN 'HemoglobinTesting'
        WHEN 4 THEN 'MultiparameterTesting'
        WHEN 5 THEN 'QualityControl'
        WHEN 6 THEN 'Accessories'
        WHEN 7 THEN 'Consumables'
        ELSE 'Other'
    END AS CategoryName,
    Status,
    StockAvailable,
    UnitPrice
FROM InventoryItem
WHERE SKU IN ('NDOH35002', 'NDOH35003', 'NDOH35013', 'NDOH35014', 'NDOH35015')
    AND IsDeleted = 0
ORDER BY SKU;

PRINT '';
PRINT 'Category Distribution:';
SELECT 
    Category,
    CASE Category
        WHEN 1 THEN 'GlucoseTesting'
        WHEN 2 THEN 'DiabetesTesting'
        WHEN 3 THEN 'HemoglobinTesting'
        WHEN 4 THEN 'MultiparameterTesting'
        WHEN 5 THEN 'QualityControl'
        WHEN 6 THEN 'Accessories'
        WHEN 7 THEN 'Consumables'
        ELSE 'Other'
    END AS CategoryName,
    COUNT(*) AS ItemCount
FROM InventoryItem
WHERE IsDeleted = 0
GROUP BY Category
ORDER BY Category;
