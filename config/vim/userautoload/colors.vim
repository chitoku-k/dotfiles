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

if has('ttyin') || (!has('patch-8.0.0096') && !has('gui') && !exists('g:nyaovim_version'))
  highlight Normal ctermbg=NONE guibg=NONE
endif
highlight CocErrorSign guifg=#bf616a
highlight CocHintSign guifg=#8fa1b3
highlight CocInfoSign guifg=#8fa1b3
highlight CocSem_namespace gui=italic
highlight CocWarningSign guifg=#ebcb8b
highlight Comment gui=italic
highlight Conceal guifg=Grey guibg=NONE
highlight ConflictMarkerBegin guibg=#2f7366
highlight ConflictMarkerEnd guibg=#2f628e
highlight ConflictMarkerSeparator guibg=#363d45
highlight CursorIM guifg=NONE guibg=#4682b4
highlight DiffAdd guifg=NONE guibg=#334539
highlight DiffChange guifg=NONE guibg=#454133
highlight DiffDelete guifg=NONE guibg=#45333a
highlight DiffText guifg=NONE guibg=#5f5d42
highlight DiffLine guifg=NONE guibg=#8fa1b3
highlight EndOfBuffer guifg=#363d45 guibg=NONE
highlight Flashy ctermbg=0 guibg=#13354a
highlight Identifier ctermfg=7 guifg=#c0c5ce
highlight SignatureMarkerText guifg=#bf616a
highlight SignatureMarkText guifg=#a3be8c
highlight SignColumn ctermbg=18 guibg=#343d46
highlight SpellBad guifg=#bf616a
highlight link CocHoverRange CursorColumn
highlight link CocRustChainingHint Comment
highlight link CocRustTypeHint Comment
highlight link CocSem_comment NONE
highlight link CocSem_keyword NONE
highlight link CocSem_string NONE
highlight link CocSem_variable NONE
highlight link goGenerate Special
highlight link goGenerateVariables PreProc
highlight link goLabel Keyword
highlight link goRepeat Keyword
highlight link goType Keyword
highlight link javaScriptComment Comment
highlight link jsxPunct htmlTag
highlight link jsxCloseString htmlTag
highlight link tomlKey Macro
highlight link typescriptEndColons jsObjectSeparator
highlight link typescriptOpSymbols Function
highlight link typescriptOperator Function
highlight link typescriptReserved Keyword
highlight link phpIdentifier Character
highlight link purescriptOperator Delimiter
highlight link yamlBlockMappingKey Macro
highlight link yamlFlowMappingKey Macro
highlight link yamlPlainScalar String
