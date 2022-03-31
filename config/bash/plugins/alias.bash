export VISUAL='vim'
export EDITOR=$VISUAL

alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias chown='chown -v'
alias chmod='chmod -v'
alias grep='grep --color=auto'

if hash nvim 2> /dev/null; then
    export VISUAL='nvim'
    export EDITOR=$VISUAL
    alias vim='nvim'
fi

if hash tmux 2> /dev/null; then
    alias work='tmux attach || [[ -n $TMUX ]] || tmux'
fi

if hash systemctl 2> /dev/null; then
    alias sc='systemctl'
    alias ssc='sudo systemctl'
    alias scs='systemctl status'
fi

if hash sshfs 2> /dev/null; then
    alias mount-ssh='sshfs -o reconnect'

    if (( $+commands[fusermount] )); then
        alias umount-ssh='fusermount -uz'
    elif (( $+commands[fusermount3] )); then
        alias umount-ssh='fusermount3 -uz'
    elif (( $+commands[diskutil] )); then
        alias umount-ssh='diskutil unmount force'
    fi
fi

case "$OSTYPE" in
    linux*)
        alias ls='ls --color=auto'
        ;;
    darwin*)
        alias ls='ls -G'
        ;;
esac
