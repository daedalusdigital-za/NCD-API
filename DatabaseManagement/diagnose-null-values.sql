-- Diagnose NULL values in Sale table that are mapped to non-nullable properties
-- Run in Azure Data Studio against MedicalManagementDB

-- Check for NULL values in required columns
SELECT 
    'Sales with NULL SaleNumber' as Issue,
    COUNT(*) as Count
FROM Sale
WHERE SaleNumber IS NULL AND IsDeleted = 0

UNION ALL

SELECT 
    'Sales with NULL CustomerName' as Issue,
    COUNT(*) as Count
FROM Sale
WHERE CustomerName IS NULL AND IsDeleted = 0

UNION ALL

SELECT 
    'Sales with NULL SaleDate' as Issue,
    COUNT(*) as Count
FROM Sale
WHERE SaleDate IS NULL AND IsDeleted = 0

UNION ALL

SELECT 
    'Sales with NULL Total' as Issue,
    COUNT(*) as Count
FROM Sale
WHERE Total IS NULL AND IsDeleted = 0

UNION ALL

SELECT 
    'Sales with NULL CreatedDate' as Issue,
    COUNT(*) as Count
FROM Sale
WHERE CreatedDate IS NULL AND IsDeleted = 0;

-- Show a few sample problematic records
PRINT '';
PRINT 'Sample records with potential issues:';
SELECT TOP 10 
    Id, 
    SaleNumber, 
    SaleDate, 
    CustomerName, 
    Total, 
    CreatedDate,
    CASE 
        WHEN SaleNumber IS NULL THEN 'NULL SaleNumber'
        WHEN CustomerName IS NULL THEN 'NULL CustomerName'
        WHEN SaleDate IS NULL THEN 'NULL SaleDate'
        WHEN CreatedDate IS NULL THEN 'NULL CreatedDate'
        ELSE 'OK' 
    END as PotentialIssue
FROM Sale
WHERE IsDeleted = 0
    AND (SaleNumber IS NULL 
         OR CustomerName IS NULL 
         OR SaleDate IS NULL 
         OR CreatedDate IS NULL)
ORDER BY Id;

-- Check SaleItem for NULL required columns
PRINT '';
PRINT 'SaleItem NULL check:';
SELECT 
    'SaleItems with NULL InventoryItemId' as Issue,
    COUNT(*) as Count
FROM SaleItem
WHERE InventoryItemId IS NULL AND IsDeleted = 0

UNION ALL

SELECT 
    'SaleItems with invalid InventoryItemId (FK not found)' as Issue,
    COUNT(*) as Count
FROM SaleItem si
LEFT JOIN InventoryItem ii ON si.InventoryItemId = ii.Id
WHERE ii.Id IS NULL AND si.IsDeleted = 0;

-- Show all columns in Sale table with nullable info
PRINT '';
PRINT 'Column nullable status:';
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    IS_NULLABLE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Sale' 
ORDER BY ORDINAL_POSITION;
