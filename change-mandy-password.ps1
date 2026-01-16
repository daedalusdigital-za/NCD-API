# =============================================================================
# Change Password for Mandy@promedtechnologies.co.za (UserId: 7)
# =============================================================================
# This script authenticates via API and changes the password
# New password: Grace@020983
# =============================================================================

param(
    [Parameter(Mandatory=$false)]
    [int]$UserId = 7,
    
    [Parameter(Mandatory=$false)]
    [string]$TargetEmail = "Mandy@promedtechnologies.co.za",
    
    [Parameter(Mandatory=$false)]
    [string]$NewPassword = "Grace@020983"
)

Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  Password Change Tool - NgCandu API" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "`nTarget User: $TargetEmail (UserId: $UserId)" -ForegroundColor White

# Prompt for admin credentials securely
Write-Host "`nEnter admin credentials to authenticate..." -ForegroundColor Yellow
$adminEmail = Read-Host "Admin Email"
$adminSecurePassword = Read-Host "Admin Password" -AsSecureString
$adminPasswordPlain = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($adminSecurePassword))

# Step 1: Login and get bearer token
Write-Host "`nAuthenticating..." -ForegroundColor Yellow
$loginBody = @{
    email = $adminEmail
    password = $adminPasswordPlain
} | ConvertTo-Json

try {
    $loginResponse = Invoke-RestMethod -Uri "https://ngcanduapi.azurewebsites.net/api/auth/login" -Method POST -Body $loginBody -ContentType "application/json" -ErrorAction Stop
    $token = $loginResponse.token
    Write-Host "✅ Authentication successful!" -ForegroundColor Green
} catch {
    Write-Host "❌ Authentication failed: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Step 2: Change password for target user
Write-Host "`nChanging password for $TargetEmail..." -ForegroundColor Yellow

$headers = @{
    "Authorization" = "Bearer $token"
    "Content-Type" = "application/json"
}

$changePasswordBody = @{
    userId = $UserId
    newPassword = $NewPassword
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://ngcanduapi.azurewebsites.net/api/User/ChangePassword" -Method POST -Headers $headers -Body $changePasswordBody -ErrorAction Stop
    Write-Host "`n═══════════════════════════════════════════════════════════════" -ForegroundColor Green
    Write-Host "  ✅ Password changed successfully!" -ForegroundColor Green
    Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Green
    Write-Host "Email:        $TargetEmail" -ForegroundColor Cyan
    Write-Host "New Password: $NewPassword" -ForegroundColor Cyan
    Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Green
} catch {
    Write-Host "❌ Failed to change password: $($_.Exception.Message)" -ForegroundColor Red
    if ($_.ErrorDetails.Message) {
        try {
            $errorResponse = $_.ErrorDetails.Message | ConvertFrom-Json
            Write-Host "Error details: $($errorResponse.message)" -ForegroundColor Red
        } catch {
            Write-Host "Error details: $($_.ErrorDetails.Message)" -ForegroundColor Red
        }
    }
    exit 1
}
