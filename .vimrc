"-------------------
" NeoBundle
"-------------------
if &compatible
  set nocompatible
endif

set runtimepath^=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'


"-------------------
" プラグイン
"-------------------
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'leafgarland/typescript-vim'


call neobundle#end()
filetype plugin indent on
NeoBundleCheck


"-------------------
" 表示
"-------------------
syntax on                           " シンタックスハイライト
let base16colorspace=256            " 表示色
colorscheme base16-ocean            " カラースキーム
highlight Normal ctermbg=none       " 背景色無効化


"-------------------
" 一般
"-------------------
set encoding=utf-8
set fileencoding=utf-8
set noundofile                      " Undo ファイル無効化
set noswapfile                      " 一時ファイル無効化
set nobackup                        " バックアップ無効化
set nowritebackup                   " 上書き時のバックアップ無効化
set nowrap                          " 改行禁止
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
" キーバインド
"-------------------
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
autocmd FileType html,php,css,scss imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")


"-------------------
" マウス
"-------------------
set mouse=a
