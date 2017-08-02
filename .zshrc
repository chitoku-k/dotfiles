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
zstyle ':vcs_info:git:*' untrackedstr "!"
zstyle ':vcs_info:git:*' formats '%b' '%c%u'
zstyle ':vcs_info:git:*' actionformats '%b' '%c%u' '%a'


#-------------------
# General
#-------------------
setopt auto_pushd
setopt auto_cd
setopt extended_glob
setopt correct
setopt auto_resume
setopt magic_equal_subst
setopt no_no_match
setopt ignore_eof
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt pushd_ignore_dups
setopt no_flow_control


#-------------------
# Completion
#-------------------
compinit -u
zstyle :compinstall filename "$HOME/.zshrc"
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _complete _approximate


#-------------------
# Functions
#-------------------
TRAPINT() {
    _zsh_prompt_redraw 0
    return $(( 128 + $1 ))
}

_zsh_prompt_redraw() {
    # Only callable when zle is active
    if ! zle; then
        return 0
    fi

    local keymap="$KEYMAP"
    if [[ "$1" = "0" ]] || [[ "$WIDGET" =~ finish ]]; then
        keymap='finish'
        _zsh_prompt 8 20 8 20
    else
        case "$KEYMAP" in
            'main')
                _zsh_prompt 2 0 3 0
                ;;
            *)
                _zsh_prompt 4 0 3 0
                ;;
        esac
    fi

    if [[ -n "$TMUX" ]]; then
        tmux setenv 'ZSH_KEYMAP_'$(tmux display -p '#D' | tr -d %) "$keymap"
    fi
}

_zsh_prompt() {
    local hostname="%K{$1}%F{$2} %m %k%f"
    local directory="%K{19}%F{20} %1~ %k%f"
    local vcs_info=''
    local user="%(!.%K{1} # %k.%K{18} $ %k) "

    [[ -n "$vcs_info_msg_0_" ]] && vcs_info+="%K{19}%F{20}| $vcs_info_msg_0_ "
    [[ -n "$vcs_info_msg_1_" ]] && vcs_info+="%K{$3}%F{$4} $vcs_info_msg_1_ %f%k"
    [[ -n "$vcs_info_msg_2_" ]] && vcs_info+="%K{16} $vcs_info_msg_2_ %k"
    [[ -n "$vcs_info" ]] && vcs_info+="%k%f"

    PS1=$'\n'$hostname$directory$vcs_info$user
    zle reset-prompt
}

include() {
    [[ -s "$1" ]] && source $1
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
bindkey "^J" up-line-or-history
bindkey "^K" down-line-or-history
bindkey "^L" vi-forward-char
bindkey "^R" clear-screen
bindkey "^F" sudo-command-line
bindkey -r "^D"

# [BackSpace]
bindkey "^?" backward-delete-char

# [Delete]
bindkey "^[[3~" delete-char

# [Shift+Tab]
bindkey "^[[Z" reverse-menu-complete


#-------------------
# Plugins
#-------------------
include "$HOME/.zshrc.local"
include "$HOME/.zplug/init.zsh" && {
    zplug "chriskempson/base16-shell"
    zplug "chitoku-k/zsh-togglecursor"
    zplug "chitoku-k/zsh-nvim-quit"
    zplug "chitoku-k/zsh-vcs-extended"
    zplug "chitoku-k/zsh-via-ssh"
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
alias zmv='noglob zmv -vW'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias chown='chown -v'
alias chmod='chmod -v'


#-------------------
# Neovim
#-------------------
if (( $+commands[nvim] )); then
    alias vim='nvim'
    bindkey -a "^[" _zsh_nvim_quit
fi


#-------------------
# Terminal
#-------------------
if _zsh_togglecursor_supported && [[ -z "$VTE_VERSION" ]]; then
    TERM='screen-256color-bce'
fi


#-------------------
# Variables
#-------------------
export VISUAL='vim'
export PS1=''
KEYTIMEOUT=1
