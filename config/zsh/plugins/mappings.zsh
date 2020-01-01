bindkey -v
bindkey -r "^D"
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
bindkey "^L" clear-screen
bindkey "^F" sudo-command-line
bindkey "^[[3~" delete-char
bindkey "^[[Z" reverse-menu-complete
bindkey -M viins "^X^N" autosuggest-accept

if [[ -a "$XDG_CONFIG_HOME/fzf/fzf.zsh" ]]; then
    source "$XDG_CONFIG_HOME/fzf/fzf.zsh"
fi

# Disable START/STOP output control
stty -ixon
