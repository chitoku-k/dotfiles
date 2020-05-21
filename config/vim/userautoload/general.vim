try
  language en_US.UTF-8
catch
endtry

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,cp932,sjis
set hidden
set noshowmode
set noundofile
set noswapfile
set nowritebackup
set ttimeoutlen=100
set updatetime=300
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set virtualedit=block
set cindent
set title
set titleold=
set clipboard=unnamedplus,unnamed
set whichwrap=
set backspace=
set viminfo=

set list
set novisualbell
set nofoldenable
set number
set numberwidth=5
set showtabline=2
set laststatus=2
set ambiwidth=single
set nowrap
set lazyredraw
set splitbelow
set splitright
set shortmess+=cs
set completeopt-=preview
set pumheight=20
set previewheight=5
set signcolumn=yes
set listchars=tab:▸\ 
set fillchars+=vert:\ 

set ignorecase
set smartcase
set wrapscan
set hlsearch
if exists('&inccommand')
  set inccommand=split
endif

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

augroup vimrc
  autocmd!
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd InsertLeave * setlocal nopaste
  autocmd CmdwinEnter * nnoremap <CR> <CR>
  autocmd BufReadPost quickfix nnoremap <CR> <CR>
  autocmd QuickFixCmdPost *grep* cwindow
augroup END
