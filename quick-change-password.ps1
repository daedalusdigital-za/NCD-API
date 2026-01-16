# =============================================================================
# Quick Password Change Script
# =============================================================================
# Usage: First obtain a valid JWT token via API login, then run this script
# =============================================================================

param(
    [Parameter(Mandatory=$false)]
    [int]$UserId = 7,
    
    [Parameter(Mandatory=$false)]
    [string]$NewPassword = "Grace@020983",
    
    [Parameter(Mandatory=$false)]
    [string]$Token
)

# Prompt for token if not provided
if (-not $Token) {
    Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "  Quick Password Change Tool" -ForegroundColor Cyan
    Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "`nTo get a token, first login via the API or use change-mandy-password.ps1" -ForegroundColor Yellow
    $Token = Read-Host "`nEnter Bearer Token"
}

if ([string]::IsNullOrWhiteSpace($Token)) {
    Write-Host "❌ Token is required. Exiting." -ForegroundColor Red
    exit 1
}

$headers = @{
    "Authorization" = "Bearer $Token"
    "Content-Type" = "application/json"
}

$body = @{
    userId = $UserId
    newPassword = $NewPassword
} | ConvertTo-Json

Write-Host "`nChanging password for UserId: $UserId..." -ForegroundColor Yellow

try {
    Invoke-RestMethod -Uri "https://ngcanduapi.azurewebsites.net/api/User/ChangePassword" -Method POST -Headers $headers -Body $body -ErrorAction Stop
    Write-Host "✅ Password changed successfully!" -ForegroundColor Green
    Write-Host "UserId: $UserId | New Password: $NewPassword" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Failed to change password: $($_.Exception.Message)" -ForegroundColor Red
    if ($_.ErrorDetails.Message) {
        Write-Host "Details: $($_.ErrorDetails.Message)" -ForegroundColor Red
    }
    exit 1
}
