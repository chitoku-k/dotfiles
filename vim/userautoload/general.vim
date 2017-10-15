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


"-------------------
" 表示
"-------------------
filetype plugin indent on
set list
set scrolloff=3
set novisualbell
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
set pumheight=20
set previewheight=5
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
" autocmd
"-------------------
augroup vimrc
  autocmd!
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd InsertLeave * setlocal nopaste
  autocmd CmdwinEnter * nnoremap <CR> <CR>
  autocmd BufReadPost quickfix nnoremap <CR> <CR>
  autocmd QuickFixCmdPost *grep* cwindow
augroup END
