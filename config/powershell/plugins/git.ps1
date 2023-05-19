Import-Module -ErrorAction SilentlyContinue posh-git

$env:GIT_SSH ??= (Get-Command ssh).Source
