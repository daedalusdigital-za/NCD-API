-- =====================================================
-- Script to Delete TicketDetails and TicketStatus Tables
-- Database: Your Azure SQL Database
-- Date: November 19, 2025
-- 
-- WARNING: This script will permanently delete tables and all their data
-- Make sure to backup your database before running this script
-- =====================================================

-- Set error handling
SET NOCOUNT ON;
SET XACT_ABORT ON;

BEGIN TRANSACTION;

BEGIN TRY
    PRINT '========================================';
    PRINT 'Starting deletion of TicketDetails and TicketStatus tables';
    PRINT 'Time: ' + CONVERT(VARCHAR(20), GETDATE(), 120);
    PRINT '========================================';

    -- Step 1: Check if tables exist and show current record counts
    IF OBJECT_ID('dbo.TicketDetails', 'U') IS NOT NULL
    BEGIN
        DECLARE @TicketDetailsCount INT;
        SELECT @TicketDetailsCount = COUNT(*) FROM dbo.TicketDetails;
        PRINT 'TicketDetails table exists with ' + CAST(@TicketDetailsCount AS VARCHAR(10)) + ' records';
    END
    ELSE
    BEGIN
        PRINT 'TicketDetails table does not exist';
    END

    IF OBJECT_ID('dbo.TicketStatus', 'U') IS NOT NULL
    BEGIN
        DECLARE @TicketStatusCount INT;
        SELECT @TicketStatusCount = COUNT(*) FROM dbo.TicketStatus;
        PRINT 'TicketStatus table exists with ' + CAST(@TicketStatusCount AS VARCHAR(10)) + ' records';
    END
    ELSE
    BEGIN
        PRINT 'TicketStatus table does not exist';
    END

    PRINT '';
    PRINT 'Step 1: Dropping Foreign Key Constraints...';

    -- Step 2: Drop foreign key constraint from TicketDetails to TicketStatus
    IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_TicketDetails_TicketStatus_StatusId')
    BEGIN
        ALTER TABLE dbo.TicketDetails DROP CONSTRAINT FK_TicketDetails_TicketStatus_StatusId;
        PRINT '✓ Dropped FK_TicketDetails_TicketStatus_StatusId constraint';
    END
    ELSE
    BEGIN
        PRINT '- FK_TicketDetails_TicketStatus_StatusId constraint not found';
    END

    -- Step 3: Drop foreign key constraints from TicketDetails to other tables
    IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_TicketDetails_AspNetUsers_CreatedBy')
    BEGIN
        ALTER TABLE dbo.TicketDetails DROP CONSTRAINT FK_TicketDetails_AspNetUsers_CreatedBy;
        PRINT '✓ Dropped FK_TicketDetails_AspNetUsers_CreatedBy constraint';
    END

    IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_TicketDetails_AspNetUsers_UpdatedBy')
    BEGIN
        ALTER TABLE dbo.TicketDetails DROP CONSTRAINT FK_TicketDetails_AspNetUsers_UpdatedBy;
        PRINT '✓ Dropped FK_TicketDetails_AspNetUsers_UpdatedBy constraint';
    END

    IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_TicketDetails_AspNetUsers_UserId')
    BEGIN
        ALTER TABLE dbo.TicketDetails DROP CONSTRAINT FK_TicketDetails_AspNetUsers_UserId;
        PRINT '✓ Dropped FK_TicketDetails_AspNetUsers_UserId constraint';
    END

    -- Step 4: Drop foreign key constraints to Priority and Issue tables if they exist
    IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_TicketDetails_Priority_PriorityId')
    BEGIN
        ALTER TABLE dbo.TicketDetails DROP CONSTRAINT FK_TicketDetails_Priority_PriorityId;
        PRINT '✓ Dropped FK_TicketDetails_Priority_PriorityId constraint';
    END

    IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_TicketDetails_Issue_IssueId')
    BEGIN
        ALTER TABLE dbo.TicketDetails DROP CONSTRAINT FK_TicketDetails_Issue_IssueId;
        PRINT '✓ Dropped FK_TicketDetails_Issue_IssueId constraint';
    END

    PRINT '';
    PRINT 'Step 2: Dropping Indexes...';

    -- Step 5: Drop indexes on TicketDetails table
    IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_TicketDetails_StatusId' AND object_id = OBJECT_ID('dbo.TicketDetails'))
    BEGIN
        DROP INDEX IX_TicketDetails_StatusId ON dbo.TicketDetails;
        PRINT '✓ Dropped IX_TicketDetails_StatusId index';
    END

    IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_TicketDetails_PriorityId' AND object_id = OBJECT_ID('dbo.TicketDetails'))
    BEGIN
        DROP INDEX IX_TicketDetails_PriorityId ON dbo.TicketDetails;
        PRINT '✓ Dropped IX_TicketDetails_PriorityId index';
    END

    IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_TicketDetails_IssueId' AND object_id = OBJECT_ID('dbo.TicketDetails'))
    BEGIN
        DROP INDEX IX_TicketDetails_IssueId ON dbo.TicketDetails;
        PRINT '✓ Dropped IX_TicketDetails_IssueId index';
    END

    IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_TicketDetails_CreatedBy' AND object_id = OBJECT_ID('dbo.TicketDetails'))
    BEGIN
        DROP INDEX IX_TicketDetails_CreatedBy ON dbo.TicketDetails;
        PRINT '✓ Dropped IX_TicketDetails_CreatedBy index';
    END

    IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_TicketDetails_UpdatedBy' AND object_id = OBJECT_ID('dbo.TicketDetails'))
    BEGIN
        DROP INDEX IX_TicketDetails_UpdatedBy ON dbo.TicketDetails;
        PRINT '✓ Dropped IX_TicketDetails_UpdatedBy index';
    END

    IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_TicketDetails_UserId' AND object_id = OBJECT_ID('dbo.TicketDetails'))
    BEGIN
        DROP INDEX IX_TicketDetails_UserId ON dbo.TicketDetails;
        PRINT '✓ Dropped IX_TicketDetails_UserId index';
    END

    PRINT '';
    PRINT 'Step 3: Dropping Tables...';

    -- Step 6: Drop TicketDetails table first (child table)
    IF OBJECT_ID('dbo.TicketDetails', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.TicketDetails;
        PRINT '✓ Successfully dropped TicketDetails table';
    END
    ELSE
    BEGIN
        PRINT '- TicketDetails table was already dropped or does not exist';
    END

    -- Step 7: Drop TicketStatus table (parent table)
    IF OBJECT_ID('dbo.TicketStatus', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.TicketStatus;
        PRINT '✓ Successfully dropped TicketStatus table';
    END
    ELSE
    BEGIN
        PRINT '- TicketStatus table was already dropped or does not exist';
    END

    PRINT '';
    PRINT '========================================';
    PRINT 'SUCCESS: Both tables have been deleted successfully!';
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

-- Check if tables still exist
IF OBJECT_ID('dbo.TicketDetails', 'U') IS NULL
    PRINT '✓ TicketDetails table successfully deleted'
ELSE
    PRINT '❌ TicketDetails table still exists'

IF OBJECT_ID('dbo.TicketStatus', 'U') IS NULL
    PRINT '✓ TicketStatus table successfully deleted'
ELSE
    PRINT '❌ TicketStatus table still exists'

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