-- =============================================================================
-- Show Missing Invoices (exist in CSV but not in Sale table)
-- =============================================================================

SET NOCOUNT ON;

PRINT '════════════════════════════════════════════════════════════════';
PRINT '  Analyzing Missing Invoices';
PRINT '════════════════════════════════════════════════════════════════';
PRINT '';

-- Safety cleanup
IF OBJECT_ID('tempdb..#CSVInvoices') IS NOT NULL DROP TABLE #CSVInvoices;

CREATE TABLE #CSVInvoices (
    InvoiceNumber NVARCHAR(50),
    CustomerName NVARCHAR(200),
    SaleDate DATE,
    TotalAmount DECIMAL(18,2)
);

-- Manually insert distinct invoices from CSV (aggregated)
-- This is a sample - the full list would be generated from the CSV
;WITH CSVData AS (
    SELECT DISTINCT r.InvoiceNumber, r.CustomerName, r.SaleDate
    FROM (
        -- Using the same temp table approach
        SELECT * FROM #RawSalesData
    ) r
)
SELECT * FROM CSVData;

-- For now, let's query what we DO have
PRINT 'INVOICES IN SALE TABLE:';
SELECT COUNT(*) AS TotalSales FROM Sale WHERE IsDeleted = 0;

PRINT '';
PRINT 'INVOICES BY DATE RANGE:';
SELECT 
    FORMAT(SaleDate, 'yyyy-MM') AS Month,
    COUNT(*) AS InvoiceCount
FROM Sale
WHERE IsDeleted = 0
GROUP BY FORMAT(SaleDate, 'yyyy-MM')
ORDER BY FORMAT(SaleDate, 'yyyy-MM');

PRINT '';
PRINT 'INVOICES BY CUSTOMER (TOP 20):';
SELECT TOP 20
    CustomerName,
    COUNT(*) AS InvoiceCount,
    MIN(SaleDate) AS FirstSale,
    MAX(SaleDate) AS LastSale
FROM Sale
WHERE IsDeleted = 0
GROUP BY CustomerName
ORDER BY COUNT(*) DESC;

DROP TABLE #CSVInvoices;
