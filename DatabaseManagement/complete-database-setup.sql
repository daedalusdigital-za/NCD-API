-- =====================================================
-- NDCANGU Medical Management System - Complete Database Setup
-- This script creates all tables and populates them with initial data
-- Run this script in Visual Studio SQL Server Object Explorer or SSMS
-- =====================================================

USE [MedicalManagementDB]
GO

-- =====================================================
-- CREATE TABLES
-- =====================================================

-- Create Province Table
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Province' AND xtype='U')
BEGIN
    CREATE TABLE [dbo].[Province](
        [Id] [int] IDENTITY(1,1) NOT NULL,
        [Name] [nvarchar](100) NOT NULL,
        [Code] [nvarchar](10) NOT NULL,
        [IsDeleted] [bit] NOT NULL DEFAULT 0,
        [CreatedDate] [datetime2](7) NOT NULL DEFAULT GETDATE(),
        [CreatedBy] [int] NULL,
        [LastUpdated] [datetime2](7) NULL,
        [UpdatedBy] [int] NULL,
        [ModifiedBy] [int] NULL,
        CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED ([Id] ASC)
    )
END
GO

-- Create District Table
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='District' AND xtype='U')
BEGIN
    CREATE TABLE [dbo].[District](
        [Id] [int] IDENTITY(1,1) NOT NULL,
        [Name] [nvarchar](200) NOT NULL,
        [ProvinceId] [int] NOT NULL,
        [IsDeleted] [bit] NOT NULL DEFAULT 0,
        [CreatedDate] [datetime2](7) NOT NULL DEFAULT GETDATE(),
        [CreatedBy] [int] NULL,
        [LastUpdated] [datetime2](7) NULL,
        [UpdatedBy] [int] NULL,
        [ModifiedBy] [int] NULL,
        CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [FK_District_Province] FOREIGN KEY ([ProvinceId]) REFERENCES [dbo].[Province]([Id])
    )
END
GO

-- Create Hospital Table
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Hospital' AND xtype='U')
BEGIN
    CREATE TABLE [dbo].[Hospital](
        [Id] [int] IDENTITY(1,1) NOT NULL,
        [Name] [nvarchar](200) NOT NULL,
        [Address] [nvarchar](500) NULL,
        [ContactNumber] [nvarchar](20) NULL,
        [Email] [nvarchar](100) NULL,
        [Capacity] [int] NOT NULL DEFAULT 0,
        [Type] [int] NOT NULL DEFAULT 1, -- 1=Academic, 2=Provincial, 3=District, 4=Specialized
        [DistrictId] [int] NOT NULL,
        [IsDeleted] [bit] NOT NULL DEFAULT 0,
        [CreatedDate] [datetime2](7) NOT NULL DEFAULT GETDATE(),
        [CreatedBy] [int] NULL,
        [LastUpdated] [datetime2](7) NULL,
        [UpdatedBy] [int] NULL,
        [ModifiedBy] [int] NULL,
        CONSTRAINT [PK_Hospital] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [FK_Hospital_District] FOREIGN KEY ([DistrictId]) REFERENCES [dbo].[District]([Id])
    )
END
GO

-- Create Trainer Table
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Trainer' AND xtype='U')
BEGIN
    CREATE TABLE [dbo].[Trainer](
        [Id] [int] IDENTITY(1,1) NOT NULL,
        [FirstName] [nvarchar](50) NOT NULL,
        [LastName] [nvarchar](50) NOT NULL,
        [Email] [nvarchar](100) NOT NULL,
        [Phone] [nvarchar](20) NULL,
        [Specialization] [nvarchar](200) NULL,
        [Experience] [int] NOT NULL DEFAULT 0,
        [Certification] [nvarchar](500) NULL,
        [IsActive] [bit] NOT NULL DEFAULT 1,
        [IsDeleted] [bit] NOT NULL DEFAULT 0,
        [CreatedDate] [datetime2](7) NOT NULL DEFAULT GETDATE(),
        [CreatedBy] [int] NULL,
        [LastUpdated] [datetime2](7) NULL,
        [UpdatedBy] [int] NULL,
        [ModifiedBy] [int] NULL,
        CONSTRAINT [PK_Trainer] PRIMARY KEY CLUSTERED ([Id] ASC)
    )
