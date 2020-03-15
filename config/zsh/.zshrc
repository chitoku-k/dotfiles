for file in $ZDOTDIR/plugins/*.zsh(D); do
    source $file
done

if [[ -a $XDG_CACHE_HOME/antigen ]]; then
    source $XDG_CACHE_HOME/antigen/antigen.zsh

    antigen bundle 'b4b4r07/zsh-vimode-visual'
    antigen bundle 'chitoku-k/fzf-zsh-completions'
    antigen bundle 'chitoku-k/zsh-reset-title'
    antigen bundle 'chitoku-k/zsh-togglecursor'
    antigen bundle 'chitoku-k/zsh-vcs-extended'
    antigen bundle 'chitoku-k/zsh-via-ssh'
    antigen bundle 'hcgraf/zsh-sudo'
    antigen bundle 'himanoa/neovim-terminal-utils'
    antigen bundle 'junegunn/fzf'
    antigen bundle 'nicodebo/base16-fzf'
    antigen bundle 'zsh-users/zsh-autosuggestions'
    antigen bundle 'zsh-users/zsh-completions'
    antigen bundle 'zsh-users/zsh-syntax-highlighting'
    antigen apply
fi

for file in $ZDOTDIR/local/*.zsh(D); do
    source $file
done
unset file
