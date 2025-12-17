-- Insert SaleItems for Glucose Battery (NDOH35016) and Glucose Test Strips (NDOH35017)
-- Run AFTER insert-glucose-battery-strips-batch.sql

-- Get the InventoryItem ID for NDOH35017
SELECT [Id], [SKU], [Name] FROM [dbo].[InventoryItem] 
WHERE [SKU] IN ('NDOH35016', 'NDOH35017');

-- GLUCOSE METER BATTERY (NDOH35016) SaleItems
-- Using SKU lookup for the InventoryItemId
INSERT INTO [dbo].[SaleItem]
    ([SaleId], [InventoryItemId], [Quantity], [UnitPrice], [TotalPrice], [IsDeleted])
VALUES 
    -- TAMBO MEMORIAL HOSPITAL - $0.00 value (bundled/free)
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156573' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35016'), 0, 0.00, 0.00, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156586' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35016'), 0, 0.00, 0.00, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156729' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35016'), 0, 0.00, 0.00, 0),
    -- MERAFONG SUB DISTRICT
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158578' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35016'), 710, 7.23, 5130.52, 0),
    -- MP HEALTH AMAJUBA HOSPITAL
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156410' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35016'), 50, 7.23, 361.30, 0);

PRINT 'Glucose Battery items inserted';

-- GLUCOSE TEST STRIPS (NDOH35017) SaleItems
INSERT INTO [dbo].[SaleItem]
    ([SaleId], [InventoryItemId], [Quantity], [UnitPrice], [TotalPrice], [IsDeleted])
VALUES 
    -- Department of Health Amajuba District
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN159234' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 10, 44.84, 448.44, 0),
    -- E.G & USHER MEMORIAL HOSPITAL
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157725' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 200, 44.84, 8968.69, 0),
    -- LADYSMITH REGIONAL HOSPITAL
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158069' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 350, 44.84, 15695.22, 0),
    -- PROVINCIAL PHARM SUPPLY DEPOT - Various prices
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN152614' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 70, 89.13, 6239.13, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN152617' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 200, 89.13, 17826.09, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN152622' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 300, 89.13, 26739.13, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN152634' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 700, 89.13, 62391.30, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN152635' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 300, 89.13, 26739.13, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN152644' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 89.13, 89130.43, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN152831' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 2600, 51.57, 134082.00, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN152898' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 200, 51.57, 10314.00, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN152977' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 740, 51.57, 38161.80, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN152978' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 80, 89.13, 7130.43, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN152980' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 200, 51.57, 10314.00, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN153205' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 120, 51.57, 6188.40, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN153458' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 3000, 44.84, 134530.43, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN153714' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 10, 44.84, 448.43, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN153715' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 20, 44.84, 896.87, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN153716' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 200, 44.84, 8968.69, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN153889' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1500, 44.84, 67265.22, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN154080' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 400, 44.84, 17937.39, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN154132' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1200, 44.84, 53812.17, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN154502' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 300, 44.84, 13453.04, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN154503' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN154556' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1500, 44.84, 67265.22, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN154622' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 500, 44.84, 22421.74, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN154623' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 500, 44.84, 22421.74, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN154690' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 600, 44.84, 26906.09, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN154770' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 490, 44.84, 21973.30, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN154781' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 100, 44.84, 4484.35, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN154910' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 480, 44.84, 21524.87, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN155123' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN155473' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 3000, 44.84, 134530.43, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN155886' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 500, 89.13, 44565.22, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156185' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 650, 44.84, 29148.26, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156223' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 300, 44.84, 13453.04, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156224' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 350, 44.84, 15695.22, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156225' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 300, 44.84, 13453.04, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156226' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 50, 44.84, 2242.17, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156227' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 10, 44.84, 448.43, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156250' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1400, 44.84, 62780.87, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156477' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156833' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 500, 44.84, 22421.74, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156834' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156852' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 480, 44.84, 21524.87, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156890' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1250, 44.84, 56054.35, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156978' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 150, 44.84, 6726.52, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156979' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 200, 44.84, 8968.69, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156980' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 800, 44.84, 35874.78, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156981' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 500, 44.84, 22421.74, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157131' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 300, 44.84, 13453.04, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157132' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 50, 44.84, 2242.17, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157198' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157234' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157236' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157274' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 300, 44.84, 13453.04, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157326' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 30, 44.84, 1345.30, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157327' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 50, 44.84, 2242.17, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157368' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 365, 44.84, 16367.87, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157369' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 100, 44.84, 4484.35, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157481' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 400, 44.84, 17937.39, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157721' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 200, 44.84, 8968.69, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157795' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1200, 44.84, 53812.17, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157948' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1350, 44.84, 60538.69, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157949' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 74, 44.84, 3318.42, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158027' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 70, 44.84, 3139.04, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158028' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 250, 44.84, 11210.87, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158064' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 25, 44.84, 1121.09, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158067' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 100, 44.84, 4484.35, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158068' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 100, 44.84, 4484.35, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158149' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 3750, 44.84, 168163.04, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158155' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 200, 44.84, 8968.69, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158222' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 4000, 44.84, 179373.91, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158245' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 100, 44.84, 4484.35, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158246' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 400, 44.84, 17937.39, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158247' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 200, 44.84, 8968.69, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158248' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 400, 44.84, 17937.39, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158249' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 80, 44.84, 3587.48, 0);

-- Verification queries
SELECT 'Glucose Battery Items (NDOH35016):' AS Status, COUNT(*) AS Count 
FROM [dbo].[SaleItem] si
JOIN [dbo].[InventoryItem] ii ON si.InventoryItemId = ii.Id
WHERE ii.SKU = 'NDOH35016';

SELECT 'Glucose Test Strips Items (NDOH35017):' AS Status, COUNT(*) AS Count 
FROM [dbo].[SaleItem] si
JOIN [dbo].[InventoryItem] ii ON si.InventoryItemId = ii.Id
WHERE ii.SKU = 'NDOH35017';

-- Total value check
SELECT 'Total Value Glucose Test Strips:' AS Status, SUM(si.TotalPrice) AS TotalValue 
FROM [dbo].[SaleItem] si
JOIN [dbo].[InventoryItem] ii ON si.InventoryItemId = ii.Id
WHERE ii.SKU = 'NDOH35017';
