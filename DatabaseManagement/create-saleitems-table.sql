-- Create SaleItems table to support the Sales API
-- This table stores line items for each sale

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'SaleItems')
BEGIN
    CREATE TABLE [dbo].[SaleItems] (
        [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        [SaleId] INT NOT NULL,
        [InventoryItemId] INT NOT NULL,
        [Quantity] INT NOT NULL,
        [UnitPrice] DECIMAL(18,2) NOT NULL,
        [TotalPrice] DECIMAL(18,2) NOT NULL,
        [IsDeleted] BIT NOT NULL DEFAULT 0,
        [DateCreated] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
        [LastUpdated] DATETIME2(7) NULL,
        [CreatedBy] INT NOT NULL DEFAULT 0,
        [UpdatedBy] INT NULL,
        
        -- Foreign key constraints
        CONSTRAINT [FK_SaleItems_Sale] FOREIGN KEY ([SaleId]) 
            REFERENCES [dbo].[Sale]([Id]),
        CONSTRAINT [FK_SaleItems_InventoryItem] FOREIGN KEY ([InventoryItemId]) 
            REFERENCES [dbo].[InventoryItem]([Id])
    );
    
    -- Create indexes for better query performance
    CREATE INDEX [IX_SaleItems_SaleId] ON [dbo].[SaleItems]([SaleId]);
    CREATE INDEX [IX_SaleItems_InventoryItemId] ON [dbo].[SaleItems]([InventoryItemId]);
    
    PRINT 'SaleItems table created successfully';
END
ELSE
BEGIN
    PRINT 'SaleItems table already exists';
END
GO
