#Requires -RunAsAdministrator

if (!(Test-Path -Path "env:OneDriveConsumer"))
{
    throw ("Path to OneDrive could not be found. " + `
        "Ensure OneDrive is set up and %OneDriveConsumer% is defined.")
}

if (!(Test-Path -Path "$env:OneDriveConsumer\ProgramData\SaveGames\Dolphin\GC"))
{
    throw ("Path to savegames '$env:OneDriveConsumer\ProgramData\SaveGames\Dolphin\GC'" + `
        "could not be found.")
}

# Make sure the source directory exists
if (!(Test-Path "$env:USERPROFILE\Documents\Dolphin Emulator"))
{
    New-Item "$env:USERPROFILE\Documents\Dolphin Emulator" -ItemType "Directory"
}

# Delete existing save games directory
if (Test-Path "$env:USERPROFILE\Documents\Dolphin Emulator\GC")
{
    Remove-Item -Recurse -Force -Path "$env:USERPROFILE\Documents\Dolphin Emulator\GC"
}

# Set up symlink to OneDrive savegames directory
& cmd.exe /C ("mklink /d `"$env:USERPROFILE\Documents\Dolphin Emulator\GC`" " + `
    "`"$env:OneDriveConsumer\ProgramData\SaveGames\Dolphin\GC`"")