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

function! vimrc#repo_dir(...) abort
  return vimrc#plugin_dir('/repos/github.com') . join(a:000)
endfunction

function! vimrc#supports_cursor() abort
  return expand('$TERM_PROGRAM') =~# 'iTerm\.app\|Apple_Terminal' || expand('$VTE_VERSION') >= 3900
endfunction

function! vimrc#init() abort
  let dein_dir = vimrc#repo_dir('/Shougo/dein.vim')

  if isdirectory(dein_dir)
    let &runtimepath .= ',' . dein_dir

    if dein#load_state(vimrc#plugin_dir())
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
  endif

  runtime! userautoload/*.vim

  for file in glob(vimrc#config_dir('/has/*.vim'), 1, 1)
    if has(get(matchlist(file, '\v.+[/\\](.*)\.vim'), 1))
      exec 'source ' . file
    endif
  endfor

  if !has('nvim')
    let &runtimepath .= ',' . vimrc#config_dir('/after')

    if isdirectory(vimrc#cache_dir())
      let &directory = vimrc#cache_dir('/swap')
      let &backupdir = vimrc#cache_dir('/backup')
      let &viminfo = "'1000,n" . vimrc#cache_dir('/viminfo')
    endif
  endif
endfunction
