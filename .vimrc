"-------------------
" Plug
"-------------------
if &compatible
  set nocompatible
endif

call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'felixjung/vim-base16-lightline'
Plug 'mattn/emmet-vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'shawncplus/phpcomplete.vim'
Plug 'itchyny/lightline.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tomtom/tcomment_vim'

call plug#end()
filetype plugin indent on


"-------------------
" プラグイン関連
"-------------------
let g:base16colorspace = 256        " base16-vim: 表示色
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 35
if winwidth(0) > 100
  let g:nerdtree_tabs_open_on_console_startup = 1
endif

let g:lightline = {
  \   'colorscheme': 'base16_colors',
  \   'active': {
  \     'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
  \     'right': [ [ 'lineinfo' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \   },
  \   'inactive': {
  \     'left': [ [ 'filename' ] ],
  \     'right': []
  \   },
  \   'tabline': {
  \     'left': [ [ 'tabs' ] ],
  \     'right': []
  \   },
  \   'component_function': {
  \     'mode': 'LightLineMode',
  \     'fugitive': 'LightLineFugitive',
  \     'filename': 'LightLineFilename',
  \     'fileformat': 'LightLineFileformat',
  \     'filetype': 'LightLineFiletype',
  \     'fileencoding': 'LightLineFileencoding'
  \   }
  \ }

function! LightLineMode()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree' ? 'NERDTree' :
    \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineFugitive()
  if expand('%:t') !~? 'NERD_tree' && &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree' ? '' :
    \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
    \ ('' != fname ? fname : '[No Name]') .
    \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction


"-------------------
" 表示
"-------------------
syntax on                           " シンタックスハイライト
set background=dark                 " 背景色
set cursorline                      " カーソル行
set list                            " 不可視文字の表示
set listchars=tab:▸\ ,eol:↲         " 不可視文字の指定
set fillchars+=vert:\               " 区切り文字の指定
set scrolloff=3                     " スクロール行数
colorscheme base16-ocean            " カラースキーム
highlight Normal ctermbg=none       " 標準背景色無効化


"-------------------
" 一般
"-------------------
set encoding=utf-8
set fileencoding=utf-8
set noshowmode                      " モード非表示
set noundofile                      " Undo ファイル無効化
set noswapfile                      " 一時ファイル無効化
set nobackup                        " バックアップ無効化
set nowritebackup                   " 上書き時のバックアップ無効化
set ttimeoutlen=100                 " ESC キー遅延
set ambiwidth=double                " 全角文字の文字幅
set showtabline=2                   " タブ有効化
set number                          " 行番号表示
set title                           " タイトル文字列
set tabstop=4                       " タブ幅
set expandtab                       " ソフトタブ
set shiftwidth=4                    " インデント幅
set smartindent                     " スマートインデント
set virtualedit=block               " 仮想カーソル移動
set whichwrap=b,s,h,l,[,],<,>       " 行頭/行末からのカーソル移動を許可
set backspace=indent,eol,start      " バックスペースを空白/行頭/行末で許可


"-------------------
" 検索
"-------------------
set ignorecase                      " 大文字小文字無視
set smartcase                       " 大文字指定時のみ大文字小文字を区別
set wrapscan                        " 検索終了後に先頭へ戻る
set hlsearch                        " ハイライト表示


"-------------------
" キーバインド
"-------------------
" 対応括弧の補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>

" カーソル移動
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <C-a> ^
nnoremap <C-e> $

" フォーカス移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 検索結果表示位置
nnoremap n nzz
nnoremap N Nzz

" ハイライト非表示
nmap <silent> <ESC><ESC> :nohlsearch<CR>

" 行末まで選択
vnoremap v $h

" 無効化
nnoremap q <Nop>


"-------------------
" autocmd
"-------------------
augroup NERDTree
  autocmd!
  autocmd FileType nerdtree nnoremap <silent><buffer> <Space> :<C-u>call NERDTreeQuickLook()<CR>
augroup END

augroup Comment
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END


"-------------------
" マウス
"-------------------
set mouse=a
