if (Get-Command ssh -ErrorAction SilentlyContinue) {
    # See: https://github.com/PowerShell/openssh-portable/pull/441
    $env:TMPDIR = $env:TEMP
}