END
GO

-- Create TrainingSession Table
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='TrainingSession' AND xtype='U')
BEGIN
    CREATE TABLE [dbo].[TrainingSession](
        [Id] [int] IDENTITY(1,1) NOT NULL,
        [Title] [nvarchar](200) NOT NULL,
        [Description] [nvarchar](1000) NULL,
        [TrainerId] [int] NOT NULL,
        [StartDate] [datetime2](7) NOT NULL,
        [EndDate] [datetime2](7) NOT NULL,
        [Capacity] [int] NOT NULL DEFAULT 0,
        [Status] [int] NOT NULL DEFAULT 0, -- 0=Scheduled, 1=InProgress, 2=Completed, 3=Cancelled
        [LocationType] [int] NOT NULL DEFAULT 1, -- 1=InPerson, 2=Virtual, 3=Hybrid
        [VenueDetails] [nvarchar](500) NULL,
        [IsDeleted] [bit] NOT NULL DEFAULT 0,
        [CreatedDate] [datetime2](7) NOT NULL DEFAULT GETDATE(),
        [CreatedBy] [int] NULL,
        [LastUpdated] [datetime2](7) NULL,
        [UpdatedBy] [int] NULL,
        [ModifiedBy] [int] NULL,
        CONSTRAINT [PK_TrainingSession] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [FK_TrainingSession_Trainer] FOREIGN KEY ([TrainerId]) REFERENCES [dbo].[Trainer]([Id])
    )
END
GO

-- Create InventoryItem Table
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='InventoryItem' AND xtype='U')
BEGIN
    CREATE TABLE [dbo].[InventoryItem](
        [Id] [int] IDENTITY(1,1) NOT NULL,
        [Name] [nvarchar](200) NOT NULL,
        [Description] [nvarchar](1000) NULL,
        [Category] [int] NOT NULL DEFAULT 1, -- 1=Equipment, 2=Supplies, 3=Medication
        [SKU] [nvarchar](50) NOT NULL,
        [UnitOfMeasure] [nvarchar](50) NOT NULL,
        [UnitPrice] [decimal](18,2) NOT NULL DEFAULT 0,
        [StockAvailable] [int] NOT NULL DEFAULT 0,
        [ReorderLevel] [int] NOT NULL DEFAULT 0,
        [Supplier] [nvarchar](200) NULL,
        [ExpiryDate] [datetime2](7) NULL,
        [BatchNumber] [nvarchar](100) NULL,
        [Status] [int] NOT NULL DEFAULT 1, -- 1=InStock, 2=LowStock, 3=OutOfStock
        [IsDeleted] [bit] NOT NULL DEFAULT 0,
        [CreatedDate] [datetime2](7) NOT NULL DEFAULT GETDATE(),
        [CreatedBy] [int] NULL,
        [LastUpdated] [datetime2](7) NULL,
        [UpdatedBy] [int] NULL,
        [ModifiedBy] [int] NULL,
        CONSTRAINT [PK_InventoryItem] PRIMARY KEY CLUSTERED ([Id] ASC)
    )
END
GO

-- Create Sale Table
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Sale' AND xtype='U')
BEGIN
    CREATE TABLE [dbo].[Sale](
        [Id] [int] IDENTITY(1,1) NOT NULL,
        [SaleNumber] [nvarchar](50) NOT NULL,
        [SaleDate] [datetime2](7) NOT NULL,
        [CustomerId] [int] NOT NULL,
        [CustomerName] [nvarchar](200) NOT NULL,
        [CustomerEmail] [nvarchar](100) NULL,
        [CustomerPhone] [nvarchar](20) NULL,
        [Subtotal] [decimal](18,2) NOT NULL DEFAULT 0,
        [TaxAmount] [decimal](18,2) NOT NULL DEFAULT 0,
        [Discount] [decimal](18,2) NOT NULL DEFAULT 0,
        [Total] [decimal](18,2) NOT NULL DEFAULT 0,
        [PaymentMethod] [int] NOT NULL DEFAULT 1, -- 1=Cash, 2=Card, 3=BankTransfer, 4=Credit
        [PaymentStatus] [int] NOT NULL DEFAULT 0, -- 0=Pending, 1=Paid, 2=Failed, 3=Refunded
        [DeliveryStatus] [int] NOT NULL DEFAULT 0, -- 0=Pending, 1=Shipped, 2=Delivered, 3=Cancelled
        [Notes] [nvarchar](1000) NULL,
        [IsDeleted] [bit] NOT NULL DEFAULT 0,
        [CreatedDate] [datetime2](7) NOT NULL DEFAULT GETDATE(),
        [CreatedBy] [int] NULL,
        [LastUpdated] [datetime2](7) NULL,
        [UpdatedBy] [int] NULL,
        [ModifiedBy] [int] NULL,
        CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED ([Id] ASC)
    )
