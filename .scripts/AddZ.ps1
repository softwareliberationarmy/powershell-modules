# link to z powershell library: https://www.powershellgallery.com/packages/z/1.1.13
# https://www.hanselman.com/blog/spend-less-time-cding-around-directories-with-the-powershell-z-shortcut

Install-Module z -Scope CurrentUser 

# check if $PROFILE exists, if not create it
if (!(Test-Path -Path $PROFILE )) {
    New-Item -Type File -Path $PROFILE -Force 
}

$stmt = "Import-Module z"

$stmtExists = Select-String -Path $PROFILE -Pattern $stmt
if ($null -eq $stmtExists) {
    Add-Content -Path $PROFILE -Value "$stmt`n"
}

