if [[ -a $ADOTDIR/bundles/nicodebo/base16-fzf/bash/base16-ocean.config ]]; then
    source $ADOTDIR/bundles/nicodebo/base16-fzf/bash/base16-ocean.config
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS  --color=bg:-1"
fi

if [[ $TERM = 'linux' ]]; then
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS  --no-unicode"
fi

if [[ -a $XDG_CONFIG_HOME/fzf/fzf.zsh ]]; then
    fzf_default_completion=fzf-complete-directory
    source $XDG_CONFIG_HOME/fzf/fzf.zsh

    fzf-complete-directory() {
        local trigger tokens lbuf prefix tail

        tokens=(${(z)LBUFFER})
        if [[ ${#tokens} = 0 ]]; then
            zle expand-or-complete
            return
        fi

        trigger=${FZF_COMPLETION_TRIGGER-'**'}
        tail=${LBUFFER:$(( ${#LBUFFER} - ${#trigger} ))}

        if [[ $tail = $trigger ]]; then
            [[ -z $trigger ]] && prefix=${tokens[-1]} || prefix=${tokens[-1]:0:-${#trigger}}
            [[ -z ${tokens[-1]} ]] && lbuf=$LBUFFER || lbuf=${LBUFFER:0:-${#tokens[-1]}}

            __fzf_generic_path_completion "$prefix" "$lbuf" _fzf_compgen_executable '' ' ' ''
            return
        fi

        zle expand-or-complete
    }

    zle -N fzf-complete-directory
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --reverse --height=40% --no-mouse"
fi

if (( $+commands[xxh] )); then
    _fzf_complete_xxh() {
        _fzf_complete_ssh $@
    }
fi

if (( $+commands[fd] )); then
    export FZF_DEFAULT_COMMAND='fd --hidden | sort'

    _fzf_compgen_path() {
        fd --hidden . $@ | sort
    }

    _fzf_compgen_dir() {
        fd --hidden --type d . $@ | sort
    }

    _fzf_compgen_executable() {
        fd --hidden --type d --type x . $@ | sort
    }
else
    case $OSTYPE in
        linux*)
            _fzf_compgen_executable() {
                find -L $@ \
                    -name .git -prune \
                    -o -name .hg -prune \
                    -o -name .svn -prune \
                    -o -type d \
                    -o -executable \
                    -a -not -path $@ -a -not -path . -print \
                    2> /dev/null | sed 's/^\.\///'
            }
            ;;
        darwin*)
            _fzf_compgen_executable() {
                find -L $@ \
                    -name .git -prune \
                    -o -name .hg -prune \
                    -o -name .svn -prune \
                    -o -type d \
                    -a -not -path $@ -a -not -path . -print \
                    -o -type f -perm +111 \
                    -a -not -path $@ -a -not -path . -print \
                    2> /dev/null | sed 's/^\.\///'
            }
            ;;
    esac
fi
