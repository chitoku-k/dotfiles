if [[ -a $XDG_CACHE_HOME/antigen ]]; then
    source $XDG_CACHE_HOME/antigen/antigen.zsh

    antigen bundle $ZDOTDIR/plugins
    antigen bundle $ZDOTDIR/local
    antigen bundles < $ZDOTDIR/bundles
    antigen apply
fi

fpath=($ZDOTDIR/{plugins,local}/autoload $fpath)
