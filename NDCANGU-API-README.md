# NDCANGU Medical Management API

## Overview
The NDCANGU Medical Management API is a comprehensive healthcare management system designed to support Non-Communicable Disease (NCD) prevention and management in South Africa. The system provides RESTful APIs for managing training programs, medical inventory, sales transactions, and healthcare location data.

## Features

### 🏥 Location Management
- **Provinces**: Manage South African provinces
- **Districts**: Manage districts within provinces  
- **Hospitals**: Manage healthcare facilities with capacity and type information

### 📚 Training Management
- **Trainers**: Manage healthcare trainers with specializations and certifications
- **Training Sessions**: Schedule and manage training sessions (in-person and virtual)
- **Participant Management**: Track training attendance and completion

### 📦 Inventory Management
- **Medical Supplies**: Track medical equipment and supplies
- **Stock Management**: Monitor stock levels, reorder points, and expiry dates
- **Categories**: Organize inventory by categories (Equipment, Supplies, Medication)

### 💰 Sales Management
- **Sales Transactions**: Process sales of medical supplies to healthcare facilities
- **Order Management**: Track order status, payment, and delivery
- **Customer Management**: Maintain customer information for healthcare facilities

### 📊 Dashboard & Analytics
- **Real-time Metrics**: Monitor key performance indicators
- **Provincial Breakdown**: Analyze data by province and district
- **Trending Analytics**: Track trends in training, inventory, and sales

## API Endpoints

### Authentication Endpoints
```
POST   /api/Auth/login              # User authentication
POST   /api/Auth/register           # User registration
POST   /api/Auth/refresh-token      # Refresh JWT token
POST   /api/Auth/logout             # User logout
```

### Location Management
```
# Provinces
GET    /api/Province                # Get all provinces
GET    /api/Province/{id}           # Get province by ID
POST   /api/Province                # Create new province
PUT    /api/Province/{id}           # Update province
DELETE /api/Province/{id}           # Delete province

# Districts
GET    /api/District                # Get all districts
GET    /api/District/{id}           # Get district by ID
GET    /api/District/province/{id}  # Get districts by province
POST   /api/District                # Create new district
PUT    /api/District/{id}           # Update district
DELETE /api/District/{id}           # Delete district

# Hospitals
GET    /api/Hospital                # Get all hospitals
GET    /api/Hospital/{id}           # Get hospital by ID
GET    /api/Hospital/district/{id}  # Get hospitals by district
POST   /api/Hospital                # Create new hospital
PUT    /api/Hospital/{id}           # Update hospital
DELETE /api/Hospital/{id}           # Delete hospital
```

### Training Management
```
# Trainers
GET    /api/Trainer                 # Get all trainers
GET    /api/Trainer/{id}            # Get trainer by ID
GET    /api/Trainer/active          # Get active trainers only
POST   /api/Trainer                 # Create new trainer
PUT    /api/Trainer/{id}            # Update trainer
DELETE /api/Trainer/{id}            # Delete trainer

# Training Sessions
GET    /api/TrainingSession         # Get all training sessions
GET    /api/TrainingSession/{id}    # Get training session by ID
GET    /api/TrainingSession/upcoming # Get upcoming sessions
GET    /api/TrainingSession/trainer/{id} # Get sessions by trainer
POST   /api/TrainingSession         # Create new session
PUT    /api/TrainingSession/{id}    # Update session
DELETE /api/TrainingSession/{id}    # Delete session
```

### Inventory Management
```
# Inventory Items
GET    /api/InventoryItem           # Get all inventory items
GET    /api/InventoryItem/{id}      # Get item by ID
GET    /api/InventoryItem/category/{category} # Get items by category
GET    /api/InventoryItem/low-stock # Get low stock items
POST   /api/InventoryItem           # Create new item
PUT    /api/InventoryItem/{id}      # Update item
DELETE /api/InventoryItem/{id}      # Delete item
```

### Sales Management
```
# Sales
GET    /api/Sale                    # Get all sales
GET    /api/Sale/{id}               # Get sale by ID
GET    /api/Sale/customer/{id}      # Get sales by customer
GET    /api/Sale/date-range         # Get sales by date range
POST   /api/Sale                    # Create new sale
PUT    /api/Sale/{id}               # Update sale
DELETE /api/Sale/{id}               # Delete sale
```

### Dashboard & Analytics
```
GET    /api/Dashboard/summary       # Get dashboard summary
GET    /api/Dashboard/province-breakdown # Get data by province
GET    /api/Dashboard/training-metrics   # Get training statistics
GET    /api/Dashboard/inventory-metrics  # Get inventory statistics
GET    /api/Dashboard/sales-metrics      # Get sales statistics
```

## Database Schema

### Location Tables
- **Province**: South African provinces with codes
- **District**: Municipal districts within provinces  
- **Hospital**: Healthcare facilities with capacity and contact details

### Training Tables
- **Trainer**: Healthcare trainers with specializations
- **TrainingSession**: Scheduled training events with capacity and location

