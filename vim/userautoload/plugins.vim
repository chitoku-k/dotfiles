function! LightLineMode()
  let fname = expand('%:t')
  if fname =~ 'NERD_tree' || &ft =~ 'qf' || winwidth(0) < 60
    return ''
  endif
  return lightline#mode()
endfunction

function! LightLineFugitive()
  let fname = expand('%:t')
  if fname =~ 'NERD_tree' || !exists('*fugitive#head')
    return ''
  endif
  return fugitive#head()
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
  let fname = expand('%:t')
  if fname =~ 'NERD_tree' || &ft =~ 'qf'
    return ''
  endif
  let readonly = LightLineReadonly() != '' ? LightLineReadonly() . ' ' : ''
  let filename = fname != '' ? fname : '[No Name]'
  let modified = LightLineModified() != '' ? ' ' . LightLineModified() : ''
  return readonly . filename . modified
endfunction

function! LightLineLineinfo()
  let fname = expand('%:t')
  if fname =~ 'NERD_tree'
    return ''
  endif
  return printf("%3d/%d", line('.'), line('$'))
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction
