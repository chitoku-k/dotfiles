Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -HistorySaveStyle SaveNothing

$ExecutionContext.InvokeCommand.CommandNotFoundAction = {
    Param(
        [String]
        $name,

        [System.Management.Automation.CommandLookupEventArgs]
        $commandLookupArgs
    )

    if ($commandLookupArgs.CommandOrigin -ne "Runspace") {
        return
    }

    if (Test-Path -PathType Container -Path $name) {
        $commandLookupArgs.StopSearch = $true
        $commandLookupArgs.CommandScriptBlock = {
            Set-Location $name
        }.GetNewClosure()
    }
}
