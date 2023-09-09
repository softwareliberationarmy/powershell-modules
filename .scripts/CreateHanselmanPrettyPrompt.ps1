# Steps to install the windows terminal pretty prompt for PowerShell 
# Pre-requisites: Windows Terminal installed and cross-platform PowerShell installed
# see https://www.hanselman.com/blog/how-to-make-a-pretty-prompt-in-windows-terminal-with-powerline-nerd-fonts-cascadia-code-wsl-and-ohmyposh

# on error stop
$ErrorActionPreference = "Stop"

# set the current working directory to where this script is located (important for relative file paths below)
Set-Location -Path $PSScriptRoot

Install-Module Terminal-Icons -Scope CurrentUser
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck

$importStmts = @("Import-Module posh-git", "Import-Module Terminal-Icons")

# check if $PROFILE exists, if not create it
if (!(Test-Path -Path $PROFILE )) {
    New-Item -Type File -Path $PROFILE -Force 
}

# loop through the import statements and check if they exist in the $PROFILE
foreach ($stmt in $importStmts) {
    $stmtExists = Select-String -Path $PROFILE -Pattern $stmt
    if ($null -eq $stmtExists) {
        # add the line to the $PROFILE with a line break at the end
        Add-Content -Path $PROFILE -Value "$stmt`n"        
    }
}

$targetOmpFile = "$env:USERPROFILE\kpatrick.omp.json"
$spareOmpFile = "..\.assets\kpatrick.omp.json"

# check if the file 'kpatrick.omp.json' exists directly in the user profile folder
# if not, check if the file exists in the current folder
# if it does, copy it to the user profile folder
if (!(Test-Path -Path $targetOmpFile)) {
    if (Test-Path -Path $spareOmpFile) {
        Copy-Item -Path $spareOmpFile -Destination $targetOmpFile
    }
}

$ohMyPoshCommand = "oh-my-posh --init --shell pwsh --config ~\kpatrick.omp.json | Invoke-Expression"

# add the oh-my-posh command to the $PROFILE
$stmtExists = Select-String -Path $PROFILE -Pattern $ohMyPoshCommand
if ($null -eq $stmtExists) {
    Add-Content -Path $PROFILE -Value "$ohMyPoshCommand`n"
}
