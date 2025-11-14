# PowerShell script to import sales data from CSV into SQL database
# This script will parse the CSV data and generate SQL insert statements

$csvData = @"
Institution,Province,Item Description,Date,Invoice Number,Quantity,Sales Amount,Status
DEPARTMENT OF HEALTH LIMPOPO,Limpopo,GLUCOSE METER- BIO HERMES,2025/09/01,IN157895,2290,312654.69,Delivered
DEPARTMENT OF HEALTH LIMPOPO,Limpopo,GLUCOSE METER- BIO HERMES,2025/09/01,IN157897,1565,213670.13,Delivered
DEPARTMENT OF HEALTH LIMPOPO,Limpopo,GLUCOSE TEST STRIPS,2025/09/01,IN157896,6000,269060.87,Delivered
DEPARTMENT OF HEALTH LIMPOPO,Limpopo,GLUCOSE TEST STRIPS,2025/09/01,IN157898,1000,44843.48,Delivered
MANKWENG HOSPITAL PHARMACY,Limpopo,GLUCOSE TEST STRIPS,2025/09/01,IN157894,1500,67265.22,Delivered
THELLE MOGOERANE HOSPITAL,Gauteng,GLUCOSE METER- BIO HERMES,2025/09/01,IN157873,50,6826.52,Delivered
HILLBROW CHC,Gauteng,GLUCOSE METER- BIO HERMES,2025/09/01,IN157874,300,0,Delivered
HILLBROW CHC,Gauteng,GLUCOSE TEST STRIPS,2025/09/01,IN157874,3000,134530.43,Delivered
DR. GEORGE MUKHARI HOSPITAL,Gauteng,GLUCOSE METER- BIO HERMES,2025/09/01,IN157868,1000,136530.43,Delivered
DR. GEORGE MUKHARI HOSPITAL,Gauteng,GLUCOSE TEST STRIPS,2025/09/01,IN157869,1500,67265.22,Delivered
FAR EAST RAND HOSPITAL,Gauteng,GLUCOSE METER- BIO HERMES,2025/09/01,IN157887,400,54612.17,Delivered
FAR EAST RAND HOSPITAL,Gauteng,GLUCOSE TEST STRIPS,2025/09/01,IN157888,1500,67265.22,Delivered
BHEKI MLANGENI DISTRICT HOSPITAL,Gauteng,GLUCOSE METER - BATTERY,2025/09/01,IN157879,0,0,Delivered
BHEKI MLANGENI DISTRICT HOSPITAL,Gauteng,GLUCOSE TEST STRIPS,2025/09/01,IN157879,500,22421.74,Delivered
KALAFONG HOSPITAL,Gauteng,GLUCOSE TEST STRIPS,2025/09/01,IN157878,2500,112108.69,Delivered
CHARLOTTE MAXEKE HOSPITAL,Gauteng,GLUCOSE METER- BIO HERMES,2025/09/01,IN157867,560,76457.04,Delivered
CHARLOTTE MAXEKE HOSPITAL,Gauteng,GLUCOSE TEST STRIPS,2025/09/01,IN157885,1500,67265.22,Delivered
KOPANONG HOSPITAL,Gauteng,GLUCOSE METER- BIO HERMES,2025/09/01,IN157871,200,27306.09,Delivered
SOUTH RAND HOSPITAL,Gauteng,GLUCOSE METER- BIO HERMES,2025/09/01,IN157870,100,0,Delivered
SOUTH RAND HOSPITAL,Gauteng,GLUCOSE METER - BATTERY,2025/09/01,IN157870,0,0,Delivered
SOUTH RAND HOSPITAL,Gauteng,GLUCOSE TEST STRIPS,2025/09/01,IN157870,1000,44843.48,Delivered
SOUTH RAND HOSPITAL,Gauteng,GLOCOSE METER - QUALITY CONTROL SOLUTIONS,2025/09/01,IN157870,20,482.08,Delivered
GERMISTON HOSPITAL,Gauteng,GLUCOSE METER- BIO HERMES,2025/09/01,IN157883,220,0,Delivered
GERMISTON HOSPITAL,Gauteng,GLUCOSE TEST STRIPS,2025/09/01,IN157883,1000,44843.48,Delivered
RAHIMA MOOSA MOTHER & CHILD HOSPITAL,Gauteng,GLUCOSE TEST STRIPS,2025/09/01,IN157893,1500,67265.22,Delivered
HELEN JOSEPH HOSPITAL,Gauteng,GLUCOSE METER- BIO HERMES,2025/09/01,IN157876,500,68265.22,Delivered
HELEN JOSEPH HOSPITAL,Gauteng,GLUCOSE TEST STRIPS,2025/09/01,IN157875,3000,134530.43,Delivered
TAMBO MEMORIAL HOSPITAL,Gauteng,GLUCOSE METER- BIO HERMES,2025/09/01,IN157866,100,0,Delivered
TAMBO MEMORIAL HOSPITAL,Gauteng,GLUCOSE TEST STRIPS,2025/09/01,IN157880,1000,44843.48,Delivered
MAMELODI HOSPITAL,Gauteng,GLUCOSE METER- BIO HERMES,2025/09/01,IN157872,200,27306.09,Delivered
PRETORIA WEST HOSPITAL,Gauteng,GLUCOSE METER- BIO HERMES,2025/09/01,IN157886,200,27306.09,Delivered
SEBOKENG HOSPITAL,Gauteng,GLUCOSE METER- BIO HERMES,2025/09/01,IN157884,300,0,Delivered
SEBOKENG HOSPITAL,Gauteng,GLUCOSE TEST STRIPS,2025/09/01,IN157884,3000,134530.43,Delivered
TEMBISA HOSPITAL,Gauteng,GLUCOSE TEST STRIPS,2025/09/01,IN157892,1500,67265.22,Delivered
STEVE BIKO ACADEMIC HOSPITAL,Gauteng,GLUCOSE METER- BIO HERMES,2025/09/01,IN157890,300,40959.13,Delivered
STEVE BIKO ACADEMIC HOSPITAL,Gauteng,GLUCOSE TEST STRIPS,2025/09/01,IN157891,1000,44843.48,Delivered
HEALTH TSHWANE REGION C,Gauteng,GLUCOSE METER- BIO HERMES,2025/09/01,IN157889,170,0,Delivered
HEALTH TSHWANE REGION C,Gauteng,GLUCOSE TEST STRIPS,2025/09/01,IN157889,1000,44843.48,Delivered
TSHWANE DISTRICT HOSPITAL,Gauteng,GLUCOSE METER- BIO HERMES,2025/09/01,IN157877,200,0,Delivered
TSHWANE DISTRICT HOSPITAL,Gauteng,GLUCOSE TEST STRIPS,2025/09/01,IN157877,1500,67265.22,Delivered
MEDICAL SUPPLY DEPOT TRANSITO -IN,Gauteng,GLUCOSE METER- BIO HERMES,2025/09/01,IN157882,1000,136530.43,Delivered
MEDICAL SUPPLY DEPOT TRANSITO -IN,Gauteng,GLUCOSE TEST STRIPS,2025/09/01,IN157881,3000,134530.43,Delivered
PROVINCIAL PHARM SUPPLY DEPOT,Kwa-Zulu Natal,GLUCOSE METER- BIO HERMES,2025/09/02,IN157947,200,27306.09,Delivered
PROVINCIAL PHARM SUPPLY DEPOT,Kwa-Zulu Natal,GLUCOSE TEST STRIPS,2025/09/02,IN157948,1350,60538.69,Delivered
PROVINCIAL PHARM SUPPLY DEPOT,Kwa-Zulu Natal,GLUCOSE TEST STRIPS,2025/09/02,IN157949,74,3318.42,Delivered
PROVINCIAL PHARM SUPPLY DEPOT,Kwa-Zulu Natal,HBA1C TEST STRIPS,2025/09/02,IN157950,20,35274.09,Delivered
PROVINCIAL PHARM SUPPLY DEPOT,Kwa-Zulu Natal,HBA1C TEST STRIPS,2025/09/02,IN157951,2,3527.41,Delivered
DEPARTMENT OF HEALTH LIMPOPO,Limpopo,GLUCOSE TEST STRIPS,2025/09/02,IN157946,6000,269060.87,Delivered
BLOEMFONTEIN MEDICAL DEPOT,Free State,GLUCOSE METER- BIO HERMES,2025/09/02,IN157919,350,47785.65,Delivered
BLOEMFONTEIN MEDICAL DEPOT,Free State,GLUCOSE METER- BIO HERMES,2025/09/02,IN157920,50,6826.52,Delivered
BLOEMFONTEIN MEDICAL DEPOT,Free State,GLUCOSE METER- BIO HERMES,2025/09/02,IN157923,20,2730.61,Delivered
BLOEMFONTEIN MEDICAL DEPOT,Free State,GLUCOSE METER- BIO HERMES,2025/09/02,IN157924,3000,409591.3,Delivered
BLOEMFONTEIN MEDICAL DEPOT,Free State,GLUCOSE METER- BIO HERMES,2025/09/02,IN157925,150,20479.56,Delivered
BLOEMFONTEIN MEDICAL DEPOT,Free State,GLUCOSE METER- BIO HERMES,2025/09/02,IN157927,100,13653.04,Delivered
BLOEMFONTEIN MEDICAL DEPOT,Free State,GLUCOSE METER- BIO HERMES,2025/09/02,IN157929,50,6826.52,Delivered
BLOEMFONTEIN MEDICAL DEPOT,Free State,GLUCOSE METER- BIO HERMES,2025/09/02,IN157933,15,2047.96,Delivered
BLOEMFONTEIN MEDICAL DEPOT,Free State,GLUCOSE TEST STRIPS,2025/09/02,IN157921,100,4484.35,Delivered
BLOEMFONTEIN MEDICAL DEPOT,Free State,GLUCOSE TEST STRIPS,2025/09/02,IN157922,40,1793.74,Delivered
BLOEMFONTEIN MEDICAL DEPOT,Free State,GLUCOSE TEST STRIPS,2025/09/02,IN157926,600,26906.09,Delivered
BLOEMFONTEIN MEDICAL DEPOT,Free State,GLUCOSE TEST STRIPS,2025/09/02,IN157928,160,7174.96,Delivered
BLOEMFONTEIN MEDICAL DEPOT,Free State,GLUCOSE TEST STRIPS,2025/09/02,IN157930,120,5381.22,Delivered
BLOEMFONTEIN MEDICAL DEPOT,Free State,GLUCOSE TEST STRIPS,2025/09/02,IN157931,1200,53812.17,Delivered
BLOEMFONTEIN MEDICAL DEPOT,Free State,GLUCOSE TEST STRIPS,2025/09/02,IN157934,30,1345.3,Delivered
BLOEMFONTEIN MEDICAL DEPOT,Free State,GLUCOSE TEST STRIPS,2025/09/02,IN157935,30,1345.3,Delivered
FS HEALTH THABO MOFUTSANYANA DISTRICT,Free State,GLUCOSE METER- BIO HERMES,2025/09/02,IN157932,30,4095.91,Delivered
FS HEALTH THABO MOFUTSANYANA DISTRICT,Free State,GLUCOSE METER - BATTERY,2025/09/02,IN157932,0,0,Delivered
FS HEALTH THABO MOFUTSANYANA DISTRICT,Free State,GLUCOSE TEST STRIPS,2025/09/02,IN157932,800,35874.78,Delivered
FS HEALTH THABO MOFUTSANYANA DISTRICT,Free State,GLOCOSE METER - QUALITY CONTROL SOLUTIONS,2025/09/02,IN157932,11,265.15,Delivered
PROVINCIAL PHARM SUPPLY DEPOT,Kwa-Zulu Natal,GLUCOSE TEST STRIPS,2025/09/30,IN159027,1000,44843.48,Not delivered
PROVINCIAL PHARM SUPPLY DEPOT,Kwa-Zulu Natal,HBA1C TEST STRIPS,2025/09/30,IN159026,6,10582.23,Not delivered
KALAFONG HOSPITAL,Gauteng,GLUCOSE METER- BIO HERMES,2025/09/30,IN159047,300,0,Not delivered
"@

