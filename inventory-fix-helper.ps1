# ============================================================================
# Complete Inventory Fix Helper
# ============================================================================
# Purpose: Interactive menu to help fix the inventory API issue
# ============================================================================

function Show-Menu {
    Clear-Host
    Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "  INVENTORY API FIX HELPER" -ForegroundColor Cyan
    Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Problem: API only returns 20 items, hemoglobin meter missing" -ForegroundColor Yellow
    Write-Host "Solution: Database is missing inventory items" -ForegroundColor Green
    Write-Host ""
    Write-Host "═══ Menu ═══" -ForegroundColor White
    Write-Host ""
    Write-Host "  1. Test Current API Status" -ForegroundColor White
    Write-Host "  2. View Fix Guide (README)" -ForegroundColor White
    Write-Host "  3. Open Database Fix Script" -ForegroundColor White
    Write-Host "  4. Open Verification Script" -ForegroundColor White
    Write-Host "  5. Show Connection Info" -ForegroundColor White
    Write-Host "  6. Exit" -ForegroundColor White
    Write-Host ""
}

function Test-API {
    Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "  TESTING API" -ForegroundColor Cyan
    Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host ""
    
    $apiUrl = "https://ngcanduapi.azurewebsites.net/api/Inventory/GetAll"
    
    try {
        Write-Host "Calling: $apiUrl" -ForegroundColor Yellow
        $response = Invoke-RestMethod -Uri $apiUrl -Method Get -ErrorAction Stop
        
        if ($response -is [Array]) {
            $count = $response.Count
            Write-Host ""
            Write-Host "Items returned: $count" -ForegroundColor Cyan
            
            if ($count -eq 18) {
                Write-Host "✅ PERFECT! API returns all 18 items" -ForegroundColor Green
            } elseif ($count -lt 18) {
                Write-Host "⚠️  ISSUE: Only $count items (expected 18)" -ForegroundColor Yellow
                Write-Host "   → Need to run database fix script" -ForegroundColor Yellow
            } else {
                Write-Host "ℹ️  Got $count items (expected 18)" -ForegroundColor Cyan
            }
            
            # Check for hemoglobin meter
            $hbMeter = $response | Where-Object { $_.sku -eq "NDOH35002" }
            if ($hbMeter) {
                Write-Host "✅ Hemoglobin Meter FOUND (SKU: NDOH35002)" -ForegroundColor Green
            } else {
                Write-Host "❌ Hemoglobin Meter NOT FOUND" -ForegroundColor Red
                Write-Host "   → Database needs to be fixed" -ForegroundColor Yellow
            }
            
            Write-Host ""
            Write-Host "Categories breakdown:" -ForegroundColor Yellow
            $grouped = $response | Group-Object -Property category | Sort-Object Name
            foreach ($g in $grouped) {
                Write-Host "  Category $($g.Name): $($g.Count) items" -ForegroundColor White
            }
        }
        
    } catch {
        Write-Host "❌ API Error: $($_.Exception.Message)" -ForegroundColor Red
    }
    
    Write-Host ""
    Write-Host "Press any key to return to menu..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

function Show-Guide {
    $guidePath = Join-Path $PSScriptRoot "INVENTORY_FIX_SUMMARY.md"
    
    if (Test-Path $guidePath) {
        Write-Host "Opening fix guide..." -ForegroundColor Green
        Start-Process notepad.exe -ArgumentList $guidePath
    } else {
        Write-Host "❌ Guide not found: $guidePath" -ForegroundColor Red
        Write-Host ""
        Write-Host "Quick Summary:" -ForegroundColor Yellow
        Write-Host "1. Connect to Azure SQL Database" -ForegroundColor White
        Write-Host "2. Run: diagnose-and-fix-inventory.sql" -ForegroundColor White
        Write-Host "3. Test API again" -ForegroundColor White
    }
    
    Write-Host ""
    Write-Host "Press any key to return to menu..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

function Open-FixScript {
    $scriptPath = Join-Path $PSScriptRoot "DatabaseManagement\diagnose-and-fix-inventory.sql"
    
    if (Test-Path $scriptPath) {
        Write-Host "Opening database fix script..." -ForegroundColor Green
        Start-Process notepad.exe -ArgumentList $scriptPath
        Write-Host ""
        Write-Host "Instructions:" -ForegroundColor Yellow
        Write-Host "1. Connect to your Azure SQL Database using:" -ForegroundColor White
        Write-Host "   - Azure Data Studio (recommended)" -ForegroundColor Cyan
        Write-Host "   - SQL Server Management Studio" -ForegroundColor Cyan
        Write-Host "2. Open the script in the database tool" -ForegroundColor White
        Write-Host "3. Execute the script" -ForegroundColor White
        Write-Host "4. The script will:" -ForegroundColor White
        Write-Host "   - Show current status" -ForegroundColor Gray
        Write-Host "   - Find missing items" -ForegroundColor Gray
        Write-Host "   - Insert missing items automatically" -ForegroundColor Gray
        Write-Host "   - Verify the fix" -ForegroundColor Gray
    } else {
        Write-Host "❌ Script not found: $scriptPath" -ForegroundColor Red
    }
    
    Write-Host ""
    Write-Host "Press any key to return to menu..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

function Open-VerifyScript {
    $scriptPath = Join-Path $PSScriptRoot "DatabaseManagement\verify-inventory-fix.sql"
    
    if (Test-Path $scriptPath) {
        Write-Host "Opening verification script..." -ForegroundColor Green
        Start-Process notepad.exe -ArgumentList $scriptPath
        Write-Host ""
        Write-Host "Run this script AFTER the fix script to verify:" -ForegroundColor Yellow
        Write-Host "✓ 18 items are present" -ForegroundColor White
        Write-Host "✓ Hemoglobin meter exists" -ForegroundColor White
        Write-Host "✓ All categories have correct counts" -ForegroundColor White
    } else {
        Write-Host "❌ Script not found: $scriptPath" -ForegroundColor Red
    }
    
    Write-Host ""
    Write-Host "Press any key to return to menu..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

function Show-ConnectionInfo {
    Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "  AZURE SQL DATABASE CONNECTION INFO" -ForegroundColor Cyan
    Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "To connect to your Azure SQL Database:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "1. Open Azure Data Studio or SSMS" -ForegroundColor White
    Write-Host ""
    Write-Host "2. Use these connection details:" -ForegroundColor White
    Write-Host "   Server: [Your Azure SQL Server].database.windows.net" -ForegroundColor Cyan
    Write-Host "   Database: [Your Database Name]" -ForegroundColor Cyan
    Write-Host "   Authentication: SQL Server Authentication" -ForegroundColor Cyan
    Write-Host "   Username: [Your SQL Admin Username]" -ForegroundColor Cyan
    Write-Host "   Password: [Your SQL Admin Password]" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "3. Find credentials in:" -ForegroundColor White
    Write-Host "   Azure Portal → Your SQL Database → Connection strings" -ForegroundColor Gray
    Write-Host ""
    Write-Host "4. After connecting, run the scripts:" -ForegroundColor White
    Write-Host "   a) diagnose-and-fix-inventory.sql" -ForegroundColor Cyan
    Write-Host "   b) verify-inventory-fix.sql" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "API Endpoint to test after fix:" -ForegroundColor Yellow
    Write-Host "https://ngcanduapi.azurewebsites.net/api/Inventory/GetAll" -ForegroundColor Cyan
    Write-Host ""
    
    Write-Host "Press any key to return to menu..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

# Main loop
do {
    Show-Menu
    $choice = Read-Host "Select an option (1-6)"
    
    switch ($choice) {
        '1' { Test-API }
        '2' { Show-Guide }
        '3' { Open-FixScript }
        '4' { Open-VerifyScript }
        '5' { Show-ConnectionInfo }
        '6' { 
            Write-Host ""
            Write-Host "Goodbye! Remember:" -ForegroundColor Green
            Write-Host "1. Run the database fix script" -ForegroundColor White
            Write-Host "2. Test the API" -ForegroundColor White
            Write-Host "3. Check the frontend" -ForegroundColor White
            Write-Host ""
            return 
        }
        default { 
            Write-Host "Invalid choice. Please select 1-6." -ForegroundColor Red
            Start-Sleep -Seconds 1
        }
    }
} while ($true)
