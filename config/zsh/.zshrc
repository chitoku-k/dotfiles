[[ -a "$ZPLUG_HOME" ]] && {
    source "$ZPLUG_HOME/init.zsh"

    zplug "chitoku-k/zsh-reset-title"
    zplug "chitoku-k/zsh-togglecursor", defer:1
    zplug "chitoku-k/zsh-vcs-extended"
    zplug "chitoku-k/zsh-via-ssh"
    zplug "chriskempson/base16-shell", use:scripts/base16-ocean.sh, if:"[[ -z $VIM ]]"
    zplug "hcgraf/zsh-sudo"
    zplug "himanoa/neovim-terminal-utils", as:command, use:"*"
    zplug "zsh-users/zsh-syntax-highlighting", defer:2

    zplug "$ZDOTDIR/plugins", from:local
    zplug "$ZDOTDIR/local", from:local

    zplug load
}
