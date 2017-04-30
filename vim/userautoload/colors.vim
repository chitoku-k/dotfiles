syntax on
set background=dark

" 斜体
let &t_ZH = "\e[3m"
let &t_ZR = "\e[23m"

try
  colorscheme base16-ocean
  highlight Normal ctermbg=NONE
  highlight Comment cterm=italic gui=italic
  highlight CursorLineNr term=bold cterm=NONE ctermfg=7 ctermbg=8
  highlight CursorIM guifg=NONE guibg=SteelBlue
  highlight EndOfBuffer ctermfg=19 guifg=bg
  highlight clear CursorLine
catch
  colorscheme desert
endtry