for file in $ZDOTDIR/plugins/*.zsh(D); do
    source $file
done

if [[ -a $ZPLUG_HOME ]]; then
    source $ZPLUG_HOME/init.zsh
    arch=*$(uname -m)*$(uname -s)*

    zplug 'b4b4r07/zsh-vimode-visual', defer:3
    zplug 'BurntSushi/ripgrep', from:gh-r, as:command, rename-to:'rg', use:${(L)arch}
    zplug 'chitoku-k/fzf-zsh-completions'
    zplug 'chitoku-k/zsh-reset-title'
    zplug 'chitoku-k/zsh-togglecursor', defer:1
    zplug 'chitoku-k/zsh-vcs-extended'
    zplug 'chitoku-k/zsh-via-ssh'
    zplug 'hcgraf/zsh-sudo'
    zplug 'himanoa/neovim-terminal-utils', as:command, use:'*'
    zplug 'junegunn/fzf', hook-build:'./install --xdg --no-update-rc'
    zplug 'nicodebo/base16-fzf'
    zplug 'sharkdp/bat', from:gh-r, as:command, rename-to:'bat', use:${(L)arch}
    zplug 'sharkdp/fd', from:gh-r, as:command, rename-to:'fd', use:${(L)arch}
    zplug 'zsh-users/zsh-autosuggestions'
    zplug 'zsh-users/zsh-completions'
    zplug 'zsh-users/zsh-syntax-highlighting', defer:2

    zplug load
    unset arch
fi

for file in $ZDOTDIR/local/*.zsh(D); do
    source $file
done
unset file
