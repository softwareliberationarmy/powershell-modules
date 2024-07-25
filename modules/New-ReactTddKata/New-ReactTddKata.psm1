Function New-ReactTddKata {    
    param(
        [Parameter(Mandatory=$true)]
        [string]$name
    )
    # halt on error
    $ErrorActionPreference = "Stop"
    $PSNativeCommandUseErrorActionPreference = $true
    
    # Main Body
    New-ReactTsProject -name $name
    cd $name
    npm install
    Install-Jest # npm install jest and setup the config
    Install-Cypress # npm install cypress and setup the config
    Open-VsCode # open the current directory in VS Code    
}

Export-ModuleMember -Function New-ReactTddKata
