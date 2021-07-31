autoload -U is-at-least

typeset -gA _zsh_prompt_format

if is-at-least 5.7; then
    PROMPT_EOL_MARK='%K{#b3666c} %k'

    _zsh_prompt_format[normal-prefix]=$'\n'
    _zsh_prompt_format[normal-hostname]='%K{#8fa1b3}%F{#8fa1b3}[%f%F{#2b303b}%m %k%f'
    _zsh_prompt_format[normal-directory]='%K{#4f5b66}%F{#a7adba} %1~ %k%f'
    _zsh_prompt_format[normal-vcs0]='%%K{#4f5b66}%%F{#a7adba}| %s '
    _zsh_prompt_format[normal-vcs1]='%%K{#ebcb8b}%%F{#2b303b} %s %%f%%k'
    _zsh_prompt_format[normal-user]='%F{#a7adba}%(!.%K{#b3666c} #%F{#b3666c}%f%k.%K{#343d46} $%F{#343d46}]%f%k) '

    _zsh_prompt_format[insert-prefix]=${_zsh_prompt_format[normal-prefix]}
    _zsh_prompt_format[insert-hostname]='%K{#a3be8c}%F{#a3be8c}[%f%F{#2b303b}%m %k%f'
    _zsh_prompt_format[insert-directory]=${_zsh_prompt_format[normal-directory]}
    _zsh_prompt_format[insert-vcs0]=${_zsh_prompt_format[normal-vcs0]}
    _zsh_prompt_format[insert-vcs1]=${_zsh_prompt_format[normal-vcs1]}
    _zsh_prompt_format[insert-user]=${_zsh_prompt_format[normal-user]}

    _zsh_prompt_format[visual-prefix]=${_zsh_prompt_format[normal-prefix]}
    _zsh_prompt_format[visual-hostname]='%K{#b48ead}%F{#b48ead}[%f%F{#343d46}%m %k%f'
    _zsh_prompt_format[visual-directory]=${_zsh_prompt_format[normal-directory]}
    _zsh_prompt_format[visual-vcs0]=${_zsh_prompt_format[normal-vcs0]}
    _zsh_prompt_format[visual-vcs1]=${_zsh_prompt_format[normal-vcs1]}
    _zsh_prompt_format[visual-user]=${_zsh_prompt_format[normal-user]}

    _zsh_prompt_format[finish-prefix]=${_zsh_prompt_format[normal-prefix]}
    _zsh_prompt_format[finish-hostname]='%K{#65737e}%F{#65737e}[%f%F{#a7adba}%m %k%f'
    _zsh_prompt_format[finish-directory]=${_zsh_prompt_format[normal-directory]}
    _zsh_prompt_format[finish-vcs0]=${_zsh_prompt_format[normal-vcs0]}
    _zsh_prompt_format[finish-vcs1]='%%K{#65737e}%%F{#a7adba} %s %%f%%k'
    _zsh_prompt_format[finish-user]=${_zsh_prompt_format[normal-user]}
