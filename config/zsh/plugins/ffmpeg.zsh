mpeg2mp3() {
    local input=$1
    shift

    ffmpeg \
        -i "$input" \
        -vn \
        -acodec libmp3lame \
        -ac 2 \
        -ab 256k \
        -ar 44100 \
        "$@"
}
