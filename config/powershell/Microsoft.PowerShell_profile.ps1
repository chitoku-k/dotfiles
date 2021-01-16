function OnViModeChange {
    $global:PSConsoleViModeChanging = $TRUE
    [Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
    $global:PSConsoleViModeChanging = $FALSE
}

function OnAcceptLine {
    $global:PSConsoleAccepting = $TRUE
    [Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
    $global:PSConsoleAccepting = $FALSE

    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

function Prompt {
    $path = switch -Wildcard ($executionContext.SessionState.Path.CurrentLocation.Path) {
        "$HOME" { "~" }
        default { Split-Path $executionContext.SessionState.Path.CurrentLocation.Path -Leaf }
    }

    if (!$global:PSConsoleAccepting -And !$global:PSConsoleViModeChanging) {
        Write-Host
    }

    if ($global:PSConsoleAccepting) {
        $cursor = "`e[1 q"
        $mode = "`e[48;2;101;115;126m`e[38;2;101;115;126m[`e[38;2;167;173;186m"
    } elseif ([Microsoft.PowerShell.PSConsoleReadLine]::InViCommandMode()) {
        $cursor = "`e[1 q"
        $mode = "`e[48;2;143;161;179m`e[38;2;143;161;179m[`e[38;2;43;48;59m"
    } else {
        $cursor = "`e[5 q"
        $mode = "`e[48;2;163;190;140m`e[38;2;163;190;140m[`e[38;2;43;48;59m"
    }

    $computername = "$(hostname) "
    $directory = "`e[48;2;79;91;102m`e[38;2;167;173;186m $path "
    $prompt = "`e[48;2;79;91;102m`e[38;2;167;173;186m`e[48;2;52;61;70m $`e[38;2;52;61;70m]`e[0m "

    "$cursor$mode$computername$directory$prompt"
}

Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange
Set-PSReadLineOption -Colors @{
    Command   = [ConsoleColor]::DarkBlue
    Comment   = [ConsoleColor]::Yellow
    Keyword   = [ConsoleColor]::DarkMagenta
    Member    = [ConsoleColor]::DarkBlue
    Number    = [ConsoleColor]::Red
    Operator  = [ConsoleColor]::DarkCyan
    Parameter = [ConsoleColor]::Red
    String    = [ConsoleColor]::DarkGreen
    Type      = [ConsoleColor]::DarkYellow
    Variable  = [Console]::ForegroundColor
}
Set-PSReadLineKeyHandler -ViMode Insert -Chord Enter -ScriptBlock { OnAcceptLine }
Set-PSReadLineKeyHandler -ViMode Command -Chord Enter -ScriptBlock { OnAcceptLine }
Set-PSReadLineKeyHandler -ViMode Insert -Chord Ctrl+h -Function BackwardDeleteChar
Set-PSReadLineKeyHandler -ViMode Command -Chord Ctrl+Oem4 -ScriptBlock {}
Set-PSReadLineKeyHandler -ViMode Insert -Chord Ctrl+Oem4 -Function ViCommandMode

. $PSScriptRoot\plugins\*.ps1
