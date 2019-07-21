if [[ -a "$ZPLUG_HOME" ]]; then
    source "$ZPLUG_HOME/init.zsh"

    zplug "chitoku-k/zsh-reset-title"
    zplug "chitoku-k/zsh-togglecursor", defer:1
    zplug "chitoku-k/zsh-vcs-extended"
    zplug "chitoku-k/zsh-via-ssh"
    zplug "hcgraf/zsh-sudo"
    zplug "himanoa/neovim-terminal-utils", as:command, use:"*"
    zplug "zsh-users/zsh-syntax-highlighting", defer:2

    zplug "$ZDOTDIR/plugins", from:local
    zplug "$ZDOTDIR/local", from:local

    zplug load
else
    for file in $ZDOTDIR/{plugins,local}/*.zsh; do
        source "$file"
    done
fi
