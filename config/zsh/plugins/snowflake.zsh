zmodload zsh/datetime

fromsnowflake() {
    if [[ $# = 0 ]]; then
        echo Usage: fromsnowflake '%s'
        return 1
    fi

    local epoch=1288834974657
    TZ=UTC strftime '%Y-%m-%dT%H:%M:%S%z' $(((($1 >> 22) + $epoch) / 1000))
    strftime '%Y-%m-%dT%H:%M:%S%z' $(((($1 >> 22) + $epoch) / 1000))
}
