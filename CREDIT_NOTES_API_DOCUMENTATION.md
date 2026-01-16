# Credit Notes API - Complete Endpoint Documentation

## Base URL
```
Development: https://localhost:7295/api
Production: [TBD]
```

---

## Authentication
```
Authorization: Bearer {token}
Note: Currently disabled for testing. Uncomment [Authorize] attribute before production.
```

---

## Endpoints Overview

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/CreditNotes` | Get all credit notes with filtering |
| GET | `/CreditNotes/{id}` | Get credit note by ID |
| POST | `/CreditNotes` | Create new credit note |
| PATCH | `/CreditNotes/{id}` | Update credit note |
| DELETE | `/CreditNotes/{id}` | Delete credit note (pending only) |
| POST | `/CreditNotes/{id}/upload` | Upload PDF document |
| GET | `/CreditNotes/{id}/download` | Download document |
| POST | `/CreditNotes/{id}/approve` | Approve credit note |
| POST | `/CreditNotes/{id}/reject` | Reject credit note |
| GET | `/CreditNotes/invoice/{invoiceId}` | Get credit notes by invoice |
| GET | `/Sales/Credited` | Get sales with credit notes |

---

## Detailed Endpoint Specifications

### 1. Get All Credit Notes

```http
GET /api/CreditNotes
```

**Query Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| status | string | No | Filter by status (pending, approved, rejected, completed) |
| customerId | int | No | Filter by customer ID |
| invoiceId | int | No | Filter by invoice/sale ID |
| dateFrom | DateTime | No | Filter from date (ISO 8601) |
| dateTo | DateTime | No | Filter to date (ISO 8601) |
| search | string | No | Search in credit note number, customer name, invoice number |

**Example Requests:**
```http
GET /api/CreditNotes
GET /api/CreditNotes?status=pending
GET /api/CreditNotes?search=CN-2026-001
GET /api/CreditNotes?dateFrom=2026-01-01&dateTo=2026-01-31
GET /api/CreditNotes?invoiceId=123
```

**Response: 200 OK**
```json
[
  {
    "id": 1,
    "creditNoteNumber": "CN-2026-001",
    "invoiceId": 123,
    "invoiceNumber": "SAL-202601-0145",
    "customerId": null,
    "customerName": "Groote Schuur Hospital",
    "originalAmount": 15000.00,
    "creditAmount": 15000.00,
    "reason": "Defective equipment returned",
    "status": "approved",
    "reverseStock": true,
    "reverseSale": true,
    "notes": "Full refund issued",
    "uploadedDocument": {
      "fileName": "CN-2026-001.pdf",
      "fileUrl": "/uploads/credit-notes/CN-2026-001.pdf",
      "uploadedDate": "2026-01-15T10:30:00Z"
    },
    "createdDate": "2026-01-15T09:00:00Z",
    "approvedDate": "2026-01-15T14:00:00Z",
    "approvedBy": "admin@ndcangu.com",
    "lastUpdated": "2026-01-15T14:00:00Z"
  }
]
```

---

### 2. Get Credit Note by ID

```http
GET /api/CreditNotes/{id}
```

**Path Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| id | int | Yes | Credit note ID |

**Example Request:**
```http
GET /api/CreditNotes/1
```

**Response: 200 OK**
```json
{
  "id": 1,
  "creditNoteNumber": "CN-2026-001",
  "invoiceId": 123,
  "invoiceNumber": "SAL-202601-0145",
  "customerId": null,
  "customerName": "Groote Schuur Hospital",
  "originalAmount": 15000.00,
  "creditAmount": 15000.00,
  "reason": "Defective equipment returned",
  "status": "approved",
  "reverseStock": true,
  "reverseSale": true,
  "notes": "Full refund issued",
  "uploadedDocument": {
    "fileName": "CN-2026-001.pdf",
    "fileUrl": "/uploads/credit-notes/CN-2026-001.pdf",
    "uploadedDate": "2026-01-15T10:30:00Z"
  },
  "createdDate": "2026-01-15T09:00:00Z",
  "approvedDate": "2026-01-15T14:00:00Z",
  "approvedBy": "admin@ndcangu.com",
  "lastUpdated": "2026-01-15T14:00:00Z"
}
```

**Error Responses:**
- `404 Not Found` - Credit note not found
```json
{
  "message": "Credit note not found"
}
```

---

### 3. Create Credit Note

```http
POST /api/CreditNotes
Content-Type: application/json
```

**Request Body:**
```json
{
  "invoiceId": 123,
  "creditAmount": 15000.00,
  "reason": "Defective equipment returned",
  "notes": "Customer reported issues with equipment",
  "reverseStock": true,
  "reverseSale": true
}
```

**Field Descriptions:**
| Field | Type | Required | Validation |
|-------|------|----------|------------|
| invoiceId | int | Yes | Must exist in Sales table |
| creditAmount | decimal | Yes | > 0, <= original sale amount |
| reason | string | Yes | Max 2000 characters |
| notes | string | No | Max 2000 characters |
| reverseStock | bool | No | Default: false |
| reverseSale | bool | No | Default: true |

**Auto-Populated Fields (from Invoice):**
- `invoiceNumber`
- `customerId`
- `customerName`
- `originalAmount`

**Response: 201 Created**
```json
{
  "id": 1,
  "creditNoteNumber": "CN-2026-001",
  "invoiceId": 123,
  "invoiceNumber": "SAL-202601-0145",
  "customerId": null,
  "customerName": "Groote Schuur Hospital",
  "originalAmount": 15000.00,
  "creditAmount": 15000.00,
  "reason": "Defective equipment returned",
  "status": "pending",
  "reverseStock": true,
  "reverseSale": true,
  "notes": "Customer reported issues with equipment",
  "uploadedDocument": null,
  "createdDate": "2026-01-16T10:00:00Z",
  "approvedDate": null,
  "approvedBy": null,
  "lastUpdated": "2026-01-16T10:00:00Z"
}
```

**Error Responses:**

`400 Bad Request` - Invalid data or invoice not found
```json
{
  "message": "Invoice not found"
}
```

`422 Unprocessable Entity` - Credit amount exceeds original
```json
{
  "message": "Credit amount cannot exceed original amount"
}
```

---

### 4. Update Credit Note

```http
PATCH /api/CreditNotes/{id}
Content-Type: application/json
```

**Path Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| id | int | Yes | Credit note ID |

**Request Body (all fields optional):**
```json
{
  "creditAmount": 12000.00,
  "reason": "Partial refund - 3 items defective",
  "notes": "Updated after inspection",
  "status": "approved",
  "approvedBy": "admin@ndcangu.com",
  "reverseStock": true,
  "reverseSale": true
}
```

**Valid Status Transitions:**
- `pending` → `approved`
- `pending` → `rejected`
- `approved` → `completed`

**Response: 200 OK**
```json
{
  "id": 1,
  "creditNoteNumber": "CN-2026-001",
  "status": "approved",
  "creditAmount": 12000.00,
  "lastUpdated": "2026-01-16T11:00:00Z"
  // ... other fields
}
```

**Error Responses:**

`404 Not Found` - Credit note not found
```json
{
  "message": "Credit note not found"
}
```

`400 Bad Request` - Invalid status transition
```json
{
  "message": "Cannot transition from approved to pending"
}
```

---

### 5. Delete Credit Note

```http
DELETE /api/CreditNotes/{id}
```

**Path Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| id | int | Yes | Credit note ID |

**Constraints:**
- Can only delete credit notes with status = "pending"
- Soft delete (sets IsDeleted = true)

**Response: 204 No Content**

**Error Responses:**

`404 Not Found` - Credit note not found
```json
{
  "message": "Credit note not found"
}
```

`400 Bad Request` - Cannot delete non-pending credit note
```json
{
  "message": "Only pending credit notes can be deleted"
}
```

---

### 6. Upload Document

```http
POST /api/CreditNotes/{id}/upload
Content-Type: multipart/form-data
```

**Path Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| id | int | Yes | Credit note ID |

**Form Data:**
| Field | Type | Required | Validation |
|-------|------|----------|------------|
| file | File | Yes | PDF only, max 5MB |

**Example Request (using curl):**
```bash
curl -X POST https://localhost:7295/api/CreditNotes/1/upload \
  -H "Content-Type: multipart/form-data" \
  -F "file=@credit_note_proof.pdf"
