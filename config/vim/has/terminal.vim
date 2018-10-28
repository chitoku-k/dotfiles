nnoremap <silent> <Space>s :sp \| terminal ++curwin<CR>
nnoremap <silent> <Space>t :tabnew \| terminal ++curwin<CR>
tnoremap <C-q> <C-\><C-n>
augroup termrc
  autocmd!
  autocmd TerminalOpen * setlocal nonumber
augroup END
