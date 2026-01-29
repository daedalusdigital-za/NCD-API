-- =============================================================================
-- Diagnose and Fix New Sale Records
-- =============================================================================
-- Check what fields might be causing API issues
-- =============================================================================

SET NOCOUNT ON;

PRINT '════════════════════════════════════════════════════════════════';
PRINT '  Diagnosing Sale Records';
PRINT '════════════════════════════════════════════════════════════════';
PRINT '';

-- Check Sale table structure
PRINT 'SALE TABLE COLUMNS:';
SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE, COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Sale'
ORDER BY ORDINAL_POSITION;

PRINT '';
PRINT 'SAMPLE OF EXISTING (GOOD) RECORDS:';
SELECT TOP 5 * FROM Sale WHERE Id <= 100 AND IsDeleted = 0;

PRINT '';
PRINT 'SAMPLE OF NEW RECORDS (recently added):';
SELECT TOP 10 * FROM Sale WHERE Id > 827 AND IsDeleted = 0 ORDER BY Id;

PRINT '';
PRINT 'CHECK FOR NULL VALUES IN REQUIRED FIELDS:';
SELECT 
    'SaleNumber IS NULL' AS Issue, COUNT(*) AS Count FROM Sale WHERE SaleNumber IS NULL AND IsDeleted = 0
UNION ALL
SELECT 
    'CustomerName IS NULL', COUNT(*) FROM Sale WHERE CustomerName IS NULL AND IsDeleted = 0
UNION ALL
SELECT 
    'SaleDate IS NULL', COUNT(*) FROM Sale WHERE SaleDate IS NULL AND IsDeleted = 0;

PRINT '';
PRINT '════════════════════════════════════════════════════════════════';
