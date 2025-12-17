# Test Sales API endpoint and get detailed error
$apiUrl = "https://ngcanduapi.azurewebsites.net/api/Sales/GetAll"

Write-Host "Testing API: $apiUrl" -ForegroundColor Cyan
Write-Host ""

try {
    $response = Invoke-WebRequest -Uri $apiUrl -Method Get -ErrorAction Stop
    Write-Host "SUCCESS! Status: $($response.StatusCode)" -ForegroundColor Green
    Write-Host "Content:" -ForegroundColor Yellow
    $response.Content | ConvertFrom-Json | ConvertTo-Json -Depth 3
}
catch {
    $statusCode = $_.Exception.Response.StatusCode.value__
    Write-Host "ERROR! Status: $statusCode" -ForegroundColor Red
    
    # Try to get the response body
    if ($_.Exception.Response) {
        $reader = New-Object System.IO.StreamReader($_.Exception.Response.GetResponseStream())
        $reader.BaseStream.Position = 0
        $reader.DiscardBufferedData()
        $responseBody = $reader.ReadToEnd()
        
        Write-Host "Response Body:" -ForegroundColor Yellow
        try {
            $responseBody | ConvertFrom-Json | ConvertTo-Json -Depth 5
        }
        catch {
            Write-Host $responseBody
        }
    }
    else {
        Write-Host "Exception: $($_.Exception.Message)" -ForegroundColor Red
    }
}
