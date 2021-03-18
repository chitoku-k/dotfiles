function Restart-Service {
    Param(
        [String]
        $name
    )

    Get-CimInstance -ClassName Win32_Service |
        Where-Object { $_.Name -eq $name } |
        ForEach-Object { Stop-Process -Force -Id $_.ProcessId }

    Start-Service -Name $name
}
