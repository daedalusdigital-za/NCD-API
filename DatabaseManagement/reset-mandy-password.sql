-- =============================================================================
-- Reset Password for Mandy@promedtechnologies.co.za
-- =============================================================================
-- Database: MedicalManagementDB
-- New Password: Grace@020983
-- Run this in Azure Data Studio or SSMS
-- =============================================================================
-- IMPORTANT: This uses ASP.NET Core Identity V3 password hashing format.
-- The hash was generated using: PasswordHasher<ApplicationUser>.HashPassword()
-- =============================================================================

SET NOCOUNT ON;

DECLARE @Email NVARCHAR(256) = 'Mandy@promedtechnologies.co.za';
DECLARE @RowsAffected INT;

-- Check if user exists before attempting update
IF NOT EXISTS (SELECT 1 FROM AspNetUsers WHERE Email = @Email)
BEGIN
    RAISERROR('User with email %s does not exist.', 16, 1, @Email);
    RETURN;
END

BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE AspNetUsers
    SET 
        PasswordHash = 'AQAAAAIAAYagAAAAEGxvFwN+pO7Z1QvHXd8qYOhD7C1MxQC+GiLPrNhb9xOE2FkQhJGZjp3KY8vwXwBnpw==',
        SecurityStamp = CONVERT(NVARCHAR(36), NEWID()),
        ConcurrencyStamp = CONVERT(NVARCHAR(36), NEWID()),
        LockoutEnd = NULL,           -- Clear any lockout
        AccessFailedCount = 0        -- Reset failed login attempts
    WHERE Email = @Email;

    SET @RowsAffected = @@ROWCOUNT;

    IF @RowsAffected = 0
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No rows were updated. Please verify the email address.', 16, 1);
        RETURN;
    END

    COMMIT TRANSACTION;

    -- Success message
    PRINT '=============================================================================';
    PRINT 'Password reset completed successfully!';
    PRINT '=============================================================================';
    PRINT 'Email:        ' + @Email;
    PRINT 'New Password: Grace@020983';
    PRINT 'Rows Updated: ' + CAST(@RowsAffected AS NVARCHAR(10));
    PRINT '=============================================================================';

    -- Verify the update (excluding sensitive data)
    SELECT 
        Id AS UserId,
        Email,
        UserName,
        EmailConfirmed,
        LockoutEnd,
        AccessFailedCount
    FROM AspNetUsers
    WHERE Email = @Email;

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();

    RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
END CATCH;
