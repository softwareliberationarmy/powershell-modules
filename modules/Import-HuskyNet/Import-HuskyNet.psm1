Function Import-HuskyNet {    
    # Main Body

    dotnet new tool-manifest
    
    dotnet tool install Husky

    dotnet husky install

    dotnet husky add pre-commit -c "dotnet test"
}

Export-ModuleMember -Function Import-HuskyNet
