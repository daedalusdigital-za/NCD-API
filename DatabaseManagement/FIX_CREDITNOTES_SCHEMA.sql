-- Fix CreditNotes Table Schema
-- This script adds missing columns to the CreditNotes table

PRINT '========================================';
PRINT 'Fixing CreditNotes Table Schema';
PRINT '========================================';
PRINT '';

-- Step 1: Backup existing table
PRINT 'Step 1: Creating backup of CreditNotes table...';
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CreditNotes_Backup')
BEGIN
    DROP TABLE CreditNotes_Backup;
    PRINT '  ✓ Dropped old backup table';
END

SELECT * INTO CreditNotes_Backup FROM CreditNotes;
PRINT '  ✓ Backup created: CreditNotes_Backup';
PRINT '';

-- Step 2: Check current columns
PRINT 'Step 2: Checking current CreditNotes columns...';
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'CreditNotes'
ORDER BY ORDINAL_POSITION;
PRINT '';

-- Step 3: Add missing columns (if they don't exist)
PRINT 'Step 3: Adding missing columns...';

-- Add CreatedDate column
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
              WHERE TABLE_NAME = 'CreditNotes' AND COLUMN_NAME = 'CreatedDate')
BEGIN
    ALTER TABLE CreditNotes
    ADD CreatedDate DATETIME2 DEFAULT GETUTCDATE() NOT NULL;
    PRINT '  ✓ Added CreatedDate column';
END
ELSE
    PRINT '  - CreatedDate already exists';

-- Add CreatedBy column
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
              WHERE TABLE_NAME = 'CreditNotes' AND COLUMN_NAME = 'CreatedBy')
BEGIN
    ALTER TABLE CreditNotes
    ADD CreatedBy NVARCHAR(255);
    PRINT '  ✓ Added CreatedBy column';
END
ELSE
    PRINT '  - CreatedBy already exists';

-- Add LastUpdated column
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
              WHERE TABLE_NAME = 'CreditNotes' AND COLUMN_NAME = 'LastUpdated')
BEGIN
    ALTER TABLE CreditNotes
    ADD LastUpdated DATETIME2 DEFAULT GETUTCDATE() NOT NULL;
    PRINT '  ✓ Added LastUpdated column';
END
ELSE
    PRINT '  - LastUpdated already exists';

-- Add UpdatedBy column
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
              WHERE TABLE_NAME = 'CreditNotes' AND COLUMN_NAME = 'UpdatedBy')
BEGIN
    ALTER TABLE CreditNotes
    ADD UpdatedBy NVARCHAR(255);
    PRINT '  ✓ Added UpdatedBy column';
END
ELSE
    PRINT '  - UpdatedBy already exists';

PRINT '';

-- Step 4: Verify all required columns
PRINT 'Step 4: Verifying final schema...';
PRINT 'Required columns:';
SELECT 
    ROW_NUMBER() OVER (ORDER BY ORDINAL_POSITION) AS [Position],
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'CreditNotes'
ORDER BY ORDINAL_POSITION;
PRINT '';

-- Step 5: Show sample data
PRINT 'Step 5: Sample data (if exists)...';
DECLARE @rowCount INT = (SELECT COUNT(*) FROM CreditNotes);
PRINT CONCAT('  Total CreditNotes records: ', @rowCount);

IF @rowCount > 0
BEGIN
    SELECT TOP 3 
        Id,
        CreditNoteNumber,
        CustomerName,
        CreditAmount,
        Status,
        CreatedDate,
        CreatedBy
    FROM CreditNotes
    ORDER BY Id DESC;
END
ELSE
    PRINT '  No records found';

PRINT '';
PRINT '========================================';
PRINT 'Schema Fix Complete!';
PRINT '========================================';
