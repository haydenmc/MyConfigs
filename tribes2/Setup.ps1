#Requires -RunAsAdministrator

# Make sure the config directory exists
if (!(Test-Path "C:\Dynamix\Tribes2\GameData\Classic\Prefs"))
{
    New-Item "C:\Dynamix\Tribes2\GameData\Classic\Prefs" -ItemType "Directory"
}

# Delete existing config
if (Test-Path "C:\Dynamix\Tribes2\GameData\Classic\Prefs\ClientPrefs.cs")
{
    Remove-Item -Force -Path "C:\Dynamix\Tribes2\GameData\Classic\Prefs\ClientPrefs.cs"
}

# Set up symlink to repo
& cmd.exe /C "mklink `"C:\Dynamix\Tribes2\GameData\Classic\Prefs\ClientPrefs.cs`" `"$PSScriptRoot\ClientPrefs.cs`""

# Delete existing config
if (Test-Path "C:\Dynamix\Tribes2\GameData\Classic\Prefs\MyConfig.cs")
{
    Remove-Item -Force -Path "C:\Dynamix\Tribes2\GameData\Classic\Prefs\MyConfig.cs"
}

# Set up symlink to repo
& cmd.exe /C "mklink `"C:\Dynamix\Tribes2\GameData\Classic\Prefs\MyConfig.cs`" `"$PSScriptRoot\MyConfig.cs`""