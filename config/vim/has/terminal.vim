nnoremap <silent> <Space>s :sp \| terminal ++curwin<CR>
nnoremap <silent> <Space>v :vs \| terminal ++curwin<CR>
nnoremap <silent> <Space>t :tabnew \| terminal ++curwin<CR>
tnoremap <C-q> <C-\><C-n>
augroup termrc
  autocmd!
  autocmd TerminalOpen *
        \ if exists('g:loaded_trailing_whitespace_plugin') |
        \   match ExtraWhitespace /^^/ |
        \ endif |
        \ if exists('g:loaded_hexokinase') |
        \   call hexokinase#v2#scraper#off() |
        \ endif
augroup END
