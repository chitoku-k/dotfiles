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

_zsh_prompt_gettruecolor() {
    setopt localoptions ksharrays
    local colors=(
        '43;48;59'
        '191;97;106'
        '163;190;140'
        '235;203;139'
        '143;161;179'
        '180;142;173'
        '150;181;180'
        '192;197;206'
        '101;115;126'
        '191;97;106'
        '163;190;140'
        '235;203;139'
        '143;161;179'
        '180;142;173'
        '150;181;180'
        '239;241;245'
        '208;135;112'
        '171;121;103'
        '52;61;70'
        '79;91;102'
        '167;173;186'
        '223;225;232'
    )

    [[ "$1" = 'fg' ]] && printf "\x1b[38;2;"${colors[$2]}m
    [[ "$1" = 'bg' ]] && printf "\x1b[48;2;"${colors[$2]}m
}

_zsh_prompt_getendcolor() {
    printf "\x1b[0m"
}

_zsh_prompt() {
    local hostname=$(_zsh_prompt_gettruecolor bg $1)$(_zsh_prompt_gettruecolor fg $2)' %m '$(_zsh_prompt_getendcolor)
    local directory=$(_zsh_prompt_gettruecolor bg 19)$(_zsh_prompt_gettruecolor fg 20)' %1~ '$(_zsh_prompt_getendcolor)
    local vcs_info=''
    local user=$(_zsh_prompt_gettruecolor fg 20)'%(!.'$(_zsh_prompt_gettruecolor bg 1)' # '$(_zsh_prompt_getendcolor)'.'$(_zsh_prompt_gettruecolor bg 18)' $ '$(_zsh_prompt_getendcolor)') '

    [[ -n "$vcs_info_msg_0_" ]] && vcs_info+=$(_zsh_prompt_gettruecolor bg 19)$(_zsh_prompt_gettruecolor fg 20)"| $vcs_info_msg_0_ "
    [[ -n "$vcs_info_msg_1_" ]] && vcs_info+="| $vcs_info_msg_1_ "
    [[ -n "$vcs_info_msg_2_" ]] && vcs_info+=" $vcs_info_msg_2_ "

    # Shell would not work when configured as follows:
    # Related?: https://stackoverflow.com/questions/5087036/bashrc-break-second-line-entered-in-shell-eats-up-first-line
    # [[ -n "$vcs_info_msg_1_" ]] && vcs_info+=$(_zsh_prompt_gettruecolor bg $3)$(_zsh_prompt_gettruecolor fg $4)" $vcs_info_msg_1_ "
    # [[ -n "$vcs_info_msg_2_" ]] && vcs_info+=$(_zsh_prompt_gettruecolor bg 16)" $vcs_info_msg_2_ "

    PS1=$'\n'$hostname$directory$vcs_info$user
    zle reset-prompt
}

zle -N zle-line-init _zsh_prompt_redraw
zle -N zle-line-finish _zsh_prompt_redraw
zle -N zle-keymap-select _zsh_prompt_redraw
export PS1=''
