-- ==============================================================
-- Database Diagnostic Script
-- ==============================================================
-- Use this to see what tables and schema exist in the database
-- ==============================================================

PRINT '============================================================';
PRINT 'DATABASE SCHEMA DIAGNOSTIC REPORT';
PRINT '============================================================';
PRINT '';

-- List all tables
PRINT '=== ALL TABLES IN DATABASE ===';
SELECT 
    TABLE_SCHEMA,
    TABLE_NAME,
    CASE WHEN TABLE_TYPE = 'BASE TABLE' THEN 'Table' ELSE TABLE_TYPE END AS Type
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_SCHEMA, TABLE_NAME;

PRINT '';
PRINT '=== TABLE COUNT ===';
SELECT COUNT(*) AS [Total Tables]
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

-- Check for specific tables we care about
PRINT '';
PRINT '=== KEY TABLES CHECK ===';
SELECT 
    'Sale' AS TableName, 
    CASE WHEN EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Sale') THEN 'EXISTS ✓' ELSE 'MISSING ✗' END AS Status
UNION ALL
SELECT 
    'CreditNotes' AS TableName, 
    CASE WHEN EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CreditNotes') THEN 'EXISTS ✓' ELSE 'MISSING ✗' END AS Status
UNION ALL
SELECT 
    'InventoryItem' AS TableName, 
    CASE WHEN EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'InventoryItem') THEN 'EXISTS ✓' ELSE 'MISSING ✗' END AS Status
UNION ALL
SELECT 
    'SaleItem' AS TableName, 
    CASE WHEN EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'SaleItem') THEN 'EXISTS ✓' ELSE 'MISSING ✗' END AS Status
UNION ALL
SELECT 
    'UserProfile' AS TableName, 
    CASE WHEN EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'UserProfile') THEN 'EXISTS ✓' ELSE 'MISSING ✗' END AS Status;

-- If CreditNotes exists, show its structure
PRINT '';
PRINT '=== CREDITNOTES TABLE STRUCTURE (IF EXISTS) ===';
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CreditNotes')
BEGIN
    SELECT 
        COLUMN_NAME,
        DATA_TYPE,
        IS_NULLABLE,
        COLUMN_DEFAULT
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'CreditNotes'
    ORDER BY ORDINAL_POSITION;
    
    PRINT '';
    PRINT 'CreditNotes Constraints:';
    SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
    FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE TABLE_NAME = 'CreditNotes';
    
    PRINT '';
    PRINT 'CreditNotes Indexes:';
    SELECT NAME, TYPE_DESC FROM sys.indexes 
    WHERE object_id = OBJECT_ID('dbo.CreditNotes') AND NAME IS NOT NULL;
END
ELSE
BEGIN
    PRINT 'CreditNotes table does not exist yet.';
END

-- If Sale exists, show its structure
PRINT '';
PRINT '=== SALE TABLE STRUCTURE (IF EXISTS) ===';
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Sale')
BEGIN
    SELECT 
        COLUMN_NAME,
        DATA_TYPE,
        IS_NULLABLE,
        COLUMN_DEFAULT
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Sale'
    ORDER BY ORDINAL_POSITION;
    
    PRINT '';
    PRINT 'Sale Indexes:';
    SELECT NAME, TYPE_DESC FROM sys.indexes 
    WHERE object_id = OBJECT_ID('dbo.Sale') AND NAME IS NOT NULL;
    
    PRINT '';
    PRINT 'Sample data count:';
    SELECT COUNT(*) AS [Number of Sale Records]
    FROM [dbo].[Sale];
END
ELSE
BEGIN
    PRINT 'Sale table does not exist.';
END

-- Show all foreign keys
PRINT '';
PRINT '=== FOREIGN KEY RELATIONSHIPS ===';
SELECT 
    FK.name AS CONSTRAINT_NAME,
    OBJECT_NAME(FK.parent_object_id) AS TABLE_NAME,
    COL_NAME(FKC.parent_object_id, FKC.parent_column_id) AS COLUMN_NAME,
    OBJECT_NAME(FK.referenced_object_id) AS REFERENCED_TABLE_NAME,
    COL_NAME(FKC.referenced_object_id, FKC.referenced_column_id) AS REFERENCED_COLUMN_NAME
FROM sys.foreign_keys AS FK
INNER JOIN sys.foreign_key_columns AS FKC 
    ON FK.object_id = FKC.constraint_object_id
ORDER BY TABLE_NAME, CONSTRAINT_NAME;

PRINT '';
PRINT '============================================================';
PRINT 'Diagnostic report complete.';
PRINT '============================================================';
