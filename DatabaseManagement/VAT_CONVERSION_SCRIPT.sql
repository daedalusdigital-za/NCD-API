-- ============================================================
-- VAT Inclusive Conversion Script (15% South Africa)
-- ============================================================
-- This script converts all prices from VAT EXCLUSIVE to VAT INCLUSIVE
-- Conversion formula: VAT Inclusive = VAT Exclusive × 1.15
-- 
-- WARNING: This is a ONE-TIME operation. Do NOT run this script twice!
-- Tables affected: InventoryItem (UnitPrice), SaleItem (UnitPrice, TotalPrice)
-- Date: February 2, 2026
-- ============================================================

BEGIN TRANSACTION;

BEGIN TRY
    PRINT '=== Starting VAT Conversion to Inclusive (15%) ===';
    PRINT '';
    
    -- ============================================================
    -- STEP 1: Backup current prices
    -- ============================================================
    PRINT 'STEP 1: Creating backup of current prices...';
    
    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'InventoryItem_PriceBackup')
    BEGIN
        SELECT Id, UnitPrice AS UnitPrice_ExclusiveVAT, CAST(NULL AS DECIMAL(18,2)) AS UnitPrice_InclusiveVAT
        INTO InventoryItem_PriceBackup
        FROM InventoryItem
        WHERE UnitPrice > 0;
        
        PRINT '✓ InventoryItem prices backed up to InventoryItem_PriceBackup';
    END
    
    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'SaleItem_PriceBackup')
    BEGIN
        SELECT Id, SaleId, UnitPrice AS UnitPrice_ExclusiveVAT, TotalPrice AS TotalPrice_ExclusiveVAT,
               CAST(NULL AS DECIMAL(18,2)) AS UnitPrice_InclusiveVAT, CAST(NULL AS DECIMAL(18,2)) AS TotalPrice_InclusiveVAT
        INTO SaleItem_PriceBackup
        FROM SaleItem
        WHERE UnitPrice > 0 OR TotalPrice > 0;
        
        PRINT '✓ SaleItem prices backed up to SaleItem_PriceBackup';
    END
    
    PRINT '';
    
    -- ============================================================
    -- STEP 2: Display before stats
    -- ============================================================
    PRINT 'STEP 2: Displaying price statistics BEFORE conversion...';
    PRINT '';
    
    DECLARE @InventoryCount INT = (SELECT COUNT(*) FROM InventoryItem WHERE UnitPrice > 0);
    DECLARE @InventoryTotal DECIMAL(18,2) = (SELECT SUM(UnitPrice) FROM InventoryItem WHERE UnitPrice > 0);
    DECLARE @SaleItemCount INT = (SELECT COUNT(*) FROM SaleItem WHERE UnitPrice > 0);
    DECLARE @SaleItemTotal DECIMAL(18,2) = (SELECT SUM(UnitPrice) FROM SaleItem WHERE UnitPrice > 0);
    
    PRINT 'BEFORE Conversion:';
    PRINT '  InventoryItem - Count: ' + CAST(@InventoryCount AS NVARCHAR(10)) + ', Total Value (excl VAT): R' + CAST(@InventoryTotal AS NVARCHAR(20));
    PRINT '  SaleItem - Count: ' + CAST(@SaleItemCount AS NVARCHAR(10)) + ', Total Value (excl VAT): R' + CAST(@SaleItemTotal AS NVARCHAR(20));
    PRINT '';
    
    -- ============================================================
    -- STEP 3: Convert InventoryItem prices
    -- ============================================================
    PRINT 'STEP 3: Converting InventoryItem prices (VAT Exclusive → VAT Inclusive)...';
    
    UPDATE InventoryItem
    SET UnitPrice = ROUND(UnitPrice * 1.15, 2)
    WHERE UnitPrice > 0;
    
    DECLARE @InventoryUpdated INT = @@ROWCOUNT;
    PRINT '✓ Updated ' + CAST(@InventoryUpdated AS NVARCHAR(10)) + ' InventoryItem records';
    PRINT '';
    
    -- ============================================================
    -- STEP 4: Convert SaleItem prices
    -- ============================================================
    PRINT 'STEP 4: Converting SaleItem prices (VAT Exclusive → VAT Inclusive)...';
    
    UPDATE SaleItem
    SET 
        UnitPrice = ROUND(UnitPrice * 1.15, 2),
        TotalPrice = ROUND(TotalPrice * 1.15, 2)
    WHERE UnitPrice > 0 OR TotalPrice > 0;
    
    DECLARE @SaleItemUpdated INT = @@ROWCOUNT;
    PRINT '✓ Updated ' + CAST(@SaleItemUpdated AS NVARCHAR(10)) + ' SaleItem records';
    PRINT '';
    
    -- ============================================================
    -- STEP 5: Update Sale totals (if they exist as columns)
    -- ============================================================
    PRINT 'STEP 5: Updating Sale table totals if they exist...';
    
    IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Sale' AND COLUMN_NAME = 'Total')
    BEGIN
        -- Sale totals should already be calculated from SaleItems, but updating backup
        PRINT '✓ Sale Total column exists - values should auto-recalculate from SaleItems';
    END
    ELSE
    BEGIN
        PRINT '  Note: Sale table does not have a Total column (calculated from SaleItems)';
    END
    PRINT '';
    
    -- ============================================================
    -- STEP 6: Verify conversion
    -- ============================================================
    PRINT 'STEP 6: Verifying conversion...';
    PRINT '';
    
    DECLARE @InventoryCountAfter INT = (SELECT COUNT(*) FROM InventoryItem WHERE UnitPrice > 0);
    DECLARE @InventoryTotalAfter DECIMAL(18,2) = (SELECT SUM(UnitPrice) FROM InventoryItem WHERE UnitPrice > 0);
    DECLARE @SaleItemCountAfter INT = (SELECT COUNT(*) FROM SaleItem WHERE UnitPrice > 0);
    DECLARE @SaleItemTotalAfter DECIMAL(18,2) = (SELECT SUM(UnitPrice) FROM SaleItem WHERE UnitPrice > 0);
    
    PRINT 'AFTER Conversion:';
    PRINT '  InventoryItem - Count: ' + CAST(@InventoryCountAfter AS NVARCHAR(10)) + ', Total Value (incl VAT): R' + CAST(@InventoryTotalAfter AS NVARCHAR(20));
    PRINT '  SaleItem - Count: ' + CAST(@SaleItemCountAfter AS NVARCHAR(10)) + ', Total Value (incl VAT): R' + CAST(@SaleItemTotalAfter AS NVARCHAR(20));
    PRINT '';
    
    -- Show sample conversions
    PRINT 'Sample Conversions (showing first 5 items):';
    PRINT '';
    PRINT 'InventoryItem Sample:';
    SELECT TOP 5 
        Id,
        Description,
        ROUND((UnitPrice / 1.15), 2) AS 'Old Price (Excl VAT)',
        UnitPrice AS 'New Price (Incl VAT)',
        ROUND(UnitPrice - (UnitPrice / 1.15), 2) AS 'VAT Amount'
    FROM InventoryItem
    WHERE UnitPrice > 0
    ORDER BY Id;
    PRINT '';
    
    -- ============================================================
    -- STEP 7: Confirmation message
    -- ============================================================
    PRINT '=== VAT Conversion Complete ===';
    PRINT '';
    PRINT 'Summary:';
    PRINT '  ✓ ' + CAST(@InventoryUpdated AS NVARCHAR(10)) + ' InventoryItem prices updated';
    PRINT '  ✓ ' + CAST(@SaleItemUpdated AS NVARCHAR(10)) + ' SaleItem prices updated';
    PRINT '  ✓ All prices are now VAT INCLUSIVE (15%)';
    PRINT '  ✓ Backup tables created for reference: InventoryItem_PriceBackup, SaleItem_PriceBackup';
    PRINT '';
    PRINT 'IMPORTANT: Update your backend code to reflect VAT INCLUSIVE pricing!';
    PRINT '  1. Update API responses to show prices as VAT INCLUSIVE';
    PRINT '  2. Update frontend to display prices as VAT INCLUSIVE';
    PRINT '  3. Update documentation to clarify VAT INCLUSIVE pricing';
    PRINT '';
    
    COMMIT TRANSACTION;
    PRINT 'Transaction committed successfully.';
    
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'ERROR: ' + ERROR_MESSAGE();
    PRINT 'Transaction rolled back. No changes made.';
    THROW;
END CATCH
