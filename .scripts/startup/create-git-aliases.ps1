function Set-AliasWithCheck {
    param(
        [string]$aliasName,
        [string]$functionName
    )

    $oldAlias = Get-Item alias:\$aliasName -ErrorAction SilentlyContinue
    if ($oldAlias) {
        Remove-Item -Force -Path alias:\$oldAlias
    }
    Set-Alias -Name $aliasName -Value $functionName -Scope Global
}

function global:Git-Pull { git pull }
Set-AliasWithCheck -aliasName gp -functionName Git-Pull

function global:Git-Status { git status }
Set-AliasWithCheck -aliasName gs -functionName Git-Status

function global:Git-CheckoutMain { git checkout main }
Set-AliasWithCheck -aliasName gm -functionName Git-CheckoutMain
