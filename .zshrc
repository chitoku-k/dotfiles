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
setopt autopushd                        # cd -> pushd 実行
setopt autocd                           # ディレクトリ名 -> cd
setopt extendedglob                     # 拡張マッチ
KEYTIMEOUT=1                            # 遅延無効化


#-------------------
# 補完
#-------------------
zstyle :compinstall filename '~/.zshrc'
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

function zle-line-init zle-keymap-select {
    case $KEYMAP in
        "main")
            prompt "INSERT" 2
            ;;
        *)
            prompt "NORMAL" 4
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

    PS1="$lf%K{$2}%F{0} $1 %f%k%F{20}%K{19} %m | %1~ $messages%k%f%(!.%K{1} # %k.%K{18} $ %k) "
}

include() {
    if [[ -s $1 ]]; then
        source $1
    fi
}

zle -N zle-line-init
zle -N zle-keymap-select


#-------------------
# キーバインド
#-------------------
bindkey -v                              # vi
bindkey "^?" backward-delete-char       # [BACKSPACE]
bindkey "^W" backward-kill-word         # [Ctrl+W]
bindkey "^H" backward-delete-char       # [Ctrl+H]
bindkey "^U" backward-kill-line         # [Ctrl+U]
bindkey "^[[Z" reverse-menu-complete    # [Shift+Tab]
bindkey "^[OH" beginning-of-line        # [HOME]
bindkey "^[OF" end-of-line              # [END]
bindkey "^[[3~" delete-char             # [DELETE]


#-------------------
# エイリアス
#-------------------
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias chown='chown -v'
alias chmod='chmod -v'
alias chmod-auto='chmod -R a=rX,u+w'
alias oppai='git pull --prune'


#-------------------
# 環境変数
#-------------------
export VISUAL='vim'


#-------------------
# その他
#-------------------
include "$HOME/.zshrc.local"
include "$HOME/.config/base16-shell/scripts/base16-ocean.sh"
