if has('win32')
  let &runtimepath .= ',' . expand('$LOCALAPPDATA\vim')
  let &runtimepath .= ',' . expand('$LOCALAPPDATA\vim\after')
else
  let &runtimepath .= ',' . expand('$XDG_CONFIG_HOME/vim')
  let &runtimepath .= ',' . expand('$XDG_CONFIG_HOME/vim/after')
endif

runtime! userautoload/{dein,*}.vim

let &directory = vimrc#cache_dir('/swap')
let &backupdir = vimrc#cache_dir('/backup')
let &viminfo = "'1000,n" . vimrc#cache_dir('/viminfo')
