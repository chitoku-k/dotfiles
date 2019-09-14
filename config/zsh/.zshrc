for file in $ZDOTDIR/plugins/*.zsh(D); do
    source "$file"
done

if [[ -a "$ZPLUG_HOME" ]]; then
    source "$ZPLUG_HOME/init.zsh"

    zplug "b4b4r07/zsh-vimode-visual", defer:3
    zplug "chitoku-k/zsh-reset-title"
    zplug "chitoku-k/zsh-togglecursor", defer:1
    zplug "chitoku-k/zsh-vcs-extended"
    zplug "chitoku-k/zsh-via-ssh"
    zplug "hcgraf/zsh-sudo"
    zplug "himanoa/neovim-terminal-utils", as:command, use:"*"
    zplug "zsh-users/zsh-autosuggestions"
    zplug "zsh-users/zsh-completions"
    zplug "zsh-users/zsh-syntax-highlighting", defer:2

    zplug load
fi

for file in $ZDOTDIR/local/*.zsh(D); do
    source "$file"
done
unset file
