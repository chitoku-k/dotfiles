" Neovim
if has('nvim')
  nnoremap <silent> <Space>s :sp \| terminal<CR>
  nnoremap <silent> <Space>t :tabnew \| terminal<CR>
  tnoremap <C-q> <C-\><C-n>
  augroup termrc
    autocmd!
    autocmd TermOpen *
          \ setlocal nonumber |
          \ setlocal ambiwidth=single |
          \ startinsert
  augroup END
endif

" Vim with +terminal
if has('terminal')
  nnoremap <silent> <Space>s :sp \| terminal ++curwin<CR>
  nnoremap <silent> <Space>t :tabnew \| terminal ++curwin<CR>
  tmap <C-q><C-q> <C-w>N
  augroup termrc
    autocmd!
    autocmd BufWinEnter *
          \ if &l:buftype ==# 'terminal' |
          \   setlocal nonumber |
          \ endif
  augroup END
endif