# Parse CSV
$lines = $csvData -split "`n" | Where-Object { $_ -match '\S' }
$headers = $lines[0] -split ','
$data = @()

for ($i = 1; $i -lt $lines.Count; $i++) {
    $values = $lines[$i] -split ','
    if ($values.Count -eq 8) {
        $data += [PSCustomObject]@{
            Institution = $values[0]
            Province = $values[1]
            ItemDescription = $values[2]
            Date = $values[3]
            InvoiceNumber = $values[4]
            Quantity = [int]$values[5]
            SalesAmount = [decimal]$values[6]
            Status = $values[7]
        }
    }
}

Write-Host "Parsed $($data.Count) sales records" -ForegroundColor Green

# Group by Invoice Number
$invoiceGroups = $data | Group-Object -Property InvoiceNumber

Write-Host "Found $($invoiceGroups.Count) unique invoices" -ForegroundColor Green

# Get unique products
$uniqueProducts = $data | Select-Object -Property ItemDescription -Unique

Write-Host "`nUnique Products:" -ForegroundColor Cyan
$uniqueProducts | ForEach-Object { Write-Host "  - $($_.ItemDescription)" }

# Now execute the import
Write-Host "`nStarting database import..." -ForegroundColor Yellow

# Step 1: Create inventory items
$sqlServer = "ngcandu.database.windows.net"
$sqlDatabase = "MedicalManagementDB"
$sqlUser = "ngcandu"
$sqlPassword = "Pass@123"

