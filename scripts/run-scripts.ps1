# $server = "PK-CET-088"
# $database = "BlazorDB"
# $username = "sa"
# $password = "Pakistan@123"

# # Path to sql folder (resolve based on script location)
# $sqlPath = Join-Path $PSScriptRoot "..\sql"
# $scriptFiles = Get-ChildItem -Path $sqlPath -Filter "*.sql" | Sort-Object Name

# foreach ($script in $scriptFiles) {
#     Write-Host "Executing $($script.Name)..."
#     sqlcmd -S $server -d $database -U $username -P $password -i $script.FullName
# }
# #

param (
    [string]$server = "PK-CET-088",
    [string]$database = "BlazorDB",
    [string]$username = "sa",
    [string]$password = "Pakistan@123"
)

Write-Host "Starting SQL script deployment..."

# Get the script directory and resolve SQL files
$sqlPath = Join-Path $PSScriptRoot "..\sql"
$scriptFiles = Get-ChildItem -Path $sqlPath -Filter "*.sql" | Sort-Object Name

foreach ($script in $scriptFiles) {
    Write-Host "Executing $($script.Name)..."

    try {
        & sqlcmd -S $server -d $database -U $username -P $password -i $script.FullName 2>&1 | Tee-Object -Variable output
        if ($LASTEXITCODE -ne 0) {
            Write-Error "Execution failed for $($script.Name)"
            Write-Error $output
            exit 1
        }
        else {
            Write-Host "Successfully executed $($script.Name)"
        }
    } catch {
        Write-Error "Unexpected error while executing $($script.Name): $_"
        exit 1
    }
}
