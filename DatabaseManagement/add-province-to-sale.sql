-- Add Province column to Sale table for provincial tracking

-- Check if Province column already exists
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('dbo.Sale') AND name = 'ProvinceId')
BEGIN
    -- Add ProvinceId column to Sale table
    ALTER TABLE [dbo].[Sale]
    ADD [ProvinceId] INT NULL;
    
    -- Add foreign key constraint to Provinces table
    ALTER TABLE [dbo].[Sale]
    ADD CONSTRAINT [FK_Sale_Province] FOREIGN KEY ([ProvinceId]) 
        REFERENCES [dbo].[Provinces]([Id]);
    
    -- Create index for better query performance
    CREATE INDEX [IX_Sale_ProvinceId] ON [dbo].[Sale]([ProvinceId]);
    
    PRINT 'ProvinceId column added to Sale table successfully';
END
ELSE
BEGIN
    PRINT 'ProvinceId column already exists in Sale table';
END
GO

-- Display current sales without province assignment
SELECT 
    COUNT(*) as TotalSales,
    COUNT(ProvinceId) as SalesWithProvince,
    COUNT(*) - COUNT(ProvinceId) as SalesWithoutProvince
FROM Sale
WHERE IsDeleted = 0;
GO
