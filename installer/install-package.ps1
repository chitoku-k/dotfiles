function New-Dotfiles-Symlink {
    Param(
        [string]
        $source,
        [string]
        $target
    )

    if ((Get-Item -Path $target -ErrorAction SilentlyContinue).LinkType -eq "SymbolicLink") {
        Remove-Item $target
    }
    if (Test-Path -Path $target) {
        Write-Error "File exists: $($target)"
        return
    }

    if (!(Test-Path -PathType Container -Path (Split-Path -Parent -Path $target))) {
        $null = New-Item -ItemType Directory -Path (Split-Path -Parent -Path $target)
    }

    $null = New-Item -ItemType SymbolicLink -Value (Resolve-Path -Path $source) -Path $target
}

function Install-Dotfiles-Packages {
    Param(
        [PSCustomObject[]]
        $packages
    )

    $userprofile = $env:USERPROFILE
    $localappdata = $env:LOCALAPPDATA
    $powershellprofile = Split-Path -Parent -Path $PROFILE

    foreach ($package in $packages) {
        $index++
        $name = $package.Name -replace "^[^/]+/", ""

        Write-Host "($($index)/$($packages.Count)) installing $($name)"

        switch ($package.Name) {
            userprofile/powershell {
                New-Dotfiles-Symlink .\config\powershell\local $powershellprofile\local
                New-Dotfiles-Symlink .\config\powershell\plugins $powershellprofile\plugins
                New-Dotfiles-Symlink .\config\powershell\Microsoft.PowerShell_profile.ps1 $powershellprofile\Microsoft.PowerShell_profile.ps1
            }
            userprofile/git/config {
                New-Dotfiles-Symlink .\config\git $userprofile\.config\git
            }
            userprofile/wezterm {
                New-Dotfiles-Symlink .\config\wezterm $userprofile\.config\wezterm
            }
            localappdata/nvim {
                New-Dotfiles-Symlink .\config\nvim $localappdata\nvim
            }
            localappdata/windowsterminal {
                # Windows Terminal installation | Microsoft Learn
                # See: https://learn.microsoft.com/en-us/windows/terminal/install#settings-json-file
                New-Dotfiles-Symlink `
                    .\config\windows-terminal\settings.json `
                    $localappdata\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
            }
            vim/dein.vim {
                Remove-Item -Recurse -Force -ErrorAction SilentlyContinue -Path $localappdata\dein
                git clone --depth 1 https://github.com/Shougo/dein.vim $localappdata\dein\repos\github.com\Shougo\dein.vim
            }
        }
    }
}

Install-Dotfiles-Packages @Args
