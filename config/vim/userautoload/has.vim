for s:file in glob(vimrc#config_dir('/has/*.vim'), 1, 1)
  if has(get(matchlist(s:file, '\v.+[/\\](.*)\.vim'), 1))
    exec 'source ' . s:file
  endif
endfor
