if (( $+commands[go] )); then
    export PATH=$PATH:$GOPATH/bin

    go-coverage() {
        local port=$1
        shift

        go test -coverprofile=out "$@" &&
            go tool cover -html=out 2>&1 | awk '{ print $5 }' | xargs -I '{}' mv '{}' . &&
            php -S "[::]:$port"
    }
fi
