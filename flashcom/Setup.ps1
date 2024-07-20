#Requires -RunAsAdministrator

# Make sure the config directory exists
if (!(Test-Path "$env:LOCALAPPDATA\Packages\164HaydenMcAfee.FlashCom_nqvw84mb3bsjc\LocalState"))
{
    Write-Host "Path does not exist. Install the app."
}

# Delete existing config
if (Test-Path "$env:LOCALAPPDATA\Packages\164HaydenMcAfee.FlashCom_nqvw84mb3bsjc\LocalState\settings.json")
{
    Remove-Item -Force -Path "$env:LOCALAPPDATA\Packages\164HaydenMcAfee.FlashCom_nqvw84mb3bsjc\LocalState\settings.json"
}

# Set up symlink to repo
& cmd.exe /C "mklink `"%LOCALAPPDATA%\Packages\164HaydenMcAfee.FlashCom_nqvw84mb3bsjc\LocalState\settings.json`" `"$PSScriptRoot\settings.json`""