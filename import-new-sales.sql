-- =====================================================
-- New Sales Import Script for Azure Data Studio
-- Run this script against your NCD database
-- It will skip any sales that already exist (by SaleNumber)
-- =====================================================

SET NOCOUNT ON;

-- Create temp table to hold our import data
IF OBJECT_ID('tempdb..#SalesImport') IS NOT NULL DROP TABLE #SalesImport;
IF OBJECT_ID('tempdb..#SaleItemsImport') IS NOT NULL DROP TABLE #SaleItemsImport;

CREATE TABLE #SalesImport (
    InvNo NVARCHAR(50),
    SaleDate DATE,
    CustomerName NVARCHAR(255),
    CustomerPhone NVARCHAR(50),
    Notes NVARCHAR(500)
);

CREATE TABLE #SaleItemsImport (
    InvNo NVARCHAR(50),
    ItemCode NVARCHAR(50),
    Quantity DECIMAL(18,2),
    UnitPrice DECIMAL(18,2)
);

-- =====================================================
-- INSERT SALES DATA
-- =====================================================

INSERT INTO #SalesImport (InvNo, SaleDate, CustomerName, CustomerPhone, Notes) VALUES
('IN163336', '2026-02-17', 'PROVINCIAL PHARM SUPPLY DEPOT', '', 'Imported from sales data'),
('IN163337', '2026-02-17', 'PROVINCIAL PHARM SUPPLY DEPOT', '', 'Imported from sales data'),
('IN163333', '2026-02-17', 'PROVINCIAL PHARM SUPPLY DEPOT', '', 'Imported from sales data'),
('IN163334', '2026-02-17', 'PROVINCIAL PHARM SUPPLY DEPOT', '', 'Imported from sales data'),
('IN164263', '2026-03-11', 'HILLBROW CHC', '', 'Imported from sales data'),
('IN164264', '2026-03-11', 'HILLBROW CHC', '', 'Imported from sales data');
-- Note: IN164248 skipped (0 quantity)

-- =====================================================
-- INSERT SALE ITEMS DATA
-- =====================================================

INSERT INTO #SaleItemsImport (InvNo, ItemCode, Quantity, UnitPrice) VALUES
-- IN163336 - PROVINCIAL PHARM SUPPLY DEPOT
('IN163336', 'NDOH35004', 150.00, 136.53),
-- IN163337 - PROVINCIAL PHARM SUPPLY DEPOT
('IN163337', 'NDOH35004', 100.00, 136.53),
-- IN163333 - PROVINCIAL PHARM SUPPLY DEPOT
('IN163333', 'NDOH35017', 200.00, 44.84),
-- IN163334 - PROVINCIAL PHARM SUPPLY DEPOT
('IN163334', 'NDOH35017', 100.00, 44.84),
-- IN164263 - HILLBROW CHC
('IN164263', 'NDOH35034', 6.00, 1763.71),
-- IN164264 - HILLBROW CHC
('IN164264', 'NDOH35034', 6.00, 1763.71);

-- =====================================================
-- REPORT: Show what will be imported
-- =====================================================

PRINT '========================================';
PRINT 'Step 1: Checking for Duplicates';
PRINT '========================================';

DECLARE @TotalToImport INT, @Duplicates INT, @NewSales INT;

SELECT @TotalToImport = COUNT(*) FROM #SalesImport;
SELECT @Duplicates = COUNT(*) FROM #SalesImport si WHERE EXISTS (SELECT 1 FROM Sale s WHERE s.SaleNumber = si.InvNo AND s.IsDeleted = 0);
SET @NewSales = @TotalToImport - @Duplicates;

PRINT 'Total sales in import file: ' + CAST(@TotalToImport AS VARCHAR(10));
PRINT 'Already exist (will be skipped): ' + CAST(@Duplicates AS VARCHAR(10));
PRINT 'New sales to import: ' + CAST(@NewSales AS VARCHAR(10));

