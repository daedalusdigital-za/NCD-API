-- Fix Sale.CreatedBy NULL values causing API 400 error
-- Run in Azure Data Studio against MedicalManagementDB

-- Step 1: Check how many records have NULL CreatedBy
SELECT 'Sales with NULL CreatedBy' as Issue, COUNT(*) as Count
FROM Sale WHERE CreatedBy IS NULL;

-- Step 2: Update NULL values to 0 (system user)
UPDATE Sale
SET CreatedBy = 0
WHERE CreatedBy IS NULL;

-- Step 3: Verify the fix
SELECT 'Sales with NULL CreatedBy after fix' as Issue, COUNT(*) as Count
FROM Sale WHERE CreatedBy IS NULL;

PRINT 'Fix complete! CreatedBy NULL values have been set to 0.';
