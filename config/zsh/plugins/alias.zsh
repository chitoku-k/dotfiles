alias zmv='noglob zmv -vW'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias chown='chown -v'
alias chmod='chmod -v'

if (( $+commands[nvim] )); then
    alias vim='nvim'
fi

if (( $+commands[systemctl] )); then
    alias sc='systemctl'
    alias ssc='sudo systemctl'
    alias scs='systemctl status'
fi
