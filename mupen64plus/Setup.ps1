#Requires -RunAsAdministrator

# Make sure the destination exists
if (!(Test-Path -Path "env:OneDriveConsumer"))
{
    throw ("Path to OneDrive could not be found. " + `
        "Ensure OneDrive is set up and %OneDriveConsumer% is defined.")
}

if (!(Test-Path -Path "$env:OneDriveConsumer\ProgramData\SaveGames\Mupen64Plus"))
{
    throw ("Path to savegames '$env:OneDriveConsumer\ProgramData\SaveGames\Mupen64Plus'" + `
        "could not be found.")
}

# Make sure the source directory exists
if (!(Test-Path "$env:AppData\Mupen64Plus"))
{
    New-Item "$env:AppData\Mupen64Plus" -ItemType "Directory"
}

# Delete existing save games directory
if (Test-Path "$env:AppData\Mupen64Plus\save")
{
    Remove-Item -Recurse -Force -Path "$env:AppData\Mupen64Plus\save"
}

# Set up symlink to OneDrive savegames directory
& cmd.exe /C ("mklink /d `"$env:AppData\Mupen64Plus\save`" " + `
    "`"$env:OneDriveConsumer\ProgramData\SaveGames\Mupen64Plus`"")