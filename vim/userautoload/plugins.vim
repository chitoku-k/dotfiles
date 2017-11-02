function! LightLineHide()
  return expand('%') =~ '^NERD_tree' || &ft =~ 'qf'
endfunction

function! LightLineIsTerm()
  return expand('%') =~ '^term://'
endfunction

function! LightLineMode()
  if LightLineHide() || winwidth(0) < 60 || lightline#mode() == 'TERMINAL'
    return ''
  endif
  let fname = expand('%:t')
  if fname == 'ControlP'
    return 'CtrlP'
  endif
  return lightline#mode()
endfunction

function! LightLineModified()
  if &ft =~ 'help' || !&modified
    return ''
  endif
  return '+'
endfunction

function! LightLineReadonly()
  if &ft =~ 'help' || !&readonly
    return ''
  endif
  return 'RO'
endfunction

function! LightLineFilename()
  if LightLineHide() || lightline#mode() == 'TERMINAL'
    return ''
  endif
  let fname = expand('%:t')
  if fname == 'ControlP'
    return exists('g:lightline.ctrlp_item') ? g:lightline.ctrlp_item : ''
  endif
  let readonly = LightLineReadonly() != '' ? LightLineReadonly() . ' ' : ''
  let filename = fname != '' ? fname : '[No Name]'
  return readonly . filename
endfunction

function! LightLineLineinfo()
  if LightLineHide() || LightLineIsTerm()
    return ''
  endif
  return printf("%3d/%d", line('.'), line('$'))
endfunction

function! LightLineFileformat()
  if LightLineHide() || LightLineIsTerm()
    return ''
  endif
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  if LightLineHide() || LightLineIsTerm()
    return ''
  endif
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  if LightLineHide() || LightLineIsTerm()
    return ''
  endif
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLinePath()
  if LightLineHide() || LightLineIsTerm() || winwidth(0) < 60 || &ft =~ 'help' || &ft ==# ''
    return ''
  endif
  let path = substitute(expand('%:p:h'), expand('$HOME'), '~', '')
  if strlen(path) > 40
    return '...' . path[strlen(path) - 40:]
  else
    return path
  endif
endfunction

function! LightLineCharcode()
  if LightLineHide() || LightLineIsTerm()
    return ''
  endif

  redir => code
  silent! ascii
  redir END

  let match = matchlist(code, '\v.+,\s+.+\s(\x+),')
  if empty(match)
    return ''
  endif

  let hex = str2nr(match[1], 16)
  if hex < 0x10000
    return printf("U+%X", hex)
  endif

  let hi = (hex - 0x10000) / 0x400 + 0xd800
  let lo = (hex - 0x10000) % 0x400 + 0xdc00
  return printf("U+%X (U+%X U+%X)", hex, hi, lo)
endfunction

function! CtrlPStatusMain(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_marked = a:marked
  return lightline#statusline(0)
endfunction

function! CtrlPStatusProg(str)
  return lightline#statusline(0)
endfunction
