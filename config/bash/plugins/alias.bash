export VISUAL='vim'

alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias chown='chown -v'
alias chmod='chmod -v'

if hash nvim 2> /dev/null; then
    export VISUAL='nvim'
    alias vim='nvim'
fi

if hash tmux 2> /dev/null; then
    work() {
        if tmux attach || [[ -n $TMUX ]]; then
            return
        fi

        tmux $@
    }

    ssh() {
        local ret

        if [[ -n $TMUX ]]; then
            tmux rename-window "$0: ${@:-1}"
            command ssh "$@"
            ret=$?

            tmux set-window-option automatic-rename on &> /dev/null
            return $ret
        fi

        command ssh "$@"
    }
fi

if hash systemctl 2> /dev/null; then
    alias sc='systemctl'
    alias ssc='sudo systemctl'
    alias scs='systemctl status'
fi

if hash sshfs 2> /dev/null; then
    mount-ssh() {
        sshfs -o reconnect "$@"
    }

    umount-ssh() {
        if hash fusermount 2> /dev/null; then
            fusermount -uz "$@"
        elif hash diskutil 2> /dev/null; then
            diskutil unmount force "$@"
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
