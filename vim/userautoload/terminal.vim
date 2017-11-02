if !has('nvim')
  finish
endif

augroup termrc
  autocmd!
  autocmd TermOpen * setlocal nonumber
  autocmd TermOpen * setlocal ambiwidth=single
  autocmd TermOpen * startinsert
augroup END
