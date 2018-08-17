[[ -n "$SSH_CLIENT" ]] && {
    echo -n 'This login: '
    echo -n `LANG=C date "+%a %b %d %T %Y"`
    echo -n ' from '
    echo -n "$SSH_CLIENT" | cut -d' ' -f 1
}
