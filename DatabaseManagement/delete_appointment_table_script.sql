-- Delete Appointment Table Script
-- This script safely removes the Appointment table and all related constraints
-- Execute this in Azure Data Studio connected to your NGCAndu-Dev database

SET NOCOUNT ON;
BEGIN TRY
    BEGIN TRANSACTION;
    
    PRINT 'Starting Appointment table deletion process...';
    
    -- Check if Appointment table exists
    IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Appointment' AND type = 'U')
    BEGIN
        PRINT 'Appointment table does not exist. Nothing to delete.';
        COMMIT TRANSACTION;
        RETURN;
    END
    
    PRINT 'Appointment table found. Proceeding with deletion...';
    
    -- 1. Drop all foreign key constraints that reference Appointment table
    DECLARE @sql NVARCHAR(MAX) = '';
    
    SELECT @sql = @sql + 'ALTER TABLE [' + SCHEMA_NAME(fk.schema_id) + '].[' + OBJECT_NAME(fk.parent_object_id) + '] DROP CONSTRAINT [' + fk.name + '];' + CHAR(13)
    FROM sys.foreign_keys fk
    INNER JOIN sys.foreign_key_columns fkc ON fk.object_id = fkc.constraint_object_id
    INNER JOIN sys.tables t ON fkc.referenced_object_id = t.object_id
    WHERE t.name = 'Appointment';
    
    IF LEN(@sql) > 0
    BEGIN
        PRINT 'Dropping foreign key constraints that reference Appointment table:';
        PRINT @sql;
        EXEC sp_executesql @sql;
        PRINT 'Foreign key constraints dropped successfully.';
    END
    ELSE
    BEGIN
        PRINT 'No foreign key constraints found referencing Appointment table.';
    END
    
    -- 2. Drop all foreign key constraints FROM Appointment table
    SET @sql = '';
    
    SELECT @sql = @sql + 'ALTER TABLE [dbo].[Appointment] DROP CONSTRAINT [' + fk.name + '];' + CHAR(13)
    FROM sys.foreign_keys fk
    WHERE fk.parent_object_id = OBJECT_ID('dbo.Appointment');
    
    IF LEN(@sql) > 0
    BEGIN
        PRINT 'Dropping foreign key constraints from Appointment table:';
        PRINT @sql;
        EXEC sp_executesql @sql;
        PRINT 'Foreign key constraints from Appointment table dropped successfully.';
    END
    ELSE
    BEGIN
        PRINT 'No foreign key constraints found on Appointment table.';
    END
    
    -- 3. Drop all indexes on Appointment table (except primary key)
    SET @sql = '';
    
    SELECT @sql = @sql + 'DROP INDEX [' + i.name + '] ON [dbo].[Appointment];' + CHAR(13)
    FROM sys.indexes i
    WHERE i.object_id = OBJECT_ID('dbo.Appointment')
    AND i.is_primary_key = 0
    AND i.type > 0; -- Exclude heaps
    
    IF LEN(@sql) > 0
    BEGIN
        PRINT 'Dropping indexes on Appointment table:';
        PRINT @sql;
        EXEC sp_executesql @sql;
        PRINT 'Indexes dropped successfully.';
    END
    ELSE
    BEGIN
        PRINT 'No additional indexes found on Appointment table.';
    END
    
    -- 4. Get record count before deletion
    DECLARE @RecordCount INT;
    SELECT @RecordCount = COUNT(*) FROM [dbo].[Appointment];
    PRINT 'Records to be deleted from Appointment table: ' + CAST(@RecordCount AS VARCHAR(10));
    
    -- 5. Drop the Appointment table
    DROP TABLE [dbo].[Appointment];
    PRINT 'Appointment table dropped successfully.';
    
    -- 6. Verify table is deleted
    IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Appointment' AND type = 'U')
    BEGIN
        PRINT 'SUCCESS: Appointment table has been completely removed from the database.';
        PRINT 'Total records deleted: ' + CAST(@RecordCount AS VARCHAR(10));
    END
    ELSE
    BEGIN
        PRINT 'ERROR: Appointment table still exists after deletion attempt.';
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    COMMIT TRANSACTION;
    PRINT 'Transaction committed successfully.';
    PRINT 'Appointment table deletion completed.';
    
END TRY
BEGIN CATCH
    -- Error handling
    ROLLBACK TRANSACTION;
    
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();
    
    PRINT 'ERROR occurred during Appointment table deletion:';
    PRINT 'Error Message: ' + @ErrorMessage;
    PRINT 'Error Severity: ' + CAST(@ErrorSeverity AS VARCHAR(10));
    PRINT 'Error State: ' + CAST(@ErrorState AS VARCHAR(10));
    PRINT 'Transaction has been rolled back.';
    
    -- Re-raise the error
    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
END CATCH;

-- Final verification query (run separately if needed)
-- SELECT COUNT(*) as TableCount FROM sys.tables WHERE name = 'Appointment' AND type = 'U';