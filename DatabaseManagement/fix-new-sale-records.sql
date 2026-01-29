-- =============================================================================
-- Fix New Sale Records - Update Total and Notes
-- =============================================================================
-- Updates Total from SaleItems and adds Notes
-- =============================================================================

SET NOCOUNT ON;

PRINT '════════════════════════════════════════════════════════════════';
PRINT '  Fixing New Sale Records';
PRINT '════════════════════════════════════════════════════════════════';
PRINT '';

BEGIN TRY
    BEGIN TRANSACTION;

    -- Count records to fix
    DECLARE @RecordsToFix INT = (
        SELECT COUNT(*) FROM Sale 
        WHERE Total = 0 AND IsDeleted = 0
    );
    PRINT 'Records with Total = 0: ' + CAST(@RecordsToFix AS NVARCHAR(10));

    -- Update Total from SaleItems
    PRINT '';
    PRINT 'Step 1: Updating Total from SaleItems...';
    
    UPDATE s
    SET s.Total = ISNULL((
        SELECT SUM(si.TotalPrice) 
        FROM SaleItem si 
        WHERE si.SaleId = s.Id AND si.IsDeleted = 0
    ), 0)
    FROM Sale s
    WHERE s.Total = 0 AND s.IsDeleted = 0;

    PRINT '  ✓ Updated ' + CAST(@@ROWCOUNT AS NVARCHAR(10)) + ' sale totals';

    -- Update Notes with product info for records that have NULL notes
    PRINT '';
    PRINT 'Step 2: Updating Notes with product info...';
    
    UPDATE s
    SET s.Notes = (
        SELECT TOP 1 inv.Name
        FROM SaleItem si
        INNER JOIN InventoryItem inv ON si.InventoryItemId = inv.Id
        WHERE si.SaleId = s.Id AND si.IsDeleted = 0
    )
    FROM Sale s
    WHERE s.Notes IS NULL AND s.IsDeleted = 0;

    PRINT '  ✓ Updated ' + CAST(@@ROWCOUNT AS NVARCHAR(10)) + ' sale notes';

    -- Verify the fix
    PRINT '';
    PRINT 'VERIFICATION - Records still with Total = 0:';
    SELECT COUNT(*) AS RecordsWithZeroTotal 
    FROM Sale 
    WHERE Total = 0 AND IsDeleted = 0;

    PRINT '';
    PRINT 'SAMPLE OF FIXED RECORDS:';
    SELECT TOP 10 Id, SaleNumber, CustomerName, Total, Notes
    FROM Sale 
    WHERE Id > 1000 AND IsDeleted = 0
    ORDER BY Id;

    COMMIT TRANSACTION;

    PRINT '';
    PRINT '════════════════════════════════════════════════════════════════';
    PRINT '  ✅ Fix Complete';
    PRINT '════════════════════════════════════════════════════════════════';

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    PRINT '❌ ERROR: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
