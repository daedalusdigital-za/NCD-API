# Change password for Mandy@promedtechnologies.co.za (UserId: 7)
# New password: Grace@020983

# Prompt for admin credentials
Write-Host "Enter admin credentials to authenticate..." -ForegroundColor Cyan
$adminEmail = Read-Host "Admin Email"
$adminPassword = Read-Host "Admin Password" -AsSecureString
$adminPasswordPlain = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($adminPassword))

# Step 1: Login and get bearer token
Write-Host "`nAuthenticating..." -ForegroundColor Yellow
$loginBody = @{
    email = $adminEmail
    password = $adminPasswordPlain
} | ConvertTo-Json

try {
    $loginResponse = Invoke-RestMethod -Uri "https://ngcanduapi.azurewebsites.net/api/auth/login" -Method POST -Body $loginBody -ContentType "application/json"
    $token = $loginResponse.token
    Write-Host "Authentication successful!" -ForegroundColor Green
} catch {
    Write-Host "Authentication failed: $_" -ForegroundColor Red
    exit 1
}

# Step 2: Change password for Mandy
Write-Host "`nChanging password for Mandy@promedtechnologies.co.za..." -ForegroundColor Yellow

$headers = @{
    "Authorization" = "Bearer $token"
    "Content-Type" = "application/json"
}

$changePasswordBody = @{
    userId = 7
    newPassword = "Grace@020983"
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://ngcanduapi.azurewebsites.net/api/User/ChangePassword" -Method POST -Headers $headers -Body $changePasswordBody
    Write-Host "`n✅ Password changed successfully!" -ForegroundColor Green
    Write-Host "Email: Mandy@promedtechnologies.co.za" -ForegroundColor Cyan
    Write-Host "New Password: Grace@020983" -ForegroundColor Cyan
} catch {
    Write-Host "Failed to change password: $_" -ForegroundColor Red
    if ($_.ErrorDetails.Message) {
        $errorResponse = $_.ErrorDetails.Message | ConvertFrom-Json
        Write-Host "Error details: $errorResponse" -ForegroundColor Red
    }
    
    # Try with a stronger password that meets all requirements
    Write-Host "`nThe password might not meet requirements. Trying with uppercase, lowercase, number, and special character..." -ForegroundColor Yellow
    
    $strongPasswordBody = @{
        userId = 7
        newPassword = "Grace@020983!"
    } | ConvertTo-Json
    
    try {
        $response2 = Invoke-RestMethod -Uri "https://ngcanduapi.azurewebsites.net/api/User/ChangePassword" -Method POST -Headers $headers -Body $strongPasswordBody
        Write-Host "`n✅ Password changed successfully with stronger password!" -ForegroundColor Green
        Write-Host "Email: Mandy@promedtechnologies.co.za" -ForegroundColor Cyan
        Write-Host "New Password: Grace@020983!" -ForegroundColor Cyan
    } catch {
        Write-Host "Still failed: $_" -ForegroundColor Red
        Write-Host "Error: $($_.ErrorDetails.Message)" -ForegroundColor Red
        exit 1
    }
}
