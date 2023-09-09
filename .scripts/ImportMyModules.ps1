# set the current working directory to where this script is located (important for relative file paths below)
Set-Location -Path $PSScriptRoot

function Update-Profile (
    [Parameter(Mandatory = $true)]
    [string]$stmt
) {
    $stmtExists = Select-String -Path $PROFILE -Pattern $stmt -SimpleMatch
    if ($null -eq $stmtExists) {
        # add the line to the $PROFILE with a line break at the end
        Add-Content -Path $PROFILE -Value "$stmt`n"        
    }
}

# split the $env:PSModulePath into an array of path strings and get the first path
$modulePath = $env:PSModulePath.Split(';')[0]

# if path doesn't exist, create it
if (!(Test-Path $modulePath)) {
    New-Item -Path $modulePath -ItemType Directory
}

# copy the modules from the .\modules folder to the $modulePath
Copy-Item -Path .\modules\* -Destination $modulePath -Recurse -Force

# get the names of the folders in the module folder into an array
$moduleFolders = Get-ChildItem -Path .\modules -Directory | Select-Object -ExpandProperty Name

# for each module folder, create a 'Install-Module string'
$moduleFolders | ForEach-Object {
    $installModuleString = "Install-Module -Name $_ -Scope CurrentUser -Force"
    Update-Profile -stmt $installModuleString
}
