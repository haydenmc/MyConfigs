#Requires -RunAsAdministrator

# Make sure the config directory exists
if (!(Test-Path "$env:APPDATA\KeePassXC\"))
{
    New-Item "$env:APPDATA\KeePassXC\" -ItemType "Directory"
}

# Delete existing config
if (Test-Path "$env:APPDATA\KeePassXC\keepassxc.ini")
{
    Remove-Item -Force -Path "$env:APPDATA\KeePassXC\keepassxc.ini"
}

# Set up symlink to repo
& cmd.exe /C "mklink `"%AppData%\KeePassXC\keepassxc.ini`" `"$PSScriptRoot\keepassxc.ini`""