-- Show which ones already exist
IF @Duplicates > 0
BEGIN
    PRINT '';
    PRINT 'Existing sales that will be SKIPPED:';
    SELECT si.InvNo AS 'Invoice', si.CustomerName AS 'Customer', s.Total AS 'Existing Total'
    FROM #SalesImport si
    INNER JOIN Sale s ON s.SaleNumber = si.InvNo AND s.IsDeleted = 0;
END

-- =====================================================
-- INSERT NEW SALES
-- =====================================================

PRINT '';
PRINT '========================================';
PRINT 'Step 2: Inserting New Sales';
PRINT '========================================';

BEGIN TRANSACTION;

BEGIN TRY
    -- Insert Sales (only new ones)
    INSERT INTO Sale (SaleNumber, SaleDate, CustomerName, CustomerPhone, Notes, Total, CreatedDate, IsDeleted, CreatedBy)
    SELECT 
        si.InvNo,
        si.SaleDate,
        si.CustomerName,
        si.CustomerPhone,
        si.Notes,
        0, -- Total will be updated after items are inserted
        GETDATE(),
        0,
        1 -- CreatedBy = 1 (admin)
    FROM #SalesImport si
    WHERE NOT EXISTS (SELECT 1 FROM Sale s WHERE s.SaleNumber = si.InvNo AND s.IsDeleted = 0);

    DECLARE @SalesInserted INT = @@ROWCOUNT;
    PRINT 'Sales records inserted: ' + CAST(@SalesInserted AS VARCHAR(10));

    -- Insert Sale Items
    INSERT INTO SaleItem (SaleId, InventoryItemId, Quantity, UnitPrice, TotalPrice, IsDeleted)
    SELECT 
        s.Id,
        i.Id,
        sii.Quantity,
        sii.UnitPrice,
        sii.Quantity * sii.UnitPrice,
        0
    FROM #SaleItemsImport sii
    INNER JOIN Sale s ON s.SaleNumber = sii.InvNo AND s.IsDeleted = 0
    INNER JOIN InventoryItem i ON i.SKU = sii.ItemCode
    WHERE NOT EXISTS (
        SELECT 1 FROM SaleItem si2 
        WHERE si2.SaleId = s.Id AND si2.InventoryItemId = i.Id
    );

    DECLARE @ItemsInserted INT = @@ROWCOUNT;
    PRINT 'Sale item records inserted: ' + CAST(@ItemsInserted AS VARCHAR(10));

    -- Update Sale totals based on items
    UPDATE s
    SET s.Total = (
        SELECT ISNULL(SUM(si.TotalPrice), 0) 
        FROM SaleItem si 
        WHERE si.SaleId = s.Id AND si.IsDeleted = 0
    )
    FROM Sale s
    INNER JOIN #SalesImport sim ON s.SaleNumber = sim.InvNo
    WHERE s.IsDeleted = 0;

    PRINT 'Sale totals updated.';

    COMMIT TRANSACTION;
    PRINT '';
    PRINT '========================================';
    PRINT 'IMPORT COMPLETED SUCCESSFULLY!';
    PRINT '========================================';

END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT '';
    PRINT '========================================';
    PRINT 'ERROR - IMPORT ROLLED BACK!';
    PRINT '========================================';
    PRINT 'Error: ' + ERROR_MESSAGE();
END CATCH;

-- =====================================================
-- FINAL VERIFICATION
-- =====================================================

PRINT '';
PRINT '========================================';
PRINT 'Step 3: Verification';
PRINT '========================================';

SELECT 
    s.SaleNumber,
    s.CustomerName,
    s.SaleDate,
    s.Total,
    (SELECT COUNT(*) FROM SaleItem si WHERE si.SaleId = s.Id) AS ItemCount
FROM Sale s
INNER JOIN #SalesImport sim ON s.SaleNumber = sim.InvNo
WHERE s.IsDeleted = 0
ORDER BY s.SaleNumber;

-- Cleanup
DROP TABLE #SalesImport;
DROP TABLE #SaleItemsImport;

PRINT '';
PRINT 'Script completed. Check results above.';
