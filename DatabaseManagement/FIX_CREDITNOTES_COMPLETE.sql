-- Complete CreditNotes Table Fix
-- Recreate table with all required columns

PRINT '========================================';
PRINT 'Complete CreditNotes Table Fix';
PRINT '========================================';
PRINT '';

-- Step 1: Backup
PRINT 'Step 1: Creating backup...';
IF OBJECT_ID('CreditNotes_Backup_Full', 'U') IS NOT NULL DROP TABLE CreditNotes_Backup_Full;
SELECT * INTO CreditNotes_Backup_Full FROM CreditNotes;
PRINT '✓ Backup created: CreditNotes_Backup_Full';
PRINT '';

-- Step 2: Drop existing table
PRINT 'Step 2: Dropping existing CreditNotes table...';
DROP TABLE CreditNotes;
PRINT '✓ Table dropped';
PRINT '';

-- Step 3: Recreate table with all columns
PRINT 'Step 3: Creating new CreditNotes table with complete schema...';
CREATE TABLE [dbo].[CreditNotes](
    [Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [CreditNoteNumber] [nvarchar](50) NOT NULL,
    [InvoiceId] [int] NOT NULL,
    [InvoiceNumber] [nvarchar](50) NOT NULL,
    [CustomerId] [int] NULL,
    [CustomerName] [nvarchar](200) NOT NULL,
    [OriginalAmount] [decimal](18,2) NOT NULL,
    [CreditAmount] [decimal](18,2) NOT NULL,
    [Reason] [nvarchar](max) NOT NULL,
    [Status] [nvarchar](20) NOT NULL DEFAULT 'Pending',
    [ReverseStock] [bit] NOT NULL DEFAULT 0,
    [ReverseSale] [bit] NOT NULL DEFAULT 1,
    [Notes] [nvarchar](max) NULL,
    [DocumentFileName] [nvarchar](255) NULL,
    [DocumentFileUrl] [nvarchar](500) NULL,
    [DocumentUploadedDate] [datetime2](7) NULL,
    [ApprovedDate] [datetime2](7) NULL,
    [ApprovedBy] [nvarchar](100) NULL,
    [IsDeleted] [bit] NOT NULL DEFAULT 0,
    [CreatedDate] [datetime2](7) NOT NULL DEFAULT GETUTCDATE(),
    [CreatedBy] [nvarchar](255) NULL,
    [LastUpdated] [datetime2](7) NOT NULL DEFAULT GETUTCDATE(),
    [UpdatedBy] [nvarchar](255) NULL
);
PRINT '✓ New CreditNotes table created';
PRINT '';

-- Step 4: Add indexes
PRINT 'Step 4: Adding indexes...';
CREATE INDEX IX_CreditNotes_InvoiceId ON CreditNotes(InvoiceId);
CREATE INDEX IX_CreditNotes_CustomerId ON CreditNotes(CustomerId);
CREATE INDEX IX_CreditNotes_Status ON CreditNotes(Status);
CREATE INDEX IX_CreditNotes_CreatedDate ON CreditNotes(CreatedDate);
PRINT '✓ Indexes created';
PRINT '';

-- Step 5: Verify structure
PRINT 'Step 5: Final table structure:';
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'CreditNotes'
ORDER BY ORDINAL_POSITION;

PRINT '';
PRINT '========================================';
PRINT '✓ CreditNotes table successfully recreated!';
PRINT '========================================';
