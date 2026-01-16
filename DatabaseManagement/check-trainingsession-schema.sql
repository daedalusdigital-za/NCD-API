-- =============================================================================
-- Check TrainingSession Table Schema
-- =============================================================================
-- Run this to see the actual columns in your TrainingSession table
-- =============================================================================

SET NOCOUNT ON;

PRINT '═══════════════════════════════════════════════════════════════';
PRINT '  TrainingSession Table Schema Check';
PRINT '═══════════════════════════════════════════════════════════════';

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TrainingSession]') AND type in (N'U'))
BEGIN
    PRINT 'TrainingSession table exists.';
    PRINT '';
    PRINT 'Current Columns:';
    PRINT '─────────────────────────────────────────────────────────────';
    
    SELECT 
        c.name AS ColumnName,
        t.name AS DataType,
        c.max_length AS MaxLength,
        c.is_nullable AS IsNullable,
        c.is_identity AS IsIdentity,
        ISNULL(dc.definition, '') AS DefaultValue
    FROM sys.columns c
    INNER JOIN sys.types t ON c.user_type_id = t.user_type_id
    LEFT JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id
    WHERE c.object_id = OBJECT_ID(N'[dbo].[TrainingSession]')
    ORDER BY c.column_id;
END
ELSE
BEGIN
    PRINT 'TrainingSession table does NOT exist!';
END

PRINT '';
PRINT '═══════════════════════════════════════════════════════════════';
