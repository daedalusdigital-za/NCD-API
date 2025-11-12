-- Database cleanup script to free up space
-- WARNING: This will permanently delete data. Review carefully before running!

-- ============================================
-- 1. Check current database size
-- ============================================
SELECT 
    'Current Database Size' AS Info,
    database_name = DB_NAME(db.database_id),
    SizeMB = CAST(SUM(CAST(mf.size as bigint)) * 8 / 1024 AS DECIMAL(10,2))
FROM sys.databases db
JOIN sys.master_files mf ON db.database_id = mf.database_id
WHERE db.database_id = DB_ID()
GROUP BY db.database_id;
GO

-- ============================================
-- 2. Check table sizes to identify largest tables
-- ============================================
SELECT 
    t.NAME AS TableName,
    s.Name AS SchemaName,
    p.rows AS RowCounts,
    CAST(ROUND(((SUM(a.total_pages) * 8) / 1024.00), 2) AS NUMERIC(36, 2)) AS TotalSpaceMB,
    CAST(ROUND(((SUM(a.used_pages) * 8) / 1024.00), 2) AS NUMERIC(36, 2)) AS UsedSpaceMB, 
    CAST(ROUND(((SUM(a.total_pages) - SUM(a.used_pages)) * 8) / 1024.00, 2) AS NUMERIC(36, 2)) AS UnusedSpaceMB
FROM 
    sys.tables t
INNER JOIN      
    sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN 
    sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN 
    sys.allocation_units a ON p.partition_id = a.container_id
LEFT OUTER JOIN 
    sys.schemas s ON t.schema_id = s.schema_id
WHERE 
    t.NAME NOT LIKE 'dt%' 
    AND t.is_ms_shipped = 0
    AND i.OBJECT_ID > 255 
GROUP BY 
    t.Name, s.Name, p.Rows
ORDER BY 
    TotalSpaceMB DESC;
GO

-- ============================================
-- 3. CLEANUP OPTIONS - Uncomment sections you want to run
-- ============================================

-- Option A: Delete soft-deleted records (IsDeleted = 1)
-- This removes records marked as deleted but still in database
/*
DELETE FROM [dbo].[MedicalHistories] WHERE IsDeleted = 1;
DELETE FROM [dbo].[Patients] WHERE IsDeleted = 1;
DELETE FROM [dbo].[TicketDetails] WHERE IsDeleted = 1;
DELETE FROM [dbo].[Issues] WHERE IsDeleted = 1;
PRINT 'Soft-deleted records removed';
*/
GO

-- Option B: Delete old OTP records (older than 7 days)
-- OTPs are temporary and don't need to be kept long-term
/*
DELETE FROM [dbo].[Otp] 
WHERE DateCreated < DATEADD(DAY, -7, GETDATE());
PRINT 'Old OTP records deleted';
*/
GO

-- Option C: Archive old medical history records (older than 2 years)
-- Consider backing up before deleting
/*
DELETE FROM [dbo].[MedicalHistories] 
WHERE DateCreated < DATEADD(YEAR, -2, GETDATE());
PRINT 'Old medical history records deleted';
*/
GO

-- Option D: Delete orphaned records (if any foreign key constraints are missing)
/*
-- Delete TicketDetails without valid Issues
DELETE FROM [dbo].[TicketDetails]
WHERE IssueId NOT IN (SELECT Id FROM [dbo].[Issues]);
PRINT 'Orphaned ticket details deleted';
*/
GO

-- ============================================
-- 4. Shrink database to reclaim space (run AFTER deletions)
-- ============================================
/*
DBCC SHRINKDATABASE(N'MedicalManagementDB', 10);
PRINT 'Database shrunk successfully';
*/
GO

-- ============================================
-- 5. Update statistics after cleanup
-- ============================================
/*
EXEC sp_updatestats;
PRINT 'Statistics updated';
*/
GO

PRINT '
===============================================
CLEANUP SCRIPT SUMMARY
===============================================
1. Review the table sizes above
2. Uncomment the cleanup options you want to run
3. BACKUP your database before running deletions!
4. After deleting data, uncomment and run DBCC SHRINKDATABASE
===============================================
';
