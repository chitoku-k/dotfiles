function! vimrc#lightline#hide(...) abort
  return &ft =~ 'qf' || get(a:, 0, 0) && winwidth(0) < 60
endfunction

function! vimrc#lightline#term() abort
  return expand('%') =~ '^\(!\|term://\)'
endfunction

function! vimrc#lightline#mode() abort
  if vimrc#lightline#hide(1) || lightline#mode() == 'TERMINAL'
    return ''
  endif
  if &filetype == 'ctrlp'
    return 'CtrlP'
  endif
  return lightline#mode()
endfunction

function! vimrc#lightline#modified() abort
  if &ft =~ 'help' || vimrc#lightline#term() || !&modified
    return ''
  endif
  return '+'
endfunction

function! vimrc#lightline#readonly() abort
  if &ft =~ 'help' || !&readonly
    return ''
  endif
  return 'RO'
endfunction

function! vimrc#lightline#filename() abort
  if vimrc#lightline#hide() || lightline#mode() == 'TERMINAL'
    return ''
  endif
  if &ft == 'ctrlp'
    return get(g:lightline, 'ctrlp_item', '')
  endif
  if &ft == 'dirvish'
    return expand('%')
  endif
  let readonly = vimrc#lightline#readonly() != '' ? vimrc#lightline#readonly() . ' ' : ''
  let filename = expand('%:t') != '' ? expand('%:t') : '[No Name]'
  return readonly . filename
endfunction

function! vimrc#lightline#lineinfo() abort
  if vimrc#lightline#hide() || vimrc#lightline#term()
    return ''
  endif
  return printf('%3d/%d', line('.'), line('$'))
endfunction

function! vimrc#lightline#fileformat() abort
  if vimrc#lightline#hide(1) || vimrc#lightline#term()
    return ''
  endif
  return &fileformat
endfunction

function! vimrc#lightline#filetype() abort
  if vimrc#lightline#hide(1) || vimrc#lightline#term()
    return ''
  endif
  return &filetype !=# '' ? &filetype : 'no ft'
endfunction

function! vimrc#lightline#fileencoding() abort
  if vimrc#lightline#hide(1) || vimrc#lightline#term()
    return ''
  endif
  return &fenc !=# '' ? &fenc : &enc
endfunction

function! vimrc#lightline#path() abort
  if vimrc#lightline#hide(1) || vimrc#lightline#term() || &ft =~ '^\(help\|dirvish\|\)$'
    return ''
  endif
  let path = substitute(expand('%:p:h'), expand('$HOME'), '~', '')
  let disp_path = strcharpart(path, strchars(path) - 40)
  if disp_path !=# path
    return '...' . disp_path
  else
    return disp_path
  endif
endfunction

function! vimrc#lightline#charcode() abort
  if vimrc#lightline#hide() || vimrc#lightline#term()
    return ''
  endif

  let hex = strgetchar(getline('.')[col('.') - 1:], 0)
  if hex < 0
    return ''
  endif

  if hex < 0x10000
    return printf('U+%X', hex)
  else
    let hi = (hex - 0x10000) / 0x400 + 0xd800
    let lo = (hex - 0x10000) % 0x400 + 0xdc00
    return printf('U+%X (U+%X U+%X)', hex, hi, lo)
  endif
endfunction
