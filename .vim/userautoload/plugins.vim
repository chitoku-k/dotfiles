" base16-vim
let g:base16colorspace = 256

" php.vim
let g:PHP_vintage_case_default_indent = 1

" winresizer
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1

" NERDTree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 35
if winwidth(0) > 100
  let g:nerdtree_tabs_open_on_console_startup = 1
endif

" lightline
let g:lightline = {
  \   'colorscheme': 'base16_ocean',
  \   'active': {
  \     'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
  \     'right': [ [ 'lineinfo' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \   },
  \   'inactive': {
  \     'left': [ [ 'filename' ] ],
  \     'right': []
  \   },
  \   'tabline': {
  \     'left': [ [ 'tabs' ] ],
  \     'right': []
  \   },
  \   'component_function': {
  \     'mode': 'LightLineMode',
  \     'fugitive': 'LightLineFugitive',
  \     'filename': 'LightLineFilename',
  \     'fileformat': 'LightLineFileformat',
  \     'filetype': 'LightLineFiletype',
  \     'fileencoding': 'LightLineFileencoding'
  \   }
  \ }

function! LightLineMode()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree' ? 'NERDTree' :
    \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineFugitive()
  if expand('%:t') !~? 'NERD_tree' && &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree' ? '' :
    \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
    \ ('' != fname ? fname : '[No Name]') .
    \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
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
