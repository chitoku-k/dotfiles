"-------------------
" 一般
"-------------------
syntax on
colorscheme desert
set encoding=utf-8
set fileencoding=utf-8
set noswapfile                      " 一時ファイル無効化
set nobackup                        " バックアップ無効化
set nowritebackup                   " 上書き時のバックアップ無効化
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