END
GO

-- Create SaleItem Table
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='SaleItem' AND xtype='U')
BEGIN
    CREATE TABLE [dbo].[SaleItem](
        [Id] [int] IDENTITY(1,1) NOT NULL,
        [SaleId] [int] NOT NULL,
        [InventoryItemId] [int] NOT NULL,
        [Quantity] [int] NOT NULL DEFAULT 1,
        [UnitPrice] [decimal](18,2) NOT NULL DEFAULT 0,
        [TotalPrice] [decimal](18,2) NOT NULL DEFAULT 0,
        [IsDeleted] [bit] NOT NULL DEFAULT 0,
        CONSTRAINT [PK_SaleItem] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [FK_SaleItem_Sale] FOREIGN KEY ([SaleId]) REFERENCES [dbo].[Sale]([Id]),
        CONSTRAINT [FK_SaleItem_InventoryItem] FOREIGN KEY ([InventoryItemId]) REFERENCES [dbo].[InventoryItem]([Id])
    )
END
GO

-- =====================================================
-- SEED DATA - LOCATION MODULE
-- =====================================================

PRINT 'Inserting Location Data...'

-- Insert Provinces
SET IDENTITY_INSERT [dbo].[Province] ON
IF NOT EXISTS (SELECT 1 FROM [dbo].[Province] WHERE [Id] = 1)
BEGIN
    INSERT INTO [dbo].[Province] ([Id], [Name], [Code], [IsDeleted], [CreatedDate], [CreatedBy]) VALUES 
    (1, 'Eastern Cape', 'EC', 0, GETDATE(), 1),
    (2, 'Free State', 'FS', 0, GETDATE(), 1),
    (3, 'Gauteng', 'GP', 0, GETDATE(), 1),
    (4, 'KwaZulu-Natal', 'KZN', 0, GETDATE(), 1),
    (5, 'Limpopo', 'LP', 0, GETDATE(), 1),
    (6, 'Mpumalanga', 'MP', 0, GETDATE(), 1),
    (7, 'Northern Cape', 'NC', 0, GETDATE(), 1),
    (8, 'North West', 'NW', 0, GETDATE(), 1),
    (9, 'Western Cape', 'WC', 0, GETDATE(), 1)
END
SET IDENTITY_INSERT [dbo].[Province] OFF

-- Insert Districts for Gauteng (Province ID 3)
SET IDENTITY_INSERT [dbo].[District] ON
IF NOT EXISTS (SELECT 1 FROM [dbo].[District] WHERE [Id] = 1)
BEGIN
    INSERT INTO [dbo].[District] ([Id], [Name], [ProvinceId], [IsDeleted], [CreatedDate], [CreatedBy]) VALUES
    (1, 'City of Johannesburg Metropolitan Municipality', 3, 0, GETDATE(), 1),
    (2, 'City of Tshwane Metropolitan Municipality', 3, 0, GETDATE(), 1),
    (3, 'Ekurhuleni Metropolitan Municipality', 3, 0, GETDATE(), 1),
    (4, 'West Rand District Municipality', 3, 0, GETDATE(), 1),
    (5, 'Sedibeng District Municipality', 3, 0, GETDATE(), 1)
END

-- Insert Districts for KwaZulu-Natal (Province ID 4)
IF NOT EXISTS (SELECT 1 FROM [dbo].[District] WHERE [Id] = 6)
BEGIN
    INSERT INTO [dbo].[District] ([Id], [Name], [ProvinceId], [IsDeleted], [CreatedDate], [CreatedBy]) VALUES
    (6, 'eThekwini Metropolitan Municipality', 4, 0, GETDATE(), 1),
    (7, 'iLembe District Municipality', 4, 0, GETDATE(), 1),
    (8, 'uMgungundlovu District Municipality', 4, 0, GETDATE(), 1),
    (9, 'Ugu District Municipality', 4, 0, GETDATE(), 1),
    (10, 'uThukela District Municipality', 4, 0, GETDATE(), 1)
