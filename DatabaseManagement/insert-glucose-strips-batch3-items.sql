-- Insert SaleItems for Glucose Test Strips (NDOH35017) - Batch 3
-- Run AFTER insert-glucose-strips-batch3.sql

-- PROVINCIAL PHARM SUPPLY DEPOT Items
INSERT INTO [dbo].[SaleItem]
    ([SaleId], [InventoryItemId], [Quantity], [UnitPrice], [TotalPrice], [IsDeleted])
VALUES 
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158365' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 100, 44.84, 4484.35, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158406' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158449' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 50, 89.13, 4456.52, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158450' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 2000, 44.84, 89686.96, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158518' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1200, 44.84, 53812.17, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158585' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 4000, 44.84, 179373.91, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158689' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 600, 44.84, 26906.09, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158728' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 200, 44.84, 8968.69, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158729' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 100, 44.84, 4484.35, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158730' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1400, 44.84, 62780.87, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158731' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 294, 44.84, 13183.98, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158732' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158733' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 3000, 44.84, 134530.43, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158929' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158930' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 2000, 44.84, 89686.96, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158931' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 800, 44.84, 35874.78, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158932' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 400, 44.84, 17937.39, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158933' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 800, 44.84, 35874.78, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158934' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1228, 44.84, 55067.79, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158935' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 2000, 44.84, 89686.96, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158936' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 600, 44.84, 26906.09, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158992' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 10000, 44.84, 448434.78, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158993' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 200, 44.84, 8968.69, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158994' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 500, 44.84, 22421.74, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN159023' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 60, 44.84, 2690.61, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN159024' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 50, 44.84, 2242.17, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN159025' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 250, 44.84, 11210.87, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN159027' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN159139' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 218, 44.84, 9775.88, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN159140' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 200, 44.84, 8968.69, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN159141' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 600, 44.84, 26906.09, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN159151' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 400, 44.84, 17937.39, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN159153' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 11, 44.84, 493.28, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN159238' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 300, 44.84, 13453.04, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN159242' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 5000, 44.84, 224217.39, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN159267' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 300, 44.84, 13453.04, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN159418' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0);

PRINT 'Provincial Pharm Supply Depot items inserted (37 records)';

-- RK KHAN HOSPITAL
INSERT INTO [dbo].[SaleItem]
    ([SaleId], [InventoryItemId], [Quantity], [UnitPrice], [TotalPrice], [IsDeleted])
VALUES 
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN152563' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1400, 44.84, 62780.87, 0);

PRINT 'RK Khan Hospital item inserted';

-- DEPARTMENT OF HEALTH LIMPOPO
INSERT INTO [dbo].[SaleItem]
    ([SaleId], [InventoryItemId], [Quantity], [UnitPrice], [TotalPrice], [IsDeleted])
VALUES 
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN154167' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 10000, 44.84, 448434.78, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156583' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 10000, 44.84, 448434.78, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156584' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 300, 44.84, 13453.04, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157896' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 6000, 44.84, 269060.87, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157898' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157946' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 6000, 44.84, 269060.87, 0);

PRINT 'Department of Health Limpopo items inserted (6 records)';

-- MANKWENG HOSPITAL PHARMACY
INSERT INTO [dbo].[SaleItem]
    ([SaleId], [InventoryItemId], [Quantity], [UnitPrice], [TotalPrice], [IsDeleted])
VALUES 
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156937' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 500, 44.84, 22421.74, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157894' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1500, 44.84, 67265.22, 0);

PRINT 'Mankweng Hospital items inserted (2 records)';

-- BLOEMFONTEIN MEDICAL DEPOT
INSERT INTO [dbo].[SaleItem]
    ([SaleId], [InventoryItemId], [Quantity], [UnitPrice], [TotalPrice], [IsDeleted])
