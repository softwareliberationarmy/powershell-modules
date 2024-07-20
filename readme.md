# powershell-modules

a set of useful modules to include in my powershell profile locally

## HOW TO INSTALL THE MODULES

Per the instructions [here](https://learn.microsoft.com/en-us/powershell/scripting/developer/module/how-to-write-a-powershell-script-module?view=powershell-7.3), all you need to do is save the module folder to one of the directories mentioned in $env:PSModulePath

## THE MODULES

### Add-PackageJson 

Calls `npm init --y` to create a new default package.json file

### Import-HuskyNet

Uses the dotnet CLI to import the Husky tool into the root directory of a .NET solution and establish a pre-commit hook that restores, builds, and runs the tests for the solution before a git commit can be made.

**Assumptions**

- current directory contains a .sln file
- current directory is the root of a git repository
- dotnet CLI is installed

### New-Jest

Runs several node commands to spin up a new jest-based testing environment in the current directory. Useful for doing TypeScript or JavaScript code kata. Also documents what I need to do to install Jest into an existing project.

**Assumptions**

- current directory has not already been 'npm init'ed
- current directory is where you want your package.json and config files to live
- npm is installed
- VS code is installed
- internet access

### Resolve-Port

Used for troubleshooting whether a port is in use or not. Also resets the WinNAT service in case it is locking up the port.

**Assumptions**

- user is an admin (will notify user when not admin to rerun the command as admin)

## TODO

- create Powershell install script for loading these modules locally
