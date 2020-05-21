go-coverage() {
    local port=${1:-8080}
    go test -coverprofile=out ./... &&
    go tool cover -html=out 2>&1 | awk '{ print $5 }' | xargs -I '{}' mv '{}' . &&
    php -S "[::]:$port"
}