### Inventory Tables
- **InventoryItem**: Medical supplies and equipment with stock tracking

### Sales Tables
- **Sale**: Sales transactions with customer and payment details
- **SaleItem**: Individual items within sales transactions

## Data Models

### Province Model
```json
{
  "id": 1,
  "name": "Gauteng",
  "code": "GP",
  "isDeleted": false,
  "createdDate": "2024-01-01T00:00:00Z"
}
```

### Hospital Model
```json
{
  "id": 1,
  "name": "Charlotte Maxeke Johannesburg Academic Hospital",
  "address": "17 Jubilee Rd, Parktown, Johannesburg",
  "contactNumber": "+27 11 488 4911",
  "email": "info@cmjah.co.za",
  "capacity": 1088,
  "type": "Tertiary", // Academic, Provincial, District, Specialized
  "districtId": 1
}
```

### Training Session Model
```json
{
  "id": 1,
  "title": "Diabetes Prevention and Management Workshop",
  "description": "Comprehensive training on Type 2 diabetes prevention...",
  "trainerId": 2,
  "startDate": "2024-02-15T09:00:00Z",
  "endDate": "2024-02-15T17:00:00Z",
  "capacity": 50,
  "status": "Scheduled", // Scheduled, InProgress, Completed, Cancelled
  "locationType": "InPerson", // InPerson, Virtual, Hybrid
  "venueDetails": "Charlotte Maxeke Hospital - Auditorium A"
}
```

### Inventory Item Model
```json
{
  "id": 1,
  "name": "Digital Blood Pressure Monitor",
  "description": "Automatic digital BP monitor with large display",
  "category": "Equipment", // Equipment, Supplies, Medication
  "sku": "BP-001",
  "unitOfMeasure": "Unit",
  "unitPrice": 1250.00,
  "stockAvailable": 25,
  "reorderLevel": 5,
  "supplier": "MedEquip South Africa",
  "expiryDate": "2027-01-01T00:00:00Z",
  "batchNumber": "BPM2024001",
  "status": "InStock" // InStock, LowStock, OutOfStock
}
```

### Sale Model
```json
{
  "id": 1,
  "saleNumber": "SALE-2024-001",
  "saleDate": "2024-01-15T00:00:00Z",
  "customerId": 1001,
  "customerName": "Charlotte Maxeke Hospital",
  "customerEmail": "procurement@cmjah.co.za",
  "subtotal": 3750.00,
  "taxAmount": 562.50,
  "discount": 0.00,
  "total": 4312.50,
  "paymentMethod": "BankTransfer", // Cash, Card, BankTransfer, Credit
  "paymentStatus": "Paid", // Pending, Paid, Failed, Refunded
  "deliveryStatus": "Delivered", // Pending, Shipped, Delivered, Cancelled
  "saleItems": [...]
}
```

## Setup Instructions

### Prerequisites
- .NET 6 or later
- SQL Server (Local or Azure)
- Entity Framework Core Tools

### Database Setup
1. **Update Connection String**: Modify `appsettings.Development.json` with your SQL Server connection string
2. **Apply Migrations**: Run `dotnet ef database update --project MH.Infrastructure --startup-project MH.Api`
3. **Seed Initial Data**: Execute the SQL scripts in `DatabaseManagement/` folder:
   - `initial-db-value.sql` (Basic setup)
   - `ndcangu-seed-data.sql` (NDCANGU features data)

### Running the API
```bash
cd MH.Api
dotnet run
```

The API will be available at `https://localhost:5001` (HTTPS) or `http://localhost:5000` (HTTP).

### API Documentation
Once running, visit `https://localhost:5001/swagger` for interactive API documentation.

## Authentication
The API uses JWT Bearer token authentication. Include the token in the Authorization header:
```
Authorization: Bearer <your-jwt-token>
```

## Error Handling
The API returns standardized error responses:
```json
{
  "statusCode": 400,
  "message": "Validation failed",
  "success": false,
  "data": null,
  "errors": ["Field 'Name' is required"]
}
```

## Response Format
All API responses follow a consistent format:
```json
{
  "statusCode": 200,
  "message": "Success",
  "success": true,
  "data": { ... },
  "errors": null
}
```

## Testing Data
The system includes comprehensive seed data:
- 9 South African provinces
- 16 districts (covering major metropolitan areas)
- 10 major hospitals with realistic details
- 5 healthcare trainers with specializations
- 5 sample training sessions
- 10 medical inventory items
- 3 sample sales transactions

## Development Notes
- The system uses Clean Architecture with Domain, Application, Infrastructure, and API layers
- AutoMapper is configured for entity-to-model mapping
- Repository pattern provides data access abstraction
- All entities inherit from BaseModel with audit fields
- Comprehensive logging using Serilog
- JWT authentication with refresh token support

## Future Enhancements
- Patient registration and medical history tracking
- Advanced reporting and analytics
- Mobile app integration
- Real-time notifications
- Integration with external health systems
- Multi-language support

## Support
For technical support or questions about the API, please contact the development team or refer to the project documentation.