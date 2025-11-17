-- Automatically assign provinces to sales based on customer hospital names
-- Maps hospitals and facilities to their respective provinces

BEGIN TRANSACTION;

-- Update sales for Gauteng (ID: 1)
-- Hospitals: Charlotte Maxeke, Steve Biko, Helen Joseph, Kalafong, Pretoria West, Mamelodi, Rahima Moosa, 
-- Dr. George Mukhari, Far East Rand Hospital, Tambo Memorial, Sebokeng, Kopanong, Hillbrow CHC
UPDATE Sale 
SET ProvinceId = 1 
WHERE CustomerName IN (
    'Charlotte Maxeke Hospital',
    'Steve Biko Academic Hospital',
    'HELEN JOSEPH HOSPITAL',
    'KALAFONG HOSPITAL',
    'PRETORIA WEST HOSPITAL',
    'MAMELODI HOSPITAL',
    'RAHIMA MOOSA MOTHER & CHILD HOSPITAL',
    'DR. GEORGE MUKHARI HOSPITAL',
    'FAR EAST RAND HOSPITAL',
    'TAMBO MEMORIAL HOSPITAL',
    'SEBOKENG HOSPITAL',
    'KOPANONG HOSPITAL',
    'HILLBROW CHC',
    'HEALTH TSHWANE REGION C'
)
AND ProvinceId IS NULL;

-- Update sales for Free State (ID: 8)
-- Facilities: Bloemfontein Medical Depot
UPDATE Sale 
SET ProvinceId = 8 
WHERE CustomerName LIKE '%BLOEMFONTEIN%'
AND ProvinceId IS NULL;

-- Update sales for Limpopo (ID: 5)
-- Facilities: Department of Health Limpopo, Mankweng Hospital
UPDATE Sale 
SET ProvinceId = 5 
WHERE (CustomerName LIKE '%LIMPOPO%' OR CustomerName LIKE '%MANKWENG%')
AND ProvinceId IS NULL;

-- Update sales for Western Cape (ID: 4)
-- Facilities: Groote Schuur Hospital
UPDATE Sale 
SET ProvinceId = 4 
WHERE CustomerName LIKE '%GROOTE SCHUUR%'
AND ProvinceId IS NULL;

-- Update sales for KwaZulu-Natal (ID: 2)
-- Provincial Pharm Supply Depot and other KZN facilities
UPDATE Sale 
SET ProvinceId = 2 
WHERE CustomerName LIKE '%PROVINCIAL PHARM SUPPLY DEPOT%'
AND ProvinceId IS NULL;

-- Update remaining medical supply depots and transit facilities
-- These serve multiple provinces, assign based on pattern
UPDATE Sale 
SET ProvinceId = 1  -- Default to Gauteng for central distribution
WHERE CustomerName LIKE '%MEDICAL SUPPLY DEPOT%'
AND ProvinceId IS NULL;

COMMIT TRANSACTION;

-- Display results
SELECT 
    p.Name as Province,
    COUNT(s.Id) as SalesCount,
    SUM(s.Total) as TotalRevenue
FROM Sale s
LEFT JOIN Provinces p ON s.ProvinceId = p.Id
WHERE s.IsDeleted = 0
GROUP BY p.Id, p.Name
ORDER BY COUNT(s.Id) DESC;

-- Show unassigned sales
SELECT 
    COUNT(*) as UnassignedSales
FROM Sale
WHERE ProvinceId IS NULL AND IsDeleted = 0;

-- Show distinct unassigned customers
SELECT DISTINCT CustomerName
FROM Sale
WHERE ProvinceId IS NULL AND IsDeleted = 0;
