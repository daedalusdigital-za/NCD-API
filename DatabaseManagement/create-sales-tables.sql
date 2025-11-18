-- Create NEW simplified Sales table for NCD-API
-- Run this script BEFORE running insert-sales.sql

-- Drop existing SaleItems table first if it exists (due to FK constraint)
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaleItems]') AND type in (N'U'))
BEGIN
    DROP TABLE [dbo].[SaleItems];
    PRINT 'Existing SaleItems table dropped.';
END
GO

-- Drop existing Sales table if it exists (CAREFUL - this will delete all existing data!)
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sales]') AND type in (N'U'))
BEGIN
    DROP TABLE [dbo].[Sales];
    PRINT 'Existing Sales table dropped.';
END
GO

-- Create NEW Sales table with simplified structure
CREATE TABLE [dbo].[Sales] (
    [Id] INT IDENTITY(1,1) NOT NULL,
    [SaleNumber] NVARCHAR(50) NOT NULL,
    [SaleDate] DATETIME2(7) NOT NULL,
    [CustomerId] INT NOT NULL,
    [CustomerName] NVARCHAR(255) NOT NULL,
    [CustomerPhone] NVARCHAR(50) NULL,
    [Subtotal] DECIMAL(18,2) NOT NULL DEFAULT 0,
    [Total] DECIMAL(18,2) NOT NULL DEFAULT 0,
    [ProvinceId] INT NULL,
    [Notes] NVARCHAR(MAX) NULL,
    [IsDeleted] BIT NOT NULL DEFAULT 0,
    [CreatedDate] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
    [CreatedBy] INT NOT NULL DEFAULT 1,
    [LastUpdated] DATETIME2(7) NULL,
    [UpdatedBy] INT NULL,
    CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Sales_Provinces] FOREIGN KEY([ProvinceId]) REFERENCES [dbo].[Provinces]([Id])
);

CREATE INDEX [IX_Sales_SaleNumber] ON [dbo].[Sales] ([SaleNumber]);
CREATE INDEX [IX_Sales_SaleDate] ON [dbo].[Sales] ([SaleDate]);
CREATE INDEX [IX_Sales_ProvinceId] ON [dbo].[Sales] ([ProvinceId]);

PRINT 'NEW simplified Sales table created successfully.';
GO

-- Create SaleItems table
CREATE TABLE [dbo].[SaleItems] (
    [Id] INT IDENTITY(1,1) NOT NULL,
    [SaleId] INT NOT NULL,
    [InventoryItemId] INT NOT NULL,
    [Quantity] INT NOT NULL DEFAULT 0,
    [UnitPrice] DECIMAL(18,2) NOT NULL DEFAULT 0,
    [TotalPrice] DECIMAL(18,2) NOT NULL DEFAULT 0,
    [IsDeleted] BIT NOT NULL DEFAULT 0,
    [CreatedDate] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
    [CreatedBy] INT NOT NULL DEFAULT 1,
    CONSTRAINT [PK_SaleItems] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SaleItems_Sales] FOREIGN KEY([SaleId]) REFERENCES [dbo].[Sales]([Id]) ON DELETE CASCADE
);

CREATE INDEX [IX_SaleItems_SaleId] ON [dbo].[SaleItems] ([SaleId]);
CREATE INDEX [IX_SaleItems_InventoryItemId] ON [dbo].[SaleItems] ([InventoryItemId]);

PRINT 'SaleItems table created successfully.';
GO

-- Verify tables were created
SELECT 
    t.name AS TableName,
    c.name AS ColumnName,
    ty.name AS DataType,
    c.max_length AS MaxLength,
    c.is_nullable AS IsNullable
FROM sys.tables t
INNER JOIN sys.columns c ON t.object_id = c.object_id
INNER JOIN sys.types ty ON c.user_type_id = ty.user_type_id
WHERE t.name IN ('Sales', 'SaleItems')
ORDER BY t.name, c.column_id;

PRINT 'Sales and SaleItems tables setup complete. You can now run insert-sales.sql';
