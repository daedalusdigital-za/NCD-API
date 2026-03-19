-- ============================================
-- NDCANGU API - Create Deliveries Table
-- Run this script in Azure Data Studio
-- ============================================

-- Check if table exists and drop if needed (optional - comment out if you want to preserve data)
-- IF OBJECT_ID('dbo.Deliveries', 'U') IS NOT NULL
--     DROP TABLE dbo.Deliveries;

-- Create the Deliveries table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Deliveries]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Deliveries] (
        [Id] INT IDENTITY(1,1) NOT NULL,
        [DeliveryNumber] NVARCHAR(50) NOT NULL,
        [SaleId] INT NOT NULL,
        [InstitutionName] NVARCHAR(255) NOT NULL,
        [Province] NVARCHAR(100) NOT NULL,
        [ItemDescription] NVARCHAR(500) NOT NULL,
        [Quantity] INT NOT NULL,
        [DeliveryDate] DATETIME2 NOT NULL,
        [InvoiceNumber] NVARCHAR(50) NOT NULL,
        [Status] INT NOT NULL DEFAULT 1,  -- 1=Pending, 2=InTransit, 3=Delivered, 4=Failed, 5=Returned
        [DriverName] NVARCHAR(100) NULL,
        [VehicleNumber] NVARCHAR(50) NULL,
        [RecipientName] NVARCHAR(100) NULL,
        [RecipientSignature] NVARCHAR(MAX) NULL,
        [ReceivedDate] DATETIME2 NULL,
        [Notes] NVARCHAR(1000) NULL,
        [IsDeleted] BIT NOT NULL DEFAULT 0,
        [DateCreated] DATETIME2 NOT NULL DEFAULT GETDATE(),
        [CreatedBy] INT NOT NULL,
        [LastUpdated] DATETIME2 NULL,
        [UpdatedBy] INT NULL,
        
        CONSTRAINT [PK_Deliveries] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [FK_Deliveries_Sale] FOREIGN KEY ([SaleId]) REFERENCES [dbo].[Sale]([Id]),
        CONSTRAINT [FK_Deliveries_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[AspNetUsers]([Id]),
        CONSTRAINT [FK_Deliveries_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [dbo].[AspNetUsers]([Id])
    );

    PRINT 'Table [Deliveries] created successfully.';
END
ELSE
BEGIN
    PRINT 'Table [Deliveries] already exists.';
END
GO

-- Create indexes for better query performance
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Deliveries_SaleId' AND object_id = OBJECT_ID('dbo.Deliveries'))
BEGIN
    CREATE NONCLUSTERED INDEX [IX_Deliveries_SaleId] ON [dbo].[Deliveries]([SaleId]);
    PRINT 'Index [IX_Deliveries_SaleId] created.';
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Deliveries_Status' AND object_id = OBJECT_ID('dbo.Deliveries'))
BEGIN
    CREATE NONCLUSTERED INDEX [IX_Deliveries_Status] ON [dbo].[Deliveries]([Status]) WHERE [IsDeleted] = 0;
    PRINT 'Index [IX_Deliveries_Status] created.';
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Deliveries_Province' AND object_id = OBJECT_ID('dbo.Deliveries'))
BEGIN
    CREATE NONCLUSTERED INDEX [IX_Deliveries_Province] ON [dbo].[Deliveries]([Province]) WHERE [IsDeleted] = 0;
    PRINT 'Index [IX_Deliveries_Province] created.';
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Deliveries_DeliveryDate' AND object_id = OBJECT_ID('dbo.Deliveries'))
BEGIN
    CREATE NONCLUSTERED INDEX [IX_Deliveries_DeliveryDate] ON [dbo].[Deliveries]([DeliveryDate]) WHERE [IsDeleted] = 0;
    PRINT 'Index [IX_Deliveries_DeliveryDate] created.';
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Deliveries_DeliveryNumber' AND object_id = OBJECT_ID('dbo.Deliveries'))
BEGIN
    CREATE UNIQUE NONCLUSTERED INDEX [IX_Deliveries_DeliveryNumber] ON [dbo].[Deliveries]([DeliveryNumber]) WHERE [IsDeleted] = 0;
    PRINT 'Index [IX_Deliveries_DeliveryNumber] created.';
END
GO

-- ============================================
-- SAMPLE DATA (Optional - uncomment to insert test data)
-- ============================================

/*
INSERT INTO [dbo].[Deliveries] 
    ([DeliveryNumber], [SaleId], [InstitutionName], [Province], [ItemDescription], 
     [Quantity], [DeliveryDate], [InvoiceNumber], [Status], [DriverName], 
     [VehicleNumber], [Notes], [IsDeleted], [DateCreated], [CreatedBy])
VALUES
    ('DEL000001', 1, 'Provincial Pharmacy Depot - Gauteng', 'Gauteng', 'HGT Meters', 
     50, '2026-03-20', 'IN163336', 1, 'John Doe', 
     'GP 123 ABC', 'Fragile medical equipment', 0, GETDATE(), 1),
    
    ('DEL000002', 2, 'KZN Health Department', 'KwaZulu-Natal', 'HGT Strips', 
     500, '2026-03-18', 'IN163337', 3, 'David Nkosi', 
     'KZN 456 DEF', 'Delivered to warehouse', 0, GETDATE(), 1),
    
    ('DEL000003', 3, 'Limpopo Provincial Hospital', 'Limpopo', 'HGT Meters', 
     25, '2026-03-21', 'IN163338', 2, 'Peter Mokoena', 
     'LP 789 GHI', 'In transit to facility', 0, GETDATE(), 1);

PRINT 'Sample delivery data inserted.';
*/

-- ============================================
-- VERIFICATION QUERIES
-- ============================================

-- View table structure
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Deliveries'
ORDER BY ORDINAL_POSITION;

-- View indexes
SELECT 
    i.name AS IndexName,
    i.type_desc AS IndexType,
    i.is_unique AS IsUnique
FROM sys.indexes i
WHERE i.object_id = OBJECT_ID('dbo.Deliveries')
  AND i.name IS NOT NULL;

-- Count check
SELECT COUNT(*) AS TotalDeliveries FROM [dbo].[Deliveries] WHERE IsDeleted = 0;

PRINT '============================================';
PRINT 'Deliveries table setup complete!';
PRINT 'Delivery Status Values:';
PRINT '  1 = Pending';
PRINT '  2 = InTransit';
PRINT '  3 = Delivered';
PRINT '  4 = Failed';
PRINT '  5 = Returned';
PRINT '============================================';
