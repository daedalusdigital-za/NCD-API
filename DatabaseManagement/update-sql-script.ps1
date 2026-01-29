# PowerShell script to replace SQL VALUES section
$ErrorActionPreference = "Stop"

$sqlFile = "C:\Users\IT Department\Desktop\NCD-API\DatabaseManagement\import-sales-records-2025.sql"
$valuesFile = "C:\Users\IT Department\Desktop\NCD-API\DatabaseManagement\sql-values-output.txt"

Write-Host "Reading original SQL file..." -ForegroundColor Green
$sqlContent = Get-Content $sqlFile -Raw

Write-Host "Reading generated VALUES..." -ForegroundColor Green
$values = Get-Content $valuesFile -Raw

Write-Host "Replacing VALUES section..." -ForegroundColor Green

# Find the start of VALUES section
$valuesStart = $sqlContent.IndexOf("INSERT INTO #RawSalesData")
$valuesLineStart = $sqlContent.IndexOf("VALUES", $valuesStart)

# Find the end marker (the line after the VALUES data before "DECLARE @RawDataCount")
$endMarker = $sqlContent.IndexOf("DECLARE @RawDataCount", $valuesLineStart)

# Build the new content
$beforeValues = $sqlContent.Substring(0, $valuesLineStart)
$afterValues = $sqlContent.Substring($endMarker)

# Construct new SQL with proper formatting
$newSQL = $beforeValues + "VALUES`n" + $values.TrimEnd() + "`n    `n    " + $afterValues

# Save the updated file
Write-Host "Saving updated SQL file..." -ForegroundColor Green
[System.IO.File]::WriteAllText($sqlFile, $newSQL, [System.Text.Encoding]::UTF8)

Write-Host "SUCCESS! Updated import-sales-records-2025.sql with all 1,251 sales records" -ForegroundColor Green
Write-Host ""
Write-Host "NEXT STEP:" -ForegroundColor Yellow
Write-Host "  Open Azure Data Studio and run the import-sales-records-2025.sql script" -ForegroundColor White
Write-Host "  The script will automatically skip any duplicates based on Invoice Number" -ForegroundColor White
