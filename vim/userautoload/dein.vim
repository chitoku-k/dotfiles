if &compatible
  set nocompatible
endif

set runtimepath+=~/.vim,~/.vim/after,~/.cache/dein/repos/github.com/Shougo/dein.vim
let s:repo_dir = expand('~/.cache/dein/repos/github.com/Shougo/dein.vim')
let s:dein_dir = expand('~/.cache/dein')
let s:plugins_dir = !has('nvim') ? expand('~/.vim/plugins') :
                  \ !has('win32') ? expand('~/.config/nvim/plugins') :
                  \                 expand('~\AppData\Local\nvim\plugins')

if !isdirectory(s:repo_dir)
  finish
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:plugins_dir . '/dein.toml', {'lazy': 0})

  for s:file in glob(s:plugins_dir . '/lang/*.toml', 1, 1)
    let s:match = matchlist(s:file, '\v/(\w+)\.toml$')
    if empty(s:match)
      continue
    endif
    call dein#load_toml(s:file, {
    \   'lazy': 1,
    \   'on_ft': s:match[1],
    \ })
  endfor

  if dein#check_install()
    call dein#install()
  endif

  call dein#end()
  call dein#save_state()
endif

augroup plugins
  autocmd!
  autocmd WinLeave,TabLeave * call anzu#clear_search_status()
augroup END
