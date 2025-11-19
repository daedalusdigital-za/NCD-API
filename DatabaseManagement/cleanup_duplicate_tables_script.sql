-- =====================================================
-- Script to Clean Up Duplicate and Unused Tables
-- Database: NGCAndu-Dev
-- Date: November 19, 2025
-- 
-- WARNING: This script will permanently delete duplicate tables and unused data
-- Make sure to backup your database before running this script
-- =====================================================

SET NOCOUNT ON;
SET XACT_ABORT ON;

BEGIN TRANSACTION;

BEGIN TRY
    PRINT '========================================';
    PRINT 'Starting cleanup of duplicate and unused tables';
    PRINT 'Time: ' + CONVERT(VARCHAR(20), GETDATE(), 120);
    PRINT '========================================';

    -- Tables to be deleted (duplicates and unused):
    -- HealthFacilities (not used in current codebase)
    -- Provinces (duplicate of Province)
    -- Sales (duplicate of Sale) 
    -- SaleItems (duplicate of SaleItem)
    -- Trainers (duplicate of Trainer)

    DECLARE @tablesToDelete TABLE (TableName NVARCHAR(128));
    INSERT INTO @tablesToDelete VALUES 
        ('HealthFacilities'),
        ('Provinces'), 
        ('Sales'),
        ('SaleItems'),
        ('Trainers');

    DECLARE @currentTable NVARCHAR(128);
    DECLARE table_cursor CURSOR FOR SELECT TableName FROM @tablesToDelete;
    
    OPEN table_cursor;
    FETCH NEXT FROM table_cursor INTO @currentTable;
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT '';
        PRINT 'Processing table: ' + @currentTable;
        PRINT '=====================================';
        
        -- Check if table exists
        IF OBJECT_ID('dbo.' + @currentTable, 'U') IS NOT NULL
        BEGIN
            DECLARE @recordCount INT;
            DECLARE @sql NVARCHAR(MAX);
            
            -- Get record count
            SET @sql = 'SELECT @count = COUNT(*) FROM dbo.' + QUOTENAME(@currentTable);
            EXEC sp_executesql @sql, N'@count INT OUTPUT', @count = @recordCount OUTPUT;
            PRINT 'Table ' + @currentTable + ' exists with ' + CAST(@recordCount AS VARCHAR(10)) + ' records';
            
            -- Step 1: Drop foreign key constraints that reference this table
            DECLARE @fkSql NVARCHAR(MAX) = '';
            SELECT @fkSql = @fkSql + 'ALTER TABLE ' + QUOTENAME(SCHEMA_NAME(fk.schema_id)) + '.' + QUOTENAME(OBJECT_NAME(fk.parent_object_id)) + 
                          ' DROP CONSTRAINT ' + QUOTENAME(fk.name) + '; '
            FROM sys.foreign_keys fk
            WHERE OBJECT_NAME(fk.referenced_object_id) = @currentTable;

            IF LEN(@fkSql) > 0
            BEGIN
                EXEC sp_executesql @fkSql;
                PRINT '✓ Dropped foreign key constraints referencing ' + @currentTable;
            END
            ELSE
            BEGIN
                PRINT 'ℹ No foreign key constraints found referencing ' + @currentTable;
            END

            -- Step 2: Drop foreign key constraints from this table
            DECLARE @tableFkSql NVARCHAR(MAX) = '';
            SELECT @tableFkSql = @tableFkSql + 'ALTER TABLE dbo.' + QUOTENAME(@currentTable) + ' DROP CONSTRAINT ' + QUOTENAME(fk.name) + '; '
            FROM sys.foreign_keys fk
            WHERE fk.parent_object_id = OBJECT_ID('dbo.' + @currentTable);

            IF LEN(@tableFkSql) > 0
            BEGIN
                EXEC sp_executesql @tableFkSql;
                PRINT '✓ Dropped foreign key constraints from ' + @currentTable;
            END
            ELSE
            BEGIN
                PRINT 'ℹ No foreign key constraints found on ' + @currentTable;
            END

            -- Step 3: Drop unique constraints first
            DECLARE @uniqueConstraintSql NVARCHAR(MAX) = '';
            SELECT @uniqueConstraintSql = @uniqueConstraintSql + 'ALTER TABLE dbo.' + QUOTENAME(@currentTable) + ' DROP CONSTRAINT ' + QUOTENAME(kc.name) + '; '
            FROM sys.key_constraints kc
            WHERE kc.parent_object_id = OBJECT_ID('dbo.' + @currentTable)
              AND kc.type = 'UQ';

            IF LEN(@uniqueConstraintSql) > 0
            BEGIN
                EXEC sp_executesql @uniqueConstraintSql;
                PRINT '✓ Dropped unique constraints on ' + @currentTable;
            END
            ELSE
            BEGIN
                PRINT 'ℹ No unique constraints found on ' + @currentTable;
            END

            -- Step 4: Drop indexes (excluding those used for constraints)
            DECLARE @indexSql NVARCHAR(MAX) = '';
            SELECT @indexSql = @indexSql + 'DROP INDEX ' + QUOTENAME(i.name) + ' ON dbo.' + QUOTENAME(@currentTable) + '; '
            FROM sys.indexes i
            WHERE i.object_id = OBJECT_ID('dbo.' + @currentTable)
              AND i.name IS NOT NULL 
              AND i.is_primary_key = 0 
              AND i.is_unique_constraint = 0
              AND i.type > 0;

            IF LEN(@indexSql) > 0
            BEGIN
                EXEC sp_executesql @indexSql;
                PRINT '✓ Dropped indexes on ' + @currentTable;
            END
            ELSE
            BEGIN
                PRINT 'ℹ No non-clustered indexes found on ' + @currentTable;
            END

            -- Step 5: Drop the table
            SET @sql = 'DROP TABLE dbo.' + QUOTENAME(@currentTable);
            EXEC sp_executesql @sql;
            PRINT '✓ Successfully dropped table ' + @currentTable;
            PRINT 'Total records deleted: ' + CAST(@recordCount AS VARCHAR(10));
        END
        ELSE
        BEGIN
            PRINT 'ℹ Table ' + @currentTable + ' does not exist - skipping';
        END
        
        FETCH NEXT FROM table_cursor INTO @currentTable;
    END
    
    CLOSE table_cursor;
    DEALLOCATE table_cursor;

    PRINT '';
    PRINT '========================================';
    PRINT 'SUCCESS: Duplicate table cleanup completed!';
    PRINT 'Time: ' + CONVERT(VARCHAR(20), GETDATE(), 120);
    PRINT '========================================';

    -- Commit the transaction
    COMMIT TRANSACTION;

END TRY
BEGIN CATCH
    -- Rollback transaction on error
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
        
    CLOSE table_cursor;
    DEALLOCATE table_cursor;

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

-- Check which tables were successfully deleted
DECLARE @deletedTables TABLE (TableName NVARCHAR(128));
INSERT INTO @deletedTables VALUES ('HealthFacilities'), ('Provinces'), ('Sales'), ('SaleItems'), ('Trainers');

SELECT 
    dt.TableName,
    CASE 
        WHEN t.TABLE_NAME IS NULL THEN '✓ Successfully Deleted'
        ELSE '❌ Still Exists'
    END AS Status
FROM @deletedTables dt
LEFT JOIN INFORMATION_SCHEMA.TABLES t ON dt.TableName = t.TABLE_NAME
ORDER BY dt.TableName;

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