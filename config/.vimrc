if has('win32')
  let &runtimepath .= ',' . expand('$LOCALAPPDATA\vim')
else
  let &runtimepath .= ',' . expand('$XDG_CONFIG_HOME/vim')
endif

call vimrc#init()
