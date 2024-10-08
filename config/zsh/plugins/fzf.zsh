export FZF_DEFAULT_OPTS=

if [[ -a $ADOTDIR/bundles/tinted-theming/base16-fzf-main/bash/base16-ocean.config ]]; then
    source $ADOTDIR/bundles/tinted-theming/base16-fzf-main/bash/base16-ocean.config
    fzf_default_opts+=(${(z)FZF_DEFAULT_OPTS} --color='bg:-1')
fi

if [[ $TERM = 'linux' ]]; then
    fzf_default_opts+=(--no-unicode)
fi

if [[ -a $XDG_CONFIG_HOME/fzf/fzf.zsh ]]; then
    fzf_default_completion=fzf-complete-directory
    source $XDG_CONFIG_HOME/fzf/fzf.zsh

    fzf-complete-directory() {
        local trigger tokens lbuf prefix tail

        tokens=("${(z)LBUFFER[@]}")
        if [[ ${#tokens} = 0 ]]; then
            zle expand-or-complete
            return
        fi

        trigger=${FZF_COMPLETION_TRIGGER-'**'}
        tail=${LBUFFER:$(( ${#LBUFFER} - ${#trigger} ))}

        if [[ $tail = $trigger ]]; then
            [[ -z $trigger ]] && prefix=${tokens[-1]} || prefix=${tokens[-1]:0:-${#trigger}}
            [[ -z ${tokens[-1]} ]] && lbuf=$LBUFFER || lbuf=${LBUFFER:0:-${#tokens[-1]}}

            __fzf_generic_path_completion "$prefix" "$lbuf" _fzf_compgen_executable '' '' ' '
            return
        fi

        zle expand-or-complete
    }

    zle -N fzf-complete-directory
    fzf_default_opts+=(--reverse --height=50% --min-height=25 --preview-window=down --no-mouse --cycle --bind=change:top)
fi

if (( $+commands[xxh] )); then
    _fzf_complete_xxh() {
        _fzf_complete_ssh "$@"
    }
fi

if (( $+commands[fd] )); then
    export FZF_DEFAULT_COMMAND='fd --hidden | sed "s|^./||" | sort'

    _fzf_compgen_path() {
        fd --hidden --follow . "$@" | sed 's|^./||' | sort
    }

    _fzf_compgen_dir() {
        fd --hidden --follow --type d . "$@" | sed 's|^./||' | sort
    }

    _fzf_compgen_executable() {
        fd --hidden --follow --type d --type x . "$@" | sed 's|^./||' | sort
    }
else
    case $OSTYPE in
        linux*)
            _fzf_compgen_executable() {
                find -L "$@" \
                    -name .git -prune \
                    -o -name .hg -prune \
                    -o -name .svn -prune \
                    -o -type d \
                    -o -executable \
                    -a -not -path "$@" -a -not -path . -print \
                    2> /dev/null | sed 's/^\.\///'
            }
            ;;
        darwin*)
            _fzf_compgen_executable() {
                find -L "$@" \
                    -name .git -prune \
                    -o -name .hg -prune \
                    -o -name .svn -prune \
                    -o -type d \
                    -a -not -path "$@" -a -not -path . -print \
                    -o -type f -perm +111 \
                    -a -not -path "$@" -a -not -path . -print \
                    2> /dev/null | sed 's/^\.\///'
            }
            ;;
    esac
fi

zstyle ':fzf-tab:*' fzf-bindings 'tab:toggle'
zstyle ':fzf-tab:*' fzf-flags $fzf_default_opts

export FZF_DEFAULT_OPTS="$fzf_default_opts"
