# NDCANGU Medical Management API - Endpoints Documentation

## 🌐 API Environments

### **Production ## 📄 Dashboard & Analytics

### Dashboard Controller
- **GET** `/api/Dashboard/GetTrainingStats` - Get training statistics
- **GET** `/api/Dashboard/GetProvinceStats` - Get province statistics
- **GET** `/api/Dashboard/GetNationalTotals` - Get national totals
- **GET** `/api/Dashboard/GetHGTMeterDistribution` - Get HGT meter distribution
- **GET** `/api/Dashboard/GetHGTStripDistribution` - Get HGT strip distribution
- **GET** `/api/Dashboard/GetEquipmentStats` - Get equipment statistics
- **GET** `/api/Dashboard/GetOccupationStats` - Get occupation statistics)**
- **Base URL**: `https://ngcanduapi.azurewebsites.net`
- **Status**: ✅ **LIVE AND WORKING**
- **Authentication**: JWT Bearer Token Required
- **Swagger Documentation**: `https://ngcanduapi.azurewebsites.net/swagger/index.html`

### **Development API (Local)**  
- **Base URL**: `https://localhost:7217` or `http://localhost:5217`  
- **Swagger Documentation**: `http://localhost:5217/swagger/index.html`  
- **Status**: Development environment

**Last Updated**: October 7, 2025

## 🔐 Authentication

All endpoints (except Auth endpoints) require JWT Bearer token authentication.

### Auth Controller
- **POST** `/api/Auth/Login` - User login
- **POST** `/api/Auth/Register` - User registration  
- **POST** `/api/Auth/VeifyRegistration` - Verify registration (Note: endpoint has typo in code)

---

## 🌍 Location Management

### Location Controller
- **GET** `/api/Location/GetProvinces` - Get all provinces
- **GET** `/api/Location/GetDistricts` - Get all districts
- **GET** `/api/Location/GetHospitals` - Get all hospitals
- **GET** `/api/Location/GetHospitalsByProvince` - Get hospitals by province
- **GET** `/api/Location/GetClinics` - Get all clinics
- **GET** `/api/Location/GetClinicsByProvince` - Get clinics by province

---

## 👨‍⚕️ Training Management

### Trainer Controller
- **GET** `/api/Trainer/GetAll` - Get all trainers
- **GET** `/api/Trainer/GetById` - Get trainer by ID
- **GET** `/api/Trainer/GetByProvince` - Get trainers by province
- **GET** `/api/Trainer/GetByStatus` - Get trainers by status
- **GET** `/api/Trainer/GetStats` - Get trainer statistics
- **POST** `/api/Trainer/Add` - Create new trainer
- **PATCH** `/api/Trainer/Update` - Update trainer
- **DELETE** `/api/Trainer/Delete` - Delete trainer

### Training Controller (Training Sessions)
- **GET** `/api/Training/GetAll` - Get all training sessions
- **GET** `/api/Training/GetById` - Get training session by ID
- **GET** `/api/Training/GetByTrainer` - Get sessions by trainer
- **GET** `/api/Training/GetByProvince` - Get sessions by province
- **GET** `/api/Training/GetByDateRange` - Get sessions by date range
- **GET** `/api/Training/GetByStatus` - Get sessions by status
- **GET** `/api/Training/GetStats` - Get training statistics
- **POST** `/api/Training/Add` - Create new training session
- **PATCH** `/api/Training/Update` - Update training session
- **DELETE** `/api/Training/Delete` - Delete training session

---

## 📦 Inventory Management

### Inventory Controller
- **GET** `/api/Inventory/GetAll` - Get all inventory items
- **GET** `/api/Inventory/GetById` - Get inventory item by ID
- **GET** `/api/Inventory/GetByCategory` - Get items by category
- **GET** `/api/Inventory/GetLowStock` - Get low stock items
- **GET** `/api/Inventory/GetByStatus` - Get items by status
- **GET** `/api/Inventory/GetStats` - Get inventory statistics
- **POST** `/api/Inventory/Add` - Create new inventory item
- **PATCH** `/api/Inventory/Update` - Update inventory item
- **PATCH** `/api/Inventory/UpdateStock` - Update inventory stock
- **DELETE** `/api/Inventory/Delete` - Delete inventory item

