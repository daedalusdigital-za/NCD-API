-- Add missing audit columns to Trainers table
-- This allows Trainer entity to work with BaseModel<int>

USE MedicalManagementDB;
GO

-- Check if columns don't exist before adding
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Trainers]') AND name = 'CreatedBy')
BEGIN
    ALTER TABLE [dbo].[Trainers]
    ADD [CreatedBy] INT NOT NULL DEFAULT 0;
    
    PRINT 'CreatedBy column added successfully';
END
ELSE
BEGIN
    PRINT 'CreatedBy column already exists';
END
GO

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Trainers]') AND name = 'UpdatedBy')
BEGIN
    ALTER TABLE [dbo].[Trainers]
    ADD [UpdatedBy] INT NULL;
    
    PRINT 'UpdatedBy column added successfully';
END
ELSE
BEGIN
    PRINT 'UpdatedBy column already exists';
END
GO

-- Verify columns were added
SELECT 
    c.name AS ColumnName,
    t.name AS DataType,
    c.is_nullable AS IsNullable,
    dc.definition AS DefaultValue
FROM sys.columns c
INNER JOIN sys.types t ON c.user_type_id = t.user_type_id
LEFT JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id
WHERE c.object_id = OBJECT_ID(N'[dbo].[Trainers]')
AND c.name IN ('CreatedBy', 'UpdatedBy', 'CreatedAt', 'UpdatedAt')
ORDER BY c.column_id;
GO
