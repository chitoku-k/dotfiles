nnoremap <silent> <Space>s :sp \| terminal<CR>
nnoremap <silent> <Space>t :tabnew \| terminal<CR>
tnoremap <C-q> <C-\><C-n>
augroup termrc
  autocmd!
  autocmd TermOpen *
        \ setlocal nonumber |
        \ setlocal ambiwidth=single |
        \ setlocal scrolloff=0 |
        \ startinsert
augroup END

if !vimrc#supports_cursor()
  set guicursor=
endif
