syntax on
set background=dark

try
  colorscheme base16-ocean
  highlight Normal ctermbg=NONE
  highlight Comment cterm=italic gui=italic
  highlight Conceal ctermbg=NONE ctermfg=Green guibg=Black guifg=Grey
  highlight CursorLineNr term=bold cterm=NONE ctermfg=7 ctermbg=8
  highlight CursorIM guifg=NONE guibg=SteelBlue
  highlight EndOfBuffer ctermfg=19 guifg=bg
  highlight SpellBad ctermbg=NONE ctermfg=Red cterm=underline
  highlight NeomakeErrorSign ctermfg=Red
  highlight NeomakeWarningSign ctermfg=Yellow
  highlight NeomakeInfoSign ctermfg=Blue
  highlight clear SignColumn
  highlight clear CursorLine
catch
  colorscheme desert
endtry
