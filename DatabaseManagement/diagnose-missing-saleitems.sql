-- =============================================================================
-- Diagnose Missing SaleItems
-- =============================================================================
-- Purpose: Find invoices that have no line items
-- =============================================================================

SET NOCOUNT ON;

PRINT '════════════════════════════════════════════════════════════════';
PRINT '  Diagnosing Missing Sale Line Items';
PRINT '════════════════════════════════════════════════════════════════';
PRINT '';

-- 1. Current counts
PRINT 'CURRENT STATE:';
PRINT '─────────────────────────────────────────────────────────────────';

DECLARE @SaleCount INT = (SELECT COUNT(*) FROM Sale WHERE IsDeleted = 0);
DECLARE @SaleItemCount INT = (SELECT COUNT(*) FROM SaleItem WHERE IsDeleted = 0);
DECLARE @SalesWithItems INT = (SELECT COUNT(DISTINCT SaleId) FROM SaleItem WHERE IsDeleted = 0);
DECLARE @SalesWithoutItems INT = @SaleCount - @SalesWithItems;

PRINT '  Total Sales (invoices): ' + CAST(@SaleCount AS NVARCHAR(10));
PRINT '  Total SaleItems (line items): ' + CAST(@SaleItemCount AS NVARCHAR(10));
PRINT '  Sales WITH line items: ' + CAST(@SalesWithItems AS NVARCHAR(10));
PRINT '  Sales WITHOUT line items: ' + CAST(@SalesWithoutItems AS NVARCHAR(10));
PRINT '';

-- 2. Show sales without any line items
PRINT 'INVOICES MISSING LINE ITEMS (first 50):';
PRINT '─────────────────────────────────────────────────────────────────';

SELECT TOP 50
    s.Id,
    s.SaleNumber,
    s.CustomerName,
    s.SaleDate
FROM Sale s
LEFT JOIN SaleItem si ON s.Id = si.SaleId AND si.IsDeleted = 0
WHERE s.IsDeleted = 0
  AND si.Id IS NULL
ORDER BY s.SaleDate DESC;

-- 3. Count by customer
PRINT '';
PRINT 'MISSING ITEMS BY CUSTOMER:';
PRINT '─────────────────────────────────────────────────────────────────';

SELECT 
    s.CustomerName,
    COUNT(*) AS InvoicesMissingItems
FROM Sale s
LEFT JOIN SaleItem si ON s.Id = si.SaleId AND si.IsDeleted = 0
WHERE s.IsDeleted = 0
  AND si.Id IS NULL
GROUP BY s.CustomerName
ORDER BY COUNT(*) DESC;

-- 4. Count by month
PRINT '';
PRINT 'MISSING ITEMS BY MONTH:';
PRINT '─────────────────────────────────────────────────────────────────';

SELECT 
    FORMAT(s.SaleDate, 'yyyy-MM') AS Month,
    COUNT(*) AS InvoicesMissingItems
FROM Sale s
LEFT JOIN SaleItem si ON s.Id = si.SaleId AND si.IsDeleted = 0
WHERE s.IsDeleted = 0
  AND si.Id IS NULL
GROUP BY FORMAT(s.SaleDate, 'yyyy-MM')
ORDER BY FORMAT(s.SaleDate, 'yyyy-MM');

-- 5. Check inventory items exist
PRINT '';
PRINT 'INVENTORY ITEMS AVAILABLE:';
PRINT '─────────────────────────────────────────────────────────────────';

SELECT SKU, Name, StockAvailable
FROM InventoryItem
WHERE IsDeleted = 0
ORDER BY SKU;

PRINT '';
PRINT '════════════════════════════════════════════════════════════════';
PRINT '  ✅ Diagnostic Complete';
PRINT '════════════════════════════════════════════════════════════════';
