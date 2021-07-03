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

        tmux "$@"
    }
fi

if (( $+commands[docker] )) && (( $+commands[groups] )) && (( $+commands[id] )) && (( $+commands[sudo] )); then
    if [[ $(groups 2> /dev/null) != *docker* ]] && [[ $(id 2> /dev/null) != 0 ]]; then
        alias docker='sudo docker'
    fi
fi

if (( $+commands[kubectl] )); then
    alias -g k8s-secret='-o json | jq -r "if .items then .items else [.] end | map({ name: .metadata.name, data: .data | map_values(@base64d) })[]"'
fi

if (( $+commands[xxh] )); then
    xxh() {
        command $0 \
            ++env=TERM_PROGRAM=$TERM_PROGRAM \
            ++env=VTE_VERSION=$VTE_VERSION "$@"
    }
fi

if (( $+commands[systemctl] )); then
    alias sc='systemctl'
    alias ssc='sudo systemctl'
    alias scs='systemctl status'
fi

if (( $+commands[sshfs] )); then
    mount-ssh() {
        sshfs -o reconnect "$@"
    }

    umount-ssh() {
        if (( $+commands[fusermount] )); then
            fusermount -uz "$@"
        elif (( $+commands[diskutil] )); then
            diskutil unmount force "$@"
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
