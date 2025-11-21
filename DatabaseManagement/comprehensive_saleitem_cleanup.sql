-- Comprehensive SaleItem table cleanup - Remove ALL InventoryItemId variant columns
-- This script removes ALL problematic InventoryItemId columns from SaleItem table

BEGIN TRANSACTION;

BEGIN TRY
    PRINT 'Starting comprehensive SaleItem table cleanup...';
    
    -- Check if SaleItem table exists
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaleItem]') AND type in (N'U'))
    BEGIN
        PRINT 'SaleItem table found. Removing ALL InventoryItemId variant columns...';
        
        -- Declare cursor to iterate through ALL InventoryItemId variant columns
        DECLARE @ColumnName NVARCHAR(128)
        DECLARE @SQL NVARCHAR(MAX)
        
        -- Find all columns that start with 'InventoryItemId' followed by a number
        DECLARE column_cursor CURSOR FOR
        SELECT COLUMN_NAME 
        FROM INFORMATION_SCHEMA.COLUMNS 
        WHERE TABLE_NAME = 'SaleItem' 
        AND COLUMN_NAME LIKE 'InventoryItemId[0-9]%'
        AND COLUMN_NAME != 'InventoryItemId'  -- Keep the main InventoryItemId column
        
        OPEN column_cursor
        FETCH NEXT FROM column_cursor INTO @ColumnName
        
        WHILE @@FETCH_STATUS = 0
        BEGIN
            PRINT 'Processing column: ' + @ColumnName
            
            -- Remove foreign key constraints for this column
            DECLARE @FKName NVARCHAR(128)
            DECLARE fk_cursor CURSOR FOR
            SELECT name 
            FROM sys.foreign_keys 
            WHERE parent_object_id = OBJECT_ID('[dbo].[SaleItem]') 
            AND name LIKE '%' + @ColumnName + '%'
            
            OPEN fk_cursor
            FETCH NEXT FROM fk_cursor INTO @FKName
            
            WHILE @@FETCH_STATUS = 0
            BEGIN
                SET @SQL = 'ALTER TABLE [dbo].[SaleItem] DROP CONSTRAINT [' + @FKName + ']'
                EXEC sp_executesql @SQL
                PRINT '  ✓ Removed FK constraint: ' + @FKName
                FETCH NEXT FROM fk_cursor INTO @FKName
            END
            
            CLOSE fk_cursor
            DEALLOCATE fk_cursor
            
            -- Remove indexes for this column
            DECLARE @IndexName NVARCHAR(128)
            DECLARE idx_cursor CURSOR FOR
            SELECT name 
            FROM sys.indexes 
            WHERE object_id = OBJECT_ID('[dbo].[SaleItem]') 
            AND name LIKE '%' + @ColumnName + '%'
            
            OPEN idx_cursor
            FETCH NEXT FROM idx_cursor INTO @IndexName
            
            WHILE @@FETCH_STATUS = 0
            BEGIN
                SET @SQL = 'DROP INDEX [' + @IndexName + '] ON [dbo].[SaleItem]'
                EXEC sp_executesql @SQL
                PRINT '  ✓ Removed index: ' + @IndexName
                FETCH NEXT FROM idx_cursor INTO @IndexName
            END
            
            CLOSE idx_cursor
            DEALLOCATE idx_cursor
            
            -- Drop the column
            SET @SQL = 'ALTER TABLE [dbo].[SaleItem] DROP COLUMN [' + @ColumnName + ']'
            EXEC sp_executesql @SQL
            PRINT '  ✓ Removed column: ' + @ColumnName
            
            FETCH NEXT FROM column_cursor INTO @ColumnName
        END
        
        CLOSE column_cursor
        DEALLOCATE column_cursor
        
        PRINT '';
        PRINT '📋 Final SaleItem table structure:';
        SELECT 
            COLUMN_NAME,
            DATA_TYPE,
            IS_NULLABLE,
            COLUMN_DEFAULT
        FROM INFORMATION_SCHEMA.COLUMNS 
        WHERE TABLE_NAME = 'SaleItem' 
        ORDER BY ORDINAL_POSITION;
        
        PRINT '';
        PRINT '🎉 SaleItem table comprehensive cleanup completed!';
        PRINT 'All problematic InventoryItemId variant columns have been removed';
        
    END
    ELSE
    BEGIN
        PRINT '❌ SaleItem table not found!';
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    -- Commit the transaction
    COMMIT TRANSACTION;
    PRINT '✅ Transaction committed successfully!';
    
END TRY
BEGIN CATCH
    -- Rollback in case of error
    ROLLBACK TRANSACTION;
    
    PRINT '❌ Error occurred during SaleItem cleanup:';
    PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR(10));
    PRINT 'Error Message: ' + ERROR_MESSAGE();
    PRINT 'Error Line: ' + CAST(ERROR_LINE() AS NVARCHAR(10));
    
    THROW;
END CATCH;

GO