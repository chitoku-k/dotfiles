"-------------------
" Plug
"-------------------
if &compatible
  set nocompatible
endif

call plug#begin('~/.vim/plugged')

Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/vimfiler'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'mattn/emmet-vim'
Plug 'leafgarland/typescript-vim'

call plug#end()
filetype plugin indent on


"-------------------
" プラグイン関連
"-------------------
let g:base16colorspace=256          " base16-vim: 表示色
let g:vimfiler_safe_mode_by_default=0
let g:vimfiler_ignore_pattern='.git'


"-------------------
" 表示
"-------------------
syntax on                           " シンタックスハイライト
set background=dark                 " 背景色
colorscheme base16-ocean            " カラースキーム
highlight Normal ctermbg=none       " 標準背景色無効化


"-------------------
" 一般
"-------------------
set encoding=utf-8
set fileencoding=utf-8
set noundofile                      " Undo ファイル無効化
set noswapfile                      " 一時ファイル無効化
set nobackup                        " バックアップ無効化
set nowritebackup                   " 上書き時のバックアップ無効化
set ttimeoutlen=100                 " ESC キー遅延
set ambiwidth=double                " 全角文字の文字幅
set showtabline=2                   " タブ有効化
set title                           " タイトル文字列
set tabstop=4                       " タブ幅
set expandtab                       " ソフトタブ
set shiftwidth=4                    " インデント幅
set smartindent                     " スマートインデント
set virtualedit=block               " 仮想カーソル移動
set whichwrap=b,s,h,l,[,],<,>       " 行頭/行末からのカーソル移動を許可
set backspace=indent,eol,start      " バックスペースを空白/行頭/行末で許可
set list                            " 不可視文字の表示
set listchars=tab:▸\ ,eol:↲         " 不可視文字の指定


"-------------------
" 検索
"-------------------
set ignorecase                      " 大文字小文字無視
set smartcase                       " 大文字指定時のみ大文字小文字を区別
set wrapscan                        " 検索終了後に先頭へ戻る
set hlsearch                        " ハイライト表示


"-------------------
" 関数群
"-------------------
function! VimFilerSidebar()
  VimFiler -split -simple -winwidth=40 -no-quit
  set nonumber                      " 行番号非表示
endfunction

function! s:LoadDefault()
  set number                        " 行番号表示
endfunction


"-------------------
" autocmd
"-------------------
augroup VimFiler
  autocmd!
  autocmd BufNew,BufWinEnter * call s:LoadDefault()
  autocmd BufWinEnter * call VimFilerSidebar()
  autocmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') | q | endif
augroup END


"-------------------
" キーバインド
"-------------------
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
nnoremap <Space>f :call VimFilerSidebar()<CR>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap q <Nop>
noremap <C-e> $
nmap <C-a> ^


"-------------------
" マウス
"-------------------
set mouse=a
