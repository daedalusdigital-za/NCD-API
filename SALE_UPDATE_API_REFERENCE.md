# Sale Update API - Quick Reference Guide

## Endpoint

```http
PUT /api/Sales/Update
Content-Type: application/json
```

## Request Body

```json
{
  "id": 123,
  "saleNumber": "SAL-202601-0001",
  "saleDate": "2026-01-30T10:30:00",
  "customerName": "John Doe",
  "customerPhone": "555-1234",
  "notes": "Updated order",
  "saleItems": [
    {
      "id": 456,                    // Include ID for existing items
      "inventoryItemId": 1,
      "quantity": 5,
      "unitPrice": 100.00
    },
    {
      // No ID = new item will be added
      "inventoryItemId": 2,
      "quantity": 3,
      "unitPrice": 50.00
    }
  ]
}
```

## Response Codes

| Code | Description |
|------|-------------|
| 200 OK | Sale updated successfully |
| 400 Bad Request | Validation failed (see error message) |
| 404 Not Found | Sale with specified ID not found |

## Success Response

```json
{
  "message": "Sale updated successfully"
}
```

## Error Response

```json
{
  "message": "At least one sale item is required"
}
```

## Validation Rules

### Required Fields
- ✅ `id` - Must be > 0
- ✅ `saleNumber` - Cannot be empty
- ✅ `customerName` - Cannot be empty
- ✅ `saleItems` - Must contain at least one item

### Sale Item Rules
- ✅ `quantity` - Must be > 0
- ✅ `unitPrice` - Must be > 0
- ✅ `inventoryItemId` - Must reference valid inventory item

## Automatic Calculations

The API automatically handles:

1. **TotalPrice per item:** `Quantity × UnitPrice`
2. **Sale Total:** Sum of all item TotalPrices
3. **Audit fields:**
   - `UpdatedBy` - Current user ID
   - `LastUpdated` - Current timestamp

## SaleItems Behavior

### ✅ Update Existing Item
Include the item's `id` in the request - the item will be updated with new values.

### ✅ Add New Item
Omit the `id` field (or set to null/0) - a new item will be created.

### ✅ Remove Item
Simply don't include the item in the `saleItems` array - it will be removed from the sale.

## Examples

### Example 1: Update Item Quantities

**Before:**
- Item 1: Quantity = 2, Price = 100 → Total = 200
- Item 2: Quantity = 1, Price = 50 → Total = 50
- **Sale Total: 250**

**Request:**
```json
{
  "id": 123,
  "saleNumber": "SAL-202601-0001",
  "saleDate": "2026-01-30T10:30:00",
  "customerName": "John Doe",
  "saleItems": [
    {
      "id": 1,
      "inventoryItemId": 1,
      "quantity": 5,      // Changed from 2
      "unitPrice": 100.00
    },
    {
      "id": 2,
      "inventoryItemId": 2,
      "quantity": 3,      // Changed from 1
      "unitPrice": 50.00
    }
  ]
}
```

**After:**
- Item 1: Quantity = 5, Price = 100 → Total = 500
- Item 2: Quantity = 3, Price = 50 → Total = 150
- **Sale Total: 650** ✅ Automatically calculated

### Example 2: Add New Item

**Request:**
```json
{
  "id": 123,
  "saleNumber": "SAL-202601-0001",
  "saleDate": "2026-01-30T10:30:00",
  "customerName": "John Doe",
  "saleItems": [
    {
      "id": 1,
      "inventoryItemId": 1,
      "quantity": 5,
      "unitPrice": 100.00
    },
    {
      "id": 2,
      "inventoryItemId": 2,
      "quantity": 3,
      "unitPrice": 50.00
    },
    {
      // New item - no ID
      "inventoryItemId": 3,
      "quantity": 2,
      "unitPrice": 75.00
    }
  ]
}
```

**Result:**
- Existing items updated
- New item added
- **Sale Total: 800** (500 + 150 + 150)

### Example 3: Remove Item

**Request:**
```json
{
  "id": 123,
  "saleNumber": "SAL-202601-0001",
  "saleDate": "2026-01-30T10:30:00",
  "customerName": "John Doe",
  "saleItems": [
    {
      "id": 1,
      "inventoryItemId": 1,
      "quantity": 5,
      "unitPrice": 100.00
    }
    // Item 2 omitted - will be removed
  ]
}
```

**Result:**
- Item 1 kept
- Item 2 removed
- **Sale Total: 500**

## Common Errors

### ❌ Empty Items Array
```json
{
  "message": "At least one sale item is required"
}
```
**Fix:** Add at least one item to `saleItems` array.

### ❌ Zero Quantity
```json
{
  "message": "Item quantity must be greater than 0"
}
```
**Fix:** Set quantity to a positive number.

### ❌ Invalid Sale ID
```json
{
  "message": "Invalid sale ID"
}
```
**Fix:** Ensure `id` is a positive integer.

### ❌ Sale Not Found
```json
{
  "message": "Sale with ID 999 not found"
}
```
**Fix:** Verify the sale exists and ID is correct.

## Testing with PowerShell

```powershell
$baseUrl = "https://localhost:7193/api/Sales"

# Get existing sale
$sale = Invoke-RestMethod -Uri "$baseUrl/GetById?id=123" -Method Get

# Modify and update
$sale.customerName = "Updated Name"
$sale.saleItems[0].quantity = 10

$body = $sale | ConvertTo-Json -Depth 10

$response = Invoke-RestMethod -Uri "$baseUrl/Update" -Method Put `
    -Body $body -ContentType "application/json"

Write-Host $response.message
```

## Testing with cURL

```bash
curl -X PUT "https://localhost:7193/api/Sales/Update" \
  -H "Content-Type: application/json" \
  -d '{
    "id": 123,
    "saleNumber": "SAL-202601-0001",
    "saleDate": "2026-01-30T10:30:00",
    "customerName": "John Doe",
    "customerPhone": "555-1234",
    "saleItems": [
      {
        "id": 1,
        "inventoryItemId": 1,
        "quantity": 5,
        "unitPrice": 100.00
      }
    ]
  }'
```

## Best Practices

1. **Always fetch current sale data** before updating to get current item IDs
2. **Include all items** you want to keep in the update request
3. **Don't send ID for new items** - let the API generate them
4. **Let the API calculate totals** - don't send calculated values
5. **Handle validation errors** in your frontend appropriately

## Integration Notes

### Frontend Workflow
1. `GET /api/Sales/GetById?id={id}` - Fetch current sale
2. User modifies data in UI
3. `PUT /api/Sales/Update` - Send complete updated sale
4. Handle success/error responses
5. Refresh UI with updated data

### Database Changes
- ✅ Audit fields automatically populated
- ✅ Total automatically calculated
- ✅ SaleItems properly added/updated/removed
- ✅ Foreign key relationships maintained

---

**Need help?** Run the comprehensive test: `.\test-sale-update-api.ps1`
