# powershell-modules

a set of useful modules to include in my powershell profile locally

## HOW TO INSTALL THE MODULES
Per the instructions [here](https://learn.microsoft.com/en-us/powershell/scripting/developer/module/how-to-write-a-powershell-script-module?view=powershell-7.3), all you need to do is save the module folder to one of the directories mentioned in $env:PSModulePath

## THE MODULES
### New-Jest

Runs several node commands to spin up a new jest-based testing environment in the current directory. Useful for doing TypeScript or JavaScript code kata. Also documents what I need to do to install Jest into an existing project.

**Assumptions**

- current directory has not already been 'npm init'ed
- current directory is where you want your package.json and config files to live
- npm is installed
- VS code is installed
- internet access

## TODO

- create Powershell install script for loading these modules locally