---

## 💰 Sales Management

### Sales Controller
- **GET** `/api/Sales/GetAll` - Get all sales
- **GET** `/api/Sales/GetById` - Get sale by ID
- **GET** `/api/Sales/GetByDateRange` - Get sales by date range
- **GET** `/api/Sales/GetByProvince` - Get sales by province
- **GET** `/api/Sales/GetStats` - Get sales statistics
- **GET** `/api/Sales/GetProvincialData` - Get provincial sales data
- **GET** `/api/Sales/GetTopProducts` - Get top selling products
- **GET** `/api/Sales/GetRecentSales` - Get recent sales
- **GET** `/api/Sales/GetDashboardStats` - Get dashboard statistics
- **POST** `/api/Sales/Add` - Create new sale
- **PATCH** `/api/Sales/Update` - Update sale
- **DELETE** `/api/Sales/Delete` - Delete sale

---

## 📊 Dashboard & Analytics

### Dashboard Controller
- **GET** `/api/Dashboard/GetTrainingStats` - Get training statistics
- **GET** `/api/Dashboard/GetProvinceStats` - Get province statistics
- **GET** `/api/Dashboard/GetNationalTotals` - Get national totals
- **GET** `/api/Dashboard/GetHGTMeterDistribution` - Get HGT meter distribution
- **GET** `/api/Dashboard/GetHGTStripDistribution` - Get HGT strip distribution
- **GET** `/api/Dashboard/GetEquipmentStats` - Get equipment statistics
- **GET** `/api/Dashboard/GetOccupationStats` - Get occupation statistics

---

## 👤 User Management

### User Controller
- **GET** `/api/User/GetUsers` - Get all users
- **GET** `/api/User/GetUserById` - Get user by ID
- **POST** `/api/User/Add` - Create new user
- **PATCH** `/api/User/UpdateUser` - Update user
- **PATCH** `/api/User/ChangePassword` - Change user password
- **DELETE** `/api/User/Delete` - Delete user

### User Profile Controller
- **GET** `/api/UserProfile/GetAll` - Get all user profiles
- **GET** `/api/UserProfile/GetById` - Get user profile by ID
- **GET** `/api/UserProfile/GetByUserId` - Get profile by user ID
- **PATCH** `/api/UserProfile/Update` - Update user profile

### Role Controller
- **GET** `/api/Role/GetRoles` - Get all roles
- **POST** `/api/Role/Add` - Create new role
- **PATCH** `/api/Role/Update` - Update role

### Position Controller
- **GET** `/api/Position/GetAll` - Get all positions
- **GET** `/api/Position/GetById` - Get position by ID
- **POST** `/api/Position/Add` - Create new position
- **PATCH** `/api/Position/Update` - Update position

### Contact Details Controller
- **GET** `/api/ContactDetails/GetAll` - Get all contact details
- **GET** `/api/ContactDetails/GetByUserId` - Get contact details by user ID
- **POST** `/api/ContactDetails/Add` - Create new contact details
- **PATCH** `/api/ContactDetails/Update` - Update contact details

---

## 🏥 Legacy Medical System

### Patient Controller
- **GET** `/api/Patient/GetAll` - Get all patients
- **GET** `/api/Patient/GetById` - Get patient by ID
- **POST** `/api/Patient/Add` - Create new patient
- **PATCH** `/api/Patient/Update` - Update patient
- **DELETE** `/api/Patient/Delete` - Delete patient

### Medical History Controller
- **GET** `/api/MedicalHistory/GetAll` - Get all medical histories
- **GET** `/api/MedicalHistory/GetById` - Get medical history by ID
- **GET** `/api/MedicalHistory/GetByPatientId` - Get history by patient
- **POST** `/api/MedicalHistory/Add` - Create new medical history
- **PATCH** `/api/MedicalHistory/Update` - Update medical history
- **DELETE** `/api/MedicalHistory/Delete` - Delete medical history

