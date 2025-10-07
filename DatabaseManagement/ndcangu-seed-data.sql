-- NDCANGU Features Initial Data Seeding Script
-- Contains seed data for Training, Inventory, Sales, and Location modules

-- ==================================================
-- LOCATION DATA: South African Provinces, Districts, and Healthcare Facilities
-- ==================================================

-- Insert Provinces
INSERT INTO [dbo].[Province] ([Id], [Name], [Code], [IsDeleted], [CreatedDate], [CreatedBy]) VALUES 
(1, 'Eastern Cape', 'EC', 0, GETDATE(), 1),
(2, 'Free State', 'FS', 0, GETDATE(), 1),
(3, 'Gauteng', 'GP', 0, GETDATE(), 1),
(4, 'KwaZulu-Natal', 'KZN', 0, GETDATE(), 1),
(5, 'Limpopo', 'LP', 0, GETDATE(), 1),
(6, 'Mpumalanga', 'MP', 0, GETDATE(), 1),
(7, 'Northern Cape', 'NC', 0, GETDATE(), 1),
(8, 'North West', 'NW', 0, GETDATE(), 1),
(9, 'Western Cape', 'WC', 0, GETDATE(), 1);

-- Insert Districts for Gauteng (Province ID 3)
INSERT INTO [dbo].[District] ([Id], [Name], [ProvinceId], [IsDeleted], [CreatedDate], [CreatedBy]) VALUES
(1, 'City of Johannesburg Metropolitan Municipality', 3, 0, GETDATE(), 1),
(2, 'City of Tshwane Metropolitan Municipality', 3, 0, GETDATE(), 1),
(3, 'Ekurhuleni Metropolitan Municipality', 3, 0, GETDATE(), 1),
(4, 'West Rand District Municipality', 3, 0, GETDATE(), 1),
(5, 'Sedibeng District Municipality', 3, 0, GETDATE(), 1);

-- Insert Districts for KwaZulu-Natal (Province ID 4)
INSERT INTO [dbo].[District] ([Id], [Name], [ProvinceId], [IsDeleted], [CreatedDate], [CreatedBy]) VALUES
(6, 'eThekwini Metropolitan Municipality', 4, 0, GETDATE(), 1),
(7, 'iLembe District Municipality', 4, 0, GETDATE(), 1),
(8, 'uMgungundlovu District Municipality', 4, 0, GETDATE(), 1),
(9, 'Ugu District Municipality', 4, 0, GETDATE(), 1),
(10, 'uThukela District Municipality', 4, 0, GETDATE(), 1);

-- Insert Districts for Western Cape (Province ID 9)
INSERT INTO [dbo].[District] ([Id], [Name], [ProvinceId], [IsDeleted], [CreatedDate], [CreatedBy]) VALUES
(11, 'City of Cape Town Metropolitan Municipality', 9, 0, GETDATE(), 1),
(12, 'Cape Winelands District Municipality', 9, 0, GETDATE(), 1),
(13, 'Central Karoo District Municipality', 9, 0, GETDATE(), 1),
(14, 'Eden District Municipality', 9, 0, GETDATE(), 1),
(15, 'Overberg District Municipality', 9, 0, GETDATE(), 1),
(16, 'West Coast District Municipality', 9, 0, GETDATE(), 1);

-- Insert Healthcare Facilities (Hospitals)
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
(10, 'Red Cross War Memorial Children''s Hospital', 'Rondebosch, Cape Town', '+27 21 658 5111', 'info@redcross.co.za', 285, 3, 11, 0, GETDATE(), 1);

-- ==================================================
-- TRAINING DATA: Sample Training Sessions and Trainers
-- ==================================================

-- Insert Trainers
INSERT INTO [dbo].[Trainer] ([Id], [FirstName], [LastName], [Email], [Phone], [Specialization], [Experience], [Certification], [IsActive], [IsDeleted], [CreatedDate], [CreatedBy]) VALUES
(1, 'Dr. Sarah', 'Johnson', 'sarah.johnson@health.gov.za', '+27 82 123 4567', 'Non-Communicable Diseases', 15, 'WHO NCD Prevention Certified', 1, 0, GETDATE(), 1),
(2, 'Dr. Thabo', 'Mthembu', 'thabo.mthembu@health.gov.za', '+27 83 234 5678', 'Diabetes Management', 12, 'International Diabetes Federation Certified', 1, 0, GETDATE(), 1),
(3, 'Dr. Nomsa', 'Dlamini', 'nomsa.dlamini@health.gov.za', '+27 84 345 6789', 'Hypertension Control', 18, 'American Heart Association Certified', 1, 0, GETDATE(), 1),
(4, 'Dr. Michael', 'van der Merwe', 'michael.vandermerwe@health.gov.za', '+27 85 456 7890', 'Cardiovascular Disease Prevention', 20, 'European Society of Cardiology Certified', 1, 0, GETDATE(), 1),
(5, 'Dr. Fatima', 'Hassan', 'fatima.hassan@health.gov.za', '+27 86 567 8901', 'Obesity and Lifestyle Medicine', 10, 'American Board of Lifestyle Medicine', 1, 0, GETDATE(), 1);

