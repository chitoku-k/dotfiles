zmodload zsh/datetime
autoload -U colors
colors

fromunixtime() {
    if [[ $# = 0 ]]; then
        echo Usage: fromunixtime '%s'
        return 1
    fi

    echo "${fg[blue]}# $@$reset_color" >&2
    TZ=UTC strftime '%Y-%m-%dT%H:%M:%S%z' "${@%.*}"
    strftime '%Y-%m-%dT%H:%M:%S%z' "${@%.*}"
}

tounixtime() {
    if [[ $# = 0 ]]; then
        echo Usage: tounixtime '%Y-%m-%dT%H:%M:%S'
        return 1
    fi

    echo "${fg[blue]}# $@+0000$reset_color" >&2
    TZ=UTC strftime -r '%Y-%m-%dT%H:%M:%S' "$@"

    echo "${fg[blue]}# $@"$(strftime '%z')"$reset_color" >&2
    strftime -r '%Y-%m-%dT%H:%M:%S' "$@"
}
