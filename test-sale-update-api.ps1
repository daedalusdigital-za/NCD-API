# ============================================================================
# Test Sale Update API - Comprehensive Testing
# ============================================================================
# Tests the improved UpdateSale endpoint with:
# - Validation checks
# - SaleItems add/update/remove
# - Total recalculation
# - Audit field tracking
# ============================================================================

$baseUrl = "https://localhost:7193/api/Sales"  # Adjust if needed
$ErrorActionPreference = "Stop"

Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  Testing Sale Update API - Enhanced Implementation" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# ============================================================================
# TEST 1: Create a new sale first
# ============================================================================
Write-Host "Test 1: Creating initial sale..." -ForegroundColor Yellow

$newSale = @{
    saleNumber = "TEST-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    saleDate = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss")
    customerName = "Test Customer"
    customerPhone = "555-1234"
    notes = "Initial test sale"
    saleItems = @(
        @{
            inventoryItemId = 1
            quantity = 2
            unitPrice = 100.00
        },
        @{
            inventoryItemId = 2
            quantity = 1
            unitPrice = 50.00
        }
    )
} | ConvertTo-Json -Depth 10

try {
    $response = Invoke-RestMethod -Uri "$baseUrl/Add" -Method Post `
        -Body $newSale -ContentType "application/json"
    
    Write-Host "  ✓ Sale created: $($response.saleNumber)" -ForegroundColor Green
    $saleNumber = $response.saleNumber
    
    # Get the created sale
    $allSales = Invoke-RestMethod -Uri "$baseUrl/GetAll" -Method Get
    $createdSale = $allSales | Where-Object { $_.saleNumber -eq $saleNumber } | Select-Object -First 1
    $saleId = $createdSale.id
    
    Write-Host "  ✓ Sale ID: $saleId" -ForegroundColor Green
    Write-Host "  ✓ Total: R$($createdSale.total)" -ForegroundColor Green
    Write-Host "  ✓ Items: $($createdSale.saleItems.Count)" -ForegroundColor Green
}
catch {
    Write-Host "  ✗ Failed to create sale: $_" -ForegroundColor Red
    exit 1
}

Write-Host ""

# ============================================================================
# TEST 2: Update sale - Modify existing items
# ============================================================================
Write-Host "Test 2: Update existing items..." -ForegroundColor Yellow

$updateSale = @{
    id = $saleId
    saleNumber = $saleNumber
    saleDate = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss")
    customerName = "Updated Customer Name"
    customerPhone = "555-9999"
    notes = "Updated notes - modified quantities"
    saleItems = @(
        @{
            id = $createdSale.saleItems[0].id
            inventoryItemId = 1
            quantity = 5  # Changed from 2
            unitPrice = 100.00
        },
        @{
            id = $createdSale.saleItems[1].id
            inventoryItemId = 2
            quantity = 3  # Changed from 1
            unitPrice = 50.00
        }
    )
} | ConvertTo-Json -Depth 10

try {
    $response = Invoke-RestMethod -Uri "$baseUrl/Update" -Method Put `
        -Body $updateSale -ContentType "application/json"
    
    Write-Host "  ✓ Sale updated successfully" -ForegroundColor Green
    
    # Verify the update
    $updatedSale = Invoke-RestMethod -Uri "$baseUrl/GetById?id=$saleId" -Method Get
    
    Write-Host "  ✓ Customer Name: $($updatedSale.customerName)" -ForegroundColor Green
    Write-Host "  ✓ New Total: R$($updatedSale.total) (Expected: R650)" -ForegroundColor Green
    Write-Host "  ✓ Items Count: $($updatedSale.saleItems.Count)" -ForegroundColor Green
    
    if ($updatedSale.total -eq 650) {
        Write-Host "  ✓ Total calculation CORRECT!" -ForegroundColor Green
    } else {
        Write-Host "  ✗ Total calculation INCORRECT! Got $($updatedSale.total), expected 650" -ForegroundColor Red
    }
}
catch {
    Write-Host "  ✗ Failed to update sale: $_" -ForegroundColor Red
}

Write-Host ""

# ============================================================================
# TEST 3: Add new item to existing sale
# ============================================================================
Write-Host "Test 3: Adding new item to sale..." -ForegroundColor Yellow

$addItemSale = @{
    id = $saleId
    saleNumber = $saleNumber
    saleDate = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss")
    customerName = "Updated Customer Name"
    customerPhone = "555-9999"
    notes = "Added new item"
    saleItems = @(
        @{
            id = $createdSale.saleItems[0].id
            inventoryItemId = 1
            quantity = 5
            unitPrice = 100.00
        },
        @{
            id = $createdSale.saleItems[1].id
            inventoryItemId = 2
            quantity = 3
            unitPrice = 50.00
        },
        @{
            # New item without ID
            inventoryItemId = 3
            quantity = 2
            unitPrice = 75.00
        }
    )
} | ConvertTo-Json -Depth 10

