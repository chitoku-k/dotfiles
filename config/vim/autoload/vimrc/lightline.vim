function! vimrc#lightline#hide(...) abort
  return &filetype ==# 'qf' || get(a:, 0, 0) && winwidth(0) < 60
endfunction

function! vimrc#lightline#term() abort
  return expand('%') =~# '^\(!\|term://\)'
endfunction

function! vimrc#lightline#fugitive() abort
  if expand('%') !~# '^fugitive://'
    return ['', '']
  endif
  let [object, git_dir] = FugitiveParse(expand('%'))
  let [commit; filename] = split(object, ':')
  return [commit, join(filename, ':')]
endfunction

function! vimrc#lightline#mode() abort
  if &filetype ==# 'fzf'
    return 'FZF'
  endif
  if vimrc#lightline#hide(1) || lightline#mode() ==# 'TERMINAL'
    return ''
  endif
  return lightline#mode()
endfunction

function! vimrc#lightline#modified() abort
  if &filetype ==# 'help' || vimrc#lightline#term() || !&modified
    return ''
  endif
  return '+'
endfunction

function! vimrc#lightline#readonly() abort
  if &filetype ==# 'help' || !&readonly
    return ''
  endif
  return 'RO'
endfunction

function! vimrc#lightline#filename() abort
  if vimrc#lightline#hide() || vimrc#lightline#term() || &filetype ==# 'fzf'
    return ''
  endif
  let [commit, filename] = vimrc#lightline#fugitive()
  if commit !=# ''
    return fnamemodify(filename, ':t') . ' | ' . strpart(commit, 0, 8)
  endif
  if &filetype ==# 'dirvish'
    return substitute(expand('%'), expand('$HOME'), '~', '')
  endif
  let readonly = vimrc#lightline#readonly() != '' ? vimrc#lightline#readonly() . ' ' : ''
  let filename = expand('%:t') != '' ? expand('%:t') : '[No Name]'
  return readonly . filename
endfunction

function! vimrc#lightline#path() abort
  if &filetype ==# 'fzf'
    return ''
  endif
  let [commit, filename] = vimrc#lightline#fugitive()
  if commit !=# ''
    return fnamemodify(filename, ':h')
  endif
  return expand('%:h')
endfunction

function! vimrc#lightline#fileformat() abort
  if vimrc#lightline#hide(1) || vimrc#lightline#term() || split(&fileformats, ',')[0] ==# &fileformat
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
  return &fileencoding !=# '' ? &fileencoding : &encoding
endfunction

function! vimrc#lightline#capslock() abort
  if !exists('*CapsLockStatusline') || CapsLockStatusline() ==# ''
    return ''
  endif
  return 'CAPS'
endfunction

function! vimrc#lightline#coc_diagnostic(type, mark) abort
  let info = get(b:, 'coc_diagnostic_info', {})
  return get(info, a:type, 0) == 0 ? '' : a:mark . '  ' . info[a:type]
endfunction

function! vimrc#lightline#coc_error() abort
  return '%{vimrc#lightline#coc_diagnostic("error", "✖")}'
endfunction

function! vimrc#lightline#coc_warning() abort
  return '%{vimrc#lightline#coc_diagnostic("warning", "⚠")}'
endfunction

function! vimrc#lightline#coc_info() abort
  return '%{vimrc#lightline#coc_diagnostic("information", "⚑")}'
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
