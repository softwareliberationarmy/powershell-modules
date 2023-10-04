Function Resolve-Port {    
    param(
        [Parameter(Mandatory = $true)]
        [int]$Port
    )

    # if running as admin
    if (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
        net stop winnat
        net start winnat
    }
    else {
        Write-Host "You do not have Administrator rights to stop the WinNAT service, please run this script as Administrator."
        return
    }

    # check if port is in use
    $portInUse = netstat -ano | Select-String -Pattern $Port
    if ($portInUse) {
        Write-Host "Port $Port is in use"
    }
    else {
        Write-Host "Port $Port is not in use"
    }
    
}

Export-ModuleMember -Function Resolve-Port