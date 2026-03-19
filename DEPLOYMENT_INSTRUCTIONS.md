# Deploy Credit Notes Backend to Azure App Service

## 🚀 Deployment Package Ready

Your backend has been published and packaged for deployment!

**Package Location:**
- File: `creditnotes-deployment.zip`
- Size: 23.4 MB
- Path: `c:\Users\IT Department\Desktop\NCD-API\creditnotes-deployment.zip`

---

## 📋 Pre-Deployment Checklist

✅ Backend code compiled (0 errors)
✅ Database schema created (CreditNotes table with 23 columns)
✅ All 11 API endpoints included
✅ ZIP deployment package created

**Required to complete:**
- [ ] Azure App Service created (or existing)
- [ ] Azure SQL Database configured (already done: ngcandu.database.windows.net)
- [ ] Publish profile downloaded from Azure

---

## 🔧 Deployment Steps

### Option 1: Using Azure Portal (Easiest)

1. **Go to Azure Portal**
   - https://portal.azure.com
   - Find your App Service: `NgCanduAPI`

2. **Go to Deployment Center**
   - Left menu → Deployment Center
   - Or: Deployment → Deployment slots → Production

3. **Upload ZIP via FTP or Portal Upload**
   - Click "Upload" button
   - Select `creditnotes-deployment.zip`
   - Wait for extraction and deployment

4. **Configure Application Settings**
   - Go to Configuration
   - Add/Update these settings:
     ```
     ConnectionStrings:DefaultConnection = 
     Data Source=ngcandu.database.windows.net;
     Initial Catalog=MedicalManagementDB;
     User ID=ngcandu;
     Password=Pass@123;
     MultipleActiveResultSets=True;
     Encrypt=True;
     ```

5. **Restart App Service**
   - Go to Overview
   - Click "Restart"
   - Wait 30-60 seconds

6. **Test Endpoint**
   - Get URL from App Service overview
   - Test: `https://<your-app>.azurewebsites.net/api/creditnotes`
   - Should return: `{"data": [], "message": "...", "isSuccess": true}`

---

### Option 2: Using Azure CLI

```powershell
# Set variables
$resourceGroup = "your-resource-group"
$appServiceName = "NgCanduAPI"
$zipPath = "c:\Users\IT Department\Desktop\NCD-API\creditnotes-deployment.zip"

# Deploy ZIP
az webapp deployment source config-zip `
  --resource-group $resourceGroup `
  --name $appServiceName `
  --src $zipPath

# Verify
az webapp show --resource-group $resourceGroup --name $appServiceName --query hostNames
```

---

### Option 3: Using GitHub Actions (Recommended for future)

We've updated your GitHub workflows. They will auto-deploy on every push to `master` branch.

**Required:**
1. Add publish profile to GitHub Secrets:
   - Go to GitHub → Settings → Secrets and variables → Actions
   - New secret: `AZURE_WEBAPP_PUBLISH_PROFILE`
   - Value: Download from Azure Portal:
     - App Service → Overview → Get publish profile
     - Copy XML content into secret

2. Push to master:
   ```powershell
   git add .
   git commit -m "Deploy Credit Notes feature"
   git push origin master
   ```

---

## ✅ Post-Deployment Verification

### 1. Check App Service Health
- Portal → App Service → Overview
- Status should be "Running"
- URL displayed

### 2. Test API Endpoint
**Get all credit notes:**
```
GET https://<your-app>.azurewebsites.net/api/creditnotes
Headers:
  Authorization: Bearer <valid-jwt-token>
  Content-Type: application/json
```

**Expected Response:**
```json
{
  "data": [],
  "message": "Credit notes retrieved successfully",
  "isSuccess": true
}
```

### 3. Create Test Credit Note
```
POST https://<your-app>.azurewebsites.net/api/creditnotes
Headers:
  Authorization: Bearer <valid-jwt-token>
  Content-Type: application/json

Body:
{
  "invoiceId": 1,
  "customerId": 1,
  "creditAmount": 500.00,
  "reason": "Test credit note"
}
```

### 4. Check Logs
- Portal → App Service → Monitoring → Log stream
- Or: Application Insights → Live Metrics
- Look for any errors

---

## 🔐 Database Connection Verification

The connection string is configured for:
- **Server:** `ngcandu.database.windows.net`
- **Database:** `MedicalManagementDB`
- **Table:** `CreditNotes` (already created)

**Verify in Azure Data Studio:**
1. Connect to `ngcandu.database.windows.net`
2. Query: `SELECT COUNT(*) FROM CreditNotes`
3. Should return: `0` (or current count)

---

## 📊 API Endpoints Deployed

All 11 endpoints are ready:

| Method | Endpoint | Status |
|--------|----------|--------|
| GET | /api/creditnotes | ✅ Ready |
| POST | /api/creditnotes | ✅ Ready |
| GET | /api/creditnotes/{id} | ✅ Ready |
| PATCH | /api/creditnotes/{id} | ✅ Ready |
| DELETE | /api/creditnotes/{id} | ✅ Ready |
| GET | /api/creditnotes/invoice/{invoiceId} | ✅ Ready |
| POST | /api/creditnotes/{id}/approve | ✅ Ready |
| POST | /api/creditnotes/{id}/reject | ✅ Ready |
| POST | /api/creditnotes/{id}/upload | ✅ Ready |
| GET | /api/creditnotes/{id}/download | ✅ Ready |
| GET | /api/creditnotes (with filters) | ✅ Ready |

---

## 🚨 Troubleshooting

### 404 Not Found
- Verify URL: Should be `/api/creditnotes` (not `/creditnotes`)
- Check App Service is running
- Refresh browser

### 500 Internal Server Error
- Check Application Insights logs
- Verify database connection string
- Ensure SQL firewall allows Azure services

### 401 Unauthorized
- Provide valid JWT token in header
- Check token hasn't expired
- Verify authentication is configured

### Connection Timeout
- Verify SQL Server firewall rules:
  - Azure Portal → SQL Database → Firewall
  - Add rule: Allow Azure Services (0.0.0.0 - 0.0.0.0)

---

## 📞 Next Steps

1. **Deploy the ZIP** using one of the options above
2. **Configure connection string** in App Service settings
3. **Restart App Service**
4. **Test endpoints** with Postman or browser
5. **Enable monitoring** in Application Insights
6. **Update frontend** to use live API URL

---

## 📦 What's Included in the ZIP

```
creditnotes-deployment.zip (23.4 MB)
├── MH.Api.dll          (API assembly)
├── MH.Api.deps.json    (Dependencies)
├── MH.Api.runtimeconfig.json
├── MH.Application.dll  (Business logic)
├── MH.Domain.dll       (Models)
├── MH.Infrastructure.dll (Database)
├── appsettings.json    (Configuration)
├── web.config          (IIS settings)
└── [All other required assemblies and resources]
```

---

## 🎯 Success Criteria

✅ Deployment completes without errors  
✅ App Service shows "Running" status  
✅ GET /api/creditnotes returns 200 OK  
✅ Database connection successful  
✅ All 11 endpoints accessible  

---

**Deployment Package:** `creditnotes-deployment.zip`  
**Size:** 23.4 MB  
**Ready for Upload:** ✅ Yes  
**Status:** Ready for Production Deployment  

**Next Action:** Upload ZIP to Azure App Service using one of the methods above!
