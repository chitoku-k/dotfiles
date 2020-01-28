bindkey -v
bindkey -r '^D'
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey '^L' clear-screen
bindkey '^F' sudo-command-line
bindkey '^[[3~' delete-char
bindkey '^[[Z' reverse-menu-complete
bindkey -M vicmd -r ':'
bindkey -M viins '^X^N' autosuggest-accept

# Disable START/STOP output control
stty -ixon
