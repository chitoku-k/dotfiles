if &compatible
  set nocompatible
endif

let s:dein_dir = GetPluginDirectory('/repos/github.com/Shougo/dein.vim')
let &runtimepath .= ',' . s:dein_dir

if !isdirectory(s:dein_dir)
  finish
endif

if dein#load_state(GetPluginDirectory())
  call dein#begin(GetPluginDirectory())

  for s:file in glob(GetConfigDirectory('/plugins/**/*.toml'), 1, 1)
    call dein#load_toml(s:file)
  endfor

  if dein#check_install()
    call dein#install()
  endif

  call dein#end()
  call dein#save_state()
endif

for s:file in glob(GetConfigDirectory('/has/*.vim'), 1, 1)
  if has(get(matchlist(s:file, '\v.+/(.*)\.vim'), 1))
    exec 'source ' . s:file
  endif
endfor
