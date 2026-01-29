# PowerShell script to update SQL with batched inserts
$ErrorActionPreference = "Stop"

$sqlFile = "C:\Users\IT Department\Desktop\NCD-API\DatabaseManagement\import-sales-records-2025.sql"
$batchedFile = "C:\Users\IT Department\Desktop\NCD-API\DatabaseManagement\sql-batched-inserts.txt"

Write-Host "Reading original SQL file..." -ForegroundColor Green
$sqlContent = Get-Content $sqlFile -Raw

Write-Host "Reading batched INSERT statements..." -ForegroundColor Green
$batchedInserts = Get-Content $batchedFile -Raw

Write-Host "Replacing with batched INSERTs (max 1000 rows per batch)..." -ForegroundColor Green

# Find the start of VALUES section  
$valuesStart = $sqlContent.IndexOf("INSERT INTO #RawSalesData")
$endMarker = $sqlContent.IndexOf("DECLARE @RawDataCount", $valuesStart)

# Build the new content
$beforeInserts = $sqlContent.Substring(0, $valuesStart)
$afterInserts = $sqlContent.Substring($endMarker)

# Construct new SQL with batched inserts
$newSQL = $beforeInserts + $batchedInserts.TrimEnd() + "`n    `n    " + $afterInserts

# Save the updated file
Write-Host "Saving updated SQL file..." -ForegroundColor Green
[System.IO.File]::WriteAllText($sqlFile, $newSQL, [System.Text.Encoding]::UTF8)

Write-Host "SUCCESS! Updated import-sales-records-2025.sql with batched INSERT statements" -ForegroundColor Green
Write-Host "- Split 1,251 records into batches of max 1000 rows each" -ForegroundColor Cyan
Write-Host "- This avoids SQL Server's 1000 row limit per INSERT statement" -ForegroundColor Cyan
Write-Host ""
Write-Host "NEXT STEP:" -ForegroundColor Yellow
Write-Host "  Open Azure Data Studio and run the import-sales-records-2025.sql script" -ForegroundColor White
