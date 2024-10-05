Function New-Screenshot {    
    # Define P/Invoke signature for GetSystemMetrics
    Add-Type @"
using System;
using System.Runtime.InteropServices;

public static class NativeMethods
{
    public const int SM_CXSCREEN = 0;
    public const int SM_CYSCREEN = 1;

    [DllImport("user32.dll")]
    public static extern int GetSystemMetrics(int nIndex);

    [DllImport("Shcore.dll")]
    public static extern int SetProcessDpiAwareness(int value);

    [DllImport("user32.dll")]
    public static extern bool SetProcessDPIAware();
}
"@

    try {
        # PROCESS_PER_MONITOR_DPI_AWARE = 2
        [NativeMethods]::SetProcessDpiAwareness(2) | Out-Null
    }
    catch {
        [NativeMethods]::SetProcessDPIAware() | Out-Null
    }

    # Get the actual screen size
    $ActualWidth = [NativeMethods]::GetSystemMetrics([NativeMethods]::SM_CXSCREEN)
    $ActualHeight = [NativeMethods]::GetSystemMetrics([NativeMethods]::SM_CYSCREEN)

    $OutputPath = "C:\Temp\Screenshot_$([DateTime]::Now.ToString('yyyyMMddHHmmssfff')).jpg"
    $Bitmap = New-Object System.Drawing.Bitmap $ActualWidth, $ActualHeight
    $Graphics = [System.Drawing.Graphics]::FromImage($Bitmap)

    try {
        # Capture the screen starting from (0,0)
        $Graphics.CopyFromScreen([System.Drawing.Point]::Empty, [System.Drawing.Point]::Empty, [System.Drawing.Size]::new($ActualWidth, $ActualHeight))
        $Bitmap.Save($OutputPath, [System.Drawing.Imaging.ImageFormat]::Jpeg)
        Write-Output "Screenshot saved to $OutputPath"
    }
    finally {
        $Graphics.Dispose()
        $Bitmap.Dispose()
    }
}

Export-ModuleMember -Function New-Screenshot