END

-- Insert Districts for Western Cape (Province ID 9)
IF NOT EXISTS (SELECT 1 FROM [dbo].[District] WHERE [Id] = 11)
BEGIN
    INSERT INTO [dbo].[District] ([Id], [Name], [ProvinceId], [IsDeleted], [CreatedDate], [CreatedBy]) VALUES
    (11, 'City of Cape Town Metropolitan Municipality', 9, 0, GETDATE(), 1),
    (12, 'Cape Winelands District Municipality', 9, 0, GETDATE(), 1),
    (13, 'Central Karoo District Municipality', 9, 0, GETDATE(), 1),
    (14, 'Eden District Municipality', 9, 0, GETDATE(), 1),
    (15, 'Overberg District Municipality', 9, 0, GETDATE(), 1),
    (16, 'West Coast District Municipality', 9, 0, GETDATE(), 1)
END
SET IDENTITY_INSERT [dbo].[District] OFF

-- Insert Healthcare Facilities (Hospitals)
SET IDENTITY_INSERT [dbo].[Hospital] ON
IF NOT EXISTS (SELECT 1 FROM [dbo].[Hospital] WHERE [Id] = 1)
BEGIN
    INSERT INTO [dbo].[Hospital] ([Id], [Name], [Address], [ContactNumber], [Email], [Capacity], [Type], [DistrictId], [IsDeleted], [CreatedDate], [CreatedBy]) VALUES
    (1, 'Charlotte Maxeke Johannesburg Academic Hospital', '17 Jubilee Rd, Parktown, Johannesburg', '+27 11 488 4911', 'info@cmjah.co.za', 1088, 1, 1, 0, GETDATE(), 1),
    (2, 'Chris Hani Baragwanath Academic Hospital', 'Soweto, Johannesburg', '+27 11 933 0111', 'info@chbah.co.za', 3200, 1, 1, 0, GETDATE(), 1),
    (3, 'Steve Biko Academic Hospital', 'Pretoria', '+27 12 354 1000', 'info@sbah.co.za', 1200, 1, 2, 0, GETDATE(), 1),
    (4, 'Kalafong Provincial Tertiary Hospital', 'Atteridgeville, Pretoria', '+27 12 373 0301', 'info@kalafong.co.za', 950, 2, 2, 0, GETDATE(), 1),
    (5, 'Tambo Memorial Hospital', 'Boksburg, Ekurhuleni', '+27 11 825 0000', 'info@tambo.co.za', 450, 2, 3, 0, GETDATE(), 1),
    (6, 'Inkosi Albert Luthuli Central Hospital', 'Mayville, Durban', '+27 31 240 2111', 'info@ialch.co.za', 1344, 1, 6, 0, GETDATE(), 1),
    (7, 'King Edward VIII Hospital', 'Congella, Durban', '+27 31 360 3111', 'info@keh.co.za', 1020, 2, 6, 0, GETDATE(), 1),
    (8, 'Groote Schuur Hospital', 'Observatory, Cape Town', '+27 21 404 9111', 'info@gsh.co.za', 938, 1, 11, 0, GETDATE(), 1),
    (9, 'Tygerberg Hospital', 'Bellville, Cape Town', '+27 21 938 4911', 'info@tygerberg.co.za', 1384, 1, 11, 0, GETDATE(), 1),
    (10, 'Red Cross War Memorial Children''s Hospital', 'Rondebosch, Cape Town', '+27 21 658 5111', 'info@redcross.co.za', 285, 3, 11, 0, GETDATE(), 1)
END
SET IDENTITY_INSERT [dbo].[Hospital] OFF

-- =====================================================
-- SEED DATA - TRAINING MODULE
-- =====================================================

PRINT 'Inserting Training Data...'

