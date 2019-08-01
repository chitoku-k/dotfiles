filetype plugin indent on
syntax on
set background=dark
set termguicolors

try
  colorscheme base16-ocean
catch
  colorscheme desert
endtry

if !exists('g:nyaovim_version') && !has('gui')
  highlight Normal ctermbg=NONE guibg=NONE
endif
highlight CocErrorSign ctermfg=1 guifg=#bf616a
highlight CocWarningSign ctermfg=11 guifg=#ebcb8b
highlight CocInfoSign ctermfg=4 guifg=#8fa1b3
highlight Comment cterm=italic gui=italic
highlight Conceal ctermbg=NONE ctermfg=Green guibg=NONE guifg=Grey
highlight CursorLineNr term=bold cterm=NONE ctermfg=7 ctermbg=8
highlight CursorIM guifg=NONE guibg=SteelBlue
highlight EndOfBuffer ctermfg=19 guifg=#363d45 guibg=NONE
highlight SpellBad ctermbg=NONE ctermfg=Red cterm=underline
highlight link jsxPunct htmlTag
highlight link jsxCloseString htmlTag
highlight link typescriptEndColons jsObjectSeparator
highlight link typescriptOpSymbols Function
highlight link typescriptOperator Function
highlight link graphqlConstant Operator
highlight link purescriptOperator Delimiter
highlight clear SignColumn
highlight clear CursorLine
