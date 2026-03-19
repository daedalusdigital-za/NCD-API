# Simple Azure Deployment Script - ZIP Deploy
param(
    [string]$SiteName = "NgCanduAPI",
    [string]$Username = "`$NgCanduAPI",
    [string]$Password = "pNcqDo4RCmp9jmYuyz5vMKJjkxtBZTaFicgfFMfrsraezBGEgWrLNknPx8sL",
    [string]$PublishFolder = "C:\Users\IT Department\Desktop\NCD-API\publish"
)

$ErrorActionPreference = "Stop"

Write-Host "==================================================================" -ForegroundColor Cyan
Write-Host "  Azure Web App Deployment - ZIP Deploy" -ForegroundColor Cyan
Write-Host "==================================================================" -ForegroundColor Cyan
Write-Host ""

# Create ZIP file
Write-Host "[1/3] Creating deployment package..." -ForegroundColor Yellow
$zipPath = "$env:TEMP\deploy-$(Get-Date -Format 'yyyyMMddHHmmss').zip"

if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
}

Write-Host "  Compressing: $PublishFolder" -ForegroundColor Gray
Compress-Archive -Path "$PublishFolder\*" -DestinationPath $zipPath -Force
$zipSize = (Get-Item $zipPath).Length / 1MB
Write-Host ("  Package created: {0:N2} MB" -f $zipSize) -ForegroundColor Green

# Upload using ZIP Deploy API
Write-Host ""
Write-Host "[2/3] Uploading to Azure..." -ForegroundColor Yellow

$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $Username, $Password)))
$apiUrl = "https://$SiteName.scm.azurewebsites.net/api/zipdeploy"

Write-Host "  Target: $apiUrl" -ForegroundColor Gray

$headers = @{
    Authorization = "Basic $base64AuthInfo"
}

$fileBytes = [System.IO.File]::ReadAllBytes($zipPath)

Write-Host "  Uploading... please wait" -ForegroundColor Gray
$response = Invoke-RestMethod -Uri $apiUrl -Method Post -Headers $headers -Body $fileBytes -ContentType "application/zip" -TimeoutSec 600

Write-Host "  Deployment successful!" -ForegroundColor Green

# Cleanup
if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
    Write-Host "  Cleaned up temporary files" -ForegroundColor Gray
}

# Wait and test API
Write-Host ""
Write-Host "[3/3] Verifying deployment..." -ForegroundColor Yellow
Write-Host "  Waiting for app to start..." -ForegroundColor Gray
Start-Sleep -Seconds 15

$testUrl = "https://$SiteName.azurewebsites.net/swagger/index.html"
Write-Host "  Testing: $testUrl" -ForegroundColor Gray

try {
    $testResponse = Invoke-WebRequest -Uri $testUrl -UseBasicParsing -TimeoutSec 30
    Write-Host "  API is online and responding!" -ForegroundColor Green
}
catch {
    Write-Host "  API may still be starting up..." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "==================================================================" -ForegroundColor Cyan
Write-Host "  Deployment Complete!" -ForegroundColor Green
Write-Host "==================================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Application URL: https://$SiteName.azurewebsites.net" -ForegroundColor Cyan
Write-Host "Swagger UI: https://$SiteName.azurewebsites.net/swagger" -ForegroundColor Cyan
Write-Host ""
