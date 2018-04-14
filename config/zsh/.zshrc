[[ -s "$HOME/.zplug" ]] && {
    source "$HOME/.zplug/init.zsh"

    zplug "chitoku-k/zsh-reset-title"
    zplug "chitoku-k/zsh-togglecursor", defer:1
    zplug "chitoku-k/zsh-vcs-extended"
    zplug "chitoku-k/zsh-via-ssh"
    zplug "chriskempson/base16-shell", use:scripts/base16-ocean.sh
    zplug "hcgraf/zsh-sudo"
    zplug "zsh-users/zsh-syntax-highlighting", defer:2
    zplug "$ZDOTDIR/plugins", from:local
    zplug "$ZDOTDIR/local", from:local

    if ! zplug check; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    zplug load
}
