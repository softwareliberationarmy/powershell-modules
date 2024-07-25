Function Install-Jest {    
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
    
}

Export-ModuleMember -Function Install-Jest
