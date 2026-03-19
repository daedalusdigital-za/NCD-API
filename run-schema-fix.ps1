# Run CreditNotes Schema Fix
# This script connects to Azure SQL and fixes the CreditNotes table schema

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Running CreditNotes Schema Fix" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Connection details (update with your actual values)
$server = "ngcandu.database.windows.net"
$database = "MedicalManagementDB"
$userName = "ngcandu"
$password = "Mandy@0808"  # Store this securely in production!

Write-Host "Connecting to: $server / $database" -ForegroundColor Yellow
Write-Host ""

try {
    # Create connection string
    $connectionString = "Server=tcp:$server,1433;Initial Catalog=$database;Persist Security Info=False;User ID=$userName;Password=$password;Encrypt=True;Connection Timeout=30;"
    
    # Load SQL script
    $sqlScript = Get-Content "DatabaseManagement/FIX_CREDITNOTES_SCHEMA.sql" -Raw
    
    # Create SQL connection
    $connection = New-Object System.Data.SqlClient.SqlConnection($connectionString)
    $connection.Open()
    Write-Host "✓ Connected to database" -ForegroundColor Green
    Write-Host ""
    
    # Create command
    $command = New-Object System.Data.SqlClient.SqlCommand
    $command.Connection = $connection
    $command.CommandTimeout = 60
    
    # Split script by GO statements and execute
    $scriptParts = $sqlScript -split "GO\s*`r?`n"
    
    foreach ($part in $scriptParts) {
        if ($part.Trim().Length -gt 0) {
            $command.CommandText = $part
            
            try {
                $reader = $command.ExecuteReader()
                while ($reader.Read()) {
                    for ($i = 0; $i -lt $reader.FieldCount; $i++) {
                        Write-Host "$($reader.GetName($i)): $($reader.GetValue($i))"
                    }
                }
                $reader.Close()
            }
            catch {
                Write-Host "Error executing command: $_" -ForegroundColor Red
            }
        }
    }
    
    $connection.Close()
    Write-Host ""
    Write-Host "✓ Schema fix completed successfully!" -ForegroundColor Green
    
}
catch {
    Write-Host "Error: $_" -ForegroundColor Red
}
