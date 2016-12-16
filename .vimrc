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
Plug 'pangloss/vim-javascript'
Plug 'hail2u/vim-css3-syntax'
Plug 'nicklasos/vim-jsx-riot'
Plug 'StanAngeloff/php.vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'itchyny/lightline.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 't9md/vim-textmanip'
Plug 'gko/vim-coloresque'
Plug 'sudo.vim'
Plug 'simeji/winresizer'

call plug#end()
filetype plugin indent on


"-------------------
" プラグイン関連
"-------------------
source $VIMRUNTIME/macros/matchit.vim
let g:base16colorspace = 256                    " base16-vim: 表示色
let g:winresizer_vert_resize = 1                " winresizer: 横方向リサイズ
let g:winresizer_horiz_resize = 1               " winresizer: 縦方向リサイズ
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 35
if winwidth(0) > 100
  let g:nerdtree_tabs_open_on_console_startup = 1
endif

let g:lightline = {
  \   'colorscheme': 'base16_ocean',
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
syntax on                                       " シンタックスハイライト
set background=dark                             " 背景色
set cursorline                                  " カーソル行
set list                                        " 不可視文字の表示
set listchars=tab:▸\                            " 不可視文字の指定
set fillchars+=vert:\                           " 区切り文字の指定
set scrolloff=3                                 " スクロール行数
try
  colorscheme base16-ocean                      " カラースキーム
  highlight Normal ctermbg=none                 " 標準背景色無効化
catch
  colorscheme desert
endtry


"-------------------
" 一般
"-------------------
set encoding=utf-8
set fileencoding=utf-8
set noshowmode                                  " モード非表示
set noundofile                                  " Undo ファイル無効化
set noswapfile                                  " 一時ファイル無効化
set nobackup                                    " バックアップ無効化
set nowritebackup                               " 上書き時のバックアップ無効化
set ttimeoutlen=100                             " ESC キー遅延
set ambiwidth=double                            " 全角文字の文字幅
set showtabline=2                               " タブ有効化
set number                                      " 行番号表示
set expandtab                                   " ソフトタブ
set shiftwidth=4                                " インデント幅
set tabstop=4                                   " タブ幅
set softtabstop=4                               " タブ幅（空白）
set virtualedit=block                           " 仮想カーソル移動
set whichwrap=b,s,h,l,[,],<,>                   " 行頭/行末からのカーソル移動を許可
set backspace=indent,eol,start                  " バックスペースを空白/行頭/行末で許可
set visualbell                                  " うるさい

set title                                       " タイトル文字列
let &t_ti .= "\e[22;0t"                         " 起動時タイトル文字列保存
let &t_te .= "\e[23;0t"                         " 終了時タイトル文字列復元


"-------------------
" インデント
"-------------------
set cindent                                     " C言語
let g:PHP_vintage_case_default_indent = 1       " PHP: case ラベル


"-------------------
" 検索
"-------------------
set ignorecase                                  " 大文字小文字無視
set smartcase                                   " 大文字指定時のみ大文字小文字を区別
set wrapscan                                    " 検索終了後に先頭へ戻る
set hlsearch                                    " ハイライト表示


"-------------------
" キーバインド
"-------------------
" 対応括弧の補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap <> <><Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>

" カーソル移動
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap j gj
vnoremap k gk
vnoremap gj j
vnoremap gk k
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" ウィンドウ移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" テキスト移動
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-l> <Plug>(textmanip-move-right)
nmap <CR> <Plug>(textmanip-blank-below) jj

" インクリメント/デクリメント
nnoremap + <C-a>
nnoremap - <C-x>

" 検索結果表示位置
nnoremap n nzz
nnoremap N Nzz

" ハイライト非表示
nmap <silent> <ESC><ESC> :nohlsearch<CR>

" 行末まで選択
vnoremap v $h

" 無効化
nnoremap q <Nop>
nnoremap <F1> <Nop>

" 貼り付け
set pastetoggle=<C-p>


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

augroup PasteToggle
  autocmd InsertLeave * set nopaste
augroup END

augroup CRFix
  autocmd CmdwinEnter * nnoremap <CR> <CR>
  autocmd BufReadPost quickfix nnoremap <CR> <CR>
augroup END

augroup Languages
  " Indentation
  autocmd FileType vim,ruby,yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
  " PHP
  autocmd FileType php setlocal indentkeys-==?>,=<?
  " Riot
  autocmd BufNewFile,BufRead *.tag setlocal ft=javascript
augroup END


"-------------------
" マウス
"-------------------
set mouse=a
