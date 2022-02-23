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
highlight CocErrorFloat guifg=#bf616a
highlight CocErrorHighlight guisp=#bf616a gui=undercurl
highlight CocErrorSign guifg=#c0c5ce guibg=#bf616a
highlight CocInfoFloat guifg=#8fa1b3
highlight CocInfoHighlight guisp=#8fa1b3 gui=undercurl
highlight CocInfoSign guifg=#343d46 guibg=#8fa1b3
highlight CocSemNamespace gui=italic
highlight CocWarningFloat guifg=#ebcb8b
highlight CocWarningHighlight guisp=#ebcb8b gui=undercurl
highlight CocWarningSign guifg=#bf616a guibg=#ebcb8b
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
highlight qfError guifg=#bf616a
highlight SignatureMarkerText guifg=#bf616a
highlight SignatureMarkText guifg=#a3be8c
highlight SignColumn ctermbg=18 guibg=#343d46
highlight SpellBad guifg=#bf616a
highlight link CocHintFloat CocInfoFloat
highlight link CocHintHighlight CocInfoHighlight
highlight link CocHintSign NONE
highlight link CocHoverRange CursorColumn
highlight link CocRustChainingHint Comment
highlight link CocRustTypeHint Comment
highlight link CocSemAsyncKeyword Keyword
highlight link CocSemComment NONE
highlight link CocSemConstantVariable Boolean
highlight link CocSemDerive Type
highlight link CocSemKeyword NONE
highlight link CocSemMacro Macro
highlight link CocSemMacroBang Macro
highlight link CocSemNumber NONE
highlight link CocSemString NONE
highlight link CocSemStruct Structure
highlight link CocSemTypeAlias Special
highlight link CocSemReadonlyVariable Boolean
highlight link dockerfileFrom Tag
highlight link goGenerate Special
highlight link goGenerateVariables PreProc
highlight link goLabel Keyword
highlight link goRepeat Keyword
highlight link goType Keyword
highlight link helpHyperTextJump Underlined
highlight link javaScriptComment Comment
highlight link jsxPunct htmlTag
highlight link jsxCloseString htmlTag
highlight link LspCxxHlGroupEnumConstant CocSemEnumMember
highlight link LspCxxHlGroupNamespace CocSemNamespace
highlight link LspCxxHlGroupMemberVariable Normal
highlight link LspCxxHlSymField NONE
highlight link LspCxxHlSymUnknown NONE
highlight link LspCxxHlSymVariable NONE
highlight link tomlKey Macro
highlight link typescriptEndColons jsObjectSeparator
highlight link typescriptOpSymbols Function
highlight link typescriptOperator Function
highlight link typescriptReserved Keyword
highlight link phpIdentifier Character
highlight link phpMethodsVar Function
highlight link phpRepeat Keyword
highlight link purescriptOperator Delimiter
highlight link yamlBlockMappingKey Macro
highlight link yamlFlowMappingKey Macro
highlight link yamlPlainScalar String
