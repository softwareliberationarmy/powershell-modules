Function Test-Cors {    
  param([string]$fromUrl, [string]$toDomain, [string]$toPath)
    # Main Body
    $Response = Invoke-WebRequest -UseBasicParsing -Uri "https://$toDomain$toPath" `
    -Method "OPTIONS" `
    -WebSession $session `
    -Headers @{
    "authority"                      = $toDomain
    "method"                         = "OPTIONS"
    "path"                           = $toPath
    "scheme"                         = "https"
    "accept"                         = "*/*"
    "accept-encoding"                = "gzip, deflate, br, zstd"
    "accept-language"                = "en-US,en;q=0.9"
    "access-control-request-headers" = "authorization"
    "access-control-request-method"  = "GET"
    "origin"                         = $fromUrl
    "priority"                       = "u=1, i"
    "referer"                        = "$fromUrl/"
    "sec-fetch-dest"                 = "empty"
    "sec-fetch-mode"                 = "cors"
    "sec-fetch-site"                 = "same-site"
  }
  
  Write-Host "Response Code: $Response.StatusCode" 
  Write-Host "Response Headers: "
  $Response.Headers
}

Export-ModuleMember -Function Test-Cors