-- Insert Trainers
SET IDENTITY_INSERT [dbo].[Trainer] ON
IF NOT EXISTS (SELECT 1 FROM [dbo].[Trainer] WHERE [Id] = 1)
BEGIN
    INSERT INTO [dbo].[Trainer] ([Id], [FirstName], [LastName], [Email], [Phone], [Specialization], [Experience], [Certification], [IsActive], [IsDeleted], [CreatedDate], [CreatedBy]) VALUES
    (1, 'Dr. Sarah', 'Johnson', 'sarah.johnson@health.gov.za', '+27 82 123 4567', 'Non-Communicable Diseases', 15, 'WHO NCD Prevention Certified', 1, 0, GETDATE(), 1),
    (2, 'Dr. Thabo', 'Mthembu', 'thabo.mthembu@health.gov.za', '+27 83 234 5678', 'Diabetes Management', 12, 'International Diabetes Federation Certified', 1, 0, GETDATE(), 1),
    (3, 'Dr. Nomsa', 'Dlamini', 'nomsa.dlamini@health.gov.za', '+27 84 345 6789', 'Hypertension Control', 18, 'American Heart Association Certified', 1, 0, GETDATE(), 1),
    (4, 'Dr. Michael', 'van der Merwe', 'michael.vandermerwe@health.gov.za', '+27 85 456 7890', 'Cardiovascular Disease Prevention', 20, 'European Society of Cardiology Certified', 1, 0, GETDATE(), 1),
    (5, 'Dr. Fatima', 'Hassan', 'fatima.hassan@health.gov.za', '+27 86 567 8901', 'Obesity and Lifestyle Medicine', 10, 'American Board of Lifestyle Medicine', 1, 0, GETDATE(), 1)
END
SET IDENTITY_INSERT [dbo].[Trainer] OFF

-- Insert Training Sessions
SET IDENTITY_INSERT [dbo].[TrainingSession] ON
IF NOT EXISTS (SELECT 1 FROM [dbo].[TrainingSession] WHERE [Id] = 1)
BEGIN
    INSERT INTO [dbo].[TrainingSession] ([Id], [Title], [Description], [TrainerId], [StartDate], [EndDate], [Capacity], [Status], [LocationType], [VenueDetails], [IsDeleted], [CreatedDate], [CreatedBy]) VALUES
    (1, 'Diabetes Prevention and Management Workshop', 'Comprehensive training on Type 2 diabetes prevention strategies and management protocols for healthcare workers.', 2, '2024-02-15 09:00:00', '2024-02-15 17:00:00', 50, 1, 1, 'Charlotte Maxeke Hospital - Auditorium A', 0, GETDATE(), 1),
    (2, 'Hypertension Screening and Control Training', 'Advanced training on blood pressure measurement techniques, risk assessment, and control strategies.', 3, '2024-02-20 08:30:00', '2024-02-20 16:30:00', 40, 1, 1, 'Steve Biko Hospital - Conference Room 1', 0, GETDATE(), 1),
    (3, 'Community-Based NCD Prevention Program', 'Training healthcare workers on implementing community outreach programs for NCD prevention.', 1, '2024-02-25 09:00:00', '2024-02-26 16:00:00', 30, 0, 2, 'Virtual Platform - Zoom Meeting ID: 123-456-7890', 0, GETDATE(), 1),
    (4, 'Cardiovascular Risk Assessment Workshop', 'Hands-on training for cardiovascular risk calculation and patient counseling techniques.', 4, '2024-03-05 10:00:00', '2024-03-05 15:00:00', 25, 1, 1, 'Groote Schuur Hospital - Training Center', 0, GETDATE(), 1),
    (5, 'Lifestyle Medicine and Obesity Management', 'Evidence-based approaches to lifestyle interventions for obesity and metabolic syndrome.', 5, '2024-03-10 09:00:00', '2024-03-11 17:00:00', 35, 0, 1, 'Inkosi Albert Luthuli Hospital - Education Wing', 0, GETDATE(), 1)
END
SET IDENTITY_INSERT [dbo].[TrainingSession] OFF

-- =====================================================
-- SEED DATA - INVENTORY MODULE
-- =====================================================

PRINT 'Inserting Inventory Data...'

