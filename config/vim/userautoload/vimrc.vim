let s:root_dir = expand('<sfile>:p:h:h')

function! vimrc#plugin_dir(...) abort
  if has('win32')
    return expand('$APPDATA\dein') . join(a:000)
  endif
  return expand('$XDG_CACHE_HOME/dein') . join(a:000)
endfunction

function! vimrc#cache_dir(...) abort
  if has('win32')
    return expand('$APPDATA\nvim') . join(a:000)
  endif
  if has('nvim')
    return expand('$XDG_CACHE_HOME/nvim') . join(a:000)
  endif
  return expand('$XDG_CACHE_HOME/vim') . join(a:000)
endfunction

function! vimrc#config_dir(...) abort
  return s:root_dir . join(a:000)
endfunction
