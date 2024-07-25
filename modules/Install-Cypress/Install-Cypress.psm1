Function Install-Cypress {    
    # Main Body
    npm install --save-dev cypress        
    npx cypress open
}

Export-ModuleMember -Function Install-Cypress