```

**Response: 200 OK**
```json
{
  "fileName": "CN-2026-001.pdf",
  "fileUrl": "/uploads/credit-notes/CN-2026-001.pdf",
  "uploadedDate": "2026-01-16T12:00:00Z"
}
```

**Error Responses:**

`404 Not Found` - Credit note not found
```json
{
  "message": "Credit note not found"
}
```

`400 Bad Request` - Invalid file type
```json
{
  "message": "Only PDF files are allowed"
}
```

`400 Bad Request` - File too large
```json
{
  "message": "File size exceeds 5MB"
}
```

---

### 7. Download Document

```http
GET /api/CreditNotes/{id}/download
```

**Path Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| id | int | Yes | Credit note ID |

**Response: 200 OK**
- Content-Type: `application/pdf`
- Content-Disposition: `attachment; filename="CN-2026-001.pdf"`
- Body: Binary PDF data

**Error Responses:**

`404 Not Found` - Credit note not found
```json
{
  "message": "Credit note not found"
}
```

`404 Not Found` - Document not found
```json
{
  "message": "No document found for this credit note"
}
```

---

### 8. Approve Credit Note

```http
POST /api/CreditNotes/{id}/approve
Content-Type: application/json
```

**Path Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| id | int | Yes | Credit note ID |

**Request Body:**
```json
{
  "approvedBy": "admin@ndcangu.com"
}
```

**Actions Performed:**
1. Status changed to "approved"
2. ApprovedDate set to current timestamp
3. If reverseStock = true: Inventory quantities increased
4. If reverseSale = true: Sale marked as credited

**Response: 200 OK**
```json
{
  "message": "Credit note approved successfully"
}
```

**Error Responses:**

`404 Not Found` - Credit note not found
```json
{
  "message": "Credit note not found"
}
```

`400 Bad Request` - Invalid operation
```json
{
  "message": "Only pending credit notes can be approved"
}
```

---

### 9. Reject Credit Note

```http
POST /api/CreditNotes/{id}/reject
Content-Type: application/json
```

**Path Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| id | int | Yes | Credit note ID |

**Request Body:**
```json
{
  "reason": "Insufficient documentation provided"
}
```

**Response: 200 OK**
```json
{
  "message": "Credit note rejected successfully"
}
```

**Error Responses:**

`404 Not Found` - Credit note not found
```json
{
  "message": "Credit note not found"
}
```

`400 Bad Request` - Invalid operation
```json
{
  "message": "Only pending credit notes can be rejected"
}
```

---

### 10. Get Credit Notes by Invoice

```http
GET /api/CreditNotes/invoice/{invoiceId}
```

**Path Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| invoiceId | int | Yes | Invoice/Sale ID |

**Response: 200 OK**
```json
[
  {
    "id": 1,
    "creditNoteNumber": "CN-2026-001",
    "creditAmount": 15000.00,
    "status": "approved",
    // ... other fields
  }
]
```

---

### 11. Get Credited Sales

```http
GET /api/Sales/Credited
```

**Query Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| status | string | No | Filter by credit note status |
| dateFrom | DateTime | No | Filter by sale date (from) |
| dateTo | DateTime | No | Filter by sale date (to) |

**Example Requests:**
```http
GET /api/Sales/Credited
GET /api/Sales/Credited?status=approved
GET /api/Sales/Credited?dateFrom=2026-01-01&dateTo=2026-01-31
```

**Response: 200 OK**
```json
[
  {
    "id": 123,
    "saleNumber": "SAL-202601-0145",
    "saleDate": "2026-01-10T00:00:00Z",
    "customerName": "Groote Schuur Hospital",
    "customerPhone": "+27123456789",
    "total": 15000.00,
    "notes": "Medical equipment order",
    "hasCreditNote": true,
    "creditedAmount": 15000.00,
    "saleItems": [
      {
        "id": 1,
        "inventoryItemId": 10,
        "inventoryItemName": "Glucose Meter",
        "quantity": 50,
        "unitPrice": 300.00,
        "totalPrice": 15000.00
      }
    ],
    "creditNotes": [
      {
        "id": 1,
        "creditNoteNumber": "CN-2026-001",
        "creditAmount": 15000.00,
        "status": "approved",
        "createdDate": "2026-01-15T09:00:00Z"
      }
    ]
  }
]
```

---

## Common Response Codes

| Code | Status | Description |
|------|--------|-------------|
| 200 | OK | Request successful |
| 201 | Created | Resource created successfully |
| 204 | No Content | Deletion successful |
| 400 | Bad Request | Invalid request data or business rule violation |
| 404 | Not Found | Resource not found |
| 422 | Unprocessable Entity | Validation failed (e.g., credit exceeds original) |
| 500 | Internal Server Error | Server error occurred |

---

## Status Values

| Value | Description |
|-------|-------------|
| pending | Awaiting approval |
| approved | Approved and processed |
| rejected | Rejected by approver |
| completed | Fully completed |

---

## Field Constraints

### Credit Note Fields
| Field | Type | Max Length | Nullable | Default |
|-------|------|------------|----------|---------|
| CreditNoteNumber | string | 50 | No | Auto-generated |
| InvoiceNumber | string | 50 | No | From invoice |
| CustomerName | string | 200 | No | From invoice |
| Reason | string | MAX | No | - |
| Notes | string | MAX | Yes | null |
| Status | string | 20 | No | "pending" |
| DocumentFileName | string | 255 | Yes | null |
| DocumentFileUrl | string | 500 | Yes | null |

---

## Business Rules

1. **Credit Amount Validation**
   - Must be greater than 0
   - Cannot exceed original sale amount
   - Sum of all credits for an invoice cannot exceed original amount

2. **Status Workflow**
   - New credit notes start as "pending"
   - Only pending can be approved or rejected
   - Only approved can move to completed
   - Rejected and completed are terminal states

3. **Deletion Rules**
   - Only pending credit notes can be deleted
   - Deletion is soft (IsDeleted flag)

4. **Stock Reversal**
   - Only happens when reverseStock = true AND status = approved
   - Increases inventory quantities for all items in sale
   - Updates inventory LastUpdated timestamp

5. **Sale Reversal**
   - Only happens when reverseSale = true AND status = approved
   - Sets sale.HasCreditNote = true
   - Updates sale.CreditedAmount with total credits

6. **File Upload**
   - Only PDF files accepted
   - Maximum size: 5MB
   - Overwrites existing file for same credit note
   - Filename format: {CreditNoteNumber}.pdf

---

## Rate Limiting
```
None currently implemented
Recommended: 100 requests per minute per user
```

---

## Versioning
```
Current Version: 1.0
No versioning strategy implemented yet
Future: /api/v1/CreditNotes
```

---

**API Documentation Version:** 1.0  
**Last Updated:** January 16, 2026  
**Swagger UI:** https://localhost:7295/swagger
