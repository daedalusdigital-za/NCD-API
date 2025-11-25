-- Create TrainingDocuments Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'TrainingDocuments')
BEGIN
    CREATE TABLE TrainingDocuments (
        Id INT PRIMARY KEY IDENTITY(1,1),
        TrainingSessionId INT NOT NULL,
        FileName NVARCHAR(255) NOT NULL,
        OriginalFileName NVARCHAR(255) NOT NULL,
        FileSize BIGINT NOT NULL,
        FilePath NVARCHAR(500) NOT NULL,
        DocumentType NVARCHAR(50) NOT NULL, -- 'Register', 'AttendanceSheet', 'Materials'
        MimeType NVARCHAR(100) NOT NULL DEFAULT 'application/pdf',
        UploadedBy INT NOT NULL,
        UploadedAt DATETIME NOT NULL DEFAULT GETUTCDATE(),
        CreatedBy INT NOT NULL,
        IsDeleted BIT NOT NULL DEFAULT 0,
        
        CONSTRAINT FK_TrainingDocuments_TrainingSession 
            FOREIGN KEY (TrainingSessionId) REFERENCES TrainingSession(Id),
        CONSTRAINT FK_TrainingDocuments_User 
            FOREIGN KEY (UploadedBy) REFERENCES Users(Id)
    );
    
    -- Create index for better query performance
    CREATE INDEX IX_TrainingDocuments_TrainingSessionId 
        ON TrainingDocuments(TrainingSessionId);
    
    CREATE INDEX IX_TrainingDocuments_UploadedAt
        ON TrainingDocuments(UploadedAt DESC);
        
    PRINT 'TrainingDocuments table created successfully';
END
ELSE
BEGIN
    PRINT 'TrainingDocuments table already exists';
END
