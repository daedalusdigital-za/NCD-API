# ============================================================================
# Test Inventory API Endpoint
# ============================================================================
# Purpose: Test the fixed inventory API and verify all items are returned
# Run this AFTER fixing the database
# ============================================================================

Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  INVENTORY API TEST" -ForegroundColor Cyan
Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

$apiUrl = "https://ngcanduapi.azurewebsites.net/api/Inventory/GetAll"

Write-Host "Testing API Endpoint:" -ForegroundColor Yellow
Write-Host "  $apiUrl" -ForegroundColor White
Write-Host ""

try {
    Write-Host "Calling API..." -ForegroundColor Yellow
    
    # Call the API
    $response = Invoke-RestMethod -Uri $apiUrl -Method Get -ErrorAction Stop
    
    Write-Host "✅ API call successful!" -ForegroundColor Green
    Write-Host ""
    
    # Check if response is an array
    if ($response -is [Array]) {
        $itemCount = $response.Count
        Write-Host "Total items returned: $itemCount" -ForegroundColor Cyan
        
        # Expected count
        if ($itemCount -eq 18) {
            Write-Host "✅ PASS: Expected 18 items, got $itemCount" -ForegroundColor Green
        } elseif ($itemCount -lt 18) {
            Write-Host "⚠️  WARNING: Expected 18 items, but only got $itemCount" -ForegroundColor Yellow
            Write-Host "   Database may need to be fixed!" -ForegroundColor Yellow
        } else {
            Write-Host "ℹ️  INFO: Got $itemCount items (expected 18)" -ForegroundColor Cyan
        }
        Write-Host ""
        
        # Check for hemoglobin meter
        $hemoglobinMeter = $response | Where-Object { $_.sku -eq "NDOH35002" -or $_.name -like "*HEMOGLOBIN*METER*" }
        
        if ($hemoglobinMeter) {
            Write-Host "✅ PASS: Hemoglobin Meter found!" -ForegroundColor Green
            Write-Host "   SKU: $($hemoglobinMeter.sku)" -ForegroundColor White
            Write-Host "   Name: $($hemoglobinMeter.name)" -ForegroundColor White
            Write-Host "   Stock: $($hemoglobinMeter.stockAvailable)" -ForegroundColor White
        } else {
            Write-Host "❌ FAIL: Hemoglobin Meter NOT found!" -ForegroundColor Red
        }
        Write-Host ""
        
        # Show items by category
        Write-Host "Items by Category:" -ForegroundColor Yellow
        Write-Host "─────────────────────────────────────────────────────────" -ForegroundColor Gray
        
        $categories = @{
            1 = "Hemoglobin Testing"
            2 = "Glucose Testing"
            3 = "HBA1C Testing"
            4 = "Multiparameter Testing"
            5 = "Quality Control"
            6 = "Equipment Accessories"
            7 = "Disposables"
            8 = "Medical Equipment"
        }
        
        $grouped = $response | Group-Object -Property category | Sort-Object Name
        
        foreach ($group in $grouped) {
            $categoryName = $categories[[int]$group.Name]
            if (-not $categoryName) { $categoryName = "Category $($group.Name)" }
            Write-Host "  $categoryName : $($group.Count) items" -ForegroundColor Cyan
        }
        Write-Host ""
        
        # List all items
        Write-Host "Complete Item List:" -ForegroundColor Yellow
        Write-Host "─────────────────────────────────────────────────────────" -ForegroundColor Gray
        
        $response | Sort-Object category, sku | ForEach-Object {
            $categoryName = $categories[[int]$_.category]
            if (-not $categoryName) { $categoryName = "Category $($_.category)" }
            
            $statusColor = switch ($_.status) {
                1 { "Green" }   # In Stock
                2 { "Yellow" }  # Low Stock
                3 { "Red" }     # Out of Stock
                4 { "Gray" }    # Discontinued
                default { "White" }
            }
            
            Write-Host "  [$($_.sku)] " -NoNewline -ForegroundColor Cyan
            Write-Host "$($_.name) " -NoNewline -ForegroundColor White
            Write-Host "($categoryName)" -ForegroundColor Gray
        }
        Write-Host ""
        
        # Summary
        Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Cyan
        if ($itemCount -eq 18 -and $hemoglobinMeter) {
            Write-Host "  ✅ TEST PASSED - API is working correctly!" -ForegroundColor Green
            Write-Host "  All items including hemoglobin meter are present." -ForegroundColor Green
        } elseif ($itemCount -lt 18) {
            Write-Host "  ⚠️  TEST PARTIAL - Only $itemCount items returned" -ForegroundColor Yellow
            Write-Host "  Run the database fix script to add missing items." -ForegroundColor Yellow
        } else {
            Write-Host "  ⚠️  TEST WARNING - Unexpected item count" -ForegroundColor Yellow
        }
        Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Cyan
        
    } else {
        Write-Host "⚠️  WARNING: Response is not an array" -ForegroundColor Yellow
        Write-Host "Response Type: $($response.GetType().Name)" -ForegroundColor Gray
        Write-Host "Response: $($response | ConvertTo-Json -Depth 2)" -ForegroundColor Gray
    }
    
} catch {
    Write-Host "❌ API call failed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Error Details:" -ForegroundColor Yellow
    Write-Host $_.Exception.Message -ForegroundColor Red
    Write-Host ""
    
    if ($_.Exception.Response) {
        Write-Host "Status Code: $($_.Exception.Response.StatusCode.value__)" -ForegroundColor Yellow
        Write-Host "Status Description: $($_.Exception.Response.StatusDescription)" -ForegroundColor Yellow
    }
    Write-Host ""
    Write-Host "Troubleshooting:" -ForegroundColor Yellow
    Write-Host "  1. Check if the API is running" -ForegroundColor White
    Write-Host "  2. Verify the URL is correct" -ForegroundColor White
    Write-Host "  3. Check Azure App Service logs" -ForegroundColor White
    Write-Host "  4. Ensure database is accessible" -ForegroundColor White
}

Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
