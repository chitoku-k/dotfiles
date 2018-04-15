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
