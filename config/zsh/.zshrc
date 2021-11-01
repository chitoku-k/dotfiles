if [[ -a $XDG_DATA_HOME/antigen ]]; then
    source $XDG_DATA_HOME/antigen/antigen.zsh

    antigen bundle $ZDOTDIR/plugins
    antigen bundle $ZDOTDIR/local
    antigen bundles < $ZDOTDIR/bundles
    antigen apply

    # This option is not effective when sourced
    setopt print_exit_value
fi

fpath=($ZDOTDIR/{plugins,local}/autoload $fpath)
