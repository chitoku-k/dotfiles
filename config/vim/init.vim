function! GetPluginDirectory(...)
  if has('win32')
    return expand('$APPDATA\dein') . join(a:000)
  endif
  return expand('$XDG_CACHE_HOME/dein') . join(a:000)
endfunction

function! GetCacheDirectory(...)
  if has('win32')
    return expand('$APPDATA\nvim') . join(a:000)
  endif
  if has('nvim')
    return expand('$XDG_CACHE_HOME/nvim') . join(a:000)
  endif
  return expand('$XDG_CACHE_HOME/vim') . join(a:000)
endfunction

function! GetConfigDirectory(...)
  if has('win32')
    return expand('$LOCALAPPDATA\nvim') . join(a:000)
  endif
  if has('nvim')
    return expand('$XDG_CONFIG_HOME/nvim') . join(a:000)
  endif
  return expand('$XDG_CONFIG_HOME/vim') . join(a:000)
endfunction

if !has('nvim')
  let &runtimepath .= ',' . GetConfigDirectory()
  let &runtimepath .= ',' . GetConfigDirectory('/after')
  let &directory = GetCacheDirectory('/swap')
  let &backupdir = GetCacheDirectory('/backup')
  let &viminfo = "'1000,n" . GetCacheDirectory('/viminfo')
endif
runtime! userautoload/{dein,*}.vim
