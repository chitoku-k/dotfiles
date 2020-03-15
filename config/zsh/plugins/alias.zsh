export PATH=$PATH:$XDG_CACHE_HOME/zplug/bin
export VISUAL='vim'

alias zmv='noglob zmv -vW'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias chown='chown -v'
alias chmod='chmod -v'
alias grep='grep --color=auto'

if (( $+commands[nvim] )); then
    export VISUAL='nvim'
    alias vim=$VISUAL
fi

if (( $+commands[godopen] )) && (( $+commands[python3] )) && [[ -n $NVIM_LISTEN_ADDRESS ]]; then
    export VISUAL='godopen --sync'
    alias vim=$VISUAL
fi

if (( $+commands[tmux] )); then
    alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"

    work() {
        if tmux attach || [[ -n $TMUX ]]; then
            return
        fi

        tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf
    }

    ssh() {
        local ret

        if [[ -n $TMUX ]]; then
            tmux rename-window "$0: ${@:-1}"
            command ssh $@
            ret=$?

            tmux set-window-option automatic-rename on &> /dev/null
            return $ret
        fi

        command ssh $@
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

if (( $+commands[defaults] )) {
    defaults-write-com.apple.systempreferences-AttentionPrefBundleIDs-0() {
        defaults write com.apple.systempreferences AttentionPrefBundleIDs 0
    }
}

case $OSTYPE in
    linux*)
        alias ls='ls --color=auto'
        ;;
    darwin*)
        alias ls='ls -G'
        ;;
esac
