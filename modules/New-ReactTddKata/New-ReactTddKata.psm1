Function New-ReactTddKata {    
    $projectname = "reactkata"
    # Main Body
    npm create vite@latest $projectname -- --template react-ts
    cd $projectname
    npm install
    Install-Jest # npm install jest and setup the config
    Install-Cypress # npm install cypress and setup the config
    Open-VsCode # open the current directory in VS Code    
}

Export-ModuleMember -Function New-ReactTddKata
