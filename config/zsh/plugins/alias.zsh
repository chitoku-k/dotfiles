export VISUAL='vim'
export EDITOR=$VISUAL

alias zmv='noglob zmv -vW'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias chown='chown -v'
alias chmod='chmod -v'
alias grep='grep --color=auto'

if (( $+commands[nvim] )); then
    export VISUAL='nvim'
    export EDITOR=$VISUAL
    alias vim=$VISUAL
fi

if (( $+commands[godopen] )) && (( $+commands[python3] )) && [[ -n $NVIM_LISTEN_ADDRESS ]]; then
    export VISUAL='godopen --sync'
    export EDITOR=$VISUAL
    alias vim=$VISUAL
fi

if (( $+commands[tmux] )); then
    work() {
        if tmux attach || [[ -n $TMUX ]]; then
            return
        fi

        tmux $@
    }
fi

if (( $+commands[xxh] )); then
    xxh() {
        command $0 \
            ++env=TERM_PROGRAM=$TERM_PROGRAM \
            ++env=VTE_VERSION=$VTE_VERSION $@
    }
fi

if (( $+commands[systemctl] )); then
    alias sc='systemctl'
    alias ssc='sudo systemctl'
    alias scs='systemctl status'

    _fzf_complete_sc() {
        _fzf_complete_systemctl $@
    }
    _fzf_complete_ssc() {
        _fzf_complete_systemctl $@
    }
    _fzf_complete_scs() {
        _fzf_complete_systemctl $@
    }
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

if (( $+commands[defaults] )); then
    defaults-write-com.apple.systempreferences-AttentionPrefBundleIDs-0() {
        defaults write com.apple.systempreferences AttentionPrefBundleIDs 0
    }
fi

case $OSTYPE in
    linux*)
        alias ls='ls --color=auto'
        ;;
    darwin*)
        alias ls='ls -G'
        ;;
esac
