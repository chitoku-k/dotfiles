TRAPINT() {
    _zsh_prompt_redraw 0
    return $(( 128 + $1 ))
}

_zsh_prompt_redraw() {
    if [[ "$1" = "0" ]] || [[ "$WIDGET" =~ finish ]]; then
        _zsh_prompt 8 20 8 20
        return
    fi
    case "$KEYMAP" in
        'main')
            _zsh_prompt 2 0 3 0
            ;;
        *)
            _zsh_prompt 4 0 3 0
            ;;
    esac
}

_zsh_prompt() {
    local hostname="%K{$1}%F{$2} %m %k%f"
    local directory="%K{19}%F{20} %1~ %k%f"
    local vcs_info=''
    local user="%(!.%K{1} # %k.%K{18} $ %k) "

    [[ -n "$vcs_info_msg_0_" ]] && vcs_info+="%K{19}%F{20}| $vcs_info_msg_0_ "
    [[ -n "$vcs_info_msg_1_" ]] && vcs_info+="%K{$3}%F{$4} $vcs_info_msg_1_ %f%k"
    [[ -n "$vcs_info_msg_2_" ]] && vcs_info+="%K{16} $vcs_info_msg_2_ %k"
    [[ -n "$vcs_info" ]] && vcs_info+="%k%f"

    PS1=$'\n'$hostname$directory$vcs_info$user
    zle reset-prompt 2> /dev/null
}

zle -N zle-line-init _zsh_prompt_redraw
zle -N zle-line-finish _zsh_prompt_redraw
zle -N zle-keymap-select _zsh_prompt_redraw
export PS1=''
