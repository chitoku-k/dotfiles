if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:plugins_dir = has('nvim') ? expand('~/.config/nvim/plugins') :
                                  \ expand('~/.vim/plugins')

  call dein#load_toml(g:plugins_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(g:plugins_dir . '/dein.lazy.toml', {'lazy': 1})

  if dein#check_install()
    call dein#install()
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
runtime! userautoload/*.vim
