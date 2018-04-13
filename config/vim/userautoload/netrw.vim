let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 15

augroup basic
  autocmd!
  autocmd VimEnter * if !exists('g:loaded_nerdtree_autoload') | Vexplore | endif
augroup END
