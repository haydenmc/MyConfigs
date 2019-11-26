#Requires -RunAsAdministrator

# Make sure the config directory exists
if (!(Test-Path "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"))
{
    New-Item "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState" -ItemType "Directory"
}

# Delete existing config
if (Test-Path "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\profiles.json")
{
    Remove-Item -Force -Path "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\profiles.json"
}

# Set up symlink to repo
& cmd.exe /C "mklink `"%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\profiles.json`" `"$PSScriptRoot\profiles.json`""