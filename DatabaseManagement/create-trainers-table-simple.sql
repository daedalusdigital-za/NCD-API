-- Create Trainers table WITHOUT foreign key constraint
-- Use this if Provinces table doesn't exist yet

-- Create Trainers table
CREATE TABLE [dbo].[Trainers] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Name] NVARCHAR(255) NULL,
    [Email] NVARCHAR(255) NULL,
    [Phone] NVARCHAR(50) NULL,
    [ProvinceId] INT NULL,
    [Qualification] NVARCHAR(MAX) NULL,
    [Experience] NVARCHAR(MAX) NULL,
    [Status] INT NOT NULL DEFAULT 1,
    [Location] NVARCHAR(255) NULL,
    [Bio] NVARCHAR(MAX) NULL,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
    [UpdatedAt] DATETIME NULL,
    [CreatedBy] INT NOT NULL DEFAULT 0,
    [UpdatedBy] INT NULL
);

-- Create indexes for better performance
CREATE INDEX [IX_Trainers_ProvinceId] ON [dbo].[Trainers] ([ProvinceId]);
CREATE INDEX [IX_Trainers_Status] ON [dbo].[Trainers] ([Status]);
CREATE INDEX [IX_Trainers_Email] ON [dbo].[Trainers] ([Email]);

-- Verify table was created
SELECT 
    c.name AS ColumnName,
    t.name AS DataType,
    c.max_length AS MaxLength,
    c.is_nullable AS IsNullable,
    c.is_identity AS IsIdentity,
    dc.definition AS DefaultValue
FROM sys.columns c
INNER JOIN sys.types t ON c.user_type_id = t.user_type_id
LEFT JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id
WHERE c.object_id = OBJECT_ID(N'[dbo].[Trainers]')
ORDER BY c.column_id;

SELECT 'Trainers table created successfully!' AS Result;
