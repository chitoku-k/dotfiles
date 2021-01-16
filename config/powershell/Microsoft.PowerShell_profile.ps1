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

    $computername = "$env:COMPUTERNAME "
    $directory = "`e[48;2;79;91;102m`e[38;2;167;173;186m $path "
    $prompt = "`e[48;2;79;91;102m`e[38;2;167;173;186m`e[48;2;52;61;70m $`e[38;2;52;61;70m]`e[0m "

    "$cursor$mode$computername$directory$prompt"
}

function Invoke-Illustration {
    $services = @{
        "^(?<id>[0-9]+)\.(?:jpg|png)$" = {"https://twitter.com/user/status/$($args)"}
        "^pixiv_(?<id>[0-9]+)( \([0-9]+\))?\." = {"https://www.pixiv.net/artworks/$($args)"}
        "^fanbox_(?<id>[0-9]+)( \([0-9]+\))?\." = {"https://www.pixiv.net/fanbox/creator/0/post/$($args)"}
        "^fantia_(?<id>[0-9]+)( \([0-9]+\))?\." = {"https://fantia.jp/posts/$($args)"}
        "^seiga_(?<id>[0-9]+)( \([0-9]+\))?\." = {"http://seiga.nicovideo.jp/seiga/im$($args)"}
        "^nijie_(?<id>[0-9]+)( \([0-9]+\))?\." = {"https://nijie.info/view.php?id=$($args)"}
        "^itolife_(?<id>[0-9]+\-[0-9]+\..*)" = {"http://taiki.sakura.ne.jp/diarypro/diary.cgi?mode=image&upfile=$($args)"}
        "^youkan-hh_(?<id>[0-9]+\..*)" = {"http://youkan-hh.sakura.ne.jp/$($args)"}
        "^yuunonn_new_illust[0-9]{2}_up" = {"https://www.melonbooks.co.jp/corner/detail.php?corner_id=885"}
    }

    Get-Item $args |
        ForEach-Object {
            $filename = $_.Name
            $services.Keys |
                Where-Object { $filename -Match $_ } |
                ForEach-Object { Start-Process $services[$_].InvokeReturnAsIs($Matches["id"]) }
        }
}

function Rename-Illustration {
    Param(
        [String]
        $dir = (Get-Location).Path
    )

    $count = @{}
    $files =
        Get-ChildItem $dir |
        Where { $_.Extension -In ".gif", ".jpg", ".jpeg", ".png", ".webp" } |
        Where-Object { $_.BaseName -Match "^.+_p[0-9]+$" } |
        ForEach-Object {
            $key = $_.BaseName -Replace "^([0-9]+)_p[0-9]+", "`$1"
            $count[$key]++
            @{
                Key = $key
                Index = $count[$key]
                File = $_
            }
        }

    $files |
        ForEach-Object {
            if ($count[$_.Key] -Eq 1) {
                $name = "pixiv_$($_.Key)$($_.File.Extension)"
            } else {
                $name = "pixiv_$($_.Key) ($($_.Index))$($_.File.Extension)"
            }

            Rename-Item -Path $_.File -NewName $name
            "$($_.File.Name) -> $($name)"
        }
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