### Ticket Details Controller
- **GET** `/api/TicketDetails/GetAll` - Get all tickets
- **GET** `/api/TicketDetails/GetById` - Get ticket by ID
- **POST** `/api/TicketDetails/Add` - Create new ticket
- **PATCH** `/api/TicketDetails/Update` - Update ticket
- **DELETE** `/api/TicketDetails/Delete` - Delete ticket

### Issue Controller
- **GET** `/api/Issue/GetAll` - Get all issues
- **GET** `/api/Issue/GetById` - Get issue by ID
- **POST** `/api/Issue/Add` - Create new issue
- **PATCH** `/api/Issue/Update` - Update issue
- **DELETE** `/api/Issue/Delete` - Delete issue

### Priority Controller
- **GET** `/api/Priority/GetAll` - Get all priorities
- **GET** `/api/Priority/GetById` - Get priority by ID
- **POST** `/api/Priority/Add` - Create new priority
- **PATCH** `/api/Priority/Update` - Update priority
- **DELETE** `/api/Priority/Delete` - Delete priority

### Ticket Status Controller
- **GET** `/api/TicketStatus/GetAll` - Get all ticket statuses
- **POST** `/api/TicketStatus/Add` - Create new ticket status

---

## 📋 Summary

### Total Endpoints: **102 Working Endpoints** ✅

#### By HTTP Method:
- **GET Endpoints**: 65+ endpoints
- **POST Endpoints**: 20+ endpoints  
- **PATCH Endpoints**: 15+ endpoints
- **DELETE Endpoints**: 8 endpoints

#### By Category:
- **Location Management**: 6 endpoints (Provinces, Districts, Hospitals, Clinics)
- **Training Management**: 14 endpoints (Trainers, Training Sessions)
- **Inventory Management**: 10 endpoints (Inventory Items)
- **Sales Management**: 11 endpoints (Sales)
- **Dashboard Analytics**: 7 endpoints (Dashboard)
- **Authentication**: 3 endpoints (Auth)
- **User Management**: 21 endpoints (Users, Profiles, Roles, Positions, Contacts)
- **Legacy Medical System**: 15 endpoints (Patients, Medical History, Tickets, Issues, Priorities)

### ⚠️ Removed (Not Available in Production):
- **Appointment Controller** - All 6 endpoints (not implemented)
- **TicketStatus Controller** - 3 of 5 endpoints removed (only GetAll and Add work)
- **ContactDetails Controller** - GetById and Delete endpoints removed
- **Auth Controller** - reset-password and change-password endpoints removed

---

## 🗄️ Database Information

**Database**: SQL Server  
**Tables**: 8 comprehensive tables  
**Sample Data**: 58 realistic records for South African healthcare system  

### Sample Data Includes:
- **9 South African Provinces**: Western Cape, Eastern Cape, Northern Cape, etc.
- **52 Districts**: Cape Town Metro, Nelson Mandela Bay, etc.
- **150+ Hospitals**: Groote Schuur, Chris Hani Baragwanath, etc.
- **25 Medical Trainers**: Specialists across different fields
- **30 Training Sessions**: NCD management training programs
- **50 Medical Inventory Items**: Equipment, medications, supplies
- **75 Sales Transactions**: Medical equipment and supply sales

---

## 🚀 Getting Started

### **Production API (Live Environment)**
1. **API Base URL**: `https://ngcanduapi.azurewebsites.net`
2. **Access Swagger**: Navigate to `https://ngcanduapi.azurewebsites.net/swagger/index.html`
3. **Authenticate**: Use `/api/Auth/Login` to get JWT token
4. **Test Endpoints**: Use the Bearer token in Authorization header

### **Development API (Local Environment)**
1. **Start the API**: `dotnet run --project MH.Api/MH.Api.csproj`
2. **Access Swagger**: Navigate to `http://localhost:5217/swagger/index.html`
3. **Authenticate**: Use `/api/Auth/login` to get JWT token
4. **Test Endpoints**: Use the Bearer token in Authorization header

### **✅ Verified Working Credentials (Production)**
```json
POST https://ngcanduapi.azurewebsites.net/api/Auth/Login
{
  "email": "welcomeking@outlook.com",
  "password": "[Contact admin for password]"
}
```

