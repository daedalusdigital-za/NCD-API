-- =============================================================================
-- Check Trainer Table Schema
-- =============================================================================

SET NOCOUNT ON;

PRINT '═══════════════════════════════════════════════════════════════';
PRINT '  Trainer Table Schema Check';
PRINT '═══════════════════════════════════════════════════════════════';

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Trainer]') AND type in (N'U'))
BEGIN
    PRINT 'Trainer table exists.';
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
    WHERE c.object_id = OBJECT_ID(N'[dbo].[Trainer]')
    ORDER BY c.column_id;
    
    PRINT '';
    PRINT 'Sample Data:';
    PRINT '─────────────────────────────────────────────────────────────';
    SELECT TOP 5 * FROM [dbo].[Trainer];
END
ELSE
BEGIN
    PRINT 'Trainer table does NOT exist!';
END

PRINT '';
PRINT '═══════════════════════════════════════════════════════════════';
