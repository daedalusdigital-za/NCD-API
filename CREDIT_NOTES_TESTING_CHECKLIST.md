# 🧪 Credit Notes Testing Checklist
## Comprehensive QA Guide
**Date:** February 2, 2026  
**Feature:** Credit Notes (11 Endpoints) + VAT Conversion  
**Status:** Ready for QA Testing

---

## 📋 Pre-Testing Checklist

### Environment Setup
- [ ] Browser developer console open (F12)
- [ ] Network tab enabled (to see API calls)
- [ ] Console tab enabled (to see errors)
- [ ] Production API: https://ngcanduapi.azurewebsites.net
- [ ] Valid JWT token obtained (login first)
- [ ] Test user credentials available

### Browser Cache
- [ ] Cleared browser cache
- [ ] Hard refresh (Ctrl+Shift+R)
- [ ] No old cached responses
- [ ] API URLs showing single slashes (not //)

---

## 🧪 PHASE 1: Authentication & Navigation

### Step 1: Login
- [ ] Navigate to login page
- [ ] Enter valid credentials
- [ ] Receive JWT token (check localStorage)
- [ ] Token stored correctly
- [ ] No 401 errors in console

### Step 2: Navigate to Credit Notes
- [ ] Go to Sales dashboard
- [ ] Find Credit Notes section
- [ ] Page loads without errors
- [ ] No "404 Not Found" errors
- [ ] No "Invalid column" errors
- [ ] UI displays correctly

### Console Checks
- [ ] No red errors in console
- [ ] No double-slash URLs (/api//CreditNotes)
- [ ] API calls show: `/api/creditnotes` (single slash)
- [ ] Network tab shows 400 status (expected without data)

---

## 🧪 PHASE 2: Core CRUD Operations

### Create New Credit Note
- [ ] Click "Create Credit Note" button
- [ ] Form appears with fields:
  - [ ] Invoice ID (number input)
  - [ ] Customer ID (number input)
  - [ ] Credit Amount (decimal input)
  - [ ] Reason (text area)
- [ ] Fill with test data:
  ```
  Invoice ID: 1
  Customer ID: 1
  Credit Amount: 500.00
  Reason: Test credit note - damaged goods
  ```
- [ ] Click Submit
- [ ] Check Network tab:
  - [ ] POST /api/creditnotes called
  - [ ] Status: 201 or 200 (success)
  - [ ] Response has: id, creditNoteNumber, status="Pending"
- [ ] Confirmation message displays
- [ ] Credit note appears in list

### Console Checks (Create)
- [ ] No red errors
- [ ] No auth errors (401)
- [ ] No validation errors (400)
- [ ] Response parsed correctly

---

### Read/List Credit Notes
- [ ] Credit notes list displays
- [ ] Shows: CN-2026-001, CN-2026-002, etc.
- [ ] Each row has:
  - [ ] Credit Note Number
  - [ ] Amount
  - [ ] Status (Pending/Approved/Rejected)
  - [ ] Created Date
  - [ ] Action buttons
- [ ] List updates when new CN created
- [ ] GET /api/creditnotes API call succeeds

### Console Checks (Read)
- [ ] No errors loading list
- [ ] Response includes all fields
- [ ] Data displayed correctly

---

### Read Specific Credit Note
- [ ] Click on a credit note in list
- [ ] Detail view opens
- [ ] Shows all fields:
  - [ ] ID
  - [ ] Credit Note Number
  - [ ] Invoice ID
  - [ ] Customer Name
  - [ ] Amount
  - [ ] Reason
  - [ ] Status
  - [ ] Created Date
  - [ ] Created By
- [ ] GET /api/creditnotes/{id} API call succeeds

### Console Checks (Get One)
- [ ] Single slash in URL
- [ ] 200 OK response
- [ ] All fields populated

---

### Update Credit Note
- [ ] Open pending credit note (not approved/rejected)
- [ ] Click "Edit" button
- [ ] Form allows editing:
  - [ ] Credit Amount (editable)
  - [ ] Reason (editable)
- [ ] Update values:
  ```
  Credit Amount: 600.00
  Reason: Updated - additional damage found
  ```
- [ ] Click Save
- [ ] Check Network tab:
  - [ ] PATCH /api/creditnotes/{id} called
  - [ ] Status: 200 (success)
  - [ ] New values reflected
- [ ] List updates with new amount
- [ ] Success message displays

### Console Checks (Update)
- [ ] PATCH method used (not POST)
- [ ] Correct ID in URL
- [ ] 200 response received

---

### Delete Credit Note
- [ ] Open pending credit note (not approved/rejected)
- [ ] Click "Delete" button
- [ ] Confirmation dialog appears
- [ ] Confirm deletion
- [ ] Check Network tab:
  - [ ] DELETE /api/creditnotes/{id} called
  - [ ] Status: 200 (success)
- [ ] Credit note removed from list
- [ ] Success message displays

### Console Checks (Delete)
- [ ] DELETE method used
- [ ] 200 response received
- [ ] No remaining errors

---

## 🧪 PHASE 3: Approval Workflow

### Approve Credit Note
- [ ] Create a new credit note (see Create section)
- [ ] Status should be "Pending"
- [ ] Click "Approve" button
- [ ] Approval modal appears with fields:
  - [ ] Approver Email input
  - [ ] Reverse Sales (checkbox)
  - [ ] Reverse Inventory (checkbox)
- [ ] Fill in:
  ```
  Approver Email: manager@hospital.co.za
  Reverse Sales: checked (✓)
  Reverse Inventory: checked (✓)
  ```
- [ ] Click "Approve" button
- [ ] Check Network tab:
  - [ ] POST /api/creditnotes/{id}/approve called
  - [ ] Status: 200 (success)
  - [ ] Response shows status: "Approved"
- [ ] Modal closes
- [ ] Credit note status changes to "Approved"
- [ ] Success notification displays

### Console Checks (Approve)
- [ ] POST /approve endpoint called
- [ ] Correct ID in URL
- [ ] 200 response
- [ ] Status field updated

---

### Reject Credit Note
- [ ] Create a new credit note
- [ ] Status should be "Pending"
- [ ] Click "Reject" button
- [ ] Rejection modal appears with fields:
  - [ ] Rejector Email input
  - [ ] Rejection Reason (text area)
- [ ] Fill in:
  ```
  Rejector Email: reviewer@hospital.co.za
  Rejection Reason: Insufficient documentation provided
  ```
- [ ] Click "Reject" button
- [ ] Check Network tab:
  - [ ] POST /api/creditnotes/{id}/reject called
  - [ ] Status: 200 (success)
  - [ ] Response shows status: "Rejected"
- [ ] Modal closes
- [ ] Credit note status changes to "Rejected"
- [ ] Rejection reason displays

### Console Checks (Reject)
- [ ] POST /reject endpoint called
- [ ] 200 response received
- [ ] Status updated correctly

---

## 🧪 PHASE 4: Document Management

### Upload Document
- [ ] Open an approved credit note
- [ ] Scroll to "Documents" section
- [ ] Click "Upload Document" button
- [ ] File picker appears
- [ ] Select a PDF file (< 5MB)
  - [ ] Valid: test-document.pdf ✅
  - [ ] Invalid: image.jpg ❌ (should reject)
  - [ ] Invalid: large-file.pdf (>5MB) ❌ (should reject)
- [ ] After selecting valid PDF:
- [ ] Upload starts (show progress indicator)
- [ ] Check Network tab:
  - [ ] POST /api/creditnotes/{id}/upload called
  - [ ] multipart/form-data content type
  - [ ] Status: 200 (success)
  - [ ] Response includes documentUrl, documentFileName
- [ ] Document appears in Credit Note
  - [ ] File name displays
  - [ ] Upload date shows
- [ ] Success message displays

### Console Checks (Upload)
- [ ] POST /upload endpoint called
- [ ] 200 response received
- [ ] Document stored correctly
- [ ] No file size errors for valid files
- [ ] Validation errors for invalid files

---

### Download Document
- [ ] Find credit note with uploaded document
- [ ] Click "Download" button next to document
- [ ] Check Network tab:
  - [ ] GET /api/creditnotes/{id}/download called
  - [ ] Status: 200 (success)
  - [ ] Content-Type: application/pdf
- [ ] File downloads automatically
- [ ] Downloaded file is valid PDF
- [ ] Can open in PDF reader

### Console Checks (Download)
- [ ] GET /download endpoint called
- [ ] 200 response received
- [ ] Binary data streamed correctly
- [ ] File opens without corruption

---

## 🧪 PHASE 5: Filtering & Search

### Filter by Status
- [ ] List page shows filters
- [ ] Filter options:
  - [ ] All (no filter)
  - [ ] Pending
  - [ ] Approved
  - [ ] Rejected
- [ ] Select "Approved"
- [ ] Check Network tab:
  - [ ] GET /api/creditnotes?status=Approved
- [ ] List shows only approved credit notes
- [ ] Count is correct

### Filter by Customer
- [ ] Use Customer ID filter
- [ ] Enter: 1
- [ ] Check Network tab:
  - [ ] GET /api/creditnotes?customerId=1
- [ ] List shows only that customer's CNs

### Filter by Invoice
- [ ] Use Invoice ID filter
- [ ] Enter: 1
- [ ] Check Network tab:
  - [ ] GET /api/creditnotes?invoiceId=1
- [ ] List shows only that invoice's CNs

### Filter by Date Range
- [ ] Date From: 2026-01-01
- [ ] Date To: 2026-02-02
- [ ] Check Network tab:
  - [ ] GET /api/creditnotes?dateFrom=2026-01-01&dateTo=2026-02-02
- [ ] List shows only CNs in date range

### Search
- [ ] Search box accepts text
- [ ] Enter: "damaged"
- [ ] Check Network tab:
  - [ ] GET /api/creditnotes?search=damaged
- [ ] List shows CNs matching reason/number
- [ ] Results accurate

---

## 🧪 PHASE 6: Error Handling

### Test 401 Unauthorized
- [ ] Log out or clear token
- [ ] Try to load credit notes
- [ ] Should show error message
- [ ] Check Network tab:
  - [ ] 401 Unauthorized response
- [ ] UI shows login redirect

### Test 400 Bad Request
- [ ] Create CN with invalid data:
  - [ ] Amount: -100 (negative)
  - [ ] Reason: "" (empty)
  - [ ] Amount > Invoice amount
- [ ] Form validation error displays
- [ ] Error message is clear

### Test 404 Not Found
- [ ] Try to open non-existent CN
- [ ] URL: /creditnotes/99999
- [ ] Show error: "Credit note not found"
- [ ] Check Network tab:
  - [ ] 404 response

### Test File Upload Errors
- [ ] Upload > 5MB file
  - [ ] Error: "File too large"
- [ ] Upload .txt file
  - [ ] Error: "Only PDF allowed"
- [ ] Validation prevents submission

---

## 🧪 PHASE 7: VAT Pricing (If Enabled)

### Check VAT Display
- [ ] Sales dashboard loads
- [ ] Prices display correctly
- [ ] No "×1.15" calculations visible
- [ ] Format: R115.00 (not R100.00 + R15.00)

### VAT Breakdown (if available)
- [ ] Detail view shows:
  - [ ] Total (VAT Inclusive)
  - [ ] VAT Exclusive amount
  - [ ] VAT amount (15%)

---

## 📊 Browser Console Monitoring

### Monitor for These Errors
```
❌ HTTP 401 Unauthorized → Check token
❌ HTTP 404 Not Found → Check endpoint URL
❌ HTTP 400 Bad Request → Check request data
❌ api// (double slash) → URL normalization issue
❌ "Invalid column name" → Database schema issue
❌ CORS errors → Server configuration issue
```

### Expected OK Messages
```
✅ 200 OK → Success
✅ 201 Created → Resource created
✅ /api/creditnotes (single slash)
✅ Authorization: Bearer [token]
✅ Content-Type: application/json
```

---

## 📋 Sign-Off Checklist

### All Tests Pass
- [ ] Phase 1: Auth & Navigation ✅
- [ ] Phase 2: CRUD Operations ✅
- [ ] Phase 3: Approval Workflow ✅
- [ ] Phase 4: Documents ✅
- [ ] Phase 5: Filters & Search ✅
- [ ] Phase 6: Error Handling ✅
- [ ] Phase 7: VAT Pricing ✅

### No Critical Issues
- [ ] No 500 errors
- [ ] No database errors
- [ ] No authentication issues
- [ ] No URL format issues
- [ ] All endpoints respond
- [ ] All validations work

### Ready for Production
- [ ] All CRUD operations functional
- [ ] Workflows complete
- [ ] Document upload/download working
- [ ] Filters work correctly
- [ ] Error handling in place
- [ ] No console errors

---

## 🐛 Bug Report Template

If you find an issue, document it with:

```
**Bug:** [Title]
**Severity:** Critical / High / Medium / Low
**Steps to Reproduce:**
1. [Step 1]
2. [Step 2]
3. [Step 3]

**Expected Result:** [What should happen]
**Actual Result:** [What actually happened]

**Network Tab:**
- Request: [Method] [URL]
- Status: [Code]
- Response: [Error message]

**Console Error:** [Exact error text]

**Browser:** [Chrome/Edge/Firefox]
**Version:** [Version number]
```

---

## ✅ Testing Complete!

Once all phases pass, credit notes feature is **PRODUCTION READY** 🚀

**Report Results To:** Backend Team / QA Lead
