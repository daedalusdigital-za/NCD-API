# NDCANGU Medical Management API - Complete Documentation

## Project Overview

The **NDCANGU Medical Management API** is a comprehensive healthcare management system designed to support **Non-Communicable Disease (NCD) prevention and management** in South Africa. The system provides RESTful APIs for managing training programs, medical inventory, sales transactions, credit notes, and healthcare location data.

### Key Features
- **Healthcare Training Management** - Schedule, track, and document NCD prevention training sessions
- **Medical Inventory Control** - Track medical equipment, supplies, and medications with stock management
- **Sales & Invoicing** - Process sales transactions to healthcare facilities with VAT support
- **Credit Notes Management** - Handle returns and adjustments with approval workflows
- **Location Services** - Manage provinces, clinics, and healthcare facilities across South Africa
- **Dashboard Analytics** - Real-time metrics on training, equipment distribution, and operations

### Technical Stack
| Component | Technology |
|-----------|------------|
| Framework | .NET 7/8 Web API |
| Architecture | Clean Architecture (Domain, Application, Infrastructure) |
| Database | SQL Server |
| Authentication | JWT Bearer Token |
| Documentation | Swagger/OpenAPI |
| Hosting | Azure App Service |

### Environments

| Environment | Base URL | Status |
|-------------|----------|--------|
| **Production** | `https://ngcanduapi.azurewebsites.net` | ✅ Live |
| **Swagger Docs** | `https://ngcanduapi.azurewebsites.net/swagger/index.html` | ✅ Available |

---

## Authentication

All endpoints (except Auth endpoints) require **JWT Bearer token authentication**.

### How to Authenticate
1. Login via `/api/Auth/Login` to receive a JWT token
2. Include token in the `Authorization` header: `Bearer {token}`

---

## API Endpoints Reference

### 🔐 Authentication Controller (`/api/Auth`)

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/Auth/Register` | Register a new user account | No |
| POST | `/api/Auth/Login` | Authenticate and receive JWT token | No |

#### POST `/api/Auth/Register`
**Request Body:**
```json
{
  "email": "string",
  "password": "string",
  "phoneNumber": "string",
  "firstName": "string",
  "lastName": "string"
}
```

#### POST `/api/Auth/Login`
**Request Body:**
```json
{
  "email": "string",
  "password": "string"
}
```
**Response:** `LoginResponse` with JWT token, user ID, name, email, and roles

---

### 👥 User Controller (`/api/User`)

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/User/Add` | Add new user (Admin only) | Yes (Admin) |
| GET | `/api/User/GetUsers` | Get all users (Admin only) | Yes (Admin) |
| GET | `/api/User/GetUserById` | Get user by ID | Yes |
| PATCH | `/api/User/UpdateUser` | Update user details | Yes |
| DELETE | `/api/User/Delete` | Delete user (Admin only) | Yes (Admin) |
| POST | `/api/User/ChangePassword` | Change user password (Admin only) | Yes (Admin) |

**Query Parameters:**
- `GetUserById`: `id` (int)
- `Delete`: `id` (int)

---

### 👤 User Profile Controller (`/api/UserProfile`)

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/UserProfile/Add` | Add user profile | Yes |
| GET | `/api/UserProfile/GetAll` | Get all user profiles | Yes |
| GET | `/api/UserProfile/GetById` | Get profile by ID | Yes |
| GET | `/api/UserProfile/GetByUserId` | Get profile for current user | Yes |
| PATCH | `/api/UserProfile/Update` | Update user profile | Yes |
| DELETE | `/api/UserProfile/Delete` | Delete user profile | Yes |

---

### 🎭 Role Controller (`/api/Role`)

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/api/Role/GetRoles` | Get all roles | Yes |
| POST | `/api/Role/Add` | Create new role | Yes |
| PATCH | `/api/Role/Update` | Update existing role | Yes |

---

