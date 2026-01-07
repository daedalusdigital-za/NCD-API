# Change Mandy's password using provided credentials
$adminEmail = "welcomeking@outlook.com"
$adminPassword = "Kingsland"

# Step 1: Login and get bearer token
Write-Host "Authenticating as $adminEmail..." -ForegroundColor Yellow
$loginBody = @{
    email = $adminEmail
    password = $adminPassword
} | ConvertTo-Json

try {
    $loginResponse = Invoke-RestMethod -Uri "https://ngcanduapi.azurewebsites.net/api/auth/login" -Method POST -Body $loginBody -ContentType "application/json"
    $token = $loginResponse.token
    Write-Host "✅ Authentication successful!" -ForegroundColor Green
} catch {
    Write-Host "❌ Authentication failed: $_" -ForegroundColor Red
    exit 1
}

# Step 2: Change password for Mandy
Write-Host "`nChanging password for Mandy@promedtechnologies.co.za (UserId: 7)..." -ForegroundColor Yellow

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
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
    Write-Host "Email:        Mandy@promedtechnologies.co.za" -ForegroundColor Cyan
    Write-Host "New Password: Grace@020983" -ForegroundColor Cyan
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Failed to change password" -ForegroundColor Red
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    if ($_.ErrorDetails.Message) {
        Write-Host "Details: $($_.ErrorDetails.Message)" -ForegroundColor Red
    }
    exit 1
}
