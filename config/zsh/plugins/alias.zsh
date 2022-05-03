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

if (( $+commands[godopen] )) && (( $+commands[python3] )) && ([[ -n $NVIM ]] || [[ -n $NVIM_LISTEN_ADDRESS ]]); then
    export VISUAL='godopen --sync'
    export EDITOR=$VISUAL
    alias vim=$VISUAL
fi

if (( $+commands[tmux] )); then
    alias work='tmux attach || [[ -n $TMUX ]] || tmux'
fi

if (( $+commands[docker] )) && (( $+commands[groups] )) && (( $+commands[id] )) && (( $+commands[sudo] )); then
    if [[ $(groups 2> /dev/null) != *docker* ]] && [[ $(id 2> /dev/null) != 0 ]]; then
        alias docker='sudo docker'
    fi
fi

if (( $+commands[kubectl] )); then
    alias -g k8s-secret='-o json | jq -r "if .items then .items else [.] end | map({ name: .metadata.name, data: .data | map_values(@base64d) })[]"'
fi

if (( $+commands[cf] )); then
    alias -g cf-ups='--guid | xargs -I \{\} cf curl /v2/user_provided_service_instances/\{\} | jq ".entity | { name: .name, credentials: .credentials, syslog_drain_url: .syslog_drain_url }"'
fi

if (( $+commands[xxh] )); then
    alias xxh='command xxh ++env=TERM_PROGRAM=$TERM_PROGRAM ++env=VTE_VERSION=$VTE_VERSION'
fi

if (( $+commands[systemctl] )); then
    alias sc='systemctl'
    alias ssc='sudo systemctl'
    alias scs='systemctl status'
fi

if (( $+commands[sshfs] )); then
    alias mount-ssh='sshfs -o reconnect'

    if (( $+commands[fusermount] )); then
        alias umount-ssh='fusermount -uz'
    elif (( $+commands[fusermount3] )); then
        alias umount-ssh='fusermount3 -uz'
    elif (( $+commands[diskutil] )); then
        alias umount-ssh='diskutil unmount force'
    fi
fi

if (( $+commands[defaults] )); then
    alias defaults-write-com.apple.systempreferences-AttentionPrefBundleIDs-0='defaults write com.apple.systempreferences AttentionPrefBundleIDs 0'
fi

case $OSTYPE in
    linux*)
        alias ls='ls --color=auto'
        ;;
    darwin*)
        alias ls='ls -G'
        ;;
esac
