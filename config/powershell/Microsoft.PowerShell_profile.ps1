Get-ChildItem $PSScriptRoot\plugins\*.ps1 | ForEach-Object { . $_ }
Get-ChildItem $PSScriptRoot\local\*.ps1 | ForEach-Object { . $_ }
