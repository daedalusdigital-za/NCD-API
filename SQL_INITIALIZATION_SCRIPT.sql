-- ==============================================================
-- Credit Notes Feature - Azure SQL Database Initialization Script
-- ==============================================================
-- Execute this script in Azure SQL Database Query Editor
-- Database: MedicalManagementDB
-- Server: ngcandu.database.windows.net
-- ==============================================================

-- Step 1: Create CreditNotes Table
-- ==============================================================
-- Drop existing table if it exists (to ensure clean schema)
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CreditNotes')
BEGIN
    DROP TABLE [dbo].[CreditNotes];
    PRINT 'Existing CreditNotes table dropped.';
END

-- Create fresh CreditNotes table
CREATE TABLE [dbo].[CreditNotes] (
        [Id] INT NOT NULL IDENTITY(1, 1),
        [CreditNoteNumber] NVARCHAR(50) NOT NULL,
        [InvoiceId] INT NOT NULL,
        [CustomerId] INT NULL,
        [CreditAmount] DECIMAL(18, 2) NOT NULL,
        [OriginalInvoiceAmount] DECIMAL(18, 2) NULL,
        [Reason] NVARCHAR(500) NULL,
        [Status] NVARCHAR(20) NOT NULL,
        [ApprovedBy] NVARCHAR(100) NULL,
        [ApprovedDate] DATETIME2 NULL,
        [RejectedBy] NVARCHAR(100) NULL,
        [RejectedDate] DATETIME2 NULL,
        [RejectionReason] NVARCHAR(500) NULL,
        [ReversalType] NVARCHAR(50) NULL,
        [SalesReversalId] INT NULL,
        [InventoryReversalId] INT NULL,
        [DocumentUrl] NVARCHAR(500) NULL,
        [DocumentFileName] NVARCHAR(255) NULL,
        [DocumentUploadDate] DATETIME2 NULL,
        [CreatedDate] DATETIME2 NOT NULL DEFAULT GETUTCDATE(),
        [CreatedBy] NVARCHAR(100) NULL,
        [LastModifiedDate] DATETIME2 NULL,
        [LastModifiedBy] NVARCHAR(100) NULL,
        [IsDeleted] BIT NOT NULL DEFAULT CAST(0 AS BIT),
        PRIMARY KEY ([Id]),
        CONSTRAINT [CK_CreditNotes_Status] CHECK ([Status] IN (N'Pending', N'Approved', N'Rejected', N'Reversed'))
    );
    
    PRINT 'CreditNotes table created successfully.';

-- Add Foreign Key if Sale table exists
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Sale')
BEGIN
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_CreditNotes_Sale')
    BEGIN
        ALTER TABLE [dbo].[CreditNotes]
        ADD CONSTRAINT [FK_CreditNotes_Sale] FOREIGN KEY ([InvoiceId]) REFERENCES [dbo].[Sale] ([Id]) ON DELETE NO ACTION;
        PRINT 'Foreign key FK_CreditNotes_Sale added.';
    END
END
ELSE
BEGIN
    PRINT 'Warning: Sale table not found. Foreign key constraint not added. Add manually when Sale table is available.';
END

-- Step 2: Create Indexes
-- ==============================================================
-- Unique index on CreditNoteNumber for fast lookups and integrity
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_CreditNotes_CreditNoteNumber' AND object_id = OBJECT_ID('dbo.CreditNotes'))
BEGIN
    CREATE UNIQUE NONCLUSTERED INDEX [IX_CreditNotes_CreditNoteNumber] 
    ON [dbo].[CreditNotes] ([CreditNoteNumber]);
    PRINT 'Index IX_CreditNotes_CreditNoteNumber created.';
END
ELSE
BEGIN
    PRINT 'Index IX_CreditNotes_CreditNoteNumber already exists.';
END

-- Index on InvoiceId for foreign key lookups
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_CreditNotes_InvoiceId' AND object_id = OBJECT_ID('dbo.CreditNotes'))
BEGIN
    CREATE NONCLUSTERED INDEX [IX_CreditNotes_InvoiceId] 
    ON [dbo].[CreditNotes] ([InvoiceId]);
    PRINT 'Index IX_CreditNotes_InvoiceId created.';
END
ELSE
BEGIN
    PRINT 'Index IX_CreditNotes_InvoiceId already exists.';
END

-- Index on Status for filtering by approval state
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_CreditNotes_Status' AND object_id = OBJECT_ID('dbo.CreditNotes'))
BEGIN
    CREATE NONCLUSTERED INDEX [IX_CreditNotes_Status] 
    ON [dbo].[CreditNotes] ([Status]);
    PRINT 'Index IX_CreditNotes_Status created.';
END
ELSE
BEGIN
    PRINT 'Index IX_CreditNotes_Status already exists.';
END

-- Index on CreatedDate for sorting recent credit notes
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_CreditNotes_CreatedDate' AND object_id = OBJECT_ID('dbo.CreditNotes'))
BEGIN
    CREATE NONCLUSTERED INDEX [IX_CreditNotes_CreatedDate] 
    ON [dbo].[CreditNotes] ([CreatedDate] DESC);
    PRINT 'Index IX_CreditNotes_CreatedDate created.';
END
ELSE
BEGIN
    PRINT 'Index IX_CreditNotes_CreatedDate already exists.';
END

-- Index on CustomerId for customer-specific queries
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_CreditNotes_CustomerId' AND object_id = OBJECT_ID('dbo.CreditNotes'))
BEGIN
    CREATE NONCLUSTERED INDEX [IX_CreditNotes_CustomerId] 
    ON [dbo].[CreditNotes] ([CustomerId]);
    PRINT 'Index IX_CreditNotes_CustomerId created.';
END
ELSE
BEGIN
    PRINT 'Index IX_CreditNotes_CustomerId already exists.';
END

-- Step 3: Verify Setup
-- ==============================================================
PRINT '';
PRINT '=== Verification Results ===';

-- Check table exists
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CreditNotes')
BEGIN
    PRINT '✓ CreditNotes table exists';
    
    -- Count columns
    DECLARE @ColumnCount INT = (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'CreditNotes');
    PRINT '  Columns: ' + CAST(@ColumnCount AS NVARCHAR(3));
    
    -- Count indexes
    DECLARE @IndexCount INT = (SELECT COUNT(*) FROM sys.indexes WHERE object_id = OBJECT_ID('dbo.CreditNotes') AND name IS NOT NULL AND name != 'PK_CreditNotes');
    PRINT '  Indexes: ' + CAST(@IndexCount AS NVARCHAR(3));
    
    -- List columns
    PRINT '';
    PRINT 'Column List:';
    SELECT '  - ' + COLUMN_NAME + ' (' + DATA_TYPE + ')' as ColumnInfo
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'CreditNotes'
    ORDER BY ORDINAL_POSITION;
    
    PRINT '';
    PRINT 'Constraints:';
    SELECT '  - ' + CONSTRAINT_NAME as ConstraintInfo
    FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    WHERE TABLE_NAME = 'CreditNotes';
END
ELSE
BEGIN
    PRINT '✗ CreditNotes table does not exist - creation failed';
END

PRINT '';
PRINT '=== Setup Complete ===';
PRINT 'CreditNotes database schema is ready for use.';
