-- Rename DateUpdated back to LastUpdated
EXEC sp_rename 'dbo.CreditNotes.DateUpdated', 'LastUpdated', 'COLUMN';
PRINT ' Renamed DateUpdated  LastUpdated';
