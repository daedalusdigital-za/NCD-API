-- =============================================================================
-- Create CreditNotes Table for Credit Notes Management System
-- =============================================================================
-- Database: MedicalManagementDB
-- Purpose: Manage credit notes, refunds, and sale reversals
-- Version: 1.0
-- Date: January 16, 2026
-- =============================================================================

SET NOCOUNT ON;

PRINT '═══════════════════════════════════════════════════════════════';
PRINT '  Creating CreditNotes Table';
PRINT '═══════════════════════════════════════════════════════════════';

BEGIN TRY
    BEGIN TRANSACTION;

    -- Drop table if it exists (for clean re-creation during development)
    IF OBJECT_ID('dbo.CreditNotes', 'U') IS NOT NULL
    BEGIN
        PRINT '  ⚠ Dropping existing CreditNotes table...';
        DROP TABLE dbo.CreditNotes;
    END

    -- Check if Sales or Sale table exists (handle both singular and plural)
    DECLARE @SalesTableName NVARCHAR(50);
    
    IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Sales')
        SET @SalesTableName = 'Sales';
    ELSE IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Sale')
        SET @SalesTableName = 'Sale';
    ELSE
    BEGIN
        RAISERROR('Neither Sales nor Sale table exists. Please create the table first.', 16, 1);
        RETURN;
    END
    
    PRINT '  ℹ Using table: ' + @SalesTableName;

    -- Create CreditNotes table (without foreign key initially)
    CREATE TABLE dbo.CreditNotes (
        Id INT PRIMARY KEY IDENTITY(1,1),
        CreditNoteNumber NVARCHAR(50) NOT NULL,
        InvoiceId INT NOT NULL,
        InvoiceNumber NVARCHAR(50) NOT NULL,
        CustomerId INT NULL,
        CustomerName NVARCHAR(200) NOT NULL,
        OriginalAmount DECIMAL(18,2) NOT NULL,
        CreditAmount DECIMAL(18,2) NOT NULL,
        Reason NVARCHAR(MAX) NOT NULL,
        Status NVARCHAR(20) NOT NULL DEFAULT 'pending',
        ReverseStock BIT NOT NULL DEFAULT 0,
        ReverseSale BIT NOT NULL DEFAULT 1,
        Notes NVARCHAR(MAX) NULL,
        DocumentFileName NVARCHAR(255) NULL,
        DocumentFileUrl NVARCHAR(500) NULL,
        DocumentUploadedDate DATETIME NULL,
        CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
        CreatedBy INT NOT NULL DEFAULT 0,
        ApprovedDate DATETIME NULL,
        ApprovedBy NVARCHAR(100) NULL,
        LastUpdated DATETIME NOT NULL DEFAULT GETDATE(),
        UpdatedBy INT NULL,
        IsDeleted BIT NOT NULL DEFAULT 0,
        
        CONSTRAINT UQ_CreditNotes_CreditNoteNumber UNIQUE (CreditNoteNumber),
        CONSTRAINT CK_CreditNotes_Status CHECK (Status IN ('pending', 'approved', 'rejected', 'completed'))
    );

    PRINT '  ✓ Created CreditNotes table';

    -- Add foreign key constraint separately for better error handling
    BEGIN TRY
        DECLARE @SqlCommand NVARCHAR(MAX);
        SET @SqlCommand = 'ALTER TABLE dbo.CreditNotes ADD CONSTRAINT FK_CreditNotes_Sales FOREIGN KEY (InvoiceId) REFERENCES dbo.' + @SalesTableName + '(Id)';
        EXEC sp_executesql @SqlCommand;
        PRINT '  ✓ Added foreign key constraint to ' + @SalesTableName + ' table';
    END TRY
    BEGIN CATCH
        PRINT '  ⚠ Warning: Could not create foreign key constraint to ' + @SalesTableName + ' table';
        PRINT '    This is optional - the table will work without it, but referential integrity won''t be enforced';
        PRINT '    Error: ' + ERROR_MESSAGE();
    END CATCH

    -- Create indexes for performance
    CREATE INDEX IX_CreditNotes_InvoiceId ON dbo.CreditNotes(InvoiceId);
    PRINT '  ✓ Created index on InvoiceId';

    CREATE INDEX IX_CreditNotes_Status ON dbo.CreditNotes(Status);
    PRINT '  ✓ Created index on Status';

    CREATE INDEX IX_CreditNotes_CreatedDate ON dbo.CreditNotes(CreatedDate DESC);
    PRINT '  ✓ Created index on CreatedDate';

    CREATE INDEX IX_CreditNotes_CustomerId ON dbo.CreditNotes(CustomerId) WHERE CustomerId IS NOT NULL;
    PRINT '  ✓ Created index on CustomerId';

    -- Update Sales/Sale table to include credit note tracking fields
    DECLARE @AddColumnSql NVARCHAR(MAX);
    
    IF NOT EXISTS (
        SELECT * FROM sys.columns 
        WHERE object_id = OBJECT_ID('dbo.' + @SalesTableName) AND name = 'HasCreditNote'
    )
    BEGIN
        SET @AddColumnSql = 'ALTER TABLE dbo.' + @SalesTableName + ' ADD HasCreditNote BIT NOT NULL DEFAULT 0';
        EXEC sp_executesql @AddColumnSql;
        PRINT '  ✓ Added HasCreditNote column to ' + @SalesTableName + ' table';
    END
    ELSE
        PRINT '  ⚠ HasCreditNote column already exists in ' + @SalesTableName + ' table';

    IF NOT EXISTS (
        SELECT * FROM sys.columns 
        WHERE object_id = OBJECT_ID('dbo.' + @SalesTableName) AND name = 'CreditedAmount'
    )
    BEGIN
        SET @AddColumnSql = 'ALTER TABLE dbo.' + @SalesTableName + ' ADD CreditedAmount DECIMAL(18,2) NULL';
        EXEC sp_executesql @AddColumnSql;
        PRINT '  ✓ Added CreditedAmount column to ' + @SalesTableName + ' table';
    END
    ELSE
        PRINT '  ⚠ CreditedAmount column already exists in ' + @SalesTableName + ' table';

    COMMIT TRANSACTION;

    PRINT '';
    PRINT '═══════════════════════════════════════════════════════════════';
    PRINT '  ✅ Successfully created CreditNotes table and indexes';
    PRINT '═══════════════════════════════════════════════════════════════';

    -- Display table structure
    PRINT '';
    PRINT 'Table Structure:';
    PRINT '─────────────────────────────────────────────────────────────';
    
    SELECT 
        c.COLUMN_NAME,
        c.DATA_TYPE,
        c.CHARACTER_MAXIMUM_LENGTH,
        c.IS_NULLABLE,
        c.COLUMN_DEFAULT
    FROM INFORMATION_SCHEMA.COLUMNS c
    WHERE c.TABLE_NAME = 'CreditNotes'
    ORDER BY c.ORDINAL_POSITION;

    PRINT '';
    PRINT 'Indexes:';
    PRINT '─────────────────────────────────────────────────────────────';
    
    SELECT 
        i.name AS IndexName,
        i.type_desc AS IndexType,
        COL_NAME(ic.object_id, ic.column_id) AS ColumnName
    FROM sys.indexes i
    INNER JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
    WHERE i.object_id = OBJECT_ID('dbo.CreditNotes')
    ORDER BY i.name, ic.key_ordinal;

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();

    PRINT '═══════════════════════════════════════════════════════════════';
    PRINT '  ❌ ERROR: Failed to create CreditNotes table';
    PRINT '═══════════════════════════════════════════════════════════════';
    PRINT 'Error: ' + @ErrorMessage;

    RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
END CATCH;

PRINT '';
PRINT 'Script execution completed.';
