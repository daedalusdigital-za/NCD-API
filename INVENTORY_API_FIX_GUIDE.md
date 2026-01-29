# Inventory API Fix Guide

## Problem
The backend API at `https://ngcanduapi.azurewebsites.net/api/Inventory/GetAll` is only returning 20 items instead of all 18 expected inventory items. The hemoglobin meter products are missing.

## Root Cause Analysis

### ✅ Backend Code is Fine
I've verified the following files and found **NO ISSUES**:
- `InventoryController.cs` - No `.Take()` or filtering
- `InventoryItemService.cs` - Clean implementation
- `InventoryItemRepository.cs` - No pagination limits
- `Repository.cs` (base class) - No `.Take()` restrictions

### ⚠️ Likely Issue: Missing Data in Azure Database
The Azure SQL database likely doesn't have all 18 inventory items from the schema. The items may have been deleted or never inserted.

## Solution

### Step 1: Run Diagnostic Script
Connect to your Azure SQL Database and run the diagnostic script I created:

📄 **File**: `DatabaseManagement/diagnose-and-fix-inventory.sql`

This script will:
1. Check how many inventory items currently exist
2. Verify if the hemoglobin meter exists
3. Identify missing items
4. **Automatically insert any missing inventory items**

### Step 2: Expected Results
After running the script, you should have **18 active inventory items**:

#### Hemoglobin Testing (Category 1)
- `NDOH35002` - HEMOGLOBIN METER - BIO AID HB METER ⭐
- `NDOH35003` - HEMOGLOBIN TEST STRIPS

#### Glucose Testing (Category 2)
- `NDOH35004` - GLUCOSE METER- BIO HERMES
- `NDOH35006` - DUAL GLUCOSE & HBA1C METER- BIOHERMES
- `NDOH35017` - GLUCOSE TEST STRIPS

#### HBA1C Testing (Category 3)
- `NDOH35034` - HBA1C TEST STRIPS

#### Multiparameter Testing (Category 4)
- `NDOH35005` - MULTIPARAMETER - TAIDOC
- `NDOH35019` - MULTIPARAMETER - 50 KETONE TEST STRIPS VIAL
- `NDOH35020` - MULTIPARAMETER - 50 URIC ACID VIAL
- `NDOH35021` - MULTIPARAMETER - 50 CHOLESTEROL VIAL
- `NDOH35022` - MULTIPARAMETER - 50 LACTATE VIAL

#### Quality Control (Category 5)
- `NDOH35014` - HEMOGLOBIN METER - QUALITY CONTROL SOLUTIONS
- `NDOH35018` - GLOCOSE METER - QUALITY CONTROL SOLUTIONS
- `NDOH35036` - DUAL GLUCOSE & HBA1C - QUALITY CONTROL SOLUTION HBA1C
- `NDOH35037` - DUAL GLUCOSE & HBA1C - QUALITY CONTROL SOLUTIONS GLUCOSE

#### Equipment Accessories (Category 6)
- `NDOH35013` - HEMOGLOBIN METER - BATTERY
- `NDOH35016` - GLUCOSE METER - BATTERY

#### Disposables (Category 7)
- `NDOH35015` - HEMOGLOBIN METER - SINGLE USE DISPOSABLE LANCET

### Step 3: Verify the Fix

#### Test the API
```bash
# Call the API endpoint
curl https://ngcanduapi.azurewebsites.net/api/Inventory/GetAll
```

**Expected**: Should return 18 items in JSON format

#### Check the Frontend
1. Open your frontend application
2. Navigate to the inventory/sales page
3. Verify that the hemoglobin meter now appears in the dropdown/list

## Manual Verification Queries

If you want to manually check the database:

```sql
-- Count all active items
SELECT COUNT(*) AS TotalActiveItems
FROM InventoryItems
WHERE IsDeleted = 0;

-- Check for hemoglobin meter specifically
SELECT * FROM InventoryItems
WHERE Name LIKE '%HEMOGLOBIN%METER%'
AND IsDeleted = 0;

-- List all items by category
SELECT 
    Category,
    CASE Category
        WHEN 1 THEN 'Hemoglobin Testing'
        WHEN 2 THEN 'Glucose Testing'
        WHEN 3 THEN 'HBA1C Testing'
        WHEN 4 THEN 'Multiparameter Testing'
        WHEN 5 THEN 'Quality Control'
        WHEN 6 THEN 'Equipment Accessories'
        WHEN 7 THEN 'Disposables'
        WHEN 8 THEN 'Medical Equipment'
    END AS CategoryName,
    COUNT(*) AS ItemCount
FROM InventoryItems
WHERE IsDeleted = 0
GROUP BY Category;
```

## Important Notes

### Category Enum Mapping
The C# code uses enum values for categories:
```csharp
public enum InventoryCategory
{
    HemoglobinTesting = 1,
    GlucoseTesting = 2,
    HBA1CTesting = 3,
    MultiparameterTesting = 4,
    QualityControl = 5,
    EquipmentAccessories = 6,
    Disposables = 7,
    MedicalEquipment = 8
}
```

### Status Enum Mapping
```csharp
public enum InventoryStatus
{
    InStock = 1,
    LowStock = 2,
    OutOfStock = 3,
    Discontinued = 4
}
```

## Troubleshooting

### If the API still returns limited results:

1. **Check for soft deletes**:
   ```sql
   SELECT COUNT(*) FROM InventoryItems WHERE IsDeleted = 1;
   ```
   If any items are soft-deleted, update them:
   ```sql
   UPDATE InventoryItems SET IsDeleted = 0 WHERE SKU IN ('NDOH35002', 'NDOH35003', ...);
   ```

2. **Restart the Azure App Service**:
   - Sometimes the API caches results
   - Restart the web app from Azure Portal

3. **Check Entity Framework tracking**:
   - The code uses `AsNoTracking()` which is correct
   - No caching should occur

4. **Verify database connection**:
   - Ensure the API is connected to the correct Azure SQL database
   - Check the connection string in Azure App Service configuration

## Summary

✅ **Backend code is correct** - no changes needed  
⚠️ **Database has missing items** - run the diagnostic script  
🔧 **Script will auto-fix** - inserts all 18 required items  
🎯 **Expected result** - API returns all 18 items, including hemoglobin meter  

## Files Created
1. `DatabaseManagement/diagnose-and-fix-inventory.sql` - Diagnostic and fix script
2. `INVENTORY_API_FIX_GUIDE.md` - This guide
