-- SQL INSERT Script for Merafong Sub District Sales (IN160219)
-- Date: 2025/11/03
-- Total: 233,823.61

-- Step 1: Check/Create Customer if needed
-- Adjust CustomerId below based on your actual customer records
DECLARE @CustomerId INT = 1; -- Change this to the correct Customer ID for MERAFONG SUB DISTRICT
DECLARE @CustomerName NVARCHAR(255) = 'MERAFONG SUB DISTRICT';
DECLARE @SaleNumber NVARCHAR(50) = 'IN160219';
DECLARE @SaleDate DATETIME2(7) = '2025-11-03';
DECLARE @ProvinceId INT = NULL; -- Update if you know the province
DECLARE @SaleId INT;

-- Step 2: Insert Sales Record
INSERT INTO [dbo].[Sales] 
    ([SaleNumber], [SaleDate], [CustomerId], [CustomerName], [CustomerPhone], 
     [Subtotal], [Total], [ProvinceId], [Notes], [IsDeleted], [CreatedDate], [CreatedBy])
VALUES 
    (@SaleNumber, @SaleDate, @CustomerId, @CustomerName, NULL, 
     233823.61, 233823.61, @ProvinceId, 'Imported medical supplies - Glucose meters and test strips', 0, GETDATE(), 1);

-- Get the inserted Sale ID
SET @SaleId = SCOPE_IDENTITY();

PRINT 'Sale inserted with ID: ' + CAST(@SaleId AS NVARCHAR(20));

-- Step 3: Insert Sale Items
-- NOTE: Update InventoryItemId values based on your actual InventoryItems table
-- You can find them by running: SELECT Id, ProductCode, Description FROM [dbo].[InventoryItems] WHERE ProductCode LIKE 'NDOH35%'

INSERT INTO [dbo].[SaleItems] 
    ([SaleId], [InventoryItemId], [Quantity], [UnitPrice], [TotalPrice], [IsDeleted], [CreatedDate], [CreatedBy])
VALUES 
    (@SaleId, (SELECT TOP 1 [Id] FROM [dbo].[InventoryItems] WHERE [ProductCode] = 'NDOH35017'), 800, 44.84, 35874.78, 0, GETDATE(), 1),
    (@SaleId, (SELECT TOP 1 [Id] FROM [dbo].[InventoryItems] WHERE [ProductCode] = 'NDOH35018'), 16, 24.10, 385.67, 0, GETDATE(), 1),
    (@SaleId, (SELECT TOP 1 [Id] FROM [dbo].[InventoryItems] WHERE [ProductCode] = 'NDOH35019'), 34, 400.68, 13623.06, 0, GETDATE(), 1),
    (@SaleId, (SELECT TOP 1 [Id] FROM [dbo].[InventoryItems] WHERE [ProductCode] = 'NDOH35020'), 34, 275.47, 9364.79, 0, GETDATE(), 1),
    (@SaleId, (SELECT TOP 1 [Id] FROM [dbo].[InventoryItems] WHERE [ProductCode] = 'NDOH35021'), 34, 688.56, 23411.21, 0, GETDATE(), 1),
    (@SaleId, (SELECT TOP 1 [Id] FROM [dbo].[InventoryItems] WHERE [ProductCode] = 'NDOH35022'), 34, 876.38, 29796.72, 0, GETDATE(), 1),
    (@SaleId, (SELECT TOP 1 [Id] FROM [dbo].[InventoryItems] WHERE [ProductCode] = 'NDOH35026'), 0, 0.00, 0.00, 0, GETDATE(), 1),
    (@SaleId, (SELECT TOP 1 [Id] FROM [dbo].[InventoryItems] WHERE [ProductCode] = 'NDOH35028'), 0, 0.00, 0.00, 0, GETDATE(), 1),
    (@SaleId, (SELECT TOP 1 [Id] FROM [dbo].[InventoryItems] WHERE [ProductCode] = 'NDOH35030'), 0, 0.00, 0.00, 0, GETDATE(), 1),
    (@SaleId, (SELECT TOP 1 [Id] FROM [dbo].[InventoryItems] WHERE [ProductCode] = 'NDOH35032'), 0, 0.00, 0.00, 0, GETDATE(), 1),
    (@SaleId, (SELECT TOP 1 [Id] FROM [dbo].[InventoryItems] WHERE [ProductCode] = 'NDOH35034'), 55, 1763.71, 97003.74, 0, GETDATE(), 1),
    (@SaleId, (SELECT TOP 1 [Id] FROM [dbo].[InventoryItems] WHERE [ProductCode] = 'NDOH35036'), 0, 0.00, 0.00, 0, GETDATE(), 1),
    (@SaleId, (SELECT TOP 1 [Id] FROM [dbo].[InventoryItems] WHERE [ProductCode] = 'NDOH35037'), 16, 24.10, 385.67, 0, GETDATE(), 1);

PRINT '13 Sale items inserted successfully!';

-- Verify the inserted data
SELECT 
    s.[Id], s.[SaleNumber], s.[SaleDate], s.[CustomerName], s.[Total],
    (SELECT COUNT(*) FROM [dbo].[SaleItems] WHERE [SaleId] = s.[Id]) AS ItemCount
FROM [dbo].[Sales] s
WHERE s.[SaleNumber] = @SaleNumber;
