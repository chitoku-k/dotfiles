autoload -Uz select-word-style {backward,forward}-word-match
select-word-style shell

zle -N backward-word{,-match}
zle -N forward-word{,-match}

bindkey -v
bindkey -r '^D'
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey '^L' clear-screen
bindkey '^F' sudo-command-line
bindkey '^[[3~' delete-char
bindkey '^[[Z' reverse-menu-complete
bindkey -M vicmd -r ':'
bindkey -M vicmd B backward-word
bindkey -M vicmd W forward-word
bindkey -M viins '^X^N' autosuggest-accept

if zle -l fzf-completion; then
    bindkey '^I' fzf-completion
fi

# Disable START/STOP output control
stty -ixon
