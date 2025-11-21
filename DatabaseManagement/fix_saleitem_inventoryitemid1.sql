-- Fix SaleItem table by removing InventoryItemId1 column
-- This script removes the problematic InventoryItemId1 column from SaleItem table

-- Note: USE statement removed for Azure SQL Database compatibility

BEGIN TRANSACTION;

BEGIN TRY
    PRINT 'Starting SaleItem table cleanup...';
    
    -- Check if SaleItem table exists
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaleItem]') AND type in (N'U'))
    BEGIN
        PRINT 'SaleItem table found. Cleaning up unwanted columns...';
        
        -- Remove InventoryItemId1 foreign key constraint first (if exists)
        DECLARE @FKConstraintName NVARCHAR(200)
        SELECT @FKConstraintName = name 
        FROM sys.foreign_keys 
        WHERE parent_object_id = OBJECT_ID('[dbo].[SaleItem]') 
        AND referenced_object_id = OBJECT_ID('[dbo].[InventoryItems]')
        AND name LIKE '%InventoryItemId1%'
        
        IF @FKConstraintName IS NOT NULL
        BEGIN
            EXEC('ALTER TABLE [dbo].[SaleItem] DROP CONSTRAINT [' + @FKConstraintName + ']')
            PRINT '✓ Removed InventoryItemId1 foreign key constraint: ' + @FKConstraintName
        END
        
        -- Remove InventoryItemId1 index (if exists)
        IF EXISTS (SELECT * FROM sys.indexes WHERE name LIKE '%InventoryItemId1%' AND object_id = OBJECT_ID('[dbo].[SaleItem]'))
        BEGIN
            DECLARE @IndexName NVARCHAR(200)
            SELECT @IndexName = name 
            FROM sys.indexes 
            WHERE name LIKE '%InventoryItemId1%' AND object_id = OBJECT_ID('[dbo].[SaleItem]')
            
            EXEC('DROP INDEX [' + @IndexName + '] ON [dbo].[SaleItem]')
            PRINT '✓ Removed InventoryItemId1 index: ' + @IndexName
        END
        
        -- Drop InventoryItemId1 column if it exists
        IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('[dbo].[SaleItem]') AND name = 'InventoryItemId1')
        BEGIN
            ALTER TABLE [dbo].[SaleItem] DROP COLUMN [InventoryItemId1];
            PRINT '✓ Removed InventoryItemId1 column from SaleItem table';
        END
        ELSE
        BEGIN
            PRINT '⚠️ InventoryItemId1 column not found in SaleItem table - skipping';
        END
        
        PRINT '';
        PRINT '📋 Updated SaleItem table structure:';
        SELECT 
            COLUMN_NAME,
            DATA_TYPE,
            IS_NULLABLE,
            COLUMN_DEFAULT
        FROM INFORMATION_SCHEMA.COLUMNS 
        WHERE TABLE_NAME = 'SaleItem' 
        ORDER BY ORDINAL_POSITION;
        
        PRINT '';
        PRINT '🎉 SaleItem table successfully cleaned!';
        PRINT 'Removed problematic InventoryItemId1 column and related constraints';
        
    END
    ELSE
    BEGIN
        PRINT '❌ SaleItem table not found!';
        PRINT 'Please ensure the table exists before running this script.';
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