### 🏢 Position Controller (`/api/Position`)

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/Position/Add` | Add new position | Yes |
| GET | `/api/Position/GetAll` | Get all positions | Yes |
| GET | `/api/Position/GetById` | Get position by ID | Yes |
| PATCH | `/api/Position/Update` | Update position | Yes |
| DELETE | `/api/Position/Delete` | Delete position | Yes |

---

### 📞 Contact Details Controller (`/api/ContactDetails`)

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/ContactDetails/Add` | Add contact details | Yes |
| GET | `/api/ContactDetails/GetAll` | Get all contact details | Yes |
| GET | `/api/ContactDetails/GetByUserId` | Get contact details by user ID | Yes |
| PATCH | `/api/ContactDetails/Update` | Update contact details | Yes |
| DELETE | `/api/ContactDetails/Delete` | Delete contact details | Yes |

---

### 🌍 Location Controller (`/api/Location`)

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/api/Location/GetProvinces` | Get all South African provinces | Yes |
| GET | `/api/Location/GetClinics` | Get all clinics | Yes |
| GET | `/api/Location/GetClinicsByProvince` | Get clinics filtered by province | Yes |

**Query Parameters:**
- `GetClinicsByProvince`: `province` (string - province name)

---

### 👨‍🏫 Trainer Controller (`/api/Trainer`)

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/Trainer/Add` | Add new trainer | Yes |
| GET | `/api/Trainer/GetAll` | Get all trainers | No |
| GET | `/api/Trainer/GetById` | Get trainer by ID | No |
| PATCH | `/api/Trainer/Update` | Update trainer details | Yes |
| DELETE | `/api/Trainer/Delete` | Delete trainer | Yes |

**Query Parameters:**
- `GetById`: `id` (int)
- `Delete`: `id` (int)

---

### 📚 Training Controller (`/api/Training`)

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/Training/Add` | Create new training session | Yes |
| PATCH | `/api/Training/Update` | Update training session | Yes |
| DELETE | `/api/Training/Delete` | Delete training session | Yes |
| GET | `/api/Training/GetById` | Get training session by ID | Yes |
| GET | `/api/Training/GetAll` | Get all training sessions | Yes |
| GET | `/api/Training/GetByProvince` | Get sessions by province | Yes |
| GET | `/api/Training/GetByDateRange` | Get sessions within date range | Yes |
| GET | `/api/Training/GetByTrainer` | Get sessions by trainer | Yes |
| GET | `/api/Training/GetByStatus` | Get sessions by status | Yes |
| GET | `/api/Training/GetStats` | Get training statistics | Yes |

#### Training Document Management

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/Training/UploadPDF` | Upload training document (PDF) | Yes |
| GET | `/api/Training/DownloadPDF/{documentId}` | Download training document | Yes |
| GET | `/api/Training/{trainingSessionId}/PDFs` | Get all documents for a session | Yes |
| DELETE | `/api/Training/DeletePDF/{documentId}` | Delete training document | Yes |

**Query Parameters:**
- `GetById`: `id` (int)
- `GetByProvince`: `provinceName` (string)
- `GetByDateRange`: `startDate` (DateTime), `endDate` (DateTime)
- `GetByTrainer`: `trainerId` (int)
- `GetByStatus`: `status` (TrainingStatus enum - e.g., Scheduled, Completed, Cancelled)

**TrainingStatus Values:**
- `Scheduled` - Training is planned
- `InProgress` - Training is currently happening
- `Completed` - Training has been completed
- `Cancelled` - Training was cancelled

---

