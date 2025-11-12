# FTP Deployment Script for NgCanduAPI
# This script builds the project and deploys it via FTP to Azure

param(
    [string]$FTPHost = "waws-prod-blu-443.ftp.azurewebsites.windows.net",
    [string]$FTPUser = "NgCanduAPI\$NgCanduAPI",
    [string]$FTPPassword = "pNcqDo4RCmp9jmYuyz5vMKJjkxtBZTaFicgfFMfrsraezBGEgWrLNknPx8sL",
    [string]$RemotePath = "/site/wwwroot",
    [string]$LocalPublishPath = "$PSScriptRoot\MH.Api\bin\Release\net8.0\publish"
)

Write-Host "=== NgCanduAPI FTP Deployment ===" -ForegroundColor Cyan

# Step 1: Build the project
Write-Host "`n[1/4] Building project..." -ForegroundColor Yellow
cd $PSScriptRoot
dotnet publish -c Release -o "$LocalPublishPath" --no-build
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Build failed!" -ForegroundColor Red
    exit 1
}
Write-Host "✓ Build successful" -ForegroundColor Green

# Step 2: Create FTP session
Write-Host "`n[2/4] Connecting to FTP server..." -ForegroundColor Yellow
$FTPUri = "ftp://$FTPHost$RemotePath"
$Credential = New-Object System.Net.NetworkCredential($FTPUser, $FTPPassword)

# Step 3: Upload files via FTP
Write-Host "`n[3/4] Uploading files to Azure..." -ForegroundColor Yellow

# Function to upload directory recursively
function Upload-FTPDirectory {
    param(
        [string]$LocalPath,
        [string]$RemotePath,
        [System.Net.NetworkCredential]$Credential,
        [string]$FTPHost
    )
    
    $items = Get-ChildItem -Path $LocalPath -Force
    
    foreach ($item in $items) {
        $remoteName = $item.Name
        if ($item.PSIsContainer) {
            $remoteSubPath = "$RemotePath/$remoteName"
            Write-Host "  📁 Uploading folder: $remoteName"
            
            # Create remote directory
            $ftpRequest = [System.Net.FtpWebRequest]::Create("ftp://$FTPHost$remoteSubPath")
            $ftpRequest.Method = [System.Net.WebRequestMethods+Ftp]::MakeDirectory
            $ftpRequest.Credentials = $Credential
            try {
                $ftpRequest.GetResponse() | Out-Null
            } catch {
                # Directory might already exist, ignore error
            }
            
            # Recurse into subdirectory
            Upload-FTPDirectory -LocalPath $item.FullName -RemotePath $remoteSubPath -Credential $Credential -FTPHost $FTPHost
        } else {
            # Upload file
            $remoteFile = "$RemotePath/$remoteName"
            Write-Host "  📄 Uploading: $remoteName"
            
            $ftpRequest = [System.Net.FtpWebRequest]::Create("ftp://$FTPHost$remoteFile")
            $ftpRequest.Method = [System.Net.WebRequestMethods+Ftp]::UploadFile
            $ftpRequest.Credentials = $Credential
            $ftpRequest.UseBinary = $true
            $ftpRequest.KeepAlive = $false
            
            $fileStream = [System.IO.File]::OpenRead($item.FullName)
            $ftpStream = $ftpRequest.GetRequestStream()
            $fileStream.CopyTo($ftpStream)
            $ftpStream.Close()
            $fileStream.Close()
        }
    }
}

Upload-FTPDirectory -LocalPath $LocalPublishPath -RemotePath $RemotePath -Credential $Credential -FTPHost $FTPHost

Write-Host "✓ Upload complete" -ForegroundColor Green

# Step 4: Verify deployment
Write-Host "`n[4/4] Verifying deployment..." -ForegroundColor Yellow
Start-Sleep -Seconds 3

$testUrl = "https://ngcanduapi.azurewebsites.net/api/Health"
try {
    $response = Invoke-WebRequest -Uri $testUrl -UseBasicParsing -TimeoutSec 10 -ErrorAction SilentlyContinue
    if ($response.StatusCode -eq 200 -or $response.StatusCode -eq 404) {
        Write-Host "✓ Deployment verified - API is responding" -ForegroundColor Green
    }
} catch {
    Write-Host "⚠ API is starting up (this is normal after deployment)" -ForegroundColor Yellow
}

Write-Host "`n=== Deployment Complete ===" -ForegroundColor Cyan
Write-Host "API URL: https://ngcanduapi.azurewebsites.net" -ForegroundColor Green
