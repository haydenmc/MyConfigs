# Add the bin directory to our path
$backupFile = New-TemporaryFile
$env:Path | Out-File $backupFile
Write-Host "Backed up old path to '$($backupFile.FullName)'"
[System.Environment]::SetEnvironmentVariable("PATH", ($env:Path + ";$PSScriptRoot"),`
    [System.EnvironmentVariableTarget]::User)
Write-Host -ForegroundColor Green "Added $PSScriptRoot to user PATH."