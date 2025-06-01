#Requires -RunAsAdministrator

# Make sure the destination exists
if (!(Test-Path -Path "$env:USERPROFILE\Sync\data\programdata\PrusaSlicer"))
{
    throw ("Path to Sync data could not be found.")
}

# Make sure the source directory exists
if (!(Test-Path "$env:AppData\PrusaSlicer"))
{
    New-Item "$env:AppData\PrusaSlicer" -ItemType "Directory"
}

# Delete existing directory
if (Test-Path "$env:AppData\PrusaSlicer")
{
    Remove-Item -Recurse -Force -Path "$env:AppData\PrusaSlicer"
}

# Set up symlink to OneDrive directory
& cmd.exe /C ("mklink /d `"$env:AppData\PrusaSlicer`" " + `
    "`"$env:USERPROFILE\Sync\data\programdata\PrusaSlicer`"")