### 📦 Inventory Controller (`/api/Inventory`)

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/Inventory/Add` | Add new inventory item | Yes |
| PATCH | `/api/Inventory/Update` | Update inventory item | Yes |
| PATCH | `/api/Inventory/UpdateStock` | Update stock quantity | Yes |
| DELETE | `/api/Inventory/Delete` | Delete inventory item | Yes |
| GET | `/api/Inventory/GetById` | Get inventory item by ID | No |
| GET | `/api/Inventory/GetAll` | Get all inventory items | No |
| GET | `/api/Inventory/GetByCategory` | Get items by category | Yes |
| GET | `/api/Inventory/GetLowStock` | Get items below reorder point | Yes |
| GET | `/api/Inventory/GetByStatus` | Get items by status | Yes |
| GET | `/api/Inventory/GetStats` | Get inventory statistics | Yes |

**Query Parameters:**
- `GetById`: `id` (int)
- `GetByCategory`: `category` (InventoryCategory enum)
- `GetByStatus`: `status` (InventoryStatus enum)

**InventoryCategory Values:**
- `Equipment` - Medical equipment (HGT Meters, etc.)
- `Supplies` - Consumable medical supplies (HGT Strips, etc.)
- `Medication` - Medicines and pharmaceuticals

**Key Inventory Items (SKU Examples):**
- `NDOH35004` - Medical equipment
- `NDOH35017` - Medical supplies
- `NDOH35034` - High-value medical equipment

---

### 💰 Sales Controller (`/api/Sales`)

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/Sales/Add` | Create new sale/invoice | Yes |
| PUT/PATCH | `/api/Sales/Update` | Update sale | Yes |
| DELETE | `/api/Sales/Delete` | Delete sale | Yes |
| GET | `/api/Sales/GetById` | Get sale by ID | Yes |
| GET | `/api/Sales/GetAll` | Get all sales | Yes |
| GET | `/api/Sales/Count` | Get total sales count | Yes |
| GET | `/api/Sales/GetByDateRange` | Get sales within date range | Yes |
| GET | `/api/Sales/GetByProvince` | Get sales by province | Yes |
| GET | `/api/Sales/GetStats` | Get sales statistics | Yes |
| GET | `/api/Sales/GetProvincialData` | Get provincial sales breakdown | Yes |
| GET | `/api/Sales/GetTopProducts` | Get best-selling products | Yes |
| GET | `/api/Sales/GetRecentSales` | Get most recent sales | Yes |
| GET | `/api/Sales/GetDashboardStats` | Get dashboard statistics | Yes |
| GET | `/api/Sales/Credited` | Get sales with credit notes | Yes |

**Query Parameters:**
- `GetById`: `id` (int)
- `GetByDateRange`: `startDate` (DateTime), `endDate` (DateTime)
- `GetByProvince`: `province` (string)
- `GetTopProducts`: `limit` (int, default: 10)
- `GetRecentSales`: `limit` (int, default: 10)
- `Credited`: `status` (string, optional), `dateFrom` (DateTime, optional), `dateTo` (DateTime, optional)

**Sale Model:**
```json
{
  "id": 0,
  "saleNumber": "IN163336",
  "saleDate": "2026-02-17",
  "customerName": "PROVINCIAL PHARM SUPPLY DEPOT",
  "customerPhone": "",
  "notes": "",
  "total": 20479.50,
  "items": [
    {
      "inventoryItemId": 1,
      "sku": "NDOH35004",
      "quantity": 150.00,
      "unitPrice": 136.53,
      "totalPrice": 20479.50
    }
  ]
}
```

---

