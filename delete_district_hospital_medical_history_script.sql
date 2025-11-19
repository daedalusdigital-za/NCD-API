-- =====================================================
-- Script to Delete District, Districts, Hospital, and MedicalHistory Tables
-- Database: Your Azure SQL Database
-- Date: November 19, 2025
-- 
-- WARNING: This script will permanently delete tables and all their data
-- Make sure to backup your database before running this script
-- =====================================================

-- Set error handling
SET NOCOUNT ON;
SET XACT_ABORT ON;

BEGIN TRANSACTION;

BEGIN TRY
    PRINT '========================================';
    PRINT 'Starting deletion of District, Districts, Hospital, and MedicalHistory tables';
    PRINT 'Time: ' + CONVERT(VARCHAR(20), GETDATE(), 120);
    PRINT '========================================';

    -- Step 1: Check if tables exist and show current record counts
    IF OBJECT_ID('dbo.District', 'U') IS NOT NULL
    BEGIN
        DECLARE @DistrictCount INT;
        SELECT @DistrictCount = COUNT(*) FROM dbo.District;
        PRINT 'District table exists with ' + CAST(@DistrictCount AS VARCHAR(10)) + ' records';
    END
    ELSE
    BEGIN
        PRINT 'District table does not exist';
    END

    IF OBJECT_ID('dbo.Districts', 'U') IS NOT NULL
    BEGIN
        DECLARE @DistrictsCount INT;
        SELECT @DistrictsCount = COUNT(*) FROM dbo.Districts;
        PRINT 'Districts table exists with ' + CAST(@DistrictsCount AS VARCHAR(10)) + ' records';
    END
    ELSE
    BEGIN
        PRINT 'Districts table does not exist';
    END

    IF OBJECT_ID('dbo.Hospital', 'U') IS NOT NULL
    BEGIN
        DECLARE @HospitalCount INT;
        SELECT @HospitalCount = COUNT(*) FROM dbo.Hospital;
        PRINT 'Hospital table exists with ' + CAST(@HospitalCount AS VARCHAR(10)) + ' records';
    END
    ELSE
    BEGIN
        PRINT 'Hospital table does not exist';
    END

    IF OBJECT_ID('dbo.Hospitals', 'U') IS NOT NULL
    BEGIN
        DECLARE @HospitalsCount INT;
        SELECT @HospitalsCount = COUNT(*) FROM dbo.Hospitals;
        PRINT 'Hospitals table exists with ' + CAST(@HospitalsCount AS VARCHAR(10)) + ' records';
    END
    ELSE
    BEGIN
        PRINT 'Hospitals table does not exist';
    END

    IF OBJECT_ID('dbo.MedicalHistory', 'U') IS NOT NULL
    BEGIN
        DECLARE @MedicalHistoryCount INT;
        SELECT @MedicalHistoryCount = COUNT(*) FROM dbo.MedicalHistory;
        PRINT 'MedicalHistory table exists with ' + CAST(@MedicalHistoryCount AS VARCHAR(10)) + ' records';
    END
    ELSE
    BEGIN
        PRINT 'MedicalHistory table does not exist';
    END

    PRINT '';
    PRINT 'Step 1: Dropping Foreign Key Constraints...';

    -- Step 2: Drop foreign key constraints from MedicalHistory table first (most dependent)
    IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_MedicalHistory_AspNetUsers_CreatedBy')
    BEGIN
        ALTER TABLE dbo.MedicalHistory DROP CONSTRAINT FK_MedicalHistory_AspNetUsers_CreatedBy;
        PRINT '✓ Dropped FK_MedicalHistory_AspNetUsers_CreatedBy constraint';
    END

    IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_MedicalHistory_AspNetUsers_UpdatedBy')
    BEGIN
        ALTER TABLE dbo.MedicalHistory DROP CONSTRAINT FK_MedicalHistory_AspNetUsers_UpdatedBy;
        PRINT '✓ Dropped FK_MedicalHistory_AspNetUsers_UpdatedBy constraint';
    END

    IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_MedicalHistory_AspNetUsers_RecordedBy')
    BEGIN
        ALTER TABLE dbo.MedicalHistory DROP CONSTRAINT FK_MedicalHistory_AspNetUsers_RecordedBy;
        PRINT '✓ Dropped FK_MedicalHistory_AspNetUsers_RecordedBy constraint';
    END

    IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_MedicalHistory_Patient_PatientId')
    BEGIN
        ALTER TABLE dbo.MedicalHistory DROP CONSTRAINT FK_MedicalHistory_Patient_PatientId;
        PRINT '✓ Dropped FK_MedicalHistory_Patient_PatientId constraint';
    END

    -- Step 3: Drop foreign key constraints from Hospital/Hospitals tables
    IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Hospital_District')
    BEGIN
        ALTER TABLE dbo.Hospital DROP CONSTRAINT FK_Hospital_District;
        PRINT '✓ Dropped FK_Hospital_District constraint';
    END

    IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Hospital_District_DistrictId')
    BEGIN
        ALTER TABLE dbo.Hospital DROP CONSTRAINT FK_Hospital_District_DistrictId;
        PRINT '✓ Dropped FK_Hospital_District_DistrictId constraint';
    END

    IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Hospitals_District')
    BEGIN
        ALTER TABLE dbo.Hospitals DROP CONSTRAINT FK_Hospitals_District;
        PRINT '✓ Dropped FK_Hospitals_District constraint';
    END

    IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Hospitals_Districts_DistrictId')
    BEGIN
        ALTER TABLE dbo.Hospitals DROP CONSTRAINT FK_Hospitals_Districts_DistrictId;
        PRINT '✓ Dropped FK_Hospitals_Districts_DistrictId constraint';
    END

    IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Hospitals_Province_ProvinceId')
    BEGIN
        ALTER TABLE dbo.Hospitals DROP CONSTRAINT FK_Hospitals_Province_ProvinceId;
        PRINT '✓ Dropped FK_Hospitals_Province_ProvinceId constraint';
    END

    -- Step 4: Drop foreign key constraints from Clinics to Districts/District
    IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Clinics_District')
    BEGIN
        ALTER TABLE dbo.Clinics DROP CONSTRAINT FK_Clinics_District;
        PRINT '✓ Dropped FK_Clinics_District constraint';
    END

    IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Clinics_Districts_DistrictId')
    BEGIN
        ALTER TABLE dbo.Clinics DROP CONSTRAINT FK_Clinics_Districts_DistrictId;
        PRINT '✓ Dropped FK_Clinics_Districts_DistrictId constraint';
    END

    -- Step 5: Drop foreign key constraints from Districts/District to Province
    IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_District_Province')
    BEGIN
        ALTER TABLE dbo.District DROP CONSTRAINT FK_District_Province;
        PRINT '✓ Dropped FK_District_Province constraint';
    END

    IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Districts_Province_ProvinceId')
    BEGIN
        ALTER TABLE dbo.Districts DROP CONSTRAINT FK_Districts_Province_ProvinceId;
        PRINT '✓ Dropped FK_Districts_Province_ProvinceId constraint';
    END

    -- Step 6: Drop any other foreign keys that might exist
    DECLARE @sql NVARCHAR(MAX) = '';
    SELECT @sql = @sql + 'ALTER TABLE ' + QUOTENAME(SCHEMA_NAME(fk.schema_id)) + '.' + QUOTENAME(OBJECT_NAME(fk.parent_object_id)) + 
                  ' DROP CONSTRAINT ' + QUOTENAME(fk.name) + '; '
    FROM sys.foreign_keys fk
    WHERE OBJECT_NAME(fk.referenced_object_id) IN ('District', 'Districts', 'Hospital', 'Hospitals', 'MedicalHistory');

    IF LEN(@sql) > 0
    BEGIN
        EXEC sp_executesql @sql;
        PRINT '✓ Dropped additional foreign key constraints referencing target tables';
    END

    PRINT '';
    PRINT 'Step 2: Dropping Indexes...';

    -- Step 7: Drop indexes on MedicalHistory table
    IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_MedicalHistory_CreatedBy' AND object_id = OBJECT_ID('dbo.MedicalHistory'))
    BEGIN
        DROP INDEX IX_MedicalHistory_CreatedBy ON dbo.MedicalHistory;
        PRINT '✓ Dropped IX_MedicalHistory_CreatedBy index';
    END

    IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_MedicalHistory_UpdatedBy' AND object_id = OBJECT_ID('dbo.MedicalHistory'))
    BEGIN
        DROP INDEX IX_MedicalHistory_UpdatedBy ON dbo.MedicalHistory;
        PRINT '✓ Dropped IX_MedicalHistory_UpdatedBy index';
    END

    IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_MedicalHistory_PatientId' AND object_id = OBJECT_ID('dbo.MedicalHistory'))
    BEGIN
        DROP INDEX IX_MedicalHistory_PatientId ON dbo.MedicalHistory;
        PRINT '✓ Dropped IX_MedicalHistory_PatientId index';
    END

    IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_MedicalHistory_RecordedBy' AND object_id = OBJECT_ID('dbo.MedicalHistory'))
    BEGIN
        DROP INDEX IX_MedicalHistory_RecordedBy ON dbo.MedicalHistory;
        PRINT '✓ Dropped IX_MedicalHistory_RecordedBy index';
    END

    -- Step 8: Drop indexes on Hospital/Hospitals tables
    IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_Hospitals_DistrictId' AND object_id = OBJECT_ID('dbo.Hospitals'))
    BEGIN
        DROP INDEX IX_Hospitals_DistrictId ON dbo.Hospitals;
        PRINT '✓ Dropped IX_Hospitals_DistrictId index';
    END

    IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_Hospitals_ProvinceId' AND object_id = OBJECT_ID('dbo.Hospitals'))
    BEGIN
        DROP INDEX IX_Hospitals_ProvinceId ON dbo.Hospitals;
        PRINT '✓ Dropped IX_Hospitals_ProvinceId index';
    END

    -- Step 9: Drop indexes on Districts table
    IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_Districts_ProvinceId' AND object_id = OBJECT_ID('dbo.Districts'))
    BEGIN
        DROP INDEX IX_Districts_ProvinceId ON dbo.Districts;
        PRINT '✓ Dropped IX_Districts_ProvinceId index';
    END

    PRINT '';
    PRINT 'Step 3: Dropping Tables...';

    -- Step 10: Drop tables in dependency order (most dependent first)
    
    -- Drop MedicalHistory first (depends on Patient and Users)
    IF OBJECT_ID('dbo.MedicalHistory', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.MedicalHistory;
        PRINT '✓ Successfully dropped MedicalHistory table';
    END
    ELSE
    BEGIN
        PRINT '- MedicalHistory table was already dropped or does not exist';
    END

    -- Drop Hospital/Hospitals (depends on District/Districts)
    IF OBJECT_ID('dbo.Hospital', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.Hospital;
        PRINT '✓ Successfully dropped Hospital table';
    END
    ELSE
    BEGIN
        PRINT '- Hospital table was already dropped or does not exist';
    END

    IF OBJECT_ID('dbo.Hospitals', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.Hospitals;
        PRINT '✓ Successfully dropped Hospitals table';
    END
    ELSE
    BEGIN
        PRINT '- Hospitals table was already dropped or does not exist';
    END

    -- Drop District/Districts last (least dependent)
    IF OBJECT_ID('dbo.District', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.District;
        PRINT '✓ Successfully dropped District table';
    END
    ELSE
    BEGIN
        PRINT '- District table was already dropped or does not exist';
    END

    IF OBJECT_ID('dbo.Districts', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.Districts;
        PRINT '✓ Successfully dropped Districts table';
    END
    ELSE
    BEGIN
        PRINT '- Districts table was already dropped or does not exist';
    END

    PRINT '';
    PRINT '========================================';
    PRINT 'SUCCESS: All tables have been deleted successfully!';
    PRINT 'Time: ' + CONVERT(VARCHAR(20), GETDATE(), 120);
    PRINT '========================================';

    -- Commit the transaction
    COMMIT TRANSACTION;

END TRY
BEGIN CATCH
    -- Rollback transaction on error
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    PRINT '';
    PRINT '========================================';
    PRINT 'ERROR OCCURRED:';
    PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR(10));
    PRINT 'Error Message: ' + ERROR_MESSAGE();
    PRINT 'Error Line: ' + CAST(ERROR_LINE() AS VARCHAR(10));
    PRINT '========================================';
    PRINT 'Transaction has been rolled back. No changes were made.';
    
    -- Re-throw the error
    THROW;
END CATCH

PRINT '';
PRINT 'Script execution completed.';

-- =====================================================
-- VERIFICATION QUERIES
-- Run these after the script to verify deletion
-- =====================================================

PRINT '';
PRINT 'VERIFICATION:';
PRINT '=============';

-- Check if tables still exist
IF OBJECT_ID('dbo.District', 'U') IS NULL
    PRINT '✓ District table successfully deleted'
ELSE
    PRINT '❌ District table still exists'

IF OBJECT_ID('dbo.Districts', 'U') IS NULL
    PRINT '✓ Districts table successfully deleted'
ELSE
    PRINT '❌ Districts table still exists'

IF OBJECT_ID('dbo.Hospital', 'U') IS NULL
    PRINT '✓ Hospital table successfully deleted'
ELSE
    PRINT '❌ Hospital table still exists'

IF OBJECT_ID('dbo.Hospitals', 'U') IS NULL
    PRINT '✓ Hospitals table successfully deleted'
ELSE
    PRINT '❌ Hospitals table still exists'

IF OBJECT_ID('dbo.MedicalHistory', 'U') IS NULL
    PRINT '✓ MedicalHistory table successfully deleted'
ELSE
    PRINT '❌ MedicalHistory table still exists'

-- List remaining tables for confirmation
PRINT '';
PRINT 'Remaining tables in database:';
SELECT 
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE'
    AND TABLE_NAME NOT LIKE '__EF%'
ORDER BY TABLE_SCHEMA, TABLE_NAME;