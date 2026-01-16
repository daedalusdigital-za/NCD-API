-- =============================================================================
-- Find User: Mandy@promedtechnologies.co.za
-- =============================================================================
-- Database: MedicalManagementDB
-- Purpose: Retrieve user information for verification
-- =============================================================================

SET NOCOUNT ON;

DECLARE @Email NVARCHAR(256) = 'Mandy@promedtechnologies.co.za';

IF NOT EXISTS (SELECT 1 FROM AspNetUsers WHERE Email = @Email)
BEGIN
    PRINT 'User not found: ' + @Email;
    RETURN;
END

SELECT 
    Id AS UserId,
    Email,
    UserName,
    EmailConfirmed,
    PhoneNumber,
    PhoneNumberConfirmed,
    TwoFactorEnabled,
    LockoutEnd,
    LockoutEnabled,
    AccessFailedCount
FROM AspNetUsers
WHERE Email = @Email;

-- Also show user roles
SELECT 
    u.Email,
    r.Name AS RoleName
FROM AspNetUsers u
INNER JOIN AspNetUserRoles ur ON u.Id = ur.UserId
INNER JOIN AspNetRoles r ON ur.RoleId = r.Id
WHERE u.Email = @Email;
