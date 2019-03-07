nnoremap <silent> <Space>s :sp \| terminal ++curwin<CR>
nnoremap <silent> <Space>t :tabnew \| terminal ++curwin<CR>
tnoremap <C-q> <C-\><C-n>
augroup termrc
  autocmd!
  autocmd TerminalOpen *
        \ setlocal nonumber |
        \ setlocal scrolloff=0 |
        \ if exists('g:loaded_trailing_whitespace_plugin') |
        \   match ExtraWhitespace /^^/ |
        \ endif
augroup END
