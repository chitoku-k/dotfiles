# Vim-style text objects
# See: https://github.com/zsh-users/zsh/commit/d257f0143e69c3724466c4c92f59538d2f3fffd1

if ! bindkey -l viopp &> /dev/null; then
    return
fi

autoload -U select-bracketed
autoload -U select-quoted
autoload -Uz surround

zle -N select-bracketed
zle -N select-quoted
zle -N delete-surround surround
zle -N change-surround surround
zle -N add-surround surround

bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround

for m in visual viopp; do
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $m $c select-bracketed
    done
done

for m in visual viopp; do
    for c in {a,i}{\',\",\`}; do
        bindkey -M $m $c select-quoted
    done
done

unset m
unset c
