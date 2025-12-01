-- ============================================
-- Add Missing Columns to TrainingSession Table
-- Run this BEFORE the seeder script
-- ============================================

-- Add EndDate column
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('TrainingSession') AND name = 'EndDate')
BEGIN
    ALTER TABLE TrainingSession ADD EndDate DATETIME NULL;
    PRINT 'Added EndDate column';
END
ELSE
    PRINT 'EndDate column already exists';

-- Add Hospital column
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('TrainingSession') AND name = 'Hospital')
BEGIN
    ALTER TABLE TrainingSession ADD Hospital NVARCHAR(255) NULL;
    PRINT 'Added Hospital column';
END
ELSE
    PRINT 'Hospital column already exists';

-- Add TrainingObjectives column
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('TrainingSession') AND name = 'TrainingObjectives')
BEGIN
    ALTER TABLE TrainingSession ADD TrainingObjectives NVARCHAR(MAX) NULL;
    PRINT 'Added TrainingObjectives column';
END
ELSE
    PRINT 'TrainingObjectives column already exists';

-- Add TrainingMaterials column
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('TrainingSession') AND name = 'TrainingMaterials')
BEGIN
    ALTER TABLE TrainingSession ADD TrainingMaterials NVARCHAR(MAX) NULL;
    PRINT 'Added TrainingMaterials column';
END
ELSE
    PRINT 'TrainingMaterials column already exists';

PRINT '';
PRINT 'Migration complete! You can now run the seeder script.';