### 📋 Credit Notes Controller (`/api/CreditNotes`)

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/api/CreditNotes` | Get all credit notes with filtering | Yes |
| GET | `/api/CreditNotes/{id}` | Get credit note by ID | Yes |
| POST | `/api/CreditNotes` | Create new credit note | Yes |
| PATCH | `/api/CreditNotes/{id}` | Update credit note | Yes |
| DELETE | `/api/CreditNotes/{id}` | Delete credit note (pending only) | Yes |
| POST | `/api/CreditNotes/{id}/upload` | Upload document for credit note | Yes |
| GET | `/api/CreditNotes/{id}/download` | Download credit note document | Yes |
| POST | `/api/CreditNotes/{id}/approve` | Approve credit note | Yes |
| POST | `/api/CreditNotes/{id}/reject` | Reject credit note | Yes |
| GET | `/api/CreditNotes/invoice/{invoiceId}` | Get credit notes for invoice | Yes |

**Query Parameters for GetAll:**
- `status` (string, optional) - Filter by status
- `customerId` (int, optional) - Filter by customer
- `invoiceId` (int, optional) - Filter by invoice
- `dateFrom` (DateTime, optional) - Start date filter
- `dateTo` (DateTime, optional) - End date filter
- `search` (string, optional) - Text search

**Credit Note Statuses:**
- `Pending` - Awaiting approval
- `Approved` - Credit note approved
- `Rejected` - Credit note rejected
- `Completed` - Credit note processed

**Create Credit Note:**
```json
{
  "invoiceId": 123,
  "reason": "Damaged goods returned",
  "creditAmount": 500.00,
  "items": [
    {
      "saleItemId": 1,
      "quantity": 2,
      "reason": "Defective items"
    }
  ]
}
```

**Approve Credit Note:**
```json
{
  "approvedBy": "Admin User"
}
```

**Reject Credit Note:**
```json
{
  "reason": "Insufficient documentation"
}
```

---

### � Delivery Controller (`/api/Delivery`)

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/Delivery/Add` | Create new delivery record | Yes |
| PATCH | `/api/Delivery/Update` | Update delivery details | Yes |
| PATCH | `/api/Delivery/UpdateStatus` | Update delivery status only | Yes |
| DELETE | `/api/Delivery/Delete` | Delete delivery (soft delete) | Yes |
| GET | `/api/Delivery/GetById` | Get delivery by ID | Yes |
| GET | `/api/Delivery/GetAll` | Get all deliveries | Yes |
| GET | `/api/Delivery/GetBySaleId` | Get deliveries for a sale | Yes |
| GET | `/api/Delivery/GetByProvince` | Get deliveries by province | Yes |
| GET | `/api/Delivery/GetByStatus` | Get deliveries by status | Yes |
| GET | `/api/Delivery/GetByDateRange` | Get deliveries within date range | Yes |
| GET | `/api/Delivery/GetByEquipmentType` | Get deliveries by equipment type | Yes |
| GET | `/api/Delivery/GetStats` | Get delivery statistics | Yes |
| GET | `/api/Delivery/GetStatsByEquipmentType` | Get stats by equipment type | Yes |
| GET | `/api/Delivery/GetStatsByProvince` | Get stats by province | Yes |

**Query Parameters:**
- `GetById`: `id` (int)
- `GetBySaleId`: `saleId` (int)
- `GetByProvince`: `province` (string)
- `GetByStatus`: `status` (DeliveryTrackingStatus enum)
- `GetByDateRange`: `startDate` (DateTime), `endDate` (DateTime)
- `GetByEquipmentType`: `itemDescription` (string)

**DeliveryTrackingStatus Values:**
| Value | Status | Description |
|-------|--------|-------------|
| 1 | `Pending` | Delivery not yet started |
| 2 | `InTransit` | Delivery in progress |
| 3 | `Delivered` | Successfully delivered |
| 4 | `Failed` | Delivery failed |
| 5 | `Returned` | Items returned |

**Create Delivery:**
```json
{
  "saleId": 123,
  "institutionName": "Provincial Pharmacy Depot",
  "province": "Gauteng",
  "itemDescription": "HGT Meters",
  "quantity": 50,
  "deliveryDate": "2026-03-20",
  "invoiceNumber": "IN163336",
  "status": 1,
  "driverName": "John Doe",
  "vehicleNumber": "GP 123 ABC",
  "notes": "Fragile medical equipment"
}
```

**Update Delivery Status:**
```json
{
  "deliveryId": 1,
  "status": 3,
  "recipientName": "Jane Smith",
  "recipientSignature": "base64_signature_string",
  "receivedDate": "2026-03-20T14:30:00",
  "notes": "Received in good condition"
}
```

**Delivery Statistics Response:**
```json
{
  "totalDeliveries": 150,
  "pending": 25,
  "inTransit": 30,
  "delivered": 85,
  "failed": 5,
  "returned": 5,
  "deliveryRate": 56.67
}
```

