Function New-Jest {    
    # Main Body
    Add-PackageJson # call the Add-PackageJson function

    npm install --save-dev jest # install jest
    npx jest --init # create the jest.config.js
    npm install --save-dev @babel/core @babel/preset-env babel-jest # install babel
    npm install --save-dev @types/jest @babel/preset-typescript # install jest types
    "module.exports = {
    presets: [
            ['@babel/preset-env', {targets: {node: 'current'}}],
            '@babel/preset-typescript',
        ],
    };" | Out-File -FilePath ".\babel.config.js" # create the babel.config.js

    Open-VsCode # open the current directory in VS Code
    
}

Export-ModuleMember -Function New-Jest
