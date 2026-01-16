-- =============================================================================
-- Fix CreditNotes Table Column Names to Match C# Model
-- =============================================================================
-- Purpose: Rename columns to match BaseModel properties
-- Issue: SQL uses CreatedDate but C# expects DateCreated
-- =============================================================================

SET NOCOUNT ON;

PRINT '═══════════════════════════════════════════════════════════════';
PRINT '  Fixing CreditNotes Column Names';
PRINT '═══════════════════════════════════════════════════════════════';

BEGIN TRY
    -- Check if table exists
    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'CreditNotes')
    BEGIN
        RAISERROR('CreditNotes table does not exist', 16, 1);
        RETURN;
    END

    -- Rename CreatedDate to DateCreated (if needed)
    IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('dbo.CreditNotes') AND name = 'CreatedDate')
    BEGIN
        EXEC sp_rename 'dbo.CreditNotes.CreatedDate', 'DateCreated', 'COLUMN';
        PRINT '  ✓ Renamed CreatedDate → DateCreated';
    END
    ELSE
        PRINT '  ℹ Column DateCreated already correct';

    -- Rename LastUpdated to DateUpdated (if LastUpdated exists)
    IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('dbo.CreditNotes') AND name = 'LastUpdated')
    BEGIN
        EXEC sp_rename 'dbo.CreditNotes.LastUpdated', 'DateUpdated', 'COLUMN';
        PRINT '  ✓ Renamed LastUpdated → DateUpdated';
    END
    ELSE
        PRINT '  ℹ LastUpdated column does not exist or already renamed';

    -- Fix index name (it references old column name)
    IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_CreditNotes_CreatedDate' AND object_id = OBJECT_ID('dbo.CreditNotes'))
    BEGIN
        DROP INDEX IX_CreditNotes_CreatedDate ON dbo.CreditNotes;
        CREATE INDEX IX_CreditNotes_DateCreated ON dbo.CreditNotes(DateCreated DESC);
        PRINT '  ✓ Recreated index: IX_CreditNotes_DateCreated';
    END
    ELSE
        PRINT '  ℹ Index already correct';

    PRINT '';
    PRINT '═══════════════════════════════════════════════════════════════';
    PRINT '  ✅ Column names fixed successfully';
    PRINT '═══════════════════════════════════════════════════════════════';

    -- Show updated structure
    PRINT '';
    PRINT 'Updated Columns:';
    SELECT 
        COLUMN_NAME,
        DATA_TYPE,
        IS_NULLABLE,
        COLUMN_DEFAULT
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'CreditNotes'
    AND COLUMN_NAME IN ('DateCreated', 'DateUpdated', 'CreatedBy', 'UpdatedBy')
    ORDER BY COLUMN_NAME;

END TRY
BEGIN CATCH
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    PRINT '═══════════════════════════════════════════════════════════════';
    PRINT '  ❌ ERROR: ' + @ErrorMessage;
    PRINT '═══════════════════════════════════════════════════════════════';
    RAISERROR(@ErrorMessage, 16, 1);
END CATCH;

PRINT '';
PRINT 'Script execution completed.';
