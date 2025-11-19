-- =====================================================
-- Script to Delete Issue Table
-- Database: NGCAndu-Dev
-- Date: November 19, 2025
-- 
-- WARNING: This script will permanently delete the Issue table and all its data
-- Make sure to backup your database before running this script
-- =====================================================

-- Set error handling
SET NOCOUNT ON;
SET XACT_ABORT ON;

BEGIN TRANSACTION;

BEGIN TRY
    PRINT '========================================';
    PRINT 'Starting deletion of Issue table';
    PRINT 'Time: ' + CONVERT(VARCHAR(20), GETDATE(), 120);
    PRINT '========================================';

    -- Step 1: Check if table exists and show current record count
    IF OBJECT_ID('dbo.Issue', 'U') IS NOT NULL
    BEGIN
        DECLARE @IssueCount INT;
        SELECT @IssueCount = COUNT(*) FROM dbo.Issue;
        PRINT 'Issue table exists with ' + CAST(@IssueCount AS VARCHAR(10)) + ' records';
    END
    ELSE
    BEGIN
        PRINT 'Issue table does not exist';
    END

    PRINT '';
    PRINT 'Step 1: Dropping Foreign Key Constraints...';

    -- Step 2: Drop foreign key constraints that might reference the Issue table
    -- (Check for any foreign keys from other tables that might reference Issue)
    DECLARE @sql NVARCHAR(MAX) = '';
    SELECT @sql = @sql + 'ALTER TABLE ' + QUOTENAME(SCHEMA_NAME(fk.schema_id)) + '.' + QUOTENAME(OBJECT_NAME(fk.parent_object_id)) + 
                  ' DROP CONSTRAINT ' + QUOTENAME(fk.name) + '; '
    FROM sys.foreign_keys fk
    WHERE OBJECT_NAME(fk.referenced_object_id) = 'Issue';

    IF LEN(@sql) > 0
    BEGIN
        EXEC sp_executesql @sql;
        PRINT '✓ Dropped foreign key constraints referencing Issue table';
    END
    ELSE
    BEGIN
        PRINT 'ℹ No foreign key constraints found referencing Issue table';
    END

    -- Step 3: Drop foreign key constraints from the Issue table itself
    DECLARE @issueFkSql NVARCHAR(MAX) = '';
    SELECT @issueFkSql = @issueFkSql + 'ALTER TABLE dbo.Issue DROP CONSTRAINT ' + QUOTENAME(fk.name) + '; '
    FROM sys.foreign_keys fk
    WHERE fk.parent_object_id = OBJECT_ID('dbo.Issue');

    IF LEN(@issueFkSql) > 0
    BEGIN
        EXEC sp_executesql @issueFkSql;
        PRINT '✓ Dropped foreign key constraints from Issue table';
    END
    ELSE
    BEGIN
        PRINT 'ℹ No foreign key constraints found on Issue table';
    END

    PRINT '';
    PRINT 'Step 2: Dropping Indexes...';

    -- Step 4: Drop indexes on Issue table
    DECLARE @indexSql NVARCHAR(MAX) = '';
    SELECT @indexSql = @indexSql + 'DROP INDEX ' + QUOTENAME(i.name) + ' ON dbo.Issue; '
    FROM sys.indexes i
    WHERE i.object_id = OBJECT_ID('dbo.Issue') 
      AND i.name IS NOT NULL 
      AND i.is_primary_key = 0 
      AND i.type > 0;

    IF LEN(@indexSql) > 0
    BEGIN
        EXEC sp_executesql @indexSql;
        PRINT '✓ Dropped indexes on Issue table';
    END
    ELSE
    BEGIN
        PRINT 'ℹ No non-clustered indexes found on Issue table';
    END

    PRINT '';
    PRINT 'Step 3: Dropping Table...';

    -- Step 5: Drop the Issue table
    IF OBJECT_ID('dbo.Issue', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.Issue;
        PRINT '✓ Successfully dropped Issue table';
    END
    ELSE
    BEGIN
        PRINT '- Issue table was already dropped or does not exist';
    END

    PRINT '';
    PRINT '========================================';
    PRINT 'SUCCESS: Issue table has been deleted successfully!';
    PRINT 'Time: ' + CONVERT(VARCHAR(20), GETDATE(), 120);
    PRINT '========================================';

    -- Commit the transaction
    COMMIT TRANSACTION;

END TRY
BEGIN CATCH
    -- Rollback transaction on error
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    PRINT '';
    PRINT '========================================';
    PRINT 'ERROR OCCURRED:';
    PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR(10));
    PRINT 'Error Message: ' + ERROR_MESSAGE();
    PRINT 'Error Line: ' + CAST(ERROR_LINE() AS VARCHAR(10));
    PRINT '========================================';
    PRINT 'Transaction has been rolled back. No changes were made.';
    
    -- Re-throw the error
    THROW;
END CATCH

PRINT '';
PRINT 'Script execution completed.';

-- =====================================================
-- VERIFICATION QUERIES
-- Run these after the script to verify deletion
-- =====================================================

PRINT '';
PRINT 'VERIFICATION:';
PRINT '=============';

-- Check if table still exists
IF OBJECT_ID('dbo.Issue', 'U') IS NULL
    PRINT '✓ Issue table successfully deleted'
ELSE
    PRINT '❌ Issue table still exists'

-- List remaining tables for confirmation
PRINT '';
PRINT 'Remaining tables in database:';
SELECT 
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE'
    AND TABLE_NAME NOT LIKE '__EF%'
ORDER BY TABLE_SCHEMA, TABLE_NAME;