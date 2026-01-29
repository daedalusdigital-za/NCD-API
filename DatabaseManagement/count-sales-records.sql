-- Count total sales records in database
SELECT 
    COUNT(*) AS TotalSales,
    COUNT(CASE WHEN IsDeleted = 0 THEN 1 END) AS ActiveSales,
    COUNT(CASE WHEN IsDeleted = 1 THEN 1 END) AS DeletedSales
FROM Sale;

-- Additional breakdown
SELECT 
    'All Sales' AS Category,
    COUNT(*) AS RecordCount
FROM Sale

UNION ALL

SELECT 
    'Active Sales' AS Category,
    COUNT(*) AS RecordCount
FROM Sale
WHERE IsDeleted = 0

UNION ALL

SELECT 
    'Deleted Sales' AS Category,
    COUNT(*) AS RecordCount
FROM Sale
WHERE IsDeleted = 1

UNION ALL

SELECT 
    'Sales with Credit Notes' AS Category,
    COUNT(*) AS RecordCount
FROM Sale
WHERE HasCreditNote = 1 AND IsDeleted = 0;
