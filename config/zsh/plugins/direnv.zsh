if (( $+commands[direnv] )); then
    export DIRENV_WARN_TIMEOUT=5m
    source <(direnv hook zsh)
fi
