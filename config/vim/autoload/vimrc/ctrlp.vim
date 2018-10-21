" See: https://github.com/itchyny/lightline.vim/issues/16#issuecomment-23426807
function! vimrc#ctrlp#status_main(focus, byfname, regex, prev, item, next, marked) abort
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_marked = a:marked
  return lightline#statusline(0)
endfunction

function! vimrc#ctrlp#status_prog(str) abort
  return lightline#statusline(0)
endfunction
