if (Get-Command go -ErrorAction SilentlyContinue) {
    $env:GOPATH = "$($env:APPDATA)\go"
    $env:PATH += ";$($env:GOPATH)\bin"
}
