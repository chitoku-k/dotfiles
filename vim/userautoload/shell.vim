if has('unix') && !system('(( $+functions[via-ssh] ))') && v:shell_error == 0
  set grepprg=via-ssh\ grep\ -n\ $*\ /dev/null
endif
