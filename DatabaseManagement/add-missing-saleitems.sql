-- =============================================================================
-- Add Missing SaleItems to Existing Invoices
-- =============================================================================
-- Purpose: Add line items that were skipped during previous import
-- Expected: Add ~571 missing line items to existing 827 invoices
-- =============================================================================

SET NOCOUNT ON;

PRINT '════════════════════════════════════════════════════════════════';
PRINT '  Adding Missing Sale Line Items';
PRINT '════════════════════════════════════════════════════════════════';
PRINT '';

BEGIN TRY
    BEGIN TRANSACTION;

    -- Create temp table for raw sales data (same structure as import script)
    CREATE TABLE #RawSalesData (
        CustomerCode NVARCHAR(50),
        CustomerName NVARCHAR(200),
        ItemSKU NVARCHAR(50),
        ItemDescription NVARCHAR(500),
        Province NVARCHAR(50),
        InvoiceNumber NVARCHAR(50),
        SaleDate DATE,
        Location NVARCHAR(200),
        QuantitySold INT,
        UnitPrice DECIMAL(18,2),
        TotalAmount DECIMAL(18,2)
    );

    PRINT 'Step 1: Loading sales data...';
    
    INSERT INTO #RawSalesData (CustomerCode, CustomerName, ItemSKU, ItemDescription, Province, InvoiceNumber, SaleDate, Location, QuantitySold, UnitPrice, TotalAmount)
    VALUES
        ('04-BLO-001', 'BLOEMFONTEIN MEDICAL DEPOT', 'NDOH35004', 'GLUCOSE METER- BIO HERMES', '04', 'IN152428', '2025-04-11', '000', 500.00, 136.53, 68265.22),
        ('04-BLO-001', 'BLOEMFONTEIN MEDICAL DEPOT', 'NDOH35017', 'GLUCOSE TEST STRIPS', '04', 'IN152427', '2025-04-11', '000', 2400.00, 44.84, 107624.35);

    DECLARE @TotalRows INT = (SELECT COUNT(*) FROM #RawSalesData);
    PRINT '  ✓ Loaded ' + CAST(@TotalRows AS NVARCHAR(10)) + ' rows of sales data';
    PRINT '';

    -- Count existing SaleItems before adding
    DECLARE @ExistingItemsCount INT = (SELECT COUNT(*) FROM SaleItem WHERE IsDeleted = 0);
    PRINT 'Current SaleItems count: ' + CAST(@ExistingItemsCount AS NVARCHAR(10));
    PRINT '';

    PRINT 'Step 2: Adding missing line items to existing invoices...';
    
    -- Insert SaleItem records for existing Sales
    INSERT INTO SaleItem (
        SaleId,
        InventoryItemId,
        Quantity,
        UnitPrice,
        TotalPrice,
        IsDeleted
    )
    SELECT 
        s.Id AS SaleId,
        inv.Id AS InventoryItemId,
        r.QuantitySold,
        r.UnitPrice,
        r.TotalAmount,
        0
    FROM #RawSalesData r
    INNER JOIN Sale s ON r.InvoiceNumber = s.SaleNumber  -- Join to existing Sales
    INNER JOIN InventoryItem inv ON r.ItemSKU = inv.SKU
    WHERE s.IsDeleted = 0
    AND inv.IsDeleted = 0
    AND NOT EXISTS (
        -- Duplicate protection: Skip if exact line item already exists
        SELECT 1 FROM SaleItem si
        WHERE si.SaleId = s.Id 
        AND si.InventoryItemId = inv.Id
        AND si.Quantity = r.QuantitySold
        AND si.UnitPrice = r.UnitPrice
        AND si.IsDeleted = 0
    );

    DECLARE @ItemsAdded INT = @@ROWCOUNT;
    PRINT '  ✓ Added ' + CAST(@ItemsAdded AS NVARCHAR(10)) + ' new sale line items';
    PRINT '';

    -- Count total SaleItems after adding
    DECLARE @NewItemsCount INT = (SELECT COUNT(*) FROM SaleItem WHERE IsDeleted = 0);
    PRINT 'New SaleItems count: ' + CAST(@NewItemsCount AS NVARCHAR(10));
    PRINT 'Items added: ' + CAST((@NewItemsCount - @ExistingItemsCount) AS NVARCHAR(10));
    PRINT '';

    COMMIT TRANSACTION;
    
    PRINT '════════════════════════════════════════════════════════════════';
    PRINT '  ✅ Missing Line Items Added Successfully';
    PRINT '════════════════════════════════════════════════════════════════';
    PRINT '';

    -- Summary statistics
    PRINT 'Summary Statistics:';
    SELECT 
        'Total Sales' AS Metric,
        CAST(COUNT(*) AS FLOAT) AS Value
    FROM Sale
    WHERE IsDeleted = 0

    UNION ALL

    SELECT 
        'Total SaleItems' AS Metric,
        CAST(COUNT(*) AS FLOAT) AS Value
    FROM SaleItem
    WHERE IsDeleted = 0

    UNION ALL

    SELECT 
        'Avg Items Per Invoice' AS Metric,
        AVG(CAST(ItemCount AS FLOAT)) AS Value
    FROM (
        SELECT 
            SaleId,
            COUNT(*) AS ItemCount
        FROM SaleItem
        WHERE IsDeleted = 0
        GROUP BY SaleId
    ) AS ItemCounts;

    PRINT '';
    PRINT 'Sample Invoices with Line Items:';
    SELECT TOP 5
        s.SaleNumber AS InvoiceNumber,
        s.CustomerName,
        s.Total,
        COUNT(si.Id) AS LineItemsCount,
        SUM(si.TotalPrice) AS LineItemsTotal
    FROM Sale s
    INNER JOIN SaleItem si ON s.Id = si.SaleId
    WHERE s.IsDeleted = 0 AND si.IsDeleted = 0
    GROUP BY s.SaleNumber, s.CustomerName, s.Total
    ORDER BY LineItemsCount DESC;

    -- Clean up temp table
    DROP TABLE #RawSalesData;

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
    
    PRINT '';
    PRINT '════════════════════════════════════════════════════════════════';
    PRINT '  ❌ ERROR: Failed to add line items';
    PRINT '════════════════════════════════════════════════════════════════';
    PRINT 'Error Message: ' + ERROR_MESSAGE();
    PRINT 'Error Line: ' + CAST(ERROR_LINE() AS NVARCHAR(10));
    PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR(10));
    
    -- Clean up temp table if it exists
    IF OBJECT_ID('tempdb..#RawSalesData') IS NOT NULL
        DROP TABLE #RawSalesData;
    
    THROW;
END CATCH;
