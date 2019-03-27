syntax on
set background=dark
set termguicolors

" TODO: NOT WORKING CURRENTLY
" https://github.com/neovim/neovim/issues/7018
" https://github.com/neovim/neovim/issues/9393
" let g:terminal_color_16 = "#d08770"
" let g:terminal_color_17 = "#ab7967"
" let g:terminal_color_18 = "#343d46"
" let g:terminal_color_19 = "#4f5b66"
" let g:terminal_color_20 = "#a7adba"
" let g:terminal_color_21 = "#dfe1e8"

try
  colorscheme base16-ocean
catch
  colorscheme desert
endtry

highlight Normal ctermbg=NONE guibg=NONE
highlight Comment cterm=italic gui=italic
highlight Conceal ctermbg=NONE ctermfg=Green guibg=Black guifg=Grey
highlight CursorLineNr term=bold cterm=NONE ctermfg=7 ctermbg=8
highlight CursorIM guifg=NONE guibg=SteelBlue
highlight EndOfBuffer ctermfg=19 guifg=bg guibg=NONE
highlight SpellBad ctermbg=NONE ctermfg=Red cterm=underline
highlight NeomakeErrorSign ctermfg=Red
highlight NeomakeWarningSign ctermfg=Yellow
highlight NeomakeInfoSign ctermfg=Blue
highlight link jsxPunct htmlTag
highlight link jsxCloseString htmlTag
highlight link typescriptEndColons jsObjectSeparator
highlight link typescriptOpSymbols Function
highlight link typescriptOperator Function
highlight link graphqlConstant Operator
highlight clear SignColumn
highlight clear CursorLine
