<#
    Starts msedge with a non-work-tenant profile
#>

param (
    # Whether to launch Edge with a Personal profile or a Work profile
    [Parameter()]
    [ValidateSet("Personal", "Work")]
    [string]
    $ProfileType = "Personal",

    # Provide a path to a URL to launch Edge in application mode
    [Parameter()]
    [string]
    $AppUrl = ""
)

$statePath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Local State"

if (!(Test-Path -Path $statePath -PathType Leaf))
{
    throw "Could not find Edge state file at '$statePath'"
}

$state = Get-Content $statePath | ConvertFrom-Json

if ($ProfileType -ieq "Personal")
{
    $targetProfile = $state.profile.info_cache.PSObject.Properties | `
        Where-Object { $_.Value.edge_account_type -ne 2 } | `
        Select-Object -First 1 -ExpandProperty Name
}
else
{
    $targetProfile = $state.profile.info_cache.PSObject.Properties | `
        Where-Object { $_.Value.edge_account_type -eq 2 } | `
        Select-Object -First 1 -ExpandProperty Name
}

if (!$targetProfile)
{
    throw "Could not find personal Edge profile"
}

$pathToEdgeExe = Get-ItemPropertyValue `
    -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\msedge.exe" -Name "(Default)"

if (!$pathToEdgeExe)
{
    throw "Could not find path to msedge.exe"
}

if ($AppUrl)
{
    & $pathToEdgeExe --profile-directory=$targetProfile --app=$AppUrl
}
else
{
    & $pathToEdgeExe --profile-directory=$targetProfile
}