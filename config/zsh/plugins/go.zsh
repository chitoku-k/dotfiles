if (( $+commands[go] )); then
    export PATH=$PATH:$GOPATH/bin

    go-coverage() {
        if [[ $# -eq 0 ]]; then
            echo 'usage: go-coverage <port> [build/test flags] [packages] [build/test flags & test binary flags]' >&2
            echo "Run 'go help test' and 'go help testflag' for details." >&2
            return 1
        fi

        local port=$1
        shift

        local dir
        dir=$(mktemp -d) || return

        trap 'rm -rf -- "$dir"' EXIT

        go test -coverprofile="$dir/coverage.out" "$@" || return
        go tool cover -html="$dir/coverage.out" -o "$dir/index.html" || return
        php -S "[::]:$port" -t "$dir"
    }
fi