$productPrices = @{
    "GLUCOSE METER- BIO HERMES" = 136.53
    "GLUCOSE TEST STRIPS" = 44.84
    "GLUCOSE METER - BATTERY" = 15.00
    "GLOCOSE METER - QUALITY CONTROL SOLUTIONS" = 24.10
    "HBA1C TEST STRIPS" = 1763.70
}

Write-Host "`nCreating inventory items..." -ForegroundColor Yellow

foreach ($product in $uniqueProducts) {
    $productName = $product.ItemDescription
    $unitPrice = if ($productPrices.ContainsKey($productName)) { $productPrices[$productName] } else { 0.00 }
    
    $checkSql = "SELECT COUNT(*) FROM InventoryItem WHERE Name = '$productName'"
    $result = sqlcmd -S $sqlServer -d $sqlDatabase -U $sqlUser -P $sqlPassword -Q $checkSql -h -1
    
    if ($result -eq "0") {
        $insertSql = @"
INSERT INTO InventoryItem (Name, Description, Category, SKU, UnitOfMeasure, UnitPrice, StockAvailable, ReorderLevel, Supplier, Status, IsDeleted, CreatedDate, CreatedBy)
VALUES ('$productName', '$productName', 'Medical Supplies', 'AUTO-$(Get-Random -Minimum 1000 -Maximum 9999)', 'Unit', $unitPrice, 0, 50, 'Medical Supplies Co', 1, 0, GETDATE(), 0);
"@
        sqlcmd -S $sqlServer -d $sqlDatabase -U $sqlUser -P $sqlPassword -Q $insertSql | Out-Null
        Write-Host "  [OK] Created: $productName" -ForegroundColor Green
    } else {
        Write-Host "  - Exists: $productName" -ForegroundColor Gray
    }
}

