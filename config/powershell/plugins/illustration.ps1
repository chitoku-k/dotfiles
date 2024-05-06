function Invoke-Illustration {
    $services = @{
        "^(?<id>[0-9]+)( \([0-9]+\))?\.(?:jpg|png)$" = {"https://twitter.com/i/status/$($args[1])"}
        "^mastodon_(?<id>[0-9]+)(?<name>@[^@]+)@(?<hostname>[^ ]+)( \([0-9]+\))?\." = {"https://$($args[2])/$($args[0])/$($args[1])"}
        "^misskey_(?<id>[0-9a-z]+)@(?<hostname>[^ ]+)( \([0-9]+\))?\." = {"https://$($args[2])/notes/$($args[1])"}
        "^pixiv_(?<id>[0-9]+)( \([0-9]+\))?\." = {"https://www.pixiv.net/artworks/$($args[1])"}
        "^fanbox_(?<name>[^.]+)_(?<id>[0-9]+)( \([0-9]+\))?\." = {"https://$($args[0]).fanbox.cc/posts/$($args[1])"}
        "^fantia_(?<id>[0-9]+)( \([0-9]+\))?\." = {"https://fantia.jp/posts/$($args[1])"}
        "^skeb_(?<name>[^.]+)_(?<id>[0-9]+)( \([0-9]+\))?\." = {"https://skeb.jp/@$($args[0])/works/$($args[1])"}
        "^seiga_(?<id>[0-9]+)( \([0-9]+\))?\." = {"http://seiga.nicovideo.jp/seiga/im$($args[1])"}
        "^nijie_(?<id>[0-9]+)( \([0-9]+\))?\." = {"https://nijie.info/view.php?id=$($args[1])"}
        "^xfolio_(?<name>[^.]+)_(?<id>[0-9]+)( \([0-9]+\))?\." = {"https://xfolio.jp/portfolio/$($args[0])/works/$($args[1])"}
        "^hoyolab_(?<id>[0-9]+)( \([0-9]+\))?\." = {"https://www.hoyolab.com/article/$($args[1])"}
        "^itolife_(?<id>[0-9]+\-[0-9]+\..*)" = {"http://taiki.sakura.ne.jp/diarypro/diary.cgi?mode=image&upfile=$($args[1])"}
        "^itolife_(?<id>[^.]+\..*)" = {"http://taiki.sakura.ne.jp/img/$($args[1])"}
        "^youkan-hh_(?<id>[0-9]+\..*)" = {"http://youkan-hh.sakura.ne.jp/$($args[1])"}
        "^yuunonn_new_illust[0-9]{2}_up" = {"https://www.melonbooks.co.jp/corner/detail.php?corner_id=885"}
    }

    Get-Item $args |
        ForEach-Object {
            $filename = $_.Name
            $services.Keys |
                Where-Object { $filename -Match $_ } |
                Select-Object -First 1 |
                ForEach-Object { Start-Process $services[$_].InvokeReturnAsIs($Matches["name"], $Matches["id"], $Matches["hostname"]) }
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
