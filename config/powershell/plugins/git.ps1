if (Get-Command git -ErrorAction SilentlyContinue) {
    $env:GIT_PAGER = "less --dumb"
}

if (Get-InstalledModule -Name "posh-git" -ErrorAction SilentlyContinue) {
    Import-Module posh-git
}
