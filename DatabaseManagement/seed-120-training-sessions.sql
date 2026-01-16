-- =============================================================================
-- Seed 120 Training Sessions - Quick Update Template
-- =============================================================================
-- Database: MedicalManagementDB
-- Purpose: Insert 120 placeholder training sessions for editing later
-- Sessions distributed across different trainers and provinces
-- =============================================================================

SET NOCOUNT ON;

PRINT '═══════════════════════════════════════════════════════════════';
PRINT '  Starting Training Sessions Seeder - 120 Sessions';
PRINT '═══════════════════════════════════════════════════════════════';

-- Check if NumberOfParticipants column exists, add if missing
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('TrainingSession') AND name = 'NumberOfParticipants')
BEGIN
    ALTER TABLE TrainingSession ADD NumberOfParticipants INT NOT NULL DEFAULT 0;
    PRINT '  ✓ Added NumberOfParticipants column';
END
ELSE
    PRINT '  ✓ NumberOfParticipants column already exists';

PRINT '';

-- Verify Trainers exist
DECLARE @TrainerCount INT;
SELECT @TrainerCount = COUNT(*) FROM [dbo].[Trainer] WHERE [IsActive] = 1 AND [IsDeleted] = 0;

IF @TrainerCount = 0
BEGIN
    RAISERROR('No active trainers found. Please insert trainers first.', 16, 1);
    RETURN;
END

PRINT 'Found ' + CAST(@TrainerCount AS VARCHAR) + ' active trainers.';

-- Variables for generating data
DECLARE @Counter INT = 1;
DECLARE @SessionDate DATETIME;
DECLARE @TrainerId INT;
DECLARE @ProvinceId INT;
DECLARE @ProvinceList TABLE (Id INT, Name NVARCHAR(100));
DECLARE @TrainingTypes TABLE (TypeName NVARCHAR(100));
DECLARE @Venues TABLE (VenueName NVARCHAR(200));

-- Populate reference data
INSERT INTO @ProvinceList VALUES 
    (1, 'Gauteng'),
    (2, 'KwaZulu-Natal'),
    (3, 'Eastern Cape'),
    (4, 'Western Cape'),
    (5, 'Limpopo'),
    (6, 'Mpumalanga'),
    (7, 'North West'),
    (8, 'Free State'),
    (9, 'Northern Cape');

INSERT INTO @TrainingTypes VALUES
    ('NCD Training Workshop'),
    ('Virtual Training'),
    ('On-site Clinical Training'),
    ('Refresher Course'),
    ('Advanced NCD Management'),
    ('Community Health Worker Training');

INSERT INTO @Venues VALUES
    ('Provincial Health Department'),
    ('District Hospital Conference Room'),
    ('Community Health Center'),
    ('Online - Microsoft Teams'),
    ('Online - Zoom'),
    ('Regional Training Center'),
    ('University Medical School'),
    ('Primary Healthcare Clinic');

