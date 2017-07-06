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
set cindent
set title
set clipboard=unnamedplus,unnamed
set whichwrap=b,s,h,l,[,],<,>
set backspace=indent,eol,start

" タイトル文字列
let &t_ti .= "\e[22;0t"
let &t_te .= "\e[23;0t"


"-------------------
" 表示
"-------------------
set list
set scrolloff=3
set visualbell
set number
set numberwidth=5
set showtabline=2
set laststatus=2
set ambiwidth=double
set nowrap
set lazyredraw
set splitbelow
set shortmess+=cs
set completeopt-=preview
set listchars=tab:▸\ 
set fillchars+=vert:\ 


"-------------------
" 検索
"-------------------
set ignorecase
set smartcase
set wrapscan
set hlsearch


"-------------------
" grep
"-------------------
if has('unix') && !system('(( $+functions[via-ssh] ))') && v:shell_error == 0
  set grepprg=via-ssh\ grep\ -n\ $*\ /dev/null
endif


"-------------------
" autocmd
"-------------------
augroup vimrc
  autocmd!
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd InsertLeave * setlocal nopaste
  autocmd CmdwinEnter * nnoremap <CR> <CR>
  autocmd BufReadPost quickfix nnoremap <CR> <CR>
  autocmd BufNewFile,BufRead *.tag setlocal filetype=html
  autocmd QuickFixCmdPost *grep* cwindow
  autocmd WinLeave,TabLeave * call anzu#clear_search_status()
augroup END
