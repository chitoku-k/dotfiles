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
        Where-Object { $_.Extension -In ".gif", ".jpg", ".jpeg", ".png", ".webp" } |
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
