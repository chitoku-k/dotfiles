let &l:commentstring = '-- %s'

augroup purescript
  autocmd!
  autocmd OptionSet *
        \ let g:purescript_indent_if = &shiftwidth |
        \ let g:purescript_indent_case = &shiftwidth |
        \ let g:purescript_indent_let = &shiftwidth |
        \ let g:purescript_indent_where = &shiftwidth |
        \ let g:purescript_indent_do = &shiftwidth |
        \ let g:purescript_indent_in = &shiftwidth
augroup END
