runtime! userautoload/{colors,general,mappings,netrw,term}.vim
augroup basic
  autocmd!
  autocmd VimEnter * Vexplore
augroup END
