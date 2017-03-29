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
    LANG=en_US.UTF-8 vcs_info
}

TRAPINT() {
    zle zle-line-finish
    return $((128 + $1))
}

zle-line-finish() {
    prompt 8 20 8 20
    zle reset-prompt
}

zle-line-init zle-keymap-select() {
    case $KEYMAP in
        'main')
            prompt 2 0 3 0
            ;;
        *)
            prompt 4 0 3 0
            ;;
    esac
    zle reset-prompt
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

prompt() {
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

include() {
    [[ -s $1 ]] && source $1
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select


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


#-------------------
# Others
#-------------------
include "$HOME/.zshrc.local"
include "$HOME/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

BASE16_SHELL="$HOME/.config/base16-shell"
[ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$($BASE16_SHELL/profile_helper.sh)"
