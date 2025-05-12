# scripts/run-scripts.ps1

$server = "PK-CET-088"
$database = "BlazorDB"
$username = "sa"
$password = "Pakistan@123"

# Resolve relative path to sql folder
$sqlPath = Join-Path $PSScriptRoot "..\sql"
$scriptFiles = Get-ChildItem -Path $sqlPath -Filter "*.sql" | Sort-Object Name

foreach ($script in $scriptFiles) {
    Write-Host "Executing $($script.Name)..."
    sqlcmd -S $server -d $database -U $username -P $password -i $script.FullName
}
