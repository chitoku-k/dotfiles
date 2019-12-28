if [[ -a "$XDG_CONFIG_HOME/fzf/fzf.zsh" ]]; then
    source "$XDG_CONFIG_HOME/fzf/fzf.zsh"
fi

if [[ -a "$XDG_CACHE_HOME/zplug/repos/nicodebo/base16-fzf/bash/base16-ocean.config" ]]; then
    source "$XDG_CACHE_HOME/zplug/repos/nicodebo/base16-fzf/bash/base16-ocean.config"
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS  --color=bg:-1"
fi
