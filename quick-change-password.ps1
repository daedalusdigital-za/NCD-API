# Quick password change for Mandy
$token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."  # Replace with your actual admin token

$headers = @{
    "Authorization" = "Bearer $token"
    "Content-Type" = "application/json"
}

$body = @{
    userId = 7
    newPassword = "Grace@020983"
} | ConvertTo-Json

Write-Host "Changing password..." -ForegroundColor Yellow
Invoke-RestMethod -Uri "https://ngcanduapi.azurewebsites.net/api/User/ChangePassword" -Method POST -Headers $headers -Body $body
Write-Host "✅ Done!" -ForegroundColor Green
