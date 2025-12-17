-- Complete diagnostic for Sale API 400 error
-- Run in Azure Data Studio against MedicalManagementDB

-- 1. Show ALL Sale columns to understand schema
PRINT '=== SALE TABLE SCHEMA ===';
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Sale' 
ORDER BY ORDINAL_POSITION;

-- 2. Show ALL SaleItem columns
PRINT '';
PRINT '=== SALEITEM TABLE SCHEMA ===';
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'SaleItem' 
ORDER BY ORDINAL_POSITION;

-- 3. Check if SaleItems have invalid InventoryItemId references
PRINT '';
PRINT '=== SALEITEM FK CHECK ===';
SELECT 
    si.Id as SaleItemId,
    si.SaleId,
    si.InventoryItemId,
    CASE WHEN ii.Id IS NULL THEN 'MISSING!' ELSE 'OK' END as InventoryItemStatus
FROM SaleItem si
LEFT JOIN InventoryItem ii ON si.InventoryItemId = ii.Id
WHERE si.IsDeleted = 0
ORDER BY si.Id;

-- 4. Sample Sale record to verify all columns
PRINT '';
PRINT '=== SAMPLE SALE RECORD (ALL COLUMNS) ===';
SELECT TOP 1 * FROM Sale WHERE IsDeleted = 0;

-- 5. Sample SaleItem record to verify all columns  
PRINT '';
PRINT '=== SAMPLE SALEITEM RECORD (ALL COLUMNS) ===';
SELECT TOP 1 * FROM SaleItem WHERE IsDeleted = 0;

-- 6. Count total records
PRINT '';
PRINT '=== RECORD COUNTS ===';
SELECT 'Active Sales' as [Table], COUNT(*) as [Count] FROM Sale WHERE IsDeleted = 0
UNION ALL
SELECT 'Active SaleItems', COUNT(*) FROM SaleItem WHERE IsDeleted = 0;
