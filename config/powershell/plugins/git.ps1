if (Get-Command git -ErrorAction SilentlyContinue) {
    $env:GIT_PAGER = "less --dumb"
}
