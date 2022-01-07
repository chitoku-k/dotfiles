typeset -A ZSH_HIGHLIGHT_REGEXP

if [[ -a $XDG_DATA_HOME/antigen ]]; then
    source $XDG_DATA_HOME/antigen/antigen.zsh

    antigen bundle $ZDOTDIR/plugins
    antigen bundle $ZDOTDIR/local
    antigen bundles < $ZDOTDIR/bundles
    antigen apply
fi

fpath=($ZDOTDIR/{plugins,local}/autoload $fpath)
