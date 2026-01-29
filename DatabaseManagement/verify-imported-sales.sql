-- Verify if the sales we tried to import are already in the database
-- Checking a sample of invoice numbers from the import

-- Total count of sales
SELECT COUNT(*) AS TotalSalesInDatabase FROM Sale WHERE IsDeleted = 0;

-- Check for specific invoice numbers from the import data
-- Sample invoice numbers: S-2025-04-001, S-2025-04-002, S-2025-05-001, etc.

SELECT 
    SaleNumber,
    CustomerName,
    SaleDate,
    Total,
    DateCreated
FROM Sale
WHERE SaleNumber IN (
    'S-2025-04-001',
    'S-2025-04-002', 
    'S-2025-04-003',
    'S-2025-05-001',
    'S-2025-06-001',
    'S-2025-12-001',
    'S-2026-01-001'
)
ORDER BY SaleNumber;

-- Check date range of existing sales
SELECT 
    MIN(SaleDate) AS EarliestSale,
    MAX(SaleDate) AS LatestSale,
    COUNT(*) AS TotalSales
FROM Sale
WHERE IsDeleted = 0;

-- Check when sales were created (imported)
SELECT 
    CAST(DateCreated AS DATE) AS ImportDate,
    COUNT(*) AS SalesImported
FROM Sale
WHERE IsDeleted = 0
GROUP BY CAST(DateCreated AS DATE)
ORDER BY ImportDate DESC;
