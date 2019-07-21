if _zsh_togglecursor_supported 2> /dev/null && [[ -z "$VTE_VERSION" ]]; then
    TERM='screen-256color-bce'
fi
