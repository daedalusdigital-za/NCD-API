-- Check if hemoglobin meters exist in database
SELECT 
    Id, 
    SKU,
    Name,
    Description, 
    Category, 
    Status,
    StockAvailable,
    UnitPrice,
    IsDeleted
FROM InventoryItem
WHERE 
    (Description LIKE '%HEMOGLOBIN%' 
    OR Name LIKE '%HEMOGLOBIN%'
    OR Category = 3)  -- 3 = HemoglobinTesting enum value
    AND IsDeleted = 0
ORDER BY Id;

-- Get count of all active inventory items
SELECT 
    Category,
    COUNT(*) AS ItemCount
FROM InventoryItem
WHERE IsDeleted = 0
GROUP BY Category
ORDER BY Category;

-- Get total count
SELECT COUNT(*) AS TotalActiveItems
FROM InventoryItem
WHERE IsDeleted = 0;
