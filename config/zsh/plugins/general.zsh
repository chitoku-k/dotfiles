autoload -Uz zmv

SAVEHIST=0
KEYTIMEOUT=1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true

setopt auto_cd
setopt auto_pushd
setopt auto_resume
setopt correct
setopt extended_glob
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt ignore_eof
setopt magic_equal_subst
setopt no_flow_control
setopt no_no_match
setopt print_exit_value
setopt pushd_ignore_dups

catee() {
    cat -- $1 | sudo tee -- $2 > /dev/null
}