BEGIN TRY
    BEGIN TRANSACTION;

    -- Insert 120 Training Sessions
    WHILE @Counter <= 120
    BEGIN
        -- Calculate session date (spread over next 6 months)
        SET @SessionDate = DATEADD(DAY, (@Counter - 1) * 2, GETDATE());
        
        -- Rotate through trainers (cycle through available trainers)
        SELECT TOP 1 @TrainerId = Id 
        FROM [dbo].[Trainer] 
        WHERE [IsActive] = 1 AND [IsDeleted] = 0
        ORDER BY (CHECKSUM(NEWID()) + @Counter) % @TrainerCount;
        
        -- Select random province
        SELECT TOP 1 @ProvinceId = Id FROM @ProvinceList ORDER BY NEWID();

        -- Insert training session with template data
        INSERT INTO [dbo].[TrainingSession] (
            [TrainingName],
            [TrainingType],
            [TrainingDate],
            [ProvinceId],
            [Venue],
            [TrainerId],
            [TargetAudience],
            [NumberOfParticipants],
            [Status],
            [IsDeleted]
        )
        VALUES (
            'Training Session #' + CAST(@Counter AS VARCHAR) + ' - Quick Update Needed',
            (SELECT TOP 1 TypeName FROM @TrainingTypes ORDER BY NEWID()),
            @SessionDate,
            @ProvinceId,
            (SELECT TOP 1 VenueName FROM @Venues ORDER BY NEWID()),
            @TrainerId,
            'Healthcare Workers - To Be Updated',
            CAST((20 + (CHECKSUM(NEWID()) % 61)) AS INT), -- Random 20-80 participants
            CASE 
                WHEN @Counter <= 30 THEN 4  -- First 30: Completed
                WHEN @Counter <= 60 THEN 2  -- Next 30: Scheduled  
                WHEN @Counter <= 90 THEN 1  -- Next 30: Planned
                ELSE 4                       -- Last 30: Completed
            END,
            0
        );

        SET @Counter = @Counter + 1;

        -- Progress indicator every 20 sessions
        IF @Counter % 20 = 0
        BEGIN
            PRINT '  ✓ Inserted ' + CAST(@Counter AS VARCHAR) + ' sessions...';
        END
    END

    COMMIT TRANSACTION;

    PRINT '═══════════════════════════════════════════════════════════════';
    PRINT '  ✅ Successfully inserted 120 training sessions!';
    PRINT '═══════════════════════════════════════════════════════════════';

    -- Summary Report
    PRINT '';
    PRINT 'SUMMARY REPORT:';
    PRINT '─────────────────────────────────────────────────────────────';

    -- Count by Status
    SELECT 
        CASE [Status]
            WHEN 1 THEN 'Planned'
            WHEN 2 THEN 'Scheduled'
            WHEN 3 THEN 'Completed'
            WHEN 4 THEN 'In Progress'
            WHEN 5 THEN 'Cancelled'
            ELSE 'Unknown'
        END AS StatusName,
        COUNT(*) AS SessionCount
    FROM [dbo].[TrainingSession]
    WHERE [TrainingName] LIKE 'Training Session #%'
    GROUP BY [Status]
    ORDER BY [Status];

    PRINT '';
    PRINT 'Sessions by Trainer:';
    PRINT '─────────────────────────────────────────────────────────────';

    -- Count by Trainer
    SELECT 
        (t.FirstName + ' ' + t.LastName) AS TrainerName,
        COUNT(ts.Id) AS SessionCount,
        MIN(ts.TrainingDate) AS FirstSession,
        MAX(ts.TrainingDate) AS LastSession
    FROM [dbo].[TrainingSession] ts
    INNER JOIN [dbo].[Trainer] t ON ts.TrainerId = t.Id
    WHERE ts.TrainingName LIKE 'Training Session #%'
    GROUP BY t.Id, t.FirstName, t.LastName
    ORDER BY SessionCount DESC;

    PRINT '';
    PRINT 'Sessions by Province:';
    PRINT '─────────────────────────────────────────────────────────────';

    -- Count by Province
    SELECT 
        p.Name AS ProvinceName,
        COUNT(*) AS SessionCount
    FROM [dbo].[TrainingSession] ts
    LEFT JOIN [dbo].[Provinces] p ON ts.ProvinceId = p.Id
    WHERE ts.TrainingName LIKE 'Training Session #%'
    GROUP BY p.Id, p.Name
    ORDER BY SessionCount DESC;

    PRINT '';
    PRINT 'Sessions by Training Type:';
    PRINT '─────────────────────────────────────────────────────────────';

    -- Count by Training Type
    SELECT 
        TrainingType,
        COUNT(*) AS SessionCount
    FROM [dbo].[TrainingSession]
    WHERE [TrainingName] LIKE 'Training Session #%'
    GROUP BY TrainingType
    ORDER BY SessionCount DESC;

    PRINT '';
    PRINT '═══════════════════════════════════════════════════════════════';
    PRINT '  NOTE: All sessions are marked for quick update';
    PRINT '  Search for "Quick Update Needed" to find and edit them';
    PRINT '═══════════════════════════════════════════════════════════════';

    -- Display sample of inserted sessions
    PRINT '';
    PRINT 'Sample of Inserted Sessions (First 10):';
    PRINT '─────────────────────────────────────────────────────────────';

    SELECT TOP 10
        ts.Id,
        ts.TrainingName,
        ts.TrainingType,
        ts.TrainingDate,
        (t.FirstName + ' ' + t.LastName) AS Trainer,
        p.Name AS Province,
        ts.Venue,
        CASE ts.[Status]
            WHEN 1 THEN 'Planned'
            WHEN 2 THEN 'Scheduled'
            WHEN 3 THEN 'In Progress'
            WHEN 4 THEN 'Completed'
            WHEN 5 THEN 'Cancelled'
            ELSE 'Unknown'
        END AS StatusName
    FROM [dbo].[TrainingSession] ts
    INNER JOIN [dbo].[Trainer] t ON ts.TrainerId = t.Id
    LEFT JOIN [dbo].[Provinces] p ON ts.ProvinceId = p.Id
    WHERE ts.TrainingName LIKE 'Training Session #%'
    ORDER BY ts.Id DESC;

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();

    PRINT '═══════════════════════════════════════════════════════════════';
    PRINT '  ❌ ERROR: Failed to insert training sessions';
    PRINT '═══════════════════════════════════════════════════════════════';
    PRINT 'Error: ' + @ErrorMessage;

    RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
END CATCH;

-- Final verification
PRINT '';
PRINT 'Total Training Sessions in Database:';
SELECT COUNT(*) AS TotalSessions FROM [dbo].[TrainingSession] WHERE IsDeleted = 0;

PRINT '';
PRINT 'Script execution completed.';
