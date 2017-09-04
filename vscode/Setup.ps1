#Requires -RunAsAdministrator

# Make sure the config directory exists
if (!(Test-Path "$env:APPDATA\Code\User\"))
{
    New-Item "$env:APPDATA\Code\User\" -ItemType "Directory"
}

# Delete existing config
if (Test-Path "$env:APPDATA\Code\User\settings.json")
{
    Remove-Item -Force -Path "$env:APPDATA\Code\User\settings.json"
}

# Set up symlink to repo
& cmd.exe /C "mklink `"%AppData%\Code\User\settings.json`" `"$PSScriptRoot\settings.json`""