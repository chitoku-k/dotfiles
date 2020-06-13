for file in $ZDOTDIR/plugins/*.zsh(D); do
    source $file
done

if [[ -a $XDG_CACHE_HOME/antigen ]]; then
    source $XDG_CACHE_HOME/antigen/antigen.zsh

    antigen bundles < $ZDOTDIR/bundles
    antigen apply
fi

for file in $ZDOTDIR/local/*.zsh(D); do
    source $file
done
unset file
