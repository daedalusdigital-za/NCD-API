-- =============================================================================
-- Fix All NULL Values in Sale Table
-- =============================================================================
-- Fixes CreatedBy, CustomerName, and other potential NULL issues
-- =============================================================================

SET NOCOUNT ON;

PRINT '════════════════════════════════════════════════════════════════';
PRINT '  Checking and Fixing NULL Values in Sale Table';
PRINT '════════════════════════════════════════════════════════════════';

-- Step 1: Check current NULL counts
PRINT '';
PRINT 'CURRENT NULL COUNTS:';
SELECT 'CreatedBy NULL' AS Issue, COUNT(*) AS Count FROM Sale WHERE CreatedBy IS NULL
UNION ALL
SELECT 'CustomerName NULL', COUNT(*) FROM Sale WHERE CustomerName IS NULL
UNION ALL
SELECT 'SaleNumber NULL', COUNT(*) FROM Sale WHERE SaleNumber IS NULL
UNION ALL
SELECT 'Notes NULL', COUNT(*) FROM Sale WHERE Notes IS NULL;

-- Step 2: Fix CreatedBy NULL values
PRINT '';
PRINT 'Fixing CreatedBy NULL values...';
UPDATE Sale SET CreatedBy = 1 WHERE CreatedBy IS NULL;
PRINT '  ✓ Updated ' + CAST(@@ROWCOUNT AS NVARCHAR(10)) + ' records';

-- Step 3: Fix CustomerName NULL values
PRINT '';
PRINT 'Fixing CustomerName NULL values...';
UPDATE Sale SET CustomerName = 'Unknown' WHERE CustomerName IS NULL;
PRINT '  ✓ Updated ' + CAST(@@ROWCOUNT AS NVARCHAR(10)) + ' records';

-- Step 4: Fix SaleNumber NULL values
PRINT '';
PRINT 'Fixing SaleNumber NULL values...';
UPDATE Sale SET SaleNumber = 'INV-' + CAST(Id AS NVARCHAR(10)) WHERE SaleNumber IS NULL;
PRINT '  ✓ Updated ' + CAST(@@ROWCOUNT AS NVARCHAR(10)) + ' records';

-- Step 5: Fix Notes NULL (set to empty string if needed by API)
PRINT '';
PRINT 'Fixing Notes NULL values...';
UPDATE Sale SET Notes = '' WHERE Notes IS NULL;
PRINT '  ✓ Updated ' + CAST(@@ROWCOUNT AS NVARCHAR(10)) + ' records';

-- Step 6: Verify the fix
PRINT '';
PRINT '════════════════════════════════════════════════════════════════';
PRINT '  VERIFICATION - All counts should be 0';
PRINT '════════════════════════════════════════════════════════════════';
SELECT 'CreatedBy NULL' AS Issue, COUNT(*) AS Count FROM Sale WHERE CreatedBy IS NULL
UNION ALL
SELECT 'CustomerName NULL', COUNT(*) FROM Sale WHERE CustomerName IS NULL
UNION ALL
SELECT 'SaleNumber NULL', COUNT(*) FROM Sale WHERE SaleNumber IS NULL
UNION ALL
SELECT 'Notes NULL', COUNT(*) FROM Sale WHERE Notes IS NULL;

PRINT '';
PRINT '✅ Fix complete!';
