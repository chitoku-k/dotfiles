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
highlight CocErrorSign guifg=#bf616a
highlight CocInfoSign guifg=#8fa1b3
highlight CocWarningSign guifg=#ebcb8b
highlight CocHintSign guifg=#8fa1b3
highlight Comment gui=italic
highlight Conceal guifg=Grey guibg=NONE
highlight CursorIM guifg=NONE guibg=SteelBlue
highlight EndOfBuffer guifg=#363d45 guibg=NONE
highlight SpellBad guifg=#bf616a
highlight link CocHoverRange CursorColumn
highlight link graphqlConstant Operator
highlight link graphqlName Operator
highlight link graphqlVariable Operator
highlight link jsxPunct htmlTag
highlight link jsxCloseString htmlTag
highlight link typescriptEndColons jsObjectSeparator
highlight link typescriptOpSymbols Function
highlight link typescriptOperator Function
highlight link purescriptOperator Delimiter
highlight clear SignColumn
