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
    export FZF_DEFAULT_COMMAND='fd --hidden | sort'

    _fzf_compgen_path() {
        fd --hidden . "$@" | sort
    }

    _fzf_compgen_dir() {
        fd --hidden --type d . "$@" | sort
    }
fi
