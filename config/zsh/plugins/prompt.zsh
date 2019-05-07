_zsh_prompt_redraw() {
    if [[ "$1" = "0" ]] || [[ "$WIDGET" =~ finish ]]; then
        _zsh_prompt '#65737e' '#a7adba' '#65737e' '#a7adba'
        return
    fi
    case "$KEYMAP" in
        'main')
            _zsh_prompt '#a3be8c' '#2b303b' '#ebcb8b' '#2b303b'
            ;;
        *)
            _zsh_prompt '#8fa1b3' '#2b303b' '#ebcb8b' '#2b303b'
            ;;
    esac
}

_zsh_prompt() {
    local hostname="%K{$1}%F{$2} %m %k%f"
    local directory="%K{#4f5b66}%F{#a7adba} %1~ %k%f"
    local vcs_info=''
    local user="%F{#a7adba}%(!.%K{1} # %k.%K{#343d46} $ %k) %f"

    [[ -n "$vcs_info_msg_0_" ]] && vcs_info+="%K{#4f5b66}%F{#a7adba}| $vcs_info_msg_0_ "
    [[ -n "$vcs_info_msg_1_" ]] && vcs_info+="%K{$3}%F{$4} $vcs_info_msg_1_ %f%k"
    [[ -n "$vcs_info" ]] && vcs_info+="%k%f"

    PS1=$'\n'$hostname$directory$vcs_info$user
    zle reset-prompt
}

zle -N zle-line-init _zsh_prompt_redraw
zle -N zle-line-finish _zsh_prompt_redraw
zle -N zle-keymap-select _zsh_prompt_redraw
export PS1=''