**Delivery By Equipment Type Response:**
```json
[
  {
    "equipmentType": "HGT Meters",
    "totalOrdered": 500,
    "pending": 50,
    "inTransit": 75,
    "delivered": 350,
    "failed": 15,
    "returned": 10,
    "deliveryRate": 70.0
  },
  {
    "equipmentType": "HGT Strips",
    "totalOrdered": 10000,
    "pending": 1000,
    "inTransit": 1500,
    "delivered": 7000,
    "failed": 300,
    "returned": 200,
    "deliveryRate": 70.0
  }
]
```

---

### �📊 Dashboard Controller (`/api/Dashboard`)

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/api/Dashboard/GetTrainingStats` | Training statistics | Yes |
| GET | `/api/Dashboard/GetProvinceStats` | Province-level statistics | Yes |
| GET | `/api/Dashboard/GetNationalTotals` | National totals | Yes |
| GET | `/api/Dashboard/GetHGTMeterDistribution` | HGT Meter distribution data | Yes |
| GET | `/api/Dashboard/GetHGTStripDistribution` | HGT Strip distribution data | Yes |
| GET | `/api/Dashboard/GetEquipmentStats` | Equipment statistics | Yes |
| GET | `/api/Dashboard/GetOccupationStats` | Staff occupation statistics | Yes |

---

### ⚙️ Priority Controller (`/api/Priority`)

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/Priority/Add` | Add new priority level | Yes |
| GET | `/api/Priority/GetAll` | Get all priority levels | Yes |
| GET | `/api/Priority/GetById` | Get priority by ID | Yes |
| PATCH | `/api/Priority/Update` | Update priority | Yes |
| DELETE | `/api/Priority/Delete` | Delete priority | Yes |

---

