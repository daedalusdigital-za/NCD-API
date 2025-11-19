-- Remove unwanted columns from Sale table
-- This script removes the columns you don't want: discount, paymentmethod, paymentstatus, 
-- lastupdated, updatedby, ModifiedBy, ProvinceId, TaxAmount, Subtotal, CustomerId

-- Note: USE statement removed for Azure SQL Database compatibility

BEGIN TRANSACTION;

BEGIN TRY
    PRINT 'Starting Sale table column removal...';
    
    -- Check if Sale table exists
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sale]') AND type in (N'U'))
    BEGIN
        PRINT 'Sale table found. Removing unwanted columns...';
        
        -- Remove ProvinceId foreign key constraint first (if exists)
        IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Sale_Province')
        BEGIN
            ALTER TABLE [dbo].[Sale] DROP CONSTRAINT [FK_Sale_Province];
            PRINT '✓ Removed FK_Sale_Province constraint';
        END
        
        -- Remove ProvinceId index (if exists)
        IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Sale_ProvinceId' AND object_id = OBJECT_ID('[dbo].[Sale]'))
        BEGIN
            DROP INDEX [IX_Sale_ProvinceId] ON [dbo].[Sale];
            PRINT '✓ Removed IX_Sale_ProvinceId index';
        END
        
        -- Drop columns if they exist (need to remove default constraints first)
        
        -- 1. Discount - Remove default constraint first
        DECLARE @DiscountConstraint NVARCHAR(200)
        SELECT @DiscountConstraint = name FROM sys.default_constraints 
        WHERE parent_object_id = OBJECT_ID('[dbo].[Sale]') 
        AND parent_column_id = (SELECT column_id FROM sys.columns WHERE object_id = OBJECT_ID('[dbo].[Sale]') AND name = 'Discount')
        
        IF @DiscountConstraint IS NOT NULL
        BEGIN
            EXEC('ALTER TABLE [dbo].[Sale] DROP CONSTRAINT [' + @DiscountConstraint + ']')
            PRINT '✓ Removed Discount default constraint: ' + @DiscountConstraint
        END
        
        IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('[dbo].[Sale]') AND name = 'Discount')
        BEGIN
            ALTER TABLE [dbo].[Sale] DROP COLUMN [Discount];
            PRINT '✓ Removed Discount column';
        END
        
        -- 2. PaymentMethod - Remove default constraint first
        DECLARE @PaymentMethodConstraint NVARCHAR(200)
        SELECT @PaymentMethodConstraint = name FROM sys.default_constraints 
        WHERE parent_object_id = OBJECT_ID('[dbo].[Sale]') 
        AND parent_column_id = (SELECT column_id FROM sys.columns WHERE object_id = OBJECT_ID('[dbo].[Sale]') AND name = 'PaymentMethod')
        
        IF @PaymentMethodConstraint IS NOT NULL
        BEGIN
            EXEC('ALTER TABLE [dbo].[Sale] DROP CONSTRAINT [' + @PaymentMethodConstraint + ']')
            PRINT '✓ Removed PaymentMethod default constraint: ' + @PaymentMethodConstraint
        END
        
        IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('[dbo].[Sale]') AND name = 'PaymentMethod')
        BEGIN
            ALTER TABLE [dbo].[Sale] DROP COLUMN [PaymentMethod];
            PRINT '✓ Removed PaymentMethod column';
        END
        
        -- 3. PaymentStatus - Remove default constraint first
        DECLARE @PaymentStatusConstraint NVARCHAR(200)
        SELECT @PaymentStatusConstraint = name FROM sys.default_constraints 
        WHERE parent_object_id = OBJECT_ID('[dbo].[Sale]') 
        AND parent_column_id = (SELECT column_id FROM sys.columns WHERE object_id = OBJECT_ID('[dbo].[Sale]') AND name = 'PaymentStatus')
        
        IF @PaymentStatusConstraint IS NOT NULL
        BEGIN
            EXEC('ALTER TABLE [dbo].[Sale] DROP CONSTRAINT [' + @PaymentStatusConstraint + ']')
            PRINT '✓ Removed PaymentStatus default constraint: ' + @PaymentStatusConstraint
        END
        
        IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('[dbo].[Sale]') AND name = 'PaymentStatus')
        BEGIN
            ALTER TABLE [dbo].[Sale] DROP COLUMN [PaymentStatus];
            PRINT '✓ Removed PaymentStatus column';
        END
        
        -- 4. TaxAmount - Remove default constraint first
        DECLARE @TaxAmountConstraint NVARCHAR(200)
        SELECT @TaxAmountConstraint = name FROM sys.default_constraints 
        WHERE parent_object_id = OBJECT_ID('[dbo].[Sale]') 
        AND parent_column_id = (SELECT column_id FROM sys.columns WHERE object_id = OBJECT_ID('[dbo].[Sale]') AND name = 'TaxAmount')
        
        IF @TaxAmountConstraint IS NOT NULL
        BEGIN
            EXEC('ALTER TABLE [dbo].[Sale] DROP CONSTRAINT [' + @TaxAmountConstraint + ']')
            PRINT '✓ Removed TaxAmount default constraint: ' + @TaxAmountConstraint
        END
        
        IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('[dbo].[Sale]') AND name = 'TaxAmount')
        BEGIN
            ALTER TABLE [dbo].[Sale] DROP COLUMN [TaxAmount];
            PRINT '✓ Removed TaxAmount column';
        END
        
        -- 5. Subtotal - Remove default constraint first
        DECLARE @SubtotalConstraint NVARCHAR(200)
        SELECT @SubtotalConstraint = name FROM sys.default_constraints 
        WHERE parent_object_id = OBJECT_ID('[dbo].[Sale]') 
        AND parent_column_id = (SELECT column_id FROM sys.columns WHERE object_id = OBJECT_ID('[dbo].[Sale]') AND name = 'Subtotal')
        
        IF @SubtotalConstraint IS NOT NULL
        BEGIN
            EXEC('ALTER TABLE [dbo].[Sale] DROP CONSTRAINT [' + @SubtotalConstraint + ']')
            PRINT '✓ Removed Subtotal default constraint: ' + @SubtotalConstraint
        END
        
        IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('[dbo].[Sale]') AND name = 'Subtotal')
        BEGIN
            ALTER TABLE [dbo].[Sale] DROP COLUMN [Subtotal];
            PRINT '✓ Removed Subtotal column';
        END
        
        -- 6. DeliveryStatus - Remove default constraint first
        DECLARE @DeliveryStatusConstraint NVARCHAR(200)
        SELECT @DeliveryStatusConstraint = name FROM sys.default_constraints 
        WHERE parent_object_id = OBJECT_ID('[dbo].[Sale]') 
        AND parent_column_id = (SELECT column_id FROM sys.columns WHERE object_id = OBJECT_ID('[dbo].[Sale]') AND name = 'DeliveryStatus')
        
        IF @DeliveryStatusConstraint IS NOT NULL
        BEGIN
            EXEC('ALTER TABLE [dbo].[Sale] DROP CONSTRAINT [' + @DeliveryStatusConstraint + ']')
            PRINT '✓ Removed DeliveryStatus default constraint: ' + @DeliveryStatusConstraint
        END
        
        IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('[dbo].[Sale]') AND name = 'DeliveryStatus')
        BEGIN
            ALTER TABLE [dbo].[Sale] DROP COLUMN [DeliveryStatus];
            PRINT '✓ Removed DeliveryStatus column';
        END
        
        
        -- 7. LastUpdated (no default constraint expected)
        IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('[dbo].[Sale]') AND name = 'LastUpdated')
        BEGIN
            ALTER TABLE [dbo].[Sale] DROP COLUMN [LastUpdated];
            PRINT '✓ Removed LastUpdated column';
        END
        
        -- 8. UpdatedBy (no default constraint expected)
        IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('[dbo].[Sale]') AND name = 'UpdatedBy')
        BEGIN
            ALTER TABLE [dbo].[Sale] DROP COLUMN [UpdatedBy];
            PRINT '✓ Removed UpdatedBy column';
        END
        
        -- 9. ModifiedBy (no default constraint expected)
        IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('[dbo].[Sale]') AND name = 'ModifiedBy')
        BEGIN
            ALTER TABLE [dbo].[Sale] DROP COLUMN [ModifiedBy];
            PRINT '✓ Removed ModifiedBy column';
        END
        
        -- 10. ProvinceId (already handled FK constraint above)
        IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('[dbo].[Sale]') AND name = 'ProvinceId')
        BEGIN
            ALTER TABLE [dbo].[Sale] DROP COLUMN [ProvinceId];
            PRINT '✓ Removed ProvinceId column';
        END
        
        -- 11. CustomerId (no default constraint expected)
        IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('[dbo].[Sale]') AND name = 'CustomerId')
        BEGIN
            ALTER TABLE [dbo].[Sale] DROP COLUMN [CustomerId];
            PRINT '✓ Removed CustomerId column';
        END
        
        -- 12. CustomerEmail (no default constraint expected)
        IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('[dbo].[Sale]') AND name = 'CustomerEmail')
        BEGIN
            ALTER TABLE [dbo].[Sale] DROP COLUMN [CustomerEmail];
            PRINT '✓ Removed CustomerEmail column';
        END
        
        PRINT '';
        PRINT '📋 Remaining Sale table structure:';
        SELECT 
            COLUMN_NAME,
            DATA_TYPE,
            IS_NULLABLE,
            COLUMN_DEFAULT
        FROM INFORMATION_SCHEMA.COLUMNS 
        WHERE TABLE_NAME = 'Sale' 
        ORDER BY ORDINAL_POSITION;
        
        PRINT '';
        PRINT '🎉 Sale table columns successfully removed!';
        PRINT 'Remaining columns: Id, SaleNumber, SaleDate, CustomerName, CustomerPhone, Total, Notes, IsDeleted, CreatedDate, CreatedBy';
        
    END
    ELSE
    BEGIN
        PRINT '❌ Sale table not found!';
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
    
    PRINT '❌ Error occurred during column removal:';
    PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR(10));
    PRINT 'Error Message: ' + ERROR_MESSAGE();
    PRINT 'Error Line: ' + CAST(ERROR_LINE() AS NVARCHAR(10));
    
    THROW;
END CATCH;

GO