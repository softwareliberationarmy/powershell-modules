Function New-JestKata {    
    # Main Body
    Add-PackageJson # call the Add-PackageJson function
    Install-Jest # npm install jest and setup the config
    Open-VsCode # open the current directory in VS Code    
}

Export-ModuleMember -Function New-JestKata
