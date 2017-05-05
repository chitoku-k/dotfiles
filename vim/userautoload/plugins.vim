function! LightLineHide()
  return expand('%') =~ '^NERD_tree\|term://' || &ft =~ 'qf'
endfunction

function! LightLineMode()
  if LightLineHide() || winwidth(0) < 60
    return ''
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
  if LightLineHide()
    return ''
  endif
  let fname = expand('%:t')
  let readonly = LightLineReadonly() != '' ? LightLineReadonly() . ' ' : ''
  let filename = fname != '' ? fname : '[No Name]'
  return readonly . filename
endfunction

function! LightLineLineinfo()
  if LightLineHide()
    return ''
  endif
  return printf("%3d/%d", line('.'), line('$'))
endfunction

function! LightLineFileformat()
  if LightLineHide()
    return ''
  endif
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  if LightLineHide()
    return ''
  endif
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  if LightLineHide()
    return ''
  endif
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction
