if [[ -a "$XDG_CONFIG_HOME/fzf/fzf.zsh" ]]; then
    fzf-complete-directory() {
        local trigger tokens lbuf prefix tail

        tokens=(${(z)LBUFFER})
        if [[ "${#tokens}" = 0 ]]; then
            zle expand-or-complete
            return
        fi

        trigger=${FZF_COMPLETION_TRIGGER-'**'}
        tail=${LBUFFER:$(( ${#LBUFFER} - ${#trigger} ))}

        if [[ "$tail" = "$trigger" ]]; then
            [[ -z "$trigger" ]] && prefix=${tokens[-1]} || prefix=${tokens[-1]:0:-${#trigger}}
            [[ -z "${tokens[-1]}" ]] && lbuf=$LBUFFER || lbuf=${LBUFFER:0:-${#tokens[-1]}}

            _fzf_dir_completion "$prefix" "$lbuf"
            return
        fi

        zle expand-or-complete
    }

    zle -N fzf-complete-directory
fi

if [[ -a "$XDG_CACHE_HOME/zplug/repos/nicodebo/base16-fzf/bash/base16-ocean.config" ]]; then
    source "$XDG_CACHE_HOME/zplug/repos/nicodebo/base16-fzf/bash/base16-ocean.config"
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS  --color=bg:-1"
fi

if (( $+commands[rg] )); then
    export FZF_DEFAULT_COMMAND='rg --hidden --files --sort path'

    _fzf_compgen_path() {
        rg --hidden --files --sort path "$@"
    }
fi

if (( $+commands[fd] )); then
    export FZF_DEFAULT_COMMAND='fd --hidden --type f | sort'

    _fzf_compgen_path() {
        fd --hidden --type f . "$@" | sort
    }

    _fzf_compgen_dir() {
        fd --hidden --type d . "$@" | sort
    }
fi
