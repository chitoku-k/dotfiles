Set-PSReadLineOption -Colors @{
    "Command"   = [ConsoleColor]::DarkBlue
    "Comment"   = [ConsoleColor]::Yellow
    "Keyword"   = [ConsoleColor]::DarkMagenta
    "Member"    = [ConsoleColor]::DarkBlue
    "Number"    = [ConsoleColor]::Red
    "Operator"  = [ConsoleColor]::DarkCyan
    "Parameter" = [ConsoleColor]::Red
    "String"    = [ConsoleColor]::DarkGreen
    "Type"      = [ConsoleColor]::DarkYellow
    "Variable"  = [Console]::ForegroundColor
}

function Prompt {
    $path = switch -Wildcard ($executionContext.SessionState.Path.CurrentLocation.Path) {
        "$HOME" { "~" }
        default { Split-Path $executionContext.SessionState.Path.CurrentLocation.Path -Leaf }
    }

    Write-Host
    Write-Host -NoNewLine -ForegroundColor DarkGreen -BackgroundColor DarkGreen "["
    Write-Host -NoNewLine -ForegroundColor Black -BackgroundColor DarkGreen $env:COMPUTERNAME" "
    Write-Host -NoNewLine -ForegroundColor Blue -BackgroundColor Yellow " $path "

    "`e[48;2;52;61;70m $`e[38;2;52;61;70m]`e[0m "
}
