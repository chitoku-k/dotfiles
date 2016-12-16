#!/bin/bash

for f in "$@"
do
    if [[ "$f" =~ /([0-9]+)( ?\([0-9]+\))?\. ]]; then
         open "https://twitter.com/user/status/"${BASH_REMATCH[1]}
         continue
    fi
    if [[ "$f" =~ /pixiv_([0-9]+)( ?\([0-9]+\))?\. ]]; then
         open "http://www.pixiv.net/member_illust.php?mode=medium&illust_id="${BASH_REMATCH[1]}
         continue
    fi
    if [[ "$f" =~ /seiga_([0-9]+)( ?\([0-9]+\))?\. ]]; then
         open "http://seiga.nicovideo.jp/seiga/im"${BASH_REMATCH[1]}
         continue
    fi
done