### 🔒 Permission Controller (`/api/Permission`)
*Note: Hidden from Swagger documentation*

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/api/Permission/GetAllPermission` | Get all permissions | Yes |

---

## Data Models

### Sale
| Field | Type | Description |
|-------|------|-------------|
| Id | int | Primary key |
| SaleNumber | string | Invoice number (e.g., "IN163336") |
| SaleDate | DateTime | Date of sale |
| CustomerName | string | Customer/facility name |
| CustomerPhone | string | Customer contact number |
| Notes | string | Additional notes |
| Total | decimal | Total sale amount |
| IsDeleted | bool | Soft delete flag |
| CreatedDate | DateTime | Record creation date |
| CreatedBy | int | User who created the record |

### SaleItem
| Field | Type | Description |
|-------|------|-------------|
| Id | int | Primary key |
| SaleId | int | Foreign key to Sale |
| InventoryItemId | int | Foreign key to InventoryItem |
| Quantity | decimal | Quantity sold |
| UnitPrice | decimal | Price per unit |
| TotalPrice | decimal | Line total (Quantity × UnitPrice) |
| IsDeleted | bool | Soft delete flag |

### InventoryItem
| Field | Type | Description |
|-------|------|-------------|
| Id | int | Primary key |
| SKU | string | Stock keeping unit code |
| Name | string | Item name |
| Description | string | Item description |
| Category | InventoryCategory | Equipment/Supplies/Medication |
| Quantity | int | Current stock level |
| ReorderPoint | int | Low stock threshold |
| UnitPrice | decimal | Price per unit |
| Status | InventoryStatus | Active/Inactive/Discontinued |

### CreditNote
| Field | Type | Description |
|-------|------|-------------|
| Id | int | Primary key |
| CreditNoteNumber | string | Unique credit note number |
| InvoiceId | int | Related sale/invoice ID |
| Amount | decimal | Credit amount |
| Reason | string | Reason for credit |
| Status | string | Pending/Approved/Rejected/Completed |
| DocumentPath | string | Path to uploaded document |
| ApprovedBy | string | User who approved |
| ApprovedDate | DateTime | Approval date |[:
| CreatedDate | DateTime | Creation date |

### Delivery
| Field | Type | Description |
|-------|------|-------------|
| Id | int | Primary key |
| DeliveryNumber | string | Unique delivery number (e.g., "DEL000001") |
| SaleId | int | Foreign key to Sale |
| InstitutionName | string | Destination facility name |
| Province | string | Province name |
| ItemDescription | string | Description of items being delivered |
| Quantity | int | Number of items |
| DeliveryDate | DateTime | Scheduled delivery date |
| InvoiceNumber | string | Related invoice number |
| Status | DeliveryTrackingStatus | Pending/InTransit/Delivered/Failed/Returned |
| DriverName | string | Delivery driver name |
| VehicleNumber | string | Vehicle registration number |
| RecipientName | string | Person who received delivery |
| RecipientSignature | string | Signature confirmation |
| ReceivedDate | DateTime | Actual receipt date |
| Notes | string | Additional notes |
| IsDeleted | bool | Soft delete flag |
| DateCreated | DateTime | Record creation date |
| LastUpdated | DateTime | Last update date |

### TrainingSession
| Field | Type | Description |
|-------|------|-------------|
| Id | int | Primary key |
| TrainerId | int | Assigned trainer ID |
| ProvinceId | int | Province ID |
| TrainingName | string | Name of training |
| TrainingType | string | Type of training |
| Venue | string | Training location |
| StartDate | DateTime | Training start date |
| NumberOfParticipants | int | Number of attendees |
| TargetAudience | string | Intended audience |
| Status | int | Training status |

### Trainer
| Field | Type | Description |
|-------|------|-------------|
| Id | int | Primary key |
| Name | string | Trainer name |
| Specialization | string | Area of expertise |
| Certifications | string | Professional certifications |
| Status | int | Active/Inactive |

---

## Error Handling

All endpoints return standard HTTP status codes:

| Status Code | Meaning |
|-------------|---------|
| 200 OK | Request successful |
| 201 Created | Resource created successfully |
| 204 No Content | Deletion successful |
| 400 Bad Request | Invalid request data |
| 401 Unauthorized | Authentication required |
| 403 Forbidden | Insufficient permissions |
| 404 Not Found | Resource not found |
| 422 Unprocessable Entity | Business rule violation |
| 500 Internal Server Error | Server error |

**Error Response Format:**
```json
{
  "message": "Error description",
  "errors": ["Detailed error 1", "Detailed error 2"]
}
```

---

## Typical Workflows

### 1. User Registration & Login
```
1. POST /api/Auth/Register → Create account
2. POST /api/Auth/Login → Get JWT token
3. Use token in Authorization header for all subsequent requests
```

### 2. Creating a Sale
```
1. GET /api/Inventory/GetAll → Get available items
2. POST /api/Sales/Add → Create sale with items
3. GET /api/Sales/GetById → Verify sale created
```

### 3. Processing a Credit Note
```
1. POST /api/CreditNotes → Create credit note for a sale
2. POST /api/CreditNotes/{id}/upload → Upload supporting document
3. POST /api/CreditNotes/{id}/approve → Approve the credit note
```

### 4. Managing Training Sessions
```
1. GET /api/Trainer/GetAll → Get available trainers
2. GET /api/Location/GetProvinces → Get provinces
3. POST /api/Training/Add → Create training session
4. POST /api/Training/UploadPDF → Upload training materials
```

---

## South African Healthcare Context

This API is specifically designed for the South African healthcare system:

- **Provinces**: All 9 SA provinces supported (Gauteng, Western Cape, KwaZulu-Natal, etc.)
- **Healthcare Facilities**: Community Health Centres (CHC), clinics, hospitals
- **NCD Focus**: Non-Communicable Disease prevention (diabetes, hypertension)
- **Equipment**: HGT (Hemoglobin Glucose Testing) meters and strips for diabetes screening

---

## Last Updated
March 17, 2026

## API Version
v1.0.0
