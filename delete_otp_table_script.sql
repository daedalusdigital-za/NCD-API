-- =====================================================
-- Script to Delete Otp Table
-- Database: NGCAndu-Dev
-- Date: November 19, 2025
-- 
-- WARNING: This script will permanently delete the Otp table and all its data
-- Make sure to backup your database before running this script
-- =====================================================

-- Set error handling
SET NOCOUNT ON;
SET XACT_ABORT ON;

BEGIN TRANSACTION;

BEGIN TRY
    PRINT '========================================';
    PRINT 'Starting deletion of Otp table';
    PRINT 'Time: ' + CONVERT(VARCHAR(20), GETDATE(), 120);
    PRINT '========================================';

    -- Step 1: Check if table exists and show current record count
    IF OBJECT_ID('dbo.Otp', 'U') IS NOT NULL
    BEGIN
        DECLARE @OtpCount INT;
        SELECT @OtpCount = COUNT(*) FROM dbo.Otp;
        PRINT 'Otp table exists with ' + CAST(@OtpCount AS VARCHAR(10)) + ' records';
    END
    ELSE
    BEGIN
        PRINT 'Otp table does not exist';
    END

    PRINT '';
    PRINT 'Step 1: Dropping Foreign Key Constraints...';

    -- Step 2: Drop foreign key constraints that might reference the Otp table
    -- (Check for any foreign keys from other tables that might reference Otp)
    DECLARE @sql NVARCHAR(MAX) = '';
    SELECT @sql = @sql + 'ALTER TABLE ' + QUOTENAME(SCHEMA_NAME(fk.schema_id)) + '.' + QUOTENAME(OBJECT_NAME(fk.parent_object_id)) + 
                  ' DROP CONSTRAINT ' + QUOTENAME(fk.name) + '; '
    FROM sys.foreign_keys fk
    WHERE OBJECT_NAME(fk.referenced_object_id) = 'Otp';

    IF LEN(@sql) > 0
    BEGIN
        EXEC sp_executesql @sql;
        PRINT '✓ Dropped foreign key constraints referencing Otp table';
    END
    ELSE
    BEGIN
        PRINT 'ℹ No foreign key constraints found referencing Otp table';
    END

    -- Step 3: Drop foreign key constraints from the Otp table itself
    DECLARE @otpFkSql NVARCHAR(MAX) = '';
    SELECT @otpFkSql = @otpFkSql + 'ALTER TABLE dbo.Otp DROP CONSTRAINT ' + QUOTENAME(fk.name) + '; '
    FROM sys.foreign_keys fk
    WHERE fk.parent_object_id = OBJECT_ID('dbo.Otp');

    IF LEN(@otpFkSql) > 0
    BEGIN
        EXEC sp_executesql @otpFkSql;
        PRINT '✓ Dropped foreign key constraints from Otp table';
    END
    ELSE
    BEGIN
        PRINT 'ℹ No foreign key constraints found on Otp table';
    END

    PRINT '';
    PRINT 'Step 2: Dropping Indexes...';

    -- Step 4: Drop indexes on Otp table
    DECLARE @indexSql NVARCHAR(MAX) = '';
    SELECT @indexSql = @indexSql + 'DROP INDEX ' + QUOTENAME(i.name) + ' ON dbo.Otp; '
    FROM sys.indexes i
    WHERE i.object_id = OBJECT_ID('dbo.Otp') 
      AND i.name IS NOT NULL 
      AND i.is_primary_key = 0 
      AND i.type > 0;

    IF LEN(@indexSql) > 0
    BEGIN
        EXEC sp_executesql @indexSql;
        PRINT '✓ Dropped indexes on Otp table';
    END
    ELSE
    BEGIN
        PRINT 'ℹ No non-clustered indexes found on Otp table';
    END

    PRINT '';
    PRINT 'Step 3: Dropping Table...';

    -- Step 5: Drop the Otp table
    IF OBJECT_ID('dbo.Otp', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.Otp;
        PRINT '✓ Successfully dropped Otp table';
    END
    ELSE
    BEGIN
        PRINT '- Otp table was already dropped or does not exist';
    END

    PRINT '';
    PRINT '========================================';
    PRINT 'SUCCESS: Otp table has been deleted successfully!';
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
IF OBJECT_ID('dbo.Otp', 'U') IS NULL
    PRINT '✓ Otp table successfully deleted'
ELSE
    PRINT '❌ Otp table still exists'

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