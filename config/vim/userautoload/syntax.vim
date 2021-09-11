" Copied from “How to get group name of highlighting under cursor in vim?”
" See: https://stackoverflow.com/a/37040415
function! SynGroup()
  let l:s = synID(line('.'), col('.'), 1)
  return synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
