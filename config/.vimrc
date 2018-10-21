if has('win32')
  let &runtimepath .= ',' . expand('$LOCALAPPDATA\vim')
  let &runtimepath .= ',' . expand('$LOCALAPPDATA\vim\after')
else
  let &runtimepath .= ',' . expand('$XDG_CONFIG_HOME/vim')
  let &runtimepath .= ',' . expand('$XDG_CONFIG_HOME/vim/after')
endif

call vimrc#init()
