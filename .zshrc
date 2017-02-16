#-------------------
# バージョン管理
#-------------------
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "+"
zstyle ':vcs_info:git:*' unstagedstr "*"
zstyle ':vcs_info:git:*' formats '%b' '%c%u'
zstyle ':vcs_info:git:*' actionformats '%b' '%c%u' '%a'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked


#-------------------
# 一般
#-------------------
setopt autopushd
setopt autocd
setopt extendedglob
setopt correct
KEYTIMEOUT=1


#-------------------
# 機能
#-------------------
autoload -Uz zmv
alias zmv='noglob zmv -W'


#-------------------
# 補完
#-------------------
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit -u
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


#-------------------
# 関数
#-------------------
precmd() {
    LANG=en_US.UTF-8 vcs_info
}

function zle-line-finish {
    local hostname=$(echo $HOST | cut -d'.' -f1)
    echo -n "\r\e[38;5;20m\e[48;5;8m $hostname \e[m"
}

function zle-line-init zle-keymap-select {
    case $KEYMAP in
        "main")
            prompt 2
            ;;
        *)
            prompt 4
            ;;
    esac
    zle reset-prompt
}

+vi-git-untracked() {
    # vcs_info_msg_1 のみ
    if [[ "$1" != "1" ]]; then
        return 0
    fi
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null; then
        hook_com[unstaged]+='!'
    fi
}

prompt() {
    local messages=''
    local lf=$'\n'

    [[ -n "$vcs_info_msg_0_" ]] && messages+="| $vcs_info_msg_0_ "
    [[ -n "$vcs_info_msg_1_" ]] && messages+="%K{3}%F{0} $vcs_info_msg_1_ %f%k"
    [[ -n "$vcs_info_msg_2_" ]] && messages+="%K{16} $vcs_info_msg_2_ %k"

    PS1="$lf%K{$1}%F{0} %m %k%f%F{20}%K{19} %1~ $messages%k%f%(!.%K{1} # %k.%K{18} $ %k) "
}

include() {
    if [[ -s $1 ]]; then
        source $1
    fi
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select


#-------------------
# キーバインド
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


#-------------------
# エイリアス
#-------------------
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias chown='chown -v'
alias chmod='chmod -v'


#-------------------
# 環境変数
#-------------------
export VISUAL='vim'


#-------------------
# その他
#-------------------
include "$HOME/.zshrc.local"
include "$HOME/.config/base16-shell/scripts/base16-ocean.sh"
include "$HOME/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