-- Insert Inventory Items
SET IDENTITY_INSERT [dbo].[InventoryItem] ON
IF NOT EXISTS (SELECT 1 FROM [dbo].[InventoryItem] WHERE [Id] = 1)
BEGIN
    INSERT INTO [dbo].[InventoryItem] ([Id], [Name], [Description], [Category], [SKU], [UnitOfMeasure], [UnitPrice], [StockAvailable], [ReorderLevel], [Supplier], [ExpiryDate], [BatchNumber], [Status], [IsDeleted], [CreatedDate], [CreatedBy]) VALUES
    (1, 'Digital Blood Pressure Monitor', 'Automatic digital BP monitor with large display for accurate readings', 1, 'BP-001', 'Unit', 1250.00, 25, 5, 'MedEquip South Africa', '2027-01-01', 'BPM2024001', 1, 0, GETDATE(), 1),
    (2, 'Glucometer Test Strips', 'High-accuracy glucose test strips compatible with standard glucometers', 2, 'GLU-002', 'Box of 50', 85.50, 120, 20, 'DiaCare Supplies', '2025-06-15', 'GTS2024002', 1, 0, GETDATE(), 1),
    (3, 'Disposable Lancets', 'Sterile single-use lancets for blood glucose testing', 2, 'LAN-003', 'Box of 100', 42.75, 200, 30, 'MedDisposables CC', '2026-03-20', 'LAN2024003', 1, 0, GETDATE(), 1),
    (4, 'Weighing Scale - Digital', 'Electronic patient weighing scale with BMI calculation', 1, 'WS-004', 'Unit', 2150.00, 15, 3, 'ScaleTech Solutions', '2028-12-31', 'WS2024004', 1, 0, GETDATE(), 1),
    (5, 'Stethoscope - Cardiology', 'Professional cardiology stethoscope for heart and lung auscultation', 1, 'ST-005', 'Unit', 3200.00, 8, 2, 'CardioMed Equipment', '2030-01-01', 'ST2024005', 1, 0, GETDATE(), 1),
    (6, 'Cholesterol Test Kit', 'Point-of-care cholesterol testing kit with reagents', 2, 'CHO-006', 'Kit', 125.00, 45, 10, 'LabQuick Diagnostics', '2024-12-31', 'CHO2024006', 3, 0, GETDATE(), 1),
    (7, 'Blood Pressure Cuffs - Adult', 'Standard adult blood pressure cuffs for manual BP measurement', 2, 'BPC-007', 'Unit', 95.00, 30, 8, 'MedEquip South Africa', '2027-06-30', 'BPC2024007', 1, 0, GETDATE(), 1),
    (8, 'HbA1c Test Cartridges', 'Point-of-care HbA1c test cartridges for diabetes monitoring', 2, 'HBA-008', 'Box of 20', 850.00, 18, 5, 'DiaCare Supplies', '2024-09-15', 'HBA2024008', 2, 0, GETDATE(), 1),
    (9, 'Pulse Oximeter', 'Fingertip pulse oximeter for oxygen saturation measurement', 1, 'POX-009', 'Unit', 320.00, 40, 10, 'OxyTech Medical', '2026-11-30', 'POX2024009', 1, 0, GETDATE(), 1),
    (10, 'ECG Electrodes', 'Disposable ECG electrodes for cardiac monitoring', 2, 'ECG-010', 'Pack of 10', 28.50, 150, 25, 'CardioMed Equipment', '2025-08-31', 'ECG2024010', 1, 0, GETDATE(), 1)
END
SET IDENTITY_INSERT [dbo].[InventoryItem] OFF

-- =====================================================
-- SEED DATA - SALES MODULE
-- =====================================================

PRINT 'Inserting Sales Data...'

