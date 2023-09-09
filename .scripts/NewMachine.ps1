# set the current working directory to where this script is located (important for relative file paths below)
Set-Location -Path $PSScriptRoot

.\AddZ.ps1
.\ImportMyModules.ps1
.\CreateHanselmanPrettyPrompt.ps1
