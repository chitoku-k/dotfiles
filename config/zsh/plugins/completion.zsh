zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _complete _approximate
zstyle ':fzf-tab:*' fzf-bindings 'tab:toggle'
