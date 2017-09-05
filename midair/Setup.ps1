#Requires -RunAsAdministrator

# Make sure the config directory exists
if (!(Test-Path "C:\Program Files (x86)\Steam\steamapps\common\Midair\Midair\Saved\Config\WindowsNoEditor"))
{
    New-Item "C:\Program Files (x86)\Steam\steamapps\common\Midair\Midair\Saved\Config\WindowsNoEditor" -ItemType "Directory"
}

# Delete existing config
if (Test-Path "C:\Program Files (x86)\Steam\steamapps\common\Midair\Midair\Saved\Config\WindowsNoEditor\Input.ini")
{
    Remove-Item -Force -Path "C:\Program Files (x86)\Steam\steamapps\common\Midair\Midair\Saved\Config\WindowsNoEditor\Input.ini"
}

# Set up symlink to repo
& cmd.exe /C "mklink `"C:\Program Files (x86)\Steam\steamapps\common\Midair\Midair\Saved\Config\WindowsNoEditor\Input.ini`" `"$PSScriptRoot\Input.ini`""