jwt-pad-base64() {
    local input=$(cat)
    local mod=$((${#input} % 4))
    printf '%s' "$input"

    if [[ $mod != 0 ]]; then
        printf '=%.0s' {$mod..3}
    fi
}

jwt() {
    local elms=()
    IFS='.' read -A elms
    cat \
        <(jwt-pad-base64 <<< "${elms[1]}" | openssl base64 -A -d) \
        <(jwt-pad-base64 <<< "${elms[2]}" | openssl base64 -A -d) | jq
}
