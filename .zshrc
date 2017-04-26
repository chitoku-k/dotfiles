#-------------------
# Modules
#-------------------
autoload -Uz vcs_info
autoload -Uz zmv
autoload -Uz compinit


#-------------------
# Version Control
#-------------------
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "+"
zstyle ':vcs_info:git:*' unstagedstr "*"
zstyle ':vcs_info:git:*' formats '%b' '%c%u'
zstyle ':vcs_info:git:*' actionformats '%b' '%c%u' '%a'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked


#-------------------
# General
#-------------------
setopt autopushd
setopt autocd
setopt extendedglob
setopt correct
setopt auto_resume
setopt magic_equal_subst
setopt nonomatch


#-------------------
# Completion
#-------------------
compinit -u
zstyle :compinstall filename "$HOME/.zshrc"
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


#-------------------
# Functions
#-------------------
precmd() {
    if [[ $(filesystem) =~ 'osxfuse|sshfs|smbfs' ]]; then
        unset vcs_info_msg_0_ vcs_info_msg_1_ vcs_info_msg_2_
    else
        LANG=en_US.UTF-8 vcs_info
    fi
}

TRAPINT() {
    _zsh_prompt_redraw 0
    return $(( 128 + $1 ))
}

+vi-git-untracked() {
    # Only "vcs_info_msg_1"
    if [[ $1 != "1" ]]; then
        return 0
    fi
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null; then
        hook_com[unstaged]+='!'
    fi
}

_zsh_prompt_redraw() {
    # Only callable when zle is active
    if ! zle; then
        return 0
    fi

    if [[ $1 = "0" ]] || [[ $WIDGET =~ finish ]]; then
        _zsh_prompt 8 20 8 20
    else
        case $KEYMAP in
            'main')
                _zsh_prompt 2 0 3 0
                ;;
            *)
                _zsh_prompt 4 0 3 0
                ;;
        esac
    fi
    zle reset-prompt
}

_zsh_prompt() {
    local hostname="%K{$1}%F{$2} %m %k%f"
    local directory="%K{19}%F{20} %1~ %k%f"
    local vcs_info=''
    local user="%(!.%K{1} # %k.%K{18} $ %k) "

    [[ -n $vcs_info_msg_0_ ]] && vcs_info+="%K{19}%F{20}| $vcs_info_msg_0_ "
    [[ -n $vcs_info_msg_1_ ]] && vcs_info+="%K{$3}%F{$4} $vcs_info_msg_1_ %f%k"
    [[ -n $vcs_info_msg_2_ ]] && vcs_info+="%K{16} $vcs_info_msg_2_ %k"
    [[ -n $vcs_info ]] && vcs_info+="%k%f"

    PS1=$'\n'$hostname$directory$vcs_info$user
}

filesystem() {
    case $OSTYPE in
        darwin*)
            mount | grep $(df -P . | cut -d' ' -f1 | tail -n1) | sed -E 's/.*\(|,.*//g'
            ;;
        *)
            stat -f -L -c %T .
            ;;
    esac
}

include() {
    [[ -s $1 ]] && source $1
}

zle -N zle-line-init _zsh_prompt_redraw
zle -N zle-line-finish _zsh_prompt_redraw
zle -N zle-keymap-select _zsh_prompt_redraw


#-------------------
# Keybinds
#-------------------
bindkey -v
bindkey "^W" backward-kill-word
bindkey "^H" backward-delete-char
bindkey "^U" backward-kill-line
bindkey "^H" backward-char
bindkey "^L" vi-forward-char
bindkey "^R" clear-screen

# [BackSpace]
bindkey "^?" backward-delete-char

# [Shift+Tab]
bindkey "^[[Z" reverse-menu-complete

# [HOME]
bindkey "^[OH" beginning-of-line

# [END]
bindkey "^[OF" end-of-line

# [DELETE]
bindkey "^[[3~" delete-char

# [^D]
bindkey -r "^D"
stty eof undef


#-------------------
# Plugins
#-------------------
include "$HOME/.zshrc.local"
include "$HOME/.zplug/init.zsh" && {
    zplug "chriskempson/base16-shell"
    zplug "chitoku-k/zsh-togglecursor"
    zplug "hcgraf/zsh-sudo"
    zplug "zsh-users/zsh-syntax-highlighting", defer:2

    if ! zplug check; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    zplug load
}


#-------------------
# Aliases
#-------------------
alias zmv='noglob zmv -W'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias chown='chown -v'
alias chmod='chmod -v'


#-------------------
# Variables
#-------------------
export VISUAL='vim'
export PS1=
KEYTIMEOUT=1
