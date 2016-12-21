"-------------------
" 一般
"-------------------
set encoding=utf-8
set fileencodings=utf-8,euc-jp,cp932,sjis
set noshowmode
set noundofile
set noswapfile
set nobackup
set nowritebackup
set ttimeoutlen=100
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set virtualedit=block
set mouse=a
set cindent
set title

" 行頭/行末からのカーソル移動を許可
set whichwrap=b,s,h,l,[,],<,>

" バックスペースを空白/行頭/行末で許可
set backspace=indent,eol,start

" 起動時タイトル文字列保存
let &t_ti .= "\e[22;0t"

" 終了時タイトル文字列復元
let &t_te .= "\e[23;0t"


"-------------------
" 表示
"-------------------
syntax on
set background=dark
set cursorline
set list
set scrolloff=3
set visualbell
set number
set showtabline=2
set ambiwidth=double

" 不可視文字の指定
set listchars=tab:▸\ 

" 区切り文字の指定
set fillchars+=vert:\

try
  colorscheme base16-ocean
  highlight Normal ctermbg=none
catch
  colorscheme desert
endtry


"-------------------
" 検索
"-------------------
set ignorecase
set smartcase
set wrapscan
set hlsearch


"-------------------
" autocmd
"-------------------
augroup Comment
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

augroup Cursor
  autocmd WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

augroup PasteToggle
  autocmd InsertLeave * set nopaste
augroup END

augroup CRFix
  autocmd CmdwinEnter * nnoremap <CR> <CR>
  autocmd BufReadPost quickfix nnoremap <CR> <CR>
augroup END

augroup FileTypes
  autocmd BufNewFile,BufRead *.tag setfiletype riot
augroup END
