function ConvertTo-Mp3 {
    param (
        [String]
        $path,

        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String[]]
        $arguments
    )

    ffmpeg ^
        -i $path ^
        -vn ^
        -acodec libmp3lame ^
        -ac 2 ^
        -ab 256k ^
        -ar 44100 ^
        $arguments
}
