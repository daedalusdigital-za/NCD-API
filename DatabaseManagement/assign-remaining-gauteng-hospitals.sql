-- Assign remaining Gauteng hospitals
UPDATE Sale 
SET ProvinceId = 1 
WHERE CustomerName IN (
    'BHEKI MLANGENI DISTRICT HOSPITAL',
    'GERMISTON HOSPITAL',
    'SOUTH RAND HOSPITAL',
    'TEMBISA HOSPITAL',
    'THELLE MOGOERANE HOSPITAL',
    'TSHWANE DISTRICT HOSPITAL'
)
AND ProvinceId IS NULL;

-- Assign Free State Thabo Mofutsanyana District
UPDATE Sale 
SET ProvinceId = 8 
WHERE CustomerName LIKE '%FS HEALTH%THABO MOFUTSANYANA%'
AND ProvinceId IS NULL;

-- Verify final results
SELECT 
    p.Name as Province,
    COUNT(s.Id) as SalesCount,
    FORMAT(SUM(s.Total), 'C', 'en-ZA') as TotalRevenue
FROM Sale s
LEFT JOIN Provinces p ON s.ProvinceId = p.Id
WHERE s.IsDeleted = 0
GROUP BY p.Id, p.Name
ORDER BY COUNT(s.Id) DESC;

-- Check for any remaining unassigned
SELECT COUNT(*) as RemainingUnassigned
FROM Sale
WHERE ProvinceId IS NULL AND IsDeleted = 0;
