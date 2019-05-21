export VISUAL='vim'

alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias chown='chown -v'
alias chmod='chmod -v'

if hash nvim 2>&-; then
    export VISUAL='nvim'
    alias vim='nvim'
fi

if hash tmux 2>&-; then
    alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
    alias work='tmux attach || tmux'
fi

if hash systemctl 2>&-; then
    alias sc='systemctl'
    alias ssc='sudo systemctl'
    alias scs='systemctl status'
fi

if hash sshfs 2>&-; then
    mount-ssh() {
        sshfs -o reconnect $@
    }

    umount-ssh() {
        if hash fusermount 2>&-; then
            fusermount -uz $@
        elif hash diskutil 2>&-; then
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

PS1=$'\n'"\[$(printf "\x1b[48;2;163;190;140m")$(printf "\x1b[38;2;43;48;59m")\] \h \[$(printf "\x1b[48;2;79;91;102m")$(printf "\x1b[38;2;167;173;186m")\] \W \[$(printf "\x1b[48;2;52;61;70m")$(printf "\x1b[38;2;167;173;186m")\] \$ \[$(printf "\x1b[0m")\] "
