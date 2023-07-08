function Get-Dotfiles-Packages {
    Param(
        [String]
        $filename
    )

    Import-Csv `
        -Header @("Name", "Description") `
        -Delimiter "`t" `
        -Path $filename |
        ForEach-Object {
            $i++
            [PSCustomObject]@{
                "#" = $i
                Name = $_.Name
                Description = $_.Description
            }
        }
}

function Read-Dotfiles-Install {
    Param(
        [PSCustomObject[]]
        $packages
    )

    $install = Read-Host -Prompt 'Packages to install (eg: 1 2 3 or 1-3)'
    if (!$install) {
        Write-Output " there is nothing to do"
        return
    }

    $targets = @()
    foreach ($target in -split $install) {
        $start = ($target -replace "-.*", "") - 1
        $end = ($target -replace ".*-", "") - 1
        $targets += $packages[$start..$end]
    }

    $targets
}

function Write-Dotfiles-Packages {
    Param(
        [PSCustomObject[]]
        $packages
    )

    $names = $packages |
        ForEach-Object {
            $_.Name -replace "^[^/]+/", ""
        }

    Write-Host
    Write-Host "Packages ($($packages.Count)) $($names -join "  ")"
}

function Read-Dotfiles-Confirmation {
    Write-Host

    $confirm = Read-Host -Prompt ":: Proceed with installation? [Y/n]"
    $confirm -eq "" -or $confirm -ieq "y"
}

function Save-Dotfiles {
    $repository = "https://github.com/chitoku-k/dotfiles"
    $zip = "https://github.com/chitoku-k/dotfiles/archive/master.zip"

    if (Get-Command git -ErrorAction SilentlyContinue) {
        git clone $repository
    } else {
        $zipfile = (New-TemporaryFile).FullName
        try {
            Invoke-WebRequest -Uri $zip -OutFile $zipfile
            Expand-Archive -Path $zipfile -DestinationPath .
            Rename-Item .\dotfiles-master .\dotfiles
        } finally {
            Remove-Item -Path $zipfile
        }
    }
}

function Install-Dotfiles {
    # List packages
    $packages = Get-Dotfiles-Packages .\packages\windows.tsv
    $packages | Format-Table

    $installing = Read-Dotfiles-Install $packages
    if ($installing.Count -eq 0) {
        return
    }

    Write-Dotfiles-Packages $installing

    # Install
    if (Read-Dotfiles-Confirmation) {
        .\installer\install-package.ps1 $installing
    }
}

if (!(Test-Path -PathType Container -Path .\config) -or !(Test-Path -Path .\packages\unix.tsv)) {
    Save-Dotfiles
    Set-Location .\dotfiles
    Install-Dotfiles $args
} else {
    Install-Dotfiles $args
}
