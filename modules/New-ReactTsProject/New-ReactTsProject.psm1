# function with one required string argument called projectname 
Function New-ReactTsProject {    
    param(
        [Parameter(Mandatory=$true)]
        [string]$name
    )
    # halt on error
    $ErrorActionPreference = "Stop"
    $PSNativeCommandUseErrorActionPreference = $true
    
    # Main Body
    npm create vite@latest $name -- --template react-ts
}

Export-ModuleMember -Function New-ReactTsProject
