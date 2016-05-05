#-------------------
# バージョン管理
#-------------------
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%b)'
zstyle ':vcs_info:*' actionformats '(%b|%a)'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "+"
zstyle ':vcs_info:git:*' unstagedstr "*"
zstyle ':vcs_info:git:*' formats '(%b%c%u)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%c%u)'

precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}


#-------------------
# 一般
#-------------------
setopt autopushd                # cd -> pushd 実行
setopt autocd                   # ディレクトリ名 -> cd
setopt extendedglob             # 拡張マッチ
unsetopt PROMPT_SP              # 末尾文字非表示


#-------------------
# 補完
#-------------------
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit -u
zstyle ':completion:*:default' menu select=1


#-------------------
# プロンプト
#-------------------
case "$HOST" in
    "iMac.local"    ) color="cyan";;
    "cherry"        ) color="green";;
    *               ) color="magenta";;
esac
export PS1="[%F{$color}%n@%m%f %F{blue}%1~%f%1(v| %F{red}%1v%f|)]%(!.#.$) "
export RPROMPT=""
unset color


#-------------------
# キーバインド
#-------------------
bindkey "^[OH" beginning-of-line    # [HOME]
bindkey "^[OF" end-of-line          # [END]
bindkey "^[[3~" delete-char         # [DELETE]


#-------------------
# エイリアス
#-------------------
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias chmod-auto='chmod -R a=rX,u+w'


#-------------------
# 環境変数
#-------------------
export VISUAL='vim'


#-------------------
# シェル
#-------------------
BASE16_SHELL="$HOME/.config/base16-shell/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL


#-------------------
# ローカル設定
#-------------------
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