VALUES 
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN152427' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 2400, 44.84, 107624.35, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN152773' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 300, 44.84, 13453.04, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN153153' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 600, 44.84, 26906.09, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN153195' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 4000, 44.84, 179373.91, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN153290' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 2000, 44.84, 89686.96, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN155259' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 480, 44.84, 21524.87, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156475' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 200, 44.84, 8968.69, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156528' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1920, 44.84, 86099.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157921' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 100, 44.84, 4484.35, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157922' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 40, 44.84, 1793.74, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157926' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 600, 44.84, 26906.09, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157928' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 160, 44.84, 7174.96, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157930' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 120, 44.84, 5381.22, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157931' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1200, 44.84, 53812.17, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157934' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 30, 44.84, 1345.30, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157935' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 30, 44.84, 1345.30, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158573' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 156, 44.84, 6995.58, 0);

PRINT 'Bloemfontein Medical Depot items inserted (17 records)';

-- FREE STATE HEALTH FACILITIES
INSERT INTO [dbo].[SaleItem]
    ([SaleId], [InventoryItemId], [Quantity], [UnitPrice], [TotalPrice], [IsDeleted])
VALUES 
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158144' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1, 51.57, 51.57, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN155593' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 200, 44.84, 8968.69, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158306' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1260, 44.84, 56502.78, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157482' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 200, 44.84, 8968.70, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN155418' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 100, 44.84, 4484.35, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN155219' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 480, 44.84, 21524.87, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156529' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 138, 44.84, 6188.40, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156503' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 200, 44.84, 8968.69, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157932' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 800, 44.84, 35874.78, 0);

PRINT 'Free State Health facilities items inserted (9 records)';

-- EASTERN CAPE
INSERT INTO [dbo].[SaleItem]
    ([SaleId], [InventoryItemId], [Quantity], [UnitPrice], [TotalPrice], [IsDeleted])
VALUES 
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156500' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 399, 44.84, 17892.55, 0);

PRINT 'Eastern Cape item inserted';

-- GAUTENG HOSPITALS - Part 1
INSERT INTO [dbo].[SaleItem]
    ([SaleId], [InventoryItemId], [Quantity], [UnitPrice], [TotalPrice], [IsDeleted])
VALUES 
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158997' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 4, 51.57, 206.28, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158811' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN155213' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 400, 44.84, 17937.39, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156576' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1600, 44.84, 71749.57, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN155263' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 7160, 44.84, 321079.30, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157874' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 3000, 44.84, 134530.43, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158890' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 2621, 44.84, 117534.76, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN155985' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1500, 44.84, 67265.22, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157869' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1500, 44.84, 67265.22, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158877' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 2000, 44.84, 89686.96, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158810' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 2000, 44.84, 89686.96, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156587' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 3000, 44.84, 134530.43, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157888' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1500, 44.84, 67265.22, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158886' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN159460' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 400, 44.84, 17937.39, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156786' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 500, 44.84, 22421.74, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157879' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 500, 44.84, 22421.74, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157878' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 2500, 44.84, 112108.69, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158876' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 2000, 44.84, 89686.96, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN155929' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1500, 44.84, 67265.22, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156497' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157885' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1500, 44.84, 67265.22, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158372' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 2000, 44.84, 89686.96, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN155217' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 200, 44.84, 8968.69, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156502' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 800, 44.84, 35874.78, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158881' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.47, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156077' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 600, 44.84, 26906.09, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157870' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158887' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1400, 44.84, 62780.87, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN155258' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1200, 44.84, 53812.17, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156580' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 2000, 44.84, 89686.96, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157883' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158812' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1800, 44.84, 80718.26, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158882' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 800, 44.84, 35874.78, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156478' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 150, 44.84, 6726.52, 0);

PRINT 'Gauteng hospitals Part 1 items inserted (35 records)';

-- GAUTENG HOSPITALS - Part 2
INSERT INTO [dbo].[SaleItem]
    ([SaleId], [InventoryItemId], [Quantity], [UnitPrice], [TotalPrice], [IsDeleted])
VALUES 
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN155215' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 2000, 44.84, 89686.96, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156575' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157360' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 500, 44.84, 22421.74, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157893' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1500, 44.84, 67265.22, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN155212' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 240, 44.84, 10762.43, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156578' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 960, 44.84, 43049.74, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156788' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 2000, 44.84, 89686.96, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157875' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 3000, 44.84, 134530.43, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158893' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 3000, 44.84, 134530.43, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN155216' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 300, 44.84, 13453.04, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156950' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 500, 44.84, 22421.74, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157880' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158892' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 500, 44.84, 22421.74, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157262' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 150, 44.84, 6726.52, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN155218' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 600, 44.84, 26906.09, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156582' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 2400, 44.84, 107624.35, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156574' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 800, 44.84, 35874.78, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156588' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157884' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 3000, 44.84, 134530.43, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158889' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 2000, 44.84, 89686.96, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156804' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157359' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 500, 44.84, 22421.74, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157892' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1500, 44.84, 67265.22, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158884' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156843' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 360, 44.84, 16143.65, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156977' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1640, 44.84, 73543.31, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN154817' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 20, 44.84, 896.87, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN155211' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 396, 44.84, 17758.02, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156501' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1584, 44.84, 71032.07, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158880' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 500, 44.84, 22421.74, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158879' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 160, 44.84, 7174.96, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN156801' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 700, 44.84, 31390.43, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN157891' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 1000, 44.84, 44843.48, 0),
    ((SELECT TOP 1 Id FROM [dbo].[Sale] WHERE SaleNumber = 'IN158885' ORDER BY Id DESC), 
     (SELECT [Id] FROM [dbo].[InventoryItem] WHERE [SKU] = 'NDOH35017'), 800, 44.84, 35874.78, 0);

PRINT 'Gauteng hospitals Part 2 items inserted (34 records)';

-- Verification queries
SELECT 'Total SaleItems inserted in Batch 3:' AS Status, COUNT(*) AS Count 
FROM [dbo].[SaleItem] si
JOIN [dbo].[Sale] s ON si.SaleId = s.Id
WHERE s.SaleNumber IN (
    'IN158365','IN158406','IN158449','IN158450','IN158518','IN158585','IN158689','IN158728',
    'IN158729','IN158730','IN158731','IN158732','IN158733','IN158929','IN158930','IN158931',
    'IN158932','IN158933','IN158934','IN158935','IN158936','IN158992','IN158993','IN158994',
    'IN159023','IN159024','IN159025','IN159027','IN159139','IN159140','IN159141','IN159151',
    'IN159153','IN159238','IN159242','IN159267','IN159418','IN152563','IN154167','IN156583',
    'IN156584','IN157896','IN157898','IN157946','IN156937','IN157894','IN152427','IN152773',
    'IN153153','IN153195','IN153290','IN155259','IN156475','IN156528','IN157921','IN157922',
    'IN157926','IN157928','IN157930','IN157931','IN157934','IN157935','IN158573','IN158144',
    'IN155593','IN158306','IN157482','IN155418','IN155219','IN156529','IN156503','IN157932',
    'IN156500','IN158997','IN158811','IN155213','IN156576','IN155263','IN157874','IN158890',
    'IN155985','IN157869','IN158877','IN158810','IN156587','IN157888','IN158886','IN159460',
    'IN156786','IN157879','IN157878','IN158876','IN155929','IN156497','IN157885','IN158372',
    'IN155217','IN156502','IN158881','IN156077','IN157870','IN158887','IN155258','IN156580',
    'IN157883','IN158812','IN158882','IN156478','IN155215','IN156575','IN157360','IN157893',
    'IN155212','IN156578','IN156788','IN157875','IN158893','IN155216','IN156950','IN157880',
    'IN158892','IN157262','IN155218','IN156582','IN156574','IN156588','IN157884','IN158889',
    'IN156804','IN157359','IN157892','IN158884','IN156843','IN156977','IN154817','IN155211',
    'IN156501','IN158880','IN158879','IN156801','IN157891','IN158885'
);
