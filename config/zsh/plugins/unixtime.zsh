zmodload zsh/datetime

fromunixtime() {
    TZ=UTC strftime '%Y-%m-%dT%H:%M:%S%z' "$@"
    strftime '%Y-%m-%dT%H:%M:%S%z' "$@"
}

tounixtime() {
    if [[ $# = 0 ]]; then
        echo Usage: tounixtime '%Y-%m-%dT%H:%M:%S'
        return 1
    fi

    echo "$@+0000" >&2
    TZ=UTC strftime -r '%Y-%m-%dT%H:%M:%S' "$@"
}
