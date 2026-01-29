-- =============================================================================
-- Check CreatedBy Column Issues
-- =============================================================================
-- Diagnose what might be causing the 400 Bad Request
-- =============================================================================

SET NOCOUNT ON;

PRINT '════════════════════════════════════════════════════════════════';
PRINT '  Checking Sale Table for API Issues';
PRINT '════════════════════════════════════════════════════════════════';
PRINT '';

-- Check the actual Sale table structure
PRINT 'SALE TABLE COLUMNS:';
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Sale'
ORDER BY ORDINAL_POSITION;

PRINT '';
PRINT 'CHECKING FOR NULL VALUES IN REQUIRED COLUMNS:';

-- Check for NULL values in key columns
SELECT 
    'SaleNumber' AS ColumnName,
    COUNT(*) AS NullCount
FROM Sale 
WHERE SaleNumber IS NULL AND IsDeleted = 0
UNION ALL
SELECT 
    'CustomerName',
    COUNT(*) 
FROM Sale 
WHERE CustomerName IS NULL AND IsDeleted = 0
UNION ALL
SELECT 
    'SaleDate with invalid values',
    COUNT(*)
FROM Sale 
WHERE (SaleDate IS NULL OR SaleDate < '1900-01-01' OR SaleDate > '2100-01-01') AND IsDeleted = 0
UNION ALL
SELECT 
    'CreatedDate NULL or Invalid',
    COUNT(*)
FROM Sale 
WHERE (CreatedDate IS NULL OR CreatedDate < '1900-01-01' OR CreatedDate > '2100-01-01') AND IsDeleted = 0
UNION ALL
SELECT 
    'CreatedBy is NULL',
    COUNT(*)
FROM Sale 
WHERE CreatedBy IS NULL AND IsDeleted = 0;

PRINT '';
PRINT 'SAMPLE OF RECORDS WITH POTENTIAL ISSUES:';
SELECT TOP 20 
    Id, 
    SaleNumber,
    CustomerName,
    SaleDate,
    Total,
    CreatedDate,
    CreatedBy,
    CASE 
        WHEN SaleNumber IS NULL THEN 'SaleNumber NULL'
        WHEN CustomerName IS NULL THEN 'CustomerName NULL'
        WHEN SaleDate IS NULL OR SaleDate < '1900-01-01' THEN 'SaleDate Invalid'
        WHEN CreatedDate IS NULL THEN 'CreatedDate NULL'
        WHEN CreatedBy IS NULL THEN 'CreatedBy NULL'
        ELSE 'OK'
    END AS Issue
FROM Sale 
WHERE IsDeleted = 0
  AND (SaleNumber IS NULL 
       OR CustomerName IS NULL 
       OR SaleDate IS NULL 
       OR SaleDate < '1900-01-01'
       OR CreatedDate IS NULL
       OR CreatedBy IS NULL)
ORDER BY Id DESC;

PRINT '';
PRINT 'TOTAL SALE RECORDS:';
SELECT COUNT(*) AS TotalSales FROM Sale WHERE IsDeleted = 0;

PRINT '';
PRINT 'RECORDS BY CREATEDBY VALUE:';
SELECT 
    ISNULL(CAST(CreatedBy AS VARCHAR(10)), 'NULL') AS CreatedByValue, 
    COUNT(*) AS RecordCount
FROM Sale 
WHERE IsDeleted = 0
GROUP BY CreatedBy
ORDER BY COUNT(*) DESC;
