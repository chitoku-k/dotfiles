autoload -Uz zmv

SAVEHIST=0
KEYTIMEOUT=1
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=()
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=()
ZSH_AUTOSUGGEST_MANUAL_REBIND=true
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main regexp)
ZSH_HIGHLIGHT_REGEXP=('^\s*\*\*$' 'fg=blue')

setopt auto_cd
setopt auto_pushd
setopt auto_resume
setopt combining_chars
setopt correct
setopt extended_glob
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt ignore_eof
setopt magic_equal_subst
setopt no_flow_control
setopt no_nomatch
setopt pushd_ignore_dups
