-- Find userId for Mandy@promedtechnologies.co.za
SELECT 
    Id as UserId,
    Email,
    UserName,
    EmailConfirmed,
    PhoneNumber
FROM AspNetUsers
WHERE Email = 'Mandy@promedtechnologies.co.za';
