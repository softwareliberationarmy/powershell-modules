Function Install-Jest {    
    param(
        [Parameter(Mandatory=$false)]
        [bool]$includeTestingLibraries = $true
    )
    # halt on error
    $ErrorActionPreference = "Stop"
    $PSNativeCommandUseErrorActionPreference = $true

    # Main Body
    npm install --save-dev jest jest-environment-jsdom # install jest and jest-environment-jsdom
    npx jest --init # create the jest.config.js
    npm install --save-dev @babel/core @babel/preset-env babel-jest # install babel
    npm install --save-dev @types/jest @babel/preset-typescript # install jest types
    "module.exports = {
    presets: [
            ['@babel/preset-env', {targets: {node: 'current'}}],
            '@babel/preset-typescript',
        ],
    };" | Out-File -FilePath ".\babel.config.js" # create the babel.config.js
    
    if ($includeTestingLibraries -eq $true) {
        npm install --save-dev @testing-library/react @testing-library/jest-dom @testing-library/user-event @testing-library/dom 
    }   
}

Export-ModuleMember -Function Install-Jest