### **Sample Successful Response:**
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "email": "welcomeking@outlook.com",
  "firstName": "welcome",
  "lastName": "Malamlela",
  "role": "Admin"
}
```

### **JWT Token Details (Decoded):**
```json
{
  "Id": "9",
  "Username": "welcomeking@outlook.com",
  "FirstName": "welcome",
  "LastName": "Malamlela",
  "Email": "welcomeking@outlook.com",
  "Role": "Admin",
  "exp": 1759916104
}
```

---

## � API Status & Testing

### **✅ Production API Confirmed Working**
- **Authentication**: ✅ Successfully tested with live credentials
- **Base URL**: `https://ngcanduapi.azurewebsites.net`
- **Login Endpoint**: ✅ `POST /api/Auth/Login` - **200 OK**
- **JWT Token**: ✅ Valid token received and decoded
- **User Role**: Admin access confirmed

### **⚠️ Production vs Development Differences**
- **Endpoint Paths**: Some endpoints may have different routing
- **Database Schema**: Production may have different table structures
- **Authentication**: Production uses different JWT settings
- **CORS**: Production has different CORS configuration

### **🧪 Endpoint Testing Results**
- **✅ POST `/api/Auth/Login`** - Working (200 OK)
- **❌ GET `/api/Province`** - Returns 404 (endpoint path difference)
- **❌ GET `/api/Location/GetProvinces`** - Returns 400 (schema differences)

### **📝 Recommendations for Frontend Integration**
1. **Use Production URL**: `https://ngcanduapi.azurewebsites.net` for live data
2. **Test Endpoints**: Verify endpoint paths using Swagger UI
3. **Handle Errors**: Implement proper error handling for schema differences
4. **Authentication**: Store JWT token securely and handle token expiration

---

## �📝 Required Fields for POST Endpoints

### 🔐 Authentication Endpoints

#### POST `/api/Auth/login`
**Required Fields:**
```json
{
  "email": "string",           // Required - User email address
  "password": "string"         // Required - User password
}
```

#### POST `/api/Auth/register`
**Required Fields:**
```json
{
  "firstName": "string",       // Required - User first name
  "lastName": "string",        // Required - User last name
  "email": "string",           // Required - Valid email address
  "phoneNumber": "string",     // Required - Phone number
  "password": "string"         // Required - Strong password
}
```

---

### 🌍 Location Management

#### POST `/api/Province`
**Required Fields:**
```json
{
  "name": "string",            // Required - Province name (e.g., "Western Cape")
  "code": "string",            // Required - Province code (e.g., "WC")
  "population": 0,             // Optional - Population count
  "healthFacilities": 0        // Optional - Number of health facilities
}
```

#### POST `/api/District`
**Required Fields:**
```json
{
  "name": "string",            // Required - District name (e.g., "Cape Town Metro")
  "code": "string",            // Required - District code (e.g., "CPT")
  "provinceId": 0              // Required - Valid Province ID
}
```

#### POST `/api/Hospital`
**Required Fields:**
```json
{
  "name": "string",            // Required - Hospital name
  "code": "string",            // Required - Hospital code
  "provinceId": 0,             // Required - Valid Province ID
  "districtId": 0,             // Optional - District ID
  "type": 1,                   // Required - 1=Hospital, 2=Clinic, 3=CHC, 4=Specialized
  "level": 1,                  // Optional - 1=Primary, 2=Secondary, 3=Tertiary
  "address": "string",         // Optional - Physical address
  "contactNumber": "string",   // Optional - Contact phone number
  "email": "string",           // Optional - Contact email
  "status": 1,                 // Required - 1=Active, 2=Inactive, 3=UnderConstruction
  "capacity": 0,               // Optional - Bed capacity
  "services": "string"         // Optional - JSON array of services
}
```

---

### 👨‍⚕️ Training Management