else
    PROMPT_EOL_MARK=$'%{\x1b[48;2;179;102;108m%} %{\x1b[0m%}'

    _zsh_prompt_format[normal-hostname]=$'%{\x1b[48;2;143;161;179m\x1b[38;2;143;161;179m%}[%{\x1b[38;2;43;48;59m%}%m '
    _zsh_prompt_format[normal-directory]=$'%{\x1b[48;2;79;91;102m\x1b[38;2;167;173;186m%} %1~ '
    _zsh_prompt_format[normal-vcs0]=$'%%{\x1b[48;2;79;91;102m\x1b[38;2;167;173;186m%%}| %s '
    _zsh_prompt_format[normal-vcs1]=$'%%{\x1b[48;2;235;203;139m\x1b[38;2;43;48;59m%%} %s '
    _zsh_prompt_format[normal-user]=$'%{\x1b[38;2;167;173;186m%}%(!.%{\x1b[48;2;179;102;108m%} #%{\x1b[38;2;179;102;108m%}].%{\x1b[48;2;52;61;70m%} $%{\x1b[38;2;52;61;70m%}])%{\x1b[0m%} '

    _zsh_prompt_format[insert-hostname]=$'%{\x1b[48;2;163;190;140m\x1b[38;2;163;190;140m%}[%{\x1b[38;2;43;48;59m%}%m '
    _zsh_prompt_format[insert-directory]=${_zsh_prompt_format[normal-directory]}
    _zsh_prompt_format[insert-vcs0]=${_zsh_prompt_format[normal-vcs0]}
    _zsh_prompt_format[insert-vcs1]=${_zsh_prompt_format[normal-vcs1]}
    _zsh_prompt_format[insert-user]=${_zsh_prompt_format[normal-user]}

    _zsh_prompt_format[visual-hostname]=$'%{\x1b[48;2;180;142;173m\x1b[38;2;180;142;173m%}[%{\x1b[38;2;52;61;70m%}%m '
    _zsh_prompt_format[visual-directory]=${_zsh_prompt_format[normal-directory]}
    _zsh_prompt_format[visual-vcs0]=${_zsh_prompt_format[normal-vcs0]}
    _zsh_prompt_format[visual-vcs1]=${_zsh_prompt_format[normal-vcs1]}
    _zsh_prompt_format[visual-user]=${_zsh_prompt_format[normal-user]}

    _zsh_prompt_format[finish-hostname]=$'%{\x1b[48;2;101;115;126m\x1b[38;2;101;115;126m%}[%{\x1b[38;2;167;173;186m%}%m '
    _zsh_prompt_format[finish-directory]=${_zsh_prompt_format[normal-directory]}
    _zsh_prompt_format[finish-vcs0]=${_zsh_prompt_format[normal-vcs0]}
    _zsh_prompt_format[finish-vcs1]=$'%%{\x1b[48;2;101;115;126m\x1b[38;2;167;173;186m%%} %s %%f%%k'
    _zsh_prompt_format[finish-user]=${_zsh_prompt_format[normal-user]}

    add-zsh-hook precmd () {
        [[ -z $@ ]] && echo >&2
        LANG=en_US.UTF-8 vcs_info
        _zsh_prompt 'insert' 2> /dev/null
    }
fi

_zsh_prompt_redraw() {
    if [[ $1 = '0' ]] || [[ $WIDGET =~ finish ]]; then
        _zsh_prompt 'finish'
        return
    fi

    case $KEYMAP in
        main)
            _zsh_prompt 'insert'
            ;;
        vivis|vivli)
            _zsh_prompt 'visual'
            ;;
        *)
            _zsh_prompt 'normal'
            ;;
    esac
}

_zsh_prompt() {
    local vcs_info
    local prefix=${_zsh_prompt_format[$1-prefix]}
    local hostname=${_zsh_prompt_format[$1-hostname]}
    local directory=${_zsh_prompt_format[$1-directory]}
    local vcs0=${_zsh_prompt_format[$1-vcs0]}
    local vcs1=${_zsh_prompt_format[$1-vcs1]}
    local user=${_zsh_prompt_format[$1-user]}

    [[ -n $vcs_info_msg_0_ ]] && vcs_info+=$(printf "$vcs0" "$vcs_info_msg_0_")
    [[ -n $vcs_info_msg_1_ ]] && vcs_info+=$(printf "$vcs1" "$vcs_info_msg_1_")
    [[ -n $vcs_info ]] && vcs_info+='%k%f'

    PROMPT=$prefix$hostname$directory$vcs_info$user
    zle reset-prompt
}

zle -N zle-line-init _zsh_prompt_redraw
zle -N zle-line-finish _zsh_prompt_redraw
zle -N zle-keymap-select _zsh_prompt_redraw
export PROMPT=''
