-- Create missing tables for NCD-API database
-- Run this script to create all required tables with proper audit columns

-- ============================================
-- 1. Provinces Table
-- ============================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Provinces]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Provinces] (
        [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        [Name] NVARCHAR(255) NOT NULL,
        [Code] NVARCHAR(50) NOT NULL,
        [Population] BIGINT NULL,
        [HealthFacilities] INT NULL,
        [IsDeleted] BIT NOT NULL DEFAULT 0,
        [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
        [UpdatedAt] DATETIME NULL,
        [CreatedBy] INT NOT NULL DEFAULT 0,
        [UpdatedBy] INT NULL
    );
    PRINT 'Provinces table created';
END
GO

-- ============================================
-- 2. Districts Table
-- ============================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Districts]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Districts] (
        [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        [Name] NVARCHAR(255) NOT NULL,
        [ProvinceId] INT NOT NULL,
        [Population] BIGINT NULL,
        [HealthFacilities] INT NULL,
        [IsDeleted] BIT NOT NULL DEFAULT 0,
        [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
        [UpdatedAt] DATETIME NULL,
        [CreatedBy] INT NOT NULL DEFAULT 0,
        [UpdatedBy] INT NULL,
        CONSTRAINT [FK_Districts_Province] FOREIGN KEY ([ProvinceId]) 
            REFERENCES [dbo].[Provinces]([Id])
    );
    PRINT 'Districts table created';
END
GO

-- ============================================
-- 3. Hospitals Table
-- ============================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hospitals]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Hospitals] (
        [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        [Name] NVARCHAR(255) NOT NULL,
        [ProvinceId] INT NOT NULL,
        [DistrictId] INT NULL,
        [Address] NVARCHAR(500) NULL,
        [ContactNumber] NVARCHAR(50) NULL,
        [Email] NVARCHAR(255) NULL,
        [Capacity] INT NULL,
        [Type] INT NOT NULL DEFAULT 0,
        [IsDeleted] BIT NOT NULL DEFAULT 0,
        [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
        [UpdatedAt] DATETIME NULL,
        [CreatedBy] INT NOT NULL DEFAULT 0,
        [UpdatedBy] INT NULL,
        CONSTRAINT [FK_Hospitals_Province] FOREIGN KEY ([ProvinceId]) 
            REFERENCES [dbo].[Provinces]([Id]),
        CONSTRAINT [FK_Hospitals_District] FOREIGN KEY ([DistrictId]) 
            REFERENCES [dbo].[Districts]([Id])
    );
    PRINT 'Hospitals table created';
END
GO

-- ============================================
-- 4. Clinics Table
-- ============================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clinics]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Clinics] (
        [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        [Name] NVARCHAR(255) NOT NULL,
        [ProvinceId] INT NOT NULL,
        [DistrictId] INT NULL,
        [Address] NVARCHAR(500) NULL,
        [ContactNumber] NVARCHAR(50) NULL,
        [Email] NVARCHAR(255) NULL,
        [Type] INT NOT NULL DEFAULT 0,
        [IsDeleted] BIT NOT NULL DEFAULT 0,
        [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
        [UpdatedAt] DATETIME NULL,
        [CreatedBy] INT NOT NULL DEFAULT 0,
        [UpdatedBy] INT NULL,
        CONSTRAINT [FK_Clinics_Province] FOREIGN KEY ([ProvinceId]) 
            REFERENCES [dbo].[Provinces]([Id]),
        CONSTRAINT [FK_Clinics_District] FOREIGN KEY ([DistrictId]) 
            REFERENCES [dbo].[Districts]([Id])
    );
    PRINT 'Clinics table created';
END
GO

-- ============================================
-- 5. InventoryItems Table
-- ============================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InventoryItems]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[InventoryItems] (
        [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        [ItemNumber] NVARCHAR(100) NOT NULL,
        [Description] NVARCHAR(MAX) NOT NULL,
        [Location] NVARCHAR(255) NOT NULL,
        [UOM] NVARCHAR(50) NOT NULL,
        [Category] INT NOT NULL DEFAULT 0,
        [QtyOnHand] INT NOT NULL DEFAULT 0,
        [QtyOnPO] INT NOT NULL DEFAULT 0,
        [QtyOnSO] INT NOT NULL DEFAULT 0,
        [StockAvailable] INT NOT NULL DEFAULT 0,
        [UnitCostForQOH] DECIMAL(18,2) NOT NULL DEFAULT 0,
        [TotalCostForQOH] DECIMAL(18,2) NOT NULL DEFAULT 0,
        [ReorderLevel] INT NOT NULL DEFAULT 0,
        [MaxStockLevel] INT NOT NULL DEFAULT 0,
        [Supplier] NVARCHAR(255) NULL,
        [LastRestocked] DATETIME NULL,
        [ExpiryDate] DATETIME NULL,
        [Status] INT NOT NULL DEFAULT 0,
        [IsDeleted] BIT NOT NULL DEFAULT 0,
        [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
        [UpdatedAt] DATETIME NULL,
        [CreatedBy] INT NOT NULL DEFAULT 0,
        [UpdatedBy] INT NULL
    );
    CREATE INDEX [IX_InventoryItems_ItemNumber] ON [dbo].[InventoryItems] ([ItemNumber]);
    CREATE INDEX [IX_InventoryItems_Category] ON [dbo].[InventoryItems] ([Category]);
    PRINT 'InventoryItems table created';
END
GO

-- ============================================
-- 6. Sales Table
-- ============================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sales]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Sales] (
        [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        [SaleNumber] NVARCHAR(100) NOT NULL,
        [SaleDate] DATETIME NOT NULL,
        [Province] NVARCHAR(255) NOT NULL,
        [Hospital] NVARCHAR(255) NOT NULL,
        [CustomerContactName] NVARCHAR(255) NOT NULL,
        [CustomerContactEmail] NVARCHAR(255) NULL,
        [CustomerContactPhone] NVARCHAR(50) NULL,
        [Subtotal] DECIMAL(18,2) NOT NULL DEFAULT 0,
        [TaxAmount] DECIMAL(18,2) NOT NULL DEFAULT 0,
        [Total] DECIMAL(18,2) NOT NULL DEFAULT 0,
        [PaymentMethod] INT NOT NULL DEFAULT 0,
        [PaymentStatus] INT NOT NULL DEFAULT 0,
        [DeliveryStatus] INT NOT NULL DEFAULT 0,
        [DeliveryDate] DATETIME NULL,
        [Notes] NVARCHAR(MAX) NULL,
        [SalesPerson] NVARCHAR(255) NULL,
        [Discount] DECIMAL(18,2) NOT NULL DEFAULT 0,
        [InvoiceNumber] NVARCHAR(100) NULL,
        [CreatedByName] NVARCHAR(255) NOT NULL,
        [IsDeleted] BIT NOT NULL DEFAULT 0,
        [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
        [UpdatedAt] DATETIME NULL,
        [CreatedBy] INT NOT NULL DEFAULT 0,
        [UpdatedBy] INT NULL
    );
    CREATE INDEX [IX_Sales_SaleNumber] ON [dbo].[Sales] ([SaleNumber]);
    CREATE INDEX [IX_Sales_SaleDate] ON [dbo].[Sales] ([SaleDate]);
    PRINT 'Sales table created';
END
GO

-- ============================================
-- 7. SaleItems Table
-- ============================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaleItems]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[SaleItems] (
        [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        [SaleId] INT NOT NULL,
        [ProductId] INT NOT NULL,
        [ProductName] NVARCHAR(255) NOT NULL,
        [Quantity] INT NOT NULL,
        [UnitPrice] DECIMAL(18,2) NOT NULL,
        [TotalPrice] DECIMAL(18,2) NOT NULL,
        [IsDeleted] BIT NOT NULL DEFAULT 0,
        [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
        [UpdatedAt] DATETIME NULL,
        [CreatedBy] INT NOT NULL DEFAULT 0,
        [UpdatedBy] INT NULL,
        CONSTRAINT [FK_SaleItems_Sale] FOREIGN KEY ([SaleId]) 
            REFERENCES [dbo].[Sales]([Id])
    );
    CREATE INDEX [IX_SaleItems_SaleId] ON [dbo].[SaleItems] ([SaleId]);
    PRINT 'SaleItems table created';
END
GO

-- ============================================
-- 8. TrainingSessions Table
-- ============================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TrainingSessions]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[TrainingSessions] (
        [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        [TrainingName] NVARCHAR(255) NOT NULL,
        [TrainingType] NVARCHAR(255) NOT NULL,
        [Description] NVARCHAR(MAX) NULL,
        [StartDate] DATETIME NOT NULL,
        [EndDate] DATETIME NOT NULL,
        [StartTime] TIME NOT NULL,
        [EndTime] TIME NOT NULL,
        [Province] NVARCHAR(255) NOT NULL,
        [Hospital] NVARCHAR(255) NOT NULL,
        [Venue] NVARCHAR(255) NOT NULL,
        [TrainerId] INT NOT NULL,
        [NumberOfParticipants] INT NOT NULL DEFAULT 0,
        [TargetAudience] NVARCHAR(MAX) NOT NULL,
        [Objectives] NVARCHAR(MAX) NULL,
        [Materials] NVARCHAR(MAX) NULL,
        [Status] INT NOT NULL DEFAULT 0,
        [IsDeleted] BIT NOT NULL DEFAULT 0,
        [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
        [UpdatedAt] DATETIME NULL,
        [CreatedBy] INT NOT NULL DEFAULT 0,
        [UpdatedBy] INT NULL,
        CONSTRAINT [FK_TrainingSessions_Trainer] FOREIGN KEY ([TrainerId]) 
            REFERENCES [dbo].[Trainers]([Id])
    );
    CREATE INDEX [IX_TrainingSessions_TrainerId] ON [dbo].[TrainingSessions] ([TrainerId]);
    CREATE INDEX [IX_TrainingSessions_StartDate] ON [dbo].[TrainingSessions] ([StartDate]);
    PRINT 'TrainingSessions table created';
END
GO

PRINT 'All tables created successfully!';
