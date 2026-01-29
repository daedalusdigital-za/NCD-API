-- Verify the relationship between Sales and SaleItems
-- Expected: 827 Sales with 1,251 SaleItems total

SELECT 
    'Sales (Invoices)' AS RecordType,
    COUNT(*) AS RecordCount
FROM Sale
WHERE IsDeleted = 0

UNION ALL

SELECT 
    'SaleItems (Line Items)' AS RecordType,
    COUNT(*) AS RecordCount
FROM SaleItem
WHERE IsDeleted = 0;

-- Show invoices with multiple items
SELECT 
    COUNT(DISTINCT SaleId) AS InvoicesWithMultipleItems,
    AVG(CAST(ItemCount AS FLOAT)) AS AvgItemsPerInvoice
FROM (
    SELECT 
        SaleId,
        COUNT(*) AS ItemCount
    FROM SaleItem
    WHERE IsDeleted = 0
    GROUP BY SaleId
    HAVING COUNT(*) > 1
) AS MultiItemInvoices;

-- Sample: Show an invoice with its line items
SELECT TOP 1
    s.SaleNumber,
    s.CustomerName,
    s.Total,
    COUNT(si.Id) AS LineItemCount
FROM Sale s
INNER JOIN SaleItem si ON s.Id = si.SaleId
WHERE s.IsDeleted = 0 AND si.IsDeleted = 0
GROUP BY s.SaleNumber, s.CustomerName, s.Total
HAVING COUNT(si.Id) > 1;
