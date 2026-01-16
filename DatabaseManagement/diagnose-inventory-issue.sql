-- =============================================================================
-- Diagnose Inventory Item Discrepancy
-- =============================================================================
-- Issue: Database shows 24 items, but API returns 20 different items
-- =============================================================================

SET NOCOUNT ON;

PRINT '═══════════════════════════════════════════════════════════════';
PRINT '  INVENTORY DIAGNOSTIC REPORT';
PRINT '═══════════════════════════════════════════════════════════════';
PRINT '';

-- 1. Total count in database
PRINT '1. DATABASE INVENTORY COUNT:';
PRINT '─────────────────────────────────────────────────────────────';

SELECT 
    COUNT(*) AS TotalItems,
    COUNT(CASE WHEN IsDeleted = 0 THEN 1 END) AS ActiveItems,
    COUNT(CASE WHEN IsDeleted = 1 THEN 1 END) AS DeletedItems
FROM InventoryItem;

PRINT '';

-- 2. Check for IsDeleted filter
PRINT '2. ITEMS BY STATUS (IsDeleted):';
PRINT '─────────────────────────────────────────────────────────────';

SELECT 
    CASE WHEN IsDeleted = 0 THEN 'Active' ELSE 'Deleted' END AS Status,
    COUNT(*) AS Count
FROM InventoryItem
GROUP BY IsDeleted;

PRINT '';

-- 3. List all items with their status
PRINT '3. ALL INVENTORY ITEMS (with deletion status):';
PRINT '─────────────────────────────────────────────────────────────';

SELECT 
    Id,
    ItemName,
    Category,
    Quantity,
    IsDeleted,
    CreatedDate,
    LastUpdated
FROM InventoryItem
ORDER BY IsDeleted, Id;

PRINT '';

-- 4. Check table schema
PRINT '4. INVENTORY ITEM TABLE SCHEMA:';
PRINT '─────────────────────────────────────────────────────────────';

SELECT 
    c.name AS ColumnName,
    t.name AS DataType,
    c.max_length AS MaxLength,
    c.is_nullable AS IsNullable
FROM sys.columns c
INNER JOIN sys.types t ON c.user_type_id = t.user_type_id
WHERE c.object_id = OBJECT_ID('InventoryItem')
ORDER BY c.column_id;

PRINT '';

-- 5. Check for duplicate or orphaned records
PRINT '5. POTENTIAL ISSUES:';
PRINT '─────────────────────────────────────────────────────────────';

-- Check for NULL IsDeleted values
DECLARE @NullIsDeleted INT;
SELECT @NullIsDeleted = COUNT(*) FROM InventoryItem WHERE IsDeleted IS NULL;
PRINT 'Items with NULL IsDeleted: ' + CAST(@NullIsDeleted AS VARCHAR);

-- Check for items with quantity <= 0
DECLARE @ZeroQuantity INT;
SELECT @ZeroQuantity = COUNT(*) FROM InventoryItem WHERE Quantity <= 0 AND IsDeleted = 0;
PRINT 'Active items with zero/negative quantity: ' + CAST(@ZeroQuantity AS VARCHAR);

PRINT '';
PRINT '═══════════════════════════════════════════════════════════════';
PRINT '  END OF DIAGNOSTIC REPORT';
PRINT '═══════════════════════════════════════════════════════════════';
