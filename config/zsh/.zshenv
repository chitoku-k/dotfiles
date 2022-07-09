export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export KREW_ROOT=$XDG_DATA_HOME/krew
export GOPATH=$XDG_DATA_HOME/go
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export ADOTDIR=$XDG_DATA_HOME/antigen

path=(
    /opt/homebrew/bin(N/-)
    /opt/homebrew/sbin(N/-)
    $path
)
