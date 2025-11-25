-- Inspect the actual Trainer table schema
-- Show all columns in the Trainer table with their data types

SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Trainer'
ORDER BY ORDINAL_POSITION;

-- Show row count
SELECT COUNT(*) AS TrainerCount FROM [dbo].[Trainer];

-- Show actual data from Trainer table (first 5 rows with all columns)
SELECT TOP 5 * FROM [dbo].[Trainer];