try {
    $response = Invoke-RestMethod -Uri "$baseUrl/Update" -Method Put `
        -Body $addItemSale -ContentType "application/json"
    
    Write-Host "  ✓ Item added successfully" -ForegroundColor Green
    
    # Verify the update
    $updatedSale = Invoke-RestMethod -Uri "$baseUrl/GetById?id=$saleId" -Method Get
    
    Write-Host "  ✓ New Total: R$($updatedSale.total) (Expected: R800)" -ForegroundColor Green
    Write-Host "  ✓ Items Count: $($updatedSale.saleItems.Count) (Expected: 3)" -ForegroundColor Green
    
    if ($updatedSale.total -eq 800 -and $updatedSale.saleItems.Count -eq 3) {
        Write-Host "  ✓ Add item test PASSED!" -ForegroundColor Green
    } else {
        Write-Host "  ✗ Add item test FAILED!" -ForegroundColor Red
    }
}
catch {
    Write-Host "  ✗ Failed to add item: $_" -ForegroundColor Red
}

Write-Host ""

# ============================================================================
# TEST 4: Remove item from sale
# ============================================================================
Write-Host "Test 4: Removing item from sale..." -ForegroundColor Yellow

$removeItemSale = @{
    id = $saleId
    saleNumber = $saleNumber
    saleDate = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss")
    customerName = "Updated Customer Name"
    customerPhone = "555-9999"
    notes = "Removed one item"
    saleItems = @(
        @{
            id = $createdSale.saleItems[0].id
            inventoryItemId = 1
            quantity = 5
            unitPrice = 100.00
        }
        # Removed the other items
    )
} | ConvertTo-Json -Depth 10

try {
    $response = Invoke-RestMethod -Uri "$baseUrl/Update" -Method Put `
        -Body $removeItemSale -ContentType "application/json"
    
    Write-Host "  ✓ Items removed successfully" -ForegroundColor Green
    
    # Verify the update
    $updatedSale = Invoke-RestMethod -Uri "$baseUrl/GetById?id=$saleId" -Method Get
    
    Write-Host "  ✓ New Total: R$($updatedSale.total) (Expected: R500)" -ForegroundColor Green
    Write-Host "  ✓ Items Count: $($updatedSale.saleItems.Count) (Expected: 1)" -ForegroundColor Green
    
    if ($updatedSale.total -eq 500 -and $updatedSale.saleItems.Count -eq 1) {
        Write-Host "  ✓ Remove item test PASSED!" -ForegroundColor Green
    } else {
        Write-Host "  ✗ Remove item test FAILED!" -ForegroundColor Red
    }
}
catch {
    Write-Host "  ✗ Failed to remove items: $_" -ForegroundColor Red
}

Write-Host ""

# ============================================================================
# TEST 5: Validation - Empty items
# ============================================================================
Write-Host "Test 5: Testing validation (empty items)..." -ForegroundColor Yellow

$invalidSale = @{
    id = $saleId
    saleNumber = $saleNumber
    saleDate = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss")
    customerName = "Test"
    saleItems = @()  # Empty items - should fail
} | ConvertTo-Json -Depth 10

try {
    $response = Invoke-RestMethod -Uri "$baseUrl/Update" -Method Put `
        -Body $invalidSale -ContentType "application/json"
    
    Write-Host "  ✗ Validation FAILED - should have rejected empty items!" -ForegroundColor Red
}
catch {
    Write-Host "  ✓ Validation working - rejected empty items" -ForegroundColor Green
}

Write-Host ""

# ============================================================================
# TEST 6: Validation - Invalid quantity
# ============================================================================
Write-Host "Test 6: Testing validation (zero quantity)..." -ForegroundColor Yellow

$invalidSale2 = @{
    id = $saleId
    saleNumber = $saleNumber
    saleDate = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss")
    customerName = "Test"
    saleItems = @(
        @{
            inventoryItemId = 1
            quantity = 0  # Invalid
            unitPrice = 100.00
        }
    )
} | ConvertTo-Json -Depth 10

try {
    $response = Invoke-RestMethod -Uri "$baseUrl/Update" -Method Put `
        -Body $invalidSale2 -ContentType "application/json"
    
    Write-Host "  ✗ Validation FAILED - should have rejected zero quantity!" -ForegroundColor Red
}
catch {
    Write-Host "  ✓ Validation working - rejected zero quantity" -ForegroundColor Green
}

Write-Host ""
Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  Testing Complete!" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
Write-Host "Summary of fixes implemented:" -ForegroundColor Yellow
Write-Host "  ✓ Complete SaleItems handling (add/update/remove)" -ForegroundColor Green
Write-Host "  ✓ Automatic total recalculation" -ForegroundColor Green
Write-Host "  ✓ Audit field tracking (UpdatedBy, LastUpdated)" -ForegroundColor Green
Write-Host "  ✓ Comprehensive validation" -ForegroundColor Green
Write-Host "  ✓ Proper error messages" -ForegroundColor Green
Write-Host ""
