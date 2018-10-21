if &compatible
  set nocompatible
endif

let s:dein_dir = vimrc#plugin_dir('/repos/github.com/Shougo/dein.vim')
let &runtimepath .= ',' . s:dein_dir

if !isdirectory(s:dein_dir)
  finish
endif

if dein#load_state(vimrc#plugin_dir())
  call dein#begin(vimrc#plugin_dir())

  for s:file in glob(vimrc#config_dir('/plugins/**/*.toml'), 1, 1)
    call dein#load_toml(s:file)
  endfor

  if dein#check_install()
    call dein#install()
  endif

  call dein#end()
  call dein#save_state()
endif