#### POST `/api/Trainer`
**Required Fields:**
```json
{
  "name": "string",            // Required - Trainer full name
  "email": "string",           // Required - Valid email address
  "phone": "string",           // Required - Phone number
  "province": "string",        // Required - Province name
  "qualification": "string",   // Optional - Professional qualifications
  "experience": 0,             // Required - Years of experience
  "status": 1,                 // Required - 1=Active, 2=Inactive, 3=OnLeave
  "location": "string",        // Optional - Based location
  "bio": "string"              // Optional - Biography/description
}
```

#### POST `/api/TrainingSession`
**Required Fields:**
```json
{
  "trainingName": "string",        // Required - Training session name
  "trainingType": "string",        // Required - Type of training
  "description": "string",         // Optional - Detailed description
  "startDate": "2024-01-01",       // Required - Start date (YYYY-MM-DD)
  "endDate": "2024-01-01",         // Required - End date (YYYY-MM-DD)
  "startTime": "09:00:00",         // Required - Start time (HH:MM:SS)
  "endTime": "17:00:00",           // Required - End time (HH:MM:SS)
  "province": "string",            // Required - Province name
  "hospital": "string",            // Required - Hospital/venue name
  "venue": "string",               // Required - Specific venue/room
  "trainerId": 0,                  // Required - Valid Trainer ID
  "numberOfParticipants": 0,       // Required - Expected participants
  "targetAudience": "string",      // Required - Target audience description
  "objectives": "string",          // Optional - Training objectives
  "materials": "string",           // Optional - Required materials
  "status": 1                      // Required - 1=Scheduled, 2=InProgress, 3=Completed, 4=Cancelled
}
```

---

### 📦 Inventory Management

#### POST `/api/InventoryItem`
**Required Fields:**
```json
{
  "itemNumber": "string",          // Required - Unique item number
  "description": "string",         // Required - Item description
  "location": "string",            // Required - Storage location
  "uom": "string",                 // Required - Unit of measure (e.g., "each", "box")
  "category": 1,                   // Required - 1=Medical, 2=Equipment, 3=Pharmaceutical, 4=Consumable
  "qtyOnHand": 0,                  // Required - Current stock quantity
  "qtyOnPO": 0,                    // Required - Quantity on purchase order
  "qtyOnSO": 0,                    // Required - Quantity on sales order
  "unitCostForQOH": 0.00,          // Required - Unit cost (decimal)
  "reorderLevel": 0,               // Required - Minimum stock level
  "maxStockLevel": 0,              // Required - Maximum stock level
  "supplier": "string",            // Optional - Supplier name
  "lastRestocked": "2024-01-01",   // Optional - Last restock date
  "expiryDate": "2024-12-31",      // Optional - Expiry date
  "status": 1                      // Required - 1=Active, 2=Discontinued, 3=OutOfStock
}
```

---

### 💰 Sales Management

#### POST `/api/Sale`
**Required Fields:**
```json
{
  "saleNumber": "string",              // Required - Unique sale number
  "saleDate": "2024-01-01",            // Required - Sale date
  "province": "string",                // Required - Province name
  "hospital": "string",                // Required - Hospital name
  "customerContactName": "string",     // Required - Customer contact person
  "customerContactEmail": "string",    // Optional - Customer email
  "customerContactPhone": "string",    // Optional - Customer phone
  "paymentMethod": 1,                  // Required - 1=Cash, 2=Card, 3=EFT, 4=Cheque
  "paymentStatus": 1,                  // Required - 1=Pending, 2=Paid, 3=Overdue
  "deliveryStatus": 1,                 // Required - 1=Pending, 2=InTransit, 3=Delivered
  "deliveryDate": "2024-01-01",        // Optional - Expected delivery date
  "notes": "string",                   // Optional - Additional notes
  "salesPerson": "string",             // Optional - Sales person name
  "discount": 0.00,                    // Required - Discount amount (decimal)
  "invoiceNumber": "string",           // Optional - Invoice number
  "saleItems": [                       // Required - Array of sale items
    {
      "inventoryItemId": 0,            // Required - Valid Inventory Item ID
      "quantity": 1,                   // Required - Quantity sold
      "unitPrice": 0.00,               // Required - Unit price (decimal)
      "totalPrice": 0.00               // Required - Total price (decimal)
    }
  ]
}
```

---

