-- Script to update TrainingSession table structure for frontend compatibility
-- Run this manually in Azure Data Studio before deploying new code

USE [MedicalManagementDB];
GO

-- First, save any existing data (if needed)
-- SELECT * INTO TrainingSession_Backup FROM TrainingSession;

-- Drop the old table (since there are no foreign keys referencing it)
DROP TABLE IF EXISTS [TrainingSession];
GO

-- Create new TrainingSession table with correct structure
CREATE TABLE [TrainingSession] (
    [Id] INT PRIMARY KEY IDENTITY(1,1),
    [TrainingName] NVARCHAR(MAX) NOT NULL,
    [TrainingType] NVARCHAR(MAX) NOT NULL,
    [TrainingDate] DATETIME2 NOT NULL,
    [Province] NVARCHAR(MAX) NOT NULL,
    [Venue] NVARCHAR(MAX) NOT NULL,
    [TrainerId] INT NOT NULL,
    [TargetAudience] NVARCHAR(MAX) NOT NULL,
    [Status] INT NOT NULL DEFAULT 1, -- Enum: 1=Planned, 2=Scheduled, 3=InProgress, 4=Completed, 5=Cancelled
    [IsDeleted] BIT NOT NULL DEFAULT 0,
    [DateCreated] DATETIME2 NOT NULL DEFAULT GETDATE(),
    [CreatedBy] INT NULL,
    [LastUpdated] DATETIME2 NULL,
    [UpdatedBy] INT NULL,
    
    -- Foreign keys
    CONSTRAINT [FK_TrainingSession_Trainers_TrainerId] FOREIGN KEY ([TrainerId]) 
        REFERENCES [Trainers]([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_TrainingSession_AspNetUsers_CreatedBy] FOREIGN KEY ([CreatedBy]) 
        REFERENCES [AspNetUsers]([Id]),
    CONSTRAINT [FK_TrainingSession_AspNetUsers_UpdatedBy] FOREIGN KEY ([UpdatedBy]) 
        REFERENCES [AspNetUsers]([Id])
);
GO

-- Add indexes for better query performance
CREATE INDEX [IX_TrainingSession_TrainerId] ON [TrainingSession] ([TrainerId]);
CREATE INDEX [IX_TrainingSession_CreatedBy] ON [TrainingSession] ([CreatedBy]);
CREATE INDEX [IX_TrainingSession_UpdatedBy] ON [TrainingSession] ([UpdatedBy]);
CREATE INDEX [IX_TrainingSession_Status] ON [TrainingSession] ([Status]);
CREATE INDEX [IX_TrainingSession_TrainingDate] ON [TrainingSession] ([TrainingDate]);
GO

PRINT 'TrainingSession table structure updated successfully';
