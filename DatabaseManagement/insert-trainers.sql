-- Insert 5 trainers into the Trainers table
-- ProvinceId references: 1=Gauteng, 2=KwaZulu-Natal, 3=Eastern Cape, 4=Western Cape, 5=Limpopo, 
--                        6=Mpumalanga, 7=North West, 8=Free State, 9=Northern Cape
-- Status: 'Active', 'Inactive', or 'On Leave'

-- Trainer 1: Dr. Thandi Nkosi (Gauteng)
INSERT INTO [dbo].[Trainers] 
    ([Name], [Email], [Phone], [ProvinceId], [Status], [Location], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy])
VALUES 
    ('Dr. Thandi Nkosi', 'thandi.nkosi@health.gov.za', '011-555-1234', 1, 'Active', 'Johannesburg', GETDATE(), NULL, 1, NULL);

-- Trainer 2: Mr. Sipho Dlamini (KwaZulu-Natal)
INSERT INTO [dbo].[Trainers] 
    ([Name], [Email], [Phone], [ProvinceId], [Status], [Location], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy])
VALUES 
    ('Mr. Sipho Dlamini', 'sipho.dlamini@health.gov.za', '031-555-2345', 2, 'Active', 'Durban', GETDATE(), NULL, 1, NULL);

-- Trainer 3: Mrs. Zanele Mbatha (Western Cape)
INSERT INTO [dbo].[Trainers] 
    ([Name], [Email], [Phone], [ProvinceId], [Status], [Location], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy])
VALUES 
    ('Mrs. Zanele Mbatha', 'zanele.mbatha@health.gov.za', '021-555-3456', 4, 'Active', 'Cape Town', GETDATE(), NULL, 1, NULL);

-- Trainer 4: Dr. Lerato Mokoena (Limpopo)
INSERT INTO [dbo].[Trainers] 
    ([Name], [Email], [Phone], [ProvinceId], [Status], [Location], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy])
VALUES 
    ('Dr. Lerato Mokoena', 'lerato.mokoena@health.gov.za', '015-555-4567', 5, 'Active', 'Polokwane', GETDATE(), NULL, 1, NULL);

-- Trainer 5: Mr. Andile Van Der Merwe (Free State)
INSERT INTO [dbo].[Trainers] 
    ([Name], [Email], [Phone], [ProvinceId], [Status], [Location], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy])
VALUES 
    ('Mr. Andile Van Der Merwe', 'andile.vandermerwe@health.gov.za', '051-555-5678', 8, 'Active', 'Bloemfontein', GETDATE(), NULL, 1, NULL);

-- Verify the inserts
SELECT 
    t.Id,
    t.Name,
    t.Email,
    t.Phone,
    p.Name as Province,
    t.Location,
    t.Status,
    t.CreatedAt
FROM [dbo].[Trainers] t
LEFT JOIN [dbo].[Provinces] p ON t.ProvinceId = p.Id
ORDER BY t.Id DESC;
