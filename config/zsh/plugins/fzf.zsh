if [[ -a "$XDG_CONFIG_HOME/fzf/fzf.zsh" ]]; then
    source "$XDG_CONFIG_HOME/fzf/fzf.zsh"
fi

if [[ -a "$XDG_CACHE_HOME/zplug/repos/nicodebo/base16-fzf/bash/base16-ocean.config" ]]; then
    source "$XDG_CACHE_HOME/zplug/repos/nicodebo/base16-fzf/bash/base16-ocean.config"
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS  --color=bg:-1"
fi

_fzf_complete_git() {
    if [[ "$@" = 'git branch'* ]] || [[ "$@" = 'git checkout'* ]]; then
        _fzf_complete --ansi "$@" < <(git branch -a --format='%(refname:short) %(contents:subject)' 2> /dev/null | _fzf_complete_git_tabularize)
        return
    fi

    if [[ "$@" = 'git commit'* ]]; then
        _fzf_complete_git-commit "$@"
        return
    fi

    if  [[ "$@" = 'git rebase'* ]] || [[ "$@" = 'git reset'* ]]; then
        _fzf_complete --ansi "$@" < <(git log --color=always --format='%C(yellow)%h%C(reset)   %s' 2> /dev/null)
        return
    fi

    zle ${fzf_default_completion:-expand-or-complete}
}

_fzf_complete_git-commit() {
    _fzf_complete --ansi "$@" < <(git log --color=always --format='%C(yellow)%h%C(reset)   %s' 2> /dev/null)
}

_fzf_complete_git_post() {
    awk '{ print $1 }'
}

_fzf_complete_git-commit_post() {
    awk '{
        $1 = ""
        sub(/^ /, "", $0)
        print "'\''" $0 "'\''"
    }'
}

_fzf_complete_git_tabularize() {
    awk \
        -v yellow="$(tput setaf 3)" \
        -v reset="$(tput sgr0)" '
        {
            refnames[NR] = $1

            if (length($1) > refname_max) {
                refname_max = length($1)
            }

            $1 = ""
            messages[NR] = $0
        }
        END {
            for (i = 1; i < length(refnames); ++i) {
                printf "%s%-" refname_max "s%s%s\n", yellow, refnames[i], reset, messages[i]
            }
        }
    '
}

_fzf_complete_yarn() {
    if [[ "$@" = 'yarn ' ]]; then
        _fzf_complete '' "$@" < <(npm run 2> /dev/null | awk '
            /^  [^ ]/ {
                gsub(/^ */, "")
                command = $0
                getline
                gsub(/^ */, "")
                print command "  " $0
            }')
        return
    fi

    zle ${fzf_default_completion:-expand-or-complete}
}

_fzf_complete_yarn_post() {
    awk '{ print $1 }'
}

_fzf_complete_npm() {
    if [[ "$@" = 'npm run'* ]]; then
        _fzf_complete '' "$@" < <(npm run 2> /dev/null | awk '
            /^  [^ ]/ {
                gsub(/^ */, "")
                command = $0
                getline
                gsub(/^ */, "")
                print command "  " $0
            }')
        return
    fi

    zle ${fzf_default_completion:-expand-or-complete}
}

_fzf_complete_npm_post() {
    awk '{ print $1 }'
}
