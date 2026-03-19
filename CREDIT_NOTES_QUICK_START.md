# 🚀 Credit Notes - Quick Start (5 Minutes)

## The One-Page Deployment Guide

---

## ⚡ Fastest Path to Deployment

### Step 1: Apply Database Migration (2 minutes)
```powershell
# Open Package Manager Console in Visual Studio
# Tools > NuGet Package Manager > Package Manager Console

Set-DefaultProject MH.Infrastructure
Update-Database
```

**Expected:** ✅ "Applying migration 20260202000001_AddCreditNotesTable..."

---

### Step 2: Build & Run Locally (3 minutes)
```bash
cd C:\Users\IT Department\Desktop\NCD-API\MH.Api
dotnet run
```

**Expected:** ✅ "Now listening on: https://localhost:5001"

---

### Step 3: Test One Endpoint (3 minutes)

**Open Postman and run:**
```
POST http://localhost:5000/api/CreditNotes
Content-Type: application/json

{
  "invoiceId": 1,
  "invoiceNumber": "SAL-2026-001",
  "customerId": 1,
  "customerName": "Test Hospital",
  "originalAmount": 10000.00,
  "creditAmount": 2500.00,
  "reason": "Test",
  "reverseStock": true,
  "reverseSale": true
}
```

**Expected:** ✅ Status 201 + Credit Note created with "CN-2026-001"

The API will start at: `https://localhost:7295`

---

### Step 4: Test with Swagger
Open your browser: `https://localhost:7295/swagger`

---

## 🧪 Quick API Tests

### Test 1: Create a Credit Note
```http
POST https://localhost:7295/api/CreditNotes
Content-Type: application/json

{
  "invoiceId": 1,
  "creditAmount": 500.00,
  "reason": "Product return - defective item",
  "notes": "Customer returned glucose meter",
  "reverseStock": true,
  "reverseSale": true
}
```

**Expected Response:** 201 Created
```json
{
  "id": 1,
  "creditNoteNumber": "CN-2026-001",
  "status": "pending",
  ...
}
```

---

### Test 2: Get All Credit Notes
```http
GET https://localhost:7295/api/CreditNotes
```

**Expected Response:** 200 OK with array of credit notes

---

### Test 3: Approve Credit Note
```http
POST https://localhost:7295/api/CreditNotes/1/approve
Content-Type: application/json

{
  "approvedBy": "admin@ndcangu.com"
}
```

**Expected Response:** 200 OK
- Stock should be reversed (inventory increased)
- Sale should be marked with `HasCreditNote = true`

---

### Test 4: Get Credited Sales
```http
GET https://localhost:7295/api/Sales/Credited
```

**Expected Response:** 200 OK with sales that have credit notes

---

### Test 5: Upload Document
```http
POST https://localhost:7295/api/CreditNotes/1/upload
Content-Type: multipart/form-data

[Upload a PDF file]
```

**Expected Response:** 200 OK with file information

---

## 📋 Common Test Scenarios

### Scenario 1: Full Credit Note Workflow
1. Create sale → Get sale ID
2. Create credit note for that sale
3. Upload supporting document (PDF)
4. Approve credit note
5. Verify stock increased
6. Verify sale shows `hasCreditNote: true`

### Scenario 2: Partial Credit
1. Create sale for $1000
2. Create credit note for $300 (partial)
3. Approve
4. Sale should show `creditedAmount: 300`
5. Create another credit note for $400
6. Total credited: $700 (still less than $1000)

### Scenario 3: Search & Filter
```http
GET /api/CreditNotes?status=pending
GET /api/CreditNotes?search=CN-2026
GET /api/CreditNotes?dateFrom=2026-01-01&dateTo=2026-01-31
GET /api/CreditNotes?invoiceId=123
```

---

## ✅ Validation Tests

### Test Credit Amount Validation
```json
POST /api/CreditNotes
{
  "invoiceId": 1,
  "creditAmount": 99999.00,  // Exceeds sale amount
  "reason": "Test"
}
```
**Expected:** 400 Bad Request - "Credit amount cannot exceed original amount"

### Test File Upload Validation
- Upload non-PDF file → **Expected:** 400 Bad Request
- Upload file > 5MB → **Expected:** 400 Bad Request
- Upload PDF < 5MB → **Expected:** 200 OK

### Test Delete Validation
- Delete pending credit note → **Expected:** 204 No Content
- Delete approved credit note → **Expected:** 400 Bad Request

---

## 🔍 Troubleshooting

### Issue: "Credit note not found"
**Solution:** Ensure the credit note ID exists and `IsDeleted = false`

### Issue: "Invoice not found"
**Solution:** 
1. Check if sales exist: `GET /api/Sales`
2. Use valid sale ID from response

### Issue: File upload fails
**Solution:**
1. Ensure `uploads/credit-notes/` directory exists in wwwroot
2. Check application has write permissions
3. Verify file is PDF and < 5MB

### Issue: Stock reversal not working
**Solution:**
1. Verify `ReverseStock = true` in credit note
2. Ensure credit note is approved
3. Check sale has items with valid inventory IDs
4. Verify inventory items exist in database

---

## 📊 Database Verification Queries

### Check Credit Notes
```sql
SELECT * FROM CreditNotes WHERE IsDeleted = 0;
```

### Check Sales with Credit Notes
```sql
SELECT 
    s.Id,
    s.SaleNumber,
    s.Total,
    s.HasCreditNote,
    s.CreditedAmount,
    COUNT(cn.Id) as CreditNoteCount
FROM Sales s
LEFT JOIN CreditNotes cn ON s.Id = cn.InvoiceId AND cn.IsDeleted = 0
WHERE s.IsDeleted = 0
GROUP BY s.Id, s.SaleNumber, s.Total, s.HasCreditNote, s.CreditedAmount;
```

### Check Stock Reversal
```sql
-- Before approval: Note inventory quantity
SELECT CurrentStock FROM InventoryItems WHERE Id = [item_id];

-- After approval: Quantity should increase
SELECT CurrentStock FROM InventoryItems WHERE Id = [item_id];
```

---

## 🎯 Frontend Integration

Once backend is tested and working:

1. **Update API Service** (`sales-api.service.ts`):
   - Remove mock data
   - Use actual API endpoints

2. **Update Components**:
   - `credit-notes.component.ts` - Remove `getMockCreditNotes()`
   - `list-sales.component.ts` - Remove mock filter

3. **Test Full Flow**:
   - Create credit note from frontend
   - Upload document
   - Approve/reject
   - View credited sales

---

## 📞 Need Help?

### Common Endpoints Reference
- Base URL: `https://localhost:7295/api`
- Credit Notes: `/CreditNotes`
- Sales: `/Sales`
- Credited Sales: `/Sales/Credited`

### Response Codes
- 200 OK - Success
- 201 Created - Resource created
- 204 No Content - Deleted successfully
- 400 Bad Request - Invalid data
- 404 Not Found - Resource not found
- 422 Unprocessable Entity - Business rule violation

---

## ✨ Next Steps

1. ✅ Complete all API tests above
2. Test with actual data from your database
3. Integrate with frontend
4. Add user authentication
5. Deploy to staging environment

---

**Ready to Start?** Run Step 1 now! 🚀
