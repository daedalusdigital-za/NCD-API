-- Diagnostic query to check Sale table schema
-- Run this in Azure Data Studio to verify column structure

-- Check Sale table columns
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Sale'
ORDER BY ORDINAL_POSITION;

-- Check if CreatedBy column exists and its type
SELECT 
    c.name AS ColumnName,
    t.name AS DataType,
    c.is_nullable AS IsNullable,
    c.max_length AS MaxLength
FROM sys.columns c
JOIN sys.types t ON c.user_type_id = t.user_type_id
WHERE c.object_id = OBJECT_ID('dbo.Sale')
ORDER BY c.column_id;

-- Try a simple select to see if the query works
SELECT TOP 5 * FROM [dbo].[Sale];
