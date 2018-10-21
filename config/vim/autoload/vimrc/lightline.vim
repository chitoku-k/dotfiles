function! vimrc#lightline#hide() abort
  return &ft =~ 'qf'
endfunction

function! vimrc#lightline#is_term() abort
  return expand('%') =~ '^term://'
endfunction

function! vimrc#lightline#mode() abort
  if vimrc#lightline#hide() || winwidth(0) < 60 || lightline#mode() == 'TERMINAL'
    return ''
  endif
  let fname = expand('%:t')
  if fname == 'ControlP'
    return 'CtrlP'
  endif
  return lightline#mode()
endfunction

function! vimrc#lightline#modified() abort
  if &ft =~ 'help' || !&modified
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
  let fname = expand('%:t')
  if fname == 'ControlP'
    return exists('g:lightline.ctrlp_item') ? g:lightline.ctrlp_item : ''
  endif
  let readonly = vimrc#lightline#readonly() != '' ? vimrc#lightline#readonly() . ' ' : ''
  let filename = fname != '' ? fname : '[No Name]'
  return readonly . filename
endfunction

function! vimrc#lightline#lineinfo() abort
  if vimrc#lightline#hide() || vimrc#lightline#is_term()
    return ''
  endif
  return printf("%3d/%d", line('.'), line('$'))
endfunction

function! vimrc#lightline#fileformat() abort
  if vimrc#lightline#hide() || vimrc#lightline#is_term()
    return ''
  endif
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! vimrc#lightline#filetype() abort
  if vimrc#lightline#hide() || vimrc#lightline#is_term()
    return ''
  endif
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! vimrc#lightline#fileencoding() abort
  if vimrc#lightline#hide() || vimrc#lightline#is_term()
    return ''
  endif
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! vimrc#lightline#path() abort
  if vimrc#lightline#hide() || vimrc#lightline#is_term() || winwidth(0) < 60 || &ft =~ 'help' || &ft ==# ''
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
  if vimrc#lightline#hide() || vimrc#lightline#is_term()
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