# Step 2: Import sales
Write-Host "`nImporting sales..." -ForegroundColor Yellow

$salesImported = 0
$itemsImported = 0

foreach ($invoiceGroup in $invoiceGroups) {
    $invoiceNumber = $invoiceGroup.Name
    $items = $invoiceGroup.Group
    $firstItem = $items[0]
    
    # Check if sale already exists
    $checkSql = "SELECT COUNT(*) FROM Sale WHERE SaleNumber = '$invoiceNumber'"
    $result = sqlcmd -S $sqlServer -d $sqlDatabase -U $sqlUser -P $sqlPassword -Q $checkSql -h -1
    
    if ($result -eq "0") {
        # Calculate totals
        $total = ($items | Measure-Object -Property SalesAmount -Sum).Sum
        $saleDate = $firstItem.Date -replace '/', '-'
        $customerName = $firstItem.Institution -replace "'", "''"
        $province = $firstItem.Province
        $deliveryStatus = if ($firstItem.Status -eq "Delivered") { 1 } else { 0 }
        
        # Insert Sale
        $insertSaleSql = @"
INSERT INTO Sale (SaleNumber, SaleDate, CustomerId, CustomerName, CustomerEmail, CustomerPhone, Subtotal, TaxAmount, Discount, Total, PaymentMethod, PaymentStatus, DeliveryStatus, Notes, IsDeleted, CreatedDate, CreatedBy)
VALUES ('$invoiceNumber', '$saleDate', 1, '$customerName', NULL, NULL, $total, 0, 0, $total, 1, 1, $deliveryStatus, 'Province: $province', 0, GETDATE(), 0);
SELECT CAST(SCOPE_IDENTITY() AS INT);
"@
        $saleId = sqlcmd -S $sqlServer -d $sqlDatabase -U $sqlUser -P $sqlPassword -Q $insertSaleSql -h -1
        
        if ($saleId -match '^\d+$') {
            $salesImported++
            
            # Insert Sale Items
            foreach ($item in $items) {
                $itemName = $item.ItemDescription -replace "'", "''"
                $quantity = $item.Quantity
                $totalPrice = $item.SalesAmount
                $unitPrice = if ($quantity -gt 0) { [math]::Round($totalPrice / $quantity, 2) } else { 0 }
                
                # Get inventory item ID
                $getItemIdSql = "SELECT Id FROM InventoryItem WHERE Name = '$itemName'"
                $inventoryItemId = sqlcmd -S $sqlServer -d $sqlDatabase -U $sqlUser -P $sqlPassword -Q $getItemIdSql -h -1
                
                if ($inventoryItemId -match '^\d+$') {
                    $insertItemSql = @"
INSERT INTO SaleItem (SaleId, InventoryItemId, Quantity, UnitPrice, TotalPrice, IsDeleted)
VALUES ($saleId, $inventoryItemId, $quantity, $unitPrice, $totalPrice, 0);
"@
                    sqlcmd -S $sqlServer -d $sqlDatabase -U $sqlUser -P $sqlPassword -Q $insertItemSql | Out-Null
                    $itemsImported++
                }
            }
            
            Write-Host "  [OK] Imported: $invoiceNumber ($($items.Count) items, Total: R$total)" -ForegroundColor Green
        }
    } else {
        Write-Host "  - Skipped: $invoiceNumber (already exists)" -ForegroundColor Gray
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "IMPORT COMPLETE" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Products created: $($uniqueProducts.Count)" -ForegroundColor Yellow
Write-Host "Sales imported: $salesImported" -ForegroundColor Yellow
Write-Host "Sale items imported: $itemsImported" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
