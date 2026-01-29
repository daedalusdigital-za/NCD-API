# Inventory Items Fix - Action Plan

## Issue
Hemoglobin meters not appearing in the inventory dropdown on the Add Sale page in the frontend.

## Root Cause Analysis

### ✅ Backend API Code - CLEAN (No issues found)
- **InventoryController.GetAll()** (Line 131) - No limiting
- **InventoryItemService.GetAll()** (Line 77) - Returns all items, no filters
- **InventoryItemRepository** - Uses base Repository with no restrictions
- **Repository.GetAll()** (Line 20-22) - Simple `DbSet.AsNoTracking().ToListAsync()` - returns ALL items

**Conclusion**: Backend is NOT limiting results to 20 items. The API will return all inventory items from the database.

### 🔍 Next Step: Check Database

The problem is likely **missing data in the database**, not the API code.

## Action Items

### 1. ✅ FIRST: Check Database for Hemoglobin Items
Run this query in Azure Data Studio:

**File**: [check-hemoglobin-items.sql](check-hemoglobin-items.sql)

```sql
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
    OR Category = 3)  -- 3 = HemoglobinTesting enum
    AND IsDeleted = 0
ORDER BY Id;
```

### 2. 🔧 IF ITEMS ARE MISSING: Add Them
Run this script in Azure Data Studio:

**File**: [add-missing-inventory-items.sql](add-missing-inventory-items.sql)

This will add 5 hemoglobin-related items:
- NDOH35002 - HEMOGLOBIN METER - BIO AID HB METER (Category: 3 - HemoglobinTesting)
- NDOH35003 - HEMOGLOBIN TEST STRIPS (Category: 3 - HemoglobinTesting)
- NDOH35013 - HEMOGLOBIN METER - BATTERY (Category: 6 - Accessories)
- NDOH35014 - HEMOGLOBIN METER - QUALITY CONTROL SOLUTIONS (Category: 5 - QualityControl)
- NDOH35015 - HEMOGLOBIN METER - SINGLE USE DISPOSABLE LANCET (Category: 7 - Consumables)

### 3. ✅ NO CODE DEPLOYMENT NEEDED
Since the backend API code is already correct, you don't need to redeploy the API. Just:
1. Add the missing inventory items to the database
2. Refresh the Add Sale page in the frontend
3. All items (including hemoglobin meters) should now appear

## Category Enum Reference

Based on the code:
```csharp
public enum InventoryCategory
{
    Other = 0,
    GlucoseTesting = 1,
    DiabetesTesting = 2,
    HemoglobinTesting = 3,  // ← Hemoglobin items
    MultiparameterTesting = 4,
    QualityControl = 5,
    Accessories = 6,
    Consumables = 7
}
```

## Expected Result

After adding the missing items:
- Total inventory items should increase from ~20 to ~25+ items
- Hemoglobin meters will appear in the dropdown
- Frontend dropdown should populate correctly since API already returns all items

## Quick Test

After running the add-missing-inventory-items.sql script:

1. **Verify in database**:
   ```sql
   SELECT COUNT(*) FROM InventoryItem WHERE IsDeleted = 0;
   ```
   Should return 25+ items

2. **Test API directly**:
   - GET: https://your-api-url/api/Inventory/GetAll
   - Should return all items including hemoglobin meters

3. **Test Frontend**:
   - Refresh the Add Sale page
   - Open inventory dropdown
   - Look for "HEMOGLOBIN METER - BIO AID HB METER"

## Files Created

1. **check-hemoglobin-items.sql** - Query to verify if items exist
2. **add-missing-inventory-items.sql** - Script to add missing items (safe to run multiple times)

## Summary

✅ Backend API code is CORRECT - returns ALL inventory items
❌ Database is likely MISSING hemoglobin inventory items
🔧 Solution: Add missing items to database (no code deployment needed)
