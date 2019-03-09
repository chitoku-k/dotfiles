export VISUAL='vim'

alias zmv='noglob zmv -vW'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias chown='chown -v'
alias chmod='chmod -v'

if (( $+commands[nvim] )); then
    export VISUAL='nvim'
    alias vim='nvim'
fi

if (( $+commands[tmux] )); then
    alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
    alias work='tmux attach || tmux'
fi

if (( $+commands[systemctl] )); then
    alias sc='systemctl'
    alias ssc='sudo systemctl'
    alias scs='systemctl status'
fi

if (( $+commands[sshfs] )); then
    mount-ssh() {
        sshfs -o reconnect $@
    }

    umount-ssh() {
        if (( $+commands[fusermount] )); then
            fusermount -uz $@
        elif (( $+commands[diskutil] )); then
            diskutil unmount force $@
        fi
    }
fi

case "$OSTYPE" in
    linux*)
        alias ls='ls --color=auto'
        ;;
    darwin*)
        alias ls='ls -G'
        ;;
esac
