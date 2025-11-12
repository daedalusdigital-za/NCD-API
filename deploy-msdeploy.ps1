param(
    [string]$PublishUrl = "ngcanduapi.scm.azurewebsites.net:443",
    [string]$MSDeploySite = "NgCanduAPI",
    [string]$UserName = "`$NgCanduAPI",
    [string]$Password = "pNcqDo4RCmp9jmYuyz5vMKJjkxtBZTaFicgfFMfrsraezBGEgWrLNknPx8sL",
    [string]$SourcePath = "c:\Users\IT Department\Desktop\NCD-API\publish"
)

Write-Host "MSDeploy Deployment Tool" -ForegroundColor Cyan
Write-Host "Source: $SourcePath" -ForegroundColor Yellow
Write-Host "Target: https://$PublishUrl" -ForegroundColor Yellow

# Check if MSDeploy is installed
$msdeployPath = "C:\Program Files\IIS\Microsoft Web Deploy V3\msdeploy.exe"
if (-not (Test-Path $msdeployPath)) {
    Write-Host "ERROR: MSDeploy not found. Please install Web Deploy 3.6 or later" -ForegroundColor Red
    Write-Host "Download from: https://www.iis.net/downloads/microsoft/web-deploy" -ForegroundColor Yellow
    exit 1
}

Write-Host "`nStarting deployment..." -ForegroundColor Cyan

# Run MSDeploy command
& $msdeployPath `
    -verb:sync `
    -source:contentPath="$SourcePath" `
    -dest:contentPath="$MSDeploySite",computerName="https://$PublishUrl/msdeploy.axd?site=$MSDeploySite",userName="$UserName",password="$Password",encryptPassword="False" `
    -enableRule:DoNotDeleteRule `
    -verbose

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nDeployment successful!" -ForegroundColor Green
    Start-Sleep -Seconds 5
    Write-Host "Testing API..." -ForegroundColor Cyan
    try {
        $response = Invoke-WebRequest -Uri "https://ngcanduapi.azurewebsites.net/api/Health" -UseBasicParsing -TimeoutSec 10 -ErrorAction Stop
        Write-Host "API is online!" -ForegroundColor Green
    }
    catch {
        Write-Host "API is starting up..." -ForegroundColor Yellow
    }
} else {
    Write-Host "`nDeployment failed with exit code: $LASTEXITCODE" -ForegroundColor Red
    exit $LASTEXITCODE
}
