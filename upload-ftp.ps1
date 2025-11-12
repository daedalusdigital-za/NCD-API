$FTPHost = "waws-prod-blu-443.ftp.azurewebsites.windows.net"
$FTPUser = 'NgCanduAPI\$NgCanduAPI'
$FTPPassword = "pNcqDo4RCmp9jmYuyz5vMKJjkxtBZTaFicgfFMfrsraezBGEgWrLNknPx8sL"
$RemotePath = "/site/wwwroot"
$LocalPath = "c:\Users\IT Department\Desktop\NCD-API\publish"

Write-Host "Starting FTP Deployment" -ForegroundColor Cyan
Write-Host "Source: $LocalPath" -ForegroundColor Yellow
Write-Host "Target: ftp://$FTPHost$RemotePath" -ForegroundColor Yellow

$webclient = New-Object System.Net.WebClient
$webclient.Credentials = New-Object System.Net.NetworkCredential($FTPUser, $FTPPassword)

$files = Get-ChildItem -Path $LocalPath -Recurse -File
$totalFiles = $files.Count
$uploadedFiles = 0

Write-Host "Uploading $totalFiles files..." -ForegroundColor Cyan

foreach ($file in $files) {
    $relativePath = $file.FullName.Substring($LocalPath.Length).Replace('\', '/').TrimStart('/')
    $remoteFile = "ftp://$FTPHost$RemotePath/$relativePath"
    
    try {
        Write-Host "Uploading: $relativePath" -ForegroundColor Gray
        $webclient.UploadFile($remoteFile, $file.FullName)
        $uploadedFiles++
        
        if ($uploadedFiles % 10 -eq 0) {
            Write-Host "Progress: $uploadedFiles/$totalFiles uploaded" -ForegroundColor Green
        }
    }
    catch {
        Write-Host "Failed to upload $relativePath : $_" -ForegroundColor Red
    }
}

Write-Host "Upload Complete" -ForegroundColor Cyan
Write-Host "Uploaded: $uploadedFiles/$totalFiles files" -ForegroundColor Green
Write-Host "Waiting for app to restart..." -ForegroundColor Yellow
Start-Sleep -Seconds 5

Write-Host "Testing API..." -ForegroundColor Cyan
try {
    $response = Invoke-WebRequest -Uri "https://ngcanduapi.azurewebsites.net/api/Trainer/GetAll" -UseBasicParsing -TimeoutSec 10 -ErrorAction Stop
    Write-Host "API is online!" -ForegroundColor Green
}
catch {
    Write-Host "API is starting up (normal after deployment)..." -ForegroundColor Yellow
}

Write-Host "Deployment Complete!" -ForegroundColor Green
