-- Delete the incomplete sale first to clean up
DELETE FROM [dbo].[Sale] WHERE SaleNumber = 'IN160219';

-- Insert Merafong Sales Data with correct Inventory Item IDs
INSERT INTO [dbo].[Sale] 
    ([SaleNumber], [SaleDate], [CustomerName], [CustomerPhone], [Total], [Notes], [IsDeleted], [CreatedDate], [CreatedBy])
VALUES 
    ('IN160219', '2025-11-03', 'MERAFONG SUB DISTRICT', NULL, 233823.61, 'Medical supplies - Glucose meters and test strips', 0, GETDATE(), 1);

-- Insert Sale Items (only items that exist in inventory and have qty > 0)
INSERT INTO [dbo].[SaleItem]
    ([SaleId], [InventoryItemId], [Quantity], [UnitPrice], [TotalPrice], [IsDeleted])
VALUES 
    ((SELECT Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN160219'), 2, 800, 44.84, 35874.78, 0),    -- NDOH35017: GLUCOSE TEST STRIPS
    ((SELECT Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN160219'), 9, 16, 24.10, 385.67, 0),      -- NDOH35018: QUALITY CONTROL SOLUTIONS
    ((SELECT Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN160219'), 16, 34, 400.68, 13623.06, 0), -- NDOH35019: 50 KETONE TEST STRIPS
    ((SELECT Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN160219'), 17, 34, 275.47, 9364.79, 0),  -- NDOH35020: 50 URIC ACID TEST STRIPS
    ((SELECT Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN160219'), 4, 34, 688.56, 23411.21, 0),  -- NDOH35021: 50 CHOLESTEROL TEST STRIPS
    ((SELECT Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN160219'), 18, 34, 876.38, 29796.72, 0), -- NDOH35022: 50 LACTATE TEST STRIPS
    ((SELECT Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN160219'), 1, 55, 1763.71, 97003.74, 0), -- NDOH35034: 50 HBA1C TEST STRIPS
    ((SELECT Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN160219'), 5, 0, 0.00, 0.00, 0),          -- NDOH35036: QUALITY CONTROL SOLUTION HBA1C
    ((SELECT Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN160219'), 6, 16, 24.10, 385.67, 0);     -- NDOH35037: QUALITY CONTROL SOLUTION GLUCOSE

-- Verify
SELECT 'Sale created:' AS Status, COUNT(*) AS Count FROM [dbo].[Sale] WHERE SaleNumber = 'IN160219';
SELECT 'Items added:' AS Status, COUNT(*) AS Count FROM [dbo].[SaleItem] WHERE [SaleId] = (SELECT Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN160219');
SELECT s.SaleNumber, si.Quantity, ii.Name FROM [dbo].[SaleItem] si
JOIN [dbo].[Sale] s ON si.SaleId = s.Id
JOIN [dbo].[InventoryItem] ii ON si.InventoryItemId = ii.Id
WHERE s.SaleNumber = 'IN160219';
