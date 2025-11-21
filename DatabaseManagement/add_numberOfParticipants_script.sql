-- Add NumberOfParticipants column to TrainingSession table
-- This script adds the missing NumberOfParticipants column to the TrainingSession table

-- Note: USE statement removed for Azure SQL Database compatibility

BEGIN TRANSACTION;

BEGIN TRY
    PRINT 'Starting TrainingSession table update...';
    
    -- Check if TrainingSession table exists
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TrainingSession]') AND type in (N'U'))
    BEGIN
        PRINT 'TrainingSession table found. Adding NumberOfParticipants column...';
        
        -- Check if NumberOfParticipants column already exists
        IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('[dbo].[TrainingSession]') AND name = 'NumberOfParticipants')
        BEGIN
            -- Add NumberOfParticipants column
            ALTER TABLE [dbo].[TrainingSession] 
            ADD [NumberOfParticipants] int NOT NULL DEFAULT 0;
            
            PRINT '✓ Added NumberOfParticipants column with default value 0';
        END
        ELSE
        BEGIN
            PRINT '⚠️ NumberOfParticipants column already exists - skipping';
        END
        
        PRINT '';
        PRINT '📋 Updated TrainingSession table structure:';
        SELECT 
            COLUMN_NAME,
            DATA_TYPE,
            IS_NULLABLE,
            COLUMN_DEFAULT
        FROM INFORMATION_SCHEMA.COLUMNS 
        WHERE TABLE_NAME = 'TrainingSession' 
        ORDER BY ORDINAL_POSITION;
        
        PRINT '';
        PRINT '🎉 TrainingSession table successfully updated!';
        PRINT 'NumberOfParticipants column added as required integer field with default value 0';
        
    END
    ELSE
    BEGIN
        PRINT '❌ TrainingSession table not found!';
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
    
    PRINT '❌ Error occurred during table update:';
    PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR(10));
    PRINT 'Error Message: ' + ERROR_MESSAGE();
    PRINT 'Error Line: ' + CAST(ERROR_LINE() AS NVARCHAR(10));
    
    THROW;
END CATCH;

GO

-- Optional: Update existing records if you want to set specific participant numbers
-- Uncomment and modify the following section if needed:

/*
-- Example: Update existing training sessions with estimated participant numbers
BEGIN TRANSACTION;

BEGIN TRY
    PRINT 'Updating existing training sessions with estimated participant numbers...';
    
    -- Example updates (modify as needed):
    -- Update completed trainings with actual numbers
    UPDATE [dbo].[TrainingSession] 
    SET [NumberOfParticipants] = 25 
    WHERE [Status] = 4 -- Completed
    AND [NumberOfParticipants] = 0;
    
    -- Update planned/scheduled trainings with estimated numbers
    UPDATE [dbo].[TrainingSession] 
    SET [NumberOfParticipants] = 20 
    WHERE [Status] IN (1, 2) -- Planned or Scheduled
    AND [NumberOfParticipants] = 0;
    
    PRINT '✓ Updated existing training sessions with participant numbers';
    
    COMMIT TRANSACTION;
    PRINT '✅ Participant number updates committed successfully!';
    
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    
    PRINT '❌ Error occurred during participant number updates:';
    PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR(10));
    PRINT 'Error Message: ' + ERROR_MESSAGE();
    
    THROW;
END CATCH;
*/