-- Insert Training Sessions
INSERT INTO [dbo].[TrainingSession] ([Id], [Title], [Description], [TrainerId], [StartDate], [EndDate], [Capacity], [Status], [LocationType], [VenueDetails], [IsDeleted], [CreatedDate], [CreatedBy]) VALUES
(1, 'Diabetes Prevention and Management Workshop', 'Comprehensive training on Type 2 diabetes prevention strategies and management protocols for healthcare workers.', 2, '2024-02-15 09:00:00', '2024-02-15 17:00:00', 50, 1, 1, 'Charlotte Maxeke Hospital - Auditorium A', 0, GETDATE(), 1),
(2, 'Hypertension Screening and Control Training', 'Advanced training on blood pressure measurement techniques, risk assessment, and control strategies.', 3, '2024-02-20 08:30:00', '2024-02-20 16:30:00', 40, 1, 1, 'Steve Biko Hospital - Conference Room 1', 0, GETDATE(), 1),
(3, 'Community-Based NCD Prevention Program', 'Training healthcare workers on implementing community outreach programs for NCD prevention.', 1, '2024-02-25 09:00:00', '2024-02-26 16:00:00', 30, 0, 2, 'Virtual Platform - Zoom Meeting ID: 123-456-7890', 0, GETDATE(), 1),
(4, 'Cardiovascular Risk Assessment Workshop', 'Hands-on training for cardiovascular risk calculation and patient counseling techniques.', 4, '2024-03-05 10:00:00', '2024-03-05 15:00:00', 25, 1, 1, 'Groote Schuur Hospital - Training Center', 0, GETDATE(), 1),
(5, 'Lifestyle Medicine and Obesity Management', 'Evidence-based approaches to lifestyle interventions for obesity and metabolic syndrome.', 5, '2024-03-10 09:00:00', '2024-03-11 17:00:00', 35, 0, 1, 'Inkosi Albert Luthuli Hospital - Education Wing', 0, GETDATE(), 1);

-- ==================================================
-- INVENTORY DATA: Medical Supplies and Equipment
-- ==================================================

-- Insert Inventory Items
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
(10, 'ECG Electrodes', 'Disposable ECG electrodes for cardiac monitoring', 2, 'ECG-010', 'Pack of 10', 28.50, 150, 25, 'CardioMed Equipment', '2025-08-31', 'ECG2024010', 1, 0, GETDATE(), 1);

-- ==================================================
-- SALES DATA: Sample Sales Transactions
-- ==================================================

-- Insert Sales
INSERT INTO [dbo].[Sale] ([Id], [SaleNumber], [SaleDate], [CustomerId], [CustomerName], [CustomerEmail], [CustomerPhone], [Subtotal], [TaxAmount], [Discount], [Total], [PaymentMethod], [PaymentStatus], [DeliveryStatus], [Notes], [IsDeleted], [CreatedDate], [CreatedBy]) VALUES
(1, 'SALE-2024-001', '2024-01-15', 1001, 'Charlotte Maxeke Hospital', 'procurement@cmjah.co.za', '+27 11 488 4911', 3750.00, 562.50, 0.00, 4312.50, 2, 1, 2, 'Monthly medical supplies order for diabetes clinic', 0, GETDATE(), 1),
(2, 'SALE-2024-002', '2024-01-20', 1002, 'Steve Biko Academic Hospital', 'supplies@sbah.co.za', '+27 12 354 1000', 2140.00, 321.00, 100.00, 2361.00, 1, 1, 2, 'Equipment order for new cardiac unit', 0, GETDATE(), 1),
(3, 'SALE-2024-003', '2024-01-25', 1003, 'Groote Schuur Hospital', 'purchasing@gsh.co.za', '+27 21 404 9111', 1280.00, 192.00, 50.00, 1422.00, 2, 1, 1, 'Emergency restocking of test supplies', 0, GETDATE(), 1);

-- Insert Sale Items for Sale 1
INSERT INTO [dbo].[SaleItem] ([Id], [SaleId], [InventoryItemId], [Quantity], [UnitPrice], [TotalPrice], [IsDeleted]) VALUES
(1, 1, 2, 20, 85.50, 1710.00, 0),  -- Glucometer Test Strips
(2, 1, 3, 15, 42.75, 641.25, 0),   -- Disposable Lancets
(3, 1, 6, 12, 125.00, 1500.00, 0); -- Cholesterol Test Kit

-- Insert Sale Items for Sale 2
INSERT INTO [dbo].[SaleItem] ([Id], [SaleId], [InventoryItemId], [Quantity], [UnitPrice], [TotalPrice], [IsDeleted]) VALUES
(4, 2, 1, 1, 1250.00, 1250.00, 0), -- Digital Blood Pressure Monitor
(5, 2, 5, 1, 3200.00, 3200.00, 0); -- Stethoscope - Cardiology

-- Insert Sale Items for Sale 3
INSERT INTO [dbo].[SaleItem] ([Id], [SaleId], [InventoryItemId], [Quantity], [UnitPrice], [TotalPrice], [IsDeleted]) VALUES
(6, 3, 9, 4, 320.00, 1280.00, 0);  -- Pulse Oximeter

-- ==================================================
-- DASHBOARD SUMMARY: This data will be aggregated by the DashboardService
-- ==================================================

PRINT 'NDCANGU Features seeding completed successfully!'
PRINT 'Seeded Data Summary:'
PRINT '- 9 Provinces'
PRINT '- 16 Districts (Gauteng, KZN, Western Cape)'
PRINT '- 10 Major Hospitals'
PRINT '- 5 Trainers with specializations'
PRINT '- 5 Training Sessions scheduled'
PRINT '- 10 Inventory Items with various categories'
PRINT '- 3 Sample Sales with associated items'
PRINT ''
PRINT 'Note: This seed data provides a foundation for testing all NDCANGU API endpoints.'
PRINT 'Additional data can be added through the API endpoints once the system is operational.'