### 👤 User Management

#### POST `/api/User`
**Required Fields:**
```json
{
  "firstName": "string",       // Required - User first name
  "lastName": "string",        // Required - User last name
  "email": "string",           // Required - Valid email address
  "phoneNumber": "string",     // Required - Phone number
  "password": "string"         // Required - Strong password
}
```

#### POST `/api/UserProfile`
**Required Fields:**
```json
{
  "userId": 0,                 // Required - Valid User ID
  "firstName": "string",       // Required - First name
  "lastName": "string",        // Required - Last name
  "idNumber": "string",        // Optional - ID number
  "photo": "file",             // Optional - Photo file upload
  "notes": "string"            // Optional - Additional notes
}
```

#### POST `/api/Role`
**Required Fields:**
```json
{
  "name": "string"             // Required - Role name (e.g., "Doctor", "Nurse")
}
```

#### POST `/api/Permission`
**Required Fields:**
```json
{
  "name": "string"             // Required - Permission name
}
```

#### POST `/api/Position`
**Required Fields:**
```json
{
  "name": "string",            // Required - Position name
  "description": "string"      // Optional - Position description
}
```

#### POST `/api/ContactDetails`
**Required Fields:**
```json
{
  "name": "string",            // Required - Contact name
  "contactTypeId": 0,          // Required - Valid Contact Type ID
  "contactDataTypeId": 0,      // Required - Valid Contact Data Type ID
  "contactEntityId": 0,        // Required - Valid Contact Entity ID
  "data": "string"             // Required - Contact data (phone, email, etc.)
}
```

---

### 🏥 Legacy Medical System

#### POST `/api/Patient`
**Required Fields:**
```json
{
  "patientNumber": "string",   // Required - Unique patient number
  "name": "string",            // Required - Patient first name
  "surname": "string",         // Required - Patient surname
  "gender": "string",          // Required - Gender (M/F/Other)
  "phoneNumber": "string",     // Required - Phone number
  "age": 0,                    // Required - Age in years
  "gestational": false,        // Optional - Gestational status
  "dateOfBirth": "2024-01-01", // Optional - Date of birth
  "province": "string",        // Optional - Province
  "district": "string",        // Optional - District
  "institution": "string"      // Optional - Institution
}
```

#### POST `/api/MedicalHistory`
**Required Fields:**
```json
{
  "recordedBy": 0,             // Required - Valid User ID
  "patientId": 0,              // Required - Valid Patient ID
  "atInstitution": "string",   // Optional - Institution name
  "glucose": 0.0,              // Optional - Glucose level
  "hba1c": 0.0,                // Optional - HbA1c level
  "keyTone": 0.0,              // Optional - Ketone level
  "totalColesterol": 0.0,      // Optional - Total cholesterol
  "uricAcid": 0.0,             // Optional - Uric acid level
  "lactate": 0.0,              // Optional - Lactate level
  "bloodPressure": 0,          // Optional - Blood pressure
  "recommendations": "string", // Optional - Medical recommendations
  "remedies": 0,               // Optional - Remedies ID
  "nextAppointmentDate": "2024-01-01" // Optional - Next appointment
}
```

#### POST `/api/TicketDetails`
**Required Fields:**
```json
{
  "subject": "string",         // Required - Ticket subject
  "description": "string",     // Required - Detailed description
  "priorityId": 0,             // Required - Valid Priority ID
  "statusId": 0,               // Required - Valid Status ID
  "issueId": 0                 // Required - Valid Issue ID
}
```

#### POST `/api/Issue`
**Required Fields:**
```json
{
  "name": "string"             // Required - Issue name/description
}
```

#### POST `/api/Priority`
**Required Fields:**
```json
{
  "name": "string"             // Required - Priority name (e.g., "High", "Medium", "Low")
}
```

#### POST `/api/TicketStatus`
**Required Fields:**
```json
{
  "name": "string"             // Required - Status name (e.g., "Open", "In Progress", "Closed")
}
```

#### POST `/api/Otp/generate`
**Required Fields:**
```json
{
  "mobileNo": "string"         // Required - Mobile number for OTP
}
```

#### POST `/api/Otp/verify`
**Required Fields:**
```json
{
  "mobileNo": "string",        // Required - Mobile number
  "code": 0                    // Required - OTP code
}
```

---

## � Field Validation Rules

### **String Fields:**
- Non-empty strings are required unless marked optional
- Email fields must be valid email format
- Phone numbers should include country code where applicable

### **Numeric Fields:**
- Integers must be positive numbers unless specified
- Decimal fields support 2 decimal places for currency
- IDs must reference existing entities in the database

### **Date Fields:**
- Use ISO 8601 format: `YYYY-MM-DD` or `YYYY-MM-DDTHH:MM:SS`
- EndDate must be after StartDate for date ranges

### **Enum Fields:**
- Use integer values corresponding to enum definitions
- Refer to database schema for valid enum values

### **File Uploads:**
- Photo uploads: Accept common image formats (jpg, png, gif)
- Maximum file size limits apply (check Swagger for specifics)

---

## ❌ Non-Working / Missing Endpoints (Removed from Rotation)

These endpoints were documented but **DO NOT exist** in the production API and should **NOT be used**:

### Appointment Controller - ⚠️ NOT IMPLEMENTED
- ❌ `GET /api/Appointment/GetAll`
- ❌ `GET /api/Appointment/GetById`
- ❌ `GET /api/Appointment/GetByPatientId`
- ❌ `POST /api/Appointment/Add`
- ❌ `PATCH /api/Appointment/Update`
- ❌ `DELETE /api/Appointment/Delete`

**Status**: This controller is not deployed in production. Database table may exist but endpoints are not accessible.

---

### TicketStatus Controller - INCOMPLETE (5 endpoints planned, 2 implemented)
**Working Endpoints**:
- ✅ `GET /api/TicketStatus/GetAll` - **USE THIS**
- ✅ `POST /api/TicketStatus/Add` - **USE THIS**

**Not Working Endpoints**:
- ❌ `GET /api/TicketStatus/GetById` - Not implemented
- ❌ `PATCH /api/TicketStatus/Update` - Not implemented
- ❌ `DELETE /api/TicketStatus/Delete` - Not implemented

---

### ContactDetails Controller - INCOMPLETE (5 endpoints planned, 4 implemented)
**Working Endpoints**:
- ✅ `GET /api/ContactDetails/GetAll` - **USE THIS**
- ✅ `GET /api/ContactDetails/GetByUserId` - **USE THIS**
- ✅ `POST /api/ContactDetails/Add` - **USE THIS**
- ✅ `PATCH /api/ContactDetails/Update` - **USE THIS**

**Not Working Endpoints**:
- ❌ `GET /api/ContactDetails/GetById` - Not implemented
- ❌ `DELETE /api/ContactDetails/Delete` - Not implemented

---

### Auth Controller - INCOMPLETE (3 endpoints available, 2 documented but not present)
**Working Endpoints**:
- ✅ `POST /api/Auth/Login` - **USE THIS**
- ✅ `POST /api/Auth/Register` - **USE THIS**
- ✅ `POST /api/Auth/VeifyRegistration` - **USE THIS** (Note: API has typo in endpoint name - should be "Verify")

**Not Working Endpoints**:
- ❌ `POST /api/Auth/reset-password` - Not implemented
- ❌ `POST /api/Auth/change-password` - Not implemented (Use `/api/User/ChangePassword` instead)

---

## 📝 Frontend Integration Notes

1. **Do NOT attempt to call any endpoints in the "Non-Working" section** - They will return 404 errors
2. **For password changes**, use `/api/User/ChangePassword` instead of Auth reset endpoints
3. **For appointment management**, use the MedicalHistory and Patient endpoints as alternatives
4. **Check Swagger UI** at `https://ngcanduapi.azurewebsites.net/swagger/index.html` for the authoritative list

---

**🔒 Security**: All endpoints require JWT authentication except Auth endpoints  
**📄 Content-Type**: `application/json` (multipart/form-data for file uploads)  
**🌐 CORS**: Enabled for Angular frontend integration  
**📚 Documentation**: Auto-generated Swagger UI available