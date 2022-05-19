nnoremap <silent> <Space>s :sp \| terminal<CR>
nnoremap <silent> <Space>v :vs \| terminal<CR>
nnoremap <silent> <Space>t :tabnew \| terminal<CR>
tnoremap <C-q> <C-\><C-n>
augroup termrc
  autocmd!
  autocmd TermOpen *
        \ setlocal nonumber |
        \ setlocal signcolumn=no |
        \ startinsert |
        \ if exists('g:loaded_trailing_whitespace_plugin') |
        \   match ExtraWhitespace /^^/ |
        \ endif |
        \ if exists('g:loaded_hexokinase') |
        \   call hexokinase#v2#scraper#off() |
        \ endif
augroup END
augroup guirc
  autocmd!
  autocmd UIEnter *
        \ if exists('g:GuiLoaded') |
        \   highlight Normal guibg=#3d4049 |
        \ endif |
        \ if exists(':GuiFont') && has('win32') |
        \   execute('GuiFont! Consolas:h10') |
        \ endif |
        \ if exists(':GuiTabline') |
        \   execute('GuiTabline 0') |
        \ endif |
        \ if exists(':GuiPopupmenu') |
        \   execute('GuiPopupmenu 0') |
        \ endif
augroup END

if !vimrc#supports_cursor()
  set guicursor=
endif
