let s:root_dir = expand('<sfile>:p:h:h')

function! vimrc#plugin_dir(...) abort
  if has('win32')
    return expand('$APPDATA\dein') . join(a:000)
  else
    return expand('$XDG_CACHE_HOME/dein') . join(a:000)
  endif
endfunction

function! vimrc#cache_dir(...) abort
  if has('win32')
    return expand('$APPDATA\vim') . join(a:000)
  else
    return expand('$XDG_CACHE_HOME/vim') . join(a:000)
  endif
endfunction

function! vimrc#config_dir(...) abort
  return s:root_dir . join(a:000)
endfunction

function! vimrc#init() abort
  let dein_dir = vimrc#plugin_dir('/repos/github.com/Shougo/dein.vim')
  let &runtimepath .= ',' . dein_dir

  if isdirectory(dein_dir) && dein#load_state(vimrc#plugin_dir())
    call dein#begin(vimrc#plugin_dir())

    for file in glob(vimrc#config_dir('/plugins/**/*.toml'), 1, 1)
      call dein#load_toml(file)
    endfor

    if dein#check_install()
      call dein#install()
    endif

    call dein#end()
    call dein#save_state()
  endif

  runtime! userautoload/*.vim

  if !has('nvim')
    let &directory = vimrc#cache_dir('/swap')
    let &backupdir = vimrc#cache_dir('/backup')
    let &viminfo = "'1000,n" . vimrc#cache_dir('/viminfo')
  endif
endfunction
