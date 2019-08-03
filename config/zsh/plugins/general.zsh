autoload -Uz zmv

KEYTIMEOUT=1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true

setopt auto_pushd
setopt auto_cd
setopt extended_glob
setopt correct
setopt auto_resume
setopt magic_equal_subst
setopt no_no_match
setopt ignore_eof
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt pushd_ignore_dups
setopt no_flow_control

catee() {
    cat -- "$1" | sudo tee -- "$2" > /dev/null
}
