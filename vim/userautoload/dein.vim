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

  for s:file in glob(s:plugins_dir . '/**/*.toml', 1, 1)
    call dein#load_toml(s:file)
  endfor

  if dein#check_install()
    call dein#install()
  endif

  call dein#end()
  call dein#save_state()
endif