-- Insert Sales
SET IDENTITY_INSERT [dbo].[Sale] ON
IF NOT EXISTS (SELECT 1 FROM [dbo].[Sale] WHERE [Id] = 1)
BEGIN
    INSERT INTO [dbo].[Sale] ([Id], [SaleNumber], [SaleDate], [CustomerId], [CustomerName], [CustomerEmail], [CustomerPhone], [Subtotal], [TaxAmount], [Discount], [Total], [PaymentMethod], [PaymentStatus], [DeliveryStatus], [Notes], [IsDeleted], [CreatedDate], [CreatedBy]) VALUES
    (1, 'SALE-2024-001', '2024-01-15', 1001, 'Charlotte Maxeke Hospital', 'procurement@cmjah.co.za', '+27 11 488 4911', 3750.00, 562.50, 0.00, 4312.50, 2, 1, 2, 'Monthly medical supplies order for diabetes clinic', 0, GETDATE(), 1),
    (2, 'SALE-2024-002', '2024-01-20', 1002, 'Steve Biko Academic Hospital', 'supplies@sbah.co.za', '+27 12 354 1000', 2140.00, 321.00, 100.00, 2361.00, 1, 1, 2, 'Equipment order for new cardiac unit', 0, GETDATE(), 1),
    (3, 'SALE-2024-003', '2024-01-25', 1003, 'Groote Schuur Hospital', 'purchasing@gsh.co.za', '+27 21 404 9111', 1280.00, 192.00, 50.00, 1422.00, 2, 1, 1, 'Emergency restocking of test supplies', 0, GETDATE(), 1)
END
SET IDENTITY_INSERT [dbo].[Sale] OFF

-- Insert Sale Items for Sale 1
SET IDENTITY_INSERT [dbo].[SaleItem] ON
IF NOT EXISTS (SELECT 1 FROM [dbo].[SaleItem] WHERE [Id] = 1)
BEGIN
    INSERT INTO [dbo].[SaleItem] ([Id], [SaleId], [InventoryItemId], [Quantity], [UnitPrice], [TotalPrice], [IsDeleted]) VALUES
    (1, 1, 2, 20, 85.50, 1710.00, 0),  -- Glucometer Test Strips
    (2, 1, 3, 15, 42.75, 641.25, 0),   -- Disposable Lancets
    (3, 1, 6, 12, 125.00, 1500.00, 0), -- Cholesterol Test Kit
    (4, 2, 1, 1, 1250.00, 1250.00, 0), -- Digital Blood Pressure Monitor
    (5, 2, 5, 1, 3200.00, 3200.00, 0), -- Stethoscope - Cardiology
    (6, 3, 9, 4, 320.00, 1280.00, 0)   -- Pulse Oximeter
END
SET IDENTITY_INSERT [dbo].[SaleItem] OFF

-- =====================================================
-- VERIFICATION AND SUMMARY
-- =====================================================

PRINT ''
PRINT '====================================================='
PRINT 'NDCANGU DATABASE SETUP COMPLETED SUCCESSFULLY!'
PRINT '====================================================='
PRINT ''
PRINT 'Tables Created:'
PRINT '- Province (Location hierarchy root)'
PRINT '- District (Sub-regions within provinces)'
PRINT '- Hospital (Healthcare facilities)'
PRINT '- Trainer (Healthcare training specialists)'
PRINT '- TrainingSession (Scheduled training events)'
PRINT '- InventoryItem (Medical supplies and equipment)'
PRINT '- Sale (Sales transactions)'
PRINT '- SaleItem (Individual items within sales)'
PRINT ''
PRINT 'Seeded Data Summary:'
PRINT '- 9 South African Provinces'
PRINT '- 16 Districts (Gauteng, KZN, Western Cape)'
PRINT '- 10 Major Hospitals with realistic details'
PRINT '- 5 Healthcare Trainers with specializations'
PRINT '- 5 Training Sessions scheduled'
PRINT '- 10 Medical Inventory Items with categories'
PRINT '- 3 Sample Sales with associated items'
PRINT ''
PRINT 'The database is now ready for the NDCANGU API endpoints!'
PRINT 'You can now run the .NET application and test all features.'
PRINT '====================================================='

-- Show row counts for verification
SELECT 'Province' as TableName, COUNT(*) as RecordCount FROM [dbo].[Province]
UNION ALL
SELECT 'District', COUNT(*) FROM [dbo].[District]
UNION ALL
SELECT 'Hospital', COUNT(*) FROM [dbo].[Hospital]
UNION ALL
SELECT 'Trainer', COUNT(*) FROM [dbo].[Trainer]
UNION ALL
SELECT 'TrainingSession', COUNT(*) FROM [dbo].[TrainingSession]
UNION ALL
SELECT 'InventoryItem', COUNT(*) FROM [dbo].[InventoryItem]
UNION ALL
SELECT 'Sale', COUNT(*) FROM [dbo].[Sale]
UNION ALL
SELECT 'SaleItem', COUNT(*) FROM [dbo].[SaleItem]