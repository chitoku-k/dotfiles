filetype plugin indent on
syntax on
set background=dark
if expand('$TERM') != 'linux'
  set termguicolors
endif

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
highlight DiffAdd guifg=NONE guibg=#334539
highlight DiffChange guifg=NONE guibg=#454133
highlight DiffDelete guifg=NONE guibg=#45333a
highlight DiffText guifg=NONE guibg=#5f5d42
highlight DiffLine guifg=NONE guibg=#8fa1b3
highlight EndOfBuffer guifg=#363d45 guibg=NONE
highlight SignatureMarkerText guifg=#bf616a
highlight SignatureMarkText guifg=#a3be8c
highlight SignColumn ctermbg=18 guibg=#343d46
highlight SpellBad guifg=#bf616a
highlight link CocHoverRange CursorColumn
highlight link graphqlConstant Operator
highlight link graphqlName Operator
highlight link graphqlVariable Operator
highlight link javaScriptComment Comment
highlight link jsxPunct htmlTag
highlight link jsxCloseString htmlTag
highlight link typescriptEndColons jsObjectSeparator
highlight link typescriptOpSymbols Function
highlight link typescriptOperator Function
highlight link typescriptReserved Keyword
highlight link purescriptOperator Delimiter
