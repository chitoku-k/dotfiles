nnoremap <silent> <Space>s :sp \| terminal<CR>
nnoremap <silent> <Space>v :vs \| terminal<CR>
nnoremap <silent> <Space>t :tabnew \| terminal<CR>
tnoremap <C-q> <C-\><C-n>
augroup termrc
  autocmd!
  autocmd TermOpen *
        \ setlocal signcolumn=no |
        \ startinsert |
        \ if exists('g:loaded_hexokinase') |
        \   call hexokinase#v2#scraper#off() |
        \ endif
augroup END

if !vimrc#supports_cursor()
  set guicursor=
endif
