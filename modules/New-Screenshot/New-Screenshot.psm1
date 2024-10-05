Function New-Screenshot {    
    # Main Body
    Add-Type -AssemblyName System.Drawing 
    Add-Type -AssemblyName System.Windows.Forms

    $OutputPath = "C:\Temp\Screenshot_$([DateTime]::Now.ToString('yyyyMMddHHmmssfff')).jpg"
    $ScreenResolution = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
    Write-Output "Taking screenshot of resolution $($ScreenResolution.Width)x$($ScreenResolution.Height) to $OutputPath"
    $Bitmap = New-Object System.Drawing.Bitmap $ScreenResolution.Width, $ScreenResolution.Height
    $Graphics = [System.Drawing.Graphics]::FromImage($Bitmap)
    
    try {
        $Graphics.CopyFromScreen($ScreenResolution.Location, [System.Drawing.Point]::Empty, $ScreenResolution.Size)
        $Bitmap.Save($OutputPath, [System.Drawing.Imaging.ImageFormat]::Jpeg)
        Write-Output "Screenshot saved to $OutputPath"
    }
    finally {
        $Graphics.Dispose()
        $Bitmap.Dispose()
    }
}

Export-ModuleMember -Function New-